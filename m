Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA85817AE1D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505576; cv=none; b=HdYKf23MEcQjWTfxwNDmU2SDIt1wZv30DHJmqUoiZKckE0Eq/w8hL93QqJxdHN5yw91iPlfC/aisk5rrdgB/8dh6vqEFCkIIY4enqcEdejjqeGwmkXXB3EpqWphYwvTemeZ4oWyYQT97PaWgh2vgNiUQZXrk0+9TjI61JFWTGGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505576; c=relaxed/simple;
	bh=tjTun3+QMHsb18vgwjRVBQvaVSnTULRZQf43KMXODKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t06Z60HjLOij8lMjfuMVBbNDNwlGWVqYQe/JOtzkIFez4dRJqYQEG1PvCkzZ/+EcY3LI1A73ctgfG5ewx2yuUJNU8ixpfr3wgo2AEbc8F9bHVDDQY1E2p9TZRkTC3dHIsa1VvLuaEMymBz25nNPoZrSR8cmpsJANYdX3LWmcapw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dLgWaQfQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLgWaQfQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso66783f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745505572; x=1746110372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f7qUmlXZ2pLbCIPmypgfiGHhX5nNOykglYCDqUy1IAI=;
        b=dLgWaQfQa8O0/IV376duLGMgnGM3QvVPYy51vdwRTCoUpaiNM51ePE9sYx3Ir7m48y
         Mpp/N6NG0fVd8BijJDu3OQNOH0dN6Ba5iuuidtecbMAm3v8nbMmSsqy/Y5QYC7VESzd5
         s4nlfY9sM5tqHxB004vMaxMTnHqaPTXZE3U4DCPM8bkxDMipDs4mAfbMB81j0hhnIlZy
         rtt/ALQyPTC/W6LjFQl82QVVzM92zXkVSKsMU0t0UzW/aFSglkzNYStqGop/lgYBYU25
         jdFHiKDheHMyHefMRjAULp81msM3j/N+sbouOdxzYnoj1YViYf1BSFHcVZ6JrPIqiwnC
         IdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745505572; x=1746110372;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7qUmlXZ2pLbCIPmypgfiGHhX5nNOykglYCDqUy1IAI=;
        b=NtIjHrodb0S4tDHxXeu1SjgYx/2p0EZGSHHtJP8iHHJ3UTzf7vtSDFqEJrfGVCZ7lh
         ev65oIBEfMZDeNbuNvUZoiEtQRuL5cCDbyyGPyvbXabZxiKEsnnxbCI8mU/As3oepR0+
         P6/Wc6DShCFQVa7L14lDLMXq7iEFsNePvX4Adt1Q2kq+TJObCpRlF20aE+Vhu+cKzNf6
         F7myh6ayXLRVYkVRQMagf1bXU/H/iuchxg4Vuk4v9uyenoh5Ssgr1lSgyPh+JvpV15PI
         YvVPRns3idklfQqh5E/ugCm8ap72TU8JId0lnpF7nKx8NAW8jho1QtDOEoQDcgaJTvlL
         c8Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVNAVLvK8Yvmc7RS8v5S5eoK5Tpx5Oz/IWEtEJxe+oPSGqgiF3J7yfNFMv8GnHsWlqab+VZV8Bh/igjPQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyosvG3oxcsk+23q6Qs/BgKDyICf8TeFqcJnSJyID1t4dcwd2Cv
	/5J5Vy576RfO6higXTTr7o3Q7rArdbTsRCws/9K/7qQKhxzswopGAAwMSFuK9H8=
X-Gm-Gg: ASbGncsSWBISGy2yT2htoOPBrPNyx9EWIsZNSEOuRSbk+qQZHPDGCDDg/mlrFY+2edF
	OlluurQ3F1QMWdNHZq9tGh37D6MFr/u5ZEklZZ5TlzgGlmU8aDFVdJh1zQn4Ijbfxj7eCW7pJGa
	eC6dezPHPCSmxT+Plvfd+EF042alnN2IFk59q6AnBqz+lN6XeF8S7uGD42Tzm0XU01wBH1PPtci
	9n61xb1NPynaQhH1VE+6BTvNTQjCyMpDSzve0Ak4kOZW80cCRpNFvQ4knr4LPg1E0z2jcaM76Pl
	wWMHibcn0XIxXFtX1+GtDZfOMhsjoFcRdJA+sW/5wagRPUzpIxTcwvH688M=
X-Google-Smtp-Source: AGHT+IGpXKfd7zkb5GxIWBKYkreXNXNfFhHP54+thzmnG0KgMIvx4hnph/tOHz06RnPnR7UjEWxDUA==
X-Received: by 2002:a05:6000:1846:b0:386:3a50:8c52 with SMTP id ffacd0b85a97d-3a06cf5beeamr952306f8f.7.1745505571888;
        Thu, 24 Apr 2025 07:39:31 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a804fsm2386814f8f.10.2025.04.24.07.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 07:39:31 -0700 (PDT)
Message-ID: <3818d7c2-187f-409f-8479-bcdd6c0e9be3@linaro.org>
Date: Thu, 24 Apr 2025 16:39:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 3/4] arm64: dts: qcom: sm8750-mtp: Enable USB
 headset and Type-C altmode
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, Abhinav Kumar
 <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-3-6fb22ca95f38@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250424-sm8750-display-dts-v1-3-6fb22ca95f38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2025 15:04, Krzysztof Kozlowski wrote:
> MTP8750 does not have audio jack connected and relies on USB mux
> (WCD9395).  Add necessary nodes for proper audio headset support along
> with USB Type-C altmode and orientation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 58 +++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index bd0918e8a7a7e03530eea577c7609454fecfdaf7..c3470e1daa6b7f31196645759be23fb168ce8eb7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -53,6 +53,15 @@ wcd939x: audio-codec {
>  		vdd-mic-bias-supply = <&vreg_bob1>;
>  
>  		#sound-dai-cells = <1>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		port {
> +			wcd_codec_headset_in: endpoint {
> +				remote-endpoint = <&wcd_usbss_headset_out>;
> +			};
> +		};
>  	};
>  
>  	chosen {
> @@ -220,6 +229,14 @@ port@1 {
>  					pmic_glink_ss_in: endpoint {

port@0 and port@1 need updates for endpoints as well. I will do that in v2.



Best regards,
Krzysztof
