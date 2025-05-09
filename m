Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6F276045
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784775; cv=none; b=DnonCxTq6d0FpryCaEyC9UL1Yh24+WIb2Mp5IBh+0blMvt4zbzR/rE8wA1wSpbB3ftWjKI0uxvoLp5wHfjflgz+mRGZCZcBHWbzRUX8jBjyAYaJFfWT88e8ifcenG9txUVIF3xzo2Gjq471Vry1W5DfK+UDCDasCg7vUYKQ6zNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784775; c=relaxed/simple;
	bh=sRMnY+ZMRqJWg+cb8Ifcp0dbwb2cc0Qd6+6wObEIesg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oKY2GTizQVIH/592heBV7oHJGBdAWsGnLa68hIScnaQrQ2sZuc80cKHMYZKpFhWPF9+3+Wn5T1tkX4WgW1RhX9wgA/OrkU7PySmHJ+8rnMrQ/5NA5gTaB9OM5uZlWcSpVrBJsD4bzl6BAStpjZyzZRL04Xl9JpnAeytsf7p0v0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cacheline.de; spf=pass smtp.mailfrom=cacheline.de; dkim=pass (2048-bit key) header.d=cacheline.de header.i=@cacheline.de header.b=hhg1sPpL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZRKzLpvm; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cacheline.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cacheline.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cacheline.de header.i=@cacheline.de header.b="hhg1sPpL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZRKzLpvm"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id E9F3B13801E2;
	Fri,  9 May 2025 05:59:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 09 May 2025 05:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cacheline.de; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1746784772; x=1746871172; bh=Knocie7AspkrYXXpPGQii
	Ms4Xx8l5ahcfQMqyNo5S20=; b=hhg1sPpLWjVgKP82PA1rI8Hbls/CTqCttvg55
	G2wp+a5XBHBVUE0LVxOz9n5u6Nlj48Iz4B71vcsN7fD/gOOIIgErlvmTTu1+reP5
	8fL51ScMullQT5oKZOjCY6eDNfV2/ya08m6UTqRX3jJeo3fvJoO5lh1Mgbsq77Br
	CbmsWY62/mPsHtymx3c8I6Fzwb8fh2Zb3tQBKZZ1ariGu5V6dsifukcdkY293i3+
	UNAHfQ+QqGNiYTUsNuUkFNizqtZLScJ3NMbeeWeaFYgZOoklEPWpfECRXpDbFLGo
	0uW1/M6IrtDIenC7v35NylaLf9YwvOslcCl63MQ1h14JzKzUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746784772; x=1746871172; bh=Knocie7AspkrYXXpPGQiiMs4Xx8l5ahcfQM
	qyNo5S20=; b=ZRKzLpvm3FPpeLZP4B0Tv2cMcnybhzNvwQ/+W3dQ8CCs1NmnTow
	+JEen2QwNpqU/JIQ5JLWoz3nSBShTv3/L1cosgrRQT/mo6GWoDCScKJN6H4GpfYE
	chndpf6Z9bcolwsFdsGVS/2mU8sEvt85baQuHcCMjTXsuHfEjLhBryfdm6DLCIFd
	YHdIMtvQ7+WOkGPudWR4HMI3XtFSdx/aWyoAJaXvXb5/mZZL77rVCkkOI9uJzCMV
	r8OO1AhCUWa+D7gBkzZOPXAwwjUZ+uP1tkYacx91RGV77SnLCJbwdyEf5FA2DDIo
	pxgHRqByDWtZ0uQxi8QSxpnb479DxnlVNBQ==
X-ME-Sender: <xms:BNIdaJYcBaEaSZgES6cmbBytPPVPca5mmbhWO6DX8jBd-Yuxr7NhzA>
    <xme:BNIdaAYMGt31CZY2AXS48PnKfuGsK2FuEFM0Oih7h1l8BDgNeQWYsB050D12fHI5g
    ahydUo-Igl_slXF428>
X-ME-Received: <xmr:BNIdaL_azMsRbC9MIwmQ82L5qkyfyJLfyIcHNCdLmb90UtZNM8gnNdORRj8u7n0JspIHZtlmjABPL3zzgKsFCCYGmnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkgggtuggjfgesthdtredttder
    vdenucfhrhhomhepfdethhhmvgguucfurdcuffgrrhifihhshhculdguvghvmddfuceoug
    grrhifihdruggvvhestggrtghhvghlihhnvgdruggvqeenucggtffrrghtthgvrhhnpeek
    keduudefgeduvdfhveehhedvfeeiueduiedvkeejhfdtfeeiieevjeejieekhfenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghrfihirdgu
    vghvsegtrggthhgvlhhinhgvrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopegurghrfihisehlihhnuhhtrhhonhhigidruggvpdhr
    tghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghpsegrlh
    hivghnkedruggvpdhrtghpthhtohepuggrvhgvrdhhrghnshgvnheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprh
    gtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghp
    thhtohephhhprgesiiihthhorhdrtghomhdprhgtphhtthhopehjohhhnhdrohhgnhgvsh
    hssehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:BNIdaHopuGG_JVEgLNpYUH98o8HA-YT5KlSzxQOkjNzS4rpXatwSgA>
    <xmx:BNIdaEoJaVWwtCnxf-I7YdYBbVcEy3QeNwTBH48hfThdPpOxXS31pg>
    <xmx:BNIdaNQMMPnZg37WYUg0ctISDesLHZFOT71nbyUjCd-kYOMKv838hA>
    <xmx:BNIdaMp_CWO3qrquhZJo8GeoWdpkitnGUPPIfnA6GY4dOw8ShBMdVg>
    <xmx:BNIdaBOxZsb8rjxjm9R4lTMiA6BlgLr_T0qzNqnGKtFFW1Pj0CGgQcX3>
Feedback-ID: i7c5149e1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 May 2025 05:59:29 -0400 (EDT)
Date: Fri, 9 May 2025 11:59:27 +0200
From: "Ahmed S. Darwish (dev)" <darwi.dev@cacheline.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 9/9] x86/cpuid: Rename native_cpuid_REG() to
 cpuid_native_REG()
Message-ID: <aB3R_5_aSCeGeLVr@lx-t490>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508150240.172915-10-darwi@linutronix.de>
User-Agent: Mutt/2.2.14 (516568dc) (2025-02-20)

On Thu, 08 May 2025, Ahmed S. Darwish wrote:
>
> -	native_cpuid_eax(1);
> +	cpuid_native_eax(1);
>
...
>
> -	cpuid_1_eax = native_cpuid_eax(1);
> +	cpuid_1_eax = cpuid_native_eax(1);
>

Now that I'm looking at this with fresher eyes, I think below form would
be much better:

    cpuid_eax_native()
    cpuid_ebx_native()
    cpuid_ecx_native()
    cpuid_edx_native()

So that it aligns with:

    cpuid_eax()
    cpuid_ebx()
    cpuid_ecx()
    cpuid_edx()

at the rest of the <cpuid/api.h> header.  Thus the diff becomes:

-   cpuid_1_eax = native_cpuid_eax(1);
+   cpuid_1_eax = cpuid_eax_native(1);

-   if (native_cpuid_ecx(1) & BIT(31))
+   if (cpuid_ecx_native(1) & BIT(31))

But I'll wait for review feedback before rolling a v2.  Maybe people want
to keep having "native_" at the start, instead of forcing a strict
"cpuid_" namespace.

(With "CPUID refactoring" hat on, and as the above mini diff shows, I
 honestly think forcing a "cpuid_" namespace, even on native OPs, is much
 cleaner.)

Thanks,
~ Ahmed
