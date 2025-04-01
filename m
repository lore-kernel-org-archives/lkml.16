Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517C1EA7E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497512; cv=none; b=rkbOrNkk9YUMegz1FGg8hOR45R67hTvjPj0oi9vsCVAWgzLf9rbb/ZD8JV/11VqN/nyEIFBuKjx9jqHGwtINiOFwHc7dvedRku82MudH6JOJlbpTlne//DpMSc21I2Fc22k58iC9A80eCGtsPUY17wgQAqt9F3XhYpNhQLW5T9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497512; c=relaxed/simple;
	bh=x6eisvk2cJGS8K29x6eaCe7jHM1Q2xOlDzvGsCO0Xwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O51Js3isRUs0oTAD9KmnBWDOmR6ZN2DJ8dHvYnUgQzX6KeIVIJxEuz9CD/9mZ8FuAI1+gS5U3UZBwpBMmte2qJjiYxa9Tu8hulrSP2QZmDAoYc3NAB+k+2h1HaUTCQrewVg/AVlONGPoHahhahfU3m+qonadlHOJuFRArjHkReM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnBhE9+6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnBhE9+6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227b650504fso106007795ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497511; x=1744102311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fimhb3OiftX9ZrPMTrOvtnWezcehgOg/R4ZHIiHVdAM=;
        b=fnBhE9+6ify8n0T0ac12yQ7f6tN/oWZjxod4E4myqEhc2p+nNATqixQpzY4otTeYSm
         ATWkG+/T8WFlA1tDosYwYDKc2PDP0nfEgg4GYratGm2VNAbOH9G0O+GF483/DMbnaioZ
         1tWlXLkLzzFpuzHxJ9Q/6AZH0a56MvUtqNtnMHhT9RvWXvMlF0xiZ5j0s+c1oCT2s6Z0
         qB67zZt/yVZjc9JZTIUebbL/K9ULzroYrCNSIvaIj5tprPa2G9K1k0U65I8AEoJqwIEL
         cs6qkXW032ctzmqHHTp1fCFlNr63rzoPA/tV333zL0kytUuo0QLoq9Vz0YKbzrFrnsVt
         afcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497511; x=1744102311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fimhb3OiftX9ZrPMTrOvtnWezcehgOg/R4ZHIiHVdAM=;
        b=LAnh8LyARpupI9nH3Qiry/rHorEKMstc+Y8LD3V84MD0w2BNh2XdbsJrV1xa8qbVuC
         xTk3u2NskY2vIjKeT00w5Z9+9/+mkycaQdMdVCWMgj478H74yq3UI/azEHZaIgjoqyx6
         tm2dpEZ2xSMVXK3KQ12DN4XFvYFxGKUcRd9/RIyP89wovg9/RM1PNrU1oq3+MdZWxtRg
         zCIrhIQ9VgQMnWo8067pbw0k1OTzyKNHfonIDw4+WEmSySFM9Tmp5nhtc+BWEG5ZnOH+
         BwKLlAwxsxvncNNqIuheCCU1cn1UtU92VTLqlRyeJoGR0jkFw1BI7oOn/nakmoGd5HvM
         rojQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhEfHXuCPYakE78+kURcQlPwHcnUeKhSUCO1pqksdCLO5VpFy7MM4DXQAf+0vKBs4xALdR7Wi3sU76R6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLlgPLwIy9DE/VpuNjZX2GsqhOf+1XsRtnZhVhflgIs67E0dU
	wuW7JtCIfkIFCSatefltB80ea6p4Si5TvCKg5vGordb8JTRIjPx/rEFshGJTuxQ=
X-Gm-Gg: ASbGncsJAILnkrA/g0wH4lV+/t/gAmR9ztbbBtRm7o87wPR8Lke/f7Qlfx7dt4kxg/c
	fgj489TvU7Oh6rMJBf1hbgaGs3zNR11nVwvAFlao5KT7CiykbLMeeFxy5PK1X6tnxApoul139AG
	+7Tn0L1LQ678hN2pHYZwerqtqHIQqTizVQWE0BK/az5uRCAWC4ll3nTW5No81I30Nf2y19DIa8Z
	mOqon4AHZ3I2Q2K+VJnqQVl0xSeCAL98+Dr+RfjchkMW1k/rid2Vx34fRMvDSgE9BJh3r4bwqep
	ZG6IGBoT6D/mE6QBIsBE5Y/P7GsY3e8zpWuJOyAhUq5x8ou9SSMx8XH2
X-Google-Smtp-Source: AGHT+IEZWL2EWRD1CIAPFGd1IkcTOC2XDgPmTeYvR58PBkc2Qxqtz/Gc4AEcldb3r3efH6tSDVgjiw==
X-Received: by 2002:a05:6a21:3408:b0:1f5:8e94:2e81 with SMTP id adf61e73a8af0-2009f5c48f3mr23008466637.9.1743497510684;
        Tue, 01 Apr 2025 01:51:50 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b67de77sm7629402a12.14.2025.04.01.01.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:51:50 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:21:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v1 10/10] cpufreq: Pass policy pointer to
 ->update_limits()
Message-ID: <20250401085148.xj5p6ir5lkjhgwqp@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <8560367.NyiUUSuA9g@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8560367.NyiUUSuA9g@rjwysocki.net>

On 28-03-25, 21:48, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Since cpufreq_update_limits() obtains a cpufreq policy pointer for the
> given CPU and reference counts the corresponding policy object, it may
> as well pass the policy pointer to the cpufreq driver's ->update_limits()
> callback which allows that callback to avoid invoking cpufreq_cpu_get()
> for the same CPU.
> 
> Accordingly, redefine ->update_limits() to take a policy pointer instead
> of a CPU number and update both drivers implementing it, intel_pstate
> and amd-pstate, as needed.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpufreq/amd-pstate.c   |    7 ++-----
>  drivers/cpufreq/cpufreq.c      |    2 +-
>  drivers/cpufreq/intel_pstate.c |   29 ++++++++++++++++++-----------
>  include/linux/cpufreq.h        |    2 +-
>  4 files changed, 22 insertions(+), 18 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
