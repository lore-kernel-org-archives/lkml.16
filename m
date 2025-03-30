Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D018A6A7
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743355930; cv=none; b=NpC0QZdTOa5HPWccZ7nkemE7+/MhwjPJqH30ICpfb4ZCRhCBwOgjwx9QAOMiow8D2laoEAcAKcgiB2As6o/n5COgVh1OIz8MIe276AuT6vMZ6367cj8S2wUWcoHManT6q1Lo9PZnvkVJ3R4krO0nKVk8ixEmH9IDTy7s0q6VfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743355930; c=relaxed/simple;
	bh=80EjwrQgCr1m0ngWb4imWyl/LLhti2yd45R7yKVtS/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxpIvz9pWjJ4kbd2AYNGtD40EUAjXa1yWyR+/WHBMtz2Kz48/sNlMtB63zam+h1gyXG+zehPuuFau8k0qpPeG2cGDollYpfYZ0/nUiRz4u+/ZMFBWSxRzcYvxTWl8wyN/Slcy6dDPkm3+tnYe4KnL1wbIoWYfGU3XVw9Hj25sws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=F45FKK26; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="F45FKK26"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7314640E0215;
	Sun, 30 Mar 2025 17:31:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 73gcme-QvyL4; Sun, 30 Mar 2025 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743355914; bh=eocWMfEdchVosqUeljix+CtLmykEqKaqVPaHYSGl7ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F45FKK26vESKnjiOl7Mief6NnMXhCHmmaK17apoQpqaVHk9CTjk7pxGq+Ncgqx333
	 X7c2LPEBim7MZmQJd/c0sP4I9U2r2OIBO7B2DbPdRQ2PcUlilazJTCfx1AwlsfAHrb
	 oqkcOsOppYA40ukYzbj144s/W6oZWbl1cpxTZ3p1dtJ1HbxMxkYRpqi588P+LVRNH2
	 /xLwHatbvVpdEpMyA9RO2t69hnieUa+qrAFzxQONQbICuqyxRx/DeCADgpVD2HQDUE
	 sg5Fa9ZoFSbHFbT72FIKlaUmifipOGV7TxZ1zHZkFxzbLjXTOnJpLmKj5+GWP8Zbd1
	 IM6x2YNPOAkPDVqJKuAboP2rcVXi1rHl2AHMSJ5ddU450tZE+fxIV77HvtNpSFiTrc
	 XkJfi9/I9YsfA5ZCceoH1oa1VkAZWVao5klCWjkfZR3DX1Eey/ANXfPETPo5zQsQMl
	 EEb1xbBs+Js+JXVPbgvAIiFa2Wooj//Wn6TvgsL64Rl4PYAkpx9mOASrUkAQA+7NRN
	 QI8aEagSvCfGRy1Vt90FBP2cq01KMrT47Rd6G3m63CNJ4gd4E/Ehrb/DwLLwPFPwIj
	 zsX8RbWi5H33qVhi9wOtG1lbfoMsrBl2uVUUkcaXOOd8vkgrVrvcF7eNpyTdtc2uFT
	 EdocMFk+pNzunpAlNY4CPt9Y=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F88640E0213;
	Sun, 30 Mar 2025 17:31:47 +0000 (UTC)
Date: Sun, 30 Mar 2025 19:31:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <20250330173140.GCZ-l__PVdSx6mj-zL@fat_crate.local>
References: <20250325164854.199420-1-ubizjak@gmail.com>
 <20250325164854.199420-2-ubizjak@gmail.com>
 <20250325171141.GDZ-LjzaPbAG1MwjZi@fat_crate.local>
 <CAFULd4ZT5mjjEXW3SnGQVMo18fO8CapFS-ikLQvYFw5EKtEfmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFULd4ZT5mjjEXW3SnGQVMo18fO8CapFS-ikLQvYFw5EKtEfmA@mail.gmail.com>

On Sun, Mar 30, 2025 at 05:15:16PM +0200, Uros Bizjak wrote:
> You missed this part:
> 
> --q--
> ... where there is no need for an entry in the .altinstr_replacement

Not really - .altinstr* memory gets jettisoned after boot.

> section, shrinking all text sections by 9476 bytes:

So if anything, this saves a whopping ~9K disk space and makes hweight* an
unreadable mess.

So no, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
