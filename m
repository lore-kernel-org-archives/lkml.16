Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6678F3B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744979923; cv=none; b=jBEQNZlpX7JSJfu3zahH4J9EWZ7YzcL79K3IlqAV+jIAlNVTjJLs/QDsX3JWtBlI0/Xkmt/goctw+N5lKspxqfStIvY4XzQx6obQ1LNMdSDkMypKjlwZQ8Cf+1bIl1JfIb6MwyANmtLf1A0XG7Z7fi5FxyH1CKCNJGc6BS5Csww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744979923; c=relaxed/simple;
	bh=sm0Ki59CjBhnsleMWYWSQGPx4sZzEiQhbqyM72fLn/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bx9N73fHex0uWwnR8J+2DgXtNuRn0ptjJYyf0eQiPBCAITjS4E5p7Am3UUfDICabYzexPGC7FXbrThryJJyLGZdbv5J4UaGL6dBrmPxyv6y1iU4RlpECQkw2v7dTh/hcQ+tA5kUmwI5k+S8H57VGEt8dcHB4wK2NObQ61qr3oHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=D0wDdAdS; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="D0wDdAdS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3F8D240E0242;
	Fri, 18 Apr 2025 12:38:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sGL9Zv2dy816; Fri, 18 Apr 2025 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744979916; bh=41vH5Dpnvr8Slt3zU3t7P+jQ5mXsu0YwL/mzwWg/kGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0wDdAdSPRI5e7Ida8wB7Z1vqHEgXZKJPviFSFGNlA1C4V6nJ6YEupF0ZRUJv2lHb
	 L4drV3kOmX3Pdb+AjICJ1otgFqqzLAba6bDzaBMOu48vN5qH53NzHRgNwvsNe+YHJ1
	 BSdeOzFLpDpHYK2JYhbJ9oMO2c455nhVbQ6HBaBMYIv0wo4Zp7omYTqtCz78hH2yim
	 VXM/tPBTn6tBdSq85ECDJYABFJZBcsRE3VelxMs45Of/6LYwBsxigGEGQaXw2Eo4uc
	 5+xZgNo8eYgGcjqNuQKsdO9WkNQjd7liardctZ3CpZMBktcJCv1Hvn1mM1Bx9ibbzw
	 P8JpauRJvWkvxffJz+1aj7slQ8ApMT0PUeH8qbX0Bo7DvQ1cTmcy9RcJjjf42lLuvl
	 eRReB2mgE0Jx5DOQZJQVokFFjJhkBCHCYtO+wtBR5FizSPxdhM3DcOSwyvUby+Eu0f
	 XzeNw1nzQZQD6bzRwMT0jDVzXJ1BqhUY1ByhU1zv31vDSV/m/GIbIh5a7vVCKeZRBu
	 wka87nDLG5KP05Pz8TFnDR+gnk8uyOf0avm4LS5hLnDNkrvKn+D6NVcsIr9k0C8pPX
	 QY4hSqk24MvaCvtcfGw+IZhORdjuTpA4FQCs4zVBy+gwGSkgqKOw6C08+KHwsclu7Q
	 6rI8fLmPYBbD2bIYfMrJxRko=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E3AAC40E0200;
	Fri, 18 Apr 2025 12:38:27 +0000 (UTC)
Date: Fri, 18 Apr 2025 14:38:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Dmytro Maluka <dmaluka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/extable: include asm/processor.h for cpu_relax()
Message-ID: <20250418123826.GDaAJHwh7mOZM3QeBg@fat_crate.local>
References: <20250418115710.4154311-1-dmaluka@chromium.org>
 <20250418121203.GBaAJBk9bOo7ad1d4L@fat_crate.local>
 <aAJHMnQPl5iRO5wy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAJHMnQPl5iRO5wy@google.com>

On Fri, Apr 18, 2025 at 02:36:02PM +0200, Dmytro Maluka wrote:
> Yeah, I meant precisely: when compiling with CONFIG_X86_MCE disabled and
> some code enabled that includes asm/extable.h without prior including
> asm/processor.h.
> 
> I encountered that with the out-of-tree-yet code [1] (which is a part of
> a prototype implementation of pKVM on x86) which includes asm/sections.h
> which includes asm/extable.h.

Sorry, come back with this when you can trigger this solely with the upstream
kernel.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
