Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641893595E;
	Mon,  3 Feb 2025 15:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595745; cv=none; b=RBzpdU7T1vFS2TcqJJyMsEhvavXxUUrb/Bq6v4Wv4+mj7+4hyDzmEqSED/RA0ycDwx0j55YMS1+p8qqltDIAPDP5IzgprhbvnFCWKxz59LKcNWhYkGSfxev/Z57NpvP753rUrV9FCxH4lf2bnihxwX4vM2FN5SX5xmXhVDG3NYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595745; c=relaxed/simple;
	bh=oPafnppo9IWtNoM3iVeYeHYaZvftPEk+eTIVJcCbZyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1f0wUWKZuDuFvVdfeq5ylCtoPY1QejNVwPobHO4W89XTrBOAqt668MBbN7iWGQwaGe8PU4njD7dt9T73wCaCe12j84Mo+42zuAcJiKdVHXyl4lFC9kLWyEWcE6FEI2+Dk6LHFMWWpraTSKwUkkoWrpTEN1Fxictq5shVOd5ifQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYiLM2ff; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYiLM2ff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738595744; x=1770131744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oPafnppo9IWtNoM3iVeYeHYaZvftPEk+eTIVJcCbZyU=;
  b=TYiLM2ffxL2LRSFKhvjjQzsWgnzialxOaB/S7z7994mU/GKmW1uZvl8K
   nV1aTpPYYNIh/xI+Kpx/UC/mEANUOhE/uVrYQtwqPMNYBGhFhPVbJV+Bm
   Gep1ibBSXcfPmY+0xqOv2N9LwuylF7F6tKx6JQhYrNWI1lvRq5LK5O1f2
   UiMMK1prKIurC4HYFW0dD8U6fnPVoFcP2GMDZ/C0dqZ2cpwKv8Ld+ghNV
   OJ5BiLknZJQfqchaZzwperPUFI3bYcObk+HeREEt0wAxCdATTXmFLE7fp
   OBIPqPF5rXMwst4W7zKxo8mISMPSDEjp/6wb7tvV6wpPoipcpW7SAJ7Ki
   w==;
X-CSE-ConnectionGUID: SYXfLUGHRqiPxlpg+OkSvw==
X-CSE-MsgGUID: Yk/naKR1TYO+Em/qv+mdvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56628521"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="56628521"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:15:44 -0800
X-CSE-ConnectionGUID: 8RA3vAONQQ206RU5RKLVeA==
X-CSE-MsgGUID: 4YlovjsuTdqRS0pknCf4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="115344511"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:15:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1teyAi-00000007rxW-1zJW;
	Mon, 03 Feb 2025 17:15:36 +0200
Date: Mon, 3 Feb 2025 17:15:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/3] USB: phy: convert usb_phy_generic logic to use a
 faux device
Message-ID: <Z6DdmNiinydtRZFU@smile.fi.intel.com>
References: <2025020324-thermal-quilt-1bae@gregkh>
 <2025020327-economy-craftwork-8799@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020327-economy-craftwork-8799@gregkh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 03:25:19PM +0100, Greg Kroah-Hartman wrote:
> The usb_phy_generic code was creating a "fake" platform device to pass
> around in different places.  Instead of doing that, use the faux bus
> instead as that is what is really wanted here.

> Site note, this fixes a bug in the mpfs driver where the incorrect
> pointer was being passed to usb_phy_generic_unregister(), odd that no
> one ever hit this in the past.

Seems nobody ever removed (unbind'ed) the module at run-time.

-- 
With Best Regards,
Andy Shevchenko


