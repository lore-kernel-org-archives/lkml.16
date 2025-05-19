Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99B0265CDC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657444; cv=none; b=lq7hjIlijY0WvkDIGKhFOJWMjoPog4sYOlfa7fV983wvl9kuvhqV/dWLinJ1Uwb/tFzBd/oYC53Pra9aK7RTr1o7YCOM5AmWzrJWKfIgA9Jr8fzuLnoQv/CC5isuH4QOrVFY65AA3b6ZqluEI/zg7XJlPwmOirqtrerLa8777v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657444; c=relaxed/simple;
	bh=HoFLCZy0HTDqPxQVyQIXnPh72r3ZaQ4VSSvkWrBe4AE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fRqVmz5XLx4s95YoejTVmxQKRCjkP4a36Yt3cXAZ3j6J5BeLciIepkbSoEsjcBHpGEzbmoK2E3SGS5u2Tvm4nDXya8ClNny7fyFFdKmN6wHXXbituARza8VkZDnSyW1Q8bFfm9c/Buk5lrfSuwypfPhyxAvto1a/deJGNtnlB3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbnVmHD9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbnVmHD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747657442; x=1779193442;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=HoFLCZy0HTDqPxQVyQIXnPh72r3ZaQ4VSSvkWrBe4AE=;
  b=IbnVmHD9t790NZ1/3kUzPbqljBBfTcYEhK0fmpQHZPl08f7FMopO/DBg
   0IcKOeIVOuL7LtK2w3+0Q8ixzY7V5YdP0VRmCg11C4Bgc27QCWI4fQHQ3
   bgEz60BFtI/HH/dEGZntEGcmIsMEqqYtit00tCKbRsckqqHHcUzmFixyf
   S7xd3hnqb+OuJRWqDstnT/GMDRBki95lGDbFpxYDcNiQU3SpmIbG/taZ7
   /js8E/SwY47VIwiNudh6In0wjllZyiCf0aPze16dOKCd2cMr/WSg3L2rV
   pzCV/dzpfR5NlepGoniNuDJ3Q4fva8+B5iuquuo17Phys0e+7X3RJYNp4
   g==;
X-CSE-ConnectionGUID: 2LxZ97lcT9a1mf28ctgwpg==
X-CSE-MsgGUID: vHIke2rYSpqh7KWCqIWypg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60585301"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60585301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:24:01 -0700
X-CSE-ConnectionGUID: rpeWH2fDRRmy9Oy0kppDog==
X-CSE-MsgGUID: rpvn2Y8CQeuRyBQeHHQIxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="143361984"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.201])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:23:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>, "uma.shankar@intel.com"
 <uma.shankar@intel.com>, ville.syrjala@linux.intel.com
Cc: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <CAN9Xe3QHqPDPUQ7gsf278Nj0GC1fO-sGxoW3Ln4=h52QUM804g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
 <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
 <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com>
 <CAN9Xe3QHqPDPUQ7gsf278Nj0GC1fO-sGxoW3Ln4=h52QUM804g@mail.gmail.com>
Date: Mon, 19 May 2025 15:23:54 +0300
Message-ID: <87jz6cvlet.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 16 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> On Wed, May 14, 2025 at 5:22=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com>
> wrote:
>
>> On Tue, 13 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> > Is it really surprising you get some pushback when you are using a
>> > design that is the complete opposite to what every user of it for the
>> > last decade has been doing?
>>
>> The opposite is also true.
>>
>> If you create a design that does not cleanly fit the model of the
>> biggest drivers in the subsystem, and expect massive refactors just for
>> the sake of conforming to the design to be able to use any of it, you'll
>> also get pushback.
>>
>> > This one is usable, but you rule out the way you could use it.
>>
>> I think you're off-hand and completely dismissing the amount of work it
>> would be. And still I'm not even ruling it out, but there has to be a
>> way to start off in small incremental steps, and use the parts that
>> work. And it's not like we're averse to refactoring in the least,
>> everyone knows that.
>>
>> > I guess it's clear now that you won't consider anything else. I wonder
>> > why you started that discussion in the first place if you already have
>> > a clear mind on how to get things moving forward.
>>
>> I pointed out what I think is a bug in drm_panel, with nothing but good
>> intentions, and everything snowballed from there.
>>
>> There has to be a middle ground instead of absolutes. Otherwise we'll
>> just end up in deeper silos. And more arguments.
>>
>> BR,
>> Jani.
>>
>>
> Jani, Maxime,
>
> Thinking out loud of different solutions we can have to make sure we take
> this forward.
>
> Is it possible to have a variant of drm_panel_follower for the non ARM
> devices? That way if at any point in
> the future, the drm_panel_follower infrastructure has to be used, the
> refcounting allocation can be bypassed?

Please let's not conflate two orthogonal matters. Refcounting or
allocation is not related to platforms in any way. I see no reason to
have that kind of dependency. It would just complicate matters more.


BR,
Jani.


>
> Adding Uma and VIlle to the thread here.
>
> Thanks!
> Anusha
>
>
>> --
>> Jani Nikula, Intel
>>
>>

--=20
Jani Nikula, Intel
