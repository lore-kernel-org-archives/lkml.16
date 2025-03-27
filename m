Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B7C18801A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089114; cv=none; b=aAZRt8eIABOAc7K84DbJCOvvmlG9GZAJQrjvOt6KLhpy61FZRiEyZYqTm9LuPZusGRTLuRW4ZgRmkunJx/V0gGNJciEGstCm77K0gYnp3QpdMJuUqpvfa0Y1xUInWfFix/ZYdSUb4TPCIoJmS2KPzbf40tQc0wQREVklunaygag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089114; c=relaxed/simple;
	bh=w1JF7P1K+rEzxjeCng7bvyQyKq4Av3bh0v7FlnN06u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sD+Fg+dnppzmUcoDmdWAgTHmxX0O/fOsqurRTGGiJqo1Jcc/q9cBvjYZfvgKl70rEWMMl9uvDQH75QEB3fDc/f8FeRA4FK9wD89Ya/uPF0ZkIHP8tBeE/KoivL0V4uU1+DoaN9yBZ1NywwmZM4Vs4OfaPZrcbD6LZTa83P8+V0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=NjtcA7gn reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="NjtcA7gn"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7EAB940E020E;
	Thu, 27 Mar 2025 15:25:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JeFNwVv-fup3; Thu, 27 Mar 2025 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743089104; bh=wGnlROgyGgurqdBWFkVmiRwxfSkAJYoBeiFrf8GXveo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjtcA7gnCI4i9vNqxJh4hTOZ/yRzP8OPDi7hN3oxrEGPtVhc2qMj+i799tytEEWvv
	 heR1uc1R6sgpoesr//f6qPwfLKPE45WybNCWY0NonQrH1wI0z0f8IIm9qErGJ0QZ4D
	 +W5Al41M7i9dmnXaN496a5cQUMl0/+L9ufizFDnFq0+kk8tloeYRNjOg2rgTwLgUhs
	 6r8JxgG/tL9pC04JD/zlzWHstSyPzcLQx8qp9raQGYvGiO5EM3e9pPsrTbZwh5wfCT
	 7CJEbPA757z/Y8QeTT/HDE/cUftHSb1OxeNBXCt7XvAhRHV7ZYbqYIHbYq+tHyRK5I
	 nkiCwo5VBphExmt6fpSLnY06pjXwtXxVYNOENpTWTZ20pT/dSl1Jj0BtJXvvEQapVe
	 INEiBztQaKiy8Ckut6wykWVtntwwp8r8dW9Z+SLhi15R6wYN4JojfAF83d9k6qVC/h
	 WvEG0a4kpoasWk0qU3qvLSt9sIQlYEBtJBflBtNcsSUYi20LVd1op885MdoiUzYoRw
	 +v+jbQAcIqzvrXJtDDlahl93tIaySBz5wrYF0a3ys562RcxobLr8AJuuS+glnKvG9y
	 XeDRgEWblv47INcBMH3OKWxrdjYYU/9pcEolH1dtoiaFCW20CYegtmycX+yvk6I1mD
	 SgCCIIcYIx/3u0yfJL9rptG0=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3590640E0196;
	Thu, 27 Mar 2025 15:24:56 +0000 (UTC)
Date: Thu, 27 Mar 2025 16:24:50 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, oe-kbuild-all@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	kernel test robot <lkp@intel.com>, x86-ml <x86@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
Message-ID: <20250327152450.GBZ-VtwmD3altwx_rI@fat_crate.local>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
 <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
 <20250327141316.GBZ-Vc_NybN1cIEePu@fat_crate.local>
 <c18a543c-4df2-4744-bf16-e888a832d634@suse.com>
 <20250327144012.GAZ-VjTB935oZS3RLa@fat_crate.local>
 <a8d89245-bcd2-41a7-9543-e517766900ba@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8d89245-bcd2-41a7-9543-e517766900ba@suse.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 04:15:11PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> Another approach could be to have:
>=20
> -static DEFINE_PER_CPU(struct mc_debug_data *, mc_debug_data) =3D
> -	&mc_debug_data_early;
> +static DEFINE_PER_CPU(struct mc_debug_data *, mc_debug_data);
>=20
> and to use an inline access function returning &mc_debug_data_early
> if the percpu variable is NULL. This access function could be __ref.
>=20
> It is a debug feature after all, so having a few additional instruction=
s
> isn't the end of the world.

Yap, makes sense to me too.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
