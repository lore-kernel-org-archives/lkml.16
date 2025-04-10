Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D185A280CCD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280678; cv=none; b=D67cutGFKZiyE+PZnNcJPDnYytHdQ0D2Cf1eB4Bzdl9OX2qSTwEEK8pGLvYVau2VpBDMEjs7Gkw1l72MHL3CK3cYvZXBo5yP3pJh+4OzAhJnDa+ZuYvieuKuxOuIl5xpL02Sdv500QylyG8ZOKRg0viPsWDpusFyjlsDAgdEF9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280678; c=relaxed/simple;
	bh=4XYqEvw3pO3aeYAiEFs0J+jvt5iPOecIwEe31S/Ndpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4AwdvaRI2jWSIu49CD42N9NJAA8zjLM7CqFsEsN2eT81gKaK/oQLCHp67VmSJuFNAqZSoErluD5mqpcNeI7Csh6QmgMXnG7TZU3FLrvMqE+/LYVKh6zMnel2JgFk6f0VK9AG8UA08Ka0wgiABAr0JfUN5uMGh0/zwEkQu6EoCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0PPNX7o; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0PPNX7o"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-730517040a9so682236b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744280676; x=1744885476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GX68swA9HrxO+eJnfk16Z9K7ND9yYGB3bnUXxmarCAA=;
        b=Z0PPNX7o9993BtdNkIE1oujzCdBR6E2UFw9tovVN9RzM9QP6EzvuA2jcOFUVOhcx1Y
         gTP5N7UW+bBbcBw26uY45aldIgyTsgCr3AYeSgAW/mXUUSc/AcyTHYRmTU16oQaBvgVg
         6zdrDxXc9ohVksYgN01HhKfzoljdUuGDEln2iImsjnMoBreoRlkmak5Mu2hFJaKa1sMQ
         PUZM3Uy1HgVvxRSKYdPMebiGQngIfkTg5s/xLBd/sNL5ClcMfhU37kmNbkkw+xh3953G
         geWz1wskxJRZpuUY6AQruUky6iFzkOGueByiWBaVwPt/f5p7mwQ0OylI2Q1wu7xb2u2u
         n+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280676; x=1744885476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GX68swA9HrxO+eJnfk16Z9K7ND9yYGB3bnUXxmarCAA=;
        b=SjsAqpwoFaCgVBY9mGrgx3s+/bogwwPRdoEE2jso1qiRFSkmKQ93DBxdq7zCoS+Mxc
         kosBldXpiWA14sERETOX4DC8v9ixxlrbwG09cg5OPcPc2eF5UNpJ+ukjVUAavyYZ8j5/
         C4U9y0ZOka3CE+opeMxViezW3r+Suw4AOjHN4XPmKzhMgy6u3Ukiktry3N1WaaBW0899
         1V1kD8+6pWChtvrLvPqnla8tVoHwJGvDYZ+cX1diwwU2odVa0gCkDspyu8N5eOIX8X15
         bkEUGqilxPFgLb3AIOXkg4h+SDund/2TwQ8MRZm7XWBB3D1ZXInYxq6v0gBpHt3qM7lH
         GOqg==
X-Forwarded-Encrypted: i=1; AJvYcCXAht6WSR6ULyB6+Dmn81z9glhXoyYusLI0J/iEfZZ7s8/9uUFLUxfd9SvK2nzJRrWkDMjQH9sM1BGoQvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzpW9My9ZdYpqsp5Ftc5RaoibIEn2gfLmd6u+HWp42kD/DcUjh
	5N0nV6Bagh9G/bnM4EQGyCX2mOZ//S4afo2n6eBD4z3PfVvt/8Gn4gy0ey04KnY=
X-Gm-Gg: ASbGncseyPNpRDuATNjeyuvWpHq+jqQoi+kog30BWcALkFvc4sKGNMEmjumUOVCFrau
	Eqg9VOAXwbZqJI8lQAKWqTPYSBjEnbdZeekmVEzNPBIc8heWaJBiG2xNrbQbGgkB49tyv/LRM9Z
	lmgSfrylm4i6e3nGOzeIszi4gY8koHj3thAm9KrGU2TqebI/Wc4pDP2s1OcUeu/OfC05BsaHq8+
	fq+zvdqYkkhMFMWE7T9T4DusdFcT5byRbc941r2gDlks6VlWP/HwMQh6ct8Y9ahIX4arQGXftJP
	GpUk9Y53iSkuhlard4qBQAleTNfgqdo+dPBetro6pw==
X-Google-Smtp-Source: AGHT+IG2sLEZsm/PLhGsSjVJrT/g86UCeqGu2+t3DsfzOYJpMkwBlq4ZwTimT+XjrTeI9HudHDhEDg==
X-Received: by 2002:a05:6a21:329b:b0:1f5:7eb5:72dc with SMTP id adf61e73a8af0-2016944d22cmr3592752637.3.1744280675957;
        Thu, 10 Apr 2025 03:24:35 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b256sm2984539b3a.14.2025.04.10.03.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:24:35 -0700 (PDT)
Date: Thu, 10 Apr 2025 15:54:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v1] cpufreq: Drop unused cpufreq_get_policy()
Message-ID: <20250410102433.fro7cwxri2kitwck@vireshk-i7>
References: <2802770.mvXUDI8C0e@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2802770.mvXUDI8C0e@rjwysocki.net>

On 10-04-25, 12:20, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> A recent change has introduced a bug into cpufreq_get_policy(), but this
> function is not used, so it's better to drop it altogether.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |   25 -------------------------
>  include/linux/cpufreq.h   |    1 -
>  2 files changed, 26 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
