Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29023DEAD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336740; cv=none; b=auOtyzeo1JRkQs8mo32cyWX5ovVLbyANivbDnphQJTTZzgTcL4X4/kSxN2W+zgpyvBbuDdMclie8aQHSKyUK9sK9ZODbml5H3Uu8QGI3gDXdnKCxhOrLQKCqzqEdLsdrzIqN5UtViOuT7p70HKAlGA5OQFmDYtMh6SYVGsAfgig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336740; c=relaxed/simple;
	bh=p61Y1aPHGtDaXB5Oc6uLAlyBZTf58hYj6UieJYQTPeQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uIWKk8E8TEWThgSWp7ktpdlkuObdldwUtqfVLE9BSuPtHNIuav1Dlv6mbcuLa29RubLcKy3z9xsHbHaMsF8hTsP17pbIitPVU13GiMgFhjvBZUGLAMcW/h+zqIJeyCx8D6y/nsbw1KsOA4dC3gB87DBOaZ0bIomTzD67fSZNrHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=NgAMT/PC; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="NgAMT/PC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=3RjQ8vjMHty4FIlfcvQC7sTXic9WNUusceBrZsCmd2A=;
	t=1750336738; x=1751546338; b=NgAMT/PCq6BJikVl9jTDHPbtBHBNN5bO/FSl1BwqHcS5Yby
	u6MvcFUyKpxxy8WlbiNX8bY7LdfqIKxxfQdXR2EsdbPWMRxa6SbHpDEI/EFx2BxmXjL6uV/PlZvmE
	sE9/1NeIDl3WlBptseaQ+FBp4faYivLGX/aLo122M+Hkh7YUGStu1f5eKRFEDNndbMg9F2K56U4kr
	VUnRlOYbC3llTWdltyn5YfA2mhhcp1SruXXnVTfjKBuX32mm5q6xY31UADRFVr0eG4bg/nJRIAXWi
	RXCKtJ6ke8wpDt3ef+dc3qEcganYJKd7EbxbB4hqSpTW8fdxVJDVsZqoBj72jQjA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1uSEXY-000000014Eu-2Jtm;
	Thu, 19 Jun 2025 14:38:48 +0200
Message-ID: <2231a777eef3cdb339fe98af4618f958ed658df6.camel@sipsolutions.net>
Subject: Re: [PATCH v9 07/13] um: nommu: configure fs register on host
 syscall invocation
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-um@lists.infradead.org, ricarkol@google.com,
 Liam.Howlett@oracle.com, 	linux-kernel@vger.kernel.org
Date: Thu, 19 Jun 2025 14:38:47 +0200
In-Reply-To: <m28qln6huv.wl-thehajime@gmail.com> (sfid-20250619_142254_743735_97A005BF)
References: <cover.1750294482.git.thehajime@gmail.com>
		<2863dab9b3f9d6536b73623398a3f39e4ae70957.1750294482.git.thehajime@gmail.com>
		<412c514334ac14a992cab3e7b86170b96d60be1c.camel@sipsolutions.net>
	 <m28qln6huv.wl-thehajime@gmail.com> (sfid-20250619_142254_743735_97A005BF)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2025-06-19 at 21:22 +0900, Hajime Tazaki wrote:
>=20
> On Thu, 19 Jun 2025 19:40:49 +0900,
> Benjamin Berg wrote:
> >=20
> > On Thu, 2025-06-19 at 10:04 +0900, Hajime Tazaki wrote:
> > > As userspace on UML/!MMU also need to configure %fs register when
> > > it is
> > > running to correctly access thread structure, host syscalls
> > > implemented
> > > in os-Linux drivers may be puzzled when they are called.=C2=A0 Thus i=
t
> > > has to
> > > configure %fs register via arch_prctl(SET_FS) on every host
> > > syscalls.
> >=20
> > Really, I still think that we should "just" get rid of libc
> > entirely
> > inside UML. That would avoid so many weird/potential issues =E2=80=A6
>=20
> I'm not sure if I understand your point.
>=20
> Q1) what do you mean by 'get rid of libc entirely' here ?
> =C2=A0=C2=A0=C2=A0 do you mean the following code block adds the dependen=
cy ?
> + int os_arch_prctl(int pid, int option, unsigned long *arg2)
> + {
> +=C2=A0	return syscall(SYS_arch_prctl, option, arg2);
> + }
>=20
> I guess this can be replaced with inline assembly instead of using
> libc's one.=C2=A0 but this is the code under os-Linux, which I thought
> we're
> allowed to use the host code ?
>=20
> Q2) "That would avoid so many weird/potential issues =E2=80=A6"
> I'm new to this;=C2=A0 I'm wondering what kind of issues did you see ?

Oh, I am just being annoyed by libc in general in UM. It isn't specific
to this patchset.

An example is that we need to keep malloc() working for libc. Which I
would think is kind of weird. Or we had issues because libc turned on
rseq and that was inherited into userspace, causing random crashes and
such.

> > Doesn't change the fact that FS/GS needs to be restored when doing
> > thread switches and such. Though one might be able to do it
> > entirely
> > within arch_switch_to then.
>=20
> I believe this is already done in arch_switch_to.=C2=A0 This particular
> patch does the control to the host context.

OK, need to look at that again a bit. I haven't really wrapped my mind
around how everything fits together, so I probably got some stuff
wrong.

Benjamin
