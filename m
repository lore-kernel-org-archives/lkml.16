Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE5519CC27;
	Sat, 17 May 2025 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747509086; cv=none; b=L981M3Mwbnp2JZoKFmh5W/T8Qt0ogeX7WPdP2ipSKFuDgz+q4zuput4riVjsc/MYx5T0E9PyZZnNT9gjR8MsZgiz8BnM2dMeMMhPPhxL0LtOuLOe/C6C77mDKJNAbXlEUqb7pW7c6og2tWl4ZsL2Bv+yDh0EApfZKW7NP3UdiTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747509086; c=relaxed/simple;
	bh=SNOwVK1Y2LypwvVxIgQyb4CvbacAABjnIU/eHeRg25g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lxXbGbAR13W87aIs+nWjWLg0tDds6LBb9xONstew2GarsiiToC+zGEUl6H8W8YPm8v421+Mf00OhRn6uI93KXqP40+iALsJJFlmtkHF+pLKzx6Wt8Uyrr/TU4sSFgWXcDQIdUs6OO+MGxX/4gFOzQAbIvlAa5ScH3zqUQ6kKXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRCfJxI4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRCfJxI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49096C4CEE3;
	Sat, 17 May 2025 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747509085;
	bh=SNOwVK1Y2LypwvVxIgQyb4CvbacAABjnIU/eHeRg25g=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=iRCfJxI4KSPufPFqOJDn7Y1XbUdLmJLOuZEtfFtBB9+sD7FqaZxsA/5hWlIQVrRqj
	 jr6k51V0/8N+ElibXBUKP3xKMuCfceXaK2wqYA8vIl1HB3QWnsUkBSlWvsAoVRARDX
	 W5TvFVGFJBZUt0dJoazJbHXrzcGF4rCprpihj5ZkGm2XPugQDXBezQ8AhWXIBeKrwb
	 EqqTtO2iOFLZ/B4llC2Jn8NxeixHndU6GKoXEOVNhAHWv4O7NzC96t2yyZu1qU/U3f
	 LkuxJFd3pr32CNIzTeuScusmr81e6y5J9OlZssg6fpjUKS/NhvdDrnFDQoFejcyA60
	 SUE57/Eq8b4fg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2025 21:11:20 +0200
Message-Id: <D9YO9OZ5X83E.2DOL82V16Z8QK@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Sky" <sky@sky9.dev>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>
X-Mailer: aerc 0.20.1
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <D9VBVURZLSNT.4BTQQ8UCTGPJ@kernel.org>
 <19fc74f7-b292-404d-a48f-4dc3bcb5af3b@gmail.com>
In-Reply-To: <19fc74f7-b292-404d-a48f-4dc3bcb5af3b@gmail.com>

On Sat May 17, 2025 at 1:36 PM CEST, Christian Schrefl wrote:
> Hi Benno,
>
> On 13.05.25 10:51 PM, Benno Lossin wrote:
>> On Sun May 11, 2025 at 8:21 PM CEST, Christian Schrefl wrote:
>>> `UnsafePinned<T>` is useful for cases where a value might be shared wit=
h
>>> C code but not directly used by it. In particular this is added for
>>> storing additional data in the `MiscDeviceRegistration` which will be
>>> shared between `fops->open` and the containing struct.
>>>
>>> Similar to `Opaque` but guarantees that the value is always initialized
>>> and that the inner value is dropped when `UnsafePinned` is dropped.
>>>
>>> This was originally proposed for the IRQ abstractions [0] and is also
>>> useful for other where the inner data may be aliased, but is always
>>> valid and automatic `Drop` is desired.
>>>
>>> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sk=
y
>>> as a unstable feature, therefore this patch implements the subset of th=
e
>>> upstream API for the `UnsafePinned` type required for additional data i=
n
>>> `MiscDeviceRegistration` and in the implementation of the `Opaque` type=
.
>>>
>>> Some differences to the upstream type definition are required in the
>>> kernel implementation, because upstream type uses some compiler changes
>>> to opt out of certain optimizations, this is documented in the
>>> documentation and a comment on the `UnsafePinned` type.
>>>
>>> The documentation on is based on the upstream rust documentation with
>>> minor modifications for the kernel implementation.
>>>
>>> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH=
07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
>>> Link: https://github.com/rust-lang/rust/pull/137043 [1]
>>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>>> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
>>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>>> Co-developed-by: Sky <sky@sky9.dev>
>>> Signed-off-by: Sky <sky@sky9.dev>
>>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
>>=20
>> One nit below, with that fixed:
>>=20
>> Reviewed-by: Benno Lossin <lossin@kernel.org>
>>=20
>>> ---
>>>  rust/kernel/types.rs               |   6 ++
>>>  rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++=
++++++++
>>>  2 files changed, 117 insertions(+)
>>>
>>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>>> index 9d0471afc9648f2973235488b441eb109069adb1..705f420fdfbc4a576de1c45=
46578f2f04cdf615e 100644
>>> --- a/rust/kernel/types.rs
>>> +++ b/rust/kernel/types.rs
>>> @@ -578,3 +581,6 @@ pub enum Either<L, R> {
>>>  /// [`NotThreadSafe`]: type@NotThreadSafe
>>>  #[allow(non_upper_case_globals)]
>>>  pub const NotThreadSafe: NotThreadSafe =3D PhantomData;
>>> +
>>> +mod unsafe_pinned;
>>> +pub use unsafe_pinned::UnsafePinned;
>>=20
>> I would put `mod` to the top of the=20
>
> Your sentence was cut off, I assume you mean:
>
>> I would put `mod` to the top of the file.

Oh yeah sorry about that.

> I can do that, let me know if I should send a
> new version or if this will be fixed when applying.

I think Miguel can do this when picking the patch :)

---
Cheers,
Benno
