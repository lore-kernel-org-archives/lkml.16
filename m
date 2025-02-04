Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F95202C34;
	Tue,  4 Feb 2025 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667790; cv=none; b=oKmhioLT+r+WmjOkx1zUMKPbSyuK5A5I9KqX7qJnj3Au21T2zutVY8u90YMjTC+RAoO8BFS0tSAEL6LR0Sx1ErQ8pg1MP89rIQO4mC+aswbwum5gSl1/3QNqG11DkIe6lHohgKYPwFs2TiWVQS26VL4Le6Jj2v7SOmNSLSBp3Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667790; c=relaxed/simple;
	bh=aO1TjNkwittiXIEvBSZzQuoL2JWhEZXpWMLS7+xv7TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNVSn6jMm02HrHWrITuvsn2umk/7Z/yt5gD8CU4GMzDHwckUHscFnT0iV5sM5FGCNfwmJw0Xy7VWPWuyhQ4SGyvSKBBJpTqFxHQgfQ9qVRxzJwrG8FUGU/0m4hXXsw9eThsk8YPZ1P1Aq2s4swXzMjFz0F+tY+QyBTUjHBx+61M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIdf5JzF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIdf5JzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738667789; x=1770203789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aO1TjNkwittiXIEvBSZzQuoL2JWhEZXpWMLS7+xv7TU=;
  b=FIdf5JzFN3otCXhjv+uJepo8qr6SQmzgs0AALccPZxdn03SlkPe68Wwe
   Cthh6KQ3wDgiYuzqyIFX+iZp3/x1K5yymFr3ZCqwolJy8BxXwBwaXQtpc
   9ILcJqxuIQ6gysEz2MePuermJfUKLbxPr9X/uiGg1qE8rYeczeR08VZXY
   sFHoIcKbWFdN1mbOn4m8UDSvd9SYetHmOmsm3bN0HK8FGOslZqtVtojx7
   Mxf2H+yXq3usOlbiRk/eKwMFux66go6enfibVLo6VkNmWY9UYAoLzkve+
   EMtIOLZoMCta97TcowqqbpsH+Mzc/szg+OclO3K3pHCK1FOeLLmg3RIiv
   g==;
X-CSE-ConnectionGUID: WDSmYwoITQKdLYn+VA6P6Q==
X-CSE-MsgGUID: u4nR5ZB3R5mHDqlGUglF+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38891732"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="38891732"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 03:16:28 -0800
X-CSE-ConnectionGUID: 6DnH6d90R52aUF3QtORZFw==
X-CSE-MsgGUID: KxTBnXAjTi+oIQI1Y00Y6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115561812"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 04 Feb 2025 03:16:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0EA3425B; Tue, 04 Feb 2025 13:16:24 +0200 (EET)
Date: Tue, 4 Feb 2025 13:16:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250204111624.GM3713119@black.fi.intel.com>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
 <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
 <20250203084224.GE3713119@black.fi.intel.com>
 <wxgsteiuto6qivnfttzuyw6jijs6ypcq4oyepqr6zbjgeez3ac@flvlpzswuyco>
 <20250203123944.GJ3713119@black.fi.intel.com>
 <gdojzsdm6kmg6kdoubhg3h6ebedyjswwzofdzxhfcbbdl3gsy2@wqpqcdukpn4h>
 <20250203125906.GK3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203125906.GK3713119@black.fi.intel.com>

On Mon, Feb 03, 2025 at 02:59:07PM +0200, Mika Westerberg wrote:
> On Mon, Feb 03, 2025 at 12:43:04PM +0000, Mohammad Rahimi wrote:
> > Hello again.
> > 
> > On Mon, Feb 03, 2025 at 02:39:44PM GMT, Mika Westerberg wrote:
> > > Hi,
> > > 
> > > On Mon, Feb 03, 2025 at 12:25:21PM +0000, Mohammad Rahimi wrote:
> > > > Hello.
> > > > 
> > > > On Mon, Feb 03, 2025 at 10:42:24AM GMT, Mika Westerberg wrote:
> > > > > Hi,
> > > > > 
> > > > > On Fri, Jan 31, 2025 at 01:41:27AM +0000, Mohammad Rahimi wrote:
> > > > > > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > > > > > flow before transitioning from a Symmetric Link to an Asymmetric
> > > > > > Link, as specified in recent changes to the USB4 v2 specification.
> > > > > > 
> > > > > > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > > > > > published in September 2024, the rationale for this change is:
> > > > > > 
> > > > > >   "Since the default value of the Target Asymmetric Link might be
> > > > > >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> > > > > >   this field to make sure it matched the actual Negotiated Link Width,
> > > > > >   we’re removing the condition for a Disconnect in the Gen 4 Link
> > > > > >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> > > > > >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> > > > > >   Recovery flow before doing Asymmetric Transitions."
> > > > > > 
> > > > > > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > > > > 
> > > > > I did some minor modifications and applied to thunderbolt.git/next. Please
> > > > > let me know if I missed something.
> > > > > 
> > > > 
> > > > Looks great. Just one question:
> > > > 
> > > > In tb_configure_asym(), if tb_switch_set_link_width() fails, we won’t restore
> > > > the link recovery status. Is that okay?
> > > 
> > > Good question :) Looking at the ECR, does it actually say anywhere that the
> > > CM should needs to re-enable it? I'm thinking that we could just disable it
> > > and be done with it?
> > 
> > Right. Thanks for clearing that up.
> 
> I'll check with the HW/FW folks still if they have any suggestions. I'll
> keep you updated.

Did not hear anything from them yet but I adjusted the patch slightly to
restore ELR if tb_switch_set_link_width() and also added back the check > 0
which I missed. Let me know if you find issues with this one. Thanks!
