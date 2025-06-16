Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2A61E98E3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084697; cv=none; b=Vu2OW6PAt6CjHCRiP7ak/fMlz56VzhEPZjPwWpUr+PkR+dgJOmUNGaQjYtZ/MB1720g7l4AMMChzOT1ws0Y9q/LWqEmyPzkQIgmc+Q0BAAD4aEyQ6sz432Ya6MnMRIZKtAwHIqk/xpPdEmYuNVTmNX8C0cH0HIkpaP5guwAHoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084697; c=relaxed/simple;
	bh=jFzL5zxqR3AFGI90svFU1jIbLE29dwYEavdSV4Mvycc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc5J2bbymwGOEJxAeHTFwL3crDgvO2lS4XIBnGCHAELSgh+AnO+h8RuqCYxmT/Nbe2IJT3pJU4VLGkTp4GWL4ZttsGLDS9CFNo3J4rd6QmZ1N7gqPIvk5PhNn9+ARM6saaw7+PxLUIpkRI2/1fXU1HF+2y0T61aGADNYdk9DfNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tdHsLx6i; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tdHsLx6i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hhI/PPdrsCZfn56an+dU/qpyarTHRiW4AXw4sUGA6jQ=; b=tdHsLx6iYe1NyDwqwSSSWFgw5i
	qJHHTZRjffKbyioR1iSxbGu7PNvhKHmti48JaC1ggQaLyuWrWSB9QtXZO7nc+ad1vL0e5EvUvVaOk
	Dm3RfsmZoOs9D7j8HGRxoKZN+Uy9GBUm2h8sJm1PCAZDnLbqzgfhFZIskDEAU9PUMg4uUPbgLAKF8
	09Jmrq9sYWaxAxN24JdFAeupsS630FmO0mxaU0VG52p9uWWlgxcN7KpTTvB2IdSPLkJN61gAw6hAN
	LG/tcGsUgQJlhA9Tqfc6Y/I1Wptv7FqaMiHIjIvfW/ZTL/hyrIs2JTkiV9nU0LxmGFEE+f8za0F9T
	GajdUQQA==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAyH-0000000G3SR-3dxy;
	Mon, 16 Jun 2025 14:38:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7C35030D551; Mon, 16 Jun 2025 16:38:00 +0200 (CEST)
Date: Mon, 16 Jun 2025 16:38:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, akpm@linux-foundation.org,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
	acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v4 10/13] x86/mm: Simplify clear_page_*
Message-ID: <20250616143800.GE1613376@noisy.programming.kicks-ass.net>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
 <20250616052223.723982-11-ankur.a.arora@oracle.com>
 <b53d59de-1aba-41f0-a908-e574f3db5958@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b53d59de-1aba-41f0-a908-e574f3db5958@intel.com>

On Mon, Jun 16, 2025 at 07:35:48AM -0700, Dave Hansen wrote:
> On 6/15/25 22:22, Ankur Arora wrote:
> > clear_page_rep() and clear_page_erms() are wrappers around "REP; STOS"
> > variations. Inlining gets rid of the costly call/ret (for cases with
> > speculative execution related mitigations.)
> 
> Could you elaborate a bit on which "speculative execution related
> mitigations" are so costly with these direct calls?

Pretty much everything with RETHUNK set I would imagine.

