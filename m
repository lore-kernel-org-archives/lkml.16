Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642852475F7;
	Mon, 30 Jun 2025 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277811; cv=none; b=uzXb0nBT6ON0WM7ASC/Y2ydlzt8y4CMXozcwzpfW/7rqdmsNnnYFTq0nxOY1b1ZZRavwg2+ZeCuk3ARJVgXLLyb2O7DG11knePG/sNiYBq2QO98s2pr8yOAotALaikzcwxd2dXKRD13DbG1O2IJdIgbLdv350p+OEG1UAM8GQ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277811; c=relaxed/simple;
	bh=gFCA79flgaQXnugGgdIo3m8Y3CQG8kjvj8+trQjJNeA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MZlTwCtfDP7N/mVkAfBY1b8mM3g+jPlbpm5YJ7y4uT2wY3bJ/ALCUF3gCdzouAx6qsKoiSRlrMJla9yWpwuT8wlKirssF5k/5XiEg7mlqdagdM02XbZC2L0JNvS4gZfFXb60sMo2hUdA3g6e9HEvKVbkA3kOL1az98o4kO1eDXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjyAgmLR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjyAgmLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751277810; x=1782813810;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gFCA79flgaQXnugGgdIo3m8Y3CQG8kjvj8+trQjJNeA=;
  b=hjyAgmLRePO5j9EUDQR4lO0MpC4KrBUR3pAKVRkN6v+NYr52WlI9f6A6
   Rb8aGVwtL5P4S1cfVpWIqwi57JXIDW5UcYal3YFshSM3jE6tUVhfBhG3b
   a8WTeKqo38PF9iBhNcFAtaDC+yGT8EQqkBX5XJH1g2iv7S7dRKMT548GF
   l7oOOaX6t6uqbd0qnM0jWXn5d5/T4Mx63TrdBmotosLpc5eX23fD77z2j
   hvYgoa8JLkLfDGdKbdhQ/2kGX2CBXZgpEW9CvnwVa7I9wVyAbSwWvbXt0
   1PnYLbyRbMgb/kBAd8gecdiglzZRCttgPm+LIY+edHubHOyxhjry47D/4
   Q==;
X-CSE-ConnectionGUID: AQgpCvdFTcq6pEc1pZyNyA==
X-CSE-MsgGUID: TrHRK+NvRzyuYBUqIUIF2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64094586"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64094586"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:03:30 -0700
X-CSE-ConnectionGUID: p6Tg9e3YQrWI2l6W9ZCvRQ==
X-CSE-MsgGUID: 17Wdq6ufS9+Kq572OrFMRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="177079776"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:03:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 13:03:24 +0300 (EEST)
To: Alok Tiwari <alok.a.tiwari@oracle.com>
cc: hansg@kernel.org, vadimp@nvidia.com, platform-driver-x86@vger.kernel.org, 
    darren.kenny@oracle.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/mellanox: Fix logic error in power state check
 in mlxreg-lc
In-Reply-To: <8e86e409-0a19-ec74-f126-2e5315e3dc0a@linux.intel.com>
Message-ID: <fad3e60f-b6c2-19bd-020c-9306d1c88a99@linux.intel.com>
References: <20250630095001.598061-1-alok.a.tiwari@oracle.com> <8e86e409-0a19-ec74-f126-2e5315e3dc0a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1482056202-1751277804=:7079"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1482056202-1751277804=:7079
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 30 Jun 2025, Ilpo J=E4rvinen wrote:
> On Mon, 30 Jun 2025, Alok Tiwari wrote:

Also please move mlxreg-lc into prefixes (see some earlier commits made=20
into that file).

> > Fixes a logic issue in mlxreg_lc_completion_notify() where the
> > intention was to check if MLXREG_LC_POWERED flag is not set before
> > powering on the device.
> >=20
> > The original code used "state & ~MLXREG_LC_POWERED" to check for the
> > absence of the POWERED bit. However this condition evaluates to true
> > even when other bits are set, leading to potentially incorrect
> > behavior.
> >=20
> > Corrected the logic to explicitly check for the absence of
> > MLXREG_LC_POWERED using !(state & MLXREG_LC_POWERED).
> >=20
> > Suggested-by: Vadim Pasternak <vadimp@nvidia.com>
> > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>=20
> Makes sense but please add Fixes tag and resubmit as v2.
>=20
> > ---
> >  drivers/platform/mellanox/mlxreg-lc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/m=
ellanox/mlxreg-lc.c
> > index aee395bb48ae4..8681ceb7144ba 100644
> > --- a/drivers/platform/mellanox/mlxreg-lc.c
> > +++ b/drivers/platform/mellanox/mlxreg-lc.c
> > @@ -688,7 +688,7 @@ static int mlxreg_lc_completion_notify(void *handle=
, struct i2c_adapter *parent,
> >  =09if (regval & mlxreg_lc->data->mask) {
> >  =09=09mlxreg_lc->state |=3D MLXREG_LC_SYNCED;
> >  =09=09mlxreg_lc_state_update_locked(mlxreg_lc, MLXREG_LC_SYNCED, 1);
> > -=09=09if (mlxreg_lc->state & ~MLXREG_LC_POWERED) {
> > +=09=09if (!(mlxreg_lc->state & MLXREG_LC_POWERED)) {
> >  =09=09=09err =3D mlxreg_lc_power_on_off(mlxreg_lc, 1);
> >  =09=09=09if (err)
> >  =09=09=09=09goto mlxreg_lc_regmap_power_on_off_fail;
> >=20
>=20
>=20

--=20
 i.

--8323328-1482056202-1751277804=:7079--
