Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8881B4236
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833978; cv=none; b=vAh4mSVt1IIE+A4ao7PV3SqyuOWp9MbXKA6v77mFWclSe1JxLiqwyZHWRe8+NTijD0uuARj4I1FRFb97+BV/Zl4Mw1Fs9qU+7jXew+ZSfDbTM2l4EksDTWLc/vGO81XX95pXLK3ZbSzN+SySpcSAzUiQe0q9JwKPpw1zix5qT34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833978; c=relaxed/simple;
	bh=Qra0jDZ082u3o61wFUg8DO/d33Nm/eecQ74+ZCXcKP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tdwyuyMN8Jap6XndLL1ft19Gbe0ShYsJlxvXOJqAsbtJUflK/Rb3zMn1BrkFLbHIlzuHMM+rGBr07uRpJTSRvt1BJZ/qmeC+z2FLTVhHS1gbt0Wf5bk8rO42gHcTujNVRUtr9ymumb4JWdCRggucM428MgbQpd1YyTsmvcsDgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEuGzhmw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEuGzhmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745833976; x=1777369976;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Qra0jDZ082u3o61wFUg8DO/d33Nm/eecQ74+ZCXcKP0=;
  b=gEuGzhmw5GK3b8gzOTpXQYQJW/5uz2F21F6/RqZNQiG0BnU067u1O4Nz
   cnjjnMBd8EDzTHg4ub+FP3kXvTP91tjRNNc45M9IbKbx9FkiPOZ6OYLa7
   RMQoKR08aFMj534hNimfeskZv9xYw4jX8YCEXD2Ty8rvh6EIPBkUSogqY
   suS8usLaPZ3leHIo5TKWrVoxo7orCMcXEhf+ZXusSYwUx2q1Hm9k8Pcs8
   62qpdcW4ij5oLMH3LBfP1mblrySQ0i153qRpkYjA2Ef8ShBRyLADsgym+
   TC/TG1vUaWQFT0/6mVr8SmDZHAPAd0q7Pd4txZVFWABhTvJW3MyhkYtlD
   w==;
X-CSE-ConnectionGUID: KLOPHo22TjuotmgLYqnhnw==
X-CSE-MsgGUID: 4S3eICFnQ3+TmnjbsmwukQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="35029878"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="35029878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 02:52:55 -0700
X-CSE-ConnectionGUID: AlJxoydRT3yVcmDz1WNpAQ==
X-CSE-MsgGUID: xdpgg3BkR0qF/8jnBps79w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="164439560"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.174])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 02:52:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/23] drm/tests: hdmi: Add macro to simplify EDID setup
In-Reply-To: <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-8-5e55e2aaa3fa@collabora.com>
Date: Mon, 28 Apr 2025 12:52:47 +0300
Message-ID: <87cycwy5n4.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 25 Apr 2025, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
> Factor out the HDMI connector initialization from
> drm_kunit_helper_connector_hdmi_init_funcs() into a common
> __connector_hdmi_init() function, while extending its functionality to
> allow setting custom (i.e. non-default) EDID data.
>
> Introduce a macro as a wrapper over the new helper to allow dropping the
> open coded EDID setup from all test cases.
>
> The actual conversion will be handled separately; for now just apply it
> to drm_kunit_helper_connector_hdmi_init() helper.
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 +++++++++++++---------
>  1 file changed, 28 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index c8dc6fa0f925e35e9903a18bac7f78f9d8165960..36734639d19a3f279abc4631eb19d5c2b20ca315 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -140,10 +140,11 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
>  
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
> -drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
> -					   unsigned int formats,
> -					   unsigned int max_bpc,
> -					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
> +__connector_hdmi_init(struct kunit *test,
> +		      unsigned int formats,
> +		      unsigned int max_bpc,
> +		      const struct drm_connector_hdmi_funcs *hdmi_funcs,
> +		      const char *edid_data, size_t edid_len)

char* is weird for EDID data, but it's a pre-existing thing, and
actually making it unsigned char or u8 isn't much better.

A follow-up could switch edid_data to just const void *, and ditto for
set_connector_edid() and current_edid member in struct
drm_atomic_helper_connector_hdmi_priv.

BR,
Jani.

>  {
>  	struct drm_atomic_helper_connector_hdmi_priv *priv;
>  	struct drm_connector *conn;
> @@ -197,29 +198,38 @@ drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
>  
>  	drm_mode_config_reset(drm);
>  
> +	if (edid_data && edid_len) {
> +		ret = set_connector_edid(test, &priv->connector, edid_data, edid_len);
> +		KUNIT_ASSERT_GT(test, ret, 0);
> +	}
> +
>  	return priv;
>  }
>  
> +static
> +struct drm_atomic_helper_connector_hdmi_priv *
> +drm_kunit_helper_connector_hdmi_init_funcs(struct kunit *test,
> +					   unsigned int formats,
> +					   unsigned int max_bpc,
> +					   const struct drm_connector_hdmi_funcs *hdmi_funcs)
> +{
> +	return __connector_hdmi_init(test, formats, max_bpc, hdmi_funcs, NULL, 0);
> +}
> +
> +#define drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test, formats, max_bpc, funcs, edid) \
> +	__connector_hdmi_init(test, formats, max_bpc, funcs, edid, ARRAY_SIZE(edid))
> +
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
>  drm_kunit_helper_connector_hdmi_init(struct kunit *test,
>  				     unsigned int formats,
>  				     unsigned int max_bpc)
>  {
> -	struct drm_atomic_helper_connector_hdmi_priv *priv;
> -	int ret;
> -
> -	priv = drm_kunit_helper_connector_hdmi_init_funcs(test,
> -							  formats, max_bpc,
> -							  &dummy_connector_hdmi_funcs);
> -	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
> -
> -	ret = set_connector_edid(test, &priv->connector,
> -				 test_edid_hdmi_1080p_rgb_max_200mhz,
> -				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_max_200mhz));
> -	KUNIT_ASSERT_GT(test, ret, 0);
> -
> -	return priv;
> +	return drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
> +				formats,
> +				max_bpc,
> +				&dummy_connector_hdmi_funcs,
> +				test_edid_hdmi_1080p_rgb_max_200mhz);
>  }
>  
>  /*

-- 
Jani Nikula, Intel
