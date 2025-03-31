Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E5214204
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436602; cv=none; b=eEuRlZCbgdIL4MhTgmgO8YzNNVIGw6k1sHmE3XueATQHW9+oZqxjMHvQS7uVWh/s2Y4s2fCEp1snVczuBoMGerX0fMuHspw8ul9vStg6YDSj48eM2hs/LRdPyiyYZfhRLk3/0VWVf92ihcFE6OSWtILODnmLtlASv+g34ilN1t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436602; c=relaxed/simple;
	bh=2abXrR4+mWG+w1ZabCiucgs7zJIV275nfqlxRz+6dpk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHfXY++nVSVRBoUfghDOZuua0TAFlQTsNy3ee2iOVGqPI4NQq9Dp6wOODQcHyw4GnIzhpGBob5rEC13D77Qhue2+ELs8GdqEhaRHrLPq+qSM0WIQjIUU9FNs+jU3vq44IT16aC61JM4s2p84yO9vlawaT/+b2GZ8lLPr7HYYLio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ecnURH+E; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ecnURH+E"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D699742D46;
	Mon, 31 Mar 2025 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743436591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2abXrR4+mWG+w1ZabCiucgs7zJIV275nfqlxRz+6dpk=;
	b=ecnURH+EgrNOfJqAbCnbQ0EtR5oarltkIX5/pZWQ7qgT7Jw6L3V3y9/D7+hZEseUKp7vwK
	XIUQOTwmd8ow4qiwEh+MU41cxdl4pJTgUlV5TMoq2ELiMU2hEo2I4oU7s/hJOCJi6UsLpj
	kD3xKkaPDxgwvVmNZzuNR//+rWOVLDQDR43v4TEY5xhPAd1bld5/Qk+SsRLGQpjzJTcuOs
	USwgVecUeg/IfVzaCR/saQAejx08g2jWPMa3/6ThcZZovUFd9SWtzkTXcT73gROSqma5s9
	oAvj/kjEemN+yJdyi7wh1n3ioPOamBvl8A+/AHUdF4n9oY29DwGxOHv1z9GJqg==
Date: Mon, 31 Mar 2025 17:56:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/panel/panel-simple: Use the new allocation
 in place of devm_kzalloc()
Message-ID: <20250331175625.505d616e@booty>
In-Reply-To: <CAN9Xe3SzU0AohuBnyJtE0UWFkrW0iMGKH1F8cuUZYLZ-vbfkpw@mail.gmail.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
	<20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
	<20250328095351.7bac2d4d@booty>
	<CAN9Xe3SzU0AohuBnyJtE0UWFkrW0iMGKH1F8cuUZYLZ-vbfkpw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfekieegtefhgeelieehhefgtdekffevgfegvdeggeelkeehjeetteethfevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeekrddvtdelrdejfedrudelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejkedrvddtledrjeefrdduleeipdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehquhhitggpjhgvshhsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhin
 hhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghh
X-GND-Sasl: luca.ceresoli@bootlin.com

On Fri, 28 Mar 2025 12:09:08 -0400
Anusha Srivatsa <asrivats@redhat.com> wrote:

> On Fri, Mar 28, 2025 at 4:54=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com>
> wrote:
>=20
> > On Thu, 27 Mar 2025 10:55:42 -0400
> > Anusha Srivatsa <asrivats@redhat.com> wrote:
> > =20
> > > Start using the new helper that does the refcounted
> > > allocations.
> > >
> > > v2: check error condition (Luca) =20
> >
> > Here as well, when you resend, move the changelog after the '---' line.
> >
> > =20
> Hadn't noticed this. Saw some other series that do follow this method. I
> will make this change.

That's the general rule [0], even though not all maintainers are strict
about this, so they sometimes get through.

[0] https://docs.kernel.org/process/submitting-patches.html#commentary

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
