Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A50027604A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982416; cv=none; b=XRAs12oNwCzdPesOD3NbERXgV/3aXsaj38mzCUAvANCKdXWvCSvM9dMFILgGvAPpgbICIiwIXltq76hI8Q5KJm+MDuBruXUdzhGTUsHWzKupsv/7QeaCpTWO6Y4n8y7Cdk2yJ1KkT68RYEIXHYZjTBAGQo0jyGYbAJqdtGh22sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982416; c=relaxed/simple;
	bh=b5jeH9RfjTDXcfZcMSWZB1gj325j1QVlUQZ24/q2PO4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TpBcVQmqEcHFCqkXb3uoGISlZRnFYTriJGKE1Z0ZFUNtZgxwKUCsfsrR4yxeT9X2umKu/PgtVPGrs+1MIu62xhVKRNlBD5iHbtzXJPx+JI+L2+c2lVBfH3USoUBM7Y9yvlfFWLN5NODPsVZkTV+OZZJ4rHt7bElftU79GSFkUjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M62bv4nK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M62bv4nK"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2254864f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744982413; x=1745587213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlCq1wzYbj7ZD9Rq/YTc1zUdp9qyRnppuYJZ74zXERg=;
        b=M62bv4nKGBmNXcvXESSWzM3X1nHS3cnrfhodg9imzGBGzstZboEwUq9uQjcn7Rg6z3
         TWSTuRh1+eexDYYSIZ5R6whlQWokO594ZXWEqkiPqHifoMXm0sHpQpqNoj+79b3Yc+8r
         XNrJRqXGLNarDXhVxDACf6cfZ2cDh6XwdBeVclIK1wLL9bwa2zGx3QxyKbwmbhgyat2J
         jQu8YMjlQnTGju8JSM4FSbX11YUAFviebNLpo540J0xo3TPRk65OCiDMEHCKtxqVK2lr
         H488iSK5jvt+BAYEXQBnrK9mobs6KOOFKAPKh8QIJ/6hIPQycUO35uXR5f1tNbMAgMeN
         4L+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982413; x=1745587213;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IlCq1wzYbj7ZD9Rq/YTc1zUdp9qyRnppuYJZ74zXERg=;
        b=Xyb8Kr+8MgIUlV7jpMAYXV9LMfEjd6nupgOiBJKVnjQ6kRF4NUYRJ20hu/V3aFi3JA
         NoLs+2roSatsJEvUfQ9g0gTIbtDkN3olrTaa9YDi1TN/jfpxKOrgjH4AKOso3noXD/y0
         JXbii2tQtE97It0kp4DagtiYJT7Qs/CiwSahD9J5FgznOgfhLliN+/J5pND52ahW28d2
         688nvj4ryvIs9v5zzZgGo3wHvBmNny/tJyQovAQD7257UWwAHMkzZ5gyEgcc+sym6fOY
         9ysbjzol9HMawliPJbC+gUf/3nB9p2zLscceZAc8aDrZF9ebN/coNNTV/IJgo7pEQXXf
         +OPg==
X-Forwarded-Encrypted: i=1; AJvYcCVCPiYJOtMFDEf+7M9hynNY+TKDnLpgSMDhW0uVzU91lRGDCWGJJXLmHF1U426XrfhD1ZSus2gU73EME+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQoqqfsjke8UMkC8WCx3svc+7xLLHnC3OWSWrJ479rCY6ycb1G
	ciHIHXokiPxdfQza++Yc+MwB7xp946jah3Fjgz9wdweTA1kyoL0BRyXpcPPsGCE=
X-Gm-Gg: ASbGnct4ABk6yeDxLwm8R6wI6S+bPCcfaGzOkjYlmkVY1QYxJYURY3IUFvsisLwx8Oh
	RAYhbisbonQJOywb+4rYZGXD5hMpHTUCYUM+VEjRQcCwlzQOi23vkE2QmNH23c8WKxIUCDz9DNF
	8RNrh8DxLzaOvQgGz/3nZ6YkCkVuxfLYZ0MqPUVIdbuzoQ7WrYim0Q+wiK8XhQwHajMait//4jC
	N91C0Jw0u8Pg5ejrwP/tnBiNGjfDHlzEbkuJqURoNQz6Jf7uaU9MfSxIgKNpoGkF/R0ZsuPB8oj
	2ijOC6976V6s0XGnxo7xoSWv4x0GDRTIioovRKAzl8+cH/w/2YdO3LmHVU3iLnD964qc9aKl771
	HPHtq92LrDpNy1wIqCUmLpYikbKDD
X-Google-Smtp-Source: AGHT+IGbBFeZOLZYbp2zUOGKIZnaoUgakmGI4693FYmJp7XCaEK+0cCe61fN3YDSelUXfVPQxuwn8Q==
X-Received: by 2002:a05:6000:22c6:b0:39e:e682:e01f with SMTP id ffacd0b85a97d-39efbaf10e8mr2139190f8f.51.1744982413311;
        Fri, 18 Apr 2025 06:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f8ba:7c24:7066:d010? ([2a01:e0a:3d9:2080:f8ba:7c24:7066:d010])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433104sm2764052f8f.29.2025.04.18.06.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:20:12 -0700 (PDT)
Message-ID: <9084b75a-b4fa-4159-9246-824723df657f@linaro.org>
Date: Fri, 18 Apr 2025 15:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 15:13, Luca Weiss wrote:
> Add a compatible for the QCM6490-based Fairphone 5 which can use this
> machine driver.
> 
> As a note, QCM6490 RB3 board is using audioreach architecture while
> Fairphone 5 uses pre-audioreach.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   sound/soc/qcom/sm8250.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a..ec5372e18a9c9bc6a80412adcc5ec473e9730620 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -211,6 +211,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id snd_sm8250_dt_match[] = {
> +	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
>   	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
>   	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>   	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
