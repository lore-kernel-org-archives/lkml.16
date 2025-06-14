Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F92E11CC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749896139; cv=none; b=Ptis9lkFTlxKtHp8o5Wjk77qIes4urZdBRyL5BFqvMaNTvDTrcCtqphzXLwOgv3f7z15XXEjpadRnfAlaH6QuZ/Xn2PpQD68O5k6k0tNPIzpSEBX1gevKs+yjnKI9PRTd3rkLZaf9hDw2HBefnuuRtQJdHTb9ZMKb9/gGbOI1M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749896139; c=relaxed/simple;
	bh=7iOn03Bt0ToSlEWNeZdByx/mY5yVq2Mgma8Ie0fT4CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bn0uY0krdIzOpVAQlBTrsSuZ0irWZ+NVtTFGweXX5+NCO7lyza7tqMaym9Qx6lnMYunAuKaFodC3AENqrmz16dHi10MW6KP2V9tR5DtlwLaVFE40+Ht0neWx6GVy6mfVYKyo6572d1fdmLBMUIc+oxrbEbQjlDxmsR2Z0O4mx8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nXempXcd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nXempXcd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TfnWjtpSzxGmXtI2fFxBe639Cn21XUsmN7JrjtsgxZg=; b=nXempXcdpZnEmjZf0TODKsSq4/
	L9Z+Ay3qY7kq9u7SYvcmylsfRGUo3HTnuf0T3uX2uWBoktMARUHay2PU5szhIZ7E+RO6Dac4ybaTM
	Cu3o+jGNI9tCHaCZcfePStG8HL+KGG9w59c4+QrEayQ3ahSTPlP9G4DbXNfN7KGAlBmZ5n9m461Hg
	L/ljr1O4fzgTO4DCHcfS9737/3IpoPWRUaEo5hVIM666ZpJiD7uGeOgK79FPG1AOOn4GbhFo41fk8
	B8lTfEthWCRa4tzPkpsxlowiI2j6s9vRyHomnlQX8/tzNHdwk9yJttB0WEyJV0H/HlElhKuvjAu38
	gcP5CUFw==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQNv7-0000000DvTL-3H4M;
	Sat, 14 Jun 2025 10:15:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DD01F30861C; Sat, 14 Jun 2025 12:15:28 +0200 (CEST)
Date: Sat, 14 Jun 2025 12:15:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
Message-ID: <20250614101528.GJ2278213@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <2bb35bb3-cbe4-460f-a209-1fe4095e1dce@amd.com>
 <2d747fb5-81e7-48ac-ae51-db737a170b81@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d747fb5-81e7-48ac-ae51-db737a170b81@amd.com>

On Fri, Jun 13, 2025 at 08:58:56AM +0530, K Prateek Nayak wrote:

> - schbench (old) has a consistent regression for 16, 32, 64,
>   128, 256 workers (> CCX size, < Overloaded) except for with
>   256 workers case with TTWU_QUEUE_DEFAULT which shows an
>   improvement.
> 
> - new schebench has few regressions around 32, 64, and 128
>   workers for wakeup and request latency.

Right, so I actually made Chris' favourite workloads worse with these
patches :/

Let me go try this again..
