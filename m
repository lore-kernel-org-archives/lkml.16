Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A806192B7D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725104; cv=none; b=cxUOmXdTSA0ApcPMe21JBzG3ViqzQv+ZA5WRg4MT8gf+Ex+pAKDcIJf3oZWpRh/xjFz8Q0Vfq4UsSmqR7UXGOzJiM9amClxwTm9gMt3VAPMtlHucy8vg9cdclSVFdKC4kUtMcOQiDC6agutVwcMMVjd/qwqpRReX52hyQJr5xoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725104; c=relaxed/simple;
	bh=UfJgIp4oQQnoF3z210RwfVaJ/K/BAP09dMRp9gT3PeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nb08KXs7+bu7gksTNJBuP07DpAVKQ10n6K84nxnT3CUYzdIRkWDeunbTnlTLchD+sB0eaMbtWOKY0SF9IFneHDhV9cYwMolUjkfIdw/qa6k8iK6iIFuMv67k8WymHQYWow26mIWXmob/k48EvfahLV8idho+VpUG1q1/mupk2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rj7c/HUf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rj7c/HUf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so4980267f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725100; x=1745329900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uxiqPgqs4MERopy3QM6Zed1EBCGngYHtZhorQ/3Qy0=;
        b=rj7c/HUffmH5bX6A7PrnfrGMtEJhPUQAd0Zayic2uzMrtam2C5QEhttuqHxMqLKBK7
         us0e1YobUMIkRunL8uk2w46zqcj2lc45nukVzBtiPFhcj/pxFeG2RM0OxNfIA6gij2sg
         fy0rOaLlcfChLFBRlO5HEmfTELnlSsZIIgZV4hiEOkbt0e/FXOfGx1GM3pxEok+xeOU1
         ww8u7/TFJ9doVE6p3iubYCmgsRK1ssiBbmNDqwAcbkpe/MEr9HCRmOMK5veqIYJSPA1P
         P5B4C8n9vOmojNOeCWn9aImRIT8aQYLLlhat1JVkuq4xwYq0z/w+m+qgkNpAW/+ytkD5
         7Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725100; x=1745329900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uxiqPgqs4MERopy3QM6Zed1EBCGngYHtZhorQ/3Qy0=;
        b=TB1iNjJA6YXjS3OdTZNfGw40hj1mjpacnz6L6SrCfkemCpy6pSR7oocEFLdxZ5xVc7
         Rq/NQZjKF9EAtplijB2DYsvUI4Xc6vKA3482GDfkOEqPohCvXyk2WfeJq9i/sGHDqn1t
         wtzRvyuajF8Z6OulHXVIBHyOr/ef4WjSCOPdUkhGVWJWQPWSQn/hdEZ09E2kYEyWS0cI
         BoIOdWurbT1sAp062yNQhnx9bmigEh2z/muYwkgtyp+aHuShiIMJslEroQjVYcqD5bHP
         sLnHLPQVRq4BkuiUsM+9IYXF1E4NqfBxTgjtqhSWvFLoG1nenCa1u2LElFcKNEVN5ypN
         un2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYhNYb6yB0CrEBoZF7Fm05c0RQnYppwS7bI3q7oIw0HedQH0AEIHBoBL7mvLbT42JZZJSQj7cM0+x5gVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJOF136d3zDCz5Q9qJ7tMH/nJ9rhADhbXRmo4uAz4ipepvVPvH
	sx0YM/w8YmGnQHJPdD8wHJZKa9sL6/0kVaF2YTPO6jxJKQlzK6+ZAU2xdtEAE2U=
X-Gm-Gg: ASbGnctAyHXJfa0qo6LGuGbf9cYgndlCTVewuX8nrE9gE5Dw5dVFvtnRYrt1dKXOkSN
	lAF8kyxDClySSRXva9+kQ4Rsij2HrAwlT+eDSIM/Hk9hG1fpTA5Ktdw9I++aplNmIUpk2fzKTmk
	VMidAv+bXq4PXNM1inqEyKCzFjCFEUwivqfTXTpsgzNaFDLVsssVKJgVy2LmwcvgdmCsq3DPKGJ
	Xr6z7m8yTdluYJSso3o+UYLMl50JBpNNGZE+P0urjutdtEXg211NZoY+jhxAM1VobsZgYlyAAyY
	4mBaY9v9mBv0jjEqahwmSRtcgxofygjcS4nsZWsmKDMjYvsXsGaYEQ==
X-Google-Smtp-Source: AGHT+IFQjbRWWPWnXrdkJHVnDwqcGcHfF9uwpPgeKOFyRZHe1CETzGQ7LKb7u2GUPWdd1at8v+uIzw==
X-Received: by 2002:a05:6000:401f:b0:39c:141b:904a with SMTP id ffacd0b85a97d-39ea51ecad1mr14249426f8f.11.1744725100601;
        Tue, 15 Apr 2025 06:51:40 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44571fsm14191129f8f.84.2025.04.15.06.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:51:40 -0700 (PDT)
Message-ID: <358f4a8c-29ad-4e5e-91b9-063f06e769ec@linaro.org>
Date: Tue, 15 Apr 2025 14:51:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: core: Disable helpers for devices that
 fail to enable
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250408195922.770377-1-yabinc@google.com>
 <20250408195922.770377-3-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250408195922.770377-3-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/04/2025 8:59 pm, Yabin Cui wrote:
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..a56ba9087538 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			 * that need disabling. Disabling the path here
>   			 * would mean we could disrupt an existing session.
>   			 */
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev);

Hi Yabin,

Unfortunately coresight_disable_helpers() takes a path pointer now so 
this needs to be updated.

I tested with that change made and it works ok.

>   				goto out;
> +			}
>   			break;
>   		case CORESIGHT_DEV_TYPE_SOURCE:
>   			/* sources are enabled from either sysFS or Perf */
> @@ -496,10 +498,13 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			parent = list_prev_entry(nd, link)->csdev;
>   			child = list_next_entry(nd, link)->csdev;
>   			ret = coresight_enable_link(csdev, parent, child, source);
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev);
>   				goto err;
> +			}
>   			break;
>   		default:
> +			coresight_disable_helpers(csdev);

Minor nit, you could collapse these last two into "goto 
err_disable_helpers" and add another label before err: that disables 
helpers before falling through to err:.

Other than that:

Reviewed-by: James Clark <james.clark@linaro.org>

>   			goto err;
>   		}
>   	}

