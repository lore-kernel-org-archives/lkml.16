Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD61DE3D6
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302741; cv=none; b=u1a2P23a0CQtHlgOk8i1M/8gpwZrv2o7L/tZ2hHuDrdMArq/khLL36oV8c/aRHpWslygRyQxUz9nOnuiV6aQGevoBfYV6XaCfr4qFc35etjguoAp21W/rJm33kGOS1q2HC++cDBGiMXtqoAgqYwgwL3c6C+a7UDmV4MYrb1ph+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302741; c=relaxed/simple;
	bh=aFvYyyMhfmBs2IwAKDq6EC2EOUXH+9yyNSf6A/+nAQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYaroQ+PiOGhX4OVIJd0IMaJxIqT/BZR2BCHp7/oQ9aabq3ZNyfgf4Om0qBdm/jah5PdK4my0f36j5Q7Tzej8o8TgeaRIK67X6SQdAq+BhDQQSFx9O1uNuXSyzCqnxZBRKK7fj2UWciWZ0n04xX5GF6XvBJbY9PC845xB00QBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JWbLbiUi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JWbLbiUi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EC15640E01ED;
	Thu, 15 May 2025 09:52:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BobMfzEI5LnP; Thu, 15 May 2025 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747302730; bh=l3QCfJ8Wu/7XFiSiBlQN0mQHuqIV4yvsmYDcTkH5X4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWbLbiUivxVt+PqfTwCCBgRxy7lcwzaTI4PrKWjAGuL21vK4lcUP/8LmVRoLfyvHx
	 l1rW/fuLGdOpesHnztoJKAQlZVDflt1gZvKM6TweRkpmdw7wGdnJm2PE8+SNHM+edF
	 RSQfzjaOkji69kGxhmy+W3EgZNbuUxuAkeLrl3lspv3OMbl5NUiRZ8GIznoipEtq1r
	 zdV9az5bdArNRFa3UYhSV4CPlGYto8GXjQOpO49jLuH05Q/XI5RfxQnA+WM+Fgx/Fg
	 G5nhPBtFglq3OwW1XEjKikRJ5OunKlQyj+jPT1rJSJmlFogmnCxA+dGlSnZOHnma+D
	 KcbmWYz2Vk+OzEz5UywC2PyMH+eKSpxWN36wnHra21vpijgsDn2PThxidjmvEeggxk
	 34lg3UsUjV5O9rQcyxBnZrLvaqcAOpBTem6dT5MMgXzfvreET+Aq44UYsOgT+3b76t
	 Jha/T/jBp3JwJVbGkJMiue3NvQltXt75lD0LbmxnTHTFlD2sRM3Fo/6ddJBMT9e6qy
	 0eTQE2uv0mTMfD/5OxXUq6PWQe8Mnw5AEVy5djdmLLiZxzO86tWOpHb5Ll+Db8tsbE
	 6cTSpzoDmaQOn+/r+kuRIqjHaNCFSPCohkbC1w//7HvtOJ9q5KvRozJXl2ZB7P+gRg
	 6YcC5+QkacvFmSeJaBftTGcM=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id ABD4440E0196;
	Thu, 15 May 2025 09:52:03 +0000 (UTC)
Date: Thu, 15 May 2025 11:51:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250515095157.GCaCW5PRk1CTPjEtzJ@fat_crate.local>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-10-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514104242.1275040-10-ardb+git@google.com>

On Wed, May 14, 2025 at 12:42:44PM +0200, Ard Biesheuvel wrote:
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index f67a93fc9391..d59bee5907e7 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -395,7 +395,7 @@
>  #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
>  #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
>  #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
> -#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
> +#define X86_FEATURE_LA57		(16*32+16) /* "la57_hw" 5-level page tables */

Is there any real reason to expose that flag in /proc/cpuinfo?

>  #define X86_FEATURE_RDPID		(16*32+22) /* "rdpid" RDPID instruction */
>  #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* "bus_lock_detect" Bus Lock detect */
>  #define X86_FEATURE_CLDEMOTE		(16*32+25) /* "cldemote" CLDEMOTE instruction */
> @@ -483,6 +483,7 @@
>  #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
>  #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
>  #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
> +#define X86_FEATURE_5LEVEL_PAGING	(21*32+11) /* "la57" Whether 5 levels of page tables are in use */

Or can we stick to that one?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
