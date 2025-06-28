Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665BF225403
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751128897; cv=none; b=rYpHlZ7uqxXzyuKD5stU1aCoIr3KhVEZyDzcwrA3fzGXAFvgVq6fPqCOFPcxRdm3iSc8JSOhbzRSE48XoxWaiPVG88COM/XkhMG6or1cEuqGG5Z7JXd1BNdZCQAU6UHL6LGUzEaqwiC6TXxTBpTAgb03b+foQ7Xpo9ZkM4E/flM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751128897; c=relaxed/simple;
	bh=hMKkO5vEgICL6xpPIdKOu3yTFCaz5qJgJPJrZslfaz4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hcjyur1qGg3zDM4PvOgiouiMUFLEZ4w/1gA3Abvxm+z4qh6ddxg7SxGHPmZaxpcYz3XmPWMp99bFl5YQoSrA+TIkFMbo0Ro0D6z3sQzFPyyrRMQc3dC+dPxXkJhBmZqD/ZWt+HR5MpoLmLVmqFPLqqw1TSxG5HumVcla/n9kG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TlmZpMde; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TlmZpMde"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-453749af004so17140985e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751128893; x=1751733693; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBHKswADexFSg9SZEN9SPPg12lVleXq9YO8e2RnWik4=;
        b=TlmZpMdePhjqL3C9NrIeRvkRH1QxGKR84j33MOy5luTOFXNR6Er20CyBLkVOrBSNt9
         q3wMvwCpWpe2JE3NQbGIKOzJpL2crAoMQYJYMlw965T6gnEmalZgE1CohX8c0+Juppa6
         MOtAA2lhzgH9Zz3Td1wsuWI6694cWNqpnPr/bsMPFybtkCxcPA3PfEvpIjqlmmM65Bzf
         oQ/dHYkMLYZitqzcLMGx7H3zFOUyAw2TtRZQpFm95ZwkzRv4cNn9kGmReGJ5Jqv+tPav
         GLIJFwJ94gLJeQwsAd+PzXk+24uxsbtM9fYrq9GaEFMtLX2z5vK+600ido1/z2J/d/G9
         PVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128893; x=1751733693;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UBHKswADexFSg9SZEN9SPPg12lVleXq9YO8e2RnWik4=;
        b=t0UEgHJ/oBMn65h76qAC/1ABOU1ejBr1SWDy77dq5BsuKfitmWHGWJmZbiaFP57/jg
         tI9dfiA3XdNQAgrIzvoPg85HQbydtyzvjJvBfLA2YvX3VXC6czwojmDGe2WwD+M6a5YS
         Dm7iktSws7ZxP8zMuayRfhxwY1MNrOsd+WcUpGZkLn4F7XnUGsul4bOf3hqiR/o0rxYm
         ds8obtJx29nqK27//DTgVoHp7iOq9mqKMZSZNfYuNPTXNLRYVbSOihWn4h9JGQmOZGB0
         afPyhoiSmfCT8rVczKaVBCgTYjNtMx6p7E+U8Cxvov+KW9woDCmVGUHrUI4YXkwGrgZo
         bFQA==
X-Forwarded-Encrypted: i=1; AJvYcCXYp3y4B7s14oKy8PmSmdp5kqDScjoNOUzndP7w3TeUIzaHnf0Ls7/Rd9vRwU6ttEUYhK5+SnJLQvleQv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wlNW9nXBmD8E6vvWnEDqCMm34RkEuIGdGMAtUvjB8tXrPVMq
	aCJJ2CgnQXJqnTYvCOcX3mymXqywTxc4sbkugu6Wy8/PkHbvYGbhBCh+SHfXytEvc/denjXjysv
	X+nvMbEw=
X-Gm-Gg: ASbGncujWFu6BGAO4WZTjTznjBGoZ2jPHQnpPS/1S6j9ZsodRQO53lyCYz6cP52rdrF
	KDJJgi7nTxA32E/4/V1W8+AqPzW9ARcXj0KuBiqTQruxHvS3ZG4FObwTNjSTtDbl6Q30h9Cimrm
	TeQPKwhzckoJVApFv/bFjbR6+fiMuy8GLU07Ld3lOfzijw4IG1UHUp8+5hZ+up+U3T302ThMBh6
	clLcmS2TbeQ0mDHhGXBe/FyDi/Nix68VKYYXPGAHfZyLIkx4aXckfAxBNV1wuFX0/UiIsTyNwNl
	TixofrwhzqobiRqA0uN+S7Gg6xKfFETwPD15jUc7BbG/XCURUp19XUQExLXlbDS9fhWU
X-Google-Smtp-Source: AGHT+IGPspfbFRIXYwnlGbxO5bANIYVbkEVbx/P2+MhSPTAeDo5nPhfFjin6tT9OiL1cKpIB3cJmig==
X-Received: by 2002:a05:600c:138d:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-45394de29aamr40825505e9.18.1751128892575;
        Sat, 28 Jun 2025 09:41:32 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:e33b:a0ed:df4b:222c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3a96sm113401565e9.35.2025.06.28.09.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 09:41:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Jun 2025 17:41:31 +0100
Message-Id: <DAYBDV1I7HH0.1GG9U3LI5NQ97@linaro.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
 <wcmalvywoginosy5pp7wskgdzjbwbydividmk4dtwguoltiobf@muw5lzkvgu5c>
In-Reply-To: <wcmalvywoginosy5pp7wskgdzjbwbydividmk4dtwguoltiobf@muw5lzkvgu5c>

On Thu Jun 26, 2025 at 7:13 AM BST, Krzysztof Kozlowski wrote:
> On Thu, Jun 26, 2025 at 12:50:29AM +0100, Alexey Klimov wrote:
>> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
>> It has TX and RX soundwire slave devices hence two files
>> are added.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../bindings/sound/qcom,pm4125-codec.yaml          | 147 ++++++++++++++=
+++++++
>>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  86 ++++++++++++
>>  2 files changed, 233 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.y=
aml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..1b6ce8d4397b4c1c048899bd=
2cc4d02318cc46c9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml

[..]

>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - vdd-io-supply
>> +  - vdd-cp-supply
>> +  - vdd-mic-bias-supply
>> +  - vdd-pa-vpos-supply
>> +  - qcom,tx-device
>> +  - qcom,rx-device
>> +  - qcom,micbias1-microvolt
>> +  - qcom,micbias2-microvolt
>> +  - qcom,micbias3-microvolt
>> +  - "#sound-dai-cells"
>
> Keep consistent quotes, either ' or "
>
>> +
>> +additionalProperties: false
>
> This has to unevaluatedProperties

Ok for both points, I'll change it.

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/spmi/spmi.h>
>> +
>> +    spmi {
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <0>;
>> +
>> +        pmic@0 {
>
> pmic {
>
>> +            compatible =3D "qcom,pm8916", "qcom,spmi-pmic";
>
> Drop, you have warnings here.
>
>> +            reg =3D <0x0 SPMI_USID>;
>
> Drop

Ok to points above, I'll remove it.

>> +            #address-cells =3D <1>;
>> +            #size-cells =3D <0>;
>> +
>> +            audio-codec@f000 {
>> +                compatible =3D "qcom,pm4125-codec";
>> +                reg =3D <0xf000>;
>> +                vdd-io-supply =3D <&pm4125_l15>;
>> +                vdd-cp-supply =3D <&pm4125_s4>;
>> +                vdd-pa-vpos-supply =3D <&pm4125_s4>;
>> +                vdd-mic-bias-supply =3D <&pm4125_l22>;
>> +                qcom,micbias1-microvolt =3D <1800000>;
>> +                qcom,micbias2-microvolt =3D <1800000>;
>> +                qcom,micbias3-microvolt =3D <1800000>;
>> +                qcom,rx-device =3D <&pm4125_rx>;
>> +                qcom,tx-device =3D <&pm4125_tx>;
>> +                #sound-dai-cells =3D <1>;
>> +            };
>> +        };
>> +    };
>> +
>> +    /* ... */
>> +
>> +    soundwire@a610000 {
>
> Drop this and next one.

The audio-codec node supposed to have qcom,{rx,tx}-device properties.
If I'll drop it then the example doesn't compile well unless I am missing
something?

For example when I removed soundwire tx node completely and dropped
qcom,tx-device then:

Documentation/devicetree/bindings/sound/qcom,pm4125-codec.example.dtb: audi=
o-codec@f000 (qcom,pm4125-codec): 'qcom,tx-device' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,pm4125-codec.yam=
l#

Or should it be qcom,tx-device =3D <&null_placeholder_something> ?
I can't find any examples.

I guess I can drop example from the other file.

>> +        reg =3D <0x0a610000 0x2000>;
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <0>;
>> +        pm4125_rx: audio-codec@0,4 {
>> +            compatible =3D "sdw20217010c00";
>> +            reg =3D <0 4>;
>> +            qcom,rx-port-mapping =3D <1 3>;
>> +        };
>> +    };
>> +
>> +    soundwire@a740000 {
>> +        reg =3D <0x0a740000 0x2000>;
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <0>;
>> +        pm4125_tx: audio-codec@0,3 {
>> +            compatible =3D "sdw20217010c00";
>> +            reg =3D <0 3>;
>> +            qcom,tx-port-mapping =3D <1 1>;
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yam=
l b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..7241d2ab5dcf4a0d5f25a75a=
cb33a335f93d3b5e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
>> @@ -0,0 +1,86 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,pm4125-sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoundWire Slave devices on PM4125/PM2250 PMIC audio cod=
ec.
>> +
>> +maintainers:
>> +  - Alexey Klimov <alexey.klimov@linaro.org>
>> +
>> +description: |
>
> Drop |

Ack.

>> +  The audio codec IC found on Qualcomm PM4125/PM2250 PMICs.
>> +  It has RX and TX Soundwire slave devices. This bindings is for the
>> +  slave devices.
>
> Last sentence is redundant and makes no sense. Codec has only slave
> devices, so how this can be anything else than for slave devices?

This came from other similar files that describe bindings for child codec n=
odes
of soundwire nodes. For example from qcom,wcd937x-sdw.yaml.
Should this be rephrased to "This bindings is for the soundwire slave devic=
es." ?

>> +
>> +properties:
>> +  compatible:
>> +    const: sdw20217010c00
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,tx-port-mapping:
>> +    description: |
>> +      Specifies static port mapping between device and host tx ports.
>> +      In the order of the device port index which are adc1_port, adc23_=
port,
>> +      dmic03_mbhc_port, dmic46_port.
>> +      Supports maximum 2 tx soundwire ports.
>> +
>> +      PM4125 TX Port 1 (ADC1,2 & DMIC0 & MBHC)    <=3D> SWR0 Port 1
>> +      PM4125 TX Port 2 (ADC1 & DMIC0,1,2 & MBHC)  <=3D> SWR0 Port 2
>> +
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 2
>> +    items:
>> +      enum: [1, 2, 3, 4]
>> +
>> +  qcom,rx-port-mapping:
>> +    description: |
>> +      Specifies static port mapping between device and host rx ports.
>> +      In the order of device port index which are hph_port, clsh_port,
>> +      comp_port, lo_port, dsd port.
>> +      Supports maximum 2 rx soundwire ports.
>> +
>> +      PM4125 RX Port 1 (HPH_L/R)       <=3D=3D>    SWR1 Port 1 (HPH_L/R=
)
>> +      PM4125 RX Port 2 (COMP_L/R)      <=3D=3D>    SWR1 Port 3 (COMP_L/=
R)
>> +
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 2
>> +    maxItems: 2
>> +    items:
>> +      enum: [1, 2, 3, 4, 5]
>> +
>> +required:
>> +  - compatible
>> +  - reg
>
> rx and tx are excluding, so this should be here encoded.

Ok, I think I found a way to change it.

>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    soundwire@a610000 {
>> +        reg =3D <0x0a610000 0x2000>;
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <0>;
>> +        pm4125_rx: codec@0,1 {
>> +            compatible =3D "sdw20217010c00";
>> +            reg =3D <0 1>;
>> +            qcom,rx-port-mapping =3D <1 3>;
>> +        };
>> +    };
>> +
>> +    soundwire@a740000 {
>> +        reg =3D <0x0a740000 0x2000>;
>
> One example is enough, they are the same.

Ok, I'll drop it (see my comment above as well).

Thanks,
Alexey
