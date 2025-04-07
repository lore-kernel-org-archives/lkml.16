Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9524E22A7E8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032461; cv=none; b=AeLTaPEW/SClXo5wkqiwyiNBoty+sHwfsc6nNyv95YDtv5bdfKzPqxYPD16aoSJYk27aFlPEqdzirkboV2xXd6oGYAAnt5CT9c0ib6sTT4YBmLeoufyhsfNSyp+bthXCXdRRuKGDCoQXINeGvk+ROcagBzp6+F4M93zoJUHUyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032461; c=relaxed/simple;
	bh=HCsXn91wSxtJmwJS7kx+ePBW9Yt9vtglMV0WAxHHo20=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:Cc:To; b=u3/6qGLiF91RojHdbx6FsW3d7tgx2MUUTOcGcBALdy2n+Cxr7Ez/58e+TigleotOZ1hCaWmc8KDZLhBWAhteeUl7Je8VdX4VxO2TdKMDzsJsLxIsuR8i9H77M7i50EOESnSIGivJ5HEx/K1e8cx+Ha1/VeuD4IVZJkEKdklz0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=lNtNSDMe; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="lNtNSDMe"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1744032455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=j/Kd4gmTIBsFbGqlUqqNMDa2TriLSz39d1NLHeVDZhk=;
	b=lNtNSDMelpXj5j7iXy9yuM+SO9iNIgdwvYoy1EUevFrw4oFHfLs9Yv97Gl1ilwj5O+KkBv
	0UBm7enjX/2p3fK4jSnAXwmxXbb4bjnyroWOkSjiqJ24mr0Zz6+9pNSS4c4nlCRtymslmI
	oAFWHrFK49NIznzOU3x1qE9uBzMHaMgv3luI5TDssIoBAcAK4hYugP9H73FiZjzb2Jh51B
	i2d+DNKEmVpMy7CcQWiLj5PS2062+2SwF+1VmrKFjlHFPPNYfUezKunTHgwYK/9eIrinO7
	chO42nA4gxMd8ItCe72BMcG5fRnSW2YnXophtWzmQB3fjYmim5OxoKQIBYTZAg==
Content-Type: multipart/signed;
 boundary=bb50bd7793a9c5dec92a4e569833fe2102942b111b5b1897cd30a926116a;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 07 Apr 2025 15:27:21 +0200
Message-Id: <D90FWJ3O72ML.2DA83AXPJCR3Q@cknow.org>
Subject: Is kernel/Kconfig.hz still up-to-date?
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
Cc: <linux-kernel@vger.kernel.org>, "Bagas Sanjaya" <bagasdotme@gmail.com>,
 "Dang Huynh" <danct12@riseup.net>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Christoph Lameter"
 <cl@linux.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Thomas
 Gleixner" <tglx@linutronix.de>
X-Migadu-Flow: FLOW_OUT

--bb50bd7793a9c5dec92a4e569833fe2102942b111b5b1897cd30a926116a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

I recently had a discussion about the use of HZ_1000 in the kernel
configuration and the impact on performance.
My reading of the HZ_1000 help text tells me that HZ_1000 is primarily
useful for DAW and other systems where RT capabilities are (most)
important. This is due to "systems requiring fast interactive responses
to events", whereby I put the emphasis on *requiring*.

As *I* understand the rest of the help texts, a higher Hz value can/will
have a negative effect on f.e. IO performance. And I'm not entirely
sure, but it seems each CPU (core?) multiplies the nr of interrupts?

But, doing a ``git blame`` on the choices shows that apart from a
spelling fix in 2025, all the text hasn't changed since 2005/2006.
But a LOT has changed since then. There are more architectures and the
hardware and the kernel itself have changed quite a bit since then.

While the Kconfig.hz default is still HZ_250, the x86 defconfig changed
to HZ_1000 in 5cb04df8d3f0 ("x86: defconfig updates") (in 2008) and
there are various distros which have switched to HZ_1000.

So my questions are: are the Kconfig help text still accurate for
current (hardware) systems and kernels? Is HZ_250 still the most
sensible default? Or is the 'newer' HZ_300 better? Or even HZ_1000?
And does that apply only for x86 or for all architectures?
(distros seem to vary between architectures f.e.)

Cheers,
  Diederik

--bb50bd7793a9c5dec92a4e569833fe2102942b111b5b1897cd30a926116a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ/PSwAAKCRDXblvOeH7b
brCXAQCjkQNOEDFeRZ7o+GMldSO4I5E7sDhni1jp4aP7+H+xrwEAiIBbyJRqmnsd
TC0DnBSS5fnOfyVwXl7f7OQR08U32Aw=
=9VNX
-----END PGP SIGNATURE-----

--bb50bd7793a9c5dec92a4e569833fe2102942b111b5b1897cd30a926116a--
