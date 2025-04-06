Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E26DB672;
	Sun,  6 Apr 2025 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743974259; cv=none; b=nYxzJt3tCEPyBwC2J/ARtMIiW90mWQVX38hunm7kV4lYp6GMQQMXBiOad6mE5cAqbb3o+a2BS5YCiirAd57RWblNCLjcNkBKgqqFxVs5l+AWbaCxSz5NFAF8/mYxWvbR0lye1n2rMTTnZgoUAM8DbwId4/tIgCcmHJu1eSO1yts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743974259; c=relaxed/simple;
	bh=g8sUifbOipNYqUHyx3VWuhZIXR1VP4zw9Dz6cx7kEiY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxHXNGw9Oa4gWZkmeMEhojbhWJREe2SNzKr03YWaXOt3gl4f0IR6x/Npu351g1HXsUi5sieePLpr6x4mu12IXyNY/sDG5X5+YcKezxdK0sv7zeGtAMTU8ys//rafj7fsfKoaochR3GYJoAAkwH4gZDyHdLuWooblVIkfJ8qDO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ku2/BLwZ; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ku2/BLwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743974254; x=1744233454;
	bh=g8sUifbOipNYqUHyx3VWuhZIXR1VP4zw9Dz6cx7kEiY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ku2/BLwZcHLur85wegvxo11QiqWwDn1mE9x28DKFPqfmNlkcq+4qkCztb667aouXI
	 +0U3XEKSuxXDvOhQmqxznLpR8pRyx9CI24i8LLmdFeoOd07NciKYKu/GeQYHTAW4rK
	 NZVklgm0JZBDnvFdny6YjWmD/FmQnZwH/lHFvUQO7NQzVTvocPBuDgKIikTs+t0Lkq
	 by3nzViSVreTy34syukAksp9X3usH7TeSGUGJApYsONnPatZDr23KT7c+haYkHnVbn
	 PK7PdlrMpLdqZlhug3f5YTR3kX7ZEKeTERPgFw3q8c/uqj1GL7opM1zjEAwQG09cLp
	 3eOVwxHc5IHoQ==
Date: Sun, 06 Apr 2025 21:17:26 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Manish Shakya <msh.shakya@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Message-ID: <D8ZV9SWWK1OG.1HLXBSCAR76CO@proton.me>
In-Reply-To: <CANiq72=p4zjbvVKAR90wY2saFty6AS+-JCNWRvnFu7VeLzg43g@mail.gmail.com>
References: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com> <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com> <CANiq72=p4zjbvVKAR90wY2saFty6AS+-JCNWRvnFu7VeLzg43g@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: f467d7a470867f87fb17661f610b7b814febe96e
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Apr 6, 2025 at 4:57 PM CEST, Miguel Ojeda wrote:
> On Sun, Apr 6, 2025 at 4:08=E2=80=AFPM Manish Shakya <msh.shakya@gmail.co=
m> wrote:
>>
>> CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
>
> This is great for testing...
>
>> CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy
>
> ...but this one should really be disabled (both for testing and for
> production use).
>
> `RUST_BUILD_ASSERT_ALLOW` is really only there as a worst case
> workaround (escape hatch) that nobody should ever hit, hopefully.

Maybe we should rename it to something more discouraging then. Eg
CONFIG_RUST_BUILD_ASSERT_DISABLE.

---
Cheers,
Benno

