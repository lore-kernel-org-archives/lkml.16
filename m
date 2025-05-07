Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D52039ACF
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610356; cv=none; b=ZtMwJ8SFtFKGlP/tzEN17ORF9+GadO3rwkUwtCxedgg5Yb4003R8dnmdgw5eBJYYkjwgL0I1Ep/KdGffJ9ksxIrOWt+jYXsQct8RiCmk0+b2yJXaxSmO33AilfQQ5ER3qMtyefBBhKniNB1NgUOvviUkQV01uY0cp04RpzegZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610356; c=relaxed/simple;
	bh=J2R93UzTVb7CbyhVllcTkTkUf/7r32WFKlNat9suHEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msmTJmaUt7TIVQFx0VNmAPeFdKuklSbxtz5OnEgRA2HRL+j91HA4gcYI4+Eomiy5lWhGEuybOhtEDVC9SOpmNGA/6DHgnlLCiGlr4H0nn+HyJdvot9eJC+hv2RYWKQb5GeN+OrRQsd1J0/OjEFuaSdH2u+ihYYiDoxN0Wxuky7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YM+qO1S7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bX0s/o+8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YM+qO1S7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bX0s/o+8"
Date: Wed, 7 May 2025 11:32:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746610353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hJU9gUSyqy/IDG+zmBgqBXltz9wtMMR6YwuF4WrvREY=;
	b=YM+qO1S7y8UcIAx7/Yr9PTPVU3sw88wBpiXsAFLXI/ZfZQ63rWJ0Y1PNBA+gMh+qX4WAMc
	gleLRCAxt+EfdhP5Q/QmqH7ygNRCxZ0OQcQcca0ZSpruDcNjGLlEdmi/a457DSltbzlMCi
	1iVnIIOiXfc0mCALyY7ZbJWHd4gfiQ0OWoRSZy4Ie8AzWwzasdXCEoPTxBqN2zS9DaeCLo
	qKsx9Q6dhZWuiCO1BPD7uUoJLuzpYRCEhbCAVSW3KDX4toG+U06hvQT9HWiHqScDWtAbzb
	GOJMgOzYhTV8KUS8OVSGm9oWmE6XtJpWfQDx27JUG+0vcX4xtvdn3j6JTZXkNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746610353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hJU9gUSyqy/IDG+zmBgqBXltz9wtMMR6YwuF4WrvREY=;
	b=bX0s/o+8UhuakGN82OFZ27mfHRTwrYekQ4boP8E4+ncWGk9ztlOyFwuJ58UhVWszX1dPEv
	OxnHfnLp/jawboBQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 00/26] x86: Introduce centralized CPUID model
Message-ID: <aBsor3iOb0SJsLSQ@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <aBnSgu_JyEi8fvog@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnSgu_JyEi8fvog@gmail.com>

On Tue, 06 May, Ingo Molnar wrote:
>
> Wrt. <asm/cpuid/api.h>, we'll need a few followup cleanups there too
> I think, such as migrating to the cpuid_*() namespace:
>

Perfect, then I'll move ahead and do a "CPUID headers cleanup" patch
queue /before/ moving into a v2 of this series.

Any other wishes in that domain?

> Rename have_cpuid_p() to cpuid_feature() or so.

ACK.

> I find the cpudata_cpuid_ namespace a bit confusing:
>
>	__cpudata_cpuid_subleaf_idx(__table, __leaf, __subleaf, __idx)
>	__cpudata_cpuid_subleaf(__table, __leaf, __subleaf)
>	cpudata_cpuid_subleaf(_cpuinfo, _leaf, _subleaf)
>	cpudata_cpuid(_cpuinfo, _leaf)
>	cpudata_cpuid_nr_entries(_cpuinfo, _leaf)
>	cpudata_cpuid_index(_cpuinfo, _leaf, _idx)
>	cpudata_cpuid_regs(_cpuinfo, _leaf)
>	cpudata_cpuid_index_regs(_cpuinfo, _leaf, _idx)
>

> All of CPUID processing is related to 'data', and we don't
> really have any 'cpudata' primitives, so the cpudata_ prefix is
> confusing to me.
>
> It's particularly confusing for methods like cpudata_cpuid(),
> which sounds like a generic method, while in reality it accesses
> subleaf 0, right? Why not name it cpuid_subleaf_0() or so?
>
> My suggestion would be to use a structure like this:
>
>	__cpuid_subleaf_idx(__table, __leaf, __subleaf, __idx)
>	__cpuid_subleaf(__table, __leaf, __subleaf)
>	cpuid_subleaf(_cpuinfo, _leaf, _subleaf)
>	cpuid_subleaf_0(_cpuinfo, _leaf)
>	cpuid_leaf_nr_entries(_cpuinfo, _leaf)
>	cpuid_leaf_index(_cpuinfo, _leaf, _idx)
>	cpuid_leaf_regs(_cpuinfo, _leaf)
>	cpuid_leaf_index_regs(_cpuinfo, _leaf, _idx)
>
> Or so?

Yeah, that's honestly much much better.

(cpuid_subleaf() is already a raw CPUID OP at <asm/cpuid/api.h> now, but
 luckily it has one external call site, so it'll be easy to rename.)

> In my book it's a nice bonus that they thus become part of the overall
> cpuid_*() API family. Note how these accessors still are all still
> either cpuid_leaf_ or cpuid_subleaf_ prefixed.

Yeah, now a single <asm/cpuid/api.h> makes full sense as well :)

Thanks!
Ahmed
