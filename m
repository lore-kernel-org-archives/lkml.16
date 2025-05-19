Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74201267B87
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648521; cv=none; b=QWCEKhO1pmBTc9cNl1S0yQh35hayHwtgPcPSkOseT/sT6A6ONXcJZZfSY6dqXGhFB0IB3GWjC7XeTO8i4H3B2PhHLp6TiFSEsyRZAxltYXXGBViP01YDrZ6b4yL/QdHomHpOaMrPFyeKrd7P9L3p3/T7RTJ7t1D85lSdkG+kQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648521; c=relaxed/simple;
	bh=x962P5jjhfK06VJoGYfXsOxsJ0DuLlZs6GC+F00vyj4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wjj/3nRtRdexPlqguLRs+f3roFV3+x9Mp7asVGzlQmqWvZ9k44xIQbczqFESHXIJT9hg0G7F1h9AdauO/8VbCQsLd5AgFQ/HpKvYP1w7T8paByGTT/ziDs9bPK1ezVizU2rgxbzdTA6SYhHM+EMpRA84YIokpEaQFbsw1gpWhH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/l2XGG6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/l2XGG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747648519; x=1779184519;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=x962P5jjhfK06VJoGYfXsOxsJ0DuLlZs6GC+F00vyj4=;
  b=J/l2XGG6p/+vFpEa/iBgjKkxVex0Cc3MRjT+t0vj/gBpeVOv1U8xAXGE
   RcTbHCmzJrhu0laNkS5r+7uSJ8IUM7kqEW/fHMyooI++7PJEQIvuJd7vk
   9NtwCfWKPX1oy2VYnlEf4Iw1LhsCRY4eS22Lal1z0lLku6xubeW01u6qS
   T3e8eg8Hvcy3mLF59uRXH0TlM4CXgdxkKLLTcey10SbWF6wO6vVF+XpG3
   3QyoaJfEJt9CX/eX2Ed9w5JWGahmAeWZl1+g+vtJa3M9bpzy6nao2xlgi
   J+t/nLKhEbr1nXnxFaE4f1oJbdoCL9eekS4cOVBwgE2zFZelRg4GghSeC
   A==;
X-CSE-ConnectionGUID: PYMavetHS9KWISpE4wjMWw==
X-CSE-MsgGUID: WtUdTfDjS8ywUKe95izESg==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49240581"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49240581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 02:55:18 -0700
X-CSE-ConnectionGUID: vb+tJycCR4iZf8sl7kTbtg==
X-CSE-MsgGUID: jeWBbJfySr2WrSbuB9lHMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144089755"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.201])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 02:55:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "feijuan.li" <feijuan.li@samsung.com>, jingoohan1@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: feijuan.li@samsung.com, hongfei.tang@samsung.com,
 minggui.yan@samsung.com, qilin.wang@samsung.com
Subject: Re: [PATCH v3] drm/edid: fixed the bug that hdr metadata was not reset
In-Reply-To: <878qmzio16.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20250514063420epcas5p2bdd64000965a5ceffa196f123db8fb2e@epcas5p2.samsung.com>
 <20250514063511.4151780-1-feijuan.li@samsung.com>
 <878qmzio16.fsf@intel.com>
Date: Mon, 19 May 2025 12:55:12 +0300
Message-ID: <87r00kvsan.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 14 May 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 14 May 2025, "feijuan.li" <feijuan.li@samsung.com> wrote:
>> When DP connected to a device with HDR capability,
>> the hdr structure was filled.Then connected to another
>> sink device without hdr capability, but the hdr info
>> still exist.
>>
>> Signed-off-by: feijuan.li <feijuan.li@samsung.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-misc-fixes, with

Fixes: e85959d6cbe0 ("drm: Parse HDR metadata info from EDID")
Cc: <stable@vger.kernel.org> # v5.3+

Thanks for the patch.

BR,
Jani.


>
>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 13bc4c290b17..9edb3247c767 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6596,6 +6596,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>>  	info->has_hdmi_infoframe = false;
>>  	info->rgb_quant_range_selectable = false;
>>  	memset(&info->hdmi, 0, sizeof(info->hdmi));
>> +	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_metadata));
>>  
>>  	info->edid_hdmi_rgb444_dc_modes = 0;
>>  	info->edid_hdmi_ycbcr444_dc_modes = 0;

-- 
Jani Nikula, Intel
