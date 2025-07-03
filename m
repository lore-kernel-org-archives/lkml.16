Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68A17332C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550778; cv=none; b=rnNWWZTpnhnOpw3ZkUmuf0mkq9FS1z2cMBTa19b+LJ9cKsjINweovpS06INOY808rJKF2jZ8oPZTvFWpbP+VlXa5E+fgEFiQGwWZt6qMaZoIUImJP3ofAA1ZHZKteuoXlSdUjwgTLLzxWGlTVlTehM8Cy5R5PFMhRzWAyvCoS1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550778; c=relaxed/simple;
	bh=o+a5Zq/v2MCypGAV2/0NFIUkiSZcJ/6Lp2TYlsZnyj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQw2wGStQFJLdAtgpcjTv3azIY9wn8etC1BOM0S87yZFN2J/Q407/82+gdYXhKZXKY2UoHiht8EPk+pm7NxoqhceaITDPz3tkXQHe7ExQQnzSgl4hi3FTEx3VNeeUiSDeOAPmKP7oUDsMIpuTa3zX9lvYXOpVPwIRftvFIGTPlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOHuiiyV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOHuiiyV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7426c44e014so7983984b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751550776; x=1752155576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7z5C0mIfBVL5G+fpRGoC/61ZD3VCkhZjpD6PCIuTajc=;
        b=BOHuiiyVW8YzlRH3Fs0J/GJEfeslJKj9ru4ZpTj1H12RJAb76zUKSlFbBclYALr46p
         dAl+phCFWWXH2v1sJaBzYTCgfxLOyvd0YbSpAQmwPLJT/YmHb5YDBWywpFu78Pi5qIPE
         JID8Ar1asmK/D/jV/3n855wI6M1GMfm+CUT/+TvtRGUHBsoupriTkZWWLa4ajCyD2aLA
         QSpdvU9OwbStkU6gtVHUQ1dkCFBpcagE7DY2kte8lxIwv1rUNsCfZ5chptF5+0ZoPP/g
         YAJa4YsapYnZLSBlI8RJwnEgnJXkP1oPNwxl8G18Y6FvMHfk3LpEybx1KjO9M74Nsvmr
         v45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751550776; x=1752155576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z5C0mIfBVL5G+fpRGoC/61ZD3VCkhZjpD6PCIuTajc=;
        b=wsP2KPVLpQht/w7rMRUQbsCfJSQ+ul+0Cgy92zvG+aOL+pRp2X60s4DlMNs12gb1rL
         dTQMWpC3QYqcDqUuGLjVWYn8+iMJZppGsUsid/KIjNMMNrx3JdFPd2LXu/y1BjXiBFLz
         JetBQOj2K1fSyfpzR4EXRh76Vc8qJQ90qckNvYVuyn9DPjYlhONuGnxCgeMJszHTakll
         hDFQ+m15kFDTHfN9/hP6/ncPJj0HfD48USc+2/DxKUhUmJmhD73jaCPVGp/oexclipk7
         vTC2wYcbNFhZoEJnJAp4BfEG9RenZyaJylMoyUFyZ8gXwiEQWMMwC/d8gh/Rn7XgpUnp
         Pdew==
X-Forwarded-Encrypted: i=1; AJvYcCV0RVKJezmt1wfb+RLK6B3/y0Ys2HjPk4jPYivC1Yz+NgB3uUrq83EkG9PLJ5AZVWIvdFhJC36mI+Mlrus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8b2o55ldp85aVi/Ctt7OU5dv+fmRrAHQJNWpJThTp9iPeqIYf
	0W6B+LyArS5Wtq+9j+xWevGxPqWc4VOTm7SOk6VvQcNQqnPR9CJmwgoN
X-Gm-Gg: ASbGnctAu03lZszDTOdTJKECa0eSnbhQIZ41INGQSDloKZ2yFry8r+BE2ZcTV69mDyv
	8T6HG9SpDtqsS5GWxNASp+PMnLw/+tmPKQF7056VAOyB3oU6e00NXLmueyrRMpTiN+duDDeCrVN
	ZySkySl21a9aXcBN78VMuOpDtFZ57hb3WUmTsKaJQE5+gWa4lrvXK0wcNT7SMdGbXWds6zMmVCb
	f+64SjiQL/wrb3UpwMXIlKPIKwNx5BHLhCtuRieWWknUKSmqq5IjbuzitNO9vGtjr8j3dsijCOC
	pJKOld5B2R29VgbhzjBXDHRVbelUKD8Uhkxj+ahrXL58Z2sPbiKylTccZCI4Iw==
X-Google-Smtp-Source: AGHT+IFQ8vfw7SmUaJw/mYSEqSDdH1wtY1Foe7axFG74AI01FW7fPbAKmU7PcAPoQUyMjJuTYQ32mA==
X-Received: by 2002:a05:6a21:6d98:b0:21f:5adb:52c4 with SMTP id adf61e73a8af0-2243eab4ae5mr5377966637.30.1751550776051;
        Thu, 03 Jul 2025 06:52:56 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300d808sm15390596a12.14.2025.07.03.06.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:52:55 -0700 (PDT)
Date: Thu, 3 Jul 2025 09:52:53 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Rik van Riel <riel@surriel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jann Horn <jannh@google.com>,
	syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
	neeraj.upadhyay@kernel.org, paulmck@kernel.org,
	peterz@infradead.org, syzkaller-bugs@googlegroups.com,
	x86@kernel.org, kernel-team <kernel-team@meta.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] smp: Wait for enqueued work regardless of IPI sent
Message-ID: <aGaLNRWhskWisP_0@yury>
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
 <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
 <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
 <CAG48ez1VMw=aE88eTfk9BscrmS7axJG=j_TrTui+htLF9-4Wqw@mail.gmail.com>
 <874ivuldog.ffs@tglx>
 <aGVwAtUi8eKNT8Jy@yury>
 <20250702135954.7a00497d@fangorn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702135954.7a00497d@fangorn>

On Wed, Jul 02, 2025 at 01:59:54PM -0400, Rik van Riel wrote:
> On Wed, 2 Jul 2025 13:44:34 -0400
> Yury Norov <yury.norov@gmail.com> wrote:
> 
> > Thank you guys for explaining that and sorry for the buggy patch.
> > I was actually under impression that run_remote duplicates nr_cpus !=0,
> > and even have a patch that removes run_remote.
> > 
> > Maybe worth to add a comment on what run_remote and nr_cpus track?
> 
> This thread did surface some useful content, and Jann also pointed out
> a good optimization that can be made, by not setting run_remote if
> "func" tells us to skip remote CPUs.
> 
> Thomas, please let me know if you already reverted Yury's patch,
> and want me to re-send this without the last hunk.
> 
> ---8<---
> From 2ae6417fa7ce16f1bfa574cbabba572436adbed9 Mon Sep 17 00:00:00 2001
> From: Rik van Riel <riel@surriel.com>
> Date: Wed, 2 Jul 2025 13:52:54 -0400
> Subject: [PATCH] smp: Wait for enqueued work regardless of IPI sent
> 
> Whenever work is enqueued with a remote CPU, smp_call_function_many_cond()
> may need to wait for that work to be completed, regardless of whether or
> not the remote CPU needed to be woken up with an IPI, or the work was
> being added to the queue of an already woken up CPU.
> 
> However, if no work is enqueued with a remote CPU, because "func"
> told us to skip all CPUs, do not wait.
> 
> Document the difference between "work enqueued", and "CPU needs to be
> woken up"
> 
> Signed-off-by: Rik van Riel <riel@surriel.com>
> Suggested-by: Jann Horn <jannh@google.com>
> Reported-by: syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com
> Fixes: a12a498a9738 ("smp: Don't wait for remote work done if not needed in smp_call_function_many_cond()")
> ---
>  kernel/smp.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/smp.c b/kernel/smp.c
> index 84561258cd22..c5e1da7a88da 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -802,7 +802,6 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  
>  	/* Check if we need remote execution, i.e., any CPU excluding this one. */
>  	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
> -		run_remote = true;
>  		cfd = this_cpu_ptr(&cfd_data);
>  		cpumask_and(cfd->cpumask, mask, cpu_online_mask);
>  		__cpumask_clear_cpu(this_cpu, cfd->cpumask);
> @@ -816,6 +815,9 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  				continue;
>  			}
>  
> +			/* Work is enqueued on a remote CPU. */
> +			run_remote = true;
> +

I actually ended up with the same on my cratch branch:

https://github.com/norov/linux/commit/8a32ca4b60dc68ac54f3b70b4be7a5863dc3934e

So,

Reviewed-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

>  			csd_lock(csd);
>  			if (wait)
>  				csd->node.u_flags |= CSD_TYPE_SYNC;
> @@ -827,6 +829,10 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  #endif
>  			trace_csd_queue_cpu(cpu, _RET_IP_, func, csd);
>  
> +			/*
> +			 * Kick the remote CPU if this is the first work
> +			 * item enqueued.
> +			 */
>  			if (llist_add(&csd->node.llist, &per_cpu(call_single_queue, cpu))) {
>  				__cpumask_set_cpu(cpu, cfd->cpumask_ipi);
>  				nr_cpus++;
> @@ -843,8 +849,6 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  			send_call_function_single_ipi(last_cpu);
>  		else if (likely(nr_cpus > 1))
>  			send_call_function_ipi_mask(cfd->cpumask_ipi);
> -		else
> -			run_remote = false;
>  	}
>  
>  	/* Check if we need local execution. */
> -- 
> 2.49.0
> 
