Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C65418E25
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690932; cv=none; b=CzG66ZC0SGDXAtMsZ5ROddM/Q7FbgJT3bBfqk8Rvf+C2CgR7qy8KABizCuHUqzu4rwRxlDbi0eXmdIPgXJ1+mJzrEA328Yb4CJhadpGnbAK7Li+HLIt0wmCFGTbTPZ5LMCBEeuXtjFZcObljARDMM+tgvkmvi8tc7avDeGQHeTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690932; c=relaxed/simple;
	bh=ifsq78MzUS3WxDTs6QMWfbH05zy+xbPt1XWw3VCQMfs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=D7IJ0VHAvmrhz7zB1jcV5vSNMJthmRwB1LBpidyIRKHNOZtFvkLb7vDsb0VKLwEVdlC94PDK18vehmzJywPV+Z5E/O0At9hUKVqTJtyvK7+oO0D1sEv71/3+21YJ8CpXNyJ2Q3lwMru/jh+nZPA/7D/A8+/1j/s7+MnhQGNslk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1Jcd1ejg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1Jcd1ejg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24B6C4CEE3;
	Thu, 12 Jun 2025 01:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749690932;
	bh=ifsq78MzUS3WxDTs6QMWfbH05zy+xbPt1XWw3VCQMfs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1Jcd1ejgChAXTFQHuFMuK3B1PrTJRjUeZOBSYXkrqNk1YIqMF8zv4yngk9vzY4SeN
	 dX9Aeh3psM6Rbmx6BzO9UoNQskmmOpL4Y+I/MpnojVR8FnTUgSIAmHz1XypxL0mH0H
	 LoJ8UtyVnU4mlFQsd2XDv42eRKq6mmtgt0qb7IVc=
Date: Wed, 11 Jun 2025 18:15:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, Nhat Pham
 <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, Usama Arif
 <usamaarif642@gmail.com>, linux-kernel@vger.kernel.org, Colin Cross
 <ccross@android.com>
Subject: Re: [PATCH v3] mm/shmem, swap: fix softlockup with mTHP swapin
Message-Id: <20250611181531.004a7ba771393843dda5ee64@linux-foundation.org>
In-Reply-To: <CAMgjq7CHMHwCsWZnEPUTg2fq7wRdQAMD3ESGa+GBBp=U0Ld7ag@mail.gmail.com>
References: <20250610181645.45922-1-ryncsn@gmail.com>
	<aEj47L/qO+llWcvH@MiWiFi-R3L-srv>
	<CAMgjq7CHMHwCsWZnEPUTg2fq7wRdQAMD3ESGa+GBBp=U0Ld7ag@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Jun 2025 00:06:56 +0800 Kairui Song <ryncsn@gmail.com> wrote:

> > > The reason is simple, readahead brought some order 0 folio in swap cache,
> > > and the swapin mTHP folio being allocated is in confict with it, so
> >                                                   ^^^typo, conflict
> >
> 
> Nice catch, thanks!
> 
> Hi Andrew, it's only one typo in the commit message here, will you
> help update the commit message while merging 

No probs.  

checkpatch can catch these things if the typo is in scripts/spelling.txt.

x1:/usr/src/linux-6.16-rc1> grep -r confict . | wc -l
5
x1:/usr/src/mm> git log | grep confict | wc -l
26

and it seems it should be!  I bet Colin can fix that for us.
