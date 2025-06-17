Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F5231A37
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750181669; cv=none; b=O8TnhkjR/wVtfFA6rj5pJeV6X259KesFgUf6pxUwkWJCErDxatJgLLMenOHKTomy0kZy/ouJyyWMgUlO4DV7Kb/uZX89LEdpA5XR3rsTm0Ills3Rm6XkJ3NV0//2nXweSrJCskmmGtBP6WD+M6sJKrMiOm4m0UIfiM1NynMKu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750181669; c=relaxed/simple;
	bh=8OWWSPCDDIIwDYsGYom4AVqOne0w6l7B60o95VYkg8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lr1LH97v8rQDW4ViXHPA0oVBvENqVrPYIv/89meJEM2/a0xnRbo0ysYDZWzt/fUn9nfe1HxPfjQXMZgr3JDYwhKqgU00udEmJ8k2MW9Nte/1vSk28e3z5IfMYLd8jPzdzc3OC7GsY2XY2oV7+IKWrTbHk9DiIXyZLOh/5lRPrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BXvr6vKc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BXvr6vKc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t0CIhuOYbClFLmEawNrM0QLL4X/uIPMc9hdz0SZAWz4=; b=BXvr6vKcxFH0AKKE9nCN8P/hdx
	89oVTgLJc/NyaqiFVR+eEU/+m7ZZMZOghJJhjyprO6jT0BmrPdFxusQ143OUUYA6cKet6RyGP7ooU
	f06f2uNRT8KehWBVgB0Bjr2rbdaXg+On7xPJH7/9RDRczFVmidHSvD4oUY3CoHD/r2KMJTiJmixTy
	2h9XOoeaf74LceyG07HZk/FIIHKnvvb11lWORVzF5WfcyzFNntivzggBS/N0scBaaUaSYe/6rit8S
	HKvAHLTlk1OzFoHCV6whyfziPzYEZRigpwMPbJXXHpouWw9s+dnvmW98AIBcj4VNsdtAFdMIYJDnD
	xQVw6v0A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRaCT-0000000HRhQ-05VS;
	Tue, 17 Jun 2025 17:34:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7AEB030BDAD; Tue, 17 Jun 2025 19:34:20 +0200 (CEST)
Date: Tue, 17 Jun 2025 19:34:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 00/12] Support vector and more extended registers in
 perf
Message-ID: <20250617173420.GA1613376@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250617082423.GK1613376@noisy.programming.kicks-ass.net>
 <60c18595-c6a8-4c39-98fe-0822755fbdb7@linux.intel.com>
 <20250617142952.GX1613376@noisy.programming.kicks-ass.net>
 <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893f1888-b8cb-4976-a0d6-606460438d73@linux.intel.com>

On Tue, Jun 17, 2025 at 11:23:10AM -0400, Liang, Kan wrote:
> 
> 
> On 2025-06-17 10:29 a.m., Peter Zijlstra wrote:
> > On Tue, Jun 17, 2025 at 09:52:12AM -0400, Liang, Kan wrote:
> > 
> >> OK. So the sample_simd_reg_words actually has another meaning now.
> > 
> > Well, any simd field being non-zero means userspace knows about it. Sort
> > of an implicit flag.
> 
> Yes, but the tool probably wouldn't to touch any simd fields if user
> doesn't ask for simd registers

Trivial enough to have the tool unconditionally write a simd_words size
if the attr thing is big enough. But sure, whatever :-)
