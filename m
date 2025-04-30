Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8D2DC789
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012331; cv=none; b=djtonVQaLHhHSgqpNFaa+4AspDLjdh9EA1XXdWi4cYGlLKxv4ObFXFOLZywAk7sAPPU18DEnbCPOwe+d7vMnUcB5yK9p1Gg50j/QrDSt1xTygBU26XwRPaZbv1iJ5sUKHTHTrc6eF/oHOgttt3kcL0pY6DIYkk3x0mOiBLs8ve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012331; c=relaxed/simple;
	bh=JnmBo6iTDvcJ3v3cqSYz+bAFnCuB7hiplr07wZ4j0Rg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HcQt5H9zhrhrZsxBiyjyEeL1l9w7Y7hoKFQIRpEGlZtwxLjsGnzdyb2iDgy4Sy1ttBg5ChV+ZWiOu2FVU0WxG6lvbV5Vj8aq2C9yQWV50Og2m16w6WWYvqwZqSeHp9wG2YsDjk9vxe9plyBhcIYwf1ND7xos9V52LLbaLfgm4bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBtf3gwx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBtf3gwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746012329; x=1777548329;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=JnmBo6iTDvcJ3v3cqSYz+bAFnCuB7hiplr07wZ4j0Rg=;
  b=aBtf3gwxa7n9Td61r3dzVGT2Y0Fzh1PuH+Nuy5+GgZUUvKegaAr6eQhv
   9nC+rNV+60pizkiWA8m0B141kYYSKsecxAM6HKGHOyMYo2glabqmKKTsa
   5ea6k908ouPadDtWcU4/7R+9BN7H0vFh9V1T41lo5NuPFv1SKLCZiIwg/
   oUZFrDw7Uy3VaMCfSdCkeyjnrnm8ilvSjgxqmyFRg/a6wVJ9BEdZ5wLRV
   Qw/ujhlPwQl9jLEr2ijcFGS81JEKceNNhgPYKVm3OgxA/qKmqpuF0Hiw9
   5VU7COFLPNSMvX0IPj/DzIQTg2fDUFZQdyRumyRu+4/qw5irG9ZxqXoDC
   A==;
X-CSE-ConnectionGUID: L+Yky5eURxiApRkODHGmiA==
X-CSE-MsgGUID: NI62GzTQSPuc7dpjm2t/NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47799072"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47799072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:25:28 -0700
X-CSE-ConnectionGUID: fO9WqGgIQWiM4RP/anI7PQ==
X-CSE-MsgGUID: QTyvYmOeRMeqDaKbsXKhtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133994118"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:25:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Dmitry
 Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 06/11] drm/display: add CEC helpers code
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-6-04809b10d206@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-6-04809b10d206@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:25:21 +0300
Message-ID: <87plgtvqla.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 07 Apr 2025, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..39bb6d12acb35f539a4a6cd1b61ce97bf4e063ab
> --- /dev/null
> +++ b/include/drm/display/drm_hdmi_cec_helper.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef DRM_DISPLAY_HDMI_CEC_HELPER
> +#define DRM_DISPLAY_HDMI_CEC_HELPER
> +
> +#include <drm/drm_connector.h>

Is there anything in this file that requires that include?

> +
> +#include <linux/types.h>
> +
> +struct drm_connector;
> +
> +struct cec_msg;
> +struct device;
> +
> +struct drm_connector_hdmi_cec_funcs {
> +	/**
> +	 * @init: perform hardware-specific initialization before registering the CEC adapter
> +	 */
> +	int (*init)(struct drm_connector *connector);
> +
> +	/**
> +	 * @uninit: perform hardware-specific teardown for the CEC adapter
> +	 */
> +	void (*uninit)(struct drm_connector *connector);
> +
> +	/**
> +	 * @enable: enable or disable CEC adapter
> +	 */
> +	int (*enable)(struct drm_connector *connector, bool enable);
> +
> +	/**
> +	 * @log_addr: set adapter's logical address, can be called multiple
> +	 * times if adapter supports several LAs
> +	 */
> +	int (*log_addr)(struct drm_connector *connector, u8 logical_addr);
> +
> +	/**
> +	 * @transmit: start transmission of the specified CEC message
> +	 */
> +	int (*transmit)(struct drm_connector *connector, u8 attempts,
> +			u32 signal_free_time, struct cec_msg *msg);
> +};
> +
> +int drm_connector_hdmi_cec_register(struct drm_connector *connector,
> +				    const struct drm_connector_hdmi_cec_funcs *funcs,
> +				    const char *name,
> +				    u8 available_las,
> +				    struct device *dev);
> +
> +void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
> +					 struct cec_msg *msg);
> +
> +void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
> +					  u8 status,
> +					  u8 arb_lost_cnt, u8 nack_cnt,
> +					  u8 low_drive_cnt, u8 error_cnt);
> +
> +void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
> +						  u8 status);
> +
> +#if IS_ENABLED(CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER)
> +int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
> +					     const char *port_name,
> +					     struct device *dev);
> +#else
> +static inline int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
> +							   const char *port_name,
> +							   struct device *dev)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#endif

-- 
Jani Nikula, Intel
