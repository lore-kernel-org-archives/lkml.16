Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6812A1BB
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805537; cv=none; b=YeBwnKjYNRlaukTFM6YME3vibJvd737XscZsSzsxS2kGqMXGUZGQ4aH25h4VvweDVWs0tspqANqcl/VV+yWtseOettkMt9w05E2IJ4/pube8WZPsB2ndfewSc/4yR3vwNwD4+bAQ6wC581Y6TfNCOWw18rlWA8nPKqg5rUrFzHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805537; c=relaxed/simple;
	bh=38MxOUmYKbciuHjdqkQXL1wauTQdps+Dfl/xTLvlZWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfZTzqGLZTLsDQrjmiJDuZaTsQgkjUTNl2sSEbPIf8P4rBi9q0Y9BUKgHSFSiyMYMsw5NAfO5lua1jxX6YFJQ+8qU9ZyvrNZgwjYfOmCDGzPvjYpRPuIytZrw9r3aTKm/b/woUrZ8rewrC9AKl6uNH1w7z/BsjNP9QxblM+OMa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHObK1B5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHObK1B5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso1719311b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746805535; x=1747410335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dxlqEdIWH+9pmR8awJSgCg+KaSqWx0CRTlmvWAbjVC8=;
        b=EHObK1B5eLCv31tOTjJ8D22zSqdjsLlseBVeuETEzk92t3wNc1v/++xzXTgQ6MLXSc
         fy8Vw0mGS3A9atnKu2A7MzRwrYHIcXV6+KHOkK/GjZEfhEKKE3qA+vLjY8N0ceSjn5xw
         dOQunqfzbiPzjYnTL+aK+E8/Oz4aXOeyIxbrR03sZgpInQAHuE9yPOXc/HhKpTCg0XCN
         S+v5pX4y7YN73bd00y/BuCJO87BAVlW68NeJekZ4MOkyHHMcvNlhuvldKk9AtGr7Pl9n
         KG9Iv+98smvWtGuL8uFrC5Wf6AsjRn2RCOMI4zRizDVzT7yG9PGT3Q9p00qykTRwf2XQ
         7wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805535; x=1747410335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxlqEdIWH+9pmR8awJSgCg+KaSqWx0CRTlmvWAbjVC8=;
        b=CiMIKjZ4wsKTMUfypVS8QzDy2nPSak8RefKLnIlaEKJfcG+r7vKscPW7lcNMzZkmih
         jF3PDrFXv00Ykq5u2Mh3CbX/vBJe1JKUZTgUgsq+DYLCDe7vwVg5pg2SRIXY3S7qqigl
         b0zok0CN730ymQ1pBHN5D/WndK9Wj2dq9IGBL0rmm4jGehcgidwDQNb0HrR3KAIVt3KN
         AOMJaTc02w6tpmgPq4OyTnM1aobbDF9HCtbVnvYWflrUQ326wkbisN8wtop2iv+QOHJ/
         R97mhy0nVPio64a6buwaJ7TxlFsqjQ8pcPvaiofS8Cvsjnr4ouNwKeGbIIfWqUjnwTX0
         eg1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUCToVpRF44PyeJeM23btQxvND7TlyqbqQ9Yn9IAUTQYf2BzxusfIGYOwChbvjAL+USCM/pD4UFULsh04=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYMwmjP0yx2ZESQcyF88F/Up4bnT/U9ze5cUxk59v/YcfwJXyL
	qa5fYQgPNWTEhmyz4JDQQdW70gPlVg4nhv1rGCbtsVJw484s7y/x
X-Gm-Gg: ASbGncv1m2CJZ9ItCUpBlJ+sOzaHQlASagHAckZfmxu21DQ2EoJ7ntTJMmKLXnh3iNq
	Kw70x6taOqG6dG39VQIoQ9XoSHsbGTBnrm5upE0NjFZTfItF1mzSN7sb4zb843+XAbqaAT2AIQP
	sMoq/vcIb2RWq43Xnta+MOQCi9fSBMT2iz/5djQtk/iGbZ9X62WWihEDzYvR9aSqKC5yeH9AeO9
	VITAOBk0KR0m+0xX41nVb7RFcqotf6C9+y2AuBKEB9TkEeBQBIOAoX6Abiqp3mAYeu5IoDyT3WJ
	7T/bwITUcmLfr3BG+1P/MiCG6qMwCPvVkXOXeJNp
X-Google-Smtp-Source: AGHT+IEf9mcbtvDTgs5SKhzQ9QSDy/kpNz0wQ8EZabzDusc9fwq59RNtRvELFI74c7Q1lR0Bv5L2BQ==
X-Received: by 2002:a05:6a00:32c9:b0:736:32d2:aa8e with SMTP id d2e1a72fcca58-7423bc577damr4724496b3a.6.1746805535167;
        Fri, 09 May 2025 08:45:35 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237704734sm1882074b3a.29.2025.05.09.08.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:45:34 -0700 (PDT)
Date: Fri, 9 May 2025 11:45:32 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: 'James Morse' <james.morse@arm.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	"carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
	"lcherian@marvell.com" <lcherian@marvell.com>,
	"bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	"peternewman@google.com" <peternewman@google.com>,
	"dfustini@baylibre.com" <dfustini@baylibre.com>,
	"amitsinght@marvell.com" <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>
Subject: Re: [PATCH v10 04/30] x86/resctrl: Optimize
 cpumask_any_housekeeping()
Message-ID: <aB4jHPsWVNqrSG6W@yury>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-5-james.morse@arm.com>
 <OSZPR01MB8798F324AB66D9B62495E9088B8AA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSZPR01MB8798F324AB66D9B62495E9088B8AA@OSZPR01MB8798.jpnprd01.prod.outlook.com>

On Fri, May 09, 2025 at 08:39:51AM +0000, Shaopeng Tan (Fujitsu) wrote:
> Hello James,
> 
> > From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
> > 
> > With the lack of cpumask_any_andnot_but(), cpumask_any_housekeeping()
> > has to abuse cpumask_nth() functions.
> > 
> > Update cpumask_any_housekeeping() to use the new cpumask_any_but()
> > and cpumask_any_andnot_but(). These two functions understand
> > RESCTRL_PICK_ANY_CPU, which simplifies cpumask_any_housekeeping()
> > significantly.
> > 
> > Tested-by: James Morse <james.morse@arm.com>
> > Reviewed-by: James Morse <james.morse@arm.com>
> > Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > Signed-off-by: James Morse <james.morse@arm.com>
> > ---
> >  arch/x86/kernel/cpu/resctrl/internal.h | 28 +++++++-------------------
> >  1 file changed, 7 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/cpu/resctrl/internal.h
> > b/arch/x86/kernel/cpu/resctrl/internal.h
> > index eaae99602b61..25b61e466715 100644
> > --- a/arch/x86/kernel/cpu/resctrl/internal.h
> > +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> > @@ -47,30 +47,16 @@
> >  static inline unsigned int
> >  cpumask_any_housekeeping(const struct cpumask *mask, int exclude_cpu)
> > {
> > -	unsigned int cpu, hk_cpu;
> > -
> > -	if (exclude_cpu == RESCTRL_PICK_ANY_CPU)
> > -		cpu = cpumask_any(mask);
> > -	else
> > -		cpu = cpumask_any_but(mask, exclude_cpu);
> > -
> > -	/* Only continue if tick_nohz_full_mask has been initialized. */
> > -	if (!tick_nohz_full_enabled())
> > -		return cpu;
> > -
> > -	/* If the CPU picked isn't marked nohz_full nothing more needs doing.
> > */
> > -	if (cpu < nr_cpu_ids && !tick_nohz_full_cpu(cpu))
> > -		return cpu;
> > +	unsigned int cpu;
> > 
> >  	/* Try to find a CPU that isn't nohz_full to use in preference */
> > -	hk_cpu = cpumask_nth_andnot(0, mask, tick_nohz_full_mask);
> > -	if (hk_cpu == exclude_cpu)
> > -		hk_cpu = cpumask_nth_andnot(1, mask,
> > tick_nohz_full_mask);
> 
> It seems that the cpumask_nth_andnot() function is no longer used anywhere,
> so it's better to remove it from ./include/linux/cpumask.h.

Yeah. Can you send a patch after this series will get merged? I'll
move it with my branch then.

Thanks,
Yury
