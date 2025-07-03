Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEEB23741
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547066; cv=none; b=V+b4VkpDIL6gJlptP0x1loe5DUi4ZxOtcuYtCtsttj01YeEL12IdY3QKCD8HgVo6ym5FacckHbbCpVsqHDpGNcaZGwouz+huKc2uCNaWjLsjJufKzQC/vj8qRGxryxoXCOPkyDXqIR3+lFAztElwHpV40/NqfvtDJ+08kyqPseY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547066; c=relaxed/simple;
	bh=vLXRb4psUfw5gtZYyp0xrhHd0P/XV1aMbdOo02eldyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uO2gJRn4/xDZALKAeuzbY/zTWKBbzB0FSQSH89q7iX1AEm26XD+f1Y+21+VBgisroFZmALUYL6tAOsYjq2hBU2UYISiPwGQWZDtguAN9733aC14FmJr9L4u3SK9uhJoLjDU2/u7SWwqK+9HLmZ4D9t7YWWC1RjfQSZSm7X9rujg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vesh5JP+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vesh5JP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751547066; x=1783083066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vLXRb4psUfw5gtZYyp0xrhHd0P/XV1aMbdOo02eldyA=;
  b=Vesh5JP+2Lby4PuACdVTPcsDd1mcKu2s2E2IlpvbWo7MN8utowJNTJWW
   Gu0uVkk6YrlMfGoKBbzYXFlIWQ1CefGjBrOGTQaRXcAxQ8b74q0/PNSvj
   Zz2fX1JhVF+fuTZZdBPLFD4haZn97FIgpKmJU2hn81nGI0s3z3eh4sgU2
   gXIHr3LnZ5FDVOIRO+NL6gx/hk0hpyephN83B0Zbg5ihovH27v+60X9Q+
   JSejhIIVA7DYsuEDDft6wvY6zngZNDiyuX/jqSD4rX2ptrQ2jDUxS0i/Z
   px1N1Q6yiTB5eCLYECVDQCaRNHodUcycZIsrQeXk0BzbQJZmpUe4R1/Dh
   Q==;
X-CSE-ConnectionGUID: mEc15nvGSsyctzcz/KpJvA==
X-CSE-MsgGUID: ysk6QT1fTfS+h0917k05zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53738273"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53738273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 05:51:05 -0700
X-CSE-ConnectionGUID: X9XXZWoQS4qdZpV1dqHBLw==
X-CSE-MsgGUID: ulNTQwE/QR+bdsLbcdyh9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="160058623"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO stinkbox) ([10.245.244.205])
  by orviesa005.jf.intel.com with SMTP; 03 Jul 2025 05:51:00 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Jul 2025 15:50:59 +0300
Date: Thu, 3 Jul 2025 15:50:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Matt Wagantall <mattw@codeaurora.org>,
	Dejin Zheng <zhengdejin5@gmail.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/4] DO-NOT-MERGE: drm/i915: Use poll_timeout_us()
Message-ID: <aGZ8s2mQCmvYK7w1@intel.com>
References: <20250702223439.19752-1-ville.syrjala@linux.intel.com>
 <20250702223439.19752-4-ville.syrjala@linux.intel.com>
 <9bca3e31879af4ba4abd9cb3c5bd89e80ec013f1@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bca3e31879af4ba4abd9cb3c5bd89e80ec013f1@intel.com>
X-Patchwork-Hint: comment

On Thu, Jul 03, 2025 at 03:12:39PM +0300, Jani Nikula wrote:
> On Thu, 03 Jul 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Make sure poll_timeout_us() works by using it in i915
> > instead of the custom __wait_for().
> >
> > Remaining difference between two:
> >                | poll_timeout_us() | __wait_for()
> > ---------------------------------------------------
> > backoff        | fixed interval    | exponential
> > usleep_range() | N/4+1 to N        | N to N*2
> > clock          | MONOTONIC         | MONOTONIC_RAW
> >
> > Just a test hack for now, proper conversion probably
> > needs actual thought.
> 
> Agreed.
> 
> I feel pretty strongly about converting everything to use
> poll_timeout_us() and poll_timeout_us_atomic() directly. I think the
> plethora of wait_for variants in i915_utils.h is more confusing than
> helpful (even if some of them are supposed to be "simpler"
> alternatives). I also think the separate atomic variant is better than
> magically deciding that based on delay length.
> 
> I'm also not all that convinced about the exponential wait. Not all of
> the wait_for versions use it, and then it needs to have a max wait
> anyway (we have an issue with xe not having that [1]). I believe callers
> can decide on a sleep length that is appropriate for the timeout, case
> by case, and gut feeling says it's probably fine. ;)

Yeah, we've not really done any work to justify the polling interval/backoff
strategy. At some point it would be nice to collect some statistics to see
what the typical wait durations are, and then perhaps tune the polling
interval on a case by case basis to be at least somewhat optimal (short
enough to not cause significant delays, but long enough to avoid excessive
polling).

-- 
Ville Syrjälä
Intel
