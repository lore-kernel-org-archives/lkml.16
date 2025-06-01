Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1F19DF61
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748768128; cv=none; b=VBGOCO/2wmUIe73iDdymMYTngGrRimn43VhVa45qNLOg15dr8EhkOMuq4WeIPzvdhDIm1aDHbZ47bCRH/1AGnvqnAu0YwxxiHxrl5xh37FmwkUI6PfRJIRb5/GfSY5nm/Ud7jJNQFlMrrjewKRmnmKWvZvFdYzDULux8yLmvekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748768128; c=relaxed/simple;
	bh=ELjgw5x2DtWerFcTQqXF907NgsZU6jvJyml2IQA8WY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISVPwFbWHCU0RIPWd8nyUmqc5SVluddw/uDwhHk1a77tJRu2eLbIm3XNxAdAcT2Y3atM4HqRZjz7V4jHn8Qlsk1vUqG1mnl+CTeBftaN59DumA/pOAfG32SecqbIZrfsLA5RlSuY1aMW6IIr9zoWKen6YHb4ae9J+5laylSrHYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O5rFh/D+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O5rFh/D+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a375888197so1721467f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748768125; x=1749372925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urRzCl5tjeEVqvqsmB0ZFW27RtQHVlLkSlE30TVPg+w=;
        b=O5rFh/D+rALG98ZbdZ6oRPBTAFooRdoCdwRcchaRbDzfu7HGCB+uAZAisXZxAAJ8GP
         x/KdzxEm3w7r3rMbiwnCGnUdV23d1KHBGNA7JSwYd7+OAvqWlAPsu2/PwXDPGIvmXRz5
         jex4LfMuQM646zwYb/QE4sFCVh5NGn6n/lFOOOvR6SmKE4j0tavYpNi8GtzIy5QydFzd
         n9/WxkkmMePcRmaY+nJkw7sXXoXNfFmoKN3f9SHiGGJlLLrDSPpHnmt8VC/PIDCn4UEK
         ZceuJt8Cx8rwvZkOAzDYDVKd4xipQZWKsJMOFXyGFKXinlzhe3T+zWEf1LM/4LYkOW7s
         ZWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748768125; x=1749372925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urRzCl5tjeEVqvqsmB0ZFW27RtQHVlLkSlE30TVPg+w=;
        b=t7NysSFULENAQkEjO6kziHb1q1HEV2phTxbu0BrKcoMrOUCiD+d0TUcRerjgqw0O3L
         a25FaTjIpsWJ817WYEhBQepdolvDIri9MpiIFSrBHYIC5Iv7DcQSGI0v1S+M9dSRFWuA
         XQiGrV0+AZiXO0tVMw5/ktHWwrR02Isv9OljwTkxpCBcLkO2hQ+Gf3Z1La6OrciiHi8L
         oixjr71ySyOJl9JnySK32syX2QkzxX8nxF8Nd3TlU6kcdHC82JJdTaFIv9f3rHbbm5wG
         Hm8MbQCSmceD5smRAnmPGRrLBkpTuzo+NOOgfWly6IKkd/dTQEP/dakC2ACzbIsLLYXo
         V+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUVKL7d/eETWbjQsmFMauaiC894rhBGnst3gI68N4XeTw9MrOzAXWEBDjROROvV8xJIUtf02uLX4j/R/6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNVKuXGzMZgzs0miwqoN+dH/8jX8CR6dOHKebiyKbwozd4PKmQ
	kZFTJMLezn2Jo3CheKWBCEGp6dr581I0Uya1e9ODSdlqQrgPFOxLSVUQxFNRI3+/nQk=
X-Gm-Gg: ASbGnctyd/5jYvIG5Cc60LZiZJsxslVYYLwb9Sjbbwqzpk2rxRJdcX1QdwH+s8rTINY
	dy1ZXRXj2qQmw3XFLP8+alX9H2NJSzXa+1PVmOIm8Tm84ajdMB+ZmtPIO7b67cemFbsSUnGBJIg
	O7GbtYA3GMkuzmWdIAcy4f5d7aonwpVkwZIqABMOptUrb2KApCEEq9tVStQtcK+u2Zwxlv/Enz+
	tftJtzDOjyA/lM2gh/XfMkwxknpGrgirZWbOBf77qQNUBZSKIP8U7zmcImZHo/9xjKAv1rN1JxU
	8GWP4Gh4v2HjPGMN/dExzP/e4ei5hACFK30EvEKZqiDImGWxD7s1hLXNudFK7uxesPB9hln3Dhb
	5n+5Zf7gH00MFL3NC
X-Google-Smtp-Source: AGHT+IHahLhAnxPmN4IhWgL434b77IHsNGngm83xj+pJjR8Vtxj5id3EpkncLZTwOFGIjcU0Fi9cNA==
X-Received: by 2002:a5d:64ed:0:b0:3a4:e54c:adf2 with SMTP id ffacd0b85a97d-3a4fe161874mr3719813f8f.5.1748768124669;
        Sun, 01 Jun 2025 01:55:24 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972aasm11064413f8f.66.2025.06.01.01.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 01:55:24 -0700 (PDT)
Message-ID: <cd1e456d-82e3-48b5-9387-6d407ed7b051@linaro.org>
Date: Sun, 1 Jun 2025 09:55:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: Fix MSM8998 frequency table
To: Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Marc Gonzalez <mgonzalez@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250531-topic-venus_98_tbl-v1-1-68e5523a39dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2025 13:22, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill in the correct data for the production SKU.
> 
> Fixes: 193b3dac29a4 ("media: venus: add msm8998 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152d21133c4dfa23805b17274426a5c..2bb514c322692475ed58198e17f906f894d81cf4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -709,11 +709,11 @@ static const struct venus_resources msm8996_res = {
>   };
>   
>   static const struct freq_tbl msm8998_freq_table[] = {
> -	{ 1944000, 465000000 },	/* 4k UHD @ 60 (decode only) */
> -	{  972000, 465000000 },	/* 4k UHD @ 30 */
> -	{  489600, 360000000 },	/* 1080p @ 60 */
> -	{  244800, 186000000 },	/* 1080p @ 30 */
> -	{  108000, 100000000 },	/* 720p @ 30 */
> +	{ 1728000, 533000000 },	/* 4k UHD @ 60 (decode only) */
> +	{ 1036800, 444000000 },	/* 2k @ 120 */
> +	{  829440, 355200000 },	/* 4k @ 44 */
> +	{  489600, 269330000 },/* 4k @ 30 */
> +	{  108000, 200000000 },	/* 1080p @ 60 */
>   };
>   
>   static const struct reg_val msm8998_reg_preset[] = {
> 
> ---
> base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
> change-id: 20250531-topic-venus_98_tbl-5765675a4ce5
> 
> Best regards,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
