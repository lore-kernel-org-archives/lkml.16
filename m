Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AA627585E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539662; cv=none; b=SXAT3f12DAnrmthN/N69Bf30VL/WOaQfS7l/IbGmikUuqtDD9OgFyG6Ze4P5Qqtfnt6NZrVcWhko+F3NqWj3K50UnO2yFStXuRaPCIPUOwEUdWp+wrRF2vpdN+TbYYH9sSRLDVolZYMqyYAVMPbDDXp+W/0a8sUPVtUdMFIPH+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539662; c=relaxed/simple;
	bh=mPTJuH8OH+qWuViaeI2i9erQJt2KnUzxKgMnOJu66Jc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EDlgavSih8w7JvYDpbH6D2V4w7GbcF7q6T1chIuQ6gCyV9mAkKmxMxmTaOjl9oDy0X1x3rERMNj5hX7HXQlqoaOupScPU9WGbs2+vjTD5Ld/lGVUFML3wCwrwWdW0aGghl5YPHR66kkVqFfYBLNnDq4Mjq86xFs7L8VHo5jNqY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=MxuIyNco; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="MxuIyNco"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v7eLilbxoddVjU+mouoH5+R8H0VXayKL2GkC3dqrRIk=; t=1746539658; x=1747144458; 
	b=MxuIyNcorWwkefiaJkIhxgXu7tJCwBAqD3o335TGELyj/j9qnIEFEYn56E6lp4PXtbSwuqQkEe7
	Nm1Iqhm85LPuIZbS5Fnoi0sPbvyfFTpfdhQEbc3RkkBvi84loiQDYY90qpRUOPHQiTIDq1V2czNMI
	WhW3k0LGVvLTqxeO2mQTyWw0jk9FypMnPPEViiSE5pmluEwd/ZrTL0XFzltAT09MxVNM2zYeQiegZ
	77L4hkx8SAJCgYDgK1b7hpVlc+e4XlNeNWfn9KQFN4bU0LsWAte2rbRv85xEsMAX1KmsgCToIqCAB
	4TFYqTwRx0UgetwRd+wQWJsweIcsxdp1Pucw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uCIkJ-00000001Y4f-1yy6; Tue, 06 May 2025 15:54:07 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uCIkJ-00000003VWE-0zt4; Tue, 06 May 2025 15:54:07 +0200
Message-ID: <c329a9ed268eef90306be6529ac13d46322c6709.camel@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, "Ahmed S .
 Darwish" <darwi@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ard Biesheuvel	 <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Borislav Petkov <bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>,
 John Ogness <john.ogness@linutronix.de>, Linus Torvalds	
 <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 06 May 2025 15:54:06 +0200
In-Reply-To: <alpine.DEB.2.21.2505060106180.31828@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org>
	 <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
	 <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
	 <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
	 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
	 <alpine.DEB.2.21.2505060106180.31828@angie.orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Tue, 2025-05-06 at 14:48 +0100, Maciej W. Rozycki wrote:
>  In fact running old hardware is one aspect of portability verification,=
=20
> for example I run PCIe stuff off my Pentium MMX and Alpha hardware, and=
=20
> conversely I run conventional PCI stuff off my POWER9 (no port I/O!) and=
=20
> RISC-V hardware.  That has triggered numerous bugs, fixed over the years.

I agree with that stance. Building and running Debian on various architectu=
res
has enabled use to find obscure bugs that did not trigger easily on x86_64
or arm64.

I remember one nasty bug in the DMA code that initially showed on ia64 only
and it was only when someone finally ran into the same problem on x86_64 th=
at
it was actually fixed.

>=20
> (fddi0 is the fast intranet interface, eth0 is the slow external one). =
=20
> It's a luggable integrated computer BTW, a Dolch PAC 60, very nice and=
=20
> compact, previously used by a field engineer for network fault isolation.
>=20
>  I've already mentioned the maintenance of the defxx driver (it is also a=
n=20
> exercise in portability, with defxx supporting 3 host bus attachments).
>=20
>  This is also my backup box for GNU toolchain (GCC/glibc/GDB) verificatio=
n=20
> for the i386 target.  It has actually proved recently to still have some=
=20
> commercial relevance (again, for portability verification), but who says=
=20
> the use of Linux is supposed to be solely commercial even nowadays?

I fully agree with this. Cross-architecture testing really helps finding hi=
dden
bugs and it's also fun ;-).

>  The origin of Linux is obvious and I wouldn't be around at all let alone=
=20
> for so many years if not for my enthusiasm solely for the technical merit=
=20
> of Linux (following my earlier passion for processors and systems)=20
> accompanied by the fairness of the GNU GPL, with any commercial aspect=
=20
> being at most distantly relevant and a late comer into the game.
>=20
>  So yes, count me in as a passionate systems software engineer with a=20
> fondness for running odd configurations for the sake of experimentation=
=20
> (and consequently a portability exercise) and please do not deprive me of=
=20
> my enthusiasm.

Count me in as well.

PS: No, we don't have to bring back ia64 for that matter ;-).

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
