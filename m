Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE261369BB;
	Fri, 31 Jan 2025 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738352287; cv=none; b=X3Om696yL04uYQGRWJLwYEDAzm4ieKfldNDH2GqWzj6YwwORiwIg6KG1isKZHvah6y/BsTHZXe8ghJzq4Z29GfKIEY9yB+4ABOBo+gbhL2VyXq9P0XQPhGjRpClkEPclKb9pKpzcah0x3GgtSld7JCSfSdS1AHQXiX2rXil+egw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738352287; c=relaxed/simple;
	bh=MNwR7K1C5XU+h7AF6I6a6RWR1xLWJHOxgmSSWzdp1fU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=REC5JJldSW8U1sEsapdcbOOSLGVHQ2zZIMnlgc6oKLxIYomM0R/MjuH1uD8Z6BXIDxBkF+bQqZF4lYlRhuj8eLRFuogaCYRP6SD7ajYs4dVo0xs8GwRlgRnFw3q9il3Q5TT/nkpqoQBfm7QD3FcD7kl9rwzFnCAjAJN+KezkHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ntr1WxGw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=0O7p7ubX; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ntr1WxGw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0O7p7ubX"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id D338013801D9;
	Fri, 31 Jan 2025 14:38:03 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jan 2025 14:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738352283;
	 x=1738438683; bh=yRZK6S9eDJy00Qz7bi6t6iIoQ+hvl2LLW/vH9f6bwdk=; b=
	Ntr1WxGwVDyybY0LaBO6m18yBQnxGKhYE2XQl4AEjdYbBT//AJ0sSSeS+YP85JfT
	5FyJ4uFUGFbItlboszyjZMBzqRkLeDIi/EMuJiXsj5QYkv/ysvbMShJBkHdVKkr6
	tBqsWthV7s3HU6fu5MJyisJgztGY12QzrlxtW/ZA6ZwUtLsdyfpWUqabWIIRw0NN
	5TrLrPgFJTNme5R63ZuRTcupf7l7PeVrSb6j/LA2U9ZjEvGs2gXgSyjRt3Jj4k9Q
	2aIamUQ/8ihcgnx3PDcvCvq2jjurn24u7HedCktK4lYo8GZmdQoTvsTRBr/4aSAb
	f370YRVDrTT6E4klH44upg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738352283; x=
	1738438683; bh=yRZK6S9eDJy00Qz7bi6t6iIoQ+hvl2LLW/vH9f6bwdk=; b=0
	O7p7ubXKNLZaHx9T02Sma9Cwadbjc+e9Zir9fZtebgwfj+OzKzP+NVfAo/Waugua
	Bve+cx+CHa1hESLdxzIii/6G9UB9Qg6jH92PgYe4LS9oFJUmpAjM+4KXj0+jgf28
	pNAwAt++2XeK2iwTi7MiK3UvYPI6Izvcvrt31HQourLsVhjKV6j5OO66Is+R+khT
	l+E3tg6AUmdJF4bI86G3vPNfTsdow0gjueMfaJ0ifVrFxkC06H6yamlMEvoeMmzL
	UCoQXpcJ6DKP2o13Wo0Pfcu9dCRVYm1SPiUj10LQlyToo5VIcRmbLMQNUsDUbUve
	ZGzaLO0c9uJQWKHis2ssQ==
X-ME-Sender: <xms:myadZzcoTDLPHMauPjdY95S-l_zbNC6cWFy3Z9kAiZmILeyg8c7Y6g>
    <xme:myadZ5OlOOMtrPyom5Aiy5T7ALJPl9NA015i8eiUdBOhaabWf4ubZ5g_M2kQq5GoW
    8fCDY6Zp0oOa8HUfdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelieehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:myadZ8jpxLh_n6N6hSmnz1cM-F41U0BM_O982YaTvMEkrmxrFYyUiQ>
    <xmx:myadZ0-mJM8YqP-gcGB4_j_D56WC5l7faQRwm3Kb5CpafLXiYBfnDw>
    <xmx:myadZ_uNHS9QkgLqKRseCrHU5R8Ww97FKjRQZIhfzaSFqr2NgRqIkw>
    <xmx:myadZzGSb6sD3Gxlz7dieCCp7CW-2QrSIbLwm8IOcPGHMJpHLIOrFQ>
    <xmx:myadZ0VIa1OARA7Wk6LRZCjMooJjIu9qRtHPQeQly5Odt8G8pQxGykKe>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E886D2220072; Fri, 31 Jan 2025 14:38:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 20:37:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Jonathan Corbet" <corbet@lwn.net>, "Russell King" <linux@armlinux.org.uk>,
 "Rudraksha Gupta" <guptarud@gmail.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Geert Stappers" <stappers@stappers.nl>,
 "Jamie Cunliffe" <Jamie.Cunliffe@arm.com>,
 "Sven Van Asbroeck" <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <e14cfb34-308f-4797-afe7-4e7e2d470fe3@app.fastmail.com>
In-Reply-To: <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
 <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
 <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jan 31, 2025, at 19:58, Christian Schrefl wrote:
> On 31.01.25 5:05 PM, Andrew Lunn wrote:
>>> To fix this Rust would have to provide a way to build the core
>>> library without float support. I don't know if there is a plan
>>> already to allow this.
>> 
>> Floating point is banned within the kernel, except for in very narrow
>> conditions, because the floating point registers are lazy saved on
>> context switch. If the kernel uses the floating point registers, you
>> can break user space in bad ways.
>> 
>> I expect this has been discussed, since it is well known kernel
>> restriction. Maybe go see what happened to that discussion within RfL?
>
> After checking again, it seems the float intrinsics are actually not
> needed anymore at least for my config.

Ah, nice! If this is true for all architectures using the current
rust compiler, it would be great to remove the FP stubs entirely
and have link errors instead of panicking, to make it consistent
with C.

> Only `__aeabi_uldivmod` is still
> required for `parse_u64_into` since [0] allows disabling float formatting.
>
> Link error without the `__aeabi_uldivmod` symbol defined:
>
> ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>> referenced by num.rs:580 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:580)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>>> referenced 34 more times
>>>> did you mean: __aeabi_uidivmod
>>>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
>
> Not sure if we should just implement `__aeabi_uldivmod`, keep the 
> panicking intrinsic for it or somehow fix it in upstream Rust?

The 64-bit division is particularly easy to introduce by accident
on 32-bit architectures, so ending up in a panic here is clearly
a problem. From the message above it appears that there is only 
a single calling function (parse_u64_into()) in the rust library,
so I wonder if it might be sufficient to split that out into
another object file that then doesn't need to get linked into
the kernel, or for the kernel to override it with an implementation
that does not rely on __aeabi_uldivmod() but calls __do_div64()
instead.

Since parse_u64_into seems to be a parsing function that is
expected to be slow, it should be acceptable to call __do_div64()
here, while we still prevent calling __aeabi_uldivmod() from
kernel source code.

Note that on earlier ARMv7 (Cortex-A8, A9), even a 32-bit
division is implemented through an expensive software loop.
Later cores (Cortex-A7, A15, A17) have native 32-bit division
instructions but still no 64-bit ones.

       Arnd
