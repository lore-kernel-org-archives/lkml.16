Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0395C26D4F9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773280; cv=none; b=iIUWg+WE+lNLCdFJBDTtHx7axLc9G7MfmPxQ7SLm20GUJa8A4f1PX7CC/90tAg1GRoK8RLdHOVmrSF+ZAj8V4z4xogwZouHJmoz1XUMnOWpEitSbev4EbJxnd0RG4QeKtygwJO58dCYAy4vakL8QbXLwDgmJLdSRT//nn+/RSNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773280; c=relaxed/simple;
	bh=KQWc4cZPYPr3NeXLxW1dr5shP9DHdWuUN65zzoGwNDg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pvaeKzdAcQ02m4A2cNDbXM2XiS6Zvmmxr/u3rxf///zzP3n73i7wg2OK5Rr8vW/VH3xufFsPKn52cWcK2Rn6eTJh38Ex9UNoU0xTuEBFBrmd0LIcGU5LSXlinPSliY/R8rs8uZBT4DsRmnNbdZMc7UQostbZBEIk/AMk6OPJWp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PvuCnE2q; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PvuCnE2q"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Zv01l089nz9t1F;
	Fri,  9 May 2025 08:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1746773275; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WIvFpCp4QcSyS2iaJzzX57KiIjnI391TO9lEft4na8M=;
	b=PvuCnE2qqgVr7DmVBzULyvfw8NuaUozWSecZ6nmt7VE7TFDe/6/KF+fKLLCRyKx4KINv7L
	1yNGtouTREO+zbnmdc/Zelq2Cj6ErCD0LjYSCUed+X2ap57C0na6+pdh9+EYZrmMpfu5Cm
	awStiC5U7rXznRkjUChh8d5t0E/HGPujfnHUSysLhnBHr2pQOPSX0wIhNwmhL5GtDFbwa6
	zNwYt/Rec/cjn5plaASkkmXy66v3SY6uGXQmhRQ0m3ZpLmTq9GphDS+pZjeraJhTKMPdtI
	0z+HOYfjtJ/V6EYSJf57ehF7Sy969oNZ08C7yGeLNdVDWJ4VtiXck5DaW67jjA==
Message-ID: <754c0bb2f74f94ef016dc835a66f38d95d9ebe6f.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/vmgfx: Use non-hybrid PCI devres API
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Zack Rusin <zack.rusin@broadcom.com>, phasta@kernel.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri, 09 May 2025 08:47:52 +0200
In-Reply-To: <CABQX2QP1U6nUc++5oZf0KVpfXCEMRwX9u0ykq2YNHuQSKx909Q@mail.gmail.com>
References: <20250423120643.66814-2-phasta@kernel.org>
	 <e40cf04283e281e2d4a912ff75bce3c6cb8bcf97.camel@mailbox.org>
	 <CABQX2QP1U6nUc++5oZf0KVpfXCEMRwX9u0ykq2YNHuQSKx909Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 7xzmgnt87pa1tb1qseeu6r7hwotp9hra
X-MBO-RS-ID: c2e5f7fc3819c6d36b8

On Thu, 2025-05-08 at 11:39 -0400, Zack Rusin wrote:
> On Thu, May 8, 2025 at 6:40=E2=80=AFAM Philipp Stanner <phasta@mailbox.or=
g>
> wrote:
> >=20
> > On Wed, 2025-04-23 at 14:06 +0200, Philipp Stanner wrote:
> > > vmgfx enables its PCI device with pcim_enable_device(). This,
> > > implicitly, switches the function pci_request_regions() into
> > > managed
> > > mode, where it becomes a devres function.
> > >=20
> > > The PCI subsystem wants to remove this hybrid nature from its
> > > interfaces. To do so, users of the aforementioned combination of
> > > functions must be ported to non-hybrid functions.
> > >=20
> > > Moreover, since both functions are already managed in this
> > > driver,
> > > the
> > > calls to pci_release_regions() are unnecessary.
> > >=20
> > > Remove the calls to pci_release_regions().
> > >=20
> > > Replace the call to sometimes-managed pci_request_regions() with
> > > one
> > > to
> > > the always-managed pcim_request_all_regions().
> > >=20
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> >=20
> > *PING*
>=20
> Thanks, that looks great. I missed it because the driver's name is
> vmwgfx. I'd be happy to fix the subject for you while pushing this to
> drm-misc-fixes, if you're ok with it of course.

Ah, my bad! (although having a driver called "Bob" would be handy at
times)

Sure thing, go ahead and rephrase it as you like.

P.

>  Otherwise:
> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
>=20
> z

