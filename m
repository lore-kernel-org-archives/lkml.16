Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB629E545;
	Sun, 22 Jun 2025 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750623315; cv=none; b=rNZl64gTmD5CPtgdDpRTpkJCkomwHo8IVxAHmRfXa7W8KIaYf1K9cxpsTxGjE9XFXaGesxoLN4hEdOzDZi+dcCIq2eKtaK6qO5S+rykia+oy1ARZWy5rLfo9dZaAhE+buReayeUbQ9th9wBGbp3FO0h/O97ZuRKvf/XNVXbaZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750623315; c=relaxed/simple;
	bh=2wJBA5KrV1L8pNDMsbp5MYAd7u9ThKvW9NzOenM+36I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=c9o9U7xqbylQhB7LxzOITpGcvIne08916a0AcIiJ27o3ejQVsc/5Y96fKun6VGE3OZ4YaEwfLrgSh2cM0p+3BA5SshzAVfAqtJhxe9K4b1TLeY/nAQqzejlhwgPQQethV7mYfnYGYGUg79o0lSOfgFVHhFvYIVX6wTbd7MblPpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfpiVQf7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfpiVQf7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4255FC4CEE3;
	Sun, 22 Jun 2025 20:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750623315;
	bh=2wJBA5KrV1L8pNDMsbp5MYAd7u9ThKvW9NzOenM+36I=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=gfpiVQf73fREp5laF2qLidor7dmAKAxgDKCTkKsGjb5yRgVbDkJ65ZxsuK5eukEB6
	 /Le59x4B/Vhecf07b2VrZ1ADyqWuMKxzLOaLVnmkx73FjK4jEAGg3Nq+rHRqD47/Xq
	 oyB+aXUpVDvKI+qz1MNY82w976JLp8sR8Zt/s+wzma3sb0mEh0E9WPzhzyrCBnPtFK
	 yTieEwXUgLTmUCUd3u9H9RS46xDddi61EDsTlZqyZxhv+9ah7DQumAqF9pFbCkMVq2
	 WnspFyKS1GqchhnhqUxv6cHmkW0NUkdR2NKi0yhQ6GbRHy6hdHeIODM0AkiBFdCr0m
	 OYpi6I6TpSiBg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 22:15:10 +0200
Message-Id: <DATC6682WCNQ.3JVMT7MRUA4BF@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: devres: get rid of Devres' inner Arc
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-4-dakr@kernel.org>
 <DASVDU1WY5RH.1VLCIQ4TIS0FP@kernel.org> <aFglHG6lK0a94SIu@pollux>
In-Reply-To: <aFglHG6lK0a94SIu@pollux>

On Sun Jun 22, 2025 at 5:45 PM CEST, Danilo Krummrich wrote:
> On Sun, Jun 22, 2025 at 09:05:51AM +0200, Benno Lossin wrote:
>> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
>> > +    fn remove_action(&self) -> bool {
>> > +        // SAFETY:
>> > +        // - `self.dev` is a valid `Device`,
>> > +        // - the `action` and `data` pointers are the exact same ones=
 as given to devm_add_action()
>> > +        //   previously,
>> > +        // - `self` is always valid, even if the action has been rele=
ased already.
>> > +        (unsafe {
>> > +            bindings::devm_remove_action_nowarn(
>> > +                self.dev.as_raw(),
>> > +                Some(self.callback),
>> > +                self.as_ptr().cast_mut().cast(),
>> > +            )
>> > +        } =3D=3D 0)
>>=20
>> I don't think the parenthesis are required?
>
> At least the compiler doesn't seem to be happy about removing them:
>
> error: expected expression, found `=3D=3D`
>    --> rust/kernel/devres.rs:199:11
>     |
> 199 |         } =3D=3D 0
>     |           ^^ expected expression
>
> error[E0308]: mismatched types
>    --> rust/kernel/devres.rs:194:13
>     |
> 194 | /             bindings::devm_remove_action_nowarn(
> 195 | |                 self.dev.as_raw(),
> 196 | |                 Some(self.callback),
> 197 | |                 self.inner().as_ptr().cast_mut().cast(),
> 198 | |             )
>     | |             ^- help: consider using a semicolon here: `;`
>     | |_____________|
>     |               expected `()`, found `i32`
>
> error: aborting due to 2 previous errors

Huh... Do you like this better?:

    let res =3D unsafe {
        bindings::devm_remove_action_nowarn(
            /*
             * ...
             */
        )
    };
    res =3D=3D 0

Maybe it's more readable, but I'm not sure what is more idiomatic in
this case.

---
Cheers,
Benno
