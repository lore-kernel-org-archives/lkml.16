Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EB827A47C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769924; cv=none; b=d2g8wmvHaUrQYhVQPK9y7H4xQ85ZNcvsUC/to1ptt2COBEDqK0HVpk+hjfDZWjhtiJNS34Y2nLMVBtRAE0ENcOgVJ9XZrDNPSz+7aIWn55Gj5tfbdylSmR5YwlG/hmbKc7Poe0wNICUpM3+vFhuVxtGBfxX0GN1KG0tchZwdaEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769924; c=relaxed/simple;
	bh=TDij//lCWY7he7Ok3rLRBwXncLSPSWE83xM6Zo8Eq4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qj0pXXg2Z019gIa9EsAchmGqxHUR0Xb8BbxzPDjNYym1bRP3WDcsT7BCI6aDlvY625+NMDkH7p9rx2JLaytGN8suQyqZdNgN9B5FNga0r7ZyFr/CVF9+4U7faJ4H5OfCqe6Gxmggd2lRI7nfb4FUO00CmuDeCxgtPDs2UvCf+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XM6I19vV; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XM6I19vV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bCTU4ad3V8gf9noWeHBCwci+jkHN3102qasXnqo/LKE=; b=XM6I19vVSq45VjrZPfye042zqj
	lz/RllRY4BMGS9bBYZRpTEFeLadUXBw1EGUd7CDbdCGuge6T3cdCfQA/InX8zxQ0/2Dkknpgslqcn
	BYCBxVrlYON18cMyaCzSxk3DT43jrQvOVLrsmN7K0UkB6B8ttosC65upz6e/xWhcckNEOGXtT240t
	4bepFSxALRd4Gjbt31MzVtqQFkp5Kf2ErTgT3LmxmbmdSVJmPfesObHgmkwofxpaot3cVj0l7AmY3
	6T3YRu5u4BniRX4/l3dQnNfm1wkYm1ua6jBxha8/TWt/YJ20zfbWut97wCD8dkMPrqFhaYCgTNX0i
	JcD5k6sA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHSnI-00000000oAD-01uX;
	Tue, 20 May 2025 19:38:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7A8DA300677; Tue, 20 May 2025 21:38:31 +0200 (CEST)
Date: Tue, 20 May 2025 21:38:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, vschneid@redhat.com,
	Juri Lelli <juri.lelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250520193831.GB39944@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>

On Tue, May 20, 2025 at 04:38:09PM +0200, Dietmar Eggemann wrote:

> 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
> 
> With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
> 4 times per task switch in my setup) in:
> 
> __schedule() -> psi_sched_switch() -> psi_task_switch() ->
> psi_group_change().
> 
> There seems to be another/other v6.12 related patch(es) later which
> cause(s) another 4% regression I yet have to discover.

Urgh, let me add this to the pile to look at. Thanks!
