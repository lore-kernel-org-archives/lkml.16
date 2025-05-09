Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89924223DD8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782608; cv=none; b=VNOzlPSgFG4vR3LCUjYnJZMODFV/jL+fbet/5QVe0NZecv1RgdaRpCm2m9/WSJNUwDtP5C+HEJ5JOCYVLRKjTLMZ2EstyFy2AYuQrEuzaYheLuaC+/HN+Jn8IjsdBShKri/ORwSZt+rPq4KtJEdGQB5Af6tcxgjKWn6aGVj3yaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782608; c=relaxed/simple;
	bh=ZLAlQn4Xz6Btlkr11HLNYm9CzqjdBymyvczaf64NZg8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JFpGOwNzDI3PAWHaG6a/JNv0gslw6NtlHlGl7Cik3KcGuUCtN415Pz4ibHXyxQuIvOzuRwNQUEfktU1jLIWKQgDge8V349ZmSfFw4JHhTVQGw5/16SaNRz6CA+k4XOos7a3osO5TSE938NLlNGf7DZEdCkn65o1GcL480ZKQFAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lGv0sx9R; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lGv0sx9R"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Zv3T62yvvz9sPv;
	Fri,  9 May 2025 11:23:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1746782602; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ag5tG00Nd+jJRRq7/gzvtwWW+WAHRV2sFjjJsI/AF94=;
	b=lGv0sx9RQkNMYsHJWgut0rOhogf1/lLNGxETgmHZv0ux9zR4PPEHwlPPltEGyn99R1KSoM
	ViFlDC7tFmkjZd8eBAf87v5UW2COzxoF9wmNN2hA4O1m4NZFi1RD74ON5wfOisNn1woeqt
	Z9zK8H41cGX9jT4+ofQP7d/sfmlXVX+fbWgvTmLCfRssXA8dZObP0fn6ptHT077LAPM/MM
	UWdHbgKipN760+qPs8zMBeHDZRZrNS1izvcOA1l2aelu3TlfOP7YpfhUv6QuU1UhUyKkpr
	Oln+1U/pwRp2hr4ClM6RRb7n39XSNGlJ452640m8PAIowt+OozkpIW/Z9v6NQw==
Message-ID: <a696aeba34894aaca4893f9adc6fa137d04b6c9e.camel@mailbox.org>
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
Date: Fri, 09 May 2025 11:23:18 +0200
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
X-MBO-RS-META: di6kykp7zde413b4e3sounqozm3sm5ro
X-MBO-RS-ID: 76bcd7afd41cbb0191a

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
> drm-misc-fixes,

But, I don't think that this is a bug. It's just a bit ugly and this
patch performs cleanup work, but all the code behaves as intended,
without leaks or stuff like that.

Thus, I think it should go to drm-misc-next instead of drm-misc-fixes.

Regards

>  if you're ok with it of course. Otherwise:
> Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>
>=20
> z

