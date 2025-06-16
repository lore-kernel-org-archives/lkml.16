Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF31F418F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061354; cv=none; b=LftKJgsiFQ14PPNORFhFS5nR86Dj5cJI9himkU+RsqQEW02GfzasATDw2//hf63kc5817Vt/9HKGqQeFsVJ0p+g1750pv4fDtqOqBAxzUMzdxbW07cVAleBsG+m8O5jAHiQQQo1InUw4s/txZXxdM4Y7rHxgApeP9z/4vrFxJTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061354; c=relaxed/simple;
	bh=USkW9A8Y6Pc8W+vSjgDy1nhlge2z+SqxZaMzVGJgcwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsNrrkEaQgs/vT2TnvjMXd09YUapTlfPvAcVAmjOeDqbc7q60bjTUFHpziohmbEfwfZQpdhxpYtqN9Ol8QoVjiAkBzvZzuRi+QCTXhW14DpYplTP0ToKasZ9dn9007O+vp/toWoIGQlwUtuV91MVIWQHpeBqQSOEyGehJUwOcsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXmhxWFT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXmhxWFT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so33534025e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750061351; x=1750666151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xkb40S5vLWjTYywYDHqKY1pbcd7/hgHih9SM8FtY0Q0=;
        b=zXmhxWFTtAv+E3q4kxp4BQOi3fqTepixTR2mQu70FpituiUN1HTrmyHzbkYuM3ZtNl
         eOtDrTZkvU19W5AwHDL59AUUB/fhGLxLyfzRcBE5wBrdXoT3MsI2aaRZ2KRLOu2dQonM
         43T827GJRA/qo7VQaQJIMnSzIALd9t4ZBiwjje5irGfgs9o6LDZPXPelapoG9xvTx89m
         cLMDA/fORyvEIhmNFkBhJNq/DmAtQHxjjkgs8YBMwSVoxDII/axLcURfyn5TCemEagno
         EsXv7irVBoBhHzuavL+EUzHbBuiESL0dlx2FsaAW24IVZ0VGT0c9/q2sn8Q/mTV+ivlN
         t0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061351; x=1750666151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkb40S5vLWjTYywYDHqKY1pbcd7/hgHih9SM8FtY0Q0=;
        b=LtzkKdJkEnjLlVS7p81+AEfJrnp9DWLDNEdqW/ZZ6D8th65C+ph4Sg7Ts6VoR6GjeQ
         EnGA7iLgc7s58pY8lmREx6694LOUAwZ+FaEhxcJQY6uu9XE83l2vQMUlGBIjJ8jFZhAu
         Rpf1FflbC0AuH1eH/kP3beRvpdRKHzOP2c4Wn3hdIk32HpRK1azTh9BHYUFEvViqLiiv
         iNU9UkiDEAhld6J9IZq1b67cV4zVOOLQaxdVs3K2hE2TkwDV8muY0NPECGu05iBxx1vk
         VlGN1cNyvPpMlYDiL/jJF3z6xcVDjN9H9cBIAybKrjrhym6lXuzkVMslGMMVkL+M7jnL
         KHNA==
X-Forwarded-Encrypted: i=1; AJvYcCWOxMOAziMARiiY5l0STPlGX4lFspqqDJ6vTUe9am0fG8XgVtFqkdiuUYzSTxoMm/awKxQoOMuBFREfUXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOMqBr/XHWSX0dhht+HlQPvjiFudDvbhvF9ZJxuh2d/dsBE59z
	/DNZI4HzsQQTeO76RB2MYH05Gsr3GC3Z+NY1IsSDvGPFb1Ex5Z2WvtYprmKv8PJIwU1OFbQBEVI
	t1R0CAY0=
X-Gm-Gg: ASbGncuPEKNAWroxaZXPSAcMDjFIexdlAk5XJgm4GJD2rNgu0HYoRBaYSyKT8wmYNTn
	U1E5wW5gwZxNOXJ7KHMTsD88b6/RNj1QiOx4cDnAMJ1h/05aPAaLBFO8ORDr6Y6ppyHqJKaGTMH
	A0jbUE1rWwkv1o0nsXUm7fa7h7b43xk3AD5mZKPSJtEneG/oRXP35wVg5VW9opeDLZuyoFBleyw
	z0p81snEnyj0vhXx5H/9mDnDVjLuglJd8CwB8mSQXI+agQsqQbzfbv3iTC2bbSK+8rR5H7lzUKJ
	nFdpyxOsoBnwS97Gi1W8Fby6JyhTvyojruytWID4XS6i0Zd/VQjbWR9oSo4irvEr+QtdqVmJVaP
	kUdQV5bJAqgAuJgJvtATrhNvnZ5A=
X-Google-Smtp-Source: AGHT+IGWcoFnYQiSRgGmqI7cH2i+fqFJCVEDio/UJeVZr62hdUsC4q6QvZkCencW6E8/jOVV2KeCYg==
X-Received: by 2002:a05:600c:8710:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-4533cacb574mr90452095e9.31.1750061351057;
        Mon, 16 Jun 2025 01:09:11 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e195768sm137550265e9.0.2025.06.16.01.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 01:09:10 -0700 (PDT)
Message-ID: <7c850205-0c42-4e6d-bf5f-f1255367d53a@linaro.org>
Date: Mon, 16 Jun 2025 09:09:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable
 PM8010
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: bjorn.andersson@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, laurentiu.tudor1@dell.com
References: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>
 <Z9qXFLmnae86_GT9@linaro.org>
 <a7zyhmv5lqxl2l5rdg2x5g55wokm6ztwvzwrfkyeignwdromjr@afpe7zwsmkt2>
 <d2eabc30-f1d2-47d8-82f9-86f6f7a705bb@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d2eabc30-f1d2-47d8-82f9-86f6f7a705bb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/06/2025 19:29, Aleksandrs Vinarskis wrote:
> Hi all,
> 
> 
> Revisiting this change in context of Dell XPS 9345 and now Lenovo 
> ThinkBook 16 [1] (and upcoming Lenovo Ideapad 5) as these do not have 
> pm8010.
> 
> 
> Perhaps safest and easiest is to simply disable pm8010 in `x1e80100- 
> pmics.dtsi` as proposed and _not_ enable it on any devices, since its 
> known to not be used anywhere _yet_? As its a camera PMIC, the only 
> submitted upstream (did not land yet) change that utilizes pm8010 on X1/ 
> X1E is Bryan's CAMSS series that enables camera on CRD [2]. There are a 
> few other laptops that have patches to enable the camera (my Zenbook, 
> Bryan's branch on Gitlab for few more laptops) but those were not 
> submitted yet, so can be easily changed to explicitly enable pm8010 
> before submission. This way we could simplify this change and not have 
> to figure out which of the upstream devices do in fact have pm8010 onboard.

As a general principle, unless its used it should be disabled.

pm8010 is a camera specific PMIC and Dell has its own way of powering 
the camera sensors on XPS, Inspiron and I'd guess other models too, 
presumably as a result of reusing the x86 design with Qcom with minimal 
changes.

Disable by default. +1

---
bod
