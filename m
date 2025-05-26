Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DFA1A23A6
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248072; cv=none; b=m2npnAQjki/XKYQpkuXRPr9YsFqo55Lw6ItA4riX+eSoG4xh9tVba4NOfjjLpRdJOOFvIYPBovLOuLV6i49aLOD/EuIKf+JreRfFRNEmm3h8SiuM7RcKiP/FtZdwvA1cTQVKLqZG4Rv734Uhl/7ZVrDFp3NU/ibA1dPOEFnEls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248072; c=relaxed/simple;
	bh=7OnuDfnUzup4LExErrsgTCgjdNv5L3KW7yYJpLLxqig=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z8DcIe+1dURp0KrcbUAZ1ON5vL/ELwNXWTKB3xGLLqbROnUE2titdpoBUKOCPu7cUe+0XKbC1SLpvdr70vDIiVD50xTlCJ6WAQvUwBTxdLLqA4F8OpRWEVvfZ+K0gqMyUt4dG7A6lLECTQaoGqtnMk2U8TauY4UK64CKnLNJgIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOHt1gmW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOHt1gmW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso1410105f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748248069; x=1748852869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TKtprFYJLtShjxUW1pvpLiLjpHD33B9E9u+DgjrELQ=;
        b=NOHt1gmWWYkyVYkE8m2+Szrh0fhPLDIWRQliA2PMPbZpdTyXZsZh4EJ81CMRRQLD4s
         8b5deG44bEurooxVWOLIuLDWetCCNjLnrVhB+eMfwgHTaKB9mo3Y/+dqNzR0j4B2oAu9
         J8otyjfYFsT+/T2LQ/aNxAZgWfC6EP9aeNb9+JhOaT09iV7tl8pYSxNp24w9Q6heLGdb
         wTUGXzjk7xz6sn5hHg/E39DZ6nHnqYHQ8z7fqyW50Dd3Hkx4hl4MMqJ+xfWv61gvtXC2
         EOHcEgFc8/hWKXsPna8FhTHvX0509eaWDa/deS6uSRssKnvfmQIjN3fQvR7yUVcIHd1s
         DmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248069; x=1748852869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8TKtprFYJLtShjxUW1pvpLiLjpHD33B9E9u+DgjrELQ=;
        b=wr/p3u4yRwZAkcXcby7t8VQVzaQcpMR/L52W4h3MtySNj2hbVO/m0k8zNa44oLjyIO
         tAsfPhTx3TGomPvwZJLzx5FamIAULCsw1ByfIlku5zT/xAUmciE7gY0uWStny9kiR9D7
         tjwtkMrEIvCPFomXYCzneMUgkSYtlfxNLMVcvZUqzg1VdRHI8VC2go0RVPAioTit4qmD
         vsdPvoEoNWHx2Rr8D+BduHFmecNID6cC2/nfnQCmrPVnhp1itIMtRZ9zDREPLiN7uWuy
         SkU00AQaYG3jQteE6HAttVdJpRDetLarrIBeOTpJQlTeuNySl7bvNi3sw3y48PEAo2gS
         0MdA==
X-Forwarded-Encrypted: i=1; AJvYcCXdZNVM2nZwzkFOm3uziDKc3LQQCePSJdeyN2RqZMqvVOVwUhb2s9e9KiCCs0R8RNK1dfc4TyR+iJcXqew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpBiHfAORXLIbYLLl4jYAso70KPd70ToYgMEhNzgNTz4EHCXDy
	5nD59T07TCDELwtSrdI2CqNXZ26Yyb70iAhjlG3mwxkJidBJApwkAfGb/JkLInugpBM=
X-Gm-Gg: ASbGnctvNelvzg/DnJpLr2SdjZmI+0zU5kjBTq1KqpkDtFy35u6Oqs9YzppVWzFT/zM
	Yhyfgs8G8ZFGvhKRoIwanrAbSQDQII0exTl7NnGOi+bP1oXl2iBETY+WtoKQyIx/o5rZkJZWqZK
	aBZk2kxkIzZxECrpjiIeW8euP188gabdP7pRr3oNO2cBIcQIF0j0rFEzrLCwnRoSfgj8htlxDNM
	xxJDZJQwmUWGfuGPKXhwXeNjnSjKGyBHgqDG2RWmDymwIPfYOl50W8U48/YkRukRT+7azNkrxqE
	hy1zDnRQvI5qnpbL+2WqRTkbwSQ4FfqM3465ufyyRNuhL35uwVb3MYvf1tEYswFXw/2yzetcD5D
	oTCsZYamMSQhZcThSuzMrAtw4Zy198uOCUqIYMYY=
X-Google-Smtp-Source: AGHT+IEkmo3uWY34WkdQOOYglx90247HrshVamLntEVSTknqg2H23bK4BdCNPIcYmijHtsv1CC3prw==
X-Received: by 2002:a05:6000:2892:b0:3a4:cf76:b3b6 with SMTP id ffacd0b85a97d-3a4cf76b68dmr4961011f8f.13.1748248069083;
        Mon, 26 May 2025 01:27:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cdde6415sm6620114f8f.60.2025.05.26.01.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:27:48 -0700 (PDT)
Message-ID: <6de7286f-802a-4de2-9030-6937e85a5aee@linaro.org>
Date: Mon, 26 May 2025 10:27:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/7] phy: phy-snps-eusb2: fix optional phy lookup
 parameter
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250523084839.11015-1-johan+linaro@kernel.org>
 <20250523084839.11015-6-johan+linaro@kernel.org>
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
In-Reply-To: <20250523084839.11015-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2025 10:48, Johan Hovold wrote:
> The devm_of_phy_optional_get() takes an optional name argument as its
> third parameter and not an index like the recently replaced
> devm_of_phy_get_by_index().
> 
> Replace 0 with an explicit NULL for consistency and readability.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/phy-snps-eusb2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
> index 232c5e8a554f..328e67ebfe03 100644
> --- a/drivers/phy/phy-snps-eusb2.c
> +++ b/drivers/phy/phy-snps-eusb2.c
> @@ -581,7 +581,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, ret,
>   				     "failed to get regulator supplies\n");
>   
> -	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
> +	phy->repeater = devm_of_phy_optional_get(dev, np, NULL);
>   	if (IS_ERR(phy->repeater))
>   		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>   				     "failed to get repeater\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
