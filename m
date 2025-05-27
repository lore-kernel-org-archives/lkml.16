Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0353C01
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374857; cv=none; b=OB7f2VzS0SaNh1XP9ZIy0XWW1nmJibVg/KMR+oHvBfWD4YPgAnB/Q50zdszT2abj4ZMHH6qtIKm75Mh6c8ETnSPgWntEjHJGU/vzXUNetWrfOg/SGVBhiYTYbUxkgvMuzC8ZYTDcTKQgkAZ8Jb4tg+iTw7XG50dovpv75QVviPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374857; c=relaxed/simple;
	bh=CcNB/LW3IX5MqotXtvEeyQzFZtAd+/ZUkjigVGBmxsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EkDu+OS9qm3CBjvye4lDi5g8u9OFD6KQqX9NovRbK4/I6ThI32ZJ44SpyeZTJncCarmw6lKW58c3b4W1nF3nPSfmXJdLUDUawEtJdjYOzu+sWHY/dvupYLKtfdftKBLeBJOjKNfWQJEJWYPsK4UfOv6+oS6HRMm1ow93PU5ZgWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKpQJUGF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKpQJUGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748374855; x=1779910855;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=CcNB/LW3IX5MqotXtvEeyQzFZtAd+/ZUkjigVGBmxsk=;
  b=iKpQJUGF/y1dy8EVtnanCV3PJeJ2ghWBnFBOthWR+7AGUNl7e/29zrMf
   nP5NTD3OKTm8c607Jydo7E+HxQhtYvqSN2pVceZ8S0NdT9cVMPLbtsAmr
   gP+WxM5yZxlnoUTmOcN8q3IddycM4Xab1RU3Trelk9+jWNRbI//6nNele
   YkUipRkY7vrshgGjP9OAlY+UsmKJTITgYNl4E77mGPanPlX97OBAY3osJ
   wRcEThUtkkhIdiLyvh2+vzVzUVScYFSon3IhGBccn3xN8oleOAn0GK/3w
   nXLW/iocMlwRD0xVPkNYCDcdo+KGLzZtoe+2b8n5toe9iFlMu6w56ozzl
   Q==;
X-CSE-ConnectionGUID: iY+1+njrSUWikIRnMupdXw==
X-CSE-MsgGUID: Jx8wPKEBS7iaSHfHt9CnNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50438823"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50438823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:40:54 -0700
X-CSE-ConnectionGUID: MMYfXGaKR9CuYkjh/uAD1A==
X-CSE-MsgGUID: BnqARss/QlekpmwP32TdJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143919633"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.23])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:40:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <20250527-winged-prawn-of-virtuosity-d11a47@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87o6wfwcef.fsf@intel.com>
 <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com> <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
 <20250527-winged-prawn-of-virtuosity-d11a47@houat>
Date: Tue, 27 May 2025 22:40:49 +0300
Message-ID: <4a1c28b2ad4f701b9b2fe363ebf6acbab504e6ad@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 27 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, May 20, 2025 at 01:09:47PM +0300, Jani Nikula wrote:
>> 
>> Maxime -
>> 
>> I'm cutting a lot of context here. Not because I don't think it deserves
>> an answer, but because I seem to be failing at communication.
>> 
>> On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> > You still haven't explained why it would take anything more than
>> > registering a dumb device at probe time though.
>> 
>> With that, do you mean a dumb struct device, or any struct device with a
>> suitable lifetime, that we'd pass to devm_drm_panel_alloc()?
>> 
>> Is using devm_drm_panel_alloc() like that instead of our own allocation
>> with drm_panel_init() the main point of contention for you? If yes, we
>> can do that.
>
> Yeah, I was thinking of something along the lines of:
>
> const struct drm_panel_funcs dummy_funcs = {};
>
> struct drm_panel *register_panel() {
>     struct faux_device *faux;
>     struct drm_panel *panel;
>     int ret;
>
>     faux = faux_device_create(...);
>     if IS_ERR(faux)
>        return ERR_CAST(faux);
>
>     return __devm_drm_panel_alloc(&faux->dev, sizeof(*panel), 0, &dummy_funcs, $CONNECTOR_TYPE);
> }
>
> And you have a panel, under your control, with exactly the same
> setup than anyone else.

This [1] is what I'm toying with now, but again, draft stuff. Using
__devm_drm_panel_alloc() directly like above does make it cleaner.

Long term it can be improved, but my first dab at refactoring to make
that happen is already like 15-20 patches, and it'll just have to wait
until after making stuff work at all first.

I'm not sure if the ACPI device I'm passing to devm_drm_panel_alloc() is
correct, but it'll have to be *some* ACPI device for the lookup to
work. I am blissfully ignorant about its lifetime, but as long as
drm_panel_add() and drm_panel_remove() remain as they are, I don't think
it leaks anything. Fingers crossed.


BR,
Jani.


[1] https://gitlab.freedesktop.org/jani/linux/-/commit/241f21487e5e9a8fa72e37a8eebcc36099e6a1ee

-- 
Jani Nikula, Intel
