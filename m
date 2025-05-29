Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0208F193062;
	Thu, 29 May 2025 15:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748532722; cv=none; b=OVJAiyu+XxvE9yQb/kit5ZKiO+z04RK/fCgB59A4TRdTSvKp0JFamXcCh0cwR1vB0ev0tW1Ixj2up/2f/VAFKq+dmgHsJM8enIt30nLKdM3RGC8EmzKkAiI7rjvYYFw0AAPUz0HcoZRUewPudHaMCsmHRv03HNLmRY6ez3wqhzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748532722; c=relaxed/simple;
	bh=JnQAvMylwZtpa5EhFORjb44aBv934LT+uOUV5qfL2yI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZtXWp9gM3+33I5K0NKVZ3gQzgvVGfNE8i2I3DT9VF8vIHLjAcoiyavyYrmp5pKaz94TjUYdboERH0mYfy2go8vAVHTJ7duN/fmlDcoDvuLYqyCYLskqF/9XXHh9ZHIPkEDxlf5525aqBF+XDyWZJhwBK0PYgq3hkwojlLBmzm5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L965RAaj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L965RAaj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA78C4CEE7;
	Thu, 29 May 2025 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748532721;
	bh=JnQAvMylwZtpa5EhFORjb44aBv934LT+uOUV5qfL2yI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=L965RAajIHrP4rROHeGuafOkcSpLL9JC4sooqbPYk/mwzfkB5b3ezUIkg2PA5aWBF
	 ASfy1AG6kbEOvY5suuTkn44TaNrVr+vyVf7V04Hsctz642dQag3yL3Xql5IblVFGid
	 Bglm96yBQhgL11YrkNp49+IKJcUNUDwg4WBLnPXPwqZ6i5dfE5fdtvnU97nZl4D4QF
	 XSRxfUTgMZdJLzJbZCPS8ISvsedUwa75BAlAzAUfEhya3rs3Uwhm6YJve1OvgfpCng
	 cJWE4d0RynExFQc6JlAM3hsIctZAPStZ7o+fd84lw37/jA34+mZf4kjbdNi47p0aq9
	 CLiqJIcLcHx/w==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 17:31:57 +0200
Message-Id: <DA8R4900CNVG.1IMAV3SFPFS0B@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] rust: check type of `$ptr` in `container_of!`
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
In-Reply-To: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>

On Thu May 29, 2025 at 3:11 PM CEST, Tamir Duberstein wrote:
> Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.
> Rename those placeholders for clarity.
>
> Given the incorrect usage:
>
>> diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
>> index 8d978c896747..6a7089149878 100644
>> --- a/rust/kernel/rbtree.rs
>> +++ b/rust/kernel/rbtree.rs
>> @@ -329,7 +329,7 @@ fn raw_entry(&mut self, key: &K) -> RawEntry<'_, K, =
V> {
>>          while !(*child_field_of_parent).is_null() {
>>              let curr =3D *child_field_of_parent;
>>              // SAFETY: All links fields we create are in a `Node<K, V>`=
.
>> -            let node =3D unsafe { container_of!(curr, Node<K, V>, links=
) };
>> +            let node =3D unsafe { container_of!(curr, Node<K, V>, key) =
};
>>
>>              // SAFETY: `node` is a non-null node so it is valid by the =
type invariants.
>>              match key.cmp(unsafe { &(*node).key }) {
>
> this patch produces the compilation error:
>
>> error[E0308]: mismatched types
>>    --> rust/kernel/lib.rs:220:45
>>     |
>> 220 |         $crate::assert_same_type(field_ptr, (&raw const (*containe=
r_ptr).$($fields)*).cast_mut());
>>     |         ------------------------ ---------  ^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut rb_node`, found `*mut K`
>>     |         |                        |
>>     |         |                        expected all arguments to be this=
 `*mut bindings::rb_node` type because they need to match the type of this =
parameter
>>     |         arguments to this function are incorrect
>>     |
>>    ::: rust/kernel/rbtree.rs:270:6
>>     |
>> 270 | impl<K, V> RBTree<K, V>
>>     |      - found this type parameter
>> ...
>> 332 |             let node =3D unsafe { container_of!(curr, Node<K, V>, =
key) };
>>     |                                 ----------------------------------=
-- in this macro invocation
>>     |
>>     =3D note: expected raw pointer `*mut bindings::rb_node`
>>                found raw pointer `*mut K`
>> note: function defined here
>>    --> rust/kernel/lib.rs:227:8
>>     |
>> 227 | pub fn assert_same_type<T>(_: T, _: T) {}
>>     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to matc=
h the `*mut bindings::rb_node` type of parameter #1
>>     |                         |  |
>>     |                         |  parameter #2 needs to match the `*mut b=
indings::rb_node` type of this parameter
>>     |                         parameter #1 and parameter #2 both referen=
ce this parameter `T`
>>     =3D note: this error originates in the macro `container_of` (in Nigh=
tly builds, run with -Z macro-backtrace for more info)

In the future we could make this a proc-macro and improve the error
message by creating the function inline and setting the spans for the
parameter of the function to the spans coming from the input.

> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wB=
uGPYh9ZTAiww@mail.gmail.com/
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
> Changes in v4:
> - Revert back to v1 with assert_same_type extracted out of the macro. (Mi=
guel Ojeda)
> - Drop Benno's RB since the implementation changed.
> - Rebase on rust-next.
> - Link to v3: https://lore.kernel.org/r/20250423-b4-container-of-type-che=
ck-v3-1-7994c56cf359@gmail.com
>
> Changes in v3:
> - Fix comment typo.
> - s/^;/   / in commit message and cover letter. (Miguel Ojeda)
> - Evaluate $ptr only once. (Alice Ryhl)
> - Link to v2: https://lore.kernel.org/r/20250412-b4-container-of-type-che=
ck-v2-1-f3cc9934c160@gmail.com
>
> Changes in v2:
> - Wrap in `if false` to improve unoptimized codegen. (Alice Ryhl)
> - Shrink implementation using an array literal instead of a function.
> - Link to v1: https://lore.kernel.org/r/20250411-b4-container-of-type-che=
ck-v1-1-08262ef67c95@gmail.com
> ---
>  rust/kernel/lib.rs | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
