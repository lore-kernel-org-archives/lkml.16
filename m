Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A5321A43D;
	Mon, 30 Jun 2025 20:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316694; cv=none; b=a4K5776n3kmdSxAQM6GiIbR+oSv0t/hBhjisflGbLqq5REEU393cnEp1EyyyJY+d+fx7FX3ZGfCZ5AL6SjReTcNs+B2WvZTjpwpRZ4HDjg7c5RKQC2gHQhh7hwv4gWg30w4qzX9LhZm3dY9RWSuLnT/ENJh1riyuW29xPP0oy2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316694; c=relaxed/simple;
	bh=jMxtMwqXwF7qUvR7M33dRiLGGUU+aCZiySH3T86+zb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMbBYTH8/vnRXhKk7Ifon6RF4gyuSe5c0m8QTTXrzeLhB3dDMfMZ5fEW8UyPXfIm4MQSYuLlG7EgcexUTmkEA4Lh1GI9zax+BdA5hOFV0iOo7pDuoIthiJKCC9uIdlSofptqeSPmM3exzYuH6bvcU5gxa4ly4gHbhEboAOC6Aig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7es4E/F; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7es4E/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751316693; x=1782852693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jMxtMwqXwF7qUvR7M33dRiLGGUU+aCZiySH3T86+zb0=;
  b=Y7es4E/FmWDbd2AcTAZ7+E5+tf1QACC0YuSb6YgIdX/dQnkum5WtJQn7
   DGoA8+dC6oXVenMHM5gp7HuubthQ1gY759tAT/wdEQPBGFq+mbOrFB90t
   F/d2odVNCzV/TFzauq+PUaLxGLCS95IImo47kIrLbfFFo/eNERtrHu0Qx
   21b0/ooscLu3rwOWq+zf7fi+M0NzTWR9nKk1kE/MBPXKwltTKPWrbt35B
   VzZoeeGSRnxB7wxlbbg432Fulr2HEHlW+3ZQ+zI/vLg9ROnYSky/asSmn
   c1mwHAy4qzWuuahq1BNvOJ6HjpYTq/SD7BUfwd+Z1qeceDMkdw6eTAABk
   w==;
X-CSE-ConnectionGUID: QDuSbKI0SgGMK6+8Dsaz+A==
X-CSE-MsgGUID: iRXMJmE/TbizBacaoJP+8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52671237"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="52671237"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 13:51:31 -0700
X-CSE-ConnectionGUID: qturN3IFT5OZWhSkcbbhtQ==
X-CSE-MsgGUID: QJjfrE9wT62teaTKikTwgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="190738906"
Received: from ldmartin-desk2.corp.intel.com (HELO localhost) ([10.124.221.227])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 13:51:30 -0700
Date: Mon, 30 Jun 2025 13:51:29 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, xi.pardee@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH V2 03/15] platform/x86/intel/vsec: Create wrapper to walk
 PCI config space
Message-ID: <7kombko2ybkjvaolmwkgedo4qy2ifgu44gjypopgh4sjmgfnmy@pzlflvvpacej>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
 <20250617014041.2861032-4-david.e.box@linux.intel.com>
 <1b2fc196-fc27-f782-e7d6-86b72d950fe7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b2fc196-fc27-f782-e7d6-86b72d950fe7@linux.intel.com>

On Mon, Jun 30, 2025 at 03:02:33PM +0300, Ilpo Järvinen wrote:
> On Mon, 16 Jun 2025, David E. Box wrote:
> 
> > Combine three PCI config space walkers — intel_vsec_walk_dvsec(),
> > intel_vsec_walk_vsec(), and intel_vsec_walk_header() — into a new wrapper
> > function, intel_vsec_feature_walk().  This refactoring simplifies the probe
> > logic and lays the groundwork for future patches that will loop over these
> > calls. No functional changes.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > 
> > Changes in v2:
> >   - No changes
> > 
> >  drivers/platform/x86/intel/vsec.c | 31 ++++++++++++++++++++++---------
> >  1 file changed, 22 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> > index 59fb6568a855..f01651f498ca 100644
> > --- a/drivers/platform/x86/intel/vsec.c
> > +++ b/drivers/platform/x86/intel/vsec.c
> > @@ -349,6 +349,27 @@ int intel_vsec_register(struct pci_dev *pdev,
> >  }
> >  EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
> >  
> > +static void intel_vsec_feature_walk(struct pci_dev *pdev, bool *have_devices,
> > +				    struct intel_vsec_platform_info *info)
> > +{
> > +	/*
> > +	 * Both DVSEC and VSEC capabilities can exist on the same device,
> > +	 * so both intel_vsec_walk_dvsec() and intel_vsec_walk_vsec() must be
> > +	 * called independently. Additionally, intel_vsec_walk_header() is
> > +	 * needed for devices that do not have VSEC/DVSEC but provide the
> > +	 * information via device_data.
> > +	 */
> > +	if (intel_vsec_walk_dvsec(pdev, info))
> > +		*have_devices = true;
> > +
> > +	if (intel_vsec_walk_vsec(pdev, info))
> > +		*have_devices = true;
> > +
> > +	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
> > +	    intel_vsec_walk_header(pdev, info))
> > +		*have_devices = true;
> 
> Should have_devices be named something more specific in this function or 
> perhaps be simply the return value for this function?

Yes. Will change is to features_found and just return it directly.

> 
> IMO, the name of the function could be better too, having "walk" in the 
> name feels unnecessary internal detail compared to what this function 
> tries to do on a more abstract level.

Will change it to intel_vsec_discover_features(). Thanks.

David

> 
> > +}
> > +
> >  static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  {
> >  	struct intel_vsec_platform_info *info;
> > @@ -372,15 +393,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
> >  	priv->info = info;
> >  	pci_set_drvdata(pdev, priv);
> >  
> > -	if (intel_vsec_walk_dvsec(pdev, info))
> > -		have_devices = true;
> > -
> > -	if (intel_vsec_walk_vsec(pdev, info))
> > -		have_devices = true;
> > -
> > -	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
> > -	    intel_vsec_walk_header(pdev, info))
> > -		have_devices = true;
> > +	intel_vsec_feature_walk(pdev, &have_devices, info);
> >  
> >  	if (!have_devices)
> >  		return -ENODEV;
> > 
> 
> -- 
>  i.

