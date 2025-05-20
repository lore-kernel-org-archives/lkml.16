Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B45626FDA2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737189; cv=none; b=CyRTW7upcXaGd4ftx50kdhTuA5JqZGTW9qDrZhmPgLEIBGqJ9mqQkzi68Io6+fWa42lWslGsJvbU2EudAFDBoz0/S9lUf0yvHTrXq9h+ngvEpLm6eXRKa1hUD5qkzDZ1mlEaxbTNLgQt5nNXlka+0BZKKcqZRMiODBOPDX5+ors=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737189; c=relaxed/simple;
	bh=Ltw5M1lySmrMauSrqTCCb0ZHHbcTroNTLc7rS9O0Oms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ox2dH0XnnsQsZ53Uc5lQNVwvuyHeOYXsbyujuySYkefkCIDGXm2kpXYpiSWBSXiCQOBn7/0wIWB3O3KooDD2NVHaQuG+SvTY3Mmv7KBg+TP5fUKOyZeoSwggCa/41UJFGaPmyvbdgzma3RQmZNGmWdiD7MX0UBtC92krKOYpCwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nKEAvyTn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nKEAvyTn"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30e93626065so3218800a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747737187; x=1748341987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2kiU0hliZX3M+Z93vHD55Gq88AD3oRKFF0hgKdQy4o=;
        b=nKEAvyTnJCQ9CAKW2m8fgGQ78ddTxEiCCDkeGyAeNf5lq7PgtRcHt+CqEIqgWp6qCJ
         VnObKfFen6GZeVK4cYDIyYL9BhMfIXBsAkMbP/l5y98UXj1qnC++oT4veeN6o5VmGYc7
         ERj8J9JLAx2ZmC/FHohAfIcYayNitiHAZkGJKgKvWUB00fK+doJig09HQQJyJSPpyVGm
         V58qLWhYBtp4cA4BU3RpNhb3VHo/6LZ57qIAXSYz6C2muMrxbJ2WB5acQRQvyFoaRInq
         gl8z30Ubl6b3EDhGtnurGSr20hamNgudSLC+FaJ5njzdSrIDPpVEIZ1Yg1A1RXZ4xrIj
         TwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737187; x=1748341987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2kiU0hliZX3M+Z93vHD55Gq88AD3oRKFF0hgKdQy4o=;
        b=UQw6bphPkmGwvevDTXAthiyc5NOb6nnwiQlwV17EZRbwoTq6T0bKDh/nIcJULZwTjT
         LYxvu1M2JB43x2JYHCLgGqK8ZTsziNx3pWqxfqe/T78tuh5sVAOOUBYnXbsQzrDcpVLB
         m+0GMW2GS0DRyDN/q//nGTjN1tSyOhJ4mqqyxMBam1ezFcmof0Mh5z3wqOoGZOk9a9IO
         f/CC/dQNUv+zV+SFi6UEWa03Rt6PzmdgdDcPh4mHaBbq5o2T7i8LeNaujmD2Iw6T/JtL
         ToIgx+dkr4WnmU6j87pQV6f15dYMIF5W5ufACKyo6TvxGlhzSXgZfpcWd8Vp9YDVh9wU
         nlmw==
X-Forwarded-Encrypted: i=1; AJvYcCW4yYTHRfFFkKiLCb2a5n1MNwn8QNnTeeeZVDLDI7wAzm13/mon2qmWw+NTtsBfewsJ0rz6ZBbz/rxywT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxskZF9/JRpsw3z03Q/KVVsH1YOV58ODde5kGxqGb62Sug3jVbb
	sxCVAW60TB1K5HvL8fnjyJLWI25WUkAgb48Dv6G3lRNZ+bJ9GR/0akBYeCEUaHh5z+Esa9oCHnr
	2NWZA
X-Gm-Gg: ASbGncsWUITuYG3wi2y1UJbZGCqllbdtm1I6a3KuoAMRt38OzegaiIL1k1nf10UdYfg
	LVQgvXdJIa5aOpKUUBl2G/GED/OJpXtE7aRdeuSKtzLkoICRY8xgklic4FB2KJUbK/tvAByKmqk
	e3O7c2RQSRAZX+jW2+L+veJVdDCZemc8FW/SewboOig7HAaB+spCEG7FXqr4f9wt07kHiIuo9Rm
	veplnesS8aFbJJej6d/Ccevw/FIANIA+K/ttDQfBiJwL6APUVXmCmU+Q6HEhJ7sFqyYxU3TwXuC
	WEAUWYAbJ6IZCwr/JRsivU8ehxUbtiF2IMSt8edvwXieUj2oqGzS
X-Google-Smtp-Source: AGHT+IHm+zce6wVGhmj39um6VsmybhdOdhuKQ+lb+Ma5CrUm2fVpCacBPSaYFhoG1FApBOr61KuRzg==
X-Received: by 2002:a17:90b:48c6:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-30e8314cff5mr29948004a91.16.1747737187612;
        Tue, 20 May 2025 03:33:07 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm7772574a12.48.2025.05.20.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:33:07 -0700 (PDT)
Date: Tue, 20 May 2025 16:03:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Aaron Kling <webgeek1234@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250520103304.jfevon546rft2ncr@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-2-d142bcbd0234@gmail.com>
 <cd801698-d7cf-4e9e-aa01-5525f8687ab0@nvidia.com>
 <CALHNRZ_9tMi5iihyTsEuU4T72=oTQM6-rVhqozzLf9DiB_TpcA@mail.gmail.com>
 <CALHNRZ-pu9HUzVyR3-U=XZKFFZPnn5-DNLWPqPx6CSoW0dHMrA@mail.gmail.com>
 <bc0a4c75-df5b-4b4d-9c9e-a2c99d3f4f6e@nvidia.com>
 <20250519103749.falgd64ikkwkfpg7@vireshk-i7>
 <9a15ea89-5e33-48e7-8c75-b041f6832bc1@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a15ea89-5e33-48e7-8c75-b041f6832bc1@nvidia.com>

On 20-05-25, 10:57, Jon Hunter wrote:
> 
> On 19/05/2025 11:37, Viresh Kumar wrote:
> > On 15-05-25, 07:41, Jon Hunter wrote:
> > > Yes and that is understood. I see a few drivers calling ...
> > > 
> > >   platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
> > > 
> > > One option, and I don't know if this would be acceptable, would be to add a
> > > new wrapper function in the cpufreq-dt driver for the above that other
> > > drivers could call and that would create the dependency you need.
> > 
> > Doing that won't be a problem, but I doubt if that is a better than
> > adding a soft dependency here. I personally felt that the soft
> > dependency may be the right way here. The cpufreq-dt file presents a
> > driver, a device can be added from any file and that doesn't require
> > the driver file to be inserted first. If the platform wants to
> > simplify and create a dependency, a soft dependency looks okay.
> 
> The only downside of a soft dependency is that this driver could load but if
> the cpufreq-dt driver is missing for whatever reason, it might not be
> obvious. Ideally it is better if this driver does not load at all if the
> cpufreq-dt is not present.

Fair enough.

Aaron, you can introduce a helper like cpufreq_dt_pdev_register() to
solve the linking here.

-- 
viresh
