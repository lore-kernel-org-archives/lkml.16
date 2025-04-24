Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A771624E9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503052; cv=none; b=dSREj8h5ZQRWz2BlZa7Xw0u+dR9jRk6HpASqpttqKPRzj27Q52B5ihKdx4n9Gu+AeJxK0Fs81OimUNt3Fif2N7As5/g49BPhdgn1RUnMvUg6QYD0tLtQpvlaWPYceFhtxHBDAVmy1otk8cxpGS4RVQuizO49PUFKBu2xe+72/j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503052; c=relaxed/simple;
	bh=FEYVBbdx82GbPQ8AA3AcwwOYAJIGNPQ8H5tD+yKePaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3kT56J72BTNENUkkzzeL2+gIb0ONO05zE3pXgbYRz/oWkkFzZt3NsWH87EYplRyDWfaJ1Jlhppc1DMOU8Q4/6kItrN1+sNvfd6cp88Z+WVlZ9dezlPAUgaA/e1P+RFMGT3GRWuhlu2ojlb6rhm85VHixSZDmx7uKBLZTA4LPS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xj5+mm24; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xj5+mm24"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mCWQOVKrsWLibj3F1DkkaTc3EiVbYXxvDS2JSNawb4o=; b=Xj5+mm24nxVnOWSAEcAVILKsjD
	zSC1SsesjYBKmmla2UCP42vQ7LcWjU2QF3/G4qmqzIx0biB+fmcURfSROayf+ha+EeN6kz7k+ygV/
	fT7iPvgDSn8zfBW0soO7i//lZqL4uVrurzgKZzqF7+xOsB/z1vY19TZ2jzcuTyHC9/eoHYrI/ObaB
	5fclA2YBRPI+c62q1lx1T/nonASlg5LwkSlTE6SbYamdMQSHPZkkEGtU6P/vTaYFGY/ILwe/nxFK9
	ae2dVHRMO1Bq7oJyvSeFwJ4ibDOYQ2QXE1yWOibEfSmQ//wCsoiSofWMztSlH3kfR6/x/zp6jKJ7h
	tIdnu6Qg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x4r-0000000CZPd-20jf;
	Thu, 24 Apr 2025 13:57:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DEB0730057E; Thu, 24 Apr 2025 15:57:20 +0200 (CEST)
Date: Thu, 24 Apr 2025 15:57:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, linux-kernel@vger.kernel.org,
	Luo Gengkun <luogengkun@huaweicloud.com>
Subject: Re: [PATCH 1/2] perf/x86/intel: Only check the group flag for X86
 leader
Message-ID: <20250424135720.GC1166@noisy.programming.kicks-ass.net>
References: <20250423221015.268949-1-kan.liang@linux.intel.com>
 <20250424094050.GE19534@noisy.programming.kicks-ass.net>
 <27d1c070-9644-4088-a0ee-e005d1542874@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27d1c070-9644-4088-a0ee-e005d1542874@linux.intel.com>

On Thu, Apr 24, 2025 at 09:50:09AM -0400, Liang, Kan wrote:

> I have split the patch series and sent a V2.
> https://lore.kernel.org/lkml/20250424134718.311934-1-kan.liang@linux.intel.com/
> 
> There is a fix for the non-precise events counters-snapshotting, which
> is buried in the LKML.
> https://lore.kernel.org/lkml/20250204210514.4089680-1-kan.liang@linux.intel.com/
> I've also added it into the above V2 with a fixes tag.
> Please take a look. If it looks good for you, please stick it in urgent
> as well.


Thanks, let me go see..
