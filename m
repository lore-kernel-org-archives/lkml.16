Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65F22D781
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564366; cv=none; b=WPEFqa7mmHlMCZ/nwGKIxMUy5bP/LV/nxO1O4+Ik70BiVdW+ktnq5mDNtQcDf5Ui5z315dUHVVZ1n64f0UaV+D5ygpgn4WbszvvvsEOd/ljojyq130UfrtHvo7kO+50oxez57ScYTUFMt3B/13LIUfqvbqpPNZrBbW/ggBxhhXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564366; c=relaxed/simple;
	bh=diM9mxWPyUi2e84b6pNVTR0emiSecPEbQX2ZPSe+dFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l67rQLrn1lgHtHcPtdxjJh9udi4rcCfYIj7AiJpl7Rn8d0jbOUfECiuuqTxUsNB6Z57XgkrxjhBfQKO7pTdrPfaA/vZzZR37A8DpFk0pZJS+tWCz70MVfswyPTkyPgWhPkhWlHy2fwysxV14cuK3xkofPMMgCefffmuvJv8Mc1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwwK992X; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwwK992X"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3912b75c0f2so165590f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564362; x=1746169162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gLRtWE6F0uREZFWiClNOBZdBALxZl8DyI6JGwpwt6Jw=;
        b=IwwK992XQPIW+h7BNk4211+om/n2ic501eicBHEnT3y5GRa1/VOXiLNZNq806Ebh03
         YD8DIProzSjX6ussVDALTdMa8TMq13+qOdI9ExtXlmJ2tCR/JnzNmOOIokAugHpH+Rk4
         h3HfqLbGo/s+tEN5pZYYo/g9glqO7CwYyxWf9wPRvFcQgHzEi8gNCawUsQRl6amXv9Sc
         4zrRbqQn0DIeQE6Z5IkVho4/Tv26vEBLa5cuvJpzwEs686jBQZw4KDUV4aVipJDNMTSi
         jl0JF6Dsjq4FcGOZ7cUCMluLz7I934VNeY96Ct2BSiXbzCY8ohWStjcCZAF/FG3vqlDp
         ezsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564362; x=1746169162;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLRtWE6F0uREZFWiClNOBZdBALxZl8DyI6JGwpwt6Jw=;
        b=QePSKpPBYzsa8JAwAbAMcVs0G+w9pZ4XpZVC8KYmsd1zItRzcPFtDgsSMqd8dAcTGW
         tH9jcVcmLd7aBbgwT+ZOqdeRpsFb2E8d1nxeQyKnYjS+e2ZXwnUgclF8dsfcEI04BaJJ
         5zv8wVIeWFrWGQ9ZIAv6HUeVBd+po80oJxbsJm4JByw06A/5qwPzr3mQKJZUZYBU5hg3
         pd/g+DtbaIpR5k2j7e3n7/iWHQLrGUnklUM83ZpDCxLaGNWOIb5uX7sd6Yu1CMgiyeD+
         mf+QQ0d/FUu9R4Mc3PMp7zx3OGdVk3Ap5inw1XT0R1xUfXgwmrkIfw0ZdBZReeIoHLGP
         4XEg==
X-Gm-Message-State: AOJu0YzA2QbT+KczbktZGqg2A/P9dtTW+SzIh1MIc4cchjALCmJJsmA/
	0tkXiRRDfH0f9LOMmaS+oX88Y3H1i8SwWK9W4oKZ4J4qKGB77kKw1jK4j4j7axc=
X-Gm-Gg: ASbGncst2u6H1AYpG4SDOXHRvRBMUgbvaOssCP7yeiHcn0hgw+VgMzA0ZCQvAZ/xLMY
	p6yUEcp/N9vdkTw/M9PsgnV51q1Nr+6fJUj76fPLLJFWyfWxx8ryvotFb+Mxb46mJPr8tioap0V
	Tdh8rnPU2wQ5NV6bwKdz5enW4S89EvbnP6pR5bOwgpJvzWSw4wxbWEViQNA55JBkT0lYvjbKCxm
	p/7o0b7tZRKozHjDk+axKbDRO7XfdZxuMz+/PdNInpW5NkPaizoEGWr/kpd1fBzy0m45AZ6yWod
	wCTljFhSAdaCvFIzeDVRxRuDgIiLup3RjamFmsCTMoSps1TMRKQgiPx5P3o=
X-Google-Smtp-Source: AGHT+IFFW5fUIr7p66KqjzTq4DoPPUodkeDh7OGnTWIbb6bifhPq2PDmJ/dqClsCE6nl/Z2bZXrXiw==
X-Received: by 2002:a05:600c:1387:b0:439:a1ce:5669 with SMTP id 5b1f17b1804b1-440a66ab6famr2267785e9.5.1745564362666;
        Thu, 24 Apr 2025 23:59:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e00d8sm45677815e9.35.2025.04.24.23.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 23:59:22 -0700 (PDT)
Message-ID: <c7b61835-e139-43f9-b402-ca49c2a95dce@linaro.org>
Date: Fri, 25 Apr 2025 08:59:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] cdx: controller: Do not open-code
 module_platform_driver()
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal
 <nikhil.agarwal@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
References: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
 <20250425-cdx-clean-v1-4-ea2002dd400d@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250425-cdx-clean-v1-4-ea2002dd400d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 08:54, Krzysztof Kozlowski wrote:
> Replace standard platform_driver_register() boilerplate with
> module_platform_driver() to make code smaller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/cdx/controller/cdx_controller.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
> index fce90926d3378ae60166426cbf8e4a4fe014af86..fca83141e3e66e68e6916077833db2b7d816395f 100644
> --- a/drivers/cdx/controller/cdx_controller.c
> +++ b/drivers/cdx/controller/cdx_controller.c
> @@ -243,31 +243,13 @@ MODULE_DEVICE_TABLE(of, cdx_match_table);
>  static struct platform_driver cdx_pdriver = {
>  	.driver = {
>  		   .name = "cdx-controller",
> -		   .pm = NULL,


Too big chunk in `git add -p`. This should be separate patch.

I will wait a day for more reviews and then send v2.


Best regards,
Krzysztof
