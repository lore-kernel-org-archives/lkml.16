Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61BF2144BE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835799; cv=none; b=DfUM95GAM6G1LoUa5fiir1q539GpuM+6+r/+P6sl9823Irg0XAd9+bnr5UXcG8N5w9vi5HaeQQxTFOOvPOu/vJPq0EolVMX5NUWoZelUmGacATy1feOoatnJHkl/umilekYO/8kUSVBEJRj6vnDbCEG6RUC68wzxvVNfyFXL0pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835799; c=relaxed/simple;
	bh=7wfEFbVFC4Ecj3rIV98hb2bb6fi4+GfSZCN1wuOdV8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LP6oUTCWThgCK8X/bA28GyxCsNmLRtTDRpvM9btde/uEfSQbDNiAE6X7xushqAdQL9XUVSgiHUABB7yGuGlYFDMY4GfiDQPFjiHDNPvpAGlR5yRVgWJXbuGmVkCtSKQ0WdPtaQa76FdbADFP0dv9g9u/cQpGI9hOoe0RLlCMkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jq42jc1t; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jq42jc1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738835798; x=1770371798;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=7wfEFbVFC4Ecj3rIV98hb2bb6fi4+GfSZCN1wuOdV8A=;
  b=jq42jc1tInK87jItL1ag06e2W+RVLaqim12sK9wEBFENXQTrYm9xZ3/M
   JB/ATJsm3x/txEFV3WCgb8XJwtfx2nVgbc19R4tmFBbJEY7V7YnVQ2r1r
   GFcPc7GfKISWvWS0rbogO10Kc1BimDDnnAYlDvY0l0AXETZLynAmwB23m
   cDpEID5sKr4VvEwlWwWYz9yeFQsv3ys5qn7Hz/xqUvvX9ooBRVffTBkwQ
   yhMC+gDFVrWefljKKDiMFRfmbHdZmafpNRCkMnYF/aUGV0ig8GdBMN7xb
   Czn49Qq4OP1pQi+/uDH03+fyGZEq7gXL1BhMLh+U+Jxwoy21TvLNzC98a
   g==;
X-CSE-ConnectionGUID: phGx9TEhQDukzoJpIBwiIQ==
X-CSE-MsgGUID: 9iN52hBgSi6g6+f+K3NS/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39546847"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39546847"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:56:30 -0800
X-CSE-ConnectionGUID: fs9+3j7RTCiiAJ+RGq7EEQ==
X-CSE-MsgGUID: Lnq77CgzSby66NkeH0XU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111088047"
Received: from unknown (HELO ubik) ([10.237.72.184])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:56:21 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Nam Cao <namcao@linutronix.de>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Will Deacon <will@kernel.org>, Jon Mason
 <jdmason@kudzu.us>, Jaehoon Chung <jh80.chung@samsung.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jassi Brar <jassisinghbrar@gmail.com>, Pavel
 Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rob Clark <robdclark@gmail.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Zack Rusin <zack.rusin@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Takashi Iwai
 <tiwai@suse.com>,
 alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v2 00/45] Consolidate hrtimer initialization - Part 4
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
Date: Thu, 06 Feb 2025 11:56:16 +0200
Message-ID: <87ldujz9a7.fsf@ubik.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nam Cao <namcao@linutronix.de> writes:

> hrtimers is initialized with hrtimer_init(), and after that the timer's
> callback function is setup separately. This separate initialization is
> error prone and awkward to use.
>
> hrtimer_setup() combines the initialization and is simpler to use.
>
> Switch to use the new setup function. Most conversions were done with
> Coccinelle, see the sematic patch below.
>
> This series is intended to be applied to the tip tree
>
> v1 -> v2 https://lore.kernel.org/lkml/cover.1729865485.git.namcao@linutronix.de
>   - rebase onto v6.14-rc1

Link to v2 of part 1 is missing. It's also somehow not in my notmuch
datadase (looked for "hrtimers: Switch to new hrtimer interface
functions" -- took a guess based on v1) and is not googleable. It's kind
of important for reviewing this one. v1 did have the links to the other
parts, at least.

Anyway, sorry for being that guy, but can you fix this?

Thanks,
--
Alex
