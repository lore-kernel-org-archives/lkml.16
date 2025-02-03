Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCCA204F7F
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588571; cv=none; b=WIM4nVwritJJ3ogGMJxZAWgXWgilHs45edr7y1VPb0Zs9LTKVV1UN59Jv3lfsUdIF7b64vtC+ZSeKtHDxXxmsYnlqXDSQtIRtTmhj6WyIIf2X3A1T2UABHsvK30nu8nMz92f0xykg0jOPNIuMjUHD3w2JBiUwSaghP3eZoZw3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588571; c=relaxed/simple;
	bh=seLVJpuuglvvCjXrNSpcFGuZ6+17yIwq6cCDZb93FNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQnCuDkCA9LfWRHjRzM2RfriCkJm5ozrbPRlkJ4q+4S/E5bqusvOmo8aBL3dI0PeSMBUyzzq99bhn1KjZH1ifsXLOicJZB4V+OD07QUWgewL6omoR7TlFF+A7VS97h6lfwOAs9XRp2EZmyCG809Ymn0rDcnoxRDeOBp4ktcoYP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h4H8vAdb; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h4H8vAdb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kgM2xGrGu1w1dWs36l7Kb74rtjpEL/L1RsZudta0gUc=; b=h4H8vAdbDS8WYroRKIM/fMCIYS
	t5NKgRk1swRuYy6QknJpBPtrB5Ila59MXHXltJ4cfOzHnn9agn2kuT7KrVbBasF3+SapDf0cJXU72
	LvELwelP01WVPUBwyWXIWmfYzKkRrbgHxYrxVOaQwClBcd+ESkLK2DOaOiT+T9fbY1y28KvM0gSLv
	mHUioaMpp0OzteByosrrLqfooclJyKwLpEAgAHGF0hkOUuBtoD128bXYnhhVK2KhJioIOLaQs2x5E
	p/iaov//bSnqfzdlZ3PE4UXnNFMNZFVYk7oRf6IhwNAm31dUC3KCHWVKypCI8cuIM7g1HMnZLWADX
	oHK974vQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tewIz-0000000165w-2dOC;
	Mon, 03 Feb 2025 13:16:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 93A2C30035F; Mon,  3 Feb 2025 14:16:00 +0100 (CET)
Date: Mon, 3 Feb 2025 14:16:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com, ak@linux.intel.com,
	linux-kernel@vger.kernel.org, dapeng1.mi@linux.intel.com
Subject: Re: [PATCH 0/3] Cleanup for Intel PMU initialization
Message-ID: <20250203131600.GD14028@noisy.programming.kicks-ass.net>
References: <20250129154820.3755948-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129154820.3755948-1-kan.liang@linux.intel.com>

On Wed, Jan 29, 2025 at 07:48:17AM -0800, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> The patches are to clean up different features. They all touch the
> initialization code. There are some dependencies. So I put them in
> a patch set to facilitate the review and merge.
> 
> Patch 1 is to clear up the PEBS-via-PT on hybrid.
> The original V1 patch can be found at
> https://lore.kernel.org/lkml/20250124183432.3565061-1-kan.liang@linux.intel.com/
> This is the V2, which only update the comments.
> 
> Patch 2 is to clean up the 023H enumeration.
> To close the discussion at
> https://lore.kernel.org/lkml/20250127212901.GB9557@noisy.programming.kicks-ass.net/
> 
> Patch 3 is to clean up the counter information update and check codes.
> To close the discussion at
> https://lore.kernel.org/lkml/20250127164406.GN16742@noisy.programming.kicks-ass.net/

So I can take 1 and 2, but 3 is part of that arch pebs things, and that
series is not in a shape I want to apply.

Also, I'm not at all sure 3 improves things, it might just make it
worse.
