Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2557F28DF24
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452182; cv=none; b=EnX3IkuNXWuQUm/LTGW7hUlHu9C0oPmmn/X0IrTJ47P9Z4tFLDh07AkRbzQ6PXed71WJRV+fx2knQUAxR5z7+BClmbSMlKJCJRxBTP/midxFZVDZZR8SZBbW/0GckVsWACO1jhXNCV/8kDPq0g1btlgGf4jmptwqEFrPc59AVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452182; c=relaxed/simple;
	bh=M4VBu8L4AJXCoLQeK9UW+bFSMVtHsoXy8NqyNrGw79Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hng8e6323+u4H93YlPu/reMiy3X7eRvnlh9sqQ6at6kq7tUBqPo33mGm1CO2EXuK65muARDuDV25NSicGF6WMnyXrW1ry+SXTLHHYGwn/TddnaU5c8bcPweubM/88xeA4VuuPEaBu0/jAWagTs9bKoqf0BSCT6Oo6XoEZwvcjpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Z84jpefc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Z84jpefc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7C85840E01B0;
	Wed, 28 May 2025 17:09:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Qoh6x40AGY5P; Wed, 28 May 2025 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1748452173; bh=CQcqQ+xxhsBfYut6NyJtpLsEDKISpGUe/uh28WsHPnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z84jpefcUbTXHGMN5e39uRIVWU2eA/aWhkp795RJXemqw3e80l9ul3hAJyKA2URHf
	 5GhL6C38PtGJ5FRXpkcYpHgFvselEIqiJ2GeDLmmBOA6lZQBX7T5Y7sQBkgBg3Gijz
	 YdyeD2zxb3cIA6I3JFwl0PdOgMQNdEfUa4Vj0PN0snDvFPa0qTLx1RzlRyuD9Yuon4
	 vJJQFCSdQDYiiq7vFmurRZfjmFWo9YqLEJEM4JF12o2paMByylgP9OTSUCugNw80e3
	 YnkXUhfjmrRc+PJxzIBow+8bsxAiw+HbCKmaJqinPw8+Ag8e/LMr9tKdHjJJYGMM5Q
	 2Z4Yq30Y/9Ph/rV982dBFlAPVQijHJcyVKw7kq9/kKimcBSi2h8b3iQAbqY/Ne643c
	 KNA+82oHEYKkOyte7ONO7qZtql2AoMSyNRyrGqJI618SqLICvOk5O3YCyYhyHfgJYG
	 KD3FH9Yta53QUD99u6bprJXOEj4PILQhvIv2sMIdZTXMUSSd82PfHzfiMYIcUVgNw0
	 VIt8lpMOiTdy99vEEXCRz5T2yEMk1BS/EI6z5B2My4ej1NIxrsE1orFpLe7s+8s6Sh
	 qRvu+GyOooIeuXsC01Ga5TDQ/g49rtqwPyidO38Xj9CI2ZF/+RQfj+9t6X74NOBCVr
	 ZJysNpgBO7VLKZCxU8l0i1kU=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7197140E01AD;
	Wed, 28 May 2025 17:09:26 +0000 (UTC)
Date: Wed, 28 May 2025 19:09:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ruben Wauters <rubenru09@aol.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] x86/cpu/intel: replace deprecated strcpy with
 strscpy
Message-ID: <20250528170920.GEaDdDQEK-pxU13cWu@fat_crate.local>
References: <20250520133549.9964-1-rubenru09.ref@aol.com>
 <20250520133549.9964-1-rubenru09@aol.com>
 <7a83ac38b5f2c9d7ec08c04a63299d2eeaa832fe.camel@aol.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a83ac38b5f2c9d7ec08c04a63299d2eeaa832fe.camel@aol.com>

Hi,

On Wed, May 28, 2025 at 04:34:51PM +0100, Ruben Wauters wrote:
> I was wondering if there was any chance this patch could be applied? is
> there something I need to do to change it so it's fine? is there
> someone else I need to send it to so they can review it?
> 
> I don't want to keep sending and asking about an unwanted patch so if
> this isn't wanted please let me know and I'll move on.

the tip tree is open for new code after the merge window is over.

From: Documentation/process/maintainer-tip.rst

Merge window
^^^^^^^^^^^^

Please do not expect large patch series to be handled during the merge
window or even during the week before.  Such patches should be submitted in
mergeable state *at* *least* a week before the merge window opens.
Exceptions are made for bug fixes and *sometimes* for small standalone
drivers for new hardware or minimally invasive patches for hardware
enablement.

During the merge window, the maintainers instead focus on following the
upstream changes, fixing merge window fallout, collecting bug fixes, and
allowing themselves a breath. Please respect that.

The release candidate -rc1 is the starting point for new patches to be
applied which are targeted for the next merge window."

IOW, be patient please. You're not the only one with a patch...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
