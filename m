Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7322119992D;
	Mon, 14 Apr 2025 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646823; cv=none; b=k+WZDgT4WPy687cUGvE1EFDiTmMaexSqZHhyOoo9Ivcd7DRccRM+ftg4ssJRYfRKwSDLLz2s0fcTeVHbrDVQD7tERr+AEV3yLpPNSYbC3CaSekPLajfILqm+3PR2Q2ttIkECfFBSIvFw9H+0arc0E+IlvvKxu9hf67WqYbsyMLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646823; c=relaxed/simple;
	bh=5vyO76akIVHyQuw1CpphmbHreZZbR27cRV4ouM7NqB8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jm2eA5qPdpXiYd0OSZVlHQf0U/EooWVo5y5GAEwyPTtp2NlwAORdYZGR9xvq8wesQSvyynM+9hib2GGAn4Pe2GLwEo5dOclSINRV5GLQt5M3C805q7gd89TfFOCwxuPZsjBagCe78IPcMki6NNwB+Nga/wmJAcwwZ03KNf0SkYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ck8w8nHb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ck8w8nHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744646821; x=1776182821;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=5vyO76akIVHyQuw1CpphmbHreZZbR27cRV4ouM7NqB8=;
  b=ck8w8nHbI6Uq2gdMrN3Z3+Puo1UTdiEJAfaR+pGSFDYs8jpEqVoLXi9n
   LY63UWcoYBG11xbTc4ak2ozUm7ytXLNwYHd3xen8QuZM1M+r27iSPYHwg
   fIgpzI6LZq69yrn/OYvU/v8+awEeMOgmmskQgP0KtuIKgHzjOqw0xfaz+
   AuMP0pia7mvUCGRGw9KYNiaFiUQ2NJ/99mhQZIf+ajZeOPZRXl9fLqz57
   nQ8T34QXvti4qhyvK6UwMZc50NbMkr3Nq7O77+d9Dd2VXitnkyZtiAfvA
   pGvvsNX34Hh+pOsjLak4iegTacyAG3zOqtPaP5srb8Ed7JFTSfaXPqXKD
   g==;
X-CSE-ConnectionGUID: G8MrIndxRIaoZgznX/R4/w==
X-CSE-MsgGUID: ngH3izHJSI6FsVSLlOISMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46291715"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46291715"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:06:55 -0700
X-CSE-ConnectionGUID: pl5lA5UeTgqD9X8UesyxZA==
X-CSE-MsgGUID: AMfTgzeaQTWQnFAqKmcJOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134843313"
Received: from spandruv-desk1.amr.corp.intel.com ([10.125.109.3])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:06:55 -0700
Message-ID: <f673452d7afc4419120f2cdb32e5033c35f22229.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: fix inconsistent state
 on init failure
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 shouyeliu <shouyeliu@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org,  LKML <linux-kernel@vger.kernel.org>
Date: Mon, 14 Apr 2025 09:06:54 -0700
In-Reply-To: <1feb5888-5ec8-67aa-9775-e1bea6b8b9fe@linux.intel.com>
References: <20250414092132.40369-1-shouyeliu@gmail.com>
	 <1feb5888-5ec8-67aa-9775-e1bea6b8b9fe@linux.intel.com>
Autocrypt: addr=srinivas.pandruvada@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQGNBGYHNAsBDAC7tv5u9cIsSDvdgBBEDG0/a/nTaC1GXOx5MFNEDL0LWia2p8Asl7igx
 YrB68fyfPNLSIgtCmps0EbRUkPtoN5/HTbAEZeJUTL8Xdoe6sTywf8/6/DMheEUzprE4Qyjt0HheW
 y1JGvdOA0f1lkxCnPXeiiDY4FUqQHr3U6X4FPqfrfGlrMmGvntpKzOTutlQl8eSAprtgZ+zm0Jiwq
 NSiSBOt2SlbkGu9bBYx7mTsrGv+x7x4Ca6/BO9o5dIvwJOcfK/cXC/yxEkr1ajbIUYZFEzQyZQXrT
 GUGn8j3/cXQgVvMYxrh3pGCq9Q0Q6PAwQYhm97ipXa86GcTpP5B2ip9xclPtDW99sihiL8euTWRfS
 TUsEI+1YzCyz5DU32w3WiXr3ITicaMV090tMg9phIZsjfFbnR8hY03n0kRNWWFXi/ch2MsZCCqXIB
 oY/SruNH9Y6mnFKW8HSH762C7On8GXBYJzH6giLGeSsbvis2ZmV/r+LmswwZ6ACcOKLlvvIukAEQE
 AAbQ5U3Jpbml2YXMgUGFuZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5j
 b20+iQHRBBMBCAA7FiEEdki2SeUi0wlk2xcjOqtdDMJyisMFAmYHNAsCGwMFCwkIBwICIgIGFQoJC
 AsCBBYCAwECHgcCF4AACgkQOqtdDMJyisMobAv+LLYUSKNuWhRN3wS7WocRPCi3tWeBml+qivCwyv
 oZbmE2LcxYFnkcj6YNoS4N1CHJCr7vwefWTzoKTTDYqz3Ma0D0SbR1p/dH0nDgN34y41HpIHf0tx0
 UxGMgOWJAInq3A7/mNkoLQQ3D5siG39X3bh9Ecg0LhMpYwP/AYsd8X1ypCWgo8SE0J/6XX/HXop2a
 ivimve15VklMhyuu2dNWDIyF2cWz6urHV4jmxT/wUGBdq5j87vrJhLXeosueRjGJb8/xzl34iYv08
 wOB0fP+Ox5m0t9N5yZCbcaQug3hSlgp9hittYRgIK4GwZtNO11bOzeCEMk+xFYUoa5V8JWK9/vxrx
 NZEn58vMJ/nxoJzkb++iV7KBtsqErbs5iDwFln/TRJAQDYrtHJKLLFB9BGUDuaBOmFummR70Rbo55
 J9fvUHc2O70qteKOt5A0zv7G8uUdIaaUHrT+VOS7o+MrbPQcSk+bl81L2R7TfWViCmKQ60sD3M90Y
 oOfCQxricddC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-04-14 at 13:41 +0300, Ilpo J=C3=A4rvinen wrote:
> On Mon, 14 Apr 2025, shouyeliu wrote:
>=20
> > When uncore_event_cpu_online() fails to initialize a control CPU
> > (e.g.,
> > due to memory allocation failure or uncore_freq_add_entry()
> > errors),
> > the code leaves stale entries in uncore_cpu_mask after that online
> > CPU
> > will not try to call uncore_freq_add_entry, resulting in no sys
> > interface.
>=20
> Please add () after any name that refers to a C function (you're not
> even=20
> being consistent here as you had it in some cases but not here).
>=20
> Please try to split the very long sentence a bit and make it more
> obvious=20
> what causes what as the current wording is a bit vague, did you mean:
> uncore_event_cpu_online() will not call uncore_freq_add_entry() for
> another CPU that is being onlined or something along those lines?
>=20
> Will this change work/matter? Documentation/core-api/cpu_hotplug.rst
> says=20
> about cpuhp_setup_state():
>=20
> "If a callback fails for CPU N then the teardown callback for CPU
> =C2=A00 .. N-1 is invoked to rollback the operation. The state setup
> fails,
> =C2=A0the callbacks for the state are not installed and in case of dynami=
c
> =C2=A0allocation the allocated state is freed."
>=20

Yes, cpuhp_setup_state() will fail and which will result in clean up.
So any fail of any fail uncore_event_cpu_online() will result in no sys
entries.

I think here the intention is to keep sys entries, which will not
happen with this patch.

For confirmation on 6.14 kernel, I forced failure on CPU 10:

[595799.696873] intel_uncore_init=20
[595799.700102] uncore_event_cpu_online cpu:0
[595799.704240] uncore_event_cpu_online cpu:1
[595799.708360] uncore_event_cpu_online cpu:2
[595799.712505] uncore_event_cpu_online cpu:3
[595799.716633] uncore_event_cpu_online cpu:4
[595799.720755] uncore_event_cpu_online cpu:5
[595799.724953] uncore_event_cpu_online cpu:6
[595799.729158] uncore_event_cpu_online cpu:7
[595799.733409] uncore_event_cpu_online cpu:8
[595799.737674] uncore_event_cpu_online cpu:9
[595799.741954] uncore_event_cpu_online cpu:10
[595799.746134] Force CPU 10 to fail online
[595799.750182] uncore_event_cpu_offline cpu:0
[595799.754508] uncore_event_cpu_offline cpu:1
[595799.758834] uncore_event_cpu_offline cpu:2
[595799.763238] uncore_event_cpu_offline cpu:3
[595799.767558] uncore_event_cpu_offline cpu:4
[595799.771832] uncore_event_cpu_offline cpu:5
[595799.776178] uncore_event_cpu_offline cpu:6
[595799.780506] uncore_event_cpu_offline cpu:7
[595799.784862] uncore_event_cpu_offline cpu:8
[595799.789247] uncore_event_cpu_offline cpu:9
[595799.793540] intel_uncore_init cpuhp_setup_state failed
[595799.798776] intel_uncore_init failed


Thanks,
Srinivas



> >=20
>=20
> Fixes tag?
>=20
> > Signed-off-by: shouyeliu <shouyeliu@gmail.com>
>=20
> The correct format for tags is documented in=20
> Documentation/process/5.Posting.rst:
>=20
> tag: Full Name <email address>
>=20
> > ---
> > =C2=A0.../x86/intel/uncore-frequency/uncore-frequency.c=C2=A0=C2=A0=C2=
=A0 | 12
> > ++++++++----
> > =C2=A01 file changed, 8 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency.c
> > index 40bbf8e45fa4..1de0a4a9d6cd 100644
> > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency.c
> > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency.c
> > @@ -146,15 +146,13 @@ static int uncore_event_cpu_online(unsigned
> > int cpu)
> > =C2=A0{
> > =C2=A0	struct uncore_data *data;
> > =C2=A0	int target;
> > +	int ret;
> > =C2=A0
> > =C2=A0	/* Check if there is an online cpu in the package for
> > uncore MSR */
> > =C2=A0	target =3D cpumask_any_and(&uncore_cpu_mask,
> > topology_die_cpumask(cpu));
> > =C2=A0	if (target < nr_cpu_ids)
> > =C2=A0		return 0;
> > =C2=A0
> > -	/* Use this CPU on this die as a control CPU */
> > -	cpumask_set_cpu(cpu, &uncore_cpu_mask);
> > -
> > =C2=A0	data =3D uncore_get_instance(cpu);
> > =C2=A0	if (!data)
> > =C2=A0		return 0;
> > @@ -163,7 +161,13 @@ static int uncore_event_cpu_online(unsigned
> > int cpu)
> > =C2=A0	data->die_id =3D topology_die_id(cpu);
> > =C2=A0	data->domain_id =3D UNCORE_DOMAIN_ID_INVALID;
> > =C2=A0
> > -	return uncore_freq_add_entry(data, cpu);
> > +	ret =3D uncore_freq_add_entry(data, cpu);
> > +	if (!ret) {
> > +		/* Use this CPU on this die as a control CPU */
> > +		cpumask_set_cpu(cpu, &uncore_cpu_mask);
> > +	}
> > +
> > +	return ret;
>=20
> Please reverse to logic such that you return early on error, which is
> the=20
> usual error handling pattern.
>=20
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int uncore_event_cpu_offline(unsigned int cpu)
> >=20
>=20

