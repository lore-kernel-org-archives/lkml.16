Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1E419B3EC;
	Fri, 28 Mar 2025 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170008; cv=none; b=VqULDSc9IJliqmzGx8q0P9orfz90Z+YuHiu/6nNEFPqocqetvuy9L53h/SybwIsptyZf1gNMvEDLt+BO9HfHmmR0MmtydLloyJrx0/RityLdSixDEQZSESsttITYKY+yzCvN397qhOeVQgL5M0tyFY3Q2FTAFusM72Sbbu2YzbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170008; c=relaxed/simple;
	bh=3Dn8vmmuL4UVaiBoLpANoM0FbUsJKWkUjAYehvrVTbg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=la4RHtqTnuNF+QnKTp/gLS3P+DfY655vTo7phjyBirWcHWk+F1VgjMMjRJkFCXcZfSMLETjHlZJ0vOFyvyA1jxUNeSPwhuE4KKT+zsLlo8Rli2Otnro1qY1Foqb9PeCN3ghFoyIaUXGawgRjX0Anz9hwHUCI6hIaXYsX7GNiNOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIka5lbH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIka5lbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743170006; x=1774706006;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3Dn8vmmuL4UVaiBoLpANoM0FbUsJKWkUjAYehvrVTbg=;
  b=RIka5lbHEOFReT94qA/yhsJ1BDiIY+R4tHfJpa2nZDAFTWbecO6eFIJt
   h03J1+GUdDyZf6FbAjfYknB0FCi68zF+rejrTbQaA9qxPCyG7vcHOqfe7
   5H0U1LsM0sL2CagFU1NHw0NzOF73skM4tP3CNHgKAwzsJXseZexDBfi3D
   3P/dyqBCnPlV99OYLHS6iDNbSKA7zhFhoHx0y+/oBmn2XOWMgYEhEpYQm
   5BVAn3CmTKHwGseFG+oTSTWYmSNMS6/w7p/hk4axKEiWI0d4LkfS4/vH7
   sfQReCZ72zkOdhjgDD1eXd024q6qskVAykkaVcRpaLCdpYUay+ZqxT7uN
   g==;
X-CSE-ConnectionGUID: lVPeGv+FQ8SCLy/4rSWm1Q==
X-CSE-MsgGUID: gN+9f2K5TieDjAodYKCXGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48402411"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="48402411"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 06:53:25 -0700
X-CSE-ConnectionGUID: 8p6xV5CMQJKdozzX85jl+g==
X-CSE-MsgGUID: UDoALrd/T262kbwaU8U4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125214951"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 06:53:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 15:53:19 +0200 (EET)
To: Arefev <arefev@swemel.ru>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    lvc-project@linuxtesting.org
Subject: Re: [PATCH] asus-laptop: Fix an uninitialized variable
In-Reply-To: <c7f5f4cc-c187-4402-91dd-4d0096e396fa@swemel.ru>
Message-ID: <ddd60b0f-47a5-c93b-f055-d6900dfbd7de@linux.intel.com>
References: <20250325095739.20310-1-arefev@swemel.ru> <88f06d15-0f98-2f24-7e68-eefb6434f108@linux.intel.com> <c7f5f4cc-c187-4402-91dd-4d0096e396fa@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-342882028-1743169999=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-342882028-1743169999=:932
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 26 Mar 2025, Arefev wrote:

> 25.03.2025 14:18, Ilpo J=C3=A4rvinen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, 25 Mar 2025, Denis Arefev wrote:
> >=20
> > > The value returned by the acpi_evaluate_integer() function is not
> > > checked, but the result is not always successful, so an uninitialized
> > > 'val' variable may be used in calculations.
> > >=20
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > >=20
> > > Fixes: b23910c2194e ("asus-laptop: Pegatron Lucid accelerometer")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Denis Arefev <arefev@swemel.ru>
> > > ---
> > >   drivers/platform/x86/asus-laptop.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/asus-laptop.c
> > > b/drivers/platform/x86/asus-laptop.c
> > > index d460dd194f19..b74b7d0eb6c2 100644
> > > --- a/drivers/platform/x86/asus-laptop.c
> > > +++ b/drivers/platform/x86/asus-laptop.c
> > > @@ -427,7 +427,7 @@ static int asus_pega_lucid_set(struct asus_laptop
> > > *asus, int unit, bool enable)
> > >   static int pega_acc_axis(struct asus_laptop *asus, int curr, char
> > > *method)
> > >   {
> > >   =09int i, delta;
> > > -=09unsigned long long val;
> > > +=09unsigned long long val =3D PEGA_ACC_CLAMP;
> > >   =09for (i =3D 0; i < PEGA_ACC_RETRIES; i++) {
> > >   =09=09acpi_evaluate_integer(asus->handle, method, NULL, &val);
> > Shouldn't you handle the error from acpi_evaluate_integer() properly
> > instead?
> >=20
> Apparently, the developer realized that the output is very noisy and
> therefore created an algorithm that will surely return a good result.
>=20
> I did not check the return value, because if acpi_evaluate_integer()
> cannot read the values of accelerometers, 'val' will remain
> uninitialized and will be used in further calculations.

But if ACPI doesn't provide a value, why should that clamp value be used=20
instead? I'd tend to think curr would be more suitable "default".

But shouldn't the loop either use continue to retry or the function=20
return curr right away if acpi_evaluate_integer() returns an error?

I just don't see how your patch improves situation here despite silencing=
=20
the checker tool.

--=20
 i.

--8323328-342882028-1743169999=:932--
