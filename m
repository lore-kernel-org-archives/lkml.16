Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A2257431
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459583; cv=none; b=tZpW7aEnY4aWMWDIIP6okaFiTDF5h0JbyuEC+jajg9ryNa7VkqkpdfXvDiUZLoJICMS8SOvsgWj2FEsvGSfxsYFX1gTIJLeJZYjQjbkesuYWsCrWjPIqcn+p96B5mwHHPsBP1KE6cl0fixAtbTHjJZWu/AHWHR0FqLkbOuJ/U30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459583; c=relaxed/simple;
	bh=7+uACN9MKsOjPTypJ4XdPY+HJFpt49d92OEGxFbI7LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvmdYvLSvpwx2+w2KMtOif38jk9LY8b+6kmrWLYUJTfQJ4CbaHxdnCUPbbKi3dTlWvsFKGsgTPT9UTkpUWP/L8anIyfiqOfask0oP1S9GNrnC9Womy3DaH2eqZnKN/QdwgS81vekg6XDKkQDXujY+CI+8UG5wvTiHXNrDHZQklU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=I8UByZf3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="I8UByZf3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A381F40E020E;
	Wed,  2 Jul 2025 12:32:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OdpU--Y_RnXa; Wed,  2 Jul 2025 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751459572; bh=ZqE1g5XlyeMJ29/caE4sLN2mDveLeL3e6GwduwiRf2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8UByZf397wi7DJe5SwyLlD6rqBaiDj3/blRCFiXEWmTHuMx6p6+tkDhFFVRIOwNr
	 XmkGOdcdXbzsPPRmKSilU6kaoaCSHB/d9u+r4puQg5KzyU4tgt1VsYB3M0pWLe3+Gd
	 iZRpcjE0rLYLoKFN04znQI/t5SpPHfdDFkbEHYQS3WfiOtFHycd7UxZtYtG3Z5xnUP
	 d9PiRa/alPgMMyUjNgK+Nmf8miBFrEZgVaBx+cKU3Y7Z0uGJLzPrH8NYDIBOcXwnaM
	 8DopYQJVI0ETRw8hmD6Dop7Xuqof5abHt42q9045CnwoY5SIYxcbOLcC+k1s4moU7o
	 JV5sGxLAblJX+P6614rXZigG6uKt6O1SdiElN2xoW8ILAJf+Qk6mbqblpIABAeEWyh
	 UgwbKjbP/hAO4YIrjIZSR7K4l4XyhWwQdnc5mG918KoJ2PbIOJ0haD+NPVGvrzzbM2
	 vPqkP5CUJapcRMxJvHG/SS5sT4mfWTFil0lEAkhgduCARuHgAROa/zvrs/5B3e6Meb
	 XNzIht+fOz69fiYYmSrOXTLWpLkZXnbaNJUIe8FlFeznaibQov3DsJk2FM7y008SR2
	 R+xKLjyDlBuZ3G3HWQS+X1jNpJn9RRPgz+g0EwZOrgbwXVfy+I9O3fS2VmlzUSldjr
	 rl9HQ8n+FSQfzCgFQMTpKk5U=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A5DC640E0218;
	Wed,  2 Jul 2025 12:32:46 +0000 (UTC)
Date: Wed, 2 Jul 2025 14:32:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
References: <202507020528.N0LtekXt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202507020528.N0LtekXt-lkp@intel.com>

On Wed, Jul 02, 2025 at 05:56:06AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> head:   104f02a7798f7e8aba25545f9d485035532260b2
> commit: 104f02a7798f7e8aba25545f9d485035532260b2 [19/19] Merge core/entry into tip/master
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250702/202507020528.N0LtekXt-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020528.N0LtekXt-lkp@intel.com/reproduce)

I'm trying to follow your reproducer and installed binutils-s390x-linux-gnu.

However: 

make CC=clang HOSTCC=clang W=1 ARCH=s390 arch/s390/ 
  SYNC    include/config/auto.conf.cmd
  CALL    scripts/checksyscalls.sh
  VDSO    arch/s390/kernel/vdso64/vdso64.so.dbg
ld: unrecognised emulation mode: elf64_s390
Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu i386pep i386pe
make[2]: *** [arch/s390/kernel/vdso64/Makefile:53: arch/s390/kernel/vdso64/vdso64.so.dbg] Error 1
make[1]: *** [arch/s390/Makefile:150: vdso_prepare] Error 2
make: *** [Makefile:248: __sub-make] Error 2

My linker can't do s390. So I need something else which your system has.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
