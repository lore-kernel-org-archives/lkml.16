Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A410B70838
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212000; cv=none; b=ZJvqOv/SoypHgc5ejYRq4LnmJ5fIzQszU/DzOLOzgRBn2sLxl2+RGAxxea1lb2Ypyr2pygEoE4eu4RnX8J31rOMsZ0gPlyYSZ9pOuJnJUnBaikCrvarwExCNMATxW5Xv+tG4ITE8VIX0bzI7fSvHINH5Z4xXHiPkbWgWY/acO3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212000; c=relaxed/simple;
	bh=7IBu6SqoOaixh4a2E5UhMsl0v0l4ryM3zDotZ/2zmxc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZEpkrRNVUkvRpPPwbBQrh34EnJ4pU5X1K7WXxew0sw5WPov2JqjxUFjRMZ2igmE6KjFIj4BxXpC7X+5c8Dsbd0spAv9qvmOTcJ1i7i/sKTErEl2F6KG9WGl6GONZrRp7ZcMQRhMoTcthLQAOojXzEZHcDdf8w6rgTSkCCLnXRsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnuqKWQh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnuqKWQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747211998; x=1778747998;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=7IBu6SqoOaixh4a2E5UhMsl0v0l4ryM3zDotZ/2zmxc=;
  b=NnuqKWQhLSRJhU9HrhxpJBU+og/Htmb4wThDKzn3RPlWbYSNJAkBhCPD
   wcgiZ+CMuWVJsDvB4MT5zaEIroDs21VkLqiLa3codBbVfekGXNFK028gb
   GrBM4esRIHj6B/T3p5u5ThkDwOEd6tBVAzlTRMxv0Y1XEDXWktEsJsYgV
   xkOgeUvA97w5o7wxg3yKj4DgpX21B6/rcSx3hh13k87CuKwxemb3kDKPy
   mPLFn66sffQdE7+xBC6EjGeo6pmDRutvGDfwUpISx3QFVX5+GlL1ijzxt
   z4a/iyT34fbCgWA6lOfFRJHJfEgkzlQ1pZcEQqrTplzXOavmTfT3kQij7
   A==;
X-CSE-ConnectionGUID: L1KVlgTSSN+BS1hpLhztEg==
X-CSE-MsgGUID: Miyde0CPSkS5Ar8kkpqHCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48964633"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48964633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:39:58 -0700
X-CSE-ConnectionGUID: fkoVliQkTt+1gp7aIeKD2g==
X-CSE-MsgGUID: 8yaHo7RnTMuc0hUxCalqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="142913537"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:39:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "feijuan.li" <feijuan.li@samsung.com>, jingoohan1@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: feijuan.li@samsung.com, hongfei.tang@samsung.com,
 minggui.yan@samsung.com, qilin.wang@samsung.com
Subject: Re: [PATCH v3] drm/edid: fixed the bug that hdr metadata was not reset
In-Reply-To: <20250514063511.4151780-1-feijuan.li@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20250514063420epcas5p2bdd64000965a5ceffa196f123db8fb2e@epcas5p2.samsung.com>
 <20250514063511.4151780-1-feijuan.li@samsung.com>
Date: Wed, 14 May 2025 11:39:49 +0300
Message-ID: <878qmzio16.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 14 May 2025, "feijuan.li" <feijuan.li@samsung.com> wrote:
> When DP connected to a device with HDR capability,
> the hdr structure was filled.Then connected to another
> sink device without hdr capability, but the hdr info
> still exist.
>
> Signed-off-by: feijuan.li <feijuan.li@samsung.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/drm_edid.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..9edb3247c767 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6596,6 +6596,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	info->has_hdmi_infoframe = false;
>  	info->rgb_quant_range_selectable = false;
>  	memset(&info->hdmi, 0, sizeof(info->hdmi));
> +	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_metadata));
>  
>  	info->edid_hdmi_rgb444_dc_modes = 0;
>  	info->edid_hdmi_ycbcr444_dc_modes = 0;

-- 
Jani Nikula, Intel
