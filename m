Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A350A21D3D1;
	Thu,  8 May 2025 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694346; cv=none; b=CmCauG12gPGZbsub2Chi2hQQgel8GaEQZTX0ncokmdCGkxqckYNAhVGZiLc666cBJat73H/0gFfxxcCfsmYWGqkVGS+58FqbEz59H00MHVLAAY2WNXOfnrAsiqzZ4QVn64VzhbBeFasPb1DQNEiIRnsm4ufiMNs55yJktBlZEAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694346; c=relaxed/simple;
	bh=2JybxVuhzZ1IxMkumntzYATbXHx8Z2iVbmnLFMb4mQE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H2xmJOfAckBGdAxOH/OuaI2nCQILwYb86t0do9F8nP2xbdm5C3J8C/x/EDtcALq/KxcmOl4he7b79+6WqJSWmLDRTvrMSTg6JkKijeum5yJwv1Riu3AGSrLVk9lTT3jR8erE+qb+VoiXbhns13+otfJolPRViwPgL0Y0J1gOzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZnBWmGW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZnBWmGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746694344; x=1778230344;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2JybxVuhzZ1IxMkumntzYATbXHx8Z2iVbmnLFMb4mQE=;
  b=SZnBWmGWaxosLSGy818VTgtaWmnSqs5gT8rnFVGh4pHaSqTcKIuU7WD4
   k2TTL19eV369MePj+zqq0dDwLqeNCcv4SK5xwdHQma+gMoccL5+Eo68z6
   BxshMmfVwa9Uli6FgfGlZCLox2Dkeou97fF2kooyY9a2MEbeASpBrkIVW
   P9UQNYNb+ZqVcDd91ZU10U25ue78vxKXADq9om11+5wqsY43UGTq9oZRL
   HVIyz/qqOPFqyUEubU+DqvSPfHFkHj962BhGRy4Mo/D1oaSI+AYAt+GLN
   tW8rRAXh51cObl5RhxnbeQ36PKHaIdaRfOjttBMNv9hrvFKy7oj4fs1SG
   g==;
X-CSE-ConnectionGUID: K9bJBWP2TzCU2HUy7/1cHQ==
X-CSE-MsgGUID: BX4T05E7QOKaCMycizrI+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48331424"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48331424"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 01:52:24 -0700
X-CSE-ConnectionGUID: rVVnqN1XShi7MVNcvLZmnQ==
X-CSE-MsgGUID: EzX8bqWkSNisWk974qym3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="137215311"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 01:52:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 May 2025 11:52:17 +0300 (EEST)
To: "Nirujogi, Pratap" <pnirujog@amd.com>
cc: Ilya K <me@0upti.me>, Pratap Nirujogi <pratap.nirujogi@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com, 
    gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for
 OV05C10
In-Reply-To: <019c9a4d-f8e5-4345-95df-255a04e5c34e@amd.com>
Message-ID: <c98e9dd5-69e1-0a20-dcc7-f9f7fa40762a@linux.intel.com>
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com> <9061d5a7-c1f6-47ad-b60a-226e48021d62@0upti.me> <21c9d764-4945-4837-93dc-ab58f22f8668@linux.intel.com> <019c9a4d-f8e5-4345-95df-255a04e5c34e@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1072942574-1746694337=:922"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1072942574-1746694337=:922
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 7 May 2025, Nirujogi, Pratap wrote:
> On 5/6/2025 8:53 AM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Tue, 6 May 2025, Ilya K wrote:
> >=20
> > > > +#define AMDISP_OV05C10_I2C_ADDR            0x10
> > > > +#define AMDISP_OV05C10_PLAT_NAME   "amdisp_ov05c10_platform"
> > > > +#define AMDISP_OV05C10_HID         "OMNI5C10"
> > > > +#define AMDISP_OV05C10_REMOTE_EP_NAME      "ov05c10_isp_4_1_1"
> > > > +#define AMD_ISP_PLAT_DRV_NAME              "amd-isp4"
> > >=20
> > > Hey folks, I know v12 might be a bit too late for this one, but I've =
got
> > > another device here (Asus GZ302EA tablet) with a very similar camera
> > > setup, but a different sensor (OV13B10), and it looks like this drive=
r
> > > just assumes a certain hardcoded configuration... I wonder if it make=
s
> > > sense to reorganize the code so that more sensor configurations can b=
e
> > > added without making a separate module? I'd be happy to help with
> > > refactoring/testing/etc, if people are interested.
> >=20
> > v12 is not too late, and besides, v9..v12 has happened within 5 days
> > which is rather short time (hint to the submitter that there's no need
> > to burn patch series version numbers at that speed :-)).
> >=20
> > I'll give folks some time to sort this out if you need to add e.g., som=
e
> > driver_data instead.
> >=20
> > --
> >   i.
> >=20
> Hi Ilya, Ilpo,
>=20
> I agree with the suggestion, but how about taking-up the refactoring part=
 in a
> separate patch. Yes this patch focussed on supporting OV05C10 and even th=
e
> code review proceeded with this understanding. Refactoring now for generi=
c
> support would require changes that would undo some of the recent review
> feedback (especially related to global variables usage). Please let us kn=
ow
> what do you think.

Hi,

If you refer to comments given to v7 that resulted in removal of swnodes=20
field from struct amdisp_platform (and some other fields along with it), I=
=20
don't think the comment was given to mean that you could not have=20
platform info structure (const struct amdisp_platform_info that never was=
=20
been there) but that it should be separate struct from the runtime one=20
(struct amdisp_platform). The runtime struct can have a pointer to the=20
info struct if it's content is needed after probe.

When the platform info struct exists, pointer to it can be put into=20
driver_data in amdisp_sensor_ids. I don't expect you to necessarily add=20
the other sensor there but I'd like to see this adapted such that it can=20
be relatively easily added which likely requires having that separate=20
struct for platform info.

So in a sense, it undoes some of the changes done after v7 but looking
into history of this patch, it looks the post v7 patches went slightly
into wrong direction which makes adding next device harder than it needs=20
to be (I'm sorry I didn't realize this sooner). TBH, I don't think adding=
=20
the info struct is that much extra effort for you given what you had in=20
v7, the info just needs another struct separate from struct=20
amdisp_platform but the ingrediments kind of where there already.

--=20
 i.

--8323328-1072942574-1746694337=:922--
