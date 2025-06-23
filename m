Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54821EFF9F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663554; cv=none; b=jkqXTSUFushz6ARF1sMJANOWA6egEZlCPHMjht6tHfn5oTNSQEGLEGyG0J3KyKjmC8dKwUMKNZkzvPbIqp3NLymqrGkvbXs1fKd/tOmkdjlXCzX/7UxTZF9/amwwxoqCOqWWeSHhGjDFZBfLhh/OIogpARcBE0XtiAssQicRujg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663554; c=relaxed/simple;
	bh=3AddItu1zzQverrxwemN/SoM/ygSF09VLTmoR3TYgVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEBZuSIN/WsKWWJUQjkZJa2VKPfoRjH/hFN48qQYtOOaXovGUdJ0MDUOACcrgCDas38QN3zY5M3PXX5qrCC5TTpQSSADcMONcBR1aDVcf9WtsddZVRMxBOX2M6b9Zn7W+1eBTVFzW4UUwryJcSdMLk/uhDNrDlWIWGPsbDgQKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4P6tWDa5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xISzTlwP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4P6tWDa5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xISzTlwP"
Date: Mon, 23 Jun 2025 09:25:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750663550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEEedbKgnJXSwwOET8K6ArKbZhySAVPv7rRy/P6v38I=;
	b=4P6tWDa5iqxcS8J79zDiW4xQQhGBGFRetF41Y3n8Tz6T7cpAT4fbSYM7MpCh+XeOXwSjXm
	6ouIC3118X2ODK9+maLG2RiaNkV9CTNZ8DHB/2FuRorA13wnpBkq2YzAFFV3C/saVESmWz
	7KaNP9tR/zS/lGJdpWGf+Ikidsmuyl1PzBMPy7QiOvyaEbnRgyWJm3aIzeH+MCeLYCf3Hx
	ZI8hJS/AEagyYTe1gtldNEr6IN0w25aktWWw0mDoFnpF5DmJd3wEutkR6Iono64qQJYxN0
	e4O7l7sDsy9f79WC4yHcpwsE/OEtxHIt19VpNstAOcYKaVEIYlanHp613BwfZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750663550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEEedbKgnJXSwwOET8K6ArKbZhySAVPv7rRy/P6v38I=;
	b=xISzTlwP+QjoLV/MUD6z7R498BBYOZ84lByRmZpBlBH0Y1YvpZa4wXt9cp8WB2BWh6yD7D
	Ch6x2d0fCQPUeBCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexandre Ghiti <alex@ghiti.fr>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Message-ID: <20250623080736-6f8f2389-4575-4508-8214-faeb10b4b241@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
 <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
 <20250612155635-ecade4e1-0235-464a-bcb3-293f7452510a@linutronix.de>
 <87cyaxp0df.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyaxp0df.ffs@tglx>

On Sat, Jun 21, 2025 at 05:42:20PM +0200, Thomas Gleixner wrote:
> On Thu, Jun 12 2025 at 16:21, Thomas Weißschuh wrote:
> > On Thu, Jun 12, 2025 at 10:31:20AM +0200, Alexandre Ghiti wrote:
> > We could introduce per-architecture configuration. Essentially reverting parts
> > of commit aff69273af61 ("vdso: Improve cmd_vdso_check to check all dynamic relocations").
> > The final logic for the intermediary objects still needs to be more complicated
> > than for the final .so as those contain relocations in the debug information.
> >
> > Or we could add a C hostprog for validation.
> > That would be much more flexible than the inline shell command.
> > It would then also be easier to use an allow-list than the brittle deny-list.
> >
> > Or we don't do anything, relying on the selftests to detect miscompilations.
> 
> That's a bad idea :)

Fully agreed :-)

> > I'll run this by tglx. If somebody else has any opinions, I'm all ears.
> 
> This is all a mess because the relocation type numbers and their R_*
> names are not uniform accross architectures. Neither are the valid
> relocation types which are suitable for VDSO.

Ack.

> I don't think you can reasonably cover all of it with readelf and
> grep. I did some unrelated relocation analysis some time ago and I just
> modified the python script (yes, I hate to use libelf) to show case how
> insane this gets. This is just as much as I needed to analyse files
> compiled with some random cross gcc I had handy. But you surely get the
> idea.

Yes I get the idea. This is more or less exactly what I meant above with:
"Or we could add a C hostprog for validation."
More specifically my plan then is to write a C application that uses
<linux/elf.h> to do what your Python script does.
There should be no need to mess with libelf.

<snip>


Thomas
