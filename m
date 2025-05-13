Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF59E552
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149398; cv=none; b=po28P57CLl1Vb1z7c3ItAfgNZGPgljQI5r2HEwtF1KV0NoDxs2v9pHolej51e6ldsifaouS5KEb2l6R0UGz8ceGzpsUrXaIbA+QfawK4lo86VTw0oW8qf3r/VP/xa+JI88cIwuENJPz17qK+vCsP7h37hXIfQ6En2UJMGWOuC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149398; c=relaxed/simple;
	bh=aiOTU7vUA4gioabCgI4bufsSuKWp+YVIoMGPUvvcOeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDeuXbL2QXqfVH88t4/n+z15V90Bdg0W0FPrTLwF3wEkh9ZJzXpeTSMrP1vqpPGX9UgDNl/1E9+TP04fv3eUc8BRpUcNNWFkMzfQm/33Tilc6I1BXosS0bMvCxnMCLeaSdSwuvRQQR1IZ8tdTQXnlROAru9VtY4um+i7S1Va2AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i9Nc5eFb; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i9Nc5eFb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kuaFg9Ljg4UZAzIxHqU3ZQPwlJnvlZCO60B7Cp8R9+c=; b=i9Nc5eFbVl85ONMypcRejPz9Ih
	P6O8N02Pq+Ul+ZniypDfaVZEy/KOPmTWMgbARx5+VFjBAwRm18hpxvEDbYQ8xFRGhKAilRgqtVjY0
	22mNRSLlfD+URkn+hr659MZzlm0lC6GlTNeQ3QwxuFXXolaLQNNtkD9GqNI2CvELiOAW6a4cdSmEz
	dH6qVzqi9WnnZoJStfbw6ylpyQdpSUXnvYTSE1jU5OIYFjxvEd3eALmg3So7T+HmdvnlxIvCh/Z5j
	xfXc39WHxerG94kT4gAtQWkQgXeskm/Ah3oSF5wwEFGLX0aInjUArryTTIfL0gqLAzct8YIuN3F/Z
	OjdtjTLw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uErMu-0000000H059-3Ggo;
	Tue, 13 May 2025 15:16:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 36E42300342; Tue, 13 May 2025 17:16:32 +0200 (CEST)
Date: Tue, 13 May 2025 17:16:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] perf/x86/intel: Add a check for dynamic constraints
Message-ID: <20250513151632.GB25639@noisy.programming.kicks-ass.net>
References: <20250512175542.2000708-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512175542.2000708-1-kan.liang@linux.intel.com>

On Mon, May 12, 2025 at 10:55:42AM -0700, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> The current event scheduler has a limit. If the counter constraint of an
> event is not a subset of any other counter constraint with an equal or
> higher weight. The counters may not be fully utilized.
> 
> To workaround it, the commit bc1738f6ee83 ("perf, x86: Fix event
> scheduler for constraints with overlapping counters") introduced an
> overlap flag, which is hardcoded to the event constraint that may
> trigger the limit. It only works for static constraints.
> 
> Many features on and after Intel PMON v6 require dynamic constraints. An
> event constraint is decided by both static and dynamic constraints at
> runtime. See commit 4dfe3232cc04 ("perf/x86: Add dynamic constraint").
> The dynamic constraints are from CPUID enumeration. It's impossible to
> hardcode it in advance. It's not practical to set the overlap flag to all
> events. It's harmful to the scheduler.
> 
> For the existing Intel platforms, the dynamic constraints don't trigger
> the limit. A real fix is not required.
> 
> However, for virtualization, VMM may give a weird CPUID enumeration to a
> guest. It's impossible to indicate what the weird enumeration is. A
> check is introduced, which can list the possible breaks if a weird
> enumeration is used.
> 
> Check the dynamic constraints enumerated for normal, branch counters
> logging, and auto-counter reload.
> Check both PEBS and non-PEBS constratins.
> 
> Closes: https://lore.kernel.org/lkml/20250416195610.GC38216@noisy.programming.kicks-ass.net/
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>

Yeah, that looks about right. Thanks!
