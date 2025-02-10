Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2164F1F3FE2;
	Mon, 10 Feb 2025 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188394; cv=none; b=CspxrgaqnN0uJJQjp1UlMIVICYV2wOH0wjrrfw1G/jE+Wz/AO8Ea98S3WB3AAiWyY+2FgOOYZTmVHb4OuT9n2B0xmUKbCnURCW/1W+RvvMrgXZ50kKmrf79g7gjaSv0AEKwhqBz9CDXahMNMLHyfId88P0eAs4n6WlfX9puGeuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188394; c=relaxed/simple;
	bh=I304bQBcYvMS6eU6MsvUkfYlrtHWVlZgLhlIwTPWjY0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R3IyafaPg+qfKay+bO7yu+1nPFzHhjU496bJhLTx1wOy1uVNPMgOgLMs6FczrsqboC3C/lh0todXeUzzD1YE2PkNHz/12LcC9G/6lUUId9VOq/KC4YrWZ31UaFixo8PGC06B4hLJMlR0Yp3MTQoZRWD8HpOhVHa8JkgUfyYV7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3eLNAzQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3eLNAzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739188392; x=1770724392;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=I304bQBcYvMS6eU6MsvUkfYlrtHWVlZgLhlIwTPWjY0=;
  b=K3eLNAzQosrdaTsO1eOc9E38ZZU665kOOBR2tBACVLiegqQLrkJN9Wo3
   vPzL4tBYk2xwi916y93bn23VBga2os4IFblf6kfyUhTOJosrxo/WVwHpW
   +s2oFcU1UF90WCuy93khqxX/m94u0aHSrLdxSy4n9L8NHf3Ganhw5EMsw
   CnPOpdHCtBX8X1VHSof6FSOrmsmVFbse3XRTxhiFvTzImhshnmnYOYbyw
   VChpfwuk5ztrO98JAXe+ZEpAnmP7zRfGiTxU92kXbu5tGcqeYAKiSRjn5
   NmSk1RKnaoTutLLUg+LTM9oXSiLP60Gn1oug2iRLnZO94toigKI9S2OlO
   Q==;
X-CSE-ConnectionGUID: K88wk34bTkyOi7tQNIg+GA==
X-CSE-MsgGUID: 7N+eMbkwSPS9ThzgyVp+0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39677724"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39677724"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 03:53:12 -0800
X-CSE-ConnectionGUID: onVc1ZbwRxevUmEeuxkz9w==
X-CSE-MsgGUID: iuz/67hMQcqynnTIgdVaDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116239529"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 03:53:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 10 Feb 2025 13:53:05 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 11/14] platform/x86: Split the alienware-wmi driver
In-Reply-To: <D7MBDPIDK7XS.3DONIQK22EIBH@gmail.com>
Message-ID: <c314c485-7a6f-b10a-2d80-45a8c5fb331e@linux.intel.com>
References: <20250207140743.16822-1-kuurtb@gmail.com> <20250207140743.16822-12-kuurtb@gmail.com> <85e378b4-a434-efe1-fd16-416fc3ce3691@linux.intel.com> <D7MBDPIDK7XS.3DONIQK22EIBH@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1238747784-1739188385=:936"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1238747784-1739188385=:936
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 7 Feb 2025, Kurt Borja wrote:

> On Fri Feb 7, 2025 at 10:05 AM -05, Ilpo J=C3=A4rvinen wrote:
> > On Fri, 7 Feb 2025, Kurt Borja wrote:
> >
> >> Split alienware-wmi WMI drivers into different files. This is done
> >> seamlessly by copying and pasting, however some blocks are reordered.
> >>=20
> >> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> >
> > Hi,
> >
> > Can you please check there's no error in driver_data assignments as the=
=20
> > numbers in removed & added lines do not match:
>=20
> Hi Ilpo,
>=20
> There was indeed a wrong assignment to Alienware m16 r1 AMD, I'm not
> really sure how it happened but it's fixed now!
>=20
> I'll send a v10. I apologize for the noise.
>=20
> >
> > $ git diff-tree -p 73224c076cf2fa2968d61584c62937f6180c8e71 | grep driv=
er_data | rev | sort | rev | uniq -c
>=20
> Thanks for this amazing trick btw.

Apparently the rev trick wouldn't have been even necessary in this case=20
but writing those things are a second nature to me. When reviewing=20
especially move changes, one has to have a bag full of tricks. :-)

It is one of the reasons why I prefer to have move patches do as little=20
extra work as possible because I can use pipelines to verify the pre and=20
post content is identical.

I usually starting by diffing - and + lines in the diff which is how I=20
came across this one too. In the best case there are no code line changes=
=20
at all but all changes are in the boilerplate, it gives very high=20
confidence on the move being done correctly. When a rebase conflicts,=20
everyone (me included), might introduce unintended changes to move-only=20
patches so I tend to check even my own move patches in similar fashion to=
=20
avoid making stupid mistakes.

Even the diff of diffs wouldn't get me to 100%, it find that <5% that=20
differs so I can focus on whether it is sound.

>=20
> ~ Kurt
>=20
> >       1 +               awcc =3D id->driver_data;
> >       1 -               awcc =3D id->driver_data;
> >       4 +               .driver_data =3D &generic_quirks,
> >       5 -               .driver_data =3D &generic_quirks,
> >       7 +               .driver_data =3D &g_series_quirks,
> >       6 -               .driver_data =3D &g_series_quirks,
> >
> > (That commit id is from my staging tree, not available to you but it's=
=20
> > this patch.)
>=20

--=20
 i.

--8323328-1238747784-1739188385=:936--
