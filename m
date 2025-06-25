Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF92620C6;
	Wed, 25 Jun 2025 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854359; cv=none; b=sjJfe6fu563zjoaMnR56x9F8fTjJOt3znFdUkMBVdjwBqX0Toeb+wN09RBpMAjPIA9p5cnhUT+9aImMiPPQkWH/+7yq3Ua9BUIAL95dGp4wTUj6cUK4NpVWg7hbgysWnLQuae9myGludAPfYHu9X2tw32oNzIjCGLTSFasd9Dcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854359; c=relaxed/simple;
	bh=UelFFzS6oG348I5p+iwzQ7UsbLQUt8E4BBEkP+5q0xE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bVVglwwRCNP+bfWUUAAAURIR305HMRAKyT55Eio53pc7pFiXndwWv92Kty22ig9gT3lzThXAZtZVG/foCLQfVc6L9tgo6LIS/XCbrmdsF9uNr7sLcyujxPjWZm9b2mLe78URGapUjxDdB1nLubYrsNdQeJFmokYsnk3ko+Nhb5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxzgGl28; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxzgGl28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750854358; x=1782390358;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UelFFzS6oG348I5p+iwzQ7UsbLQUt8E4BBEkP+5q0xE=;
  b=UxzgGl289mI74ztyE2fLmrW1ZUM/6b6qqF6NmPBJN9qMUugEA+J7EhUI
   Ue2oPIqyhQQDK0G/AhsWdhHC3IbftHSZdPEAiZaehq7gN2KzKNrNp1edf
   N/AjTifabSvAhpkFAGNs+zXfnqmiXfBFWFMqVJeovMshzmlU5uAKIR9o5
   a+Irjb2CJp9pUsxlFbzCdGgCD9JY5hpl1FdLP5/bJssxvDDm+rubd1d7L
   aMcAqHfh0LYQpZBYD4B9PhI9ZGGSh6YgjGs5nPJDmUrwwUnoF5GBx3zFz
   1lby0iRRBSVQdsVNxd2FcliHtUuBeA5cxWFFAuzMdW8FlupxOObYwMLaf
   w==;
X-CSE-ConnectionGUID: zL2FNZxoSq+VmBNQU/n6Ag==
X-CSE-MsgGUID: HvNEZM/iTwG0xKgqV/l1zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52986242"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52986242"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:25:58 -0700
X-CSE-ConnectionGUID: WMV3rIyxTsCWayKt9r5iZQ==
X-CSE-MsgGUID: +5mhL3uxRK24tvclepUM3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156776317"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:25:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Jun 2025 15:25:52 +0300 (EEST)
To: Xiang Shen <turyshen@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, acelan.kao@canonical.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix code style issues
In-Reply-To: <rzzqmdogpedswwzdjutskz2ik5duik7c2u433csogl5g4rptdr@nrzck7xdvdcg>
Message-ID: <2f19dda5-a814-8572-2d5f-e851d6a747d4@linux.intel.com>
References: <20250620003849.54442-1-turyshen@gmail.com> <fdb9c21f-aada-498a-92ec-bc48aceeb76e@kernel.org> <hlsev7jydwejtdlyay6e6f53yorf2aguhxykscuukqfxugg7ff@hmmpcg7s4sx6> <83b27cc9-3544-4fd5-4ece-a46f422ec6fe@linux.intel.com>
 <rzzqmdogpedswwzdjutskz2ik5duik7c2u433csogl5g4rptdr@nrzck7xdvdcg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1185872638-1750854352=:944"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1185872638-1750854352=:944
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 25 Jun 2025, Xiang Shen wrote:

> On Tue, Jun 24, 2025 at 01:35:57PM +1000, Ilpo J=E4rvinen wrote:
> > On Sun, 22 Jun 2025, Xiang Shen wrote:
> > > On Fri, Jun 20, 2025 at 12:00:03PM +1000, Hans de Goede wrote:
> > > > On 20-Jun-25 2:38 AM, Xiang Shen wrote:
> > > > > Fix checkpatch code style errors:
> > > > >
> > > > > ERROR: do not use assignment in if condition
> > > > > +=09if ((ke =3D sparse_keymap_entry_from_scancode(priv->buttons_d=
ev,
> > > event))) {
> > > > >
> > > > > ERROR: do not use assignment in if condition
> > > > > +=09} else if ((ke =3D
> > > sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
> > > > >
> > > > > Signed-off-by: Xiang Shen <turyshen@gmail.com>
> > > >
> > > > Thank you for your patch, but this change really does not make
> > > > the code more readable.
> > > >
> > > > The contrary the suggested changes are making the code harder
> > > > to read, so NACK.
> > > >
> > > > Note checkpatch is just a tool, sometimes there are good reasons
> > > > to deviate from the style checks done by checkpatch.
> > > >
> > > > Next time when submitting a patch to fix checkpatch issues please
> > > > take a look at the resulting code after the patch and only submit
> > > > the patch upstream if it actually is an improvement.
> > > >
> > > > Regards,
> > > >
> > > > Hans
> > > >
> > > Hi Hans,
> > >=20
> > > Thanks for the feedback.
> > >=20
> > > That's fine if breaking the "rule" is the only way to keep the file
> > > readable.
> > >=20
> > > However, there are only three files (x86/sony-laptop.c and
> > > x86/dell/dell_rbu.c) out of 273 files in the whole drivers/platform
> > > folder that have such an error.
> >=20
> > Hi,
> >=20
> > Please don't call correct code "error" even if checkpatch may label it =
as
> > such. The goal is NOT and will never be to have zero checkpatch warning=
s.
> >=20
> > The fact that the checkpatch "rule" is broken only a few times does not
> > mean those 3 places have a problem, it just tells it's good rule for th=
e
> > general case. So I won't accept using such numbers as a leverage agains=
t
> > the few places just for the sake of silencing checkpatch.
> >=20
>
> I just thought there must be a reason that the checkpatch categories find=
ings
> as "ERROR", "WARNING" and "CHECK".

The checkpatch change submitter just picked one of the levels. They're=20
humans too. :-)

> Sometimes the number does make sense and means the vast majority
> follow the widely accepted "rule".
>
> Curiously, isn't it the contributor's due diligence to pass checkpatch
> in the first place before sending?

Hey, that code you're changing is not being submitted. We don't want to=20
waste our time on "fixing" checkpatch warnings on existing code when the=20
"fix" results in worse readability that before.

Also, if you would be submitting a patch and checkpatch suggest you=20
to make the patch worse, please don't follow checkpatch's advice even in=20
that case!

Checker tools are there to help find potential issues, not rulebooks. This=
=20
is often overlooked by many checker tool focused developers and results in=
=20
low quality patches (there are exceptions too where they developer really=
=20
tries to understand all the related code to see if the change makes sense=
=20
/ improves things or not).

> Should any objection, submit a patch to
> checkpatch itself,
> instead of sneaking into the upstream quietly for the sake of "readabilit=
y".
>
> > > Perhaps there are other approaches to make them more readable without
> > > breaking the rule.
> >=20
> > Perhaps, but I'm not sure the effort spent to find one is worthwhile
> > investment.
> >=20
>=20
> Indeed, that's precisely why it might be worth sacrificing a bit of
> "readability".

Please stop trying to sneak your subpar change in.

NO, this a hard NO from the acting maintainer. We'll not be accepting=20
misguided changes that are to silence ANY checker that should have know=20
better (those checkers will never learn enough to be relied 100% so=20
please stop spreading such illusion).


--=20
 i.

--8323328-1185872638-1750854352=:944--
