Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE6C2882C0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748373879; cv=none; b=V4c3D98mwkFEdn6WxvOmECjFIh78xwWwLF254lqlfrPne7WiTzlGcTIt+s9SVAsmWRfUHjjnuG/5A9kZ7iJ3fDymwHMgiaLHOUHCaO2ZshnDME0YKepvuZ6/nUms5Y9+vwvYHA+vCRF7pZCTm+k8GwejEFTc3tyQ/MKG1rrP8XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748373879; c=relaxed/simple;
	bh=ntw/8psZ7bfxneDfhhEexKAZ6oulFJnYo89SZiJwBzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V/KVmqCJKipkVTovTbdDVqDh5qQB+lm8+x84R1xLYc30tATdYNk35KCEox4Bsfb8D01tdVPrgfWoh0Pp0rZvBmehnPCgBSA8KCq9chSa01V59Jj3tEbw5C8H5/1uoQaDCCL/AtAsF+Kj3l/uEQ8OjAl2jNCjtX+D1dtdG7/gAWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGRxpqux; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGRxpqux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748373878; x=1779909878;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ntw/8psZ7bfxneDfhhEexKAZ6oulFJnYo89SZiJwBzs=;
  b=YGRxpquxxOruR0fE+TfgoSk7ka5YcRjaFvBNNd2iiJTgeynkYg7X1Mj4
   L6tX0kkENo6rhm3eLCKANfxA6exURXAgHcdnN+r2BRIbcFQg8O9qmb7o/
   OGaW/Fa4ZCIuMDUwd1QldpcyW1+lvgTTrJIJqfguz+kUjF4mH6oS95EQo
   paiHhOTqs6Kfn/5HslroYx/W2Xwufy/qi+lZLkXX/2H6Ez8gCUQnNXpHM
   U/+he/mJx40vQN+jZVwqTBCz6NCbm5zhBsuwfi/GmlhEIMUDT70/J4KpE
   YQcpWJ3XCS7itTVUNmPqg/tcf1f7GxA/vuGQp7Xfl6z0ugNhRdf+cHyhy
   g==;
X-CSE-ConnectionGUID: k2fAjVYdQoiu3GWGQbzKOQ==
X-CSE-MsgGUID: SJQ7mBTNTUqjxiaaExYMMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50269201"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50269201"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:24:38 -0700
X-CSE-ConnectionGUID: NeuleRm5T/qKTWvmmtRRLw==
X-CSE-MsgGUID: 4eoINnEhQqaFaWdoQpz9Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142905777"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.23])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:24:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250527-origami-mayfly-of-superiority-2a1cf1@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com> <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
 <8210f7fc0dbcfc5b1eea47ccb762c7e53b45236a@intel.com>
 <20250527-origami-mayfly-of-superiority-2a1cf1@houat>
Date: Tue, 27 May 2025 22:24:30 +0300
Message-ID: <d1218b60108894832ce4ac3aedfa11988e985e98@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 27 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> On Fri, May 23, 2025 at 02:34:05PM +0300, Jani Nikula wrote:
>> On Tue, 20 May 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> > Maxime -
>> >
>> > I'm cutting a lot of context here. Not because I don't think it deserves
>> > an answer, but because I seem to be failing at communication.
>> >
>> > On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> >> You still haven't explained why it would take anything more than
>> >> registering a dumb device at probe time though.
>> >
>> > With that, do you mean a dumb struct device, or any struct device with a
>> > suitable lifetime, that we'd pass to devm_drm_panel_alloc()?
>> 
>> I'm no expert in ACPI, but I think it needs to be a struct device
>> embedded inside struct acpi_device to implement the
>> drm_panel_add_follower() lookup for ACPI.
>
> What data do you have in the ACPI tables to associate the HID
> touchscreen to the panel?
>
> drm_panel_add_follower use the DT to lookup the panel, so the panel must
> have a device->of_node pointer, so that obviously won't work, but it
> might with ACPI, or we might need to split that function into several
> parts to accomodate ACPI.

Personally, I'm pretty clueless about ACPI, but apparently it's possible
to add a _DSD to reference the panel.

And something like [1] could work to make drm_panel lookup agnostic to
DT/ACPI, but it's completely untested and unreviewed as of today. We'll
also need to find someone to help ensure that doesn't break DT systems.

Feedback is welcome, but please bear in mind I'm not even confident
enough to post it on dri-devel yet.


BR,
Jani.


[1] https://gitlab.freedesktop.org/jani/linux/-/commit/8ca2e1f25ca94c4ee094915a26781f9d9ace37af


-- 
Jani Nikula, Intel
