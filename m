Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9E7207DEA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738731713; cv=none; b=qgMzv50wwrvmWDchfNX0GphP7+a1g7BzpPK7hZU23vR5eCyVcjwFhPxyzV42zxYUQnGZBSYQl05WgEoUZSHoXcXcGyJRMrvsuSzz4eEzDBoGorG0TwhbD0NriTjd4wMAD+as3NfUvF/fizGBvUh2C+LqYt4zUGe1ooDaFdbndJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738731713; c=relaxed/simple;
	bh=fwCHjFRk35mzj5sI7+uT1IUow+zrDz9kGdE/IzX1SzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rAycq38EgzQ/yX/n1EI6zp+WJp7dmoAJcPR/AV+SBuLhEy0rSY0Ht2ZrFW3L/vAIcputzkKR3umElkHztMpQhZ5amMrBKXhelP7/HxiEtkEghCyKIVTj1GEalCL16xhR42wqdwMw/uUSiK3lPHjlH4lqa4LR1zlIAyeSl5ZQv/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbbg5Boo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbbg5Boo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f1b2480a2so2865045ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 21:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738731711; x=1739336511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p0swfSSPD+og1Pzr3e9g725D1t2rKfUqhh/5xRm6XfU=;
        b=rbbg5Boo/jAoCrZcDMGrBTmTWachS5HOHzpWMVaW9OREBxBnWDScGhFhSbUHTLs06g
         8Qf2B/hbOw6e+GP29aT0NniVBnxozpqPXNyeZkW+y37dU29B4vdgCC8bRGIISfKy6Kg3
         rbk3tzV/0OdudVEhnZO5E00IaMup+zWd4+eY6U4GDyGKLO/jUEsdyknkIKNyWVegIns6
         ye2KxuLww6QTeBywpuYgEOu9GqyyhmygWiHUNwfzYfZbGj6PgR+8DNm6uLWiTz9k1CXc
         JOeQ8bi7yvl8tz6urYNJkQveSW7ZAGJhaRb9gNZwRKbKExT5ZoEWUHykdMB1cvxJ+4T7
         MlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738731711; x=1739336511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0swfSSPD+og1Pzr3e9g725D1t2rKfUqhh/5xRm6XfU=;
        b=kX/iFW7JcTrv8JsALdsjjiKse6jTavNkRLi12eI31WCP884WfWk1UXoLtPOtA6PWTK
         vlgGbCcDcYpAYRaFbwgCKr2oOU4AE9dTVHxhmyeWU4lNmMuVScZDuInglOplvmnCXlGY
         uv9PCxXD9lSS60kJqVPj/EwWXT+h1oiAjwHZzuq+y/2/3smVHkYPxGQGQWCMKDLKooBm
         4wx+Oo4Lt6ZStyAmNxDkQbRXMZn8dysmmkO8fJ+r6RxxuuLoVRVYqNqWJ2c51PC5rIqV
         C9P28z7AHfnV0Nr2YZoGn9fUOSDsYOQaZ4kwuxOy5KrPOqRJ4H1qeTFAKgg639oqZLNK
         jHFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXd2hHQbKy1SSWb2QwHwuqK20gZEaZCa55TNGE9sbD2SE0tWFs4uvUoAlQYYrnHL9QjbGWoMmIucU+/u8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZgqoMRkKRyhx6mbTshwvDacm+CAk74BLsdwnvixWp6hv0WYt
	bkmgMzjxMwe/17eo3pEzG+ygfYqAfYjgNXEgHZcJh9OQ1sne0zG4iH592M0iQJ4=
X-Gm-Gg: ASbGncvNHUIM/GJ+upBl0A54/o7xtw/Zs7M3LqzMVWLZPKfMpTqtxcgHx6uAR3La+az
	6yCTH8Xd+Nnog+JZXxCpE6O2HrvYe+wqQG9yzJaxGClqjDzfsQ9d7yxlNtlDiVAOXu99X20AoTP
	/Zl4Fh55PBBJXN3GBU3ME726hTBu/QRAx67kKjVcU79uUS+Tl4x1y4IqD+p6YCrAAxX3qhDBUtR
	FHRdgUNBGJyuChrbZObyzzHRcn5MEM3M41DX3AkLJxh/BXfIUMB4VJCea1TfZNiWFRAasPymBxC
	z+PnmVNco///2n3zrw==
X-Google-Smtp-Source: AGHT+IEK1SsVPM3FY80ZXjnzpYTsubF/iE9BdMFRWlXVghXMGUaasnmObK/mq0H2BixXG4K9ZJcJIw==
X-Received: by 2002:a17:903:2291:b0:21f:1391:171b with SMTP id d9443c01a7336-21f17f115dfmr31036995ad.44.1738731710796;
        Tue, 04 Feb 2025 21:01:50 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea495sm105426275ad.126.2025.02.04.21.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 21:01:50 -0800 (PST)
Date: Wed, 5 Feb 2025 10:31:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, rafael@kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, jonathan.cameron@huawei.com,
	zhanjie9@hisilicon.com, lihuisong@huawei.com, fanghao11@huawei.com,
	gautam@linux.ibm.com
Subject: Re: [PATCH v2 2/4] cpufreq: Introduce a more generic way to set
 default per-policy boost flag
Message-ID: <20250205050147.hfctwo6aw75rardc@vireshk-i7>
References: <20250117101457.1530653-1-zhenglifeng1@huawei.com>
 <20250117101457.1530653-3-zhenglifeng1@huawei.com>
 <c9e56c5f54cc33338762c94e9bed7b5a0d5de812.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9e56c5f54cc33338762c94e9bed7b5a0d5de812.camel@linux.ibm.com>

On 04-02-25, 22:11, Aboorva Devarajan wrote:
> I noticed that Viresh is working on a similar patch [1] as part of a broader patchset
> to simplify boost handling, which should also resolve this issue.
> 
> Should we merge this patch [1] and related patches since this is causing a crash,
> or submit a separate patch to fix this?

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index d434096b7515..7c1f7f5142da 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1590,7 +1590,8 @@ static int cpufreq_online(unsigned int cpu)
                policy->cdev = of_cpufreq_cooling_register(policy);

        /* Let the per-policy boost flag mirror the cpufreq_driver boost during init */
-       if (policy->boost_enabled != cpufreq_boost_enabled()) {
+       if (cpufreq_driver->set_boost &&
+           policy->boost_enabled != cpufreq_boost_enabled()) {
                policy->boost_enabled = cpufreq_boost_enabled();
                ret = cpufreq_driver->set_boost(policy, policy->boost_enabled);
                if (ret) {

I think the right fix for now should be something like this. My series
(which will be part of next merge window) can go in separately and
revert this change then (as we won't see this problem then).

Please send a fix with something like this if it works fine, so Rafael
can apply.

-- 
viresh
