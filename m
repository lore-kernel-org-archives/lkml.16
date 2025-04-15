Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773227466A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708580; cv=none; b=GE/bp54IH/aT5gpY+MBCqGSLojWVorkkLV45fKRIH03K2PZFK1And1s/z/IzIhC9pnaL7h/MaN8L5mLBxjEjJFq8x43vTIsmqXtG4LuvDjj4PiZMkY5MEd8hjNQy6maq7Z57+Z0URiktfQoTjTqh1Ex0vG0ACI5AUvtLpFNhp3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708580; c=relaxed/simple;
	bh=cLJMYVTuK4TLhcHrYhobpIcIz4x8WNU5zTERdYVxmfg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PjYJsmlcsSY2hcKZOKVfOPyoZkvOf2E8Ln9NBxqFbhvssvurQPhZt4QqJVEflWBfMw2g9i+eHVTxf4Z3PO+RNktBT41wer4bSMdq4o4YrAiu8XJZST7dfOs94CQk2C30CQC29ZmgBCFhpzULKLT+YMFN7+cbbbCSQl2UM5wK+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AY0bUdP+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AY0bUdP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744708578; x=1776244578;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=cLJMYVTuK4TLhcHrYhobpIcIz4x8WNU5zTERdYVxmfg=;
  b=AY0bUdP+YVIF5ixJogDGQrexZ8GgTuEKKr5r3/GUksK+BtnCnwGueYgS
   qsG97WGcD3Z4gOvvJLgNswN7Ab3TrXcKN+TpKuYAQIL97aG4L7UvjsNHQ
   8Dq2ZLhDCf6VNKP0RpUM2e8y82GFpqdXVwHy+ndO6CUVRKmjFIA9cK8BE
   SSF9TO0cX4KQQaBsc2wlftt0ZNZHjUQdJ3ge0HT+i0fdNnGvFuSHoy6cW
   UJnFhbzp+uHWj3JWCvBvP3MoRm968QnjHkQzYaor30e7muOSTpJbaKNbF
   LRlJmBciJWyhmBO7orc74bvvSvVKx59gplamrg7FAuZavBPXCrxSvYgf2
   g==;
X-CSE-ConnectionGUID: T2ukJWYyQlKBY/JugeMq+Q==
X-CSE-MsgGUID: 8E3kaFx3SZiAq4BC/LGnbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46297118"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46297118"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:15:10 -0700
X-CSE-ConnectionGUID: xx1U5v9QTVCF4OUDMsEU3w==
X-CSE-MsgGUID: sdZSS8pIR7SQBj8IDMh1Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161047263"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.35])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:15:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Egor Vorontsov <sdoregor@sdore.me>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov
 <sdoregor@sdore.me>
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for series starting
 with [v3,1/2]
 drm/edid: Implement DisplayID Type IX & X timing blocks parsing
In-Reply-To: <7e2cb3cdcee84975a439980cb94d93eac14bae11.camel@sdore.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250214110643.506740-1-sdoregor@sdore.me>
 <173955656648.2118687.12350276607296168996@b555e5b46a47>
 <7e2cb3cdcee84975a439980cb94d93eac14bae11.camel@sdore.me>
Date: Tue, 15 Apr 2025 12:15:04 +0300
Message-ID: <87jz7lss4n.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 14 Apr 2025, Egor Vorontsov <sdoregor@sdore.me> wrote:
> The patchset seems stalled, presumably because of this CI dead end.
>
> Is there anything I can do about this issue, or did the thread just get
> lost? Some are even pinging me directly on the state of this now.

I'm sorry, totally my fault, I dropped the ball.

I resent the patches for fresh results [1], and will merge them via
drm-misc-next.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1744708239.git.jani.nikula@intel.com



-- 
Jani Nikula, Intel
