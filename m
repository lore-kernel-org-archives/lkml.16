Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AD51DE4C3
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747106052; cv=none; b=pvsXptiCAXcSU04dKD4iukfqEovrsDL31yyagZEfRvvQAHY700THvH7+aLUt7Qc2yS7l3iDSvbBT2SBQiwsyffGgfE/02zK92J66GwAro3PZmQQvoO8/QpiRqMvahcF/hz9gH+4z3pbSSg08YImCkJGD2stSKYapcCMXB+DGDaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747106052; c=relaxed/simple;
	bh=jeFqy7zKESSjHISNy8tS/rhzHwYLUa6cEV201i7Nzks=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p4xHRXPE3GqcS8zgrkWpZWPhsccKQ4JHziCDy+LzQ8CNDg17qmSUXbLPJWUQ61kc295i0ayUHmqNMfazCDIt6/Kn8Abok3T2VjVrPa8Kg7JDvehbAHwui+R+ryyrlGdy0vKzJbeSnRaycEjQHdT39sVgjYt0dpF8lP1P9JHC5L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MLSvsplG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MLSvsplG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3342BC4CEE7;
	Tue, 13 May 2025 03:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747106049;
	bh=jeFqy7zKESSjHISNy8tS/rhzHwYLUa6cEV201i7Nzks=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MLSvsplGVO8OHx8goaLdPzja4JBmyQk/Mq62gXJ+ixRyRJFDZ+XPANipvuuoULo5h
	 gN7v7dzD4DvcO5WrwxdFAU+T5NJI2bqfSGXD81I0ml294lc9HM570dpp1uW4VWEf/z
	 FePhgHLFdOHtgAudqq+5FWAtUhYXlTM12YMLgYbA=
Date: Mon, 12 May 2025 20:14:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Alexander Graf <graf@amazon.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, nh-open-source@amazon.com
Subject: Re: [PATCH] kexec: Enable CMA based contiguous allocation
Message-Id: <20250512201408.81acaf861581f6fb98e8a3b0@linux-foundation.org>
In-Reply-To: <35f818e2cf3f15b7dc7028f543e0eea94c799efd.camel@infradead.org>
References: <20250512225752.11687-1-graf@amazon.com>
	<20250512165933.ad1dc7ec5872284b4b59f544@linux-foundation.org>
	<35f818e2cf3f15b7dc7028f543e0eea94c799efd.camel@infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 12 May 2025 19:02:20 -0700 David Woodhouse <dwmw2@infradead.org> wr=
ote:

> > > =A0 2) More robust. Even if by accident some page is still in use for=
 DMA,
> > > =A0=A0=A0=A0 the new kernel image will be safe from that access becau=
se it resides
> > > =A0=A0=A0=A0 in a memory region that is considered allocated in the o=
ld kernel and
> > > =A0=A0=A0=A0 has a chance to reinitialize that component.
> >=20
> >=20
>  > https://lore.kernel.org/all/20250512140909.3464-1-dssauerw@amazon.de/>
>
> >Is this known to be a problem in current code?
>=20
> Oh $DEITY yes. The Arm Generic Interrupt Controller is, to quote a dear
> friend, "a cautionary tale of how not to approach a hardware design".
>=20
> It does a whole bunch of arbitrary DMA all over the place, and doesn't
> even live behind an IOMMU. And doesn't *stop* doing DMA unless you ask
> it *really* nicely; merely shutting down the offending high-level
> components isn't always enough, because they might still to write back
> some caches.
>=20
> Here's one of the latest examples (not actually the one which has been
> breaking kexec for us, as far as we know, but an example of the genre):
> https://lore.kernel.org/all/20250512140909.3464-1-dssauerw@amazon.de/
>=20
> So putting the new kernel into a physical memory region which was
> considered 'free' by the previous kernel, as Alex explains, is actually
> a very good defence-in-depth mechanism to protect against such issues.

Lol, it sounds like you're having fun over there.

Alexander, can you please repackage David's info to your taste and
include it in the changelog?  Escalating the value of the patch from
"might speed it up, don't know how much" to "addresses grievous
real-world issues" is helpful to the patch's case!

