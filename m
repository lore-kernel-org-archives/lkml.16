Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9893979F2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751675047; cv=none; b=DHPF8DGopD7IxYouLj0ZogPBvjHeX1Nm3WZgAburW7xxMXrgPpijYBv5JVWO6zc36PjykXH67d9wJ8fVJ+FNcvOrTb7/aKzhdIFU4g+ml5XOkZU+B1B5nVt/8rWkAH7SPEmcoqTvkP3EFV3d1vbxSx0bnFymQ9Q7sJN7pWtXhwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751675047; c=relaxed/simple;
	bh=TYMHv9Dv3jYkEo0ht4anEZrvvyj/u+eRTcHdOKiIkT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6+ib7bQopp/oeOP+FBB8qTOj7O1FIg3AwrSIHAAk3wWDCp2QmAxFm+8NdUpoorSke6ft7S+kD5bN1wYj7tU2bfcHh3DSd6s5H4FriNFOlbgSC7yj6OLbFmFu98VvasP4sIahaLmIK72gy6Sv4UjredRj8n8Bb7eOBwycx+zlMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYidcRh9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYidcRh9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3561FC4CEE3;
	Sat,  5 Jul 2025 00:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751675047;
	bh=TYMHv9Dv3jYkEo0ht4anEZrvvyj/u+eRTcHdOKiIkT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYidcRh9JSsGEtUvSUoH8Iej1+FHtvxx79zfAWPMVtVKYmKKsFV7NnX8VP71MxHJD
	 A03GKEFUqUDO4mRq2W9QHOlCF+4eE0AuCaXs0AMs+QPax+l8/IV3TKLnxzK5I51LSx
	 4gLLjta80GaB/gRhUoabLoOPA+JQGaVjIxf4dYCk1vZarSltPACBtJcEy/kBNl89vS
	 iophvVHOe0uKLMAVbTWjMLWEh8yEPMTphAT8GZR5m9tza6FaHfrcWcbjqWeKmgkPcp
	 0QblpLiigZu7bcz2Gcv3Gkz9bA233H3uHDkQ6TSrPtWJn5zuqwsrqfsRBCBhLft0vO
	 y8Y9aemEcEngA==
Date: Fri, 4 Jul 2025 17:24:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rob Landley <rob@landley.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Eggers <ceggers@arri.de>, Arnd Bergmann <arnd@arndb.de>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>
Subject: Re: [PATCH 1/2] ARM: Require linker to support KEEP within OVERLAY
 for DCE
Message-ID: <20250705002402.GA1968690@ax162>
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
 <20250311-arm-fix-vectors-with-linker-dce-v1-1-ec4c382e3bfd@kernel.org>
 <CACRpkdY-yxaiG89Co+C2=vyd0i6sh9pP0UGWZh1yUg4jd9jmuQ@mail.gmail.com>
 <6739da7d-e555-407a-b5cb-e5681da71056@landley.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6739da7d-e555-407a-b5cb-e5681da71056@landley.net>

On Fri, Jul 04, 2025 at 02:15:18PM -0500, Rob Landley wrote:
> On 3/13/25 03:48, Linus Walleij wrote:
> > On Tue, Mar 11, 2025 at 8:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > 
> > > ld.lld prior to 21.0.0 does not support using the KEEP keyword within an
> > > overlay description, which may be needed to avoid discarding necessary
> > > sections within an overlay with '--gc-sections', which can be enabled
> > > for the kernel via CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
> > > 
> > > Disallow CONFIG_LD_DEAD_CODE_DATA_ELIMINATION without support for KEEP
> > > within OVERLAY and introduce a macro, OVERLAY_KEEP, that can be used to
> > > conditionally add KEEP when it is properly supported to avoid breaking
> > > old versions of ld.lld.
> 
> I bisected the 6.15 armv7l build break my mkroot project hit to this commit
> (e7607f7d6d81):
> 
>   LD      .tmp_vmlinux1
> Segmentation fault
> make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 139
> make[1]: ***
> [/home/landley/toybox/clean/root/build/armv7l-tmp/linux/Makefile:1226:
> vmlinux] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> The toolchain in question was built from gcc 11.4.0 and binutils 2.33.1
> which were the newest versions supported by
> https://github.com/richfelker/musl-cross-make when the still-current musl
> release (1.2.5) came out.
> 
> You can grab a binary toolchain to smoketest with from https://landley.net/bin/toolchains/latest/armv7l-linux-musleabihf-cross.tar.xz
> and build using the attached miniconfig ala:
> 
> for i in distclean allnoconfig ""
> do
>   CROSS_COMPILE=armv7l-linux-musleabihf- make ARCH=arm \
>     KCONFIG_ALLCONFIG=linux-miniconfig -j4 $i
> done
> 
> This _just_ seems to affect armv7l: armv5l and aarch64 still build fine.

Hmm, I do see a bug in that change, as it allows DCE to be turned on
with binutils older than 2.36, which should be avoided with something
like

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 3072731fe09c..962451e54fdd 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -121,7 +121,7 @@ config ARM
 	select HAVE_KERNEL_XZ
 	select HAVE_KPROBES if !XIP_KERNEL && !CPU_ENDIAN_BE32 && !CPU_V7M
 	select HAVE_KRETPROBES if HAVE_KPROBES
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_CAN_USE_KEEP_IN_OVERLAY)
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if (LD_VERSION >= 23600 || LD_IS_LLD) && LD_CAN_USE_KEEP_IN_OVERLAY
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_OPTPROBES if !THUMB2_KERNEL

but it does not seem like your test configuration enables
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION so I would expect this change to be
a no-op in that case? Does the above change work for you? I won't be
free to validate this until after the weekend.

Cheers,
Nathan
