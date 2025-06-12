Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FCF17A2EA;
	Thu, 12 Jun 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726652; cv=none; b=Bi9zFm7uZla1dPSWviB2HASddwAXSkn6tZJpPHDt2pW2/eO3imsJ3YtRphlWZB7/TV+TixG1xpqbCkanPtkZw9jytYut/0ZBeM+N+h7TDAtmU7ivml/sPfg0eulnJtfMLem1WYcPSkAJbmA20u9HQWi6CcDOdFJaHnGuW6zEKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726652; c=relaxed/simple;
	bh=KOsYsfHPzJUa01W4Ouw+7CCGtCRvFtwxmvmgsXHNiaw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=iLy99jjLRYaXeHEcZkopYlQWT9Y6Pbyjl0Ei5OkzjMP4RXcC06eSPasufqrg+li5oCwi6RvDJpm5OzXzzkb90eLDcIMzcSw2lXFbdNCQfIbaoq8A7GMcrNfu8OwUa3zf4hf/rfUKZD5LhXdDFhwgPC7yQlk3pAywA+5zfbVmInk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr6J8A1I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr6J8A1I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867C6C4CEED;
	Thu, 12 Jun 2025 11:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749726652;
	bh=KOsYsfHPzJUa01W4Ouw+7CCGtCRvFtwxmvmgsXHNiaw=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=gr6J8A1I+Dxj5CkYzHtj1Ftyd5kY+Wb7p/XBZtdOwnozGEVsMia7fIGsm577/dD6c
	 gT+v+MAnAl1YRAuCO+uprc3Ip5GevSCD3fdy1MH8yLt7qRVvpU8IUuR5H7In2XoNIV
	 Fpojgv9osfgcqnhTgYPa+sC//cdety58sOOFnD6N4ubPNUFcZjijLCd8k7n4df9JbU
	 e4Xf2vuFRCm6ezspk6nsdWyU/TybGh2hHF38bRe6jg9fQIkiZ7uIezqWTNv0B8wz+h
	 c+oVqNy5WPv9kRexn3u8P7UDEn1uJfJnGJIGcUb0zcbx9TiA1PsAA40nJscmRl0H6j
	 9e/pUF+ekFi7A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 13:10:48 +0200
Message-Id: <DAKIBXCX5OZ1.2ACJKVK1K4TER@kernel.org>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: math: Add KernelMathExt trait with a mul_div
 helper
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <CGME20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9@eucas1p2.samsung.com> <20250609-math-rust-v1-v1-1-285fac00031f@samsung.com> <DAICPWRW9TCE.356EEFQOHYWFN@kernel.org> <86f1ca2b-ccd1-4470-a05d-47497f3bf2f5@samsung.com>
In-Reply-To: <86f1ca2b-ccd1-4470-a05d-47497f3bf2f5@samsung.com>

On Thu Jun 12, 2025 at 1:00 PM CEST, Michal Wilczynski wrote:
> On 6/10/25 00:21, Benno Lossin wrote:
>> On Mon Jun 9, 2025 at 11:53 PM CEST, Michal Wilczynski wrote:
>>> +    /// * None if the divisor is zero.
>>> +    fn mul_div(self, multiplier: Self, divisor: Self) -> Option<Self>;
>>> +}
>>> +
>>> +impl KernelMathExt for u64 {
>>=20
>> Can you also implement this for the other types that have a
>> `mul_..._div` function in the kernel?
>
> +Uwe
>
> Hi Benno,
>
> Thank you for the review and feedback on the patch.
>
> Regarding your suggestion to implement the trait for other types, I've
> taken a closer look at the existing kernel helpers (e.g., in
> lib/math/div64.c). My finding is that while some signed division helpers
> exist, there don't appear to be standard, exported mul_sX_sX_div_sX
> functions that are direct equivalents of the u64 version. This makes the
> generic trait idea less broadly applicable than I initially hoped.
>
> Furthermore, a more significant issue has come to my attention regarding
> the u64 C function itself. The x86-specific static inline implementation
> uses assembly that triggers a #DE (Divide Error) exception if the final
> quotient overflows the 64-bit result. This would lead to a kernel panic.
>
> /*
>  * Will generate an #DE when the result doesn't fit u64, could fix with a=
n
>  * __ex_table[] entry when it becomes an issue.
>  */
> static inline u64 mul_u64_u64_div_u64(...)
>
> Given that a direct FFI binding would expose this potentially panicking
> behavior to safe Rust, I am now reconsidering if binding this function
> is the right approach.
>
> Perhaps this should be handled in pure Rust. For my specific case with
> the PWM driver, it's likely that a simple checked_mul would be
> sufficient. In practice, many drivers use this function for calculations
> like the following, where one of the multiplicands is not a full 64-bit
> value:
> wf->duty_offset_ns =3D DIV64_U64_ROUND_UP((u64)wfhw->duty_offset_cnt * NS=
EC_PER_SEC,
>                                         ddata->clk_rate_hz);
>
> In this common pattern, the intermediate multiplication often does not
> risk overflowing a u64. Using checked_mul would be completely safe and
> avoid the FFI complexity and the overflow risk entirely.
>
> Given these points, do you still think pursuing the general-purpose
> KernelMathExt trait via an FFI wrapper is the desired direction? Or
> would you prefer that I pivot to a simpler, safer, pure-Rust approach
> using checked_mul directly within the PWM driver where it is needed?

My understanding was that your use-case required the multiplication &
division operation to work even if `a * b` would overflow and only the
division by `c` would bring it back into u64 range. If you don't need
that, then I would just use `checked_mul` as it is much simpler.

We can always reintroduce a `KernelMathExt` trait later when the need
arises.

---
Cheers,
Benno
