Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822462E7162
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167223; cv=none; b=hiV1j3DZ2+Vvrrwr2V06xDYRjT8kAE90kr0KEi2D4C+V/PF/qijR9PFGo9AJC0bjK7shpf6ORr9x4rRZGMSU29nM/eP+s4PeodqvsYEFeVcVkQ9H1uZhzTOptNbJpU4E/4xYZ1Cl8PbnyolGuef5tv9j4Pu8qtgSAJgLL+Psn9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167223; c=relaxed/simple;
	bh=3ZhmStOGZf56LKjbpFRdrjhHyqg5tGG9IYbPYH7L4GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEqed3fE3ZdutG8vxbvQDwBAgmjTglx+i/sBSRDkfgm5E8o+so+gnEGCIqEp7MQ/POcX6NDI9lEdxh9+RRZLPSSGs/4DjCyfxsdcM/fFJycKm5UBfFshMm0TZSWuSws6r4MBbIi5tF4L6lLcVHPc4wSaBMYBsrnsIGMBCNtRcEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FOpgH2ru; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FOpgH2ru"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=B0/yq5kUFeVi4rQvRYXL5/CAp45+JBoeH+Zgo7cgbwk=; b=FOpgH2ruBtQQs/muQ5aQyqxMzu
	TQdyD3SOPb/Cv39oTDDMWmX5ZKSZVeutFfz1g0EuL17ySE3cMaiYtoWHqgFRh3nmopiopqnO2eQFI
	/VWdbgaTOmyoWEVVqY8lPFjEACIg4r2aLTT0LvbAe/hI9BsRIzVGNAxTfGh0D9S7A9PQb9g6q4wCA
	Qrai7WqnQ2DSLJpkeu5CnXuCV+9VmYJZtA99hTypUfD3+7W84gSI+gPkQhoC+9+527pNFJMxGUjiy
	b+mnEaBGsLrtL4An5JS6QcJXCLk27U8vYCAEQYqGfoJsFv82IHQPNYCdo1JGroObp/C4bz8064ydG
	QxjMBGVA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWRT-0000000HC2l-0VPL;
	Tue, 17 Jun 2025 13:33:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B774030BDAD; Tue, 17 Jun 2025 15:33:33 +0200 (CEST)
Date: Tue, 17 Jun 2025 15:33:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: kan.liang@linux.intel.com, mingo@redhat.com, acme@kernel.org,
	namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
 <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>

On Tue, Jun 17, 2025 at 08:14:36PM +0800, Mi, Dapeng wrote:

> > We're going to do a sane SIMD register set with variable width, and
> > reclaim the XMM regs from the normal set.
> 
> Ok, so we need to add two width variables like
> sample_ext_regs_words_intr/user,

s/ext/simd/

Not sure it makes sense to have separate vector widths for kernel and
user regs, but sure.

> then reuse the XMM regs bitmap to represent the extend regs bitmap.

But its not extended; its the normal bitmap.

> Considering the OPMASK regs and APX
> extended GPRs have same bit-width (64 bits), we may have to combine them
> into a single bitmap, e.g. bits[15:0] represents R31~R16 and bits[23:16]
> represents OPMASK7 ~ OPMASK0. 

Again confused, bits 0:23 are the normal registers (in a lunatic
order). The XMM regs are in 32:63 and will be free if the SIMD thing is
present.

SPP+APX should definitely go there.

Not sure about OPMASK; those really do belong with the SIMD state. Let
me go figure out what ARM and Risc-V look like in more detail.

