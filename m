Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E020624BD0F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207614; cv=none; b=b8Tt708YNi5up80ecCS4xH8upOECOHxeeljrAybG3wJPRlUfJqK2RKEe6vmMa3UyfGgzTsNXVlEGY6Z75tIGsZxmiJ5bILUYdS8x1bCeVaZ91SdkS8+F51k21h5aUsG03VkJbsiOescHEhc3n8c1ijJCef6ldboXzH4Hre0k1FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207614; c=relaxed/simple;
	bh=FOYS4BBQQGo1ALDfeGVPyMwlyd16JvW4hpcVFHotTXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjNLGUCHRRE7acPHIg0o2tMYSbOWwdMcTxi5pZLOuN8lY4XZ3OyOsJ6IdFg9hMp+Zo/bu+nqJ7LI5zdJI++jLMCiq8t+gBJDXJDZ+1dpgvD8X82DjnJTZqneM/wBFlwI+J7fu4M+lPoX/VR1mJ4zVZtPz4gMm9wOBnKIZitiqBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpyFoVdV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpyFoVdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739207613; x=1770743613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FOYS4BBQQGo1ALDfeGVPyMwlyd16JvW4hpcVFHotTXA=;
  b=KpyFoVdVe/Sh+aR6nGrM0+XLtiZCCR0fj+38pcyGr4rTUlviLEsYaaj5
   10zT70jwm6kdNVwknw0pDR98WRR+uhUh9OMo1QRnGhjdjVq5ExCrPINNG
   qKLXfMeTkMJjAyEJiS8gtEJnYUhk9nm+S90FOQ8SX2nrw4bj0n9t0omAz
   QQrsfpLcgBF0hKv0xkjfwVdzGDoH8GH2sBcZLM/aoyJHaEKS1wckuquuz
   w4xQmCNi0gzdQtM3bdYdsdq83vz63Tr3xfGNpDDqr1MrHJxUFHe1c+ZcL
   iag7HG/ClC+Am2zsPX4Ci2W2akR0UuiC6ZSrm0nVuv0cXn5KUvgMV1KFN
   w==;
X-CSE-ConnectionGUID: +cMAYiF7Tz+zhx75q7cbZg==
X-CSE-MsgGUID: PAAct9LfSvaxrDMCcFSyGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39038223"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39038223"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:13:32 -0800
X-CSE-ConnectionGUID: H98CuRaZSBKCuyi96c5OOg==
X-CSE-MsgGUID: NeBF+DUSTMyftXnt5SPVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117174314"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.18])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:13:25 -0800
Date: Mon, 10 Feb 2025 18:13:20 +0100
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
Subject: Re: [PATCH 2/5] drm/lima: Constify 'struct bin_attribute'
Message-ID: <Z6ozsNRZmp9S2bD2@ashyti-mobl2.lan>
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
 <20241216-sysfs-const-bin_attr-drm-v1-2-210f2b36b9bf@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-2-210f2b36b9bf@weissschuh.net>

Hi Thomas,

On Mon, Dec 16, 2024 at 12:34:48PM +0100, Thomas Weiﬂschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
