Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E6F22ACF3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726026; cv=none; b=GVKe+DMnmEoBM1UtSP9Cc/N6gfMZ7OEGZiang7pZG0R4TR+zVMKXYKp2Lb+e1RSx6CiJjkr+5WG/0rHchwQGb83+fTmjKWKgwCwN39d5zpoRZMhwv5qlKCcK6caU2qzwAUxCKDvILK6lwGWDfwF72EPG+gyaulkYwRaaigq0vKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726026; c=relaxed/simple;
	bh=lZHxxBFYZ4hnqLHWM881py/RXYAQZs4DlXkSIdhLSeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=oi6HkIvU+w1p2T8YSxKHlijA4EAjJPOcwNu6Mcns64KxezOEeKKOCq5m8TT2F1dJ8AR6Zekx2JspZCIhDaX89mecXrHfPIv4Q33RSjg9JANZ3HBkshOvfwqUL+3edEBgBsVmv/pZ6mHhIdYjrO0qVhSOAvqOOHYgNQATYgvip2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IiPL8m8V; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IiPL8m8V"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250612110017euoutp02af335e632aed0206ee7003bc98aa7792~IRorleOuc0610406104euoutp02f
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:00:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250612110017euoutp02af335e632aed0206ee7003bc98aa7792~IRorleOuc0610406104euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749726017;
	bh=YZp5j+VVZgShQmputK7BZE45uUiLt73KODBpqGcmQiY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=IiPL8m8VETqD9Le1RoMBF0MXgyUfFtrDcXWcHKzCz1/FOvJk6A1rx5Nt9yjMOSb2M
	 lm8F9vPyrLV9fIoJwT9kKzuoRZzQAgCLyx4+vvJlz5HeVTUDuDVMN6dQrKdGQc1QGA
	 pOIlHkPWzLcPVVG2H2BQWuEX9gFedUNai305uJLA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250612110016eucas1p25af8299c2a6d42b24f6a8b896185a3c8~IRorAQYp50989309893eucas1p2G;
	Thu, 12 Jun 2025 11:00:16 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250612110016eusmtip1cc92edb82f73467de73439b4c35caf47~IRoqZBr_z2315623156eusmtip1D;
	Thu, 12 Jun 2025 11:00:16 +0000 (GMT)
Message-ID: <86f1ca2b-ccd1-4470-a05d-47497f3bf2f5@samsung.com>
Date: Thu, 12 Jun 2025 13:00:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: math: Add KernelMathExt trait with a mul_div
 helper
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex
	Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
	Krummrich <dakr@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <DAICPWRW9TCE.356EEFQOHYWFN@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250612110016eucas1p25af8299c2a6d42b24f6a8b896185a3c8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9
X-EPHeader: CA
X-CMS-RootMailID: 20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9
References: <CGME20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9@eucas1p2.samsung.com>
	<20250609-math-rust-v1-v1-1-285fac00031f@samsung.com>
	<DAICPWRW9TCE.356EEFQOHYWFN@kernel.org>



On 6/10/25 00:21, Benno Lossin wrote:
> On Mon Jun 9, 2025 at 11:53 PM CEST, Michal Wilczynski wrote:
>> The PWM subsystem and other kernel modules often need to perform a
>> 64 by 64-bit multiplication followed by a 64-bit division. Performing
>> this naively in Rust risks overflow on the intermediate multiplication.
>> The kernel provides the C helper 'mul_u64_u64_div_u64' for this exact
>> purpose.
>>
>> Introduce a safe Rust wrapper for this function to make it available to
>> Rust drivers.
>>
>> Following feedback from the mailing list [1], this functionality is
> 
> You could turn this into a `Suggested-by`.
> 
>> provided via a 'KernelMathExt' extension trait. This allows for
>> idiomatic, method style calls (e.g. val.mul_div()) and provides a
>> scalable pattern for adding helpers for other integer types in the
>> future.
>>
>> The safe wrapper is named 'mul_div' and not 'mul_u64_u64_div_u64' [2]
>> because its behavior differs from the underlying C function. The C
>> helper traps on a division by zero, whereas this safe wrapper returns
>> `None`, thus exhibiting different and safer behavior.
>>
>> This is required for the Rust PWM TH1520 driver [3].
>>
>> [1] - https://lore.kernel.org/all/DAFQ19RBBSQL.3OGUXOQ0PA9YH@kernel.org/
>> [2] - https://lore.kernel.org/all/CANiq72kVvLogBSVKz0eRg6V4LDB1z7b-6y1WPLSQfXXLW7X3cw@mail.gmail.com/
>> [3] - https://lore.kernel.org/all/20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com/
> 
> Please use the `Link: https://... [.]` format.
> 
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  rust/kernel/lib.rs  |  1 +
>>  rust/kernel/math.rs | 34 ++++++++++++++++++++++++++++++++++
>>  2 files changed, 35 insertions(+)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 6b4774b2b1c37f4da1866e993be6230bc6715841..d652c92633b82525f37e5cd8a040d268e0c191d1 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -85,6 +85,7 @@
>>  #[cfg(CONFIG_KUNIT)]
>>  pub mod kunit;
>>  pub mod list;
>> +pub mod math;
>>  pub mod miscdevice;
>>  pub mod mm;
>>  #[cfg(CONFIG_NET)]
>> diff --git a/rust/kernel/math.rs b/rust/kernel/math.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b89e23f9266117dcf96561fbf13b1c66a4851b48
>> --- /dev/null
>> +++ b/rust/kernel/math.rs
>> @@ -0,0 +1,34 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2025 Samsung Electronics Co., Ltd.
>> +// Author: Michal Wilczynski <m.wilczynski@samsung.com>
>> +
>> +//! Safe wrappers for kernel math helpers.
> 
> I wouldn't stress the fact that these are safe, they better be!
> 
>> +//!
>> +//! This module provides safe, idiomatic Rust wrappers for C functions, whose
>> +//! FFI bindings are auto-generated in the `bindings` crate.
>> +
>> +use crate::bindings;
>> +
>> +/// An extension trait that provides access to kernel math helpers on primitive integer types.
>> +pub trait KernelMathExt: Sized {
> 
> We should add this trait to the prelude.
> 
>> +    /// Multiplies self by `multiplier and divides by divisor.
>> +    ///
>> +    /// This wrapper around the kernel's `mul_u64_u64_div_u64` C helper ensures that no
> 
> The trait shouldn't make a reference to `u64`.
> 
>> +    /// overflow occurs during the intermediate multiplication.
>> +    ///
>> +    /// # Returns
>> +    /// * Some(result) if the division is successful.
> 
> Use backtics (`) for code in documentation and comments.
> 
>> +    /// * None if the divisor is zero.
>> +    fn mul_div(self, multiplier: Self, divisor: Self) -> Option<Self>;
>> +}
>> +
>> +impl KernelMathExt for u64 {
> 
> Can you also implement this for the other types that have a
> `mul_..._div` function in the kernel?

+Uwe

Hi Benno,

Thank you for the review and feedback on the patch.

Regarding your suggestion to implement the trait for other types, I've
taken a closer look at the existing kernel helpers (e.g., in
lib/math/div64.c). My finding is that while some signed division helpers
exist, there don't appear to be standard, exported mul_sX_sX_div_sX
functions that are direct equivalents of the u64 version. This makes the
generic trait idea less broadly applicable than I initially hoped.

Furthermore, a more significant issue has come to my attention regarding
the u64 C function itself. The x86-specific static inline implementation
uses assembly that triggers a #DE (Divide Error) exception if the final
quotient overflows the 64-bit result. This would lead to a kernel panic.

/*
 * Will generate an #DE when the result doesn't fit u64, could fix with an
 * __ex_table[] entry when it becomes an issue.
 */
static inline u64 mul_u64_u64_div_u64(...)

Given that a direct FFI binding would expose this potentially panicking
behavior to safe Rust, I am now reconsidering if binding this function
is the right approach.

Perhaps this should be handled in pure Rust. For my specific case with
the PWM driver, it's likely that a simple checked_mul would be
sufficient. In practice, many drivers use this function for calculations
like the following, where one of the multiplicands is not a full 64-bit
value:
wf->duty_offset_ns = DIV64_U64_ROUND_UP((u64)wfhw->duty_offset_cnt * NSEC_PER_SEC,
                                        ddata->clk_rate_hz);

In this common pattern, the intermediate multiplication often does not
risk overflowing a u64. Using checked_mul would be completely safe and
avoid the FFI complexity and the overflow risk entirely.

Given these points, do you still think pursuing the general-purpose
KernelMathExt trait via an FFI wrapper is the desired direction? Or
would you prefer that I pivot to a simpler, safer, pure-Rust approach
using checked_mul directly within the PWM driver where it is needed?

> 
>> +    fn mul_div(self, multiplier: u64, divisor: u64) -> Option<u64> {
>> +        if divisor == 0 {
>> +            return None;
>> +        }
>> +        // SAFETY: The C function `mul_u64_u64_div_u64` is safe to call because the divisor
>> +        // is guaranteed to be non-zero. The FFI bindings use `u64`, matching our types.
> 
> Let's not talk about "safe to call", but rather say it like this:
> 
>     // SAFETY: `mul_u64_u64_div_u64` requires the divisor to be non-zero
>     // which is checked above. It has no other requirements.
> 
> ---
> Cheers,
> Benno
> 
>> +        Some(unsafe { bindings::mul_u64_u64_div_u64(self, multiplier, divisor) })
>> +    }
>> +}
>>
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250609-math-rust-v1-d3989515e32e
>>
>> Best regards,
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
