Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666702367B8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138790; cv=none; b=Qw3q0s+hMZ9YxpJdWk3YS5hq4Rvieu6CJLNA1E5Z8ECJJCe8R4faGcXIosBEotBNPIgFdnaxB4/BbkmNa67S35LDlGpZxS9UcveiIcQoKzqpPeXxm3vzDuvrCkCn4+ha/d05iCaZuLiLUJk1u8OHq0HzIfUxcRh/ejiAkYqU2SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138790; c=relaxed/simple;
	bh=PvFrR2MAq2o+yd9APHGuH71FjKQ9+0afcA1dVCja6iA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YWJuFOyp3y9T/0iIayM8OM3s37tK5lolwjDCekUOHrO6JrWUD36cPgXUdZWr5VwVJmTrkMkjTxz+v3orn2BPEfbTH/WaUb5XEAGxbvCa+BXdgaGhRX688IGvYWTNSsXMwkugMHJ9DFAbA0cpn1TUnqzPMShZPU60E1KVfdzQ7TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0s1/nYd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0s1/nYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747138788; x=1778674788;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=PvFrR2MAq2o+yd9APHGuH71FjKQ9+0afcA1dVCja6iA=;
  b=O0s1/nYdcdlOitVX/COgnXEibxp+uai9j6giJaSzj3rq8NAk6tOeLERp
   iEp841F9+dcKvs0Kc3GesOyxxb81w9gkNItU+EMDdDBdbu1GqftQfaZK+
   bNy6Evg3Y2IKM5gvo0PJexNd4mJgCVIHrzwrMCS/lNyutR7JoAowuqW2p
   h3PX+Uldj2uTmIrduK+Oi/FwKefE4KwqiqBS5KPm47TciFIoVyhEo7gv+
   uGDOqlKPnacmkJQHoMA5RE3/+qj0HrKZwzHM7mk4Nm8PZTWurTByeEKIV
   3VQgn8t2xxnMhMNHflOwVKdOQ5Zp9+Yf4moFBQCzVaGblY+TNW632U4Dg
   w==;
X-CSE-ConnectionGUID: unz45pT/QKm6j+VCmo8+Xg==
X-CSE-MsgGUID: Gj9YgJFyTzCjJRGTEEDXXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52788521"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="52788521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 05:19:47 -0700
X-CSE-ConnectionGUID: 3NPLvGBRRAK/n33hhJDhew==
X-CSE-MsgGUID: GJHOJSAyTsOFFP5L/Qaxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="138618720"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 05:19:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <CAN9Xe3R87TmEzeTEFnhxAZyqdRYNSnPLcGqWATpyt4CHeYdGkg@mail.gmail.com>
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
 <CAN9Xe3R87TmEzeTEFnhxAZyqdRYNSnPLcGqWATpyt4CHeYdGkg@mail.gmail.com>
Date: Tue, 13 May 2025 15:19:41 +0300
Message-ID: <87msbgitya.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 12 May 2025, Anusha Srivatsa <asrivats@redhat.com> wrote:
> I get that embedding drm_panel within intel_panel which is embedded
> within intel_connector, which also embeds drm_connector and so on can
> get confusing to use. But Jani,
> about drm_panel_follower , which is the panel that is following the
> intel_panel? Is it the associated
> touchscreen if any or some other device?

Touchscreen, it's stuff under investigation, WIP. Needs a bunch more
stuff, but just trying to ensure drm_panel doesn't become a blocker
right off the bat.


BR,
Jani.


-- 
Jani Nikula, Intel
