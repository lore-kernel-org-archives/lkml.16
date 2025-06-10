Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929A28CF45
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548897; cv=none; b=la8HVhwE69gYhM38PvBsBlpkO8jxOa/Ea3V6IT16NcGVI3XVcIVeRQ74BLfwbH5iPP1y9tZFX/SC2mILro/iTAkNxBven/0RS1uiB+6m2D4E096FhUsAn1xcqBXR23q+D89iKSjSQOPPLLtO/3ZLX9ozDmxXsL9whea0WoLVBrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548897; c=relaxed/simple;
	bh=drtc7gbE8EVnagG9aoANO0Qzm9NCLkeYbn19VDrN7lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKDle8YJSu8XBGNoEANU+y56rZVCB9Nrpu+uJ8tYAE6UYaiUVwC0qFgzjMUKbGsXRxnJz4rjIYWHkRJmWnQSGU2Sa2YT3sBqwCMnhACgWfVcYh0d8nH6i5dd5jD84CeEWMfoNm5GQG8zbY9l0YApBI5Hl5EOuXl9Pv3rCLxc1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=scAx+Ssr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="scAx+Ssr"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32aad2ab31eso2109891fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749548893; x=1750153693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgWX/fDU4kZifwwXOkRhcJUMm2OkuAYm3wpAj+nwwK8=;
        b=scAx+SsrlfVuPuqcaMtTXapNGGrTB5aQau5mq50//ivDM8yO1CJcmReZzhMlsMy6vK
         ftl3ZMclXD6FVwN2c2ZGJQsTnruNK4EW3kv/EpiG0zu1bkTqUlBS92VD/yNG41MXeWmz
         WX/UgUkfMjGMwI/kMWg4sGaKLlH3tdlhLGy1XoWAArjwUFiAkPFyHugg6xZJcVA+raPK
         W0Pa0P4WCdvQ9CIuj5B7RxYW0GLJ1Ahbz7SqMc7opdXZEp40LqCJ+sEkTyO/5jmLoOgp
         mr1xPKawAjKUcs0DoTFx+5W/JNP/2+wtBzbpydrdVTbfTDDx0qk3+vVf9QeCNXwmpWEi
         LP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548893; x=1750153693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgWX/fDU4kZifwwXOkRhcJUMm2OkuAYm3wpAj+nwwK8=;
        b=BYYz6qZosBmQzZvhiDR8s3NrlLoOpI3CFXmV8at6ezLJpNFEmL7QlpsBsMYdvyfxAb
         2j6Jcn7F00k0mTRJMoZvYZ+kWrCJJt5/Wqx0KtkyxO4ZF/OS3//QR+kxoIlauP0TOHeJ
         e4X5ULW0uW5sYT7w5lrfFmutg7vyBom3S86KesN5W4nd+Edn9qaXDAqKuMHzo1grP+c/
         OSV45NOanKM0kWWvOeNAMpvYQ08aj+U5P63lV1AOdQ8nRf+obhMW1ozis9zCiz/vDVOd
         RUrpPvbkLdeXLZG4J/PghGsL0d6BT0A7wHqoUo9h3vpl9PxkjQDXaLq6Q9B7DstOpvno
         KrCw==
X-Forwarded-Encrypted: i=1; AJvYcCVY52T5HhnTtZgJOanNIrD1tETpbY5jp2WMifnNoHTHgotXvd/1FKItcbWr7U7UidtY45yGiYz5LIBAWmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyonEtEfoVvpk6YMEW+HKXJauEQp5+xkPZuNwvojvvJmv2nX+oq
	F37indaG4YabkuNBLMbwI9g4BwH6F0Puym7jQr0ee8ZTHPH9FexJ711fxcqxuL87G988unDO1w1
	sHMyy
X-Gm-Gg: ASbGncuj0YjM0AWLHlgNHNYr0X6yf7Alt/NfXIL+3jsKnDmX3UzVHPUesfnnGPp8Sxs
	uSZ5LkZUE132j2Er96Gyt803uDuu+AZvhgXLGL0jYtqfDhRj29zvcn59xJVO+4aN/GFW0b02A3d
	lqz6UpFanIA7PrjsQu8QBFDL9OLpfxnuZDW//pK00f9L2UBB0sx+Rg1iqbDw6QCgE3H3ZgvK5nW
	JMkPeHUqNMAKvcbt+/2rYjUwctWuIGC67o6EiHMWLIsYIHzBb2lxfYKOdFuEoyxXofebebbBQSd
	NmfL3qVgN44CviImzEOf21ghQiYbAqkLWJnPB8B1AowW97Kld/QTAYeaq2YFsNJ44hM8FbHWCg9
	I44l5gFIj6hbSfmiyBbdsf040J37EhEqBBvuvPv1b
X-Google-Smtp-Source: AGHT+IGe42fvbz6UNMq3WeYyozKULgQbXzEyVJQNlI32jNbCy2BtIg4bwXtTOyqOT4GzCdoEQ38Mew==
X-Received: by 2002:a05:6512:3b96:b0:553:2e90:98c6 with SMTP id 2adb3069b0e04-553687982cemr1368395e87.11.1749548892235;
        Tue, 10 Jun 2025 02:48:12 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722392sm1471777e87.127.2025.06.10.02.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:48:11 -0700 (PDT)
Message-ID: <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
Date: Tue, 10 Jun 2025 12:48:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 bryan.odonoghue@linaro.org, todor.too@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Wenmeng.

On 5/16/25 10:27, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 210 +++++++++++++++++++++++++++
>   1 file changed, 210 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index e9bb077aa9f0..722521496a2d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3326,6 +3326,216 @@ cci2_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		isp: isp@acb7000 {
> +			compatible = "qcom,sm8550-camss";
> +

This is the first time, when 'isp' label is used instead of 'camss', it might
be I missed the context, is there any particular reason to do such a change?

If the label name is changed to the regular 'camss', then

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
