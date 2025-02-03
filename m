Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A69F205AB5;
	Mon,  3 Feb 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594952; cv=none; b=lGD2TuAEAMiI5oLjYy/nBy2ow7w7KUuNQOMXr/5t/9FtfHrnfefN4QX+CilC2DS8QKGwD2+rTpKkDZLIqPI1T1Ujpzl2DzL1Mwtg4h7Yh1FPIJhCsLqLkhT8ZSSXBQzgJGhuJ4z80FHds66tHFm9ir+buDl9U2E+pKZOeN1hCSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594952; c=relaxed/simple;
	bh=+PkJrc74aX1iAPjaFb0hAaPGitbXKazei/4Vi7dvsQo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BYmkdzAd7HfmY0NTQepqeDnanBX30Rps5eBhdDI4uNOQBbF56tK8NnbAiYZT67q99zD7QtjZtcsojtqgAG7g7SKwM3Pxuzjt1WTJfCw2pZBs8imqFIUensIb7LywzEbhNvBj9vInKVTZZjJ+AodeIKrkw8+9xG/hsgFf9mXO52s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1NXXZW9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1NXXZW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738594951; x=1770130951;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+PkJrc74aX1iAPjaFb0hAaPGitbXKazei/4Vi7dvsQo=;
  b=P1NXXZW9+UQo1qGaxpzX/olnAPsWqWbUrhxBMWt/rhFCfxneOPEkkzbp
   VffiBCdV+ODsGWelA6o8HXDOFbq8wvG4YyPwalV9tYrfDCFBWhF+Nti+0
   RIorDhgOobELAEsG8IaD7PDQoQdmiN70Glg9tNK7mCugy9rRSIr+1AqWb
   peZYakz8RGa9/S6bqyxRA11uopohwl7uG8zDdXIBu+p0bN6GEt82GUKAC
   qjCHNnFvQzxk/iDwlgJtshs6KIKAUn1fIeslHt8se0F0F/g3djBKdo8BM
   thXJyfusBs9iKPh8cMkSCL5VuLj7TZWCIbwdmESEHEVYl399191xbo1I7
   Q==;
X-CSE-ConnectionGUID: nLLjJGKdQyysKw1H9V5KzA==
X-CSE-MsgGUID: 1cw6Dz6nTzCepxAMlIm2wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38977789"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="38977789"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:02:30 -0800
X-CSE-ConnectionGUID: cEcSTHOFTuulXn9v9rIwqg==
X-CSE-MsgGUID: 0sUVOiOqRD2DOixfAv2FTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133554077"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 07:02:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 17:02:22 +0200 (EET)
To: Joshua Grisham <josh@joshuagrisham.com>
cc: W_Armin@gmx.de, thomas@t-8ch.de, kuurtb@gmail.com, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    corbet@lwn.net, linux-doc@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v10] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
In-Reply-To: <20250201105450.193450-1-josh@joshuagrisham.com>
Message-ID: <a22ecdd5-a2a5-4f6b-0a1a-e1bc115dc01f@linux.intel.com>
References: <20250201105450.193450-1-josh@joshuagrisham.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-450076370-1738594942=:15198"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-450076370-1738594942=:15198
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 1 Feb 2025, Joshua Grisham wrote:

> Add a new driver for Samsung Galaxy Book series notebook devices with the
> following features:
>=20
> - Keyboard backlight control
> - Battery hook for installing power supply extension to add charge
>   control end threshold
> - Controller for Samsung's performance modes using the platform profile
>   interface
> - Adds firmware-attributes to control various system features
> - Handles various hotkeys and notifications
>=20
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

I've applied this to review-ilpo-next.

Thanks a lot to all who have taken time to help in getting this into=20
shape!

--=20
 i.

--8323328-450076370-1738594942=:15198--
