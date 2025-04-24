Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACBA2206BE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487661; cv=none; b=JPSMGFJWRlQVEL7HEfOqe6bjId2Rs+1+XghxWjt0PVmGF96qlxeZbDpWRaF3dG7w+HOO/Kb0Ep6BhgNgzPlyqK60FJ4orD4Kax97tlbsRxDkh0mdjoRuGgo3lG99fSWXDqK+HJCqq++Ec2sAZp2Y8+74fxdvm6tgM9DgWOZGCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487661; c=relaxed/simple;
	bh=Zj4rZc/o0d+mPGfyouleH+pLFelBv74hCt+szCNjbKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlbvCFcytvWxRZEkwainuqQF3STgcEV0M1CqcsYqOuQsDuIyZa790apqtUwo7afB/xHv5cQKXOGS/Pz1kUkTjGwg6xcfzmsrEfgDGFLxAxZPdgSHPA+J9vGdDNKYHyZtLOzE4UbAZmuuDgT/glCSQ4NfY61lWiQJzr0pdacJscM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lj4V+1BE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lj4V+1BE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V52SN0rAjrBhAIoaJ+IUA3O9fZi2COSECdESbmwo4T0=; b=lj4V+1BE89nBZi3fMhYGM2l/MC
	ss6cg5XA9Q/WfsDiVGX/uNzbY9LQVnycOCtv8YqYohaCr0XwLO8xU2GozFR4CsHstHv6678KLNrBr
	bSa/LAly5CMxlexxSHXWRfVhjGS5wA2NAxjEEcrY8yE4VNL038Xr8GfxPwzvmS3VLjEGEj4MxZaef
	mplMK023ifHSr/EL51wWWJ9cbVKDVeoKQlvshIr/AqOS2t6bHvVLPEPEBFT4jQzI3qu5XUYXCYnLw
	IQA3GS/P+zP/2WVI5giAS//n14B1bpxdLKNxDnmWwuKtFjiRWG/OvEmbL0oUuuFhFPNxdBTxgiHXa
	qZzA7cwg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t4d-0000000Bh2J-2hVJ;
	Thu, 24 Apr 2025 09:40:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0432730057E; Thu, 24 Apr 2025 11:40:51 +0200 (CEST)
Date: Thu, 24 Apr 2025 11:40:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, linux-kernel@vger.kernel.org,
	Luo Gengkun <luogengkun@huaweicloud.com>
Subject: Re: [PATCH 1/2] perf/x86/intel: Only check the group flag for X86
 leader
Message-ID: <20250424094050.GE19534@noisy.programming.kicks-ass.net>
References: <20250423221015.268949-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423221015.268949-1-kan.liang@linux.intel.com>

On Wed, Apr 23, 2025 at 03:10:14PM -0700, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> A warning in intel_pmu_lbr_counters_reorder() may be triggered by below
> perf command.
> 
> perf record -e "{cpu-clock,cycles/call-graph="lbr"/}" -- sleep 1
> 
> It's because the group is mistakenly treated as a branch counter group.
> 
> The hw.flags of the leader are used to determine whether a group is a
> branch counters group. However, the hw.flags is only available for a
> hardware event. The field to store the flags is a union type. For a
> software event, it's a hrtimer. The corresponding bit may be set if the
> leader is a software event.
> 
> For a branch counter group and other groups that have a group flag
> (e.g., topdown, PEBS counters snapshotting, and ACR), the leader must
> be a X86 event. Check the X86 event before checking the flag.
> 
> There may be an alternative way to fix the issue by moving the hw.flags
> out of the union type. It should work for now. But it's still possible
> that the flags will be used by other types of events later. As long as
> that type of event is used as a leader, a similar issue will be
> triggered. So the alternative way is dropped.
> 
> Reported-by: Luo Gengkun <luogengkun@huaweicloud.com>
> Closes: https://lore.kernel.org/lkml/20250412091423.1839809-1-luogengkun@huaweicloud.com/
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>

Can I get a Fixes tag for this such that I can stick it in urgent?

