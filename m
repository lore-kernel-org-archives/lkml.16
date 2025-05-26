Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF61BF33F;
	Mon, 26 May 2025 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748286071; cv=none; b=Nf+lhFprVUn7iyZw5LxFNYsamLk5VWJ/hDoiphDHFoj9DOT/vr4AhQnughyYoOa0vND+TAiO7VUSyqrS06zJB+tODF33UxQf9lekdF+IgPTBOjx66lDXt9+q2JzdbNKJvNfYZ49ZwLCJeVqlhrtoEU4x+b4EJgFcUkhv9hUqXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748286071; c=relaxed/simple;
	bh=3BkYDdh9GKMYYq2NtRGYfetcMgFlCuh7mXjigTbK44Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=I2TI6WTy2FN0RCgxGrXFVT/VD/RQhafP/EWdSwPYH7tSYc3cUshIOahhzgKt0wrL2RDHCZoS3whr/NTA7jkoy4Gz+HaQMJRl/6tBx9RkhhDp+yIEcV0rrAbatqlr+P6RYNXQ7BbL0QceQzfOtOKKz4o6baWZS2AH15/e0fceg2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K303g54/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K303g54/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E8DC4CEE7;
	Mon, 26 May 2025 19:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748286071;
	bh=3BkYDdh9GKMYYq2NtRGYfetcMgFlCuh7mXjigTbK44Q=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=K303g54/jNRRpFlR3QCjTUOq/RMGjfOJz11DSNnR+2fWmXGaQ3oK6Z4MzA3uAZtP9
	 AR+1BRxBwmxt7yZ/jBnIejM6Pg3mwGrnQg4YcSbOSxculPSc1HBiVsw2ODYSRAypDZ
	 HPZ/anQLqzH40D78OXOXsZMJAlGjoxQ/Z4iRPHGAyMVmKA5WB0nLgvGOTQ/lPLtkk9
	 3xAJswcn+B0zHnVy3dm/R6TVZ6ddo28cXvglokhsgPRJ6XnFwM1vYLuy5nPqKEU4oL
	 7KCGzxwswotHqWvN53ujt8g5npVL1HLUHWiqbOl2eTBDUcjY6F4i2LC/HTdiyxMQhy
	 p8BMlVvk88j0Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 21:01:06 +0200
Message-Id: <DA6BORD02WHT.19D9226XGI6GA@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Xiangfei Ding" <dingxiangfei2009@gmail.com>, <stable@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: list: fix path of `assert_pinned!`
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250525173450.853413-1-lossin@kernel.org>
 <CANiq72=G5w4D=c4U0KEQnRcy7vmARbWovmJwO3+vkyhixFinjw@mail.gmail.com>
In-Reply-To: <CANiq72=G5w4D=c4U0KEQnRcy7vmARbWovmJwO3+vkyhixFinjw@mail.gmail.com>

On Mon May 26, 2025 at 8:46 PM CEST, Miguel Ojeda wrote:
> On Sun, May 25, 2025 at 7:34=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> Commit dbd5058ba60c ("rust: make pin-init its own crate") moved all
>> items from pin-init into the pin-init crate, including the
>> `assert_pinned!` macro.
>>
>> Thus fix the path.
>>
>> This occurrence was missed in that commit, since it has no current
>> users, although binder does.
>>
>> Cc: stable@kernel.org # I haven't found the commit in stable yet, but ju=
st to be sure.
>> Fixes: dbd5058ba60c ("rust: make pin-init its own crate")
>> Signed-off-by: Benno Lossin <lossin@kernel.org>
>
> Applied to `rust-next` -- thanks!
>
>     [ Reworded slightly as discussed in the list. - Miguel ]
>
> The commit is in v6.15 (rather than just in e.g. rust-next), so it
> should indeed have the Cc: stable (I removed the suffix).

Yes, at the time of writing the commit, I hadn't pulled from Linus'
tree & the stable trees.

Thanks!

---
Cheers,
Benno
