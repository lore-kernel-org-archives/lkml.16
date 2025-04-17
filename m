Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169C31EB5DA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870018; cv=none; b=gAgk32YMKCxlP+b1z225v4xAmjhBe/cDWz6rRPj3w28tm4EOCandWeu9KWKtbIl7+vher5l/XPhTnUqKsunJ+dVPLGUwNpx5ixiGxKb/Cx/zPA4nP1PK3760HjBrdxCrDZoCul+5/VqzIlY7UNWw8l+h+66+e9L/1h8QiYYkpxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870018; c=relaxed/simple;
	bh=5GeC+qK8YG8hgshw/Vsza4sHAJzWnvUNdAHYih3+axA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQftjH4DyeG7xWR2TSmUqt8oMFKCwK4WyVJkb+x7xbtgf1PoEeGvbO3UXrxKzyGMMkVYSYWh8t03J/0ARydJ0YFss6owQqL7wLkxHbSIi4thDN1TgwgFXgZxUpD6z1IadpoD73PlasreTzq5h70fJrbOzA9qPgJzBybk1zm08Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=WgGisocv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="WgGisocv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223f7b10cbbso702965ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1744870016; x=1745474816; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGJ5OgB+eNLxh6yjEt0KC7v1R+HDpylF2/CRuaG8Yrs=;
        b=WgGisocvmA3jKVz9PrveiD2/TTFfl0vYTGnNgfwWolUuGHCu5Ky0gO8/+3XCqygLA1
         zAL23Aw3WEfnkR+Fs1lpqF1+P9p39p/KxmLqyNqIQX61GuED7s9XFuBsn0Xv4SN32rzv
         9RmtTRDLQpUgd6LI1jLp8qQRnYVaHhi5Tb4IpEJjN/goTkKRfIUcDaCONskt0cDYHheG
         b8A6R01nL75wZMWrNKnQaQTe9d6GOYTJmRVMvxGZQtodshYYUV4gxrdqxn4JPCrORYbf
         rbWgNXbEvO/Az5xXGlFguH0imRtDJWGd2zPy9c/ois6GeazOkBOey7Hoqz0xr/NecHWN
         /IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870016; x=1745474816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGJ5OgB+eNLxh6yjEt0KC7v1R+HDpylF2/CRuaG8Yrs=;
        b=djJ9cqjVsfhLyLaNhEmFKoxyVBlm5RNJyKfXmqoljLyKaXXxDHfAv6d0ejwGxSoI2p
         hwLYF1Y3GQhVJtW2rUkLUtTyCnY9qjHI5UuiG+Xfl1JBF/e7Tl9qcv2wX4QOotzn9h5N
         rICGCi+SX6rlbcUG6G0tjH16yM05zV6R5ESsCaBI74wdhOPttHrQx2ftjoOAVYThNl4a
         00OE58YaW3/FfJBSC9uAg5GwoWRW6s0168LdaQwRa/abBXy85ZyqAhHw2K90c6KqMv/2
         TN4zLLun7+TrSjB3UxEUAgrg6ku2rBjEhLGRnI9oTFYyqlRw8OsGD0ArsqOkccNsEJUm
         /j7g==
X-Forwarded-Encrypted: i=1; AJvYcCUUmsdWRN5+/ZN9UA2MIYU7kVJh+wUcFs120hrjkkAQYfbhSf1p73oXLsUBHO1HgPNN3CUhlobeb8hM4gE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVHJHelizXoUWq1CLBsyaSUqYf7BJgowTaIqu/MHJmj9BoiBH
	j6HaetBfmLI56hj6KSgUOy1gU3/t5h7mkOf4h7ZrSWfc+7ZKj4HjswYC7Z290IA=
X-Gm-Gg: ASbGncvfuHC2THFYRCfo0h4nimqsDu/lhcHP9cDaqWRBBPnDNYQabdwUSM17QTNKGKo
	EB0V1Eh7W7XAnJUOQzPEKAU6VTmbhjqovgFmGoAe/drOWw6uskMv5dtKMQvN4924Tx3QyoD2zDJ
	0uXYhPS3Ff7K0JNthv8h2p6KN2c2ta0+7h0nNtSdsIfQzvbK3OCs9s/qrYQ8QopBz4wxsYKiDS7
	8bNjrNTkwybp7XHiaY+YHX9+z8k9+1TAwfxWWdXGaU11lMS9THcWz5nURK8pEdpDyfUf5N+D1TA
	Fzz2XXCaSN+dgRYs/z+4H+FMg0dg8fGKEg==
X-Google-Smtp-Source: AGHT+IGvvbEfuoj36uDT6iQfRvoVP/jlgaCQTj7ZxRBDmsIUR69H6fHHglU0zTLVf9g+bVwMLde9mw==
X-Received: by 2002:a17:903:1251:b0:223:28a8:610b with SMTP id d9443c01a7336-22c412adbaamr10708135ad.14.1744870016272;
        Wed, 16 Apr 2025 23:06:56 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1d118sm25050395ad.86.2025.04.16.23.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:06:55 -0700 (PDT)
Date: Wed, 16 Apr 2025 23:06:55 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: paulmck@kernel.org, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
	linux-mm@kvack.org, Ye Liu <liuye@kylinos.cn>,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH] tools/drgn: Add script to display page state for a given
 PID and VADDR
Message-ID: <aACaf4_molKromnT@telecaster>
References: <20250415075024.248232-1-ye.liu@linux.dev>
 <20250415191414.a64de2d228ab5f43a5390acf@linux-foundation.org>
 <42f50a48-10da-4739-9e51-f865fbf04bdd@linux.dev>
 <098e977c-55cd-498b-bd36-725333c06210@dorminy.me>
 <7e45afc8-dde0-481a-b0bf-0237f551ebe0@paulmck-laptop>
 <665652ac-2e94-48b4-bf47-32870b823464@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <665652ac-2e94-48b4-bf47-32870b823464@linux.dev>

On Thu, Apr 17, 2025 at 09:29:23AM +0800, Ye Liu wrote:
> 
> 在 2025/4/16 12:02, Paul E. McKenney 写道:
> > On Tue, Apr 15, 2025 at 11:28:41PM -0400, Sweet Tea Dorminy wrote:
> >>
> >> On 4/15/25 10:46 PM, Ye Liu wrote:
> >>> 在 2025/4/16 10:14, Andrew Morton 写道:
> >>>> On Tue, 15 Apr 2025 15:50:24 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> >>>>
> >>>>> From: Ye Liu <liuye@kylinos.cn>
> >>>>>
> >>>>> Introduces a new drgn script, `show_page_info.py`, which allows users
> >>>>> to analyze the state of a page given a process ID (PID) and a virtual
> >>>>> address (VADDR). This can help kernel developers or debuggers easily
> >>>>> inspect page-related information in a live kernel or vmcore.
> >>>>>
> >>>>> The script extracts information such as the page flags, mapping, and
> >>>>> other metadata relevant to diagnosing memory issues.
> >>>>>
> >>>>> Currently, there is no specific maintainer entry for `tools/drgn/` in the
> >>>>> MAINTAINERS file. Therefore, this patch is sent to the general kernel and
> >>>>> tools mailing lists for review.
> >>>> Help.  My copy of linux has no tools/drgn/
> >>> I noticed that the current upstream Linux tree doesn't contain a
> >>> `tools/drgn/` directory.
> >>>
> >>> I'm interested in contributing a drgn script tool as well.
> >>> Given that this directory does not yet exist in mainline, where would
> >>> be the appropriate place to add new drgn scripts? Would it make sense
> >>> to create a new `tools/drgn/` directory, or is there a preferred
> >>> location for such debugging scripts?
> >>>
> >>> Thanks,
> >>> Ye
> >> I believe the traditional thing to do with new drgn scripts is to add them
> >> to the contrib directory in drgn via pull request:
> >> https://github.com/osandov/drgn/blob/main/contrib/README.rst
> > I have an RCU-related drgn script in tools/rcu, so maybe this one should
> > go in tools/mm.
> 
> 
> To determine the most appropriate place to submit this script, I looked
> 
> into existing drgn-based tooling in the kernel tree. Several drgn scripts
> have already been added under `tools/`, such as:
> 
> - `tools/sched_ext/scx_show_state.py`
> - `tools/cgroup/iocost_monitor.py`
> - `tools/cgroup/memcg_slabinfo.py`
> - `tools/writeback/wb_monitor.py`
> - `tools/rcu/rcu-cbs.py`
> - `tools/workqueue/wq_dump.py`
> - `tools/workqueue/wq_monitor.py`
> 
> Given this precedent, I believe it would be reasonable to place
> `show_page_info.py` under `tools/mm/`, since it's focused on memory
> subsystem internals and would follow a similar organizational pattern
> to the above.
> 
> I'd appreciate any input on whether this is a suitable direction.
> I'm happy to send the script for review once the location is agreed upon.
> 
> Thanks,  
> 
> Ye Liu

Hi,

The drgn repository and the kernel tools directory are both valid places
to put drgn scripts, and it's ultimately up to you where you'd prefer to
put it. Here are some factors to consider, though:

1. Reusability: if your script is very generic and would be widely
   useful, the ideal is to add it as a helper to drgn upstream. For
   scripts that are less generic but could still be useful to many
   people, I'd personally prefer for them to go into the drgn
   repository's tools or contrib directories. At the other extreme, if
   your script is only useful to a handful of developers of a specific
   subsystem, the kernel tools directory makes more sense.
2. Kernel version coupling: there are a couple of options for dealing
   with kernel changes that require drgn scripts to be updated (e.g.,
   struct member renames, data structure changes).  Scripts in the
   kernel tools directory tend to only handle the current version. This
   is simpler, but it also means that sometimes you can't use features
   from a new version of the script on old kernels. On the other hand,
   the drgn repository supports every kernel version that's still
   meaningfully deployed. This can complicate scripts with
   version-dependent logic, but it means you can always use the latest
   and greatest features on any kernel version. I prefer the latter
   approach, but the choice is yours (except for drgn helpers upstream,
   which are required to support all kernel versions).
3. Maintainership: who wants to own the script? A lot of the current
   drgn scripts in the kernel tools directory are written and maintained
   by the relevant subsystem maintainers, so it's a no-brainer for them
   to own it without any involvement from the drgn project. It's not as
   obvious for other contributors. If the subsystem maintainer is
   willing to own a drgn script in the kernel repo, then I won't
   complain. I'm willing to take just about anything for the drgn
   repository's contrib directory, and I'm slightly more selective for
   helpers and tools.

All that being said, your script looks pretty widely useful, so I think
it'd make sense in the drgn repository's contrib directory (or even the
tools directory if you want to make it a full-fledged tool with test
cases, support for all kernel versions, documentation, etc., but contrib
is fine).

Thanks,
Omar
