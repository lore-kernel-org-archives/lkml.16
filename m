Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F17B1D8DFE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926538; cv=none; b=u91RsZ5Fgl1rOZiu4DwM7UQ/Kkr8ATRZp7+73O0ktSKOC/YX9ilcppJCH0l7dF6DX2xFuOE2coGC0GWxNGhuHavDLpUfx4wp3sOu370IxNrlV+YFNJCSPqgYiVyPjtzspT35tO3RM138QzImQkft1JKTcOyl27KJa9ZFZ2HoxB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926538; c=relaxed/simple;
	bh=Bp9oSq69NUXXLysWLLuF+UCdKtXJ9kpwt6EDZMcz600=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=t0tHe9gcbrPqjaPi6pVy+BcPFYScIIoI3x6R1vKHaU5Pl/A2MxD3AaNhNQGjcxNqhVT0K3iBf+PSG952SJzyVSQm33NENDqLQmeKC8Fj6zr5OhIrc9bvtCzicLLa6oB1nbvqin+tG0pZtPIeNvL4L0T6N7b3YEc+nuWGtWliHHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgXc9nY5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgXc9nY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738926537; x=1770462537;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Bp9oSq69NUXXLysWLLuF+UCdKtXJ9kpwt6EDZMcz600=;
  b=LgXc9nY57oe15JrtLkvIKllpDPnlz9y86h8LqkthssHUiuKVTLpk288a
   JGGGdWKaEsUmEdINx/98KMHWUYund52AqbX1Dp680MIPeurnZpJ7bfY+N
   Uvx167UNSfimR+AcfprcOJ4iarj7akDpQz28iYHKM+uFOjc92zb8i9HUJ
   AWb800Q6+yHjZBPOx9MC+J7Cf01vezvog3J2Jrx6fIz7vuIYvpZfn3qO/
   Kx8r2RzTsHmVIaq0gIguheW0sr+plsN4sLn8EVKb7vtHRo2CoDNkrfNKa
   hNe4Re8+FTZdQ+hBbnLzoAPy1nYCcWcaWJXf+AaigRKCl6rS5b0x6wkMq
   g==;
X-CSE-ConnectionGUID: D5D4h8vxRoiQzfEGnzt27A==
X-CSE-MsgGUID: b2IMv3AfQ2WjWUlOFjtjVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42404038"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="42404038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 03:08:56 -0800
X-CSE-ConnectionGUID: QPUCymEVRcGg3bcFpcLy4g==
X-CSE-MsgGUID: M41jxu7rRtaq6kx/KMXT/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111705089"
Received: from unknown (HELO ubik) ([10.237.72.184])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 03:08:49 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Nam Cao <namcao@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>, linux-kernel@vger.kernel.org
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
In-Reply-To: <87tt97m3u3.ffs@tglx>
References: <cover.1738746904.git.namcao@linutronix.de>
 <87ldujz9a7.fsf@ubik.fi.intel.com> <87tt97m3u3.ffs@tglx>
Date: Fri, 07 Feb 2025 13:08:47 +0200
Message-ID: <87ikpmypts.fsf@ubik.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Gleixner <tglx@linutronix.de> writes:

> On Thu, Feb 06 2025 at 11:56, Alexander Shishkin wrote:
>> Nam Cao <namcao@linutronix.de> writes:
>>
>>> hrtimers is initialized with hrtimer_init(), and after that the timer's
>>> callback function is setup separately. This separate initialization is
>>> error prone and awkward to use.
>>>
>>> hrtimer_setup() combines the initialization and is simpler to use.
>>>
>>> Switch to use the new setup function. Most conversions were done with
>>> Coccinelle, see the sematic patch below.
>>>
>>> This series is intended to be applied to the tip tree
>>>
>>> v1 -> v2 https://lore.kernel.org/lkml/cover.1729865485.git.namcao@linutronix.de
>>>   - rebase onto v6.14-rc1
>>
>> Link to v2 of part 1 is missing. It's also somehow not in my notmuch
>> datadase (looked for "hrtimers: Switch to new hrtimer interface
>> functions" -- took a guess based on v1) and is not googleable. It's kind
>> of important for reviewing this one. v1 did have the links to the other
>> parts, at least.
>
> It's archived and searchable on lore:
>
>   https://lore.kernel.org/all/?q=hrtimers%3A+Consolidate+hrtimer+initialization+-+Part+1
>
> and the third google result points to:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20241031-hrtimer_setup_p1_v2-v2-0-23400656575a@linutronix.de/

In the only other version that I was CC'd on, Part 1's subject line was:
"hrtimers: Switch to new hrtimer interface functions", hence the
confusion.

> That part 1 series has been applied and is in mainline already.

Yes, I was grepping for the function that got removed. Low caffeine
level in the bloodstream or something.

But now that it's in mainline, I can pick up the patch intended for me
or just ack it. Any preferences?

Thanks,
--
Alex
