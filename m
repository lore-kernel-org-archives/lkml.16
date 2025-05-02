Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD4F25B695
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202643; cv=none; b=feRBjxmlAWZo9Z2fIwic5LA+WpRrU312aBanpHwdnWrgZmqo38g+2TeGwE9hrpC9CDBn8CJ0xu7PvUlLLGj88c8Hl/NJ64QMBqjpjzVVnPPDaB92Lf4nSOT7GQUvz4gmqxjF6lX8FzYuwAVAZHz1fUaW3zJAPwIQIb1OeXGhcXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202643; c=relaxed/simple;
	bh=p25TGFxmDkAyg2SKPUNGairhusjxzU72tOg6R+cw4r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2r+1FNZHAtx6gurfgJnMxXRre+JgsW146t51Id/MNrtOFoHZZcF7GwrPV0ztW+w76qJDrAiKK6jJ3ORJwoCvqvFh98DZ0dvrzIFsiPoMlnj5AQtGYAkntiAnIvH/Cbn2i4A6kYQHnNJgsi9rHFN1DMRfmCPmRgLe3vhMnihdaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MY5Cjbpk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MY5Cjbpk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so13142245e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746202639; x=1746807439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wy6Q6Iq6c6FY4Y1FHTjfXlBCNM24Ps50LT7tN8wml2w=;
        b=MY5CjbpkYE20XvVamxnykBHChcyGYrRPt28syp8YaEB1WGNarX6TgshF8ylCGwHpNf
         G+yo4dRmI4iBZYd/kqv/o0xyA3W2lzAkpH1OvafhCkL/H67vxT/t2+SvuMEA++zKKOOP
         9FkHFyi8BI5iG5ZaxM3Rr5UptY/jhee0G5VP8jJrdZ0X8DyJ1uQMMlK1zh8s7izjqDLw
         FIexSHyhbnNy0ffPus4/Vgt2LSZDZbdGcJivG4cwYd8RDDZ4vGnFwGEatG0+nFYu/zCM
         6vYab/exDeO5/qGbRx+cXo8dfGb3dK4c2tqr3ypegpYvvYLCQOU7spy+Jzwbkh5r0+6F
         pHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202639; x=1746807439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy6Q6Iq6c6FY4Y1FHTjfXlBCNM24Ps50LT7tN8wml2w=;
        b=b8C1soKqByhnyCbse488vlUEpiwRu55JNWQDylPPMFwfcRUpZ0Ws4gbyHDUpSoIz0k
         rqf93ieTsAqRhYyvrP64NL/NW7x9T1LlCRzSkiRITyxoQ6pEiRBA/NHgops7UoTEbreG
         Vqr+f3XZM6EByXohlNBz3RcmIxwrxKnTN0wgNZyKxnqzpQzSLxYh+A3+81Ph6i7DjREG
         pFo3x++EDL02FOGmbmGNoYpd+fowiP0yuNcRRuSYZ2I/8TEC5f7SraZteH1sddaDufuy
         PGWgsXWRbsOetSJ7IWOp4XBU4TnsT4fJv6HPrRkWk6jlQNA032Fd5F7gWLcuf+jQlmco
         Sx8A==
X-Forwarded-Encrypted: i=1; AJvYcCVDJV/Z0zwoXDAdonhdXXRdtyJvBxNdUmvgWmQg6CO8gNQzvYtd/OHKqbtJmw4Fv1EnZ0xf1aaHmCIvqPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWDg+MTj0OCr4dQO6GQzRpOEvMSA7vIOvkEBMoPuHY47SInsBH
	X1ZUucpeR6vGW1Z8SQIuolM3t2k17LTIIAWYOm21ScElNBvM2+L0jNCRCRCWpus=
X-Gm-Gg: ASbGnctRvWBiaWExAdpKWGzS9GU+0ATjPEtjTNgNaIXPrrBGwHy+oeWtD1u3dbXJnJz
	wn79G5OpMnNu4AAR1O9TKjBzZC+XZG/efh5rD9/BOG0A7UwdV8QTepXg4FiEJry9fHLwanwP9bg
	rMxYXezG6b1KxDMKEeo8JpKx47oKKg7HmEV/N8LB05B57ttYhlXbOSG+/oebfZ2wcCP+bPofLmB
	2tiIZ8kFx/sRPB58XtJjO25R3rpRcW3o8BZcRHOUxuwbgJoncwKLJ2INuPAGQLSr63APjfrHVUd
	1uXI0udmxfjfbkYq6oOZ46WDDnWfXJNg+zYHLyHY1S/MRxEpcxRvbhheHiq3RiPQfYhWN2xK3Bk
	O/aWPrA==
X-Google-Smtp-Source: AGHT+IFylSPDAOE+pMGqEF4M3RqjKjSA7UkAh+IWcn4TG/z9ljqFUqXx01pVwkemRY/0SiLj6vSGMQ==
X-Received: by 2002:a05:600c:3acd:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-441b72c0a66mr62299585e9.9.1746202638742;
        Fri, 02 May 2025 09:17:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2af2922sm93761325e9.17.2025.05.02.09.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:17:18 -0700 (PDT)
Message-ID: <311dfba9-84f7-4e3e-8bb5-a4ba79f628d1@linaro.org>
Date: Fri, 2 May 2025 17:17:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/23] media: iris: Improve last flag handling
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-15-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-15-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Improve the handling of the V4L2_BUF_FLAG_LAST flag in the driver:
> - Ensure that the last flag is not sent multiple times.
> - Attach the last flag to the first capture buffer returned during
>    flush, triggered by a sequence change, addressing cases where the
>    firmware does not set the last flag.
> 
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
I'm sure this is logically correct, I just wonder if you could represent 
it as a inst->state instead of as a flag ?

Up to you to think about.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
