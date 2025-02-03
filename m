Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E51FFC69;
	Mon,  3 Feb 2025 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586390; cv=none; b=HF4A5ukelFSGZ54EjIcPej46cPLLJ5JlYMqOSi2WqjJ1FpiKENFuVAxvzpa489pyU4fuLb9hlBcL3cRBzgRs5LOstEHbw0ibI1acpkz0CzaL1ZqAg5ZNTtztEKkUYrvtMCBPtOqg9XYaHPAac62gTwZjKwO8J4oG9t+rG+AIkJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586390; c=relaxed/simple;
	bh=VI/zRRPwWJGwjTfK1doMii0lZOHq4x4pk2UaCs7wC60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+FXfcbRl5GQMflTmqAzdVmLAUkUcR2f+rxhy50fwzmGOlGXiJmgNIyUhENgYA7iPXHmYFL8ETnlmhliErZsZaeNwucjU1n9JIaKqfEulgnw//fq6M+EPewRX6fJijYOxCocVdnV2YcNYGwX6gpaYUDAvz2yGlx2050qR7Mxtyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Abe+fKH+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Abe+fKH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738586388; x=1770122388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VI/zRRPwWJGwjTfK1doMii0lZOHq4x4pk2UaCs7wC60=;
  b=Abe+fKH+2H0+ExppaSG2faQTjN3EjwdRuOb5fumreP4vPV6NuFUhEqfx
   yD1NT9165dpF95S/njIuABFx/80P/ThWGeHkOlCUf1l9ewwcX/5qCQory
   xkmPLIP4hBGlB9e+FPfMJXXU7oNObvZxhBxUns9ERpMxCSZ0LFXx+0TNI
   pEWCLync4PyRO/2txmX76KngE+682fPGZKCwrqXv8x/aJ0DevOTDyOGdS
   MEBfc01QLj/RK/xXjiR5KUyNMGNKwahjQ9DGf9Ml3RNTqTFo59PTxIM5H
   rSqDR/1U2sAz7DLdF5vnxQdfI7UsOSC/iWgoKPak7B3abcyoopL1KlSRS
   g==;
X-CSE-ConnectionGUID: NKdA/Rl+T5Gm9rTX4iSujA==
X-CSE-MsgGUID: Eyyx9yPkSyi6mWBJpPBSkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49331414"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="49331414"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:39:48 -0800
X-CSE-ConnectionGUID: uWxTffBRSJS2xrBVV7PAdQ==
X-CSE-MsgGUID: oCAW5Z/WQXu9xWAzc3ZTAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110843030"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 03 Feb 2025 04:39:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EC31823F; Mon, 03 Feb 2025 14:39:44 +0200 (EET)
Date: Mon, 3 Feb 2025 14:39:44 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250203123944.GJ3713119@black.fi.intel.com>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
 <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
 <20250203084224.GE3713119@black.fi.intel.com>
 <wxgsteiuto6qivnfttzuyw6jijs6ypcq4oyepqr6zbjgeez3ac@flvlpzswuyco>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wxgsteiuto6qivnfttzuyw6jijs6ypcq4oyepqr6zbjgeez3ac@flvlpzswuyco>

Hi,

On Mon, Feb 03, 2025 at 12:25:21PM +0000, Mohammad Rahimi wrote:
> Hello.
> 
> On Mon, Feb 03, 2025 at 10:42:24AM GMT, Mika Westerberg wrote:
> > Hi,
> > 
> > On Fri, Jan 31, 2025 at 01:41:27AM +0000, Mohammad Rahimi wrote:
> > > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > > flow before transitioning from a Symmetric Link to an Asymmetric
> > > Link, as specified in recent changes to the USB4 v2 specification.
> > > 
> > > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > > published in September 2024, the rationale for this change is:
> > > 
> > >   "Since the default value of the Target Asymmetric Link might be
> > >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> > >   this field to make sure it matched the actual Negotiated Link Width,
> > >   we’re removing the condition for a Disconnect in the Gen 4 Link
> > >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> > >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> > >   Recovery flow before doing Asymmetric Transitions."
> > > 
> > > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > 
> > I did some minor modifications and applied to thunderbolt.git/next. Please
> > let me know if I missed something.
> > 
> 
> Looks great. Just one question:
> 
> In tb_configure_asym(), if tb_switch_set_link_width() fails, we won’t restore
> the link recovery status. Is that okay?

Good question :) Looking at the ECR, does it actually say anywhere that the
CM should needs to re-enable it? I'm thinking that we could just disable it
and be done with it?
