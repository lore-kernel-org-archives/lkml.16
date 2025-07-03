Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576F12E9729
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552656; cv=none; b=AUM+b2Nk4ZTSZtNTczVw540qPYh3xJEEYa7MT66fA0ghBG6cxv1Dd7ZLxYMfqE4Hb7KIfRc0lHb0hcvMxQjSf8SvBjjoQVCn916lRGVoe6icac2EsCL+8nfAT9Nfe6z6HwLJeg47Jh4Cr4aKqHuItCheHZtRhn7NOVzVyEYMSMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552656; c=relaxed/simple;
	bh=HOiTBpfA2N2ftOatzI25hY9psuT0tFJdKeTsCD4ydQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K60SkeHWXe6myKKhi5riNfsVIZRjzHizeKGzIMbFm5W0N4KghVoCxOVk1HwB26fwPowasKN9z546g26l27Swu3dmPg8nj3KPb9WOsaDmpewJSYY/6AvhfVNElAmtIJUAeB3WsEkgVdEGql34Q2nj/KfHKn95Tepscy2Zasa8nWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V1VcMRo8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V1VcMRo8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so708868f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751552653; x=1752157453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=estor9ztRnvqCRmKob0LoTM2G0R/YLWHt9eKNo5/NOo=;
        b=V1VcMRo8SyhWTrLUcHVgbxC7K5wxQmFh6KkaL524V9Z3JQtpzsHi5lj+k89VSnO3Da
         +yVVHvzX5v9fKLL1AXyCb1P93k08y/On/2igjvnnenmfKGvUit0V1olvSrKwZL4r+fcH
         iNcn3bFU2C6H3aiE3bWKlMRycQm9mlV4XJ1pepNmRPAzHEMCPXLr/viS6tegT8xMJIbK
         AscpFd486zRVpeKF/Ic4lHCMspuFHUQq+BntEhe55PZaZgzcrxYBQ1cM4OE+RYmJ07f1
         N0qEpQDeH+n0dwFmgRVeoZr3N2F7q+yTlAtiSShKybG/Yaq2fbC8+oRWigIAwAQqkm4h
         Ttxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552653; x=1752157453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=estor9ztRnvqCRmKob0LoTM2G0R/YLWHt9eKNo5/NOo=;
        b=mvqItBSHbBQMry9oVZhVxLqbDHXv4uanG56F2GEDQCyGuQ0vvrL5g57SFXACekX6su
         bE/wOgTTW6JbWRvjZWOtSqCf583kgmMy3GYRbeVy9THEYqQBryJ9Nr63tvDsiDYbV9Mc
         I7tFI7w9h8JeOMfoPHLpo3IE1P1UnrUz4WnC7uQeqtUDbMEWNi+kMrV7boi00OtiQSyZ
         /KAKqUTpDqBXVTmU+DrOmZDAkum9M6ShBNEWTKDQwXd8sC+eVp03hOBcKqnll3W4z/kv
         aK0jUvYuGl2lvXJbIes2gGJdpM63OLHNkSZQsOjt+aq4SRs0YICQVZ6s0BisPIbcIlhx
         OIzQ==
X-Gm-Message-State: AOJu0Yw8ExQFofr7Rpau9z0sSyBZhxiHcxocBZBDI48628z/NP/i/yxN
	tUlMMMf3pe6Vmxh+asbPioDtiFEhx++JeWfGN6v8W6bsSSwIyoDljIJKTU6Qqta7shM=
X-Gm-Gg: ASbGnctsoaQdFZP3kK4nD90p5u24x2mewxHdvBg34CRP9ZWwfsII2/Y7jJhBlmCLzF0
	dtVA1ydFWvS1xx3hUJSJDU90v5MKzAnyPAWiXeOfOTToXG91UEKOQQnuaZDtfcg98wmQi0yoD9+
	Mdam4pn/+khBQDP/PGAgaWodMNm4uwR9vqIQCOOf2nXJA8VhJkkU6AUt+7M6rjKNs+MHUTz8oyY
	/MCorVDroTIrzxW/sz96fOgscN1PMuYrYtdUlsnardxlulM0n/tQI+FdnLZlnlX9LTKI0Yl0FK2
	7QV+UQvula6x3/b4hVuY77vzDs9uoWp1n2JaCGzn/nbpp3SKsowZ8gS3hORVBIKbXeXLPF5I4lW
	9DGCpObddXg==
X-Google-Smtp-Source: AGHT+IHh5PiIvOfAFipsb1qngFnfeQms4pXLZ5qo5YWlgcIlF9d+776p1SdIxMFr+/kz+7iOObo9cQ==
X-Received: by 2002:a05:6000:2f81:b0:3a5:5130:1c71 with SMTP id ffacd0b85a97d-3b33facbe7cmr3160001f8f.0.1751552652517;
        Thu, 03 Jul 2025 07:24:12 -0700 (PDT)
Received: from localhost (109-81-23-161.rct.o2.cz. [109.81.23.161])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e6280bsm19097744f8f.94.2025.07.03.07.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:24:11 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:24:10 +0200
From: Michal Hocko <mhocko@suse.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Subject: Re: [PATCH 6/6] mm: Drain LRUs upon resume to userspace on nohz_full
 CPUs
Message-ID: <aGaSivYVquqLjvUl@tiehlicka>
References: <20250703140717.25703-1-frederic@kernel.org>
 <20250703140717.25703-7-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703140717.25703-7-frederic@kernel.org>

On Thu 03-07-25 16:07:17, Frederic Weisbecker wrote:
[...]
> @@ -864,6 +888,10 @@ static inline void __lru_add_drain_all(bool force_all_cpus)
>  	for_each_online_cpu(cpu) {
>  		struct work_struct *work = &per_cpu(lru_add_drain_work, cpu);
>  
> +		/* Isolated CPUs handle their cache upon return to userspace */
> +		if (IS_ENABLED(CONFIG_NO_HZ_FULL_WORK) && !housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
> +			continue;
> +

Two questions. Where do you actually queue the work to be executed on
the return to the userspace? And why don't you do that only if
cpu_needs_drain?

>  		if (cpu_needs_drain(cpu)) {
>  			INIT_WORK(work, lru_add_drain_per_cpu);
>  			queue_work_on(cpu, mm_percpu_wq, work);
> -- 
> 2.48.1
> 

-- 
Michal Hocko
SUSE Labs
