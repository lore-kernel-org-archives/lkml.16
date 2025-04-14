Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5E342A92
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640985; cv=none; b=Fpd+2/nP/iaf/zR9+TX2SyyNp05feUEbPRCNFy4ln1UPJQjI+bHl9laSMwlGgvQQkE19RfWphu/B/70O1e+8hiRv8jQaokaU9I7uNE4aSG23xNR27i7X/HhmTzWnLWFecziTyitkRqatiTMe/JH7MSVVpbJ9mKjBSv17LofFD2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640985; c=relaxed/simple;
	bh=PYyC37ueCOpBUbo+TCfDnXFv8g1QRim78BgE/UgP+Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGNJ6z34GQI9Y/RVAh5EYiDgDVBMSnIBXnlfnjQQG9xeoYvPu/6DVtvq2pL1uB+ZNA7aYU4d3CdnmWp9OlirS283vWxycRn1Mf3wDPRFjd0N5wWPf8c4slRJMqibQbkJLMjBKqPI+aippSNAE/6WtB8nM8DfQMB4NI/NQD+600E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4RTmtVGI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pwum4eUc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4RTmtVGI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pwum4eUc"
Date: Mon, 14 Apr 2025 16:29:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744640981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JCUsE5Mdst+54lv6uqxK3a911+jGBbURT4DUM5+r8wY=;
	b=4RTmtVGIAsn27UnoywqRIktgysFxocsqCNiiviD73Ao8/zA/2jhm9IWtgJMV+cMB2FSSz8
	ILbZKyY08Uxr7ofCP2y4k5YpeRyDeukuL5wS+CiPWy7v7GYCXoczuZvjXTW15Fjq+NQOvT
	j3MPlN/zJ2pcOTa40NcaEk9WIHQl6zfl4u/IWsBZ7PLgDo27/tH1G35WP51Wn5m4japOzX
	6pgFvHyQyfjNfZxgyatg+aab8h2Ulj5w2zMmVr021W3QFaIMg0xfgHdb8mhOOq0WYo59QX
	DN3BxsikJ/JXTroHV3IKgEdOPdZCak1cEbfr0WlBTDlBMqNgZu6FCnkJA5VfFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744640981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JCUsE5Mdst+54lv6uqxK3a911+jGBbURT4DUM5+r8wY=;
	b=pwum4eUcXM8e7GqhOmL2DnsAkzSDa+KV3RrDQuVlO4sbye+oY59eMup61kpvpKRo6ONcB3
	uXfM4uVvb5fNU9CQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Aleksandr Nogikh <nogikh@google.com>
Cc: llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>
Subject: Re: Latest clang versions fail to compile CONFIG_X86_X32_ABI=y
Message-ID: <20250414162453-469e4a0c-d2f4-48a9-bd0f-c0a1d64d9dc2@linutronix.de>
References: <CANp29Y4FmGDXm3LWvW6D+JR8CWf=fvuiAseFb1h2HQSDjFKO2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANp29Y4FmGDXm3LWvW6D+JR8CWf=fvuiAseFb1h2HQSDjFKO2A@mail.gmail.com>

Hi,

On Mon, Apr 14, 2025 at 04:11:15PM +0200, Aleksandr Nogikh wrote:
> I've been trying to build a Linux kernel using newer llvm toolchain
> versions (18, 19, 20), but it consistently fails with the following
> errors:
> 
> ld.lld: error: arch/x86/entry/vdso/vgetrandom-x32.o:(.note.gnu.property+0x0):
> data is too short
> ld.lld: error: arch/x86/entry/vdso/vgetcpu-x32.o:(.note.gnu.property+0x0):
> data is too short
> ld.lld: error: arch/x86/entry/vdso/vclock_gettime-x32.o:(.note.gnu.property+0x0):
> data is too short
> 
> The steps to reproduce:
> $ git checkout v6.15-rc2
> $ make defconfig
> $ ./scripts/config -e X86_X32_ABI
> $ make CC=clang LD=ld.lld -j48
> 
> The versions used:
> $ clang --version
> Debian clang version 20.1.2
> (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97)
> $ ld.lld --version
> Debian LLD 20.1.2 (compatible with GNU linkers)
> 
> Is this a known clang/Linux issue?
> 
> There's a kernel commit that addresses a similar problem:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaeed6ecc1253ce1463fa1aca0b70a4ccbc9fa75
> 
> but the error is slightly different there and the added Kconfig
> condition apparently did not kick in.

The Kconfig condition does not kick in because this make invocation uses the
regular objcopy and not llvm-objcopy.
To use all parts of the LLVM toolchain use "make LLVM=1".
(Barring existings bugs where linking is done through $CC/clang which may use the
default system linker, instead of ld.lld)


Thomas
