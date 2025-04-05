Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1AD5C603
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 21:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743887015; cv=none; b=Eo8QZVFgfJhHaqk+aRGgt61zoph4LwAqBUmWcPsqXVB6JGm6somW9yfVC44W5AmTCFQ/BefrGJD9EfMJmsliLGgiU41hhsxSsTsRhWsekyYbT7TBrUfLaYjthuNDBsmOcqYCyEOImc0lFzt+22zM/rKkZbw/VgODOVNNioIYXxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743887015; c=relaxed/simple;
	bh=yisFWg9WNy1G3z6VrA/uF3ZeF6V9quksFxhUZtGck0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecUr/HlkyY+ARpBzQtOb9CGx5XB02XoG+lUHYntVWcPQSWYGnjqJ9uX44e7f8rW7MPWxrjxoqyHw2VZthzetl3GBLQrjWgs6RnXHuE1SOwU6eeyCX9nzq16HdZVFSU2EusupYxvqfsgzwl6qmleZxJ+2ZvB3ggVP3DDvCI7gVH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LrLADye+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LrLADye+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7919440E016E;
	Sat,  5 Apr 2025 21:03:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EJBtzuW_Rw6P; Sat,  5 Apr 2025 21:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743887007; bh=F0GtVLJ+LcoRg4fwph2sywYHZWO8kpY/Ie3Z/z00hys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrLADye+ClKwKEkxv/cgPnY3nWXa10Z72g2oetgkEOfgylaWnsvJr8omeX0J3xs9A
	 jT2iAkFR5iWVKwbJhJwZ6ng6ExIdtEYPsnwirq59joyN4kiX3q3oxUxeGh+XZCLt+D
	 zQtY5CE82yIPvxjrATzPoWgm5AogIh1yfoQIwsM9ucaFqdm3CG848gMnn/ExFufauz
	 mbmE4habVoMMmj+Ap2TF2y1WMZg3PtBrcs5CNKUXRjPsrWr986uX1H1HciNndZLOWg
	 ogPf9Dp1j/lUsZ/rr1+sm2QPwibCRrlKNc6OLXOWRwA9N0sIRvSjPp7H/uP7gyT/ph
	 niAw0ApW3w0VZauDd2GKSHWgISWmlil10ixJGHSemlKkF7DZXZHPU4aFu3IC5xUw1/
	 p4It28/143f0XLUTGuqSsXxcTHGG/guMTyJnu6jNSRpgznqyNAywIsFaygeSpg2yS4
	 LeI/5auEfWLtLCO2RbmJu4ODrE17ltg/K1lHXLF5QwNkJtHT0FcYqD8xZJ7Yol7xs+
	 d27LUGznqUQY5cMBgXkz3TSHJHHbHJHgzKwP8DJ2CbzgIiivkhTgzYdZRRFHdvFtOb
	 lPoOp0mnErv/ivq5/pBlk0q8QFVGajHNWKs8A4G6wtbdA+jFRYdpqt9tCbbg7JtsJn
	 mBKog3sLvtKyek0sEG36tH18=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 17F2D40E020E;
	Sat,  5 Apr 2025 21:03:19 +0000 (UTC)
Date: Sat, 5 Apr 2025 23:03:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250405210312.GDZ_GakEONiwRpIU6T@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <DB27EAFA-8793-4B0E-BC33-C9E9E2C41777@zytor.com>
 <20250405205013.GCZ_GXhYBEsH73q1MC@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250405205013.GCZ_GXhYBEsH73q1MC@fat_crate.local>

On Sat, Apr 05, 2025 at 10:50:13PM +0200, Borislav Petkov wrote:
> On Sat, Apr 05, 2025 at 01:33:46PM -0700, H. Peter Anvin wrote:
> > How the Hades does c->x86 not get set to 4 (hence < 0x10) on this CPU?
> > 
> > That's the real bug imo...
> 
> Go to the first mail in the thread.
> 
> 4c585af7180c ("x86/boot/32: Temporarily map initrd for microcode loading")
> 
> walks straight into  native_cpuid_ecx().

... and what you're *really* asking is why that dis_ucode_ldr is there in
save_microcode_in_initrd() - because tglx made it an early_initcall() so it
runs independently of the loader detection logic and thus needs this check.

So I figure I'll stick all the checking logic into a single function which
everything can call now...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
