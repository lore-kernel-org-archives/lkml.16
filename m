Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D47623ABBD;
	Mon, 30 Jun 2025 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273704; cv=none; b=QWF5sITgJYEjBd2+RS8V+q41e5BWXHEDkfvVhQwINEzaO46YgA6U98cNEQIWgyTYWFLcn19nZXaS2ONz8DxdCsteGdw6h2gKWSXwx2hvTV+prSgn8gjq8gqiOKJwiS1Z/rl6Xws+PqHrI30MMXZNzYFGu19VVxxfrx2iU07VW78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273704; c=relaxed/simple;
	bh=ZoeV7hTvZ7zyNoBAbk7ZU3OwDw7OdAz1SLsJTafGCD4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d9AZ4lc0jVVVnpYpITS7ZZs3jKcxeuDHoCu1nC5iXhb9FMsNgRGMjpLecDw2UrTr3tGzlKJkk8cKGHSmbg1in4ZsRRqhYtrOrQPxOWUqqa6wN8549iNORlLVK22BQrPoRaFO9wAIPROI+uPlC+agekUL0Tjj7layhCzQjNm3tHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tyox2WDd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tyox2WDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751273703; x=1782809703;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZoeV7hTvZ7zyNoBAbk7ZU3OwDw7OdAz1SLsJTafGCD4=;
  b=Tyox2WDd1A3JOTZ9wy6s6D3m9QLCfb4A/3MPJbQ63VgzsNVE3FCVBq1m
   UuNs2ilRBkE4qHXIjpoz6sKFrjZ/B9pc3VNY/B2c6RTl5FtqN3BcPKmsx
   phxRJhG1iDbDwyYp7aaZTOJbt+hrZ/HkSWAtsnUrOiTYaoIjskg87U5nC
   vcBDKuIH95yQmPTCrA2+xszmxw4yMzSBYpXmed0smXQQJHUQstpJaT3w2
   UPXYaK5JFwD4hYDlTe1RxiqSNihmtHoS33TdlbFknQo4D1pXa1wp/H3Wn
   1akWeYyVxu19RQZBD3trDls1S3UpzqpduKTdWzNWD7XH2MOodzbH6P/M3
   g==;
X-CSE-ConnectionGUID: OEtSLuXcQTCVxK2tVI5Sbw==
X-CSE-MsgGUID: ++m/29glTaiOvIrTkro3lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64187078"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64187078"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 01:55:02 -0700
X-CSE-ConnectionGUID: aMxdty3SS/uZdck4/t10kQ==
X-CSE-MsgGUID: +BPBSCjGTuStozTxft5gCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153872392"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 01:54:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 11:54:55 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] platform/x86: think-lmi: Fix resource cleanup
 flaws
In-Reply-To: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
Message-ID: <5ee91db8-8ed1-6860-7736-9fb723371bc1@linux.intel.com>
References: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-406320142-1751273695=:7079"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-406320142-1751273695=:7079
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 28 Jun 2025, Kurt Borja wrote:

> Hi all,
>=20
> First patch is a prerequisite in order to avoid NULL pointer
> dereferences in error paths. Then two fixes follow.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Please send v3 with stable Cc tags in all these so that this dependency=20
gets automatically handled (as per documentation).

I'll apply this through the fixes branch but I can deal with the removal=20
of the lenovo/ folder from the file names myself while applying.

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> Changes in v2:
>=20
> [PATCH 02]
>   - Remove kobject_del() and commit message remark. It turns out it's
>     optional to call this (my bad)
>   - Leave only one fixes tag. The other two are not necessary.
>=20
> - Link to v1: https://lore.kernel.org/r/20250628-lmi-fix-v1-0-c6eec9aa3ca=
7@gmail.com
>=20
> ---
> Kurt Borja (3):
>       platform/x86: think-lmi: Create ksets consecutively
>       platform/x86: think-lmi: Fix kobject cleanup
>       platform/x86: think-lmi: Fix sysfs group cleanup
>=20
>  drivers/platform/x86/lenovo/think-lmi.c | 90 +++++++++++----------------=
------
>  1 file changed, 30 insertions(+), 60 deletions(-)
> ---
> base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
> change-id: 20250628-lmi-fix-98143b10d9fd
>=20

--=20
 i.

--8323328-406320142-1751273695=:7079--
