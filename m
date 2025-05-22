Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A925CC65
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907125; cv=none; b=PmgEmBdLmorP+ZA9Pp+loLDxiKAoQPm7GGLmmRTw8gURBsur5WDfECqVkP6ry3YAZaUw4+wjwuMumk6a5bCWJN9TsqR5SYfq7yQ5yHSo5EDQMXkX/NoNg4Ya9iFHghIkAucKavMVvAL7MfAiTGl2QoWKOxMw8FOob6AKKeU8kJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907125; c=relaxed/simple;
	bh=lUW88JlK7BVXXMOmbI0/ku/1QkPm4H4Jjhu0abvy1yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ufs6UJAuSANtzgWMUmckiUkob6y7JizKacZTovTFhmVtsaiWVoMyowE70UxvgiC2JImNwf72qW5nCdRepKoasQJbyau2ajvCUzmomKpXpl2lFj7YpvwCXraxaQ3GiiZAM048GO8eawTLsz9TxJDWgnql+MsM6Kge2qaOv8olxUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bDdrXqbt; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bDdrXqbt"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso7256474b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747907123; x=1748511923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCeSJpIOFS0exbK/YOA4ghvpJUKGQ608Mgiqg3CcUrw=;
        b=bDdrXqbtUtljd7QhdbP+nySI75EgWkm2QMy7DDspJHCUJI0WWdk86bCyw7QBj07bYc
         Jykh5Lgp0Fo3yVnHif5BEUc9xpTHbQVb4ybBegIKtZTCdLLqTmhWk6/1qkOo3ceWdxlW
         TMVUPg58b98ewNjo6w+dyqWzq9id4lAZaXFxJ6Vx5m8lV1okziSV4bVc3fmWZ49vTiIE
         eGaE0fWnS40ArCCeoCGREIgAeo6nuRnQw7dqf4QJgnMOczWKdv6TmieLXCHDdvW+3AM7
         369j7G9u+tAYbzyW86kfQNtIZJ9bmqv/NBcu/IkWwYTkAjlpYSA48HKsCadsus/rJPsF
         Cm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907123; x=1748511923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCeSJpIOFS0exbK/YOA4ghvpJUKGQ608Mgiqg3CcUrw=;
        b=KG0BG1noL1hTeTzsIAz0RuR9b6+MincLitc0MSQjcLIsxzrZ1fYel8PpPB9rHkXOEw
         RfXOvlIzJfFryv+sAwYMjTVJ2IlGiy7jQMSkUlX2OpxbJoDZdO38CuEJ/qY/J5nObiUB
         BWXus9Q1wQj4SIPYNkKU5oGigj5A88xddXO0mPPBdaAIda1BmRdVsrr8VA+zQ8qgtGKs
         OEtm07HIqmBMP9XTMMFh+DdhVgWtuV+RQQpZXlrGT5yE/+iLWIoXx5XxofpWFo64nAkV
         cP6yLkAAy/8nS55EnzaoQWWZAKI6fFMvcxsfw5GW0FL06NvE3VaRmG2+f2kT4QUI9IuS
         cXJg==
X-Forwarded-Encrypted: i=1; AJvYcCW5lFaaBQWgJj3n+qQW+z5FAXhpLZ9anDoQfJlPfINnoG+T+C07e0432BFfX63icGVui4fjJ/1eppMNc98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZvJ94FTTDAForFqmxeB8GahlXiHFn5OOq6X4VydpfgcIt5gK4
	kTR3ccFrc0DtjXKoJzCJdIyL9ukLHo0rI6R/78FCmI4Vxv1+qR+DveYRNu5c33fIUOM=
X-Gm-Gg: ASbGncss6mXWjGTl5PirTDsPq5h8xgbrx+FBPNJubnj7rfk4xcxHJf+uySDE8VPuFm0
	6fHc8NnDGBUlljjCpZ7VMVA+B0EToyE/581MWYWOlfQ6pDvsakTzEzN9HZqsLpahorcjmg++m97
	z6jw8mCdgayHZByfSoYoH3Nd4A0dTCMaT7XYH2Rgk62RSYdN0io3c8CvPfmIWOVAS0gMPCYSQgY
	DzAqwgolsEpBc3i+6mV3N7MktQuHVUagXcc6RSsYPpF7Op2/OOxz1F3k1y0AZkF0QNp8sD89Q8O
	y0j9zjItq210wdd9zZLgc6/N28Q+AqtLog3mRheGezc+IdJ2yhpn
X-Google-Smtp-Source: AGHT+IGlWnWcKpf5U7vBQYK7+MoavUPpMAOQY1NhDDr46MQ50TxSToGTpsPqf+nd9cPRi8+h1wIeWg==
X-Received: by 2002:a17:90a:dfc7:b0:301:c5cb:7b13 with SMTP id 98e67ed59e1d1-30e830c6247mr32532488a91.3.1747907122844;
        Thu, 22 May 2025 02:45:22 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2720b62e06sm4500463a12.31.2025.05.22.02.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 02:45:22 -0700 (PDT)
Date: Thu, 22 May 2025 15:15:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Sapkal, Swapnil" <swapnil.sapkal@amd.com>
Cc: rafael@kernel.org, shuah@kernel.org, gautham.shenoy@amd.com,
	narasimhan.v@amd.com, linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/cpufreq: Fix cpufreq basic read and update
 testcases
Message-ID: <20250522094520.22zwevl6vgrjf3aw@vireshk-i7>
References: <20250430171433.10866-1-swapnil.sapkal@amd.com>
 <20250519075854.opnlhjlbybrkvd2k@vireshk-i7>
 <8a2149ca-a0fe-4b40-8fd4-61a5bf57c8b6@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a2149ca-a0fe-4b40-8fd4-61a5bf57c8b6@amd.com>

On 22-05-25, 14:07, Sapkal, Swapnil wrote:
> Initially I tried the same, but it does not work properly with the root user.

Hmm,

Tried chatgpt now and it says this should work:

if ! cat "$1/$file" 2>/dev/null; then
    printf "$file is not readable\n"
fi

- This attempts to read the file.
- If it fails, the cat command returns non-zero, and you print a message.
- 2>/dev/null suppresses error messages (Permission denied, etc.)
- This works reliably for both root and non-root users, because it actually tests the read action, not just permission bits.

-- 
viresh
