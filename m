Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C62580D5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657477; cv=none; b=cx9Lu1cjBe/hpimsX0K0gjUswdTTLLsx3RTH65Q25JdmSNyjv+17OggkyAPmPC+v0r6y2TRyG0xZA8hDYM5JCKZBH71egrFnWT0a7b6oDEa6vfFcubyOc2+Nuy7VDBGXXoawNoupIKwXSRw8OrHe0jmQsayWbejZWc2/5ADPh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657477; c=relaxed/simple;
	bh=G/encWNhYWTJwo9ZJGkF5bWXqoJmrqshxAvgzZqxTgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufqa/i5vygxQ0JSsdKKUA/B/CpX+K0WNL7J0uWV5R+mSBj3xDXkCvT9+Gp5K8zdPVNg/EN9K9JELkkxzzE8Zro1VkppiSyCiWUxbFOaJCVf6uPb8fo+glFSNmJ5wjvVMfjbyPaI7XJ3DhdAD9BHx2fGsHuhhL4pcE8Ivwrfwdjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=L846KlSM; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="L846KlSM"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E84C240E0238;
	Mon, 19 May 2025 12:24:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yJ0WjvT1PGo2; Mon, 19 May 2025 12:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747657469; bh=TxPy/QcQYhifJlLZ0IHyOcFF+vx6d+lm6JWcQmCgif0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L846KlSMscVRD3SXrjob8CFPU9UrRrj8NogxYRoMWPsl/dQvAzk54A7zZS89E259O
	 wbXi/cfkytluLNrsyN/gCypYuJ0K4d79tR78VDZOH6SYbdM40+MkfesJ9o1p0KyDHe
	 WNhJ2CUoxY07Ux479t2Sjfm0vG+VitnEVolSlfe33Aw5VnhkJNTIPMbbCIv8DbKCRg
	 SHg+Uhg/YMwFX6n5BbMFRRaGOoYDrsGIWeQ3uxyUEuOJT/jqK7pBnSnKgCDdSqlApv
	 pRba6a1u7JJHGzSOemz6DC5EC4yjnZJheWZWdFKptMnh7HQKn46J91uSXAAyO3ht3D
	 w/3XOWLORXp6xu/h4fyt0t4JpgXIXuEoqm1ROFc1zIojzryrc2iOlSSlb9ZJ8HInAt
	 4oYvMyC7hjVaaOL86H0Xi+K7v8ZGBkXU+GYsFm9qxfTyqKk/6IctnWSQ4bByP+gvHA
	 DZrClM4OpNuVOFY6IzMzCWiW+lAfPHhkpjiXJCverIGbSB71jkvbydKG4xqmC7CTiO
	 GWU72yXBipNxcXAyR9UuehmZmJSm5u1UYcvraH6fD3WWOEhKURgxrmrrNEulgwUTDt
	 ED7cctDa4RigikjTFBqpRi0mIuzqxYhPRsTAWqPFvK9ev5OEx/aLJhW4z4J2YwawZQ
	 lvQPJpIF0d4KP1XtXQn+ikaQ=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 13D8D40E016A;
	Mon, 19 May 2025 12:24:21 +0000 (UTC)
Date: Mon, 19 May 2025 14:24:20 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250519122420.GBaCsi9PTJE7KQKJoO@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <CAMj1kXEFykYgtHb0UaNQ5fk_0+q+ZHVJa4Gs8-v_Jq1_35-gEw@mail.gmail.com>
 <20250519121541.GAaCsg7YZ3-HDYgiBu@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250519121541.GAaCsg7YZ3-HDYgiBu@fat_crate.local>

On Mon, May 19, 2025 at 02:15:41PM +0200, Borislav Petkov wrote:
> On Mon, May 19, 2025 at 11:46:34AM +0200, Ard Biesheuvel wrote:
> > That is what the old code does. It results in the flag transiently
> > being set and cleared again, which is what I am trying to avoid.
> 
> Right, something like this clumsy thing ontop. It'll have to be macro-ized
> properly and we had macros for those somewhere - need to grep...

With trivial macros:

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 893cbca37fe9..fa6c4e395ce3 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -38,6 +38,9 @@ enum cpuid_leafs
 	NR_CPUID_WORDS,
 };
 
+#define CAP_WORD(f)		((f) / 32)
+#define CAP_BIT(f)		BIT((f) & 0x1f)
+
 extern const char * const x86_cap_flags[NCAPINTS*32];
 extern const char * const x86_power_flags[32];
 
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 104944e93902..6d2c7e5694e9 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -704,7 +704,10 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
 }
 
 /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
-__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
+__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long)) = {
+	[CAP_WORD(X86_FEATURE_LA57)] = CAP_BIT(X86_FEATURE_LA57)
+};
+
 __u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
 
 #ifdef CONFIG_X86_32

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
