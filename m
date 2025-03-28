Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E3517548
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173067; cv=none; b=CD8IuBdpJa/xbcDvz0KL1KOEulW6JRLawQJfxqgJ+qBd5XZr1ZfYSohC/HS1QWLX9d2J3p/Td8sKzbyWX217iBM/Kdph/TgZ+gtB9pHa/8UOoe1JYgxSjaOxmPvml4WrKQidLPyuh7axrgA45ZscUrJ4mJ5NDGQm1nkpZZaAVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173067; c=relaxed/simple;
	bh=Ka8K++80PGmWrsBk+v+n2UkZJCnwOU08Id2ETG8hiVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiOyjhqPz8uLoMRtW1gENN9nyzUuvHp1TP7r05w7FPzThF5qXeh7DS30MBKFfH5ZtCrHdPeTlZzBx6U5I4UHmgNUShY+HBypOTLqtWEZx4xunlsZOhMT4sjC0OVzY7tR9JdRs9TMYh383y5pC0Gs0/COHRXoYVLADk61WvLBna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=crqC87Qo; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="crqC87Qo"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3879B40E021E;
	Fri, 28 Mar 2025 14:44:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QoMtSvIc_kxj; Fri, 28 Mar 2025 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743173053; bh=z5I0u/vThJ/UKCs/ij+/X+6NUe0tDz9FKBXBlxKiDpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crqC87Qo6UPK7Go/uP0I7c5mf3t2M0FkyMOuVaQRMvSa0M5+LvuHt0ONoWb8pRsyN
	 P4jZaJwjiXNz/lwtwPnE43siYElpwixjvuwrfLXlIFRvacDKOED25zHX9AA11GOlKX
	 Mq8bn2dBekOYB/1kd6LLwpDlj0blh/2v4pQH64cxIx+qXIUinFxE+cbaAdm0bvlehM
	 uWHDdGl5ogZSfJ5sz6JkIgldV7doTzZm4pUsgLJlCCiypUn2Hw0wzPRfiH4SgvrGnE
	 EcCQJ6MbutVF+LkQYYhu10HrtTqDmMayfo2ttpoyAvvNz4crKqbxwbZiwVAEDITdJ/
	 8JhOtye/uO8ipxHBc1sFbX5WioBkCV0bqcUVl6M7RxPYegYu59oGrhJywihU+Whqev
	 QFp/iXgnvHhd9XvtPXizVmsFvf8UJG5NBj5Fj/04zp1dyEGDoIERp05iN1DR8uKjGf
	 +nlgMio4/wDxMY4vhKO+IjouH1mvuvOeHUT13tzMs7q7LTNwHjCaFHiI8qK6NCXCO/
	 ce7Ygv+q/dwRuB9bfcwR/eJ5mGC2rhpg0NqhDftxmbVaqhIAESWB/PUn1IpEm5Q8tm
	 +3tLfccob2lxgfAQ9c0DV8Ut/aVhyBFZuDkkqIFIbGnAQlHC40lSO6Dmbb14FeP+4l
	 Y/djdb67zzN56NzKJnYwTYEU=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 16D3040E0215;
	Fri, 28 Mar 2025 14:44:05 +0000 (UTC)
Date: Fri, 28 Mar 2025 15:43:59 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com
Subject: Re: [PATCH 0/2] Clear AMD's microcode cache on load failure
Message-ID: <20250328144359.GBZ-a1r77uFgyWsI9E@fat_crate.local>
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
 <Z-XEPVvEDhC5vzR4@gmail.com>
 <f8ec905f-04d4-46f6-909c-7f79b151c0df@oracle.com>
 <Z-alzhvfSXN4liNE@gmail.com>
 <20250328134544.GAZ-aoCA03g9SygDnW@fat_crate.local>
 <Z-apwoVEQkwCH-Y2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-apwoVEQkwCH-Y2@gmail.com>

On Fri, Mar 28, 2025 at 02:53:06PM +0100, Ingo Molnar wrote:
> Well, it's a regression over previous behavior,

It is not a regression from a previous behavior because this has always been
this way.

> so it is a regression fix for an upstream change that is only a few weeks
> old,

The late loading is not a few weeks old.

Sounds like you're confused. Find me on IRC and we can discuss it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
