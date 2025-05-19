Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CAA1DFFD
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656968; cv=none; b=LVvgHNMNBNQwvCWdRuYDfH9uwdMVUdk45taFF3W89d1CtQXKXY9zC/rKTaYfzTYXk+U/Wm4FO+UlA3uKVIlmF+xcSstKpyOaxBMm2QFiRV4FY5foOi2ThG3RegBzyQPFBxx5XRhrCQdPh8lSIs6dVcCgyv5ggajZLndgqsshXXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656968; c=relaxed/simple;
	bh=5d/DDH6dTwZh2uUANC/W0lg2Tuxf2KcmFuOdU/wNZY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtPMk0p80J6Dr0CD0ojhmlP1B2S25TtEesgeZwk6EGtRsgOmIy83DAcpvpFz0VOGKe+xHqFcKHL2celg1b2HjFyC+rChmOlp5EFCri/qRfz/tI+CHfbUlvq/YMmZyRBSWwtqO2RD2iLEFH9O5RwAMyp0+UjpnkcV06taegIxf00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=di5gD4U9; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="di5gD4U9"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 749D840E0238;
	Mon, 19 May 2025 12:15:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nI4udhmzhqeD; Mon, 19 May 2025 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747656955; bh=6CHIkidWvoI2GyW7+dnBtnkD8kdvxKK8XJWdkFMoXsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=di5gD4U92S1EVPhTvkJiNvz9KO1QsS5Mt9/0v2JcTAnTdCn39RlfSG/iKAbqwWleD
	 gJGYv4wLya7NfH5H4qrHGF9Wt+x5szoUEpMbT8vbyHqaT8ZXgtQhObxTYdIsfeUUHN
	 Ag1rdZtAhY+RAY0/ws9mwUYEfDGsfPVAwIZbdULR/U80hDhP+w5vXMuqY6YeEdmHNQ
	 +YMl6v3GqgAVPZUT5iqSnYRqVR0wy6bfmzRfIEKU+JOCe/foA2JJusF1+dig/6AN1e
	 4/NU41MDnEAqb8/FyfsrggH1vMJGWIbjF74KeAV1VY94sKI8Dhj8155B8MMt3KWNs2
	 mXoOa8kNDRq9hYcwYgYEKQjx8rlTeeu6evxy+4m9Fe/dFMoeNMMYsNPodu4xviI5+Q
	 /fSZW9PO1Laa9Oc+JzNS3NzXup08AvlIWFMkJSHWSuANIerHUlXSubRZ5FOn4I8hzM
	 +yao5FdrZbmx106P9PHkieBE6vGyUvHxpXcOa1WU3EkREXr8d+438P09XFuf/YxyVi
	 VpsXn1ID01FB2mNEmzZ3Bm0r0qFOgnx06GyYUed/PTiSeXFZDEHczxLSZiVeq+UKF2
	 sE+ssA1uUMX5ReS9D9j9+tNNhX/7V8Pa2h5PCwjE9A5gSg0Kb0KMiajY0x3/T2AuXh
	 2vk2J36scqttmSD6tivcpFUk=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8C4BC40E01CF;
	Mon, 19 May 2025 12:15:47 +0000 (UTC)
Date: Mon, 19 May 2025 14:15:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250519121541.GAaCsg7YZ3-HDYgiBu@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <CAMj1kXEFykYgtHb0UaNQ5fk_0+q+ZHVJa4Gs8-v_Jq1_35-gEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXEFykYgtHb0UaNQ5fk_0+q+ZHVJa4Gs8-v_Jq1_35-gEw@mail.gmail.com>

On Mon, May 19, 2025 at 11:46:34AM +0200, Ard Biesheuvel wrote:
> That is what the old code does. It results in the flag transiently
> being set and cleared again, which is what I am trying to avoid.

Right, something like this clumsy thing ontop. It'll have to be macro-ized
properly and we had macros for those somewhere - need to grep...

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 104944e93902..a6a1892a9215 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -704,7 +704,10 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
 }
 
 /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
-__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
+__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long)) = {
+	[X86_FEATURE_LA57 / 32] = BIT(X86_FEATURE_LA57 & 0x1f)
+};
+
 __u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
 
 #ifdef CONFIG_X86_32

asm looks correct to me:

        .type   cpu_caps_cleared, @object
        .size   cpu_caps_cleared, 96    
cpu_caps_cleared:
        .zero   64
        .long   65536
        .zero   28

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
