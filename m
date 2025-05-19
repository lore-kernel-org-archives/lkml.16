Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA8244683
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651074; cv=none; b=RR8YwofkmNbR2GayQME9/q+0dKP/tA/0jxsgBBMs/yg7Q2O0TvUDKiJ7GW1J8llBM4bbYf2sbzHHnFf7fa3MR1PY7XNlL8KNz9f3oZz5af4UN4G0KilIxRB8fGopxJM82mGC9zV5gvlSMpF1Qm3hLlYtkD4ir2GBOk+JCKoDZRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651074; c=relaxed/simple;
	bh=CYlV9CLYvoive18TMEYVs7/LkzGvQsIdzdQVcJu7xe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTZDWokM/v556mkcnXyGJ3lhr5SmYR26n5LaIt1CViyYxL17efWB2UyInj4iSKzTAeTjZCaPdtn8TLhJRMup90MjV2IfS7lgRnL/FrnhXR5yIAX4wtn84VDjm/jsIyTJiCgYvIx1y8Xc5MossFst9NcHydkvdKJtPU+FlhImKnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dt+LUwQu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dt+LUwQu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2301ac32320so45419695ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747651072; x=1748255872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h32e2BQV69+h9ggyaurnDkl9qtPdiXdzx6cpgPcqSUw=;
        b=dt+LUwQuPNx7aElzMIalz7qXalngMYdmWslQMjO/1vlwILEwxBk7LvI8nYFnFIa+iT
         X4B5ePHs9Jmd9gjs33s4pD7PUQ8US0UXuXOA/OnCtCWHU0AyBN3lmypGsVsul03FvTzj
         wa/F4q3wnMzGgtIGODReknH40hzllOhmNXxl7ocizwULSTBNErW39HsYPnBu5j2asfi+
         QzUfG7sZxjPLDJHpfX4yAGJLZ7yIWauCOWixToPpbQv+fKIoVjovRQ4rh/7k9Wj7moZx
         ie9ZcvzVZbaeskTIyJ7ShL/deZ59xK/3wSo7h9LOjY8qHcxnB0a9zBmmp3xXfX6LHMbr
         AX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651072; x=1748255872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h32e2BQV69+h9ggyaurnDkl9qtPdiXdzx6cpgPcqSUw=;
        b=E6CaMhrlUz9hOlUQl/rPUWG4ruUz2Zy51zsmf5utRTVY4vyp1bIRuPz3YOpr/gMc+s
         nihRWl+3z1G2S+tOUm9y7cCPKOOAb90eqtU9TEhz9cgw051yJki22MrgeZAmkzSvdRUW
         NHJL6XfzgNpTqFyAP4/6sou3bo/6kzVthm6t6w7OiZM8cG3ZgI0wlvM2F5pjUmii6D9y
         n/c2GhzUawDjImB2/9urnQ5i/qxFls25UuKcYF03vWVusFDmq0UBWB1SYttWhFFu1dG/
         4uEzswVPI0/pS1IBcC3zDJxVEpWQjXPylN8jhNwY1ActT+DbVp0pJdFNWtI/Gq340OT8
         bodw==
X-Forwarded-Encrypted: i=1; AJvYcCUM5ozJSzV8wX5+BYOvaNU08JIHfzol+NxlT5Zw138OVmwT0buJ0gRdoy9Yro+7byCIEWFaLlme7TfWhRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmEqZOJkMLCnjYcf8GijYwMJ1B9pIqUXE7dY+/5WhqoNn4gd4L
	Owmc2WEIK9Fom7lug2DENI7hsqjJ/XRKjg/51jAEwybIPB3+tPnTE/FZ7migZdcv86m2w38/bRd
	BirYz
X-Gm-Gg: ASbGncu7cVxwTNKYT8sg4LMUrws5wBxjK0bM8XQbowpnsghIJr4zmn1F7YbiCPFfl3d
	X6FHrjZrtHbDp2VwiClHZ00t/LB/W6afHeFzC0SNAYW0SrIlD0dlUbs7kDzyDN00mm7CNbgyOm1
	FpuDKHjNwmy3IguQhlYhLNY4lrPpBn8dlYMZefhVE9hMFIusJ21ZYFQf1taDopoOM53c4ijXB9C
	nOKsggZX2DzaADm/1YeWjs04KisV6/oIALPQVZQrKFElaa30uV49Q3eH69hm6kSKu9jS0znS8Hz
	JNsvkRvRSGZD6NatpUBAOkOwdbo0AjGykM1xHcHx0zMxlstIjCgn
X-Google-Smtp-Source: AGHT+IFb5F2zp+fI9VwhFVQAtomdvuqefNSzeKLT6FS4Ynv5xJ69Dqg7+OqDltzfck329MPnHK7hJg==
X-Received: by 2002:a17:903:124c:b0:22e:566f:bca7 with SMTP id d9443c01a7336-231d44e7e3bmr160367575ad.17.1747651071759;
        Mon, 19 May 2025 03:37:51 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4eba345sm56864325ad.166.2025.05.19.03.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:37:51 -0700 (PDT)
Date: Mon, 19 May 2025 16:07:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Aaron Kling <webgeek1234@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250519103749.falgd64ikkwkfpg7@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-2-d142bcbd0234@gmail.com>
 <cd801698-d7cf-4e9e-aa01-5525f8687ab0@nvidia.com>
 <CALHNRZ_9tMi5iihyTsEuU4T72=oTQM6-rVhqozzLf9DiB_TpcA@mail.gmail.com>
 <CALHNRZ-pu9HUzVyR3-U=XZKFFZPnn5-DNLWPqPx6CSoW0dHMrA@mail.gmail.com>
 <bc0a4c75-df5b-4b4d-9c9e-a2c99d3f4f6e@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc0a4c75-df5b-4b4d-9c9e-a2c99d3f4f6e@nvidia.com>

On 15-05-25, 07:41, Jon Hunter wrote:
> Yes and that is understood. I see a few drivers calling ...
> 
>  platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
> 
> One option, and I don't know if this would be acceptable, would be to add a
> new wrapper function in the cpufreq-dt driver for the above that other
> drivers could call and that would create the dependency you need.

Doing that won't be a problem, but I doubt if that is a better than
adding a soft dependency here. I personally felt that the soft
dependency may be the right way here. The cpufreq-dt file presents a
driver, a device can be added from any file and that doesn't require
the driver file to be inserted first. If the platform wants to
simplify and create a dependency, a soft dependency looks okay.

-- 
viresh
