Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFCA2EB5BC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950990; cv=none; b=qbPOc5u3IqvU+WYQolyBVFWDgLR24sOSMPMmb/Sg2bWKOQj2lbeUltGOQiwpIRHXbp7ne9kMfCEylwkahRWL+169R3tir7GpO3n80moHvTYZIAeRX6WqvUuF9Jepf2WG6bjmCBHwEQPqd6CcMDVS2QS2uWPchn47NG8bY897yAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950990; c=relaxed/simple;
	bh=vzjk8bGrqWez7QWvHDgN5uqasr79Gx9gG7/5GusfDUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M5vGZmbZ7otyS2HcEIwxUqWIpbEkdbPEtGEHc54adEBUg/Hwq+yFhiGw5pvF+AkK4tkc0/KmwlEjn0xbs+LsGBTSIT720mjtu/1Q/0uoi+rQsk/RkPdkmRVT3ibIciCTkGdypVPukwUCQSDouFvbKH09v3BZkLZAhlKYWhHU71Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSp781j5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSp781j5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750950989; x=1782486989;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=vzjk8bGrqWez7QWvHDgN5uqasr79Gx9gG7/5GusfDUk=;
  b=LSp781j5oCng3G9Qsn5GcNBLpfXP26dztjvaIuFIwA3a8sWlrZVUXDLm
   r+hcLRQ4VEs2AvgTebtqV2cxPdbeW/tFmRdPG/UeUhi9Yrq6PL6xKwiwW
   3GEsRVRKrN9KxY+Nvy77FKpO3uFqGpAtNUFsz+MibSTs977yTOuK0mEYb
   fPUs0pnh0+U4KFiSDtX08I9TqnRIFtPPZZdf7RkoFGtgwIKBOT8Akg4RM
   oQGBAM4KmTpLXhHqF+vr8q3DI88efZUOqh36kA4ypzd1vPxJgEN8NLHcD
   vBJwmUmw1zdE7avUefhQjiPmb3xBylh3jOIFNBISUa0lS/s4t5ZRCvqGs
   A==;
X-CSE-ConnectionGUID: l++SZ9xySdK9E4v9wlf2lg==
X-CSE-MsgGUID: pYOKyk3mTLepPFkLtjp+HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53396821"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53396821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:16:29 -0700
X-CSE-ConnectionGUID: EUMIUsY8SN6rCmTrXjA1Tw==
X-CSE-MsgGUID: Mc5IxZpcSHeLGNSyRgdihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153282513"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.120])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:16:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, Thomas
 Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] iopoll: use fsleep() instead of usleep_range()
In-Reply-To: <CAMuHMdU+tgMqHcU8Fwr_XVE9RfNEGHnbEYHQ1DraE=YRvQxJuw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250626145119.2048423-1-jani.nikula@intel.com>
 <CAMuHMdU+tgMqHcU8Fwr_XVE9RfNEGHnbEYHQ1DraE=YRvQxJuw@mail.gmail.com>
Date: Thu, 26 Jun 2025 18:16:23 +0300
Message-ID: <7875cadfb12b1d2e8def412346d61716a6a98107@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 26 Jun 2025, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Jani,
>
> Thanks for your patch!
>
> On Thu, 26 Jun 2025 at 16:51, Jani Nikula <jani.nikula@intel.com> wrote:
>> Sometimes it's necessary to poll with long sleeps, and the accuracy of
>> usleep_range() is overkill. Use the flexible sleep helper fsleep() for
>> sleeping in the read_poll_timeout() family of macros to automatically
>> choose the appropriate method of waiting.
>>
>> Functionally there are a few consequences for existing users:
>>
>> - 10 us and shorter sleeps will use usleep() instead of
>
> s/usleep/udelay/.

D'oh!

>
>>   usleep_range(). Presumably this will not be an issue.
>
> Note that udelay() does not sleep, but loops.

Quite right. IIUC this is because for short delays it's more efficient.

BR,
Jani.

>
>>
>> - When it leads to a slack of less than 25%, msleep() will be used
>>   instead of usleep_range(). Presumably this will not be an issue, given
>>   the sleeps will be longer in this case.
>>
>> - Otherwise, the usleep_range() slack gets switched from the begin of
>>   the range to the end of the range, i.e. [sleep/2+1..sleep] ->
>>   [sleep..sleep+sleep/2]. In theory, this could be an issue in some
>>   cases, but difficult to determine before this hits the real world.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>> Not really sure who to Cc, given MAINTAINERS doesn't match this. Adding
>> some past committers.
>
> Oh well ;-)
>
> Gr{oetje,eeting}s,
>
>                         Geert

-- 
Jani Nikula, Intel
