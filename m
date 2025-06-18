Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2F525F7B2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286629; cv=none; b=tLL9iv5HbTe8QXLjB7UDu48uGE9YiZpaKdt4Z8dv0cpx9JL/fO8f3WIt1LhM5aBzDaddgmHH5KR6uwHy8Z26M2q3ts33vrJv0WVwVKwbmxzWIRkswtg0F7TMjHdv1X7zLopEq3MCD4HfaYV7BiUtx5TtvYIyaBjHXYH+OmYTWQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286629; c=relaxed/simple;
	bh=7C29pda3Os4hXi9P50dJ+HkdgVgdm4Pec7nJ3piopZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qob2nzpBvo91jYgH6QQdHdDYLrOkG6FqFsKJH9hwpwUj5+IoeKox7iZogL7dg/EMzJVhB5MQJmRYD5gBXn1lTH5TKMy2ngEVQ/Wyh51a4mwpt+TsOw9THoq/7DXtLOaGCD6TVruQdaLZQeEH51OOXLRTgAmtRHKVu71F0V6bDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NTD9eQn1; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NTD9eQn1"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3ddd78f7c91so478645ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750286626; x=1750891426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G3vMQgaSAr8pHAxdoofscIYDx1FiHrooeZ+m1KEAAQI=;
        b=NTD9eQn1N8AlJ6nXia8gu+neLP6b4QruLMJ2hCZRPPyS0jB/jpFlSU8Vv0JeavkBgA
         4DqC0fLD3728bF2ZuNcH5CSzrDQkqK1/MTUZMaKhp6KdwUQXp1eJzvmuCuCLV1a5OakV
         j8qpF5V5sSgyjS/ND4ylSff+eEE26v6aHyfpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750286626; x=1750891426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3vMQgaSAr8pHAxdoofscIYDx1FiHrooeZ+m1KEAAQI=;
        b=cqTKD2qOJxgPddDb9JYtPXftyXKMGT4+mZe+82Cs2XWjQqSPVyUjEj4zSe5uJZygf9
         1AzlkTNHPhP8y7g1vSJWGN80N7iu4jADeB/FjCmN9F3+RkupBEx/Uk0sOzxOUKKNnqQB
         8DfWx4UgozGqP5XINx6vEyUfIShMGIsA+Ci5ZJUTVKG+pxtU3mkpJgbjbNHiiZqlQSqR
         c7PU5s13ZA2taazhgm1CFQJViaYOvnHmbh5VguY42Z14qhT/7Gm/Dhw4qDklNyMmswOs
         ogvraTH1QZs/tOEQnjVa7hY57c+jFza4E5Lb3ZdyMoUcfoxfteplJge0KRlsYZgvOblB
         /bPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHAnwp06WQ95NjbjP07PbXXGuH35Jd5SBNQ42jYKfjB4pSSMD/MuXrcrjn14nXKQIzpMg/pe6uDFOB4Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOw/YkWQGL7QkpEzwSS1l8UVaRuYHd+zZ6jkeV17h6+71xYL1
	AnmMX2oOqJ/QoX8xgSqP5E2vei0gLKUaOxTwLIIl7OUDj85sTh5V/aoCF58M7ZkgsZc=
X-Gm-Gg: ASbGnctm9UNuMkz/jNoWkuuykwiRnSR1aPGT0Z7djUrU++8EuUiKhpnaC+hZ0BWCm9h
	TYmMoaG7Yq507GcwAKXnG9ujniWRfcG5KVYvXUvx9fKa23W0m+Eg9rW+upJcv3xoQ9qO4UGQjvz
	QXV0c3pu8HiC2q588AIvdqD6p6RpGj9t1Pm7EXZSc6F0hgNTBcO0E7/0bNqQIHC7uUCxEhFrcuH
	/mfFIGtavlnFpVSRr2P0FbdfGQA2/GOrwMi0gFEDJj1DCWK16TMoErmgiivKo3kJxVPgWWr8j6x
	7AzOWLJ2ly1zO15UJB4H9py8ZsYyY1f+sJet2vDxA4A7utKHWzgU7zdmT08tW6A3B6pkkWeJtA=
	=
X-Google-Smtp-Source: AGHT+IEMut0sjA/9CDO/vrij1jeyFo8AI2L7cAgeng3Ed7laLSRLtq3UWRU1AmzOiPi0tBvNRQ9u6g==
X-Received: by 2002:a05:6e02:2784:b0:3dc:879b:be95 with SMTP id e9e14a558f8ab-3de301f83f4mr16768425ab.5.1750286626342;
        Wed, 18 Jun 2025 15:43:46 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019c6411sm34321835ab.21.2025.06.18.15.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 15:43:45 -0700 (PDT)
Message-ID: <d3e1b43a-48f6-46eb-be53-4731e5eb5681@linuxfoundation.org>
Date: Wed, 18 Jun 2025 16:43:44 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pm: cpupower: Couple of fixes to the cpupower monitor
To: "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Thomas Renninger <trenn@suse.com>, Shuah Khan <shuah@kernel.org>,
 "John B . Wyatt IV" <jwyatt@redhat.com>, John Kacur <jkacur@redhat.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250612122355.19629-1-gautham.shenoy@amd.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250612122355.19629-1-gautham.shenoy@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 06:23, Gautham R. Shenoy wrote:
> Hello!
> 
> This patch-series contains a couple of fixes to the cpupower monitor.
> 
> * The first patch ensures that the C0% printed by the mperf-monitor is
>    100% when the core is fully busy.
> 
> * The second patch ensure that the CORE and CPU fields are printed in
>    the cpupower-monitor output for multi-socket systems. This has been
>    broken since 6.15.
> 
> Gautham R. Shenoy (2):
>    pm: cpupower: Fix the snapshot-order of tsc,mperf, clock in mperf_stop()
>    pm: cpupower: Fix printing of CORE, CPU fields in cpupower-monitor
> 
>   tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c | 4 ----
>   tools/power/cpupower/utils/idle_monitor/mperf_monitor.c    | 4 ++--
>   2 files changed, 2 insertions(+), 6 deletions(-)
> 

Applied - will include in my fixes PR to Rafael
https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/?h=cpupower

thanks,
-- Shuah
