Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42C724FBFB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207518; cv=none; b=tZW1VQS9r4WvqlxUwkGgTEj8dmZC8/i8/bhof3UTaTIssY1aHTlN4UpTo0UCBoh00XHY+F3iNNHiFP+VEqMkaVVRuaNhROBTWNBxDXN5TakxPehYm1Hr9G4uOpazatLhAXCqYc7sHX/Zc8dJQrkHhB5fJt5MiZEhqEWES/oCPhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207518; c=relaxed/simple;
	bh=yeFB82yozcPpot/BuQj9BmUCtiZVm3BWo3R9NCv0qJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+2vbiTPGGT6IPPwS9h29SQth9gXK9M93xY0wfHNDUv4ZZC1cpI68vSS7EaYiXwDJjRBP1LG1Z49WZRn1Ahee1OCaB1W7qc4aSR9Z9Fb6S3G7meiTF4Pwpyw08/OecMQ2y0yTBMEE7W8ViY5259fkHTWIELZGe4lfDqjYRSFQXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEnyhorb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEnyhorb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739207516; x=1770743516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yeFB82yozcPpot/BuQj9BmUCtiZVm3BWo3R9NCv0qJQ=;
  b=NEnyhorbP0TptCqqNyU8GsaVkjgo5KbpfNBd0+yYW3fWfTQcC3+Y0NlV
   zte7XHv9DV6P7BR9ZMAO4uMOIRzF5sDXjk4iD25lF7zVZjJxVXJLHuNyS
   I/dRvpx/DaRy51hz8DGpbW4IlwpL+zCOP7Y8Sr/9oM1fYAc/C9t5y73cc
   L9HvdMbyslV/Es1wfNfTqRZR1VhYmctKP1OyeBPX+hHHzX0osxOIh9XSt
   HEhQGKBGXtT4jRl7tJZYWGFWnI02AiK+Ph3hRDFZqyqCem/jhQ1DJ1+Vt
   Ux+IzWzZRLF1qQYuGtHuUwSK5PpbgPiSPIgjNsElDLpf6eaGnbR8fASwx
   w==;
X-CSE-ConnectionGUID: hCNbPyaaRhaOwlQWkeh5kg==
X-CSE-MsgGUID: 4B5MCbYdQvOvCxhmDBB1Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43725127"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="43725127"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:11:55 -0800
X-CSE-ConnectionGUID: Mao2AHUASrC4aNsGfImXlQ==
X-CSE-MsgGUID: 1tE3aeuHSECZqjUx3mvttw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112001695"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.18])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:11:48 -0800
Date: Mon, 10 Feb 2025 18:11:44 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Thomas =?iso-8859-15?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Qiang Yu <yuq825@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/sysfs: Constify 'struct bin_attribute'
Message-ID: <Z6ozULi7yEMmXHQz@ashyti-mobl2.lan>
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
 <20241216-sysfs-const-bin_attr-drm-v1-1-210f2b36b9bf@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-1-210f2b36b9bf@weissschuh.net>

Hi Thomas,

On Mon, Dec 16, 2024 at 12:34:47PM +0100, Thomas Weiﬂschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
