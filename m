Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B42356A6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407786; cv=none; b=YaSdCwy0RKerH5ak8Kycd6186kXSgZaItWNDV7RxqLonC94OQs+buPLS5JjYTREKHN5WpsOUsncBK1F67aHSz2vFJbTJwxTPXwdyPAfEZ+HxF5VphygIhit4Y7yw6XEx8u3kCx8i6745XJhxU1OmexayImTetuPHqmNeefosFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407786; c=relaxed/simple;
	bh=7tSh5+2krdqnWuUERcbn/3lYdwwhhze2giXAcsvhp9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uO0NRnphBQvu/BfSzTnY6vJuzRfr3TpshjXhZxcBO11ECY+TaMoy5zCaDoSVgwUkYEoMBM996GQqJB28nkVU/xY+msxMl9zPu0DBDvhNy0clYb+QskLnP3UoPnTceN4oYJKiQmYtVUfyhwSITAlZEGo5dDwJRRTlBk0LINGL40A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhWuVTod; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhWuVTod"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45362b7adc9so5702295e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750407782; x=1751012582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsEGtYKUN+w5ozSR1va5NJMUtfwswEKGiufzaQb3bTo=;
        b=rhWuVTodnrbFlLRwI/B+UaXkswcqB9VxoRoRBm4jks3X2YwJKqlbCvCttFvqeRuXRc
         MXhA2Pdm/69zEe2icjNkFdfJ5wmI5fu1OyGV+QzMRKIv9+CsFNx0gaxiYapXkOu6nVnr
         PmBQRK8wmAlwPajlr9/sDt+gakLRUJ0LZFEsF+QyORAUDkTywGKlKnW2MwWhIoyLLPZK
         /ksYT4A8zcFk0ouqOGmqvvQG27hSwX6naD7oIe1tnYnBAF/L+jthOgOtFWxMoQKXWUH+
         uZ4quyP4LSXR6DtLLE+YU1BbTSIkmIgamDMSklIiYBz6kCGIRADY/s5iTusjigBDKRv2
         U/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750407782; x=1751012582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsEGtYKUN+w5ozSR1va5NJMUtfwswEKGiufzaQb3bTo=;
        b=qmaU+Ht4WhS1398oDj8qhC0oMWt8IGRs/fQUTTvWHVaMGfe/iAp3nZ3iFUOeDvGapX
         DuGjAlzJHCbszZcNQjF3dYYur/iJcLPR2fqVUL7H0kBLnvC+U/ISrqCMY8daDBESK5/J
         h7qm8WiwrVC9PiMBiQokRR43E1hkm+46Mc2BBAKSBceT96AeDqQCejiImMqvRSTHlaNa
         9oUBQWSEb5GEkyEmI+UCndCgNwomuug7OZiLSuQ1hdaIrgKyf/phN1Z4P8sTvn0aUWuV
         Y7QQFJiesEXITSGieBwspd1g6y5cQZnxJUxu6HNPGtVG8DLGMWzsSKBBfjcYZS4ZHWFJ
         ECqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK9DLilQyYS84lrz4Pb17dqbGlow0eo3X55GJrc9UKRdKoecz81XeO9k/DfjYhIH1Q68Gklm8a7/1MyRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWerSfmSx2KWA+7YYQyAVtcfDGy3z+zM6DBv9jySPrcM2hlTYd
	vOp4PNRmMzyUwx/JSTXnwXxfrWwFzMUTApdnup1piW7gvsqGxKXn5iBtokjQfOwR0ec=
X-Gm-Gg: ASbGnctoiU9Nj4dnFT7iK9O8rMKO1YKgjN59/ISlKbSyWIOJM1/UAyvN0e7uxcIvkcO
	MN25ctXYUIpzWKtYPyeMA92ZwKWGQOIvpM1eEH0C6Zgi060jzHJMnHV8nAe/L2UhpaULIRxJ2az
	mv3nilxKA0BHgovB37avX32RnuS5h3GRFFGK09k9/6x/pYl7+r+H3miZiZLgfmd2XrQzR1vL5Gm
	4Thp69ZwTyVTLps+0knjcFlwqSy9eZUqn5ovQbGrZwHWtYPf4aP7AwdjJcMa7p5q8Y5MOVORIpi
	Jb56WxPUjM4Qkf0X445MN9OZc+9KUG8HPQP0EWxkTf8+MkFOciyWjbVWpLmpEDl16MDdA3QJLgZ
	sbqYL78COwjRIzGSuL23BZ/syZX8=
X-Google-Smtp-Source: AGHT+IFDX4dxd/+wQKhT7XlWvn/QO7QwYu42EgcWa6QV9yKKncbdEuYTOOqITM6cyvlAxavhP6u36w==
X-Received: by 2002:a05:600c:8b46:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-45365e98279mr13304165e9.15.1750407782340;
        Fri, 20 Jun 2025 01:23:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d156esm17456485e9.11.2025.06.20.01.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:23:01 -0700 (PDT)
Message-ID: <9deadaaf-7dc7-4616-a6e6-95a5f757779e@linaro.org>
Date: Fri, 20 Jun 2025 09:23:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Add current load setting for qcom camss csiphy
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, akapatra@quicinc.com, hariramp@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_svankada@quicinc.com, quic_depengs@quicinc.com,
 quic_vikramsa@quicinc.com
References: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250620040736.3032667-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/06/2025 05:07, Wenmeng Liu wrote:
> Currently qcom camss csiphy drivers don’t set regulator’s currents
> load properly using Linux regulator framework. This causes every
> regulator’s initial mode set as HPM (high current mode),
> which may have higher power consumption.
> To address this issue, add current configuration for CSIPHY.
> 
> Wenmeng Liu (3):
>    media: dt-bindings: Add regulator current load
>    media: qcom: camss: csiphy: Add regulator current load setting
>    arm64: dts: qcom: qcs6490-rb3gen2: Add csiphy current support
> 
>   .../bindings/media/qcom,sc7280-camss.yaml     |  6 ++++
>   .../qcs6490-rb3gen2-vision-mezzanine.dtso     |  1 +
>   .../media/platform/qcom/camss/camss-csiphy.c  | 29 +++++++++++++++++++
>   .../media/platform/qcom/camss/camss-csiphy.h  |  1 +
>   4 files changed, 37 insertions(+)
> 

How are these load-currents determined ?

Looking at other instances of setting current for PHYs

  grep -r regulator_set_load * | grep com 
  
            [git:camss-bugfix-6.17] ✖
drivers/phy/qualcomm/phy-qcom-edp.c:	ret = 
regulator_set_load(edp->supplies[0].consumer, 21800); /* 1.2 V vdda-phy */
drivers/phy/qualcomm/phy-qcom-edp.c:	ret = 
regulator_set_load(edp->supplies[1].consumer, 36000); /* 0.9 V vdda-pll */
drivers/phy/qualcomm/phy-qcom-usb-hs.c:	ret = 
regulator_set_load(uphy->v1p8, 50000);
drivers/phy/qualcomm/phy-qcom-usb-hs.c:	ret = 
regulator_set_load(uphy->v3p3, 50000);
drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c:	ret = 
regulator_set_load(priv->vregs[VDDA_1P8].consumer, 19000);
drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c:	ret = 
regulator_set_load(priv->vregs[VDDA_3P3].consumer, 16000);
drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c: 
regulator_set_load(priv->vregs[VDDA_1P8].consumer, 0);
drivers/phy/qualcomm/phy-qcom-qmp-combo.c:		ret = 
regulator_set_load(qmp->vregs[i].consumer,
drivers/remoteproc/qcom_q6v5_pas.c:		regulator_set_load(adsp->cx_supply, 
100000);
drivers/remoteproc/qcom_wcnss.c:			regulator_set_load(bulk[i].consumer, 
info[i].load_uA);
drivers/remoteproc/qcom_wcnss_iris.c:		 
regulator_set_load(iris->vregs[i].consumer,
drivers/remoteproc/qcom_q6v5_mss.c:			ret = regulator_set_load(regs[i].reg,
drivers/remoteproc/qcom_q6v5_mss.c:			regulator_set_load(regs[i].reg, 0);
drivers/remoteproc/qcom_q6v5_mss.c:			regulator_set_load(regs[i].reg, 0);
drivers/remoteproc/qcom_q6v5_wcss.c:	regulator_set_load(wcss->cx_supply, 
100000);

I think this is the type of thing we should bury in SoC resources not in DT.

I can think of how we might want to change the current depending on the 
pixel rate.. but then I think that is something we could calculate based 
on pixel rate with descriptions as a base in

driver/media/platfrom/qcom/camss/camss.c::static const struct 
camss_subdev_resources csiphy_res_SoCNumber[];

---
bod
