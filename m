Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EA15674E;
	Fri, 30 May 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619985; cv=none; b=MWkFfqQoMNiet/CROryGyopBA/0I4xMiM52TH1O0KmbMtZ4KpGAY57NmJi/E5QLk+AG5LY21iTmMPBzIS33iFJmbN3ZapCo/3R4Eresq8/FeSjvy72m0vCn6onJYyH+BuYy1umWHF9aC1RdNvdn4XMEGPn9ucE1sC9KDvVTyiP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619985; c=relaxed/simple;
	bh=oiGf5ra11ANdgRt2VzQMjcJ3gpiMOjbFOKUWlbkAUS4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Vt13yCOVK24bFalrHwJCvXp++7nniCKy8PGg9K56YOmhjGJQ5+ExUllZJLLdUpJBHzTsaneQlfsFQUv5K1PMPCaWXMDDzULtdTDzYTO7NZIacbqSVeGseThJeVgpnKPOylofmuYfSqRbHtzXqbTzcljE5qe0gOvo8vGTJol/3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuOy3Uj7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuOy3Uj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748619984; x=1780155984;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oiGf5ra11ANdgRt2VzQMjcJ3gpiMOjbFOKUWlbkAUS4=;
  b=VuOy3Uj7V+2eqaIVOam/j8BdCYbRpZPTZdqJVaNbfe7SbC29elAbudun
   nc0SE8wPMg6p9kHMJtNV4D6Imw70SFeeu/DrGyUvR9frVXz7iERYl/S8r
   h0yH9/6AhMe/RL2J2YYOlWno6/s9zEO5aBCmHEBrBFxPOBVjCwJkJ9ToI
   M7/q4IVG3v6yOGNOz1hw5p9j/2xJNDS0dNiSpGqPwdu7OVoUv67QY6wM5
   kZzFGGj9+XRxN+4HmfW/dw/ZQWh/sMhxEzhUx5kO46S9hMEMN4GSPY0mL
   4idFAcfCBTJOUXUSHpc5zd6dHSB8kaB/URsQs4fWIx2DxConbs+7dSNxG
   g==;
X-CSE-ConnectionGUID: lmLXMQHFSPSFs2C1D8FUxg==
X-CSE-MsgGUID: g6aFZQ4KR/6GcFlJ299Uew==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="62060455"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="62060455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 08:46:22 -0700
X-CSE-ConnectionGUID: Dk6x6EEuTDiXDWr//ngQbg==
X-CSE-MsgGUID: x9J05hO3QjCYaQE/isYEOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144550664"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 08:46:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 May 2025 18:46:06 +0300 (EEST)
To: stuart hayes <stuart.w.hayes@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/4] platform/x86: dell_rbu: Stop overwriting data
 buffer
In-Reply-To: <8a8ff0b4-49a9-4b07-abbd-243b754bfc0e@gmail.com>
Message-ID: <054f2f19-cb2e-7633-8976-96c2fac7b746@linux.intel.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com> <20250529202758.8440-4-stuart.w.hayes@gmail.com> <ad0301a0-f45f-900a-028d-dff5e08b9525@linux.intel.com> <8a8ff0b4-49a9-4b07-abbd-243b754bfc0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-631951065-1748619966=:20209"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-631951065-1748619966=:20209
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 May 2025, stuart hayes wrote:

> On 5/30/2025 3:03 AM, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 29 May 2025, Stuart Hayes wrote:
> >=20
> > > The dell_rbu driver will use memset() to clear the data held by each
> > > packet when it is no longer needed (when the driver is unloaded, the
> > > packet size is changed, etc).
> > >=20
> > > The amount of memory that is cleared (before this patch) is the norma=
l
> > > packet size. However, the last packet in the list may be smaller.
> > >=20
> > > Fix this to only clear the memory actually used by each packet, to pr=
event
> > > it from writing past the end of data buffer.
> > >=20
> > > Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> >=20
> > This still doesn't have Fixes tag? If it writes part the buffer, there
> > certainly should be one in this one. Did you perhaps add it to a wrong
> > patch?
> >=20
>=20
> This fixes a bug that's existed for the life of the driver. Should I use =
the
> patch that introduced the driver for "Fixes:"?

Yes. They're normal commits just like every other commit. And since first=
=20
commits are quite complicated, it's nothing unusual to find problems that=
=20
have been there right from the beginning.

> I don't think this has ever caused a problem, because, as far as I know, =
the
> Dell BIOS update program is the only user of this module, and it uses 409=
6 as
> the packet size. Because the packet data buffers are allocated with...
>=20
> =09ordernum =3D get_order(size);
> =09image_update_buffer =3D
> =09=09(unsigned char *)__get_free_pages(GRP_DMA32, ordernum);
>=20
> ...this will always allocate one full page for every packet data buffer.
>=20
> I just happened to notice that the driver could overwrite the end of the
> buffer for the last packet if a packet size of more than 4096 was used, s=
o I
> thought I'd fix that.

It would be worth to mention enough these details then in the changelog so=
=20
that other people such as stable maintainers can understand it so they can=
=20
base their reasoning on facts provided rather than guesswork.

--=20
 i.


> > > ---
> > >   drivers/platform/x86/dell/dell_rbu.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/dell/dell_rbu.c
> > > b/drivers/platform/x86/dell/dell_rbu.c
> > > index c03d4d55fcc1..7d5b26735a20 100644
> > > --- a/drivers/platform/x86/dell/dell_rbu.c
> > > +++ b/drivers/platform/x86/dell/dell_rbu.c
> > > @@ -322,7 +322,7 @@ static void packet_empty_list(void)
> > >   =09=09 * zero out the RBU packet memory before freeing
> > >   =09=09 * to make sure there are no stale RBU packets left in memory
> > >   =09=09 */
> > > -=09=09memset(newpacket->data, 0, rbu_data.packetsize);
> > > +=09=09memset(newpacket->data, 0, newpacket->length);
> > >   =09=09set_memory_wb((unsigned long)newpacket->data,
> > >   =09=09=091 << newpacket->ordernum);
> > >   =09=09free_pages((unsigned long) newpacket->data,
> > >=20
> >=20
>=20
--8323328-631951065-1748619966=:20209--
