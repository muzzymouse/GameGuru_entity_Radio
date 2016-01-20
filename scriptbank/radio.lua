--[[
скрипт управляющий включением и выключением радиоприемника.
--]]
state = 0;

function radio_init(e)
end --end radio_init

function radio_main(e)

  if GetPlayerDistance(e) <= 100 then
  --если персонаж находится около радиоприемника
      if state == 0 then
        --состояние радиоприемник выключен
        if GetTimer(e) > 2000 then
          TextCenterOnX(50,50,1,"Press E to radio ON")
          if g_KeyPressE == 1 then
            state = 1;
            PlaySound(e,0)
            StartTimer(e)
          end
        end --end if GetTimer
      else
        --состояние радиоприемник включен
        if GetTimer(e) > 2000 then
          TextCenterOnX(50,50,1,"Press E to radio OFF")
          if g_KeyPressE == 1 then
            state = 0;
            StopSound(e,0);
            StartTimer(e)
          end
        end --end if GetTimer
      end --end if state

  end

  if state == 1 and GetPlayerDistance(e) > 210 then
  --если пользователь отходит от включенного радиоприемника, делаем звук тише
    SetSoundVolume(100 - GetPlayerDistance(e)/70)
  end

end --end radio_main
