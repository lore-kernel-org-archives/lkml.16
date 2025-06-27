Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47532BAF9;
	Fri, 27 Jun 2025 19:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051290; cv=none; b=HUzAarMm3q5LA204PVD+L8i8w1vEcjtq/MJpzImLbrMarKfdbtn62Q4XEIqP+nK4bckDwIYF/hV2wr3hEu4cFqJbovWImFnv1NhPMT7zolqezyNpgSgfvKr678Nmt84YCsMMQh7fxM2mdrODm6lilTlwhDNBXMUy4dNV6B1dg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051290; c=relaxed/simple;
	bh=h2V7n5lcId3Q5D9J9FBwMhLB7N9wwQBDYBQCNpHNKUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGLLBWmfmBz7hV5/h7Frf+ZK9HNGLuUuBn8fma73oa6Wt+B4/7AKV6Md0zIDlVzCrCDvPrR4o9F2VhcUaBdmlzN0F3UeE6JUaAQp0jdwPaXIkjV22jdtQYkkUpBDuQTQWlSQJ+Oppe6iD0R5x88OWNy+ZagFrkChIPF69mZkNFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pe/0J1kh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pe/0J1kh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751051288; x=1782587288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h2V7n5lcId3Q5D9J9FBwMhLB7N9wwQBDYBQCNpHNKUY=;
  b=Pe/0J1khOdln0qBRTGB87NHMnyMHpJbz3MhK2CHrWhaHomfepB95QRqh
   MmzWeawdJVXGCR4S+mKbJym9uVeGj50DsuLAKlBUTIneoXA3Vsbvaibvp
   e+5esCENLlD+fYhfEQfNMuIwGNd8J0N3//dQ/tm3mI0YzeXrDu6rw/f+U
   czS57C+2GSjRFMjiFcQ8l2zjMf38PpMSqN/ANZR6OkOwMSNGaGKg5AxdM
   7nOLXkW/oUlS24ln8w8zzK9oyeHgwX+XMF7tH0gxW1JBodwP/onFlzrNx
   IUiuDrGLmirk4avjNqQB1DAIQbQW5XTm2hPKbezncHbGU6DOLK/1hXWzI
   g==;
X-CSE-ConnectionGUID: /9jdx+iFRGSxA9iKhMnWHQ==
X-CSE-MsgGUID: nAP/FOt7TxiRQJTaHA/j7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70806780"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="70806780"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 12:08:08 -0700
X-CSE-ConnectionGUID: xiHlSFjZSpCMu6OQRMYUZg==
X-CSE-MsgGUID: xnkBiDgXTrKpHNSSnyugrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="183794875"
Received: from tjmaciei-mobl5.ger.corp.intel.com (HELO localhost) ([10.124.221.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 12:08:07 -0700
Date: Fri, 27 Jun 2025 12:08:06 -0700
From: David Box <david.e.box@linux.intel.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	srinivas.pandruvada@linux.intel.com, andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com, 
	xi.pardee@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH V2 00/15] Intel VSEC/PMT: Introduce Discovery Driver
Message-ID: <blofpgaq2o3jcy2h4mbpbm2zpnpniroz5agvvqvfs4qf5o2pwm@7spetkpvs7u7>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
 <aFxahfwnntrMFumI@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFxahfwnntrMFumI@agluck-desk3>

On Wed, Jun 25, 2025 at 01:22:29PM -0700, Luck, Tony wrote:
> On Mon, Jun 16, 2025 at 06:40:24PM -0700, David E. Box wrote:
> > This patch series introduces a new discovery driver for Intel Platform
> > Monitoring Technology (PMT) and a set of supporting changes to improve
> > telemetry integration across Intel VSEC features.
> 
> Caution. Part 14 has this "Subject:"
> 
>    [PATCH V2] platform/x86/intel/pmt/telemetry: Add API to retrieve telemetry regions by feature
> 
> which is missing the "14/15" "b4 am" does warn:
> 
> 	ERROR: missing [14/15]!
> 
> But my eyes skipped over that, and then I got surprised that the
> DISCOVERY driver was missing from my kernel.
> 
> With part 14 manually applied things seem good.
> 
> -Tony

Ah, I forgot to reset the numbering to 14/15 when I respun this patch. I didn't
even notice. Thanks for spotting it and testing Tony.

David
