Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF92D77FB;
	Thu,  3 Jul 2025 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535822; cv=none; b=BO7c2NYB6pFuDCn5pXs65xaA7n3BkQjLU7AULgianYKo+fWWTkDx5Sa6kSTt19vLkMZ6pnpxI3lcFRTbcQ5LO0wAvuqppmPQF00IbgLIaSC713VtvGwJqRRPtJAhpdhbuTJbZbkxg91L7HvP91Lxrn9Tbk9+dxMubScVejIeQK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535822; c=relaxed/simple;
	bh=74sNjQK4bMhnkAul06LKeIboYlJTfjWjpSpL5D0y0v0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JucmM7Q31WnIL50nhLJaQQ7XwhsY3OMKKrPrHSG4NwrKa7y/El4BFedwVJ2av1eWq69ISBuwXC5E+Vk5ls+NxKwk9uXKTqg0o7JSKz+q7KJfzzA0UdRzCMqj0uoCKdewAvyMbUPLP6Sr6yOZ5QTP1eWh9MUjU2qFo0kqfVi85iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GA/KMNvy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GA/KMNvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751535821; x=1783071821;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=74sNjQK4bMhnkAul06LKeIboYlJTfjWjpSpL5D0y0v0=;
  b=GA/KMNvywntkS4EM3zhv+uCpgXsEoEGdMm7kf8HgJQdLo/Yp73ayqf/Q
   Tk1g57eZfTMHFIBXhKt4HTw7WuLqCd7sf++U5T3tjf+CCgz8Z8ULrqq7J
   +v4btNPjEVAi787OCEhhImHCvwSKYFgOohYqE9k68vM7sx7o05nq7IFsB
   HOZbUgUK6UXq9piESghbQKno4drnXWeOl8OSNnznnb3oD6QJxdW75Y3As
   ypOkFBg1UcEHpmI48zwJ12BvDwhI9QU5SN2fT5K3n3pzzmHxnrKbE1ZxZ
   4NqOVhaaOqy90NzV8GHZEM7Td0mC8qrv5HedF6tOW9cfartcudb9lQ5y5
   g==;
X-CSE-ConnectionGUID: gD5/IKWIRtqC8DUv9JzGtQ==
X-CSE-MsgGUID: 6x2ieI+0Re2kn/J8KaG3NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="79287883"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="79287883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 02:43:32 -0700
X-CSE-ConnectionGUID: 6slLJaBXTna163eRzunTCw==
X-CSE-MsgGUID: SBwyUM+UQQSHJ4fkq54PWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="158883865"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 02:43:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 3 Jul 2025 12:43:23 +0300 (EEST)
To: Yen-Chi Huang <jesse.huang@portwell.com.tw>
cc: Guenter Roeck <linux@roeck-us.net>, hansg@kernel.org, jdelvare@suse.com, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
In-Reply-To: <62e4e647-9eb4-4329-89f4-6b2b897ba15b@portwell.com.tw>
Message-ID: <ec0d2c2c-6849-7863-bf0a-f1abb1747b44@linux.intel.com>
References: <a35d63e1-424f-48ac-bc97-cdb48929f40d@portwell.com.tw> <a25733d7-535c-44b8-973c-0bc0c99047c3@roeck-us.net> <62e4e647-9eb4-4329-89f4-6b2b897ba15b@portwell.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Jul 2025, Yen-Chi Huang wrote:

> Hi Ilpo and Guenter,
> 
> Thank you both for the review and suggestions.  
> Apologies for the missed cleanup in the includes.
> 
> On 6/27/2025 7:34 PM, Ilpo Jarvinen wrote:
> > On Fri, 27 Jun 2025, jesse huang wrote:
> 
> >> +static const struct pwec_hwmon_data pwec_nano_hwmon_in[] = {
> >> +	{ "Vcore", 0x20, 0x21, 3000 },
> >> +	{ "VDIMM", 0x32, 0x33, 3000 },
> >> +	{ "3.3V",  0x22, 0x23, 6000 },
> >> +	{ "5V",    0x24, 0x25, 9600 },
> >> +	{ "12V",   0x30, 0x31, 19800 },
> > 
> > Those registers appear to be always consecutive so it looks unnecessary to 
> > store both.
> 
> Some ECs use little-endian while others use big-endian register ordering.
> 
> To maintain flexibility and support future boards with different endianness,
> both registers are stored explicitly.

When do we expect to see patches to support those other boards? I think 
the endianness should be only added then, unless the patch is really 
around the corner.

Besides, wouldn't it make more sense to record the endianness instead if 
the registers are always next to each other anyway? Do we expect there's 
need to handle disjoint parts?

> >> +static const struct pwec_hwmon_data pwec_nano_hwmon_temp[] = {
> >> +	{ "System Temperature", 0x02, 0, 0 },
> >> +};
> >> +
> >> +static const struct pwec_data pwec_board_data[] = {
> >> +	[PWEC_BOARD_NANO6064] = {
> >> +		.hwmon_in_data = pwec_nano_hwmon_in,
> >> +		.hwmon_in_num = ARRAY_SIZE(pwec_nano_hwmon_in),
> >> +		.hwmon_temp_data = pwec_nano_hwmon_temp,
> >> +		.hwmon_temp_num = ARRAY_SIZE(pwec_nano_hwmon_temp),
> >> +	},
> >> +};
> > 
> > What's advantage of having these in an array?
> 
> To support multiple boards with different sensor configurations in a scalable way,
> the hwmon data is structured as board-specific arrays.
> 
> I intend to store the hwmon configuration in the driver_data field of 
> the dmi_system_id table.
>
> This allows each board to carry its own sensor definitions, making it 
> easier to add support for new boards without modifying the driver logic. 
> Since the number of sensors may vary, the *_num fields in pwec_data are 
> used to validate the index range in hwmon_ops callbacks, ensuring only
> valid sensors are accessed.

I understand this. :-)

I was just asking why you need to place them into an array and not just 
have a separate struct for each board variation as is the usual pattern. 
(For boards which can share the struct, the variable name is usually just 
according to the firstly introduced board.)

So you'd have e.g.

static const struct pwec_hwmon_data pwec_board_data_nano6064 = {
	.hwmon_in_data = ...,
	...
};

Then when you have something else, you add another:

static const struct pwec_hwmon_data pwec_board_data_xx = {
	...
};

...Those can be put directly into driver_data without the intermediate 
array. So why is the array necessary?

> >> +		if (channel < data->hwmon_temp_num) {
> >> +			*val = pwec_read(data->hwmon_temp_data[channel].lsb_reg) * 1000;
> > 
> > linux/units.h ?
> 
> "1000" will be replaced with MILLI in the next patch.

As this seems temperature related(?), there's also DEGREE specific define 
which would be preferred over that unitless define (if applicable, of 
course).

-- 
 i.

