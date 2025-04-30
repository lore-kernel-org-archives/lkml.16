Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD57E0E8;
	Wed, 30 Apr 2025 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999936; cv=none; b=ZF4OkJiSBnNqDkwbuDYG3G0Qn4XPa686whil2zh4FJ9cjDJSjKiTQifq29pPZDiXSfFXeLHLJHcHme/ejvWzzwHnwHNrK+Im5azgp43qid/ke5oAyRSymQ45qVG1DM2ztEh9WVGre24bfC55JNrroGw+jE+LpWhBSSyHHrOc42g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999936; c=relaxed/simple;
	bh=cFRX/7ymuu4ViXj4PKPJ9YpybId6+ipgWQoROgASOJQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k1tSO8sisFdkeOxqJYkpa9xQw83DEdUnlxl2c18MSVAnePclXSCa4uOoyqvp75ZFTwo1J3E626T+dnMbIkerqAselkP4oLRV9iX4ehuTJKjCO1XY3BWcdqDrp086AtKJ7OU/t10vY+cfS6i1ggaz/0hQhzGzAeeJwP8Op+/D6e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azgecay1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azgecay1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745999936; x=1777535936;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cFRX/7ymuu4ViXj4PKPJ9YpybId6+ipgWQoROgASOJQ=;
  b=azgecay1vhWBJBWkVjjI5Vd2C3PKcCYygtEB3rIF+5UKSmBKUMLqVnT4
   mx8LHLAfuZmAJc358oml3ZD+N4IivpVXvXAIJChuKU51yvgrzEJvPId7p
   0V/+pas+JFvTY3ykbe7rcx6FA2DxP/o92ktsT9xcSPWaqcojtnUfIsSDt
   K1UVbaTi19arOWWRi04k4QH4vWPKOdCPgtUobsUjZy27Ai7ExcX+2NuYI
   CxYvej+PJBsPX0aL2SL+P7OC5QWnXmOnv0WrFHcS1GC1zShMr1+/pg/Pn
   ZBFN21Br6mnIAyA00u8wJhPRBfOJaQmOitwGysggDOjNt7ZoXUvtRDgw4
   A==;
X-CSE-ConnectionGUID: ZLpbKMHzSNG3FnziXKEH7A==
X-CSE-MsgGUID: 9Pw2j40MTzmDU5trgfiUyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47797783"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47797783"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:58:44 -0700
X-CSE-ConnectionGUID: BKh+t8mQQ/OXxMR7awRQaQ==
X-CSE-MsgGUID: BjhmomkHSFu9QPm1D3FwEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="165143575"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:58:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Apr 2025 10:58:35 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: ALOK TIWARI <alok.a.tiwari@oracle.com>, 
    Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 5/6] platform/x86: Add Lenovo WMI Gamezone Driver
In-Reply-To: <F54435E0-B3F5-4F99-9184-EE4D8D54DBD6@gmail.com>
Message-ID: <1108c3ac-4815-814d-82b0-2ba74311d883@linux.intel.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com> <20250428012029.970017-6-derekjohn.clark@gmail.com> <a18175cc-3513-4621-9d8d-e9556ede1022@oracle.com> <F54435E0-B3F5-4F99-9184-EE4D8D54DBD6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, Derek J. Clark wrote:

> 
> 
> On April 28, 2025 9:39:55 PM PDT, ALOK TIWARI <alok.a.tiwari@oracle.com> wrote:
> >
> >
> >On 28-04-2025 06:48, Derek J. Clark wrote:
> >> + * Determine if the extreme thermal mode is supported by the hardware.
> >> + * Anything version 5 or lower does not. For devices wuth a version 6 or
> >
> >typo wuth
> >
> >> + * greater do a DMI check, as some devices report a version that supports
> >> + * extreme mode but have an incomplete entry in the BIOS. To ensure this
> >> + * cannot be set, quirk them to prevent assignment.
> >> + *
> >> + * Return: int.
> >
> >The function returns int.
> >But logically it's returning boolean false, true
> 
> I may have overdone it by removing all bools after the v5 review as I 
> interpreted Ilpo's comment to mean I shouldn't return any bool c types. 
> I'll wait for them to weigh in before changing this back.

Hi Derek,

That is certainly a misinterpretation.

It's perfectly fine to return bool from a function. If there's no good 
reason e.g. because of some API that requires int return, booleans should 
be returned as bool.

I was trying to say your kerneldoc said "Return: bool" for a function that 
returns int. Both "bool" and "int" are C types so there was a contradition 
in that, which is what I tried to point out. Please write "boolean" if you 
refer to a boolean which is not "bool" typed (but consider what was said 
above and if the type too can be changed to bool in that case).

-- 
 i.

> >> + */
> >> +static int lwmi_gz_extreme_supported(int profile_support_ver)
> >> +{
> >> +	const struct dmi_system_id *dmi_id;
> >> +	struct quirk_entry *quirks;
> >> +
> >> +	if (profile_support_ver < 6)
> >> +		return false;
> >> +
> >> +	dmi_id = dmi_first_match(fwbug_list);
> >> +	if (!dmi_id)
> >> +		return true;
> >> +
> >> +	quirks = dmi_id->driver_data;
> >> +	return quirks->extreme_supported;
> >> +}
> >
> >Thank,
> >Alok
> 
> Thanks,
> - Derek
> 
