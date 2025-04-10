Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D031EA7CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260033; cv=none; b=lq4UriG55C6wEsEJJFeMCn6JdvBtd/kv/h3ZrLE5Tt9mICtYWZ8cptdBW9zPxv7XgblwpsExQdKZg0Wp81tDcLgQpswDYNxJnEnR0WvtFT3KvMRaxA8MVmZ4MYIMl6c1eWkNKASMysCrkzh+MVDyUUe9EFfL/Ss888AQmT+CeWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260033; c=relaxed/simple;
	bh=sWxyNmIBqTA+5eg4r6AJzmQjZ1/kjCXLuDHCQiD2z9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVnuugyjU6/r5TueDQllyUqaU4g0uV2TATb5H6MhClQaxDDqOt3hKkDPEmEeSeNW9JSHAXMA2Wh5MM+U0k3gg/TkEZdNjF1Pp23IV1+5seBLStUlLeKGn+R3ZIHJo5UapRJ1KoTH73w7fxO/fF49ee25hkMBZAyDXAv7T3pjtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EkX5hOhl; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EkX5hOhl"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so345343b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 21:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744260031; x=1744864831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rG3CCHNXzkVc+H0+6PfQ3HiqfTyNzLew5Fjjk46m/4o=;
        b=EkX5hOhlLGIODHxEPIUL5xlxnVzDher1kXi333crloEF1s+8//P3ZLRWmjKP7Kx0u4
         wbLe6zwkFWngTIkobX6Kr/wkx592j5lJWjoyH5JcBHN3dN+QlV3VuPzvtZEY/qV7dPGB
         pB6cUcYFYjQxXQ3OzLvIuOMrPZCeOJtDUQkgAw3TTqF02DT9cP9mOtYZFhJsV2g/U+9J
         1HLnC2J4X8YNIa3OS8uQL5AxEEd2niLeVLo2qbLxYt8readWsoqwFZtquxYnnrwSVPat
         CmLiNPbfiRkHUpqeuEidKGJkQPft5QfHpI4x2YUJPVlTVOLmo2SLunSFVxKsXxQYae90
         9vsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744260031; x=1744864831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG3CCHNXzkVc+H0+6PfQ3HiqfTyNzLew5Fjjk46m/4o=;
        b=ePopBDyXk16H34Dtgqj8INcLs7lF8LQS1WMJFHitxrpkaukkeMRT/AkeMT0x8Ieb0D
         sAE/gH5g6t8H6wjGtl3vRiYA2Dn3aNG8OhwvHwuEpgi8eSFtl0p6eTODT1rPZDdqeJto
         vmv1mwOmKSWTmIlQLkT7rZQeTYSh0ZRmtx0BRbvidtwW9CC/Y9zk7IU4pGVXL2rLtnwY
         7r7yNQ/mU8mDrVZxYyMXEfOXx2zIn7pwmxS+SID7rhTRcRX+VHwYZ4s3WPdsZBT/qQ+8
         KQmOszfuM0sZybETAbaNrskpeeIx0TzRk3EWio3X0ktp2r3fzZj/UoIAufMAdpASz/95
         XEdw==
X-Forwarded-Encrypted: i=1; AJvYcCXN94j1/9xTytSVlrksEebTdFcEqmtmL41Ay+1ZM3BksswzLhU/FUbIJQcLN6Jen/WFiIV4NbH9lIe32ls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzousgzl95QePeeJ1Z+LUcNQi9MtNv/I4NxonRwZVEVDIhPwLkJ
	l9CQLL+YV9Us/G4EVpjp2BMu83yDy4MmxcSnzkpAdAkQ4ugDZJrn67IdyYl5jQE=
X-Gm-Gg: ASbGncu5E4w7bWUNDgu4tOTzr8tfTjkO2B9DWTvq7hAQNJgGDBFTj/ynIwU5zJe9VMA
	T6I9SCec+qOyutYGExWXv5YSq30P2PwXyAoNMfT9p/n13dLdHtMLRwcl/jXnc4vVOCmCrV9kgyq
	9k7AuPeKt8oTwKHGc52bKPHGGSGZIyBDasZB4CQOzlFaPgoMKKVEEZtMj8NrW2SS4vivLlQCkoW
	K8GGvdhEQ+4CV0BQmmC9Poi0nCqZzHKi5EeKcXK/WUBRikFmWPAOLBrGV9fp2k9n1r+T14fsDXx
	NrHvlfjz6fwVXnuaYzuynCbawEixh1tETJQysR7UkQ==
X-Google-Smtp-Source: AGHT+IFgRbLrUZ9NDazqU3l/f+bQGBqmoIwoUvJFi0i9jATU+nvyQ6g9ESyfUs7smCpWRcGzZPw3Yg==
X-Received: by 2002:a05:6a00:178d:b0:736:a638:7f9e with SMTP id d2e1a72fcca58-73bbee5477cmr2498194b3a.8.1744260031291;
        Wed, 09 Apr 2025 21:40:31 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e694efsm2272421b3a.164.2025.04.09.21.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 21:40:30 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:10:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference
 in get_rate()
Message-ID: <20250410044028.ancslars65llmgck@vireshk-i7>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408150354.104532-1-bsdhenrymartin@gmail.com>

On 08-04-25, 23:03, Henry Martin wrote:
> This series fixes potential NULL pointer dereferences in scmi_cpufreq_get_rate()
> and scpi_cpufreq_get_rate() when cpufreq_cpu_get_raw() returns NULL.
> 
> Henry Martin (2):
>   cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
>   cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
> 
>  drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
>  drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
>  2 files changed, 18 insertions(+), 5 deletions(-)

Applied. Thanks.

-- 
viresh
