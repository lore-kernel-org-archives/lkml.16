Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505A429008E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045663; cv=none; b=ijLAwQNX2M79mfW2PASkxQAAlUgu7tReuxlfASuVK5EdUBOJr5a7/jowdc4ClxQCYmxRhkav3LMBIfJvs/gsYwV7cQcu89i9PaLhhxUMFMFroHAruXfn5UjV+4zBvnSEUIrcQJM0AgQgZ6DiuKWB6ddcTkeaX6/uoBQ/uSGh/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045663; c=relaxed/simple;
	bh=/jraNwTtJpORq8daMzld6WHV7HfbUMS87ukomyrIkKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sDsz76PK1tEVIVh3vYh4jheyRI0bAb8mLaKJ/qFhw4rEFpG+8DdbtSozfuYQmB6YT9tT1bFzSCqc1umt2SYex6VOajLYHJlqImTNk0suQqYPMOIGgO3E6/B5Y+PRbZQ/ODeGZPSsI6w6EAbn6jxbS2qVaPhgwOMq094AqnuSX2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbT2t6t1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbT2t6t1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749045662; x=1780581662;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/jraNwTtJpORq8daMzld6WHV7HfbUMS87ukomyrIkKE=;
  b=HbT2t6t1onwTWlFZtUXmNSpM5S2F1f+S97RHSZkpBXpAqbgFXSzRAkDL
   z6SHDg0CeAyWQWHkvdh5qr0IA/iKMs+1AAPWo+xfNgw9ioNN0FW+wg9/t
   9xHQPJIyj7GPJDU00an6B6c9E6L/MKAGvlWPlomAD/a9PpxPDkLXai0op
   LuW6R7acXIGMOXKqbX6ianN8gjWzF9OVPDXBhTqqfvmqkrEh+8rJflUZK
   qOXDIKiBHGJ/0Y8taWT9UuyNbXhqZF8uli+whlOmfPCCgyufIXH6VETwL
   NVBHysRUS+T+nV4786cDjBw+CM+KXsAmjtVGXM9QJbIv91mG/7DmMFKrF
   A==;
X-CSE-ConnectionGUID: 8ycatYYqSmeWaJ1hG5+zGg==
X-CSE-MsgGUID: wkMV42eZSUy3D25XTvzCKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51200159"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51200159"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 07:01:00 -0700
X-CSE-ConnectionGUID: 5AKLfDWHRziP8K35hrKIlw==
X-CSE-MsgGUID: fDq3JjtQSySbezOjr88hzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="150475265"
Received: from puneetse-mobl.amr.corp.intel.com (HELO [10.125.110.229]) ([10.125.110.229])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 07:01:00 -0700
Message-ID: <c6c2ef2e-7372-4ce4-9ac6-6a2a60f18093@intel.com>
Date: Wed, 4 Jun 2025 07:00:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86: Change maintainers list for the Intel TXT project
 group
To: "Camacho Romero, Michal" <michal.camacho.romero@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "Mowka, Mateusz" <mateusz.mowka@intel.com>,
 "Pawlicki, AdamX" <adamx.pawlicki@intel.com>
Cc: "Michalak, BartlomiejX" <bartlomiejx.michalak@intel.com>,
 "Fedko, Artem" <artem.fedko@intel.com>,
 "Zielinski, Marcel" <marcel.zielinski@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ning Sun <ning.sun@intel.com>
References: <IA1PR11MB7755413461E0F4403A702E3AAF6CA@IA1PR11MB7755.namprd11.prod.outlook.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <IA1PR11MB7755413461E0F4403A702E3AAF6CA@IA1PR11MB7755.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/4/25 00:51, Camacho Romero, Michal wrote:
> I’m BIOS Engineer from the Intel Corp, working on the BIOS security 
> modules development, including TBOOT MLE project: As the present
> INTEL(R) TRUSTED EXECUTION TECHNOLOGY (TXT) group's maintainer (Ning
> Sun) doesn't work currently on the TBOOT project's development, he
> was replaced by the active TBOOT MLE project's developers, who will
> maintain Intel TXT project group and are currently maintaining the
> TBOOT MLE project: http://tboot.sourceforge.net <http://
> tboot.sourceforge.net>

Hi Michal,

For folks to function as effective maintainers, they need to be able to
review and submit patches. This patch wasn't submitted following our
normal processes:

> https://www.kernel.org/doc/Documentation/process/submitting-patches.rst

It came to me quite mangled, and was likely dropped from the mailing
lists because of the HTML.

The easiest way to do it these days is probably to just use
git-send-email. But if you're going to be an effective maintainer,
you'll need to get your email setup sorted sooner or later. That means
no Outlook.

It's also normal to cc the person who is being replaced, or even after
they've moved on to other jobs.

Since there are three of you, could you please go take a look at this
"trenchboot" stuff? Their aim seems to be to duplicate some of what
tboot can be used for, and they expect to leverage TXT itself:

>
https://lore.kernel.org/all/18F9BD47-282D-4225-AB6B-FDA4AD52D7AE@gmail.com/

If nothing else, it would be great to know if you folks think trenchboot
is the way forward and what the future of the tboot code in the kernel
is if trenchboot is also there.

Oh, and again since there are three of you...  first link in:

	Documentation/arch/x86/intel_txt.rst

gets a 404. That would be a nice thing to fix up first, I think. Maybe
you can send a fix for that along with the fixed MAINTAINERS update.


