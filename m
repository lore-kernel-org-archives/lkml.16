Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2C314A4F0;
	Tue,  4 Feb 2025 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669202; cv=none; b=VU2wuQsi2sHyYHfiBVeYa+Th9OcADn/m/j7cb8nZTuWGt0D+ftmmvchnT4zMBYuZXfDltNvK9dSQmuwOYQrailHD5/RgMaIZ0E7awkSsMFt1zXZ08lubtlSbRVxafupb08zenkedOUQXDdvZTbobr2HokKRUt7w6v54qKSbPMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669202; c=relaxed/simple;
	bh=QS3I+mws3v4EkgFOsw0nFQtBcwHYt9nQ8egqqH1ZXUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWThGUXe+fNGWkMoFl4fTbTbZSDJqXApGmkf5UBxqX9997p/vrvWymRInjGOhLDbHoUf6RcahhFaNfXVrWIYQhzKaULb+ZX2VROq5wUOQYrgh/8ojEYaJmDSbh0FzZKXiyHF5pTjWmoBg2aIoQweCtH/lMQER0OmdYYgKMMC09c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RC4XUxnp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RC4XUxnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738669200; x=1770205200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QS3I+mws3v4EkgFOsw0nFQtBcwHYt9nQ8egqqH1ZXUc=;
  b=RC4XUxnprLpVhDk8oJIA842PFfDlyzjTlX3xnHDYf4hWL0O/d/qVTmLK
   KAQqDkJB1Y2dxqokwtRdyF34Kcp7/ImysLH2spso+rCHIuNcWy6T0QiWe
   8AWfmx4tiWxiXMeB8+q4Z1Tv4llkwEU0evOjw54SnxadXv+jn8nAs5HuT
   nT0mFO6Nf1a7302GiXdrbvML5gyJcykt33wsiaiySSkzdRsh+2dFW4tIr
   V1boj3+GjMC4BcnONeFkQ+oOfP2PLAjhxT2a6XWPwSoyaXy+a4VSMiBfX
   qbappndNg7V7CJeGgN/yL8GFKFMt3+4AlNBKpiq/VYbnEgRlPbmycIoko
   A==;
X-CSE-ConnectionGUID: sVu/VZN+QWelzBu8AuNifQ==
X-CSE-MsgGUID: J/9jnOVnQSW/JXO8qTkPrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43113413"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="43113413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 03:39:59 -0800
X-CSE-ConnectionGUID: neDC89gLR/iKuIcDbWiaWQ==
X-CSE-MsgGUID: AGlcaeQ5SN2FofYEq7rg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115757342"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2025 03:39:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EFFF0299; Tue, 04 Feb 2025 13:39:55 +0200 (EET)
Date: Tue, 4 Feb 2025 13:39:55 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Disable Gen 4 Recovery on Asymmetric
 Transitions
Message-ID: <20250204113955.GN3713119@black.fi.intel.com>
References: <20250131014406.28645-1-rahimi.mhmmd@gmail.com>
 <20250131014406.28645-4-rahimi.mhmmd@gmail.com>
 <20250203084224.GE3713119@black.fi.intel.com>
 <wxgsteiuto6qivnfttzuyw6jijs6ypcq4oyepqr6zbjgeez3ac@flvlpzswuyco>
 <20250203123944.GJ3713119@black.fi.intel.com>
 <gdojzsdm6kmg6kdoubhg3h6ebedyjswwzofdzxhfcbbdl3gsy2@wqpqcdukpn4h>
 <20250203125906.GK3713119@black.fi.intel.com>
 <20250204111624.GM3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204111624.GM3713119@black.fi.intel.com>

Hi Again,

On Tue, Feb 04, 2025 at 01:16:25PM +0200, Mika Westerberg wrote:
> On Mon, Feb 03, 2025 at 02:59:07PM +0200, Mika Westerberg wrote:
> > On Mon, Feb 03, 2025 at 12:43:04PM +0000, Mohammad Rahimi wrote:
> > > Hello again.
> > > 
> > > On Mon, Feb 03, 2025 at 02:39:44PM GMT, Mika Westerberg wrote:
> > > > Hi,
> > > > 
> > > > On Mon, Feb 03, 2025 at 12:25:21PM +0000, Mohammad Rahimi wrote:
> > > > > Hello.
> > > > > 
> > > > > On Mon, Feb 03, 2025 at 10:42:24AM GMT, Mika Westerberg wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On Fri, Jan 31, 2025 at 01:41:27AM +0000, Mohammad Rahimi wrote:
> > > > > > > Updates the Connection Manager to disable the Gen 4 Link Recovery
> > > > > > > flow before transitioning from a Symmetric Link to an Asymmetric
> > > > > > > Link, as specified in recent changes to the USB4 v2 specification.
> > > > > > > 
> > > > > > > According to the "USB4 2.0 ENGINEERING CHANGE NOTICE FORM"
> > > > > > > published in September 2024, the rationale for this change is:
> > > > > > > 
> > > > > > >   "Since the default value of the Target Asymmetric Link might be
> > > > > > >   different than Symmetric Link and Gen 4 Link Recovery flow checks
> > > > > > >   this field to make sure it matched the actual Negotiated Link Width,
> > > > > > >   we’re removing the condition for a Disconnect in the Gen 4 Link
> > > > > > >   Recovery flow when Target Asymmetric Link doesn’t match the actual
> > > > > > >   Link width and adding a Connection Manager note to Disable Gen 4 Link
> > > > > > >   Recovery flow before doing Asymmetric Transitions."
> > > > > > > 
> > > > > > > Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
> > > > > > 
> > > > > > I did some minor modifications and applied to thunderbolt.git/next. Please
> > > > > > let me know if I missed something.
> > > > > > 
> > > > > 
> > > > > Looks great. Just one question:
> > > > > 
> > > > > In tb_configure_asym(), if tb_switch_set_link_width() fails, we won’t restore
> > > > > the link recovery status. Is that okay?
> > > > 
> > > > Good question :) Looking at the ECR, does it actually say anywhere that the
> > > > CM should needs to re-enable it? I'm thinking that we could just disable it
> > > > and be done with it?
> > > 
> > > Right. Thanks for clearing that up.
> > 
> > I'll check with the HW/FW folks still if they have any suggestions. I'll
> > keep you updated.
> 
> Did not hear anything from them yet but I adjusted the patch slightly to
> restore ELR if tb_switch_set_link_width() and also added back the check > 0
> which I missed. Let me know if you find issues with this one. Thanks!

Okay got response now. It turns out this feature is something CM needs to
enable if needed (e.g it is not automatically enabled by any router) and we
don't do that which means this patch is not necessary, sorry. I'm going to
drop it for now. Let me know if you think otherwise. Thanks!
