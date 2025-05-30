Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF74148850;
	Fri, 30 May 2025 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748620150; cv=none; b=kvk9A1Lr+ZTTc5xtmXLbB8RbpK1u0DP8FedJTY8xi9RPuQsynngQyICwscRFAttea4NT7yvV/COlECIEYIOx16v1dMYCXAvtkTPky3GXOnbdXlzUqWX0Vd0nMPSLExldrSybfQbM7sficRh5yDOI5lSh4iMNlHFcbjyzXuPlNB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748620150; c=relaxed/simple;
	bh=+Bu7NzhJ/v0zklvwxEVmvw9uY9L+IuyTRDbBPHukWOc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lNS/Ifmw4Bko/17Isju16NiXdegoaApMLnM5IjzMofjMuD65yArJW9oNeIUQCkHVNsf7WApbdZ/9uQxKYyqd5WAhZJW0sqJpQzy9GA+IUEo0HKzCgwXee8NosGMjrYOC4QwSobOoF1dsN37u5rb8r/KA5MqYM3A6B5iCKFgAW1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMPfArZg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMPfArZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748620149; x=1780156149;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+Bu7NzhJ/v0zklvwxEVmvw9uY9L+IuyTRDbBPHukWOc=;
  b=VMPfArZgZ7EkqT+PREAVvuF2fDf2CRMi9tvvORaK/dH/JzDDU5K51tLJ
   13cyEGULB2iypybohCEXtt3zfh4nbPwb9beKq/1OuaqM43cJ/ve0asiFK
   rnQzs2TkgWK9d8bCwViO7VebdiP2mUQSyOfaRCclSMPfGF/AoWXIwnJOG
   DPd87N9BEY7o5Or09BMDMkoUP/5y6MEg2oRSf5W3uCWvDU+T4Tm235/pu
   lIcKwyxyceHFosExVRRPHX58KakRXzUgos95IBuleLe+UUX1MiimMjuYt
   DJ6J5tVfs6vKi9CMNRMhJ4mKHtBkcZ5tVAMM2Gh/E6Mi8uNEgfqdRLgNj
   Q==;
X-CSE-ConnectionGUID: o0kRbRJ1SbieULmwYA5NOg==
X-CSE-MsgGUID: QsoEZxTiSme/o+qVKk3Niw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50867396"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50867396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 08:49:08 -0700
X-CSE-ConnectionGUID: zYwEjvuKTmaP8/j7zNNC0g==
X-CSE-MsgGUID: cesVpli4SemjKu/FLzGMAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174910425"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 08:49:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 May 2025 18:48:55 +0300 (EEST)
To: stuart hayes <stuart.w.hayes@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/4] platform/x86: dell_rbu: Fix list usage
In-Reply-To: <04ba20e6-ce2c-4e47-8884-c563b931cd66@gmail.com>
Message-ID: <749f1036-9ad7-ede0-5412-b9449d9e2cde@linux.intel.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com> <20250529202758.8440-3-stuart.w.hayes@gmail.com> <d7adf2ca-0cd7-99eb-9be1-a2b37fa8445e@linux.intel.com> <c213733e-e907-40cd-ab60-ec8fa0b15e4d@gmail.com> <54523dfb-e1ff-fa55-0628-0a8377457f0d@linux.intel.com>
 <04ba20e6-ce2c-4e47-8884-c563b931cd66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-550902521-1748620135=:20209"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-550902521-1748620135=:20209
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 May 2025, stuart hayes wrote:

> On 5/30/2025 10:25 AM, Ilpo J=C3=A4rvinen wrote:
> > On Fri, 30 May 2025, stuart hayes wrote:
> >=20
> > > On 5/30/2025 2:54 AM, Ilpo J=C3=A4rvinen wrote:
> > > > On Thu, 29 May 2025, Stuart Hayes wrote:
> > > >=20
> > > > > Stop using an entire struct packet_data just for the embedded
> > > > > list_head,
> > > > > and fix usage of that list_head.
> > > > >=20
> > > > > Fixes: d19f359fbdc6 ("platform/x86: dell_rbu: don't open code
> > > > > list_for_each_entry*()")
> > > > > Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> > > >=20
> > > > Isn't this just refactor so Fixes tag for this commit is not warran=
ted?
> > > >=20
> > >=20
> > > No. The patch that this fixes had converted the driver to use
> > > list_for_each_entry*() to loop through the packet list instead of a w=
hile
> > > loop. But it passed (&packet_data_head.list)->next to
> > > list_for_each_entry*()
> > > instead of the list head itself.
> > >=20
> > > That resulted in to issues. In the function that prints the packets, =
it
> > > would
> > > start with the wrong packet, and in the function that deletes the pac=
kets,
> > > it
> > > would get a null pointer dereference when it tried to zero out the da=
ta
> > > associated with the packet that held the actual list head.
> >=20
> > Oh, I see that difference now. Good catch.
> >=20
> > However, that also means the ->next part is wrong and there are two
> > independent changes here, one that fixes this ->next problem and then t=
he
> > refactoring of packet_data_head to packet_data_list?
> >=20
>=20
> Correct. Do you want those as two separate patches?

Yes please, and please order the fix patch before the refactor patch as=20
stable people will be interested in taking the fix into stable releases.

--=20
 i.

> > > > > ---
> > > > >    drivers/platform/x86/dell/dell_rbu.c | 10 +++++-----
> > > > >    1 file changed, 5 insertions(+), 5 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/platform/x86/dell/dell_rbu.c
> > > > > b/drivers/platform/x86/dell/dell_rbu.c
> > > > > index 7b019fb72e86..c03d4d55fcc1 100644
> > > > > --- a/drivers/platform/x86/dell/dell_rbu.c
> > > > > +++ b/drivers/platform/x86/dell/dell_rbu.c
> > > > > @@ -77,14 +77,14 @@ struct packet_data {
> > > > >    =09int ordernum;
> > > > >    };
> > > > >    -static struct packet_data packet_data_head;
> > > > > +static struct list_head packet_data_list;
> > > > >      static struct platform_device *rbu_device;
> > > > >    static int context;
> > > > >      static void init_packet_head(void)
> > > > >    {
> > > > > -=09INIT_LIST_HEAD(&packet_data_head.list);
> > > > > +=09INIT_LIST_HEAD(&packet_data_list);
> > > > >    =09rbu_data.packet_read_count =3D 0;
> > > > >    =09rbu_data.num_packets =3D 0;
> > > > >    =09rbu_data.packetsize =3D 0;
> > > > > @@ -183,7 +183,7 @@ static int create_packet(void *data, size_t
> > > > > length)
> > > > > __must_hold(&rbu_data.lock)
> > > > >      =09/* initialize the newly created packet headers */
> > > > >    =09INIT_LIST_HEAD(&newpacket->list);
> > > > > -=09list_add_tail(&newpacket->list, &packet_data_head.list);
> > > > > +=09list_add_tail(&newpacket->list, &packet_data_list);
> > > > >      =09memcpy(newpacket->data, data, length);
> > > > >    @@ -292,7 +292,7 @@ static int packet_read_list(char *data, si=
ze_t
> > > > > *
> > > > > pread_length)
> > > > >    =09remaining_bytes =3D *pread_length;
> > > > >    =09bytes_read =3D rbu_data.packet_read_count;
> > > > >    -=09list_for_each_entry(newpacket, (&packet_data_head.list)->n=
ext,
> > > > > list) {
> > > > > +=09list_for_each_entry(newpacket, &packet_data_list, list) {
> > > > >    =09=09bytes_copied =3D do_packet_read(pdest, newpacket,
> > > > >    =09=09=09remaining_bytes, bytes_read, &temp_count);
> > > > >    =09=09remaining_bytes -=3D bytes_copied;
> > > > > @@ -315,7 +315,7 @@ static void packet_empty_list(void)
> > > > >    {
> > > > >    =09struct packet_data *newpacket, *tmp;
> > > > >    -=09list_for_each_entry_safe(newpacket, tmp,
> > > > > (&packet_data_head.list)->next, list) {
> > > > > +=09list_for_each_entry_safe(newpacket, tmp, &packet_data_list,
> > > > > list) {
> > > > >    =09=09list_del(&newpacket->list);
> > > > >      =09=09/*
> > > > >=20
> > > >=20
> > >=20
> >=20
>=20
--8323328-550902521-1748620135=:20209--
