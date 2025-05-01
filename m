Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AADF26C389
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082159; cv=none; b=hYQhq/qKGG0jPehHJ57/o44tjsy6ZVQA0RCZT+nh7Xy8v42bp1YECEUHNNCLWnfdyHVp2DjORPRnzjyWhf3Xxrbi80r8jlVPuKrwqSrQiSHoLrbckSSO5SnCrhX8d6EvPIvkZ/rxfCh90ArpDuWYzWhEvCcVv85WUD733wbNGVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082159; c=relaxed/simple;
	bh=116cbfgSezwsafks+V57dwlIk5wKMliQXk8+AlFgvVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EFRymvt51iTh5j+oYcaH9Ma/tKJb5PoUY0nNtuYMpyswrSwLcsY+gClaYWlkoGxgbl2OQG1SKoh0umA/28x4+Z5fJ1ZH+ThbopLTDsl35hvbmKtFFrxp4uZ8z7FIRgOvCFHe5jYypk5hMc7G8Ba+tE3hudhTzBw+8uw2Wm8VWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HFDcAJtV; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HFDcAJtV"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac25d2b2354so97603566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082154; x=1746686954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICmVPwMjmOyli7RFKP/N7pH8Fgah0F5XlIiAvT0GKe8=;
        b=HFDcAJtVf82bLkYnIFrvVYU1G3hK7DVDMD91FZOijkiHBSMYr/idJFBOCU18Rgpaqx
         uBnMJnFSM1XOa7/jcBoi3ukZXvfYOPssGVWgqjutnBIn/UvNcx4SZaGx1d/JREzGDB0j
         egtT//RENKPa+MHqq8LAa2nGl8ETbel45D/t3UNIqYr2Ty1I3eiSEYIJZY+XYNySgCdl
         hYnP5cBbCeELCX7jdEWcaMplq2Dli84AIeXrFCrlVznIQ8SJV8Ter9Kb8mNGhR7jzYuy
         q3bkoVwJEobCL795ouZFPVi0FejRfLUWPweyFIbOrq4+vMc85RvUd9jYcn+d592SS96G
         ZtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082154; x=1746686954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICmVPwMjmOyli7RFKP/N7pH8Fgah0F5XlIiAvT0GKe8=;
        b=t36MWOM5qCLTJ+LQoJ47OFcn6ozbsUfC/ElvKvaXKZMW3TqP6EYiApD9LQMVH0u13N
         EiKkovqnYh2JWyZL5ZCbMw2AqQ+6lYr8qyiX2/YoTqo46XewZOn8yYHfVF/73F/C/YTX
         29lk8UtG3yRmBocDHgSA2Ik/TXMVxlqYrjFr8WkR7LV10WVAmVcZb+wbzyFKrW4426XO
         7YCEtyQLnSMpwd6/XHIxumr77AO2TQjHSnWvQWtJssSzxKOqX8TZW4aMHbmQx1v94tdv
         Tqzh7+vr0CFFuY+Ab4yNDlZD8y7l1V5gCi/i87hbtzXACjAIbFP3KZ1J3ZDqwESIBzD7
         0Jxw==
X-Forwarded-Encrypted: i=1; AJvYcCWPiN3VqYAww8c3xKJZAKUZn5nSNrOA6ZGC1gKilXSH21kVnLBGPzgD8HS6ib/LJX8Zn0ESokOAjlO4vWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhO7w6dgtX4sVvahSg18LsaYbHe9RdESk650tTAW5JQcVu+Y18
	7p36SiGzKAgSm8bPCh2g7doxrTAoBpdGRupYBoge9aRZSQDelm48JflwykF3Ebk=
X-Gm-Gg: ASbGnctelUbqIgG8n/lT3MbdFhwBr3DJur4orwmy5ynJHKzEz6FEckTxnminJlqj/4+
	LWArbhOZeLbwYaL7Upha+Fk/3jl3U0AvhFVZv93Z5DaLwqi6wLc8tJNMn3tHCn1F2XjvwJcckOY
	Ci733ASLZ/2+vjP0dAL74YgLuKWxfo6IuJcgOZNdkgvY0htbXR+0OHyzyqHMWrFoLS0cfeXS0qV
	y/Cchc+X6hEAWzg+xyn3ffxNO7CNznGH35v6dCD5yspEM3qp+2cCJpA952B9gAltXphsDdWX39d
	8bRrpfrdL/BFkkEvEdDLMV2JQNjRzChHVajeAPljPmq7NW/eJpRV1WInPhNHH9/T6Z9qKG5njB0
	P1Js=
X-Google-Smtp-Source: AGHT+IFecEcz1pbl0bNby1akbXk/OS9BB4XW+tEKuivEZ9a3ze3eHfwybQTHoaKz7WPzovMAVqwFdA==
X-Received: by 2002:a17:907:7daa:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-acefbfe36a4mr110480866b.37.1746082153725;
        Wed, 30 Apr 2025 23:49:13 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
Date: Thu, 01 May 2025 08:48:46 +0200
Message-Id: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4ZE2gC/4WQvW7EIBCEX8WizkbAgv+qvEd0BYYlRoqND2wr0
 cnvHuwrki7ljDQzn+bBMqVAmfXVgyXaQw5xLkK+VMyOZv4gCK5oJrnUXEkNflGw5QHM5kKE6P1
 nNA5Iu8YPWjvZIivZJZEPX1fv++2pE923Ur8+zd/2MnZ2oxSQpxo1B7MkENojNaRIW9Pvgv3lu
 RKKt7wrNBrcAjlus4MBm7r1yEU3uH6/OAaTCWycprD2FXbouNXKGkKBonFkTMcVoiyud53Sqli
 DZSfxGPIa0/d1TNk/kf/5YBfAwXfc60bUWJN68yakZYwzvRYEdjuO4wfPcLnJcAEAAA==
X-Change-ID: 20250425-fp4-usb-audio-offload-e5d7fb55d283
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Since the series for the USB sound offloading driver was finally merged,
we can add the sm6350 dts and enable it on Fairphone 4.

A few devicetree binding bits have also been missing in that series, so
there's some extra patches for the basics in this series.

Depends on:
- For qcom,sm8250.yaml & sm8250.c:
  https://lore.kernel.org/linux-arm-msm/20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com/T/
- For dts:
  https://lore.kernel.org/linux-arm-msm/20250321-sm6350-apr-v1-1-7805ce7b4dcf@fairphone.com/

Devicetree patches go through qcom

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Move num-hc-interrupters prop to sm6350.dtsi (Konrad)
- Sort cpu & codec nodes correctly (Konrad)
- Remove usb-soc-be prop as it's no longer needed (Wesley)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com

---
Luca Weiss (5):
      ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
      ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
      ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
      arm64: dts: qcom: sm6350: Add q6usbdai node
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload support

 .../devicetree/bindings/sound/qcom,q6afe.yaml      | 13 ++++++++
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 11 +++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 36 ++++++++++++++++++++++
 sound/soc/qcom/sm8250.c                            |  1 +
 5 files changed, 62 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250425-fp4-usb-audio-offload-e5d7fb55d283
prerequisite-change-id: 20250321-sm6350-apr-15f3e7e4e5ca:v1
prerequisite-patch-id: 69859554c94de52068406dab0d2869ca26072c78
prerequisite-change-id: 20240809-fp5-dp-sound-b3768f3019bd:v3
prerequisite-patch-id: 2d8997a2be02cfddf3a054c79e7eb308a6d06710
prerequisite-patch-id: 1b7c8f00ab50ae71c0221868578b9c1dfe939e4d
prerequisite-patch-id: 4fd0673c4d35c1fefce63ec5785ff5ea67cc3d3a
prerequisite-patch-id: f5ec3a893de19900f62dc691d83986f1104914b0
prerequisite-patch-id: fce7573c39e768f7a09c002064b6159b8e91161a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

