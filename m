Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C6618DB37;
	Wed, 14 May 2025 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747244471; cv=none; b=gcDU1Zjvp4b3EeR3Iw6DrFwSYHIpLeMZtGvNYZV0BxrS7/loBQowHUrIyQTlx217GpWZJVHFrNy49qbs+yxSS9+k/Yq054NdEfNhW48hb8TFoGyv51sFLHkF0qS/2cjG5IuwZcxGmNW8ZcGJ23dZ04LP/d/d5B3dE4cFQxwetPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747244471; c=relaxed/simple;
	bh=tG5D1sSTXJ379orrfW0ZwE5tB2wSt+gkXBmHSZaqVaQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=EZDlUDDoEnlO74yupweeMa7iXWQlcwPDs8HrmJ4yLYMJm1eQCqbupMj35C+ro3FPdJrOVraJyTmnBX8I5CtvsZhLVqXFcP0pY9XZOwddTMT8fuLeGJj2+CeOIUA3NDL5+J7cLcOBuHNXlygVi3USySm8s5xQeP3JBO370Vu+8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1y/9xsL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1y/9xsL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBC5C4CEE3;
	Wed, 14 May 2025 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747244470;
	bh=tG5D1sSTXJ379orrfW0ZwE5tB2wSt+gkXBmHSZaqVaQ=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=s1y/9xsLM05p3IB9cQ42LmF7l66fHLxBTxpSCJTTa5iqacfPzAUyC/W05UmtNtP+G
	 ZU/t+u2XfrZDGr6a9EJtux7bV95aTThN6Ga0VmBivCIwAKjsb31B35RNAOe5diNyBz
	 th208vPI0TLlGNaziOdTJyCERwrQmL2tLRjRgrpzR1bTRqQFUEuwjtstCAWU1lr8+Y
	 I9hWrU9ZCfKau938QDski+z7Y2CGhOt0CGoChzMEEqpPxd5lK9zdQBb+E6FrktIS67
	 +7biOPtrOZAtNGXLrU2ONdNaLI5Se0SjmsnyhLxQsYHMZKOVVPMyQJhu4r466i5Y93
	 r2JKJi+rdFwxw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 19:41:05 +0200
Message-Id: <D9W2GYMMVKLV.WXCSH0FYL4QC@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Mark Brown" <broonie@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
 <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
 <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>
 <D9W0FJ6MKPTE.1NI5HK0TJRHCM@kernel.org>
 <B58EF4F3-6ADD-4311-BE9D-CCE82CBAEBF2@collabora.com>
In-Reply-To: <B58EF4F3-6ADD-4311-BE9D-CCE82CBAEBF2@collabora.com>

On Wed May 14, 2025 at 6:19 PM CEST, Daniel Almeida wrote:
>> On 14 May 2025, at 13:05, Benno Lossin <lossin@kernel.org> wrote:
>> On Wed May 14, 2025 at 5:50 PM CEST, Mark Brown wrote:
>>> On Wed, May 14, 2025 at 05:38:40PM +0200, Benno Lossin wrote:
>>>> On Wed May 14, 2025 at 4:40 PM CEST, Daniel Almeida wrote:
>>>>> By the way, IIUC, regulator_disable() does not disable a regulator ne=
cessarily.
>>>>> It just tells the system that you don't care about it being enabled a=
nymore. It can
>>>>> still remain on if there are other users.
>>>=20
>>>> Hmm, so a `struct regulator` might already be enabled and calling
>>>> `regulator_enable` doesn't do anything?
>>>=20
>>> It takes a reference to the regulator.  This may or may not result in a
>>> change in an underlying physical regulator.
>>=20
>> Gotcha. So calling `regulator_enable` twice on the same regulator is
>> fine?
>>=20
>> If that is the case -- and after re-reading the functions exposed on
>> both types `EnabledRegulator` and `Regulator` -- I am confused why we
>> even need two different type states? Both expose the same functions
>> (except `enable` and `disable`) and I don't otherwise see the purpose of
>> having two types.
>>=20
>> ---
>> Cheers,
>> Benno
>>=20
>
>
> As Mark said:
>
>> IIUC the point is to allow Rust's type system to keep track of the
>> reference on the regulator, otherwise the user code has to keep track of
>> the number of enables it's done like it currently does in C code.
>
> So this all started because keeping track of the enables was rather clunk=
y. See
> v1 [0].
>
> [0] https://lore.kernel.org/rust-for-linux/20250219162517.278362-1-daniel=
.almeida@collabora.com/

Ahh thanks for the pointer this makes much more sense now. Yeah that's a
reason to have two types.

Please document this properly. A good reference is
`rust/kernel/fs/file.rs`. It also deals with different refcounts and
ownership, so that might give you some idea for how to write the
comments around changes in ownership. Also have a general comment about
the two different refcounts in a `struct regulator` on the two regulator
wrappers.

---
Cheers,
Benno
