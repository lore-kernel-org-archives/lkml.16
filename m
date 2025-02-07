Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6351EDA3A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934013; cv=none; b=bqFR8wVbpbEqzzGBH+2eoysmYBlL42eFXOxXrUkTr5MVOosCderCeIYRSFQ6BEVP8rDd4R02m8vaKQa3qrqZvDH+scypBOD7ha1k85EWBi2/T14ekVaXqJ6md7HBGIC8PaRPIRUm9qy0CDQmfOpi8K0gtyU5YQAp5JsmL3s23lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934013; c=relaxed/simple;
	bh=ZNAl2lbm1tHIFcCjkRB+ijvuo9ULxuvzExsotKCpHvk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ts/L9J/F5qsBdykxTVjbl/LqTV5D6rDLE38h44Lsz3kxPxeIIOTM9b0Gpph3Qz3KFG8/kOPiJveA97bEQHuOPvFCLKdfalxEuY08/Z5PLBGZMOTsCq26amF7klkwA1n/OckSFGgm4Gwl+rwxCR6AzndRG0i4e+YGtuxahwmwJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlfzNKfU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlfzNKfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738934012; x=1770470012;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ZNAl2lbm1tHIFcCjkRB+ijvuo9ULxuvzExsotKCpHvk=;
  b=DlfzNKfUw1YRI2P8dvlxLlvHrqDk3kpaLqmnih+Kr/tPkq2yD//Ou2py
   ftZPqosKjGe3ZJxDLBpVfLJo+0UJwdMcEVvY5n75rnLMQqbjP8pqwnHke
   VKw309WSQkW7ZiWoLscyQ9iAgRGqWCLDOS1jjsGygWMBGLYqKC78alSSz
   KMvgui4kd/z3aCbkjBlnrKV1WMswwMpD1ys6J3a14aLLzOV58pk03uhDc
   i9Nv4HwYasA/T+Xxi0TgiVp4nnif40mxFeHHLm7lVuQUs1a3F+sjU15py
   hixAO9BrZkmYPS39FQsLpwLTSF6hNwaFPX7izZ5ZeruMa8PG1olgbYv18
   Q==;
X-CSE-ConnectionGUID: oHf6OnZ9TdCXJVDllLwQug==
X-CSE-MsgGUID: BbMrOWvXR0Szc6vz4gze/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="49815691"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="49815691"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:13:31 -0800
X-CSE-ConnectionGUID: SyLZ7crXRtuOigKoy+q0BA==
X-CSE-MsgGUID: 8zlVlKuaQx+UrHGx6E1oSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111486886"
Received: from unknown (HELO ubik) ([10.237.72.184])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:13:24 -0800
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
In-Reply-To: <87bjvdnc74.ffs@tglx>
References: <cover.1738746904.git.namcao@linutronix.de>
 <87ldujz9a7.fsf@ubik.fi.intel.com> <87tt97m3u3.ffs@tglx>
 <87ikpmypts.fsf@ubik.fi.intel.com> <87bjvdnc74.ffs@tglx>
Date: Fri, 07 Feb 2025 15:13:21 +0200
Message-ID: <87frkpzymm.fsf@ubik.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Gleixner <tglx@linutronix.de> writes:

> On Fri, Feb 07 2025 at 13:08, Alexander Shishkin wrote:
>> Thomas Gleixner <tglx@linutronix.de> writes:
>>> That part 1 series has been applied and is in mainline already.
>>
>> Yes, I was grepping for the function that got removed. Low caffeine
>> level in the bloodstream or something.
>>
>> But now that it's in mainline, I can pick up the patch intended for me
>> or just ack it. Any preferences?
>
> Just pick it up through your tree. I'm only going to collect the
> leftovers.

Wilco.

Thanks,
--
Alex
