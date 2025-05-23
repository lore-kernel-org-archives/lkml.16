Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6053323956A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022826; cv=none; b=AK+07qL5MZE81Lhqbn3noSfN88cLdONqdT5+Zj55Qo9Eev3fCLNnZMlDvRoFLPpy6u9egJzK13OyELGOWx/YgATBtux4fix39LCaTXrBm+b3LpKHDIx/2WvgKyqXMpS6iQK0mJWVUFY0DCOJgHnC9gGFaYMsfZx6ek1YWJDv2YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022826; c=relaxed/simple;
	bh=vXYq8BB2rUVZGOa5wTp+SSLFH2/G2/wBeCcy6/RZFME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOI7XqXCG9NZ/f9csH8KwMAIgY/jmZeLxwUQsCVG1SnqC555/7ToEYoNLQJIwNfvlc85egLI0BjtARqsMeNt8ApAN7SwbUpvVB9di7kc2yrwKC41ODOSPpDLpsymHuRx3QM/0jCOxNu1wS4PAdCli9mfDB51BHqLGrxX108fT+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UeQZgAd2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UeQZgAd2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36e950e41so122472f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748022822; x=1748627622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j27xIbPdujh3p9oIQQHW3FhXdAxHTtSk1vtfWEm1vCU=;
        b=UeQZgAd2HrqhaiP88Cl9RsbD/oVetoumGUq1fACbHoMCLg/5GKxHbK7nMP+FahuYTJ
         H+QZ6Qf4XKw6zz3lBSTcnZInj/dGSr+GwxBXJQeimyZGt5T+SIu8mFmtjvIySx7CECEX
         E2po0Nl+fPJMto8S03dSoDxUFH8fdjbjEKj3iq8+/lZuRUhN2say9UykBPa4I4RWGWpY
         2V9gbRxEo1SGAAIgeuBep5oaCWKAP9E8bKG4QmU0BA8JGrtt7EL+4tWhmcN/1MfeKK+Q
         cNMp9G7+eQXUz5HmqgxnjBVPhjzs7yNgPXDWETlNiwx0Kcf2xJU6BdlkPeRU79MJ+uM4
         9LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748022822; x=1748627622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j27xIbPdujh3p9oIQQHW3FhXdAxHTtSk1vtfWEm1vCU=;
        b=N3NIViWCNwbKu2iJTHULZ0NywrJpYNyz86155eVuRMJbsIt3bFKDfBACDJp54cGdRC
         xe5LZGyU27mvy54Pqmq9PV6mUjTfkA8YWD3AOFyXOt1bHdhLo1KyQtTOz2AZ78UNgQH0
         GKLymMhuufuerbsAZbRn87SqoBcoUGHvySCwoKv0zoOsWTZM6AKWSNoyqJoxjWSSOu2k
         MIZ4L689KSrsK3sptTy0xaqtKMrbQSnZEUYhj4OgBo5Z4kXsuEbTl4kSb9/Pu32XxCXK
         i4/bMLZ1Qk1SlcRDVuaw7ByoF9MB1oCDEHX085mxp83FpwGJGrNeZegKgzF5PXPlNXfy
         D1NA==
X-Gm-Message-State: AOJu0YzHpUILZiaatZu9N5JjOY/rfH7InLfFkZVKL7wuCTFHTCxv1GT+
	bL/G1GnRfpsHW08S6Z9AHLqhcbRhsd68JNFjc2ryouUkdJhgstbyOWKFy7t/CBECCuGICS7Lo/C
	EH69uniQ=
X-Gm-Gg: ASbGncu4PqLJ3Cbbo2/OeI5Nec1WpTInAmd/r735obkbwP0dtUL+OU/lt8EJtqPKRnF
	Pt/eKkqRAJdEWAzFBXsV8maeYS450cSDDJeg2rRwI07VJofz0tU3RqPmHcy3dxPXXFt7ukB1z/S
	EEH+4WJMeYNJPGfzjtjEkJylABYf9yusmSDBwMz8sNo+PAXlWaKozhUi3Mj7hvHPaopFAZQwOBq
	Bm6cd+DSQ6ba6V4zdJZrlIVKdyKIn+djDTZ75R2pAUJEtSTdCfZxj/CbdnPP6GJMygMeP8CL0N8
	aaIaGD5WP3llkM6uH14rRlJbP/j80GLbOP1MvJEaRPQNn0r389NVglZ4Cg8Mu76IuYSiZwwl1Qk
	FwBHpSb4uxTQLGyc=
X-Google-Smtp-Source: AGHT+IF+pCJEN6fAtU2OQjQiLzZXS6kTu/snWPWn3LeFtwjKkIRXZRDAPlOO0y0AgoCanNs6EZta+A==
X-Received: by 2002:a05:6000:2489:b0:3a1:f653:85dc with SMTP id ffacd0b85a97d-3a4cb4a9ef5mr231518f8f.58.1748022822647;
        Fri, 23 May 2025 10:53:42 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a8cfsm27604102f8f.37.2025.05.23.10.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:53:42 -0700 (PDT)
Message-ID: <9e494704-6098-463a-932e-f1b8311c4cf8@linaro.org>
Date: Fri, 23 May 2025 19:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] selftests: Add perf_qos selftests
To: Eric Smith <eric.smith@oss.qualcomm.com>, rafael@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 ulf.hansson@linaro.org, arnd@linaro.org, saravanak@google.com,
 deepti.jaggi@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com
References: <20250505161928.475030-1-daniel.lezcano@linaro.org>
 <20250505161928.475030-2-daniel.lezcano@linaro.org>
 <36608326-52c6-4d82-a51a-b802920312b0@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <36608326-52c6-4d82-a51a-b802920312b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/05/2025 19:43, Eric Smith wrote:
> Hi Daniel,
> 
> On 5/5/2025 9:19 AM, Daniel Lezcano wrote:
> 
>> This patch provides somes tests which depend on a kernel module
>> creating a dummy performance QoS device. More tests will be added
>> later.
> 
> Thanks, I did not see a test where the perf_qos_is_allowed API is used.
> In future patches, can you add a test using the perf_qos_is_allowed API?

Sure, thanks for pointing this out


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
