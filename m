Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F3DFBF0;
	Fri, 30 May 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748618745; cv=none; b=PfF8Fkwgc6kjxNGzBRbHXZEQucac/Txk9bp+WebOhQ+xuUHO0llOCuXtF/9p9aidnK/GSAa6HkldRQlLMAcbJjUAcpa+NbFzRslj8xSYxMhw0FeBnC4ODO3PtX7ik6MaQS8HD54KUMQooD8WB4JvyO94+P4OCCTOPI9z6xT+q/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748618745; c=relaxed/simple;
	bh=B6d2bVqDcpzIXpKKW3UkTMIoccx13r6cCnlI0AhcFCg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eFLNJ0oW9FosSW+5NCvR8Xd+qE7Wr9ib1ykLPB+JTHZ47GywXCSaofl3B5t+7eyWmGbApw6wVG5+43+Ix+r5SeMH81vcN8ic9CDWXa+ihJFYCz8uRtVX9nknAxQF4vA+YLByP6+rq8DFcwFLQfWcBEmxDRVBOUqPldCPSCTxjQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cy3lzAzg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cy3lzAzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748618744; x=1780154744;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=B6d2bVqDcpzIXpKKW3UkTMIoccx13r6cCnlI0AhcFCg=;
  b=Cy3lzAzgraWTvKS+5DtqXFdrTqRA23NXL9LR6ogUOAdiUiOnO6yXSemt
   0ADkh63yiWHkMyKxDsU5NiEXq3QsWAO1MHAcI+nftNtsKINUW7rVXUoGE
   9DloqP37NX1lvmGa7+hzqVRZQalAYrG4cJyLOXA+0CMyH+bxuBaZuSw9G
   zpPSwWnDoFG7BZkacwlvMhaaFHkTL1TeRTsyeWXUHOEMW+ue1Sg/L5v2p
   hp+AWNGTmZz7aRy11rqTgouRLv3rKQUMcgJXd+BSpFVGMl3fLJiN1Lequ
   i+ec9vdb8EdMk9MO8urJROnVc65yffFR2+GXhTDSAutxnVg1+3wpLJ+WY
   w==;
X-CSE-ConnectionGUID: Q1/BrTRcQ0uEx+guFkcRyQ==
X-CSE-MsgGUID: PwshDrnXR/6W2W57vwK9CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50585410"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="50585410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 08:25:41 -0700
X-CSE-ConnectionGUID: 2fk67xolS+i32YmdRnLrig==
X-CSE-MsgGUID: Y6PE+e6gTWSTBbDJsMSwaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174905813"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 08:25:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 May 2025 18:25:20 +0300 (EEST)
To: stuart hayes <stuart.w.hayes@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/4] platform/x86: dell_rbu: Fix list usage
In-Reply-To: <c213733e-e907-40cd-ab60-ec8fa0b15e4d@gmail.com>
Message-ID: <54523dfb-e1ff-fa55-0628-0a8377457f0d@linux.intel.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com> <20250529202758.8440-3-stuart.w.hayes@gmail.com> <d7adf2ca-0cd7-99eb-9be1-a2b37fa8445e@linux.intel.com> <c213733e-e907-40cd-ab60-ec8fa0b15e4d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-48537591-1748618720=:1000"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-48537591-1748618720=:1000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 30 May 2025, stuart hayes wrote:

> On 5/30/2025 2:54 AM, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 29 May 2025, Stuart Hayes wrote:
> >=20
> > > Stop using an entire struct packet_data just for the embedded list_he=
ad,
> > > and fix usage of that list_head.
> > >=20
> > > Fixes: d19f359fbdc6 ("platform/x86: dell_rbu: don't open code
> > > list_for_each_entry*()")
> > > Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> >=20
> > Isn't this just refactor so Fixes tag for this commit is not warranted?
> >=20
>=20
> No. The patch that this fixes had converted the driver to use
> list_for_each_entry*() to loop through the packet list instead of a while
> loop. But it passed (&packet_data_head.list)->next to list_for_each_entry=
*()
> instead of the list head itself.
>=20
> That resulted in to issues. In the function that prints the packets, it w=
ould
> start with the wrong packet, and in the function that deletes the packets=
, it
> would get a null pointer dereference when it tried to zero out the data
> associated with the packet that held the actual list head.

Oh, I see that difference now. Good catch.

However, that also means the ->next part is wrong and there are two=20
independent changes here, one that fixes this ->next problem and then the=
=20
refactoring of packet_data_head to packet_data_list?

> > > ---
> > >   drivers/platform/x86/dell/dell_rbu.c | 10 +++++-----
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/dell/dell_rbu.c
> > > b/drivers/platform/x86/dell/dell_rbu.c
> > > index 7b019fb72e86..c03d4d55fcc1 100644
> > > --- a/drivers/platform/x86/dell/dell_rbu.c
> > > +++ b/drivers/platform/x86/dell/dell_rbu.c
> > > @@ -77,14 +77,14 @@ struct packet_data {
> > >   =09int ordernum;
> > >   };
> > >   -static struct packet_data packet_data_head;
> > > +static struct list_head packet_data_list;
> > >     static struct platform_device *rbu_device;
> > >   static int context;
> > >     static void init_packet_head(void)
> > >   {
> > > -=09INIT_LIST_HEAD(&packet_data_head.list);
> > > +=09INIT_LIST_HEAD(&packet_data_list);
> > >   =09rbu_data.packet_read_count =3D 0;
> > >   =09rbu_data.num_packets =3D 0;
> > >   =09rbu_data.packetsize =3D 0;
> > > @@ -183,7 +183,7 @@ static int create_packet(void *data, size_t lengt=
h)
> > > __must_hold(&rbu_data.lock)
> > >     =09/* initialize the newly created packet headers */
> > >   =09INIT_LIST_HEAD(&newpacket->list);
> > > -=09list_add_tail(&newpacket->list, &packet_data_head.list);
> > > +=09list_add_tail(&newpacket->list, &packet_data_list);
> > >     =09memcpy(newpacket->data, data, length);
> > >   @@ -292,7 +292,7 @@ static int packet_read_list(char *data, size_t =
*
> > > pread_length)
> > >   =09remaining_bytes =3D *pread_length;
> > >   =09bytes_read =3D rbu_data.packet_read_count;
> > >   -=09list_for_each_entry(newpacket, (&packet_data_head.list)->next, =
list) {
> > > +=09list_for_each_entry(newpacket, &packet_data_list, list) {
> > >   =09=09bytes_copied =3D do_packet_read(pdest, newpacket,
> > >   =09=09=09remaining_bytes, bytes_read, &temp_count);
> > >   =09=09remaining_bytes -=3D bytes_copied;
> > > @@ -315,7 +315,7 @@ static void packet_empty_list(void)
> > >   {
> > >   =09struct packet_data *newpacket, *tmp;
> > >   -=09list_for_each_entry_safe(newpacket, tmp,
> > > (&packet_data_head.list)->next, list) {
> > > +=09list_for_each_entry_safe(newpacket, tmp, &packet_data_list, list)=
 {
> > >   =09=09list_del(&newpacket->list);
> > >     =09=09/*
> > >=20
> >=20
>=20

--=20
 i.

--8323328-48537591-1748618720=:1000--
