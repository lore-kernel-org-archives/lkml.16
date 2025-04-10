Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C51DE3A8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271316; cv=none; b=EZhk3atMkAgoe7/CYSPMLlE4NvicWZuHhZT8L1OPB6+ad64RVulphLWSNEvOEMkeEfp0Du1zo3Xvgrrffm04dQIjcdyb5GxuuLaREqUdpnLx2P3ansaKOsYATwiqC5TLnsRnw0KrP3EfOxgT4u6rpZuRDtgxdITUob+Bv9qoH4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271316; c=relaxed/simple;
	bh=LgIAuQP6QdIhxX5yxBAjpHdlroh9SgSI8pbeM2m+PEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NI04Ub8+Ue9BDzqVYy19XXwTxUD3kwNOq/+A6PHrKSwoCQmoP50Pc5h5GGWAaqGyQdSWXvR0KrSAfHDwrDwpq8OyHebw4QQpHseGHNfrljXHWEpHhZ81KCGkIWHRK/3MpejZYOEutHILfquyuqfYflkqN24rvQ8orY7qNZZlkXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sLOiQWtr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sLOiQWtr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LgIAuQP6QdIhxX5yxBAjpHdlroh9SgSI8pbeM2m+PEY=; b=sLOiQWtrRhrul+oqReZVAIzbwj
	KoVdRPCQ1lu0UbdYkxolPQ4J1BeczneaE2OcAioyTyxmcJjQEGRGkumdrqmQ7AhaSaHZmo3fSREWC
	N0ErNSwSoch0Yv2U/v6WkQbVstHs3Y+Zt7vPY+efIxNq31pLc578nOAgI5AUuf8VsW70fNzB6ujkf
	Kzho6GzKGzXe5thtUpki1QuSTn5AGmbYgnFvRPLoHuQBV7DbCmA0iOZWePD7a6I91GU9tRTJCtAas
	1KyHeq6jK7dvVweY1kmDdj/0u2RTWlEXf/8dQVlef09AjdkwTijHYCVCJtDjnDeyg2p2cCnwictPg
	+9bwJknA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2meC-00000002Zrd-3ESr;
	Thu, 10 Apr 2025 07:48:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 05EF73003C4; Thu, 10 Apr 2025 09:48:29 +0200 (CEST)
Date: Thu, 10 Apr 2025 09:48:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Xin Li <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 06/20] x86/msr: Standardize on 'u32' MSR indices in
 <asm/msr.h>
Message-ID: <20250410074828.GU9833@noisy.programming.kicks-ass.net>
References: <20250409202907.3419480-1-mingo@kernel.org>
 <20250409202907.3419480-7-mingo@kernel.org>
 <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com>
 <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com>
 <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com>
 <3B57B3E5-47C9-4196-AD2B-44916E18B6D0@zytor.com>
 <3e2a52c5-791a-4e96-a768-8579ec841dd1@zytor.com>
 <e3d8db6a-dfb9-49d5-8c7f-b4a1d2faf575@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3d8db6a-dfb9-49d5-8c7f-b4a1d2faf575@zytor.com>

On Wed, Apr 09, 2025 at 11:14:12PM -0700, H. Peter Anvin wrote:

> No, and as you know, I'd like to get rid of the native_ and xen_ functions
> entirely anyway.

I have vague memories of locations where we *have* to use native_{rd,wr}msr()
because the paravirt indirections cause problems.

I don't clearly recall the reasons, but it could be instrumentation
related. The paravirt muck has tracepoints and other crap included.

