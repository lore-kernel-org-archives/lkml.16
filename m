Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB9E17E00E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120296; cv=none; b=JufuvC/rTQEGtKJOIa+iaFHS5AysLfmkdISU3CZv1cu969DURl5I9M3mW8Jw3Hl6J5x3ElgMiRsk1oh4NQl1hjLxVAWs9nu6B+8ueZxSULNltFLdla0kHaFQwsbrHVHRJUhschNNaY23iBW4Vzt5kL9MxymEnSNZBbd9TtmwhaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120296; c=relaxed/simple;
	bh=FRyVqyIGDDWPX66ccDPKXCI5hV4OAn9aT1p3wZZXQEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KpEZn+3U71TqFBN67MLzeFk2kcxOdTiDR8grvIa9TrOCLt1vIgiZ7WO3czYkw2zgTinKWcVcBww9NvaSXIsHFqItrNTYwKPT79PIZdAMdLPQEKuZHWX3XoIbn0IPRt05DuCGC1xt0ZOOb2MYkOsI246FjQWSW4iTsDMX/kUJxTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1N3YHGU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1N3YHGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744120295; x=1775656295;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=FRyVqyIGDDWPX66ccDPKXCI5hV4OAn9aT1p3wZZXQEM=;
  b=d1N3YHGUYX8bgm5Lm6lzpZBMILXNGuQFclmdAHAyHZ1JUwwoA8XleuLf
   xQhvq53Te17Z2p+lhKDh0KPCl7Q3AbcABZ+gZSjAr54ppPrnx7HViI2EC
   mhfvKWuilWoxvhWtEpeP4JxnGOYTRGW9kvwfSW5tCvGl0SolIf5oAhOFj
   a1U+UnITBdjUbJG/kxjhrAsHPRIbA+4K9ohucvbHR6Dq2+k2rg1yOKkXL
   hyTQsKYpy5j2GzlKkfBtf1tMbLNDFLk3W/5GWXnEqSe7DbZX6WnTE6sjR
   GvNrSe8c+H9xnCRs0KfWeTGlbKP5KQqBM6EMGvZG+qET6XEfeAj/ck+z1
   Q==;
X-CSE-ConnectionGUID: nNuA4ZPBS2a6dIn+rRoeKA==
X-CSE-MsgGUID: QAN4fmnmRzGhUySLmCiuaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49398260"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49398260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:51:34 -0700
X-CSE-ConnectionGUID: LUP5wNbDRZ6oDLkXV+3D9Q==
X-CSE-MsgGUID: LJrp2DPkTDa9WtrX1v+ONQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="159268858"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.137])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:51:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Maxime
 Ripard <mripard@kernel.org>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Anusha Srivatsa
 <asrivats@redhat.com>, "Deak, Imre" <imre.deak@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj
 <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
In-Reply-To: <SJ1PR11MB61291B6DC29337864C59210FB9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
 <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
 <85a58rsgjj.wl-ashutosh.dixit@intel.com>
 <87bjt7eca8.wl-ashutosh.dixit@intel.com>
 <87a58re8hj.wl-ashutosh.dixit@intel.com>
 <854iyzs3na.wl-ashutosh.dixit@intel.com>
 <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20250408-industrious-impetuous-wombat-f6d7dc@houat>
 <SJ1PR11MB61291B6DC29337864C59210FB9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
Date: Tue, 08 Apr 2025 16:51:25 +0300
Message-ID: <87o6x6yd5u.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 08 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
>> > We will need more changes than fixing the variable names.
>> >
>> > I get this error
>> >
>> > ERROR: modpost: "__devm_drm_panel_alloc"
>> [drivers/gpu/drm/panel/panel-auo-a030jtn01.ko] undefined!
>> > make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
>> > make[1]: ***
>> > [/home/chaitanya/exodus/repos/drm-tip-sandbox/Makefile:1956:
>> modpost]
>> > Error 2
>> > make: *** [Makefile:248: __sub-make] Error 2
>> >
>> > after making the following change.
>> 
>> I couldn't reproduce this one on current drm-misc-next with arm64 and
>> x86 allmodconfig. Could you share your configuration?
>> 
>
> Here is the config that our CI uses
>
> https://gitlab.freedesktop.org/drm/xe/ci/-/raw/main/kernel/kconfig

There's

CONFIG_DRM_PANEL=y
# CONFIG_OF is not set

but __devm_drm_panel_alloc is inside #ifdef CONFIG_OF. I don't know that
it should be.

There are some stubs in drm_panel.h for !CONFIG_OF but not this one.

Finally, DRM_PANEL_AUO_A030JTN01 does not depend on OF.


That's the issue, but I don't know what the correct fix would be.


BR,
Jani.


-- 
Jani Nikula, Intel
