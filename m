Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A1275842;
	Tue,  6 May 2025 13:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539582; cv=none; b=dP+1n3i9c6Nh43BOdizX8FhFL1Ej+oq0iX/iFkTaXdJl2FXFyMxS6aztma7IPvhb4aWGHM2mo+9Ix3KLwaJu7lE68/u7GCkPkvopnMKTDh6EqGWNR9FRugsaR1BDRJXtNqIa+7qebc5HOusxJSg2ddokvQGudn5Fo7Y5zo/eQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539582; c=relaxed/simple;
	bh=doBlcIkAGp9cJeKf4hCj5NkGHK+v0DTsswbEiCYjK44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qtCMALK6jNGj3xKEcagf3FaeLlMImCI3Ml8rRaU4bkoZsKeE9Q/slL/ZJBdQ1M1zeoyVZ8dN8CMkDQ9i7jTf3F49hLaW94BaoDYXM/4covVyluIZNmMbNgk6taO1fc2WW9zoLPLlXRMGUK58p4BHqM+AQ1Vh7CvPZK6LleLTAEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZoo9nq7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZoo9nq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746539580; x=1778075580;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=doBlcIkAGp9cJeKf4hCj5NkGHK+v0DTsswbEiCYjK44=;
  b=IZoo9nq7/DlBiZEGACUk7Qr4GtOhAsIZWdGnVX2qeOC5yILC5xd/oCrB
   ZWh/JovW61WrYsHleJELWQTxcLlGt+nVUmdwkeO59YChfoCoWNcr429So
   OkGAyZfvYIGduKsPSOvT2gsC92O21fi187lnrZMLrDQunEzoKs8cfSlg0
   FzMxjvD5NJ+j7sTCb9kQ1cvQDaO3dDiXf9aLrpYxBTIPQt3xgWQRCxh5E
   ISCqqjGaZvc4hP7nkfWuxhiQwv5Jf3+j6HcTOtG1QJ8vraA/HN9Bq7ZJg
   wtBjH1yI7MIucVStsiBNoYVXSXI/tRdO8IFSxNxksYYJ6xBgvpevM3D8g
   Q==;
X-CSE-ConnectionGUID: URgpnRrLSeGD7APha0CmDA==
X-CSE-MsgGUID: jp6jo1hPQxG7bPDQ7Xf1MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58867030"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="58867030"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 06:52:59 -0700
X-CSE-ConnectionGUID: 4oSb292TTJ65oXyNxraLWQ==
X-CSE-MsgGUID: RGkFFAy2T1al+PF4saJVKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="136570123"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.221])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 06:52:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add entries for drm_panic,
 drm_panic_qr_code and drm_log
In-Reply-To: <20250506133143.156447-1-jfalempe@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250506133143.156447-1-jfalempe@redhat.com>
Date: Tue, 06 May 2025 16:52:51 +0300
Message-ID: <87tt5xvob0.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 06 May 2025, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> Add myself and Javier as maintainer for drm_panic, drm_panic_qr_code
> and drm_log.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  MAINTAINERS | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 38df6b159a3b..df3abdcf1767 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8177,6 +8177,34 @@ F:	drivers/gpu/drm/drm_panel.c
>  F:	drivers/gpu/drm/panel/
>  F:	include/drm/drm_panel.h
>  
> +DRM PANIC
> +M:	Jocelyn Falempe <jfalempe@redhat.com>
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_draw.c
> +F:	drivers/gpu/drm/drm_draw_internal.h
> +F:	drivers/gpu/drm/drm_panic*.c
> +F:	include/drm/drm_panic*
> +
> +DRM PANIC QR CODE
> +M:	Jocelyn Falempe <jfalempe@redhat.com>
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +L:	dri-devel@lists.freedesktop.org
> +L:	rust-for-linux@vger.kernel.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_panic_qr.rs
> +
> +DRM LOG
> +M:	Jocelyn Falempe <jfalempe@redhat.com>
> +M:	Javier Martinez Canillas <javierm@redhat.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/clients/drm_log.c
> +

MAINTAINERS is supposed to be sorted. See commit 80e62bc8487b
("MAINTAINERS: re-sort all entries and fields").

BR,
Jani.


>  DRM PRIVACY-SCREEN CLASS
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	dri-devel@lists.freedesktop.org
>
> base-commit: 258aebf100540d36aba910f545d4d5ddf4ecaf0b

-- 
Jani Nikula, Intel
