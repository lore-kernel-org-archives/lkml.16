Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F219CD01
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865472; cv=none; b=WIBBUTx5/CUMW2d/MT9BhegGVaFhsLZPFVLlHSfS27IfSY0mfBw2+a5cfCblwrqPL5u4wyLg0GXS1ZA67GDh9yRT+fNgxCVx+BtICcYl09Q1lyvJLki/Rldpew5XaQOQ5FVT7f5gpPT1eGta1ZjpIOXiYIp2HJKFGlRUp87OWLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865472; c=relaxed/simple;
	bh=L1Ng9lldW/83WhLxtsVxj1Z34scX9+JOOnEphNXYxHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTH2iDfNmiW7eGr1cs+EHZVkcwnvcX2wcobRCvXv4fXcAM8PlTHQIcUENMAMFU/NUyTdnSzBU4XCy9nw7M94kE8cHmAADVeKOvj65SB0sMHRk0++5PdlTqDOMNIMkE3aIw54hV9xa8mTGqHCAgJ9fSdC8sh3n34RoW+Zg86balU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JfcbzD8w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JfcbzD8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738865470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L1Ng9lldW/83WhLxtsVxj1Z34scX9+JOOnEphNXYxHw=;
	b=JfcbzD8w2MH4vZawEMef8waf1OIJ3Rzy94FfCrAcCE0qpdwq1/pAbxGDnJIMr4BTRcQBph
	Ixl6rm8+ZFSYGcdGObKvRtSSciwo5c1OjtY2KFNoF1QR20DII/TvqN0MRhg0nYf89s6Gb6
	ZUS1SEKsZ3A7oo0buZ6IkapUWwCiLWY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-8E3rdXJoPkCOp7n7f2PNnw-1; Thu,
 06 Feb 2025 13:11:05 -0500
X-MC-Unique: 8E3rdXJoPkCOp7n7f2PNnw-1
X-Mimecast-MFC-AGG-ID: 8E3rdXJoPkCOp7n7f2PNnw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B6E61955BC0;
	Thu,  6 Feb 2025 18:10:26 +0000 (UTC)
Received: from localhost (unknown [10.2.16.145])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EA005180087A;
	Thu,  6 Feb 2025 18:10:21 +0000 (UTC)
Date: Thu, 6 Feb 2025 13:10:19 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
	German Maglione <gmaglione@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Message-ID: <20250206181019.GA413673@fedora>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z6S7A-51SdPco_3Z@redhat.com>
 <20250206143032.GA400591@fedora>
 <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9gaKO0MQEl4+jp8i"
Content-Disposition: inline
In-Reply-To: <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111


--9gaKO0MQEl4+jp8i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 03:59:03PM +0100, Albert Esteve wrote:
> Hi!
>=20
> On Thu, Feb 6, 2025 at 3:30=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.c=
om> wrote:
> >
> > On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
> > > And then there are challenges at QEMU level. virtiofsd needs addition=
al
> > > vhost-user commands to implement DAX and these never went upstream in
> > > QEMU. I hope these challenges are sorted at some point of time.
> >
> > Albert Esteve has been working on QEMU support:
> > https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@redh=
at.com/
> >
> > He has a viable solution. I think the remaining issue is how to best
> > structure the memory regions. The reason for slow progress is not
> > because it can't be done, it's probably just because this is a
> > background task.
>=20
> It is partially that, indeed. But what has me blocked for now on posting =
the
> next version is that I was reworking a bit the MMAP strategy.
> Following David comments, I am relying more on RAMBlocks and
> subregions for mmaps. But this turned out more difficult than anticipated.
>=20
> I hope I can make it work this month and then post the next version.
> If there are no major blockers/reworks, further iterations on the
> patch shall go smoother.
>=20
> I have a separate patch for the vhost-user spec which could
> iterate faster, if that'd help.

Let's see if anyone needs the vhost-user spec extension now. Otherwise
it seems fine to merge it together with the implementation of that spec.

Stefan

--9gaKO0MQEl4+jp8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmek+wsACgkQnKSrs4Gr
c8iv1AgAtw36d3ZukmPTk9VmX0NGRgWskCoroH9Kztfi3UeYUTi5bn/AL9yD+73x
aQ8w4QvmQQBq/U85J8DNgOJ6hXW4uE2XpHCEtdgVWRFatuEwWtlLNZ46gUMD+AJb
QtUvCLNwOtMYbADhEDUiIDIZS3DxHUvTI8JZWN6tNCFme7tuoUiJ4hWEhHhQ07yS
yebWMNRoW2UmDtVWBMsp/v7zhoroqrrIcRvAaLUBTIE/k2myl3zxEPRW7j69jl9S
7XwGGLC9Odz8ssha4UIg5fbwuUqpbJQA/PwPQVeJWR0a4OXhbFWebWEGdrXiTKP4
04dxu53buvDo8JePVLkCaQZfazl9Cg==
=cm2Y
-----END PGP SIGNATURE-----

--9gaKO0MQEl4+jp8i--

