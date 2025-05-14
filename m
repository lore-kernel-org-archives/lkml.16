Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67EE226CF6
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214568; cv=none; b=s0EPWwWpJP5r607W11q76z+7nTAOpwvyHp/ENpoC9yOdmTej6iHIN8/O2idxu74ngo/uADPiX3YFjSFm8Pt+91OTNE8MuOuIj/Nj7WqZEJQMQzxKO59dnS69z4hTi7p8yv/Bd0NEJ6Mh7mrJf1qrjjn527EmbbHEZbZgihKrsUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214568; c=relaxed/simple;
	bh=W3S2OiT06z/aURe88CpR1sR58hRxxjm3pRwdRHodc0M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NUWVwSOVZLqi5yVvQUYv62+PZ8BTmMDHtNeZxmFsBLePsYrIxz47mwz6t8HctUPVG9D7yIVnkUq9c/PnAokEM1EuBPiLjlp+p1eZzYVbAlyNR5embiREd4O6DPNKNULLkRONNphSohUJJd5q6Y3tolVSXLqSEQIwJORtsHH2aeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQ3A/Wbv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQ3A/Wbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747214567; x=1778750567;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=W3S2OiT06z/aURe88CpR1sR58hRxxjm3pRwdRHodc0M=;
  b=EQ3A/WbvWLnStdtb/gD05MYQqTqs0CROrTZ5PAoWSkQbtVXYRQYwZE//
   Y69zO3pryTw8is6KWKLkdXHUvqRrNZ5GDsZWDvv0SFqCyBdUyT0d4arty
   HAf/2eGxr6HfiEdWPfu/xx/wGjITZxDUow94UzVUhB0+oGyEWpNiqRpZC
   alDClB/D4F+tnz/XSE0x8P1jgC2fIVoV4cpubiaicG+29JngqcSu0O9eD
   kPw7oS9TJ7l+UMG+DqM1VUIhRYVwu/BGZHbjd/Y7j23bxg7dHk90VgxDo
   617lqj/+P9hneCLNcljDjlFYCONyvC0X9FkuS+2r31GvshACuU4AVb09+
   Q==;
X-CSE-ConnectionGUID: DwJdJrDPSMyGqhhe6ppIaQ==
X-CSE-MsgGUID: n3E6IiMGQhmAmx9nmy563Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48787182"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48787182"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 02:22:47 -0700
X-CSE-ConnectionGUID: Ell0xXsaSSKsFb3LRRuIkw==
X-CSE-MsgGUID: SQZXwv9QSdm0OwxGsUE3/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="137859874"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 02:22:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
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
Date: Wed, 14 May 2025 12:22:40 +0300
Message-ID: <875xi3im1r.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 13 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> Is it really surprising you get some pushback when you are using a
> design that is the complete opposite to what every user of it for the
> last decade has been doing?

The opposite is also true.

If you create a design that does not cleanly fit the model of the
biggest drivers in the subsystem, and expect massive refactors just for
the sake of conforming to the design to be able to use any of it, you'll
also get pushback.

> This one is usable, but you rule out the way you could use it.

I think you're off-hand and completely dismissing the amount of work it
would be. And still I'm not even ruling it out, but there has to be a
way to start off in small incremental steps, and use the parts that
work. And it's not like we're averse to refactoring in the least,
everyone knows that.

> I guess it's clear now that you won't consider anything else. I wonder
> why you started that discussion in the first place if you already have
> a clear mind on how to get things moving forward.

I pointed out what I think is a bug in drm_panel, with nothing but good
intentions, and everything snowballed from there.

There has to be a middle ground instead of absolutes. Otherwise we'll
just end up in deeper silos. And more arguments.

BR,
Jani.


-- 
Jani Nikula, Intel
