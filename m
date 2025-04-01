Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EFC1EBA16
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497206; cv=none; b=HXK9pVYmGeZGbBVtV+Sc9e4qs19OPrnAg4twSE8vSRtpY/Xsf+hiWi0jU34WxGZ9WirAQm9Cby9B21taDAWk+Lf4aGO5vv3B1V20REA3nOCfuCzuvWyfRMucaUhyLbYMn4/NeAFRrpBJpovb7eTj9X3MkvUIOK6Lg27A2TboZDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497206; c=relaxed/simple;
	bh=5exalRKwxOCRfDiPsvj9Py5BGi7vRegOhGRQqcYzjN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsFWBoSJLpyVPFEX1shwuD4G+DzCJEY2jwebaLzompj+/NNBOWVlIuThtbpWT5Cxj+T830CBvogyrLRqwePXxEEKi4Eyr712msATC/vaST9orriqsGRQAlJmo0VLg8c9VIIbo0KBYKv2QvM2ov5iQape7MLomDJZF1bGOoGZOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLX4JV+5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLX4JV+5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22435603572so98716825ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497204; x=1744102004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86jslh1o/1gpjSTp9VBDwjU9RwO/decJQ7t8te/aUj4=;
        b=sLX4JV+56XfW3lmcELCsFLUXnJgDr6Lu9iOID7/gB0PVOaRCNNgRi7qXsNDj80m+oC
         v4vJcnNcM5CTm0v6uZzu3wT7o9VXWYSTmDtWgkifyx4TH4+1Hl/X0GsMOyf/TTvHHsZC
         vJn2qZL/eZgfjt9QsB7rPOaRrbnY/Ko+hIOswqtfuGLb76HaQG285bMzFc3jAZLPXiN9
         U4Ttl4iHQjGDFBMLnjPmNa2135mI9Jn0FW/TkkxC2JV6EaZw59Nmmqoh4nW6RfWTzDZ+
         N1yZ1jJHjIjwVqBCU711dEFoBP2xU/0+ntHZLlymskivuLpF6MBQxE8yIeZuDyQiNUEV
         g1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497204; x=1744102004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86jslh1o/1gpjSTp9VBDwjU9RwO/decJQ7t8te/aUj4=;
        b=KorpbrXFi5XY0Wcju+IXFT7ZktE70b/AlOddOfNBrvVIT1U5hmB1wejvpfZBhkat/A
         MAvemG4gGpXfx6EuXLu3WvpkmYsMZN01BXFt+CEh02IE14+1/4XWNcUC2xBN/a8NumCf
         i9nR4bIV8mtHaZ3/cEsgz5Dhcki+9yB2HheyGN6Ukf9rlsIN89p6umAG1B4FoI9iHG2o
         Vn8y48knh3MQ2skbUCQ/INxPIACT1O4IIHvuqdb+z/EtljGm7lHPtfKvyRafXUpM5hp7
         vWA81GYKVfAF//jrlZi5oroWeqvEj7f4r+3rNkf8WRp8yyzgjLRfK0YYkS0owX5VTGqe
         zmyg==
X-Forwarded-Encrypted: i=1; AJvYcCVapdwR3zONZ4uV7cXT/nnkx9UAYbNj1S8c/3wpzVVmAn0UZwkfrpyV4mK74K8pI+JGJgYDQNvMaPAYteM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9gM/BqxzJ0R5Aj8dq6T8j4j5gIX2UmHRZc/rrRQ2jCJJC88w
	5lXIGqS5brFPZt4Tl8ToyFNIJ0uUOaAf1TL87/CoE0htlIyATK7Dml/xUW4dtd4=
X-Gm-Gg: ASbGncundLYL6Myaj+vKfP0ZEHSah/rxBtJZ4T7/ZP6vXfJlo3Yuzxb7zorSamIO5lX
	p8bs3oaOEynk+SSoHzrlvwcCM9AXpjZUI3uRJ7+tr+wrxfKzx5rRk5tx9WbmVRM/HNbV2hxgKoG
	PgrTGL5l/EwG7WXlcY4XsC+1bRyNHXQ36+A68vsD/n4+eE+I6Bf+FUDMnE82k1A/CQOyPv+qd7I
	aZaEMhFOj18+9d/VgMs/FhyW3+0hdk1vMaa2bUl5vH19ETekx9L/UvvNrMf+zNOjjC5ac8Rs/9t
	AJhmIWVN1Oa8S/93D6b38p58Wo/tkSgqwOHl2VdiDjaHqQ==
X-Google-Smtp-Source: AGHT+IFCpZR/bE/JG5DjOeXH0lmF0q3PgXI0eTKM+GEQW6T6GqSJsneEs5IpzvDV6w3X5HIQVbEBpA==
X-Received: by 2002:a05:6a00:4b05:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-73980323564mr20129051b3a.4.1743497203779;
        Tue, 01 Apr 2025 01:46:43 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710ace02sm8374083b3a.150.2025.04.01.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:46:43 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:16:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v1 07/10] cpufreq: Drop cpufreq_cpu_acquire() and
 cpufreq_cpu_release()
Message-ID: <20250401084641.zeljsp4w5yxkdbna@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <3880470.kQq0lBPeGt@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3880470.kQq0lBPeGt@rjwysocki.net>

On 28-03-25, 21:45, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Since cpufreq_cpu_acquire() and cpufreq_cpu_release() have no more
> users in the tree, remove them.
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |   45 ---------------------------------------------
>  include/linux/cpufreq.h   |    2 --
>  2 files changed, 47 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
