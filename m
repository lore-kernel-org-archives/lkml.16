Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88573279DC6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383813; cv=none; b=fnWCtyxRuV5UcvSbcx+H2noR7PrkktvHEWqUhJnAUxQPaKjiqzJ7cYo42VvBDyxY9b4p2vCxSUzKqvV4hKtK4qQ8mWLgqH5BSKzZoLcF5mChpn9lLgqqNO9XheZAO/EeMqBMfZQ3sXqXgrfqQjpcx9IMEgkS2SQco3OO2Hq2TNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383813; c=relaxed/simple;
	bh=BE+7U6Fwy6+8VckRpmG8hpzu9KcLW2wkEdjhtOqUbFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4p48wKjPRtC/KcAX1QHnEN3LHJuNi0NnQohJFK7mZtfLh/XK4dKZAzVU6094R+6RO1r23ny9KaYpHKz+LWEI4LcofulQWB9ChqCzj1mxGO4qeEgR3knT7fVN+AN8L3iGRNTUBxMrZh82ohV1ePGsX0zq5Ka2FcXlsHcKEARG7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VX3avmnd; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VX3avmnd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4CF1340E0213;
	Tue,  1 Jul 2025 15:30:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yWKuWzBBavnP; Tue,  1 Jul 2025 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751383806; bh=uszi8/buQOTLRi/2mujTfuC1qyXlMsMpvJpL7B+ioXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VX3avmndXilxV5K9nYT7/pdWDmce1wt1advUtYOpz+vIvC2mYmOxvCG1FMvHf+bDB
	 od5Bopd+AJPHDIIaPeJ/sgY1Kh2S/bxoWYes4jpemE8uifzCxLaxhSGEu4smrlwTPq
	 8REPcesLvoiBBIY6+6jloWDlHwGoJ5KuNI8Sog3p5QsDyvYnMszJ1BsqC0p0SyAF2m
	 xmyoSCw3Q695bcJTOa8R3m8qWjJKPQNIZjvzzsSQILVp4CSylHYM4iXE4yDaoWK7IF
	 WBmas+S9mbonA6JeZ2hPXKSdHBPsBcYmU5iX/HCqE0TYHApGtmf4v/Y1MosZ0K9C8B
	 QP0iC65EtMu7aZ6r2Yqh3+PNvj8DLUH64bXL4WD7GMhV50A8+sbj/lLTLMSSISoN28
	 CRpIPAAgX88rysSZPIFHHeuukOPe6JwoAqYLTxU7fH5iqWapQLnhDW43bY4wzq9z1A
	 noqsUBi2+bZIxi7FHWB16guI5JrbOL73oz7JMtcxVlckr+Gvsi3V3NwpE8C/A7KIui
	 FVNCP6YSWnNvjmGlZeEWKCSbZ6HgAhbQ3UgLIRUOhxvXUG7zuVPLBpRtCDil54HtNI
	 2GTt/XZBjdtokk96F+dzdNCVTsvYA4DttiPR2Itrw0MsOazEB80vbc1cxr1RGp7Wfg
	 VX8ooSXsnusDdmeROSsFlV+w=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0D9C540E020E;
	Tue,  1 Jul 2025 15:29:58 +0000 (UTC)
Date: Tue, 1 Jul 2025 17:29:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Nikunj A Dadhania <nikunj@amd.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:x86/urgent 1/1] arch/x86/coco/sev/core.c:2170:30: warning:
 variable 'dummy' set but not used
Message-ID: <20250701152953.GCaGP-8bWPmRWI10Ec@fat_crate.local>
References: <202507010218.3O5Ge0Xt-lkp@intel.com>
 <20250630192726.GBaGLlHl84xIopx4Pt@fat_crate.local>
 <20250701150644.GA3563357@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701150644.GA3563357@ax162>

On Tue, Jul 01, 2025 at 08:06:44AM -0700, Nathan Chancellor wrote:
> Citation needed. This reproduces with Clang 15 (earliest supported on
> x86 now), Clang 19, and GCC 15 for me. Were you missing W=1?

Nope.

$ git checkout -b test 4a35d2b5254af89595fd90dae9ee0c8f990a148d
Switched to a new branch 'test'
$ make CC=clang-19 HOSTCC=clang-19 W=1 arch/x86/coco/sev/core.o
...
  LINK    /mnt/kernel/kernel/linux/tools/objtool/objtool
  CC      arch/x86/coco/sev/core.o
$ clang-19 --version
Debian clang version 19.1.7 (1+b1)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-19/bin

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
