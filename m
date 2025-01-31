Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057E161302
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738312612; cv=none; b=AGXmqER41EekgIa+e974jOC5fglG6mvrxdnBm5BAp5kpw5jl/twc161/Wb1cAIyKWQtDdZQPJ+SfXiwAljWFReUL64e/CAe2nnClSMPLsAO+FjnIRMQxi1GLDTXYluSB7PvShoSgYfb8zZUoQHfRP9KQvjNrwnhswMWJg28adWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738312612; c=relaxed/simple;
	bh=tfGmgXapnW7lifYUtb4+pLdX4H+1cAXoAt8RcJ5ZkH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puK28M/o+HJeqMbKnkXBDE4NYL+Dk/7lvs9MjMX5MCD5eMhxzUos4D+qC3Gd07bxJIN3hTlvvsSZ1fMMA+GvyVDkRy8va1zFp5CR+TZ+6t/klXfqFo6t3GmMlyKOXpxSnWIjer7l+MxszcBnityZmVGEPtdCCWRxWh3Yddbr9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=jPSjDeXM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m1LMjXWY; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="jPSjDeXM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m1LMjXWY"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 148251140138;
	Fri, 31 Jan 2025 03:36:49 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 31 Jan 2025 03:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738312609;
	 x=1738399009; bh=IXMGftBReYlennIOdFwHheoasdqI9W1hfK9JoMJAxBc=; b=
	jPSjDeXMdjddM8jyfVc/mz628wN/KYTraQZBncPWHBNqHtjRXbl/d9jdJKomV/sf
	W7DNZ8iCGkMEs9NXOLXRd/ITfVywB+wlqbr1VgwysQM/CWI6ui4VRz0aFUzoZAwU
	mXbsGJzdgIjM2f2CBih+z3fUBv2WKLmQ3gV8T3B/nJc4L2zuQP6c2tnZ7vU9fNLn
	hFoiyy7xbGXqCj3gG95e1nZDtOf0xM3Oo2/4UrqKWm/E0X564kaSPX4pwWuEkmrw
	mFGc682s4MSgqyjPawtUCSzMrHwAXcLDNIzoX6hR2Nac/C2bZkOOTKlFZ+TG9KD/
	ofTo/b0IulLDApYaWyEabA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738312609; x=1738399009; bh=IXMGftBReYlennIOdFwHheoasdqI9W1hfK9
	JoMJAxBc=; b=m1LMjXWYBb2qKKU6o6OqPUApcZdXdSUzwF7Zn71rs+CXCwPi746
	O9tkkJUPxMXbFP5YUejQr3a4g4mqYpqqQS1U0Rwqc0Ko4guxBrp+/j0+TSHCJhMs
	OltQrloe4rsuPOCTSCleVa5QzZ1WciDvF0QyWSruxnmKZsZ7mCpoDtEJvSdj3AQQ
	pUcfKwqywwRKf7BpD9s1KnqBC0qzQaFcItRYCLdsu1GK0LXrZnjTkszT/YAASMYL
	bsW5eR3OXdRy5866Si+rkUZXHjGiLiqzh/cEhWLgcE3xTc8vX9PDRCuEzNxhlSWi
	HWyaegnJ3r0JI8G9OBiwp5Dv0WsX62TIc1A==
X-ME-Sender: <xms:n4ucZ4dWMO5ArQ3TFhlTeEkKvkyOKtbCRcvweMJVkL-spsdMAT_7uQ>
    <xme:n4ucZ6M9vPZcGeU2xrKH7-cqL7Shx_045ATYVCPjW1cLKoJgWfxMz0avs-qHwgdqq
    SyBmt-0M0xn_A>
X-ME-Received: <xmr:n4ucZ5gIK1Et3EV5sOikibyBGqii6LcgGJAWw_re2n8WepCTLgP4HyvB8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsggv
    uhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohephhgvlhhgrggrsheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgt
    phhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdrph
    gruhestghithhrihigrdgtohhmpdhrtghpthhtohepsghorhhishdrohhsthhrohhvshhk
    hiesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtsh
    drgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsh
    eslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:n4ucZ9-kDjrvLy4XSWC6YxNHOnJeTQusj9aUPiRq4UHiL6FpqdQnWA>
    <xmx:n4ucZ0tRNHy61VTPvk15LC4dSblYDSVv9A-iXibWOzwo-wpZAHoJgw>
    <xmx:n4ucZ0GbWl_TAjbXQ5xJrk381pDv6IVw0ZIroS-OdNPvS7_p_QvBPw>
    <xmx:n4ucZzMSmvEEHujJsJHKaYPnQyOaU-RXPRDzYDVihnIlNdPJAjXWRQ>
    <xmx:oYucZ1EFC5Km1LRUmWVSp2Pqb4FKH5Fq0sQS_qSR1tXuhYhxgc0QNqYJ>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jan 2025 03:36:45 -0500 (EST)
Date: Fri, 31 Jan 2025 09:36:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <Z5yLnDGeu7SVSLUU@mail-itl>
References: <20250130213123.GA633869@bhelgaas>
 <2d5b51e9-db32-4e46-97c8-2644081b7e33@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CZ5ZWPgOMlBg8Z2R"
Content-Disposition: inline
In-Reply-To: <2d5b51e9-db32-4e46-97c8-2644081b7e33@suse.com>


--CZ5ZWPgOMlBg8Z2R
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jan 2025 09:36:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)

On Fri, Jan 31, 2025 at 08:13:37AM +0100, Jan Beulich wrote:
> On 30.01.2025 22:31, Bjorn Helgaas wrote:
> > On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
> >> On 30.01.2025 05:55, Marek Marczykowski-G=C3=B3recki wrote:
> >>> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 2 data 0x9
> >=20
> > PCIe Cap at 0x80, PCI_EXP_DEVCTL is 0x08, PCI_EXP_DEVSTA is 0x0a.
> >=20
> > 0x80010088 would be PCI_EXP_DEVCTL (a 2-byte register), maybe offset 2
> > gets us to PCI_EXP_DEVSTA?  Not sure.
> >=20
> >   0x0001 PCI_EXP_DEVSTA_CED /* Correctable Error Detected */
> >   0x0008 PCI_EXP_DEVSTA_URD /* Unsupported Request Detected */
> >=20
> > Not impossible that these would be set.  Lots of URs happen during
> > enumeration and we're not very good about cleaning these up.
> > Correctable errors are common for some devices.  lspci -vv would
> > decode the PCIe cap registers, including this.
> >=20
> >>> (XEN) d0v1 conf read cf8 0x80010088 bytes 2 offset 0 data 0x2910
> >=20
> > PCI_EXP_DEVCTL:
> >   0x2000 PCI_EXP_DEVCTL_READRQ_512B
> >   0x0800 PCI_EXP_DEVCTL_NOSNOOP_EN
> >   0x0100 PCI_EXP_DEVCTL_EXT_TAG
> >   0x0010 PCI_EXP_DEVCTL_RELAX_EN
> >=20
> >>> (XEN) d0v1 conf write cf8 0x80010088 bytes 2 offset 0 data 0xa910
> >=20
> > PCI_EXP_DEVCTL:
> >   set 0x8000 PCI_EXP_DEVCTL_BCR_FLR
> >=20
> > This looks like the actual FLR being initiated.
> >=20
> >> This is the express capability's Link Control 2 Register afaict.
> >=20
> > Unless I'm missing something this is actually Device Control.  So far
> > I think this all looks OK.  The next part:
>=20
> What you say is very plausible as far as the observed behavior goes,
> but: According to the lspci output provided earlier the express
> capability is at 58 (hex).=20

lspci in the log says:

	Capabilities: [80] Express Endpoint, IntMsgNum 0

I think you confused device config space with bridge config space.

> Hence here we're 30 (hex) into the
> capability, which according to the spec I'm looking at is Link
> Control 2. Yet as said - with what you say being plausible, likely
> I'm simply getting something very wrong.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CZ5ZWPgOMlBg8Z2R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeci5wACgkQ24/THMrX
1ywToQgAjl2ykesXsSyhdpCEZErEHrUfXs09F4dPnDURMtJ3dYVmesYZLAznN/9q
ZhfyCkcWSAzXpxmoMcpxWkmqR5Szm6Ez2tiP2Z/vh1+/AYx4PhHhrK90Taio7SHU
hmn7nyQWi1lkNk9VtKTx7HdST7YZwZRBphuVF42W/4o7XRE9tGImB93JmfVe7TY4
rtT5dAOlCXNg4zRkH/M3XeHpwvCmX8WkYM8gWQqJXfMnXMxXoG3DujG0OBXHh968
WqvL860okPTnNR35c2TqBpdki1y4wqJnyT0oEZB7LIaARqXv2+6AcjGT82rQ5wCr
wuF0A+gT7Geq0b/tNzrgz4IH824HgA==
=+Iav
-----END PGP SIGNATURE-----

--CZ5ZWPgOMlBg8Z2R--
