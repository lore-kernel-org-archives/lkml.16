Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1655525B660
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009572; cv=none; b=W7ZeEt8Oe9ahOs6EEOoNpJCQKuP4rvF6HUzpc83wjZw2qRFxneTDD1PRiDK4r+kKKl7BrwkVEAOAVez4ziDWtf1juIU1vBYw2xY7dHzjy7al1gRf7JY90Njdt6NS8FggTXzo3JDjCIjGhNV+xHrWke4aE6BvSOI0kSkpwf3l0co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009572; c=relaxed/simple;
	bh=92/5yqLO29nlAj93x7N71G6NDJfnyE/xA+H4HieupLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYrjik41Sc9aXdnkSRdlQvvm2HeZVDQHP5s5JLK5meuXhmxlpw8Jjx2YcSY69Z5rSp4ip2aQNoQfH/RnLRx3quRFVWK41h4vKiWWEOrZgwCa5r1vnxHuCwv+K35OD0OKV+wbCsV5Y6rnwmTdky2Ww0cJU9xsUwO1Ohp0YRYOjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MSCFJH6J; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MSCFJH6J"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso1252301466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746009568; x=1746614368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ1AfWXQs1nBMK587FIDsRTEeTFs4tyQghWIH330LAI=;
        b=MSCFJH6JnEmukOKETFMyWIcw4FZgdq20etKyC3sePux6PeEZZhoUk34Qc91Pj6UVQN
         qAq2jeq8khdeGIrMMtQ/vZlYfzQgtbtfB+IEf90Gtx0T/VbqifKDRd/byjabEZ0Upel6
         +Oueo8N5yHT0XmqcvqXSBZEoH3EhM9vcnnTFEL2fEdmlC/zq6uvDKvTNGutshiV9KMNX
         tv20tDY4ijkG5GPob4ldtPM9QNlb87IzVSh3EW37gidssEUiWDhJVBI6uEnBrbtGzBL2
         GOuNRePAhXeZo1NQTIomfjjJQUWKpgUR2sCz/X4EkGAcGI/+NZrNBKcCTyJ2Ro5nBzYc
         B5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009568; x=1746614368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ1AfWXQs1nBMK587FIDsRTEeTFs4tyQghWIH330LAI=;
        b=Y2pfv1GAQzHESkPtAkJpB9OV9ETNvbAbSQ2jaLWt4raLsQTuh6b+23tAZAxIE99XAd
         5kIyh5XEh26tYMPEBrrMtel1wF0hnOZMPXPtexmM9MBcmCRhdlgUJXAyoLhqU6pI+7Kw
         4fNzfgr5onoHFjC8RxTZzr8XFI0cCzM04kNa/ityGK40I5DX+9VdSzzCdH8vuKowh8UX
         vsQ0a/9zHiEwQmd7vmDP3Ux1iHsq+7dVXS0QNvXqlPMBvWiCgPZj1C0iT79GuZXwhd6d
         3a3Oa74t0QylJuZgaNjuUA+ZrQqO0/MECPYGZsWsNag7P693ThdoJj+Wmn7WtJ3a02eT
         2B6g==
X-Forwarded-Encrypted: i=1; AJvYcCUWAeq5xPdYclavp0P7Fgp0Y5UuJFrkWxb35h7gTJlxVHrTYk8Tghs47LsKeOw1/G9G2XgVU855bRsstBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxguxfCf4tFoIEhn58Kus7so6tlxEl5Yl9gS7wgSWJEC7ftvJcN
	+X0Xz0SpHpnFLRhHdmli9seiD0QqZ8A7CZSPV/gseggSY+47gfOrCJLSaX4OEmxOFrigEBRATHt
	3
X-Gm-Gg: ASbGncuFvPYTMUTIscavx4RNbKyj8PG6ewY/AEpsx+0kM3CNz8RXEsSxBHEOSKuVF6Z
	H4SQNcVlpfL7+gHIMOF/mv3/aYcg1ooGjbDjQjpr9+Fyr40das0G6G+0itLcfnexvdUVlkm4rmd
	4tNida/71GltXsbyPGQBSMI7zMZpSKmaGcWtGwPDcvpyViNRWMXZMCKW/VFE0iTw5BZKO3bi5Du
	tpDDD325PG0HIdY5xBoO+T40p9hW9gLFhuAVxeQHdk+qOqi/SHtvtemcdPT2aCTUaH2BVEt5rKW
	0momlcirU/EBBA8mr4Qfj5blLgGK2ERZybmcedhjSQ==
X-Google-Smtp-Source: AGHT+IFCpuTJ8/OHKWaiRhhxUtob7QIWQ0iUC+RCxLJ5KfH8BnaMIhpiW98hhfZ1n317yKlfmBZNgA==
X-Received: by 2002:a17:907:3f07:b0:ac4:2ae:c970 with SMTP id a640c23a62f3a-acedc5f1399mr279918366b.21.1746009568181;
        Wed, 30 Apr 2025 03:39:28 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acecbb956b7sm221760566b.2.2025.04.30.03.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:39:28 -0700 (PDT)
Date: Wed, 30 Apr 2025 12:39:26 +0200
From: Michal Hocko <mhocko@suse.com>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-cve-announce@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: Re: CVE-2025-22029: exec: fix the racy usage of fs_struct->in_exec
Message-ID: <aBH93qMAhgMEGDAY@tiehlicka>
References: <2025041655-CVE-2025-22029-349f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041655-CVE-2025-22029-349f@gregkh>

Based on a follow up update from Oleg[1] I would like to dispute this
CVE.

TL;DR version
: with or without this patch the "if (fs->in_exec)" check in copy_fs()
: can obviously hit the 1 -> 0 transition.
: 
: This is harmless, but should be probably fixed just to avoid another report
: from KCSAN.

On Wed 16-04-25 16:12:00, Greg KH wrote:
> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:
> 
> exec: fix the racy usage of fs_struct->in_exec
> 
> check_unsafe_exec() sets fs->in_exec under cred_guard_mutex, then execve()
> paths clear fs->in_exec lockless. This is fine if exec succeeds, but if it
> fails we have the following race:
> 
> 	T1 sets fs->in_exec = 1, fails, drops cred_guard_mutex
> 
> 	T2 sets fs->in_exec = 1
> 
> 	T1 clears fs->in_exec
> 
> 	T2 continues with fs->in_exec == 0
> 
> Change fs/exec.c to clear fs->in_exec with cred_guard_mutex held.
> 
> The Linux kernel CVE team has assigned CVE-2025-22029 to this issue.
> 
> 
> Affected and fixed versions
> ===========================
> 
> 	Fixed in 6.6.87 with commit 753a620a7f8e134b444f89fe90873234e894e21a
> 	Fixed in 6.12.23 with commit e2d8e7bd3314485e0b3b08380c659b3d1d67ed6a
> 	Fixed in 6.13.11 with commit a6b5070721503fb6021ebed51c925ffc66b1c5ab
> 	Fixed in 6.14.2 with commit b519f2e5800fe2391b7545ba6889df795828e885
> 	Fixed in 6.15-rc1 with commit af7bb0d2ca459f15cb5ca604dab5d9af103643f0
> 
> Please see https://www.kernel.org for a full list of currently supported
> kernel versions by the kernel community.
> 
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
> 	https://cve.org/CVERecord/?id=CVE-2025-22029
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.
> 
> 
> Affected files
> ==============
> 
> The file(s) affected by this issue are:
> 	fs/exec.c
> 
> 
> Mitigation
> ==========
> 
> The Linux kernel CVE team recommends that you update to the latest
> stable kernel version for this, and many other bugfixes.  Individual
> changes are never tested alone, but rather are part of a larger kernel
> release.  Cherry-picking individual commits is not recommended or
> supported by the Linux kernel community at all.  If however, updating to
> the latest release is impossible, the individual changes to resolve this
> issue can be found at these commits:
> 	https://git.kernel.org/stable/c/753a620a7f8e134b444f89fe90873234e894e21a
> 	https://git.kernel.org/stable/c/e2d8e7bd3314485e0b3b08380c659b3d1d67ed6a
> 	https://git.kernel.org/stable/c/a6b5070721503fb6021ebed51c925ffc66b1c5ab
> 	https://git.kernel.org/stable/c/b519f2e5800fe2391b7545ba6889df795828e885
> 	https://git.kernel.org/stable/c/af7bb0d2ca459f15cb5ca604dab5d9af103643f0

-- 
Michal Hocko
SUSE Labs
