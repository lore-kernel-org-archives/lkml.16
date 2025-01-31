Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE74C9F;
	Fri, 31 Jan 2025 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738309270; cv=none; b=Paaxa2Wuvdpta+IF64bb7iECil6AhFQzUkzjY0jsEfHX9ARXWoG/chguy5WJKaF4jkIj6Wy2EEUDBpuxXk6o4zCtt8qh6DhO0LZSfcv1hOHLywR8e9TV88DUVqtkGKcjKCvNLIs/qlotX+BCyPiw1zFU+7RNJt6ZdEUlfXwm0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738309270; c=relaxed/simple;
	bh=AJU5kc1jwXswkRrqutIC90v5z/tfYHqNu1pAiYvrggs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Jm+qwr7Gz+J+X8NQAuLDru1LLYO3MkEGBm7W0DB3vHaOQUsvllNqwo2vhQSewzVWgB2gxeEBK2SQbCiaZVmQ3EknQLjbZiwT335DteW7PvGDPCY8TcZEYxBRx9FqlEQhNtAQbf8p2bTLWPciWoLA0G3bR942Zh6HcV1HU6vLFhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=p+EsdHEW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=y8oIAD6Y; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="p+EsdHEW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="y8oIAD6Y"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 35A0F11401A8;
	Fri, 31 Jan 2025 02:41:07 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jan 2025 02:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738309267;
	 x=1738395667; bh=a015or5h7JL8tqNC7E1K5CmxYio91AFRJMKPQrlypmY=; b=
	p+EsdHEWP3ACTepGzvls4c/0QwGbxx3xvN3QEaZZHaoYBy36hl5JS782NvbP+5gx
	FQy/BYFtAl1h4TuHKji+nemnFcmbzGGFGFhZ8bgg/MW+KK3QkRbq/Lq4hQFRvUKN
	Ad/fYhn2iVQD7GsuGgLgfgDYB6Qh2IJrVRKWhZhun5+G2BWg2f0kik7ZEvZrhaM2
	yAMgzFhY9ctaQNkrsXc0wzGNr3w4n2YzGTPvxqoLjBt7iCL0LIbsvHJ2l+sFYHbz
	inWU2TgAO8ygzAKmUX1r+n9qpoqeBfYBwAntKortX9vuwgB+8CV0y/lMmMZbf3hg
	sP2dPlegAFnwCwir8+xhjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738309267; x=
	1738395667; bh=a015or5h7JL8tqNC7E1K5CmxYio91AFRJMKPQrlypmY=; b=y
	8oIAD6YrPt6RaDC4iEXqaoPMZ+rLP2Ot1ta/e7SAdgMQykevbTxws2acg6axZF2N
	DMEfncziUV1jLpm45YwpKL0dsQx3tJM/Ksn2p4S9pH5okoFuGYMi1HlBHkfrVodA
	CKFecCatC+ukmvC4b+BeZpQwWFrfFmKYdscVV2EmW1k/Q7xl2yx0CHyY+RaeSOsk
	XQTbASk1e4Xc+Z8Kss0q5GUv7oaFzHPATdYNv7JDdWf+RTegBe0Gn3VHCJ4rLOSZ
	n3ZBhaNp6/f1qXRjhqK8W4FL80s7obekgu8EsWZQ/U84cxTq5JkdGIvhvA7l3ZhR
	r6663SOfOHtlkdI++0ncQ==
X-ME-Sender: <xms:kX6cZ21fjPiVWWY0DiU5VCer0YajY4PqS6DzSHKQr8qhWdUrtlPyvA>
    <xme:kX6cZ5Gr8rcee_p03TnsWmCC2csbc2lBp9zhfTvpPga803EWw6SG7XJuOrNS9jcCT
    DJuWHIFDcyeUKinqfE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrghmihgvrdgtuhhnlhhifhhfvg
    esrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdr
    uhhkpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprg
    hlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhf
    vghnghesghhmrghilhdrtghomhdprhgtphhtthhopegthhhrihhsihdrshgthhhrvghflh
    esghhmrghilhdrtghomhdprhgtphhtthhopehguhhpthgrrhhuugesghhmrghilhdrtgho
    mhdprhgtphhtthhopehthhgvshhvvghnjeefsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:kX6cZ-6qgze7ifRuQzdyUrUdU56UridTMZY33I91Py7f0jAzwicdWQ>
    <xmx:kX6cZ30H7SoCBveuIx8sGPVZItlQ62zfZN4Ma5ndKMsqfGE6J30dUw>
    <xmx:kX6cZ5FCJsXZ0-VxPQ3rqhxBgyXcq7QujXzSqjdIH398l68MRkdQpA>
    <xmx:kX6cZw86q-3LudYSqNIvo75vywydI1TG6lMKvsmXr9H6WDc0P8YTfg>
    <xmx:k36cZ5NRFc_rKWh0VOeaglgwkSnb_mnbkvBBtgJGtBxgt_RkhDENHa5O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 67C552220072; Fri, 31 Jan 2025 02:41:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 08:40:45 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Jonathan Corbet" <corbet@lwn.net>, "Russell King" <linux@armlinux.org.uk>,
 "Rudraksha Gupta" <guptarud@gmail.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Geert Stappers" <stappers@stappers.nl>, "Andrew Lunn" <andrew@lunn.ch>,
 "Jamie Cunliffe" <Jamie.Cunliffe@arm.com>,
 "Sven Van Asbroeck" <thesven73@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
In-Reply-To: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 23, 2025, at 23:40, Christian Schrefl wrote:
> This commit allows building ARMv7 kernels with Rust support.
>
> The rust core library expects some __eabi_... functions
> that are not implemented in the kernel.
> Those functions are some float operations and __aeabi_uldivmod.
> For now those are implemented with define_panicking_intrinsics!.

I see you are doing this part the same as the other architectures,
but I don't see why it's done like this in the first place:

In C code, we really want to get a link failure rather than a
runtime error in order to catch those bugs as early as possible
and fix them before even trying to run the kernel. Is there a
reason this doesn't work in rust, or is there a plan to change
this later when the existing callers of those functions have
been fixed?

202397be76d8037b531b34dee16c7dfcfd0124ef..3375c91e698c024f95a85682f5a91d9815c355e5 
> 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -130,6 +130,7 @@ config ARM
>  	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RSEQ
> +	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7

The ARMv7 dependency makes sense, but I think it needs
be disabled on combined v6/v7 kernels, like (CPU_V7 && !CPU_V6 && !CPU_V6K).

      ARnd
