Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BA610B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744671674; cv=none; b=ZmtEtEkXf2sOZtvEPEkmuL/4ApRjBeCKsR2QnfpcUkNCD7lJvP5WybxdLv/65Sco6I72TKTou0286K0PJXZ5Q3+Ryohqf1OOdrF1BT6+oHK43hp402H9kFIT4y0Bgyp5s5Pxb5Ir/jKIt4S+jOa6o2oi+hi2wIRrJxJiuQ1cK/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744671674; c=relaxed/simple;
	bh=FaVRotb0HXESpuw+QKcBzptb6AMTwYBiCjEG0nUdOnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NckDq64ZYkQIGQx1q6EmvSi+NlRJM6R0urnmrkUOJ12354paspjzK6mUUUOgoyjzrVVEO5fxNgK7u1aayufFEB/STQM2LK5CZxAphUt4u5bF295+m9M+rO4kbvZ6y9p2GlicoiHuQJoMCcUU9QXwVPldoeu+numcBUoI59sPBqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=L6bcI+Xp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="L6bcI+Xp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0912540E0246;
	Mon, 14 Apr 2025 23:01:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id c7uxUlIzHZVB; Mon, 14 Apr 2025 23:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744671662; bh=qFmAOu6brH0RJDQO8l/qzckDnYiYDaFa4rE7dL2KB04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6bcI+XppV+g8Rynf7U721jkaySbMqfDnR0pu0NFXYijdNUUeLGEjdCXnZHzKsYzb
	 vJLvi1DEUBFl0KiwcxZ1wp4U5L+kArL8m2QaLsuPWDa4Bm9lC/3TcNdA1Sk3ZtaJF5
	 nofvguVM1wRMbP1hFOyNadiYrF/7VuIijfuS3UJkr1zciN/srY7J48GbOaXOLVHCj7
	 9vTKtLIdi3+ucKRbpF1uVxgLrT9Bzu4vvnodo3z+w48EQsRcwvWUHytbZm7ruoOLsd
	 skVhy/B+fr4i4Dx1IsywbsW37+vU2g/YRKWNFS3kShaNdAeTs6hUQtNupH1JK8g8/v
	 sYEKBxBLD/XH3fC7z8nXvr47EeagnT96hX8OqygErqp4+5LoTAABJwu4wQxJuaYuGs
	 aSQ2AJ3J8Z8rBoEASxcQ/7RSBKUA2L07NTm9/fgLtfej9fgKitkAuGRfiee5HKWhbx
	 QYp+pEc4EMuTPuwh72UDhFZJd83Zm/DAT6CKI/pDxLQxDv11BsfK9UCvbBiMPOURE5
	 BOhi3gKTTU43SA7K4VsH7QeBr5iaCnf4zKVYEhH1TxtL6PtLIgpkz2eMjGVqftTTVP
	 p0cytSgQC/MVvX/ZnLC/Wet5vmqJTQA7hrF7D1LWgsnG7ejPg+xEIGkxzjbhoTj9r6
	 d7QS8ouygWSnJVdE0uyMFH7o=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3EFB540E0200;
	Mon, 14 Apr 2025 23:00:54 +0000 (UTC)
Date: Tue, 15 Apr 2025 01:00:47 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: thomas.lendacky@amd.com, David Gow <davidgow@google.com>,
	"x86@kernel.org" <x86@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors
 during kunit run
Message-ID: <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>

On Mon, Apr 14, 2025 at 04:28:44PM -0600, Shuah Khan wrote:
> Hi Tom,
> 
> I have been seeing sev_es_trampoline_start undefined symbol referenced errors
> during the following kunit test runs.
> 
> ./tools/testing/kunit/kunit.py run --arch x86_64
> ./tools/testing/kunit/kunit.py run --alltests --arch x86_64
> 
> The error is here:
> 
> ERROR:root:ld:arch/x86/realmode/rm/realmode.lds:236: undefined symbol `sev_es_trampoline_start' referenced in expression
> make[6]: *** [../arch/x86/realmode/rm/Makefile:49: arch/x86/realmode/rm/realmode.elf] Error 1
> make[5]: *** [../arch/x86/realmode/Makefile:22: arch/x86/realmode/rm/realmode.bin] Error 2
> make[4]: *** [../scripts/Makefile.build:461: arch/x86/realmode] Error 2
> 
> I made time to look into this error.
> 
> sev_es_trampoline_start is referenced in arch/x86/coco/sev/core.c twice:
> 
> - To override start_ip in  wakeup_cpu_via_vmgexit()
> - In sev_es_setup_ap_jump_table() to compute startup_ip
> 
> sev_es_trampoline_start is defined if CONFIG_AMD_MEM_ENCRYPT is enabled
> and all other references to it are under ifdef CONFIG_AMD_MEM_ENCRYPT
> conditional except the two in arch/x86/coco/sev/core.c
> 
> git grep sev_es_trampoline_start
> arch/x86/coco/sev/core.c:       start_ip = real_mode_header->sev_es_trampoline_start;
> arch/x86/coco/sev/core.c:       startup_ip = (u16)(rmh->sev_es_trampoline_start -
> arch/x86/include/asm/realmode.h:        u32     sev_es_trampoline_start;
> arch/x86/realmode/rm/header.S:  .long   pa_sev_es_trampoline_start
> arch/x86/realmode/rm/trampoline_64.S:SYM_CODE_START(sev_es_trampoline_start)
> arch/x86/realmode/rm/trampoline_64.S:SYM_CODE_END(sev_es_trampoline_start)
> 
> Why are these references not under ifdef CONFIG_AMD_MEM_ENCRYPT conditional?

obj-$(CONFIG_AMD_MEM_ENCRYPT)   += sev/

in arch/x86/coco/Makefile

The real problem looks like that pasyms.h thing which gets included at the end
of realmode.lds and which contains that symbol.

How exactly can this be reproduced? Exact steps please.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
