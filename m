Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FCE139B
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728335; cv=none; b=VAZ5aT6G1yo/3aO7NSfuFGd7vda6x/GA5MfMHu6ORZ44P6kGFt4MTempo8vg0BsC16rgPzT1DgMYeGLUCz0pkQDkBgLawOdV9pc4oGMULxpKDlkNndsEXcde+DpXll9xWguNii3JEItG7JgsGFwIOTClX/khb/Cr9l7I4Shd8jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728335; c=relaxed/simple;
	bh=TWjQnxkZdnlHjJdMuXvko1HdeSWPDN2W7EIlE4dmZ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyC2MkKzGug3p6vUrZ1rEC1LQFPCrdxwYurt8ZaG5/C3f0MgaMkav/8xKUhLDHe5n5xQbjJCTitp1Q4KFt77hUczSSS35ZKn7iicHuVAC0lSNioLSjYGNeIIOkhLaI8/K26pHoC3xshYH46E1Wd8xyLxq3vbDloTKRvjExmfnTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Prjm2JPL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Prjm2JPL"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7370a2d1981so1198168b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746728333; x=1747333133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=riuZaManSwBg7oz0fIVOr8CRnyjlirmlxYSIikWVF80=;
        b=Prjm2JPLMqKYKR3+ko0j6yNv1s5hvObZ6WLMYDA8MmgEK24mn7LPLOzy7cCLCqOIf2
         MXUbbHSJpb/5DkiLsQRFUfitE+2EBHFnnoGig5jaQ274G6gr4p0ibkrs0I7NjYMtZ1CL
         zOY0uPl6pP4cHdvKf0JZC0doCLTJz7vE1YuGMCqxUgHG/LoJ1tBc1wD3wWM++R2sMU74
         N+6PpDaBtFZuBtmm1ZelCwV1V8V7qomiXQqImnagef9Uc6/tAAqIBVbkCTnKl3RXXobA
         2M8T63vyTIfzH5huPHhHz6zy9nTVpkDWEb+eBQcJ3wEdKkNyHKPTa2s8dE9BSW4u0PzI
         YyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746728333; x=1747333133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riuZaManSwBg7oz0fIVOr8CRnyjlirmlxYSIikWVF80=;
        b=ZdmmX7h6knAso9GZQMdslRKYvKa8QqquyFPuRNiTWaMRyvE6AUdFxyJH1bgGLU0Pu3
         DMzMBbetT77E6O7w2TAgBBJ73RHjdhPe8hY0tA769j1QhyzYNpa3w9jqWj1udsw5FD3E
         8J+vaauZh2RgZFE5PPXLUP834se4o2vNm822NsFPMMKdlTn3IKHmZIW/StyDGq4JUoZG
         8dqvCW08aJrQcj5BWVuZqcu+I/5wdpP7mRIij7Qaq0OFvF6wEJg+8WF116pmE0NjSRZ+
         Az7OrVk4asrVyEg1Y2LGiXH5OKXaGQRBg4xlxffpzwwa5V3TY2du9CrarMkufV13ZLJf
         t04g==
X-Forwarded-Encrypted: i=1; AJvYcCXNkqlFo1g+5svzlITs71yQmWXvorgvBG2vYdDbxpSqpQTz/Uu2VS8Iqwx0tm1NAlpP+dBiFmhRqco01Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC4OfymXghjIkggvsZGmGDS/h6ipnWObOXYMrrcOZeDcqLZZKR
	oRU1sjQtBAgNBtflkNbrUVvmqn99wIcDaAg+GnGOHB6E0ymS7css
X-Gm-Gg: ASbGncszHGLqzpPqhV3B+HNqFK9lOFK/LevkWP6Ep96vTuyyDYlmzgXPilfCGYjDt1u
	IS0780pLf1BJxRNVperm82kZYvCnIWF3FFBCZWLsJi9vdPzjVC9MkBO6I+ZvrGpOf+Q2NQpuKPG
	bNhnthk2coBirp+UA1/LNcCJxzrVqHKTSDX8gsgMO57/puGKHTSlZXFUXsODLfLk27cFEQWBLTt
	3x7lcMmpC9p+zpbCA5Yr6OD2Fv2Ch2fQg+HxgdxFDCCKrl1bivSgeQTtPVFx4jUGg0nzkEp/bd1
	O+FYiGyllGigyyUgaNIY6GVr9ZWflx6+7EweOzV3
X-Google-Smtp-Source: AGHT+IHwNgszx0fea/HzKibSQe++11OAXsB1A6M2Q00Esf5qjVt5WQ5xRAcj22Z1alkX3xgj8G+uSQ==
X-Received: by 2002:a05:6a00:1254:b0:734:b136:9c39 with SMTP id d2e1a72fcca58-7423c05bf1fmr365133b3a.19.1746728333290;
        Thu, 08 May 2025 11:18:53 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8972asm304678b3a.157.2025.05.08.11.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 11:18:52 -0700 (PDT)
Date: Thu, 8 May 2025 14:18:50 -0400
From: Yury Norov <yury.norov@gmail.com>
To: James Morse <james.morse@arm.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
Subject: Re: [PATCH v10 25/30] x86,fs/resctrl: Move the resctrl filesystem
 code to live in /fs/resctrl
Message-ID: <aBz1iiug5KBnumck@yury>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-26-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508171858.9197-26-james.morse@arm.com>

On Thu, May 08, 2025 at 05:18:53PM +0000, James Morse wrote:
> Resctrl is a filesystem interface to hardware that provides cache
> allocation policy and bandwidth control for groups of tasks or CPUs.
> 
> To support more than one architecture, resctrl needs to live in /fs/.
> 
> Move the code that is concerned with the filesystem interface to
> /fs/resctrl.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since *:
>  * This patch is generated by a script.
> ---
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  637 ---
>  arch/x86/kernel/cpu/resctrl/internal.h        |  366 +-
>  arch/x86/kernel/cpu/resctrl/monitor.c         |  902 +---
>  arch/x86/kernel/cpu/resctrl/monitor_trace.h   |   18 +-
>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1080 +---
>  .../kernel/cpu/resctrl/pseudo_lock_trace.h    |    2 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4311 +---------------
>  fs/resctrl/ctrlmondata.c                      |  661 +++
>  fs/resctrl/internal.h                         |  428 ++
>  fs/resctrl/monitor.c                          |  932 ++++
>  fs/resctrl/monitor_trace.h                    |   33 +
>  fs/resctrl/pseudo_lock.c                      | 1115 +++++
>  fs/resctrl/pseudo_lock_trace.h                |   17 +
>  fs/resctrl/rdtgroup.c                         | 4346 +++++++++++++++++
>  14 files changed, 7549 insertions(+), 7299 deletions(-)

There's no MAINTAINERS record for the new files. Did I miss
something?
