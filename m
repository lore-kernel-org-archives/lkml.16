Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85070213E67
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091711; cv=none; b=pEwPIqIeJM05yR1XMCGZtMGjCBe5pnH3UQXA2c3ZRT5/3CR7HBVWtAkOqxVI/fUnxuCQ3yW824TXDoJqywquCMjcmfmUf49n4h+iB+hG2qPAgsMlBZecVX6SbIxj42laKiqYO53qdm2xk+P7tMNYjGWpHyCJJDysi82Q3IDZaus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091711; c=relaxed/simple;
	bh=EufmTM1zhzstYC870JF6VYLrqWC1C32Ol14xs1Bdbk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzWzbGQo4PvH20LJa5ll6udaypOVd4eQkucGCkgvgzeNpG9tyaSTktY/2xb5FEcC+Vt1HCSyQMuvhOntBWxMHujVwa80yy0GGZ1FRa5ED52sgU6BGza2/aadW8TY8VjGie75W3U3AybSeOYOJSKnCgzIUg1NrVvxrYOOCimNGVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hn7nsySc; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hn7nsySc"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736ee709c11so4257660b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 22:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091708; x=1744696508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NB0nHoebXQJILemQcp89vOlxV4NeZBSLk4VRg3eTpU=;
        b=Hn7nsyScn9UBTXghNDxMP3oaTlyb3ApH0kJG3zL+Wm4+uJfJBboOPfrG1uIcasuWXP
         9J5+0hHiRqfPEcpVUdh9/8LV0Hipu4JHMUal4lJANhQAkl28lIb0LAxHum8nWqxlVLQ6
         Tg/w4l5iIY92RI8NvZY4wFQyUje1jOEZqLwEh/PVXdJeq5zjn5GCHMsEWv3TxBwLIt7/
         JUiUKF0EOvf3Gz5K2zqzIhVCxn3Qz3k0pI+8W6DZp0FJ49Z1lVbHRRwdyPJovqKoLNM0
         o6z3EWwFOZMP4xJpUjnwN0s9ysnUUGfWaw8ga8HxwJfXTbJQdKDSqkyGbpvjo0Vh47QE
         01TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091708; x=1744696508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NB0nHoebXQJILemQcp89vOlxV4NeZBSLk4VRg3eTpU=;
        b=jJM3AJCd67GLhuR4jpRqtz6RKgxeHdSdEIb42djvdNdBf3bn/se3UcrPbGkMhirn3z
         LKZO1NQpvsMEvc5Hj3chcV2KLoITQ7byuuZ4g45hhCeC1fEqzDLa/640I1zgYV8JWsH3
         40qxJDsjXJsaQrOYb1LJK33N7Tmcr9AEmnJPD9CdZDkYqhEyNAL8gabcv6Fql2KkbLkl
         CMDZ9qG0iHeJwV87uJUlyMxS5fzj7oHsJ85kG4SWPt5MkToYVhAPUcBdZp0wCwNhkwn/
         pxiB+rZxUGbadrmw00uQ2/MxSlUTES6XDH0TKhBNwLXLxpDAEPA1QLtwaIrHRvcoFbic
         1A9A==
X-Forwarded-Encrypted: i=1; AJvYcCU/U0IPhOKVs6bCeSGpUG0Zs97zocT4fYvHaTiX3qIQwIW67FUv+eN7i09BGoF812Xo+PbZ6wEQEhdpOMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrfHm0oj0R6Nq3ttZ6QGLACqAnIG/uFw1hXvfA7lrjenGZ88Iw
	aWuNZTZjgfRGBUSIqvIdNUtz4hHNf5OottxO4M9PQjJHJbAebY+8G4cPFG60xjVE9oVb116zamn
	3
X-Gm-Gg: ASbGnctq0tF6ULulWqYYLlJ8J16jRSaN1KhLesRLvKmN7BraiDOQZ5GOv6fm52mWCM3
	thX1w1Cx/LDvh+UVZySv6pV8enGD7fqsPHV8fRzdakSqjFHx7OH0x55jDpen3TJ52pOGzZ5+NGr
	n882rg5YVKsO9crYvVnOR3Aod4JNTB9YfnqKrTLkLummNNQ+IuiiHHK1DEdTBJQA+/7Z97xGiDM
	kdAtqjNx6nE4BYdvBnSZpAfQDaRAcWZkL5gDZIU3TwBe/ro+G8IH1Cx5VW51CvbejjUwiv1ug3t
	n3eub7gfzlJkyZg0UH4DC2VCHd2x5feFw+VSdZ+P8hyEvQ==
X-Google-Smtp-Source: AGHT+IH8/8MnEU5W15/zDVbhBHdpldSTqXJSklAXnGqc4WwlEqny15brb73QCGi2KHBhsKrotrm3cw==
X-Received: by 2002:a05:6a21:6f01:b0:1f5:7353:c303 with SMTP id adf61e73a8af0-20107efef49mr21361016637.11.1744091707768;
        Mon, 07 Apr 2025 22:55:07 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea0985sm9951195b3a.104.2025.04.07.22.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:55:07 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:25:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, cristian.marussi@arm.com,
	rafael@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] cpufreq: scmi: Fix null-ptr-deref in
 scmi_cpufreq_get_rate()
Message-ID: <20250408055505.oked4a3drsym46wz@vireshk-i7>
References: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
 <20250407-wondrous-turtle-of-foundation-e92250@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-wondrous-turtle-of-foundation-e92250@sudeepholla>

On 07-04-25, 12:30, Sudeep Holla wrote:
> On Sat, Apr 05, 2025 at 01:54:47PM +0800, Henry Martin wrote:
> > cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> > in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
> > this case, which results in a NULL pointer dereference.
> > 
> > Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.
> > 
> > Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> >  drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> > index c310aeebc8f3..c735f39245bf 100644
> > --- a/drivers/cpufreq/scmi-cpufreq.c
> > +++ b/drivers/cpufreq/scmi-cpufreq.c
> > @@ -37,11 +37,17 @@ static struct cpufreq_driver scmi_cpufreq_driver;
> >  
> >  static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
> >  {
> > -	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
> > -	struct scmi_data *priv = policy->driver_data;
> > +	struct cpufreq_policy *policy;
> > +	struct scmi_data *priv;
> >  	unsigned long rate;
> >  	int ret;
> >  
> > +	policy = cpufreq_cpu_get_raw(cpu);
> > +	if (!policy)
> 
> How about `if (unlikely(!policy))` instead ?

Henry, this change applies to all the patches you have sent. Also please send
them as a single series, as they are related changes.

-- 
viresh
