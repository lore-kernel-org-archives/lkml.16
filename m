Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BEA204595;
	Mon,  3 Feb 2025 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587563; cv=none; b=mwQR6O9SlUcNkJlYqMx1ZaTbB48UcEJK4dmi86syLlrKo585ohUg8A00wpP2ujPjE5BrKEFVAazs5m+QqIsZSJFWw/ZMxXAM9hgwmjUGndOFbDq4r+SDnTkZFX4Hj4Qxawib+GVjwFzdXMVIlpIZU8p7uFEz0FTQujgLEzKFrg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587563; c=relaxed/simple;
	bh=MhEkliF53H57DR5syUwKIR4P8l84NgWwj5+fCyr7K9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfYGSOpFkV5JKHMjUf7MPXh7DH4gbNczCwf91j7VfZvOSg9mKUOX5p1hAcOOFBzVCQVdQ5u1Fx5OK1vGaIFEu63ZIaicKHc/Jr7DMsNJ9C/DLO0ZdWwMFhDYIas9OQJJHfANKXzgWTmLo94eZi49FDgAxdacS8Ob+Lq9vS9IKUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIpsboO9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIpsboO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738587562; x=1770123562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MhEkliF53H57DR5syUwKIR4P8l84NgWwj5+fCyr7K9A=;
  b=RIpsboO9hKrG7e5UaRY8npXN7/ZFUzum5xLvf44UjdUKo8rJrtLQNZbK
   B9i9fMK/6ZemkPq5ffSzbMSnvdz2aFvBNiEnYFGI79uep0v69SyOj/Buy
   dCq4uqNPev+ccM9Ee+KSJyJt3IGtKO5Sn7nDFeFpDdE6WiynDJgRAm3nB
   Zr7taxj90E9puoPRbquj/ZyrPRe5kjCQ8FioERPaWo93e+dCjjMF0UTNW
   jgNZwH+Hmtx0r0VdAX7hf1NObjaYSjkHLWfoIGdzm9HfnQrb9JXYQw6kx
   kf0KfYGMbUPxrIsp1fbxIrB6UCRX020snQkvwLcj5q2P5xJUlt9aVRvQ9
   A==;
X-CSE-ConnectionGUID: Yu5Nr7WbTEiFctJBsVhyTw==
X-CSE-MsgGUID: 7fXQCkl6TMKwRD6zdczaaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50465549"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50465549"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:59:10 -0800
X-CSE-ConnectionGUID: a17op1NAQZWFGtfRvkonbA==
X-CSE-MsgGUID: /NqSXB9dSNa1JJ4zLRUsAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110041490"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 04:59:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 2249A23F; Mon, 03 Feb 2025 14:59:07 +0200 (EET)
Date: Mon, 3 Feb 2025 14:59:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250203125906.GK3713119@black.fi.intel.com>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
 <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
 <20250203084224.GE3713119@black.fi.intel.com>
 <wxgsteiuto6qivnfttzuyw6jijs6ypcq4oyepqr6zbjgeez3ac@flvlpzswuyco>
 <20250203123944.GJ3713119@black.fi.intel.com>
 <gdojzsdm6kmg6kdoubhg3h6ebedyjswwzofdzxhfcbbdl3gsy2@wqpqcdukpn4h>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gdojzsdm6kmg6kdoubhg3h6ebedyjswwzofdzxhfcbbdl3gsy2@wqpqcdukpn4h>

On Mon, Feb 03, 2025 at 12:43:04PM +0000, Mohammad Rahimi wrote:
> Hello again.
> 
> On Mon, Feb 03, 2025 at 02:39:44PM GMT, Mika Westerberg wrote:
> > Hi,
> > 
> > On Mon, Feb 03, 2025 at 12:25:21PM +0000, Mohammad Rahimi wrote:
> > > Hello.
> > > 
> > > On Mon, Feb 03, 2025 at 10:42:24AM GMT, Mika Westerberg wrote:
> > > > Hi,
> > > > 
> > > > On Fri, Jan 31, 2025 at 01:41:27AM +0000, Mohammad Rahimi wrote:
> > > > > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > > > > flow before transitioning from a Symmetric Link to an Asymmetric
> > > > > Link, as specified in recent changes to the USB4 v2 specification.
> > > > > 
> > > > > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > > > > published in September 2024, the rationale for this change is:
> > > > > 
> > > > >   "Since the default value of the Target Asymmetric Link might be
> > > > >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> > > > >   this field to make sure it matched the actual Negotiated Link Width,
> > > > >   we’re removing the condition for a Disconnect in the Gen 4 Link
> > > > >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> > > > >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> > > > >   Recovery flow before doing Asymmetric Transitions."
> > > > > 
> > > > > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > > > 
> > > > I did some minor modifications and applied to thunderbolt.git/next. Please
> > > > let me know if I missed something.
> > > > 
> > > 
> > > Looks great. Just one question:
> > > 
> > > In tb_configure_asym(), if tb_switch_set_link_width() fails, we won’t restore
> > > the link recovery status. Is that okay?
> > 
> > Good question :) Looking at the ECR, does it actually say anywhere that the
> > CM should needs to re-enable it? I'm thinking that we could just disable it
> > and be done with it?
> 
> Right. Thanks for clearing that up.

I'll check with the HW/FW folks still if they have any suggestions. I'll
keep you updated.
