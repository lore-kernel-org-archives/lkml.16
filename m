Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967FD2EF669
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170600; cv=none; b=X0Vwd9PDclsHq6aP94EE9WoUYnBABdqRYsWGPCAA5Jn36sPcHpvQOa4vzF1y2BAJD9LGx1C3QP2tuC83bJojVf+P0j673e4YxOqvDXvW5Wy/hFe0Z7oA0X7GFd3PAihDehzeUcc5pmt4HGXLZuErE3Ygmhq4OPQ4Jqr205coEaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170600; c=relaxed/simple;
	bh=wQBSi560Q6ixzt0Z9ENUjJvYFTIvSeY+ncJetU4x0P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhBWh/Z8DpKJFxE4UT7dCcNXzgcAhveA/Aj3oEgYuiLnadTeE25kVEYpAJS0GTfC3Nvw9nDCNGqvDcM+2y/QD/4i/w+9oAkt+TVn2+7AXMFX1YBizV1bjxNW2TQ8V9dAK8IRnlr2j4ubbpZ04PX07Bxqor2y1As4TynsoXXCbbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZiBIiMJh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZiBIiMJh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sCez4xS1hbMlpdj5PCY433QXRYRw9bZNICE5E/5C3zo=; b=ZiBIiMJhkWr3wKPPyMo3VPIPO1
	J+26EudI6yYmBWmhVT0YM2+xOq1xUh9zeYPsp8M721kbFIDK35O/4yy7cqzUBPL0raL2BPV+sO4pS
	l/Xtbf9aj1DJ2C1+B7OtrV8L3uLecuMqPx+FR7AjD9+NDZlcLXcOw7pJz9K3AFHnYXuSKwrseEWGh
	x2vCS95NH+uOs20n0oJX+ZBOkhphU/XihaW0X9nRrsE+lZTTAHs10+IavgEQk5lJu7TCpU3I7DmQb
	kQZg9JyflzIfUK67QABfpKvEa0rOxjLUkDsTxRHkTVoVINGG/0upl3nfhXQFx6qDRMTlDcDcl2lnd
	yKIGL8WA==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXJx-0000000HG1R-1FMk;
	Tue, 17 Jun 2025 14:29:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CD5A530BDAD; Tue, 17 Jun 2025 16:29:52 +0200 (CEST)
Date: Tue, 17 Jun 2025 16:29:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
Message-ID: <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
 <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>

On Tue, Jun 17, 2025 at 09:52:12AM -0400, Liang, Kan wrote:

> OK. So the sample_simd_reg_words actually has another meaning now.

Well, any simd field being non-zero means userspace knows about it. Sort
of an implicit flag.

> It's used as a flag to tell whether utilizing the old format.
> 
> If so, I think it may be better to have a dedicate sample_simd_reg_flag
> field.
> 
> For example,
> 
> #define SAMPLE_SIMD_FLAGS_FORMAT_LEGACY		0x0
> #define SAMPLE_SIMD_FLAGS_FORMAT_WORDS		0x1
> 
> 	__u8 sample_simd_reg_flags;
> 	__u8 sample_simd_reg_words;
> 	__u64 sample_simd_reg_intr;
> 	__u64 sample_simd_reg_user;
> 
> If (sample_simd_reg_flags != 0) reclaims the XMM space for APX and SPP.
> 
> Does it make sense?

Not sure, it eats up a whole byte. Dapeng seemed to favour separate
intr/user vector width (although I'm not quite sure what the use would
be).

If you want an explicit bit, we might as well use one from __reserved_1,
we still have some left.
