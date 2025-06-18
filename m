Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F27F9CB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257953; cv=none; b=R76Dzv8Uo0sp8EHajrrS9VhnpdLkfG63nSAKCvTRFYQKxa0mYAOWzz2waqVhRKS9Sv5G/a1IelF0IozyFnwgcZjcoCdbl8nby4NfRLMA9rJO0sqbE54pLB4/29ih50VTjW1i5wFPaX+O1O9GZB1vUwXzotu7/AJWW1P1eFe4O4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257953; c=relaxed/simple;
	bh=3PMenXLIAleTQFLPxN1TrTm7bTq0JqnHSJ2681Ke1qA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5mqTrFMFJJYEvo4hBfNI/hkAot1UNczYmqOA2ShC2RSLTPbQihx8GjgZDPbQ+Wo0v3TGeaCli+BnZYrHWuWYWQoLlZIFz46t3TSFbnZMsKiwmx0WUHt3DirSqS97nfgUtURMGfHhAxrz55yhogwzKyTG7tDBab+ihdYQEz0K/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LpqQRJKG; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LpqQRJKG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CdQZ8qypEmHTOwhRReMpAgIHTzFIKXyL9o3uWNhSCCU=; b=LpqQRJKGBoLwjSMFGCA8rPt5aW
	d8zcyC8x70cdN/JYOAFDxAlXt8/T9t7ovVM3ymgWRCwohFVSalyPbAKL8sGqM/mfP6mGw2g444cmS
	ubHzQnpzEYeEGAFWlVSkcScgdU/noM5e4CuYoYQTxTZ4y+iOtlrvqWlAgvjtimfdFFWXDwlMd+wbo
	0WEvCvx5fhm3mgyIFCoBCW2rUw/JRGCfkP58yohn8MEg0FTyn5cWRkDj5pph2LzadQVRY1VmFAsTL
	U2MV81oafVwz6YNTDdwDhwdM9NjhkhY1jCZjCnI65BZHTJnsObJfEasxXz1tuHg0q6kAVnuni+FeK
	UvIVJnsg==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu2t-0000000473U-09ke;
	Wed, 18 Jun 2025 14:45:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1F75E307FB7; Wed, 18 Jun 2025 16:45:45 +0200 (CEST)
Date: Wed, 18 Jun 2025 16:45:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	"Mi, Dapeng" <dapeng1.mi@linux.intel.com>, mingo@redhat.com,
	acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com, broonie@kernel.org
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <20250618144545.GD1613200@noisy.programming.kicks-ass.net>
References: <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
 <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>
 <20250618093500.GH1613376@noisy.programming.kicks-ass.net>
 <0782de41-c8c4-4077-8498-651fb9a10ef5@linux.intel.com>
 <20250618133003.GC1613200@noisy.programming.kicks-ass.net>
 <99087e26-192f-4fa6-b43b-0c6a39c45b38@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99087e26-192f-4fa6-b43b-0c6a39c45b38@linux.intel.com>

On Wed, Jun 18, 2025 at 09:52:12AM -0400, Liang, Kan wrote:

> I didn't know we have the alignment requirement for the output.

Perf buffer is in u64 units.

> If so,
> 
> PERF_SAMPLE_SIMD_REGS := {
> 	u64 vectors_mask;
> 	u64 pred_mask;
> 	u64 vector_length:16,
> 	    pred_length:16,
> 	    reserved:32;
> 	u64 data[];
> }

I really don't think we need this complication; XSAVE is a real pain in
the arse, but I think we have enough bits in XSTATE_BV to tell what is
what.

