Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23321AD51;
	Tue,  3 Jun 2025 23:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991735; cv=none; b=LACvMsAWBaVRFmkVgqDBFTONccxMI9LXew44m6WZ00ox4roR1We+6ljr/AC1fPpSXQb0cF1hfvE+LKrpFCg11fQV3WYbJkm9lGWJsQ1YTLh4OoY388zkFbRMP04c/8044dOoJVeC5etxy2aTPvkKVATgtS+OYfjlmZKtMbbQ6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991735; c=relaxed/simple;
	bh=wA9HkPQG67Xv/ILlkMs87n47KUYJA9nWUAoT/yrb1ik=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hZKQuh4uHmi+ueSAAlMH/unfLQYOF4zOgqskYLw7IWQukVWWnRnCQg4azhtDgjtb58YyFZr/KC9mgaaiAFp6PF0lP7PfLDY/icCFZ5yAMPKl4kSiHi4i4uyc6vqS1JEz1Ic8ZBnPTWybWXxeO47XeKjCs1Bitat8MejUUqrA3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+Zu0IAs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+Zu0IAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9208C4CEED;
	Tue,  3 Jun 2025 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748991734;
	bh=wA9HkPQG67Xv/ILlkMs87n47KUYJA9nWUAoT/yrb1ik=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=M+Zu0IAsKgu/xv3rmVmunAByeBtBNqrDRm4YMs0PLMJU1tlGX5STA//XeAct7TWA1
	 AMMULlpmnGGnh9CzoEsntXgeYNNhTYsfzgvreTYQlwvEbp9gttaO3PSjgYLz98T/Gn
	 ckGU38Nnb6SklnFXHcdCpoO3VOEPVsgBmI/eNeZmSlolUL+ZJIiTdD2aM3JUbySNFj
	 9lvU6ke80KCl8oeMhf+3/cKRwSW2TH1e+sW0w/5CRoAs2FFhC4PKPABFJ8Dx96IbML
	 sDM0j77a4liPSzH86gRSiHoqjwM0V1xDiIwjIBXXZU43Q9gaZ8kixvtiF2/fts2WfT
	 JXGOgYt1GzYOg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 01:02:08 +0200
Message-Id: <DAD9TNUBUGPN.1ED519FYR29U4@kernel.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
 <DAC2L6ZKR6U2.WOMERUJIOENK@nvidia.com>
In-Reply-To: <DAC2L6ZKR6U2.WOMERUJIOENK@nvidia.com>

On Mon Jun 2, 2025 at 3:09 PM CEST, Alexandre Courbot wrote:
> On Thu May 29, 2025 at 4:27 PM JST, Benno Lossin wrote:
>> On Thu May 29, 2025 at 3:18 AM CEST, Alexandre Courbot wrote:
>>> On Thu May 29, 2025 at 5:17 AM JST, Benno Lossin wrote:
>>>> On Wed May 21, 2025 at 8:44 AM CEST, Alexandre Courbot wrote:
>>>>> +    /// Align `self` up to `alignment`.
>>>>> +    ///
>>>>> +    /// `alignment` must be a power of 2 for accurate results.
>>>>> +    ///
>>>>> +    /// Wraps around to `0` if the requested alignment pushes the re=
sult above the type's limits.
>>>>> +    ///
>>>>> +    /// # Examples
>>>>> +    ///
>>>>> +    /// ```
>>>>> +    /// use kernel::num::NumExt;
>>>>> +    ///
>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
>>>>> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
>>>>> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
>>>>> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
>>>>> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
>>>>> +    /// ```
>>>>> +    fn align_up(self, alignment: Self) -> Self;
>>>>
>>>> Isn't this `next_multiple_of` [1] (it also allows non power of 2
>>>> inputs).
>>>>
>>>> [1]: https://doc.rust-lang.org/std/primitive.u32.html#method.next_mult=
iple_of
>>>
>>> It is, however the fact that `next_multiple_of` works with non powers o=
f
>>> two also means it needs to perform a modulo operation. That operation
>>> might well be optimized away by the compiler, but ACAICT we have no way
>>> of proving it will always be the case, hence the always-optimal
>>> implementation here.
>>
>> When you use a power of 2 constant, then I'm very sure that it will get
>> optimized [1]. Even with non-powers of 2, you don't get a division [2].
>> If you find some code that is not optimized, then sure add a custom
>> function.
>>
>> [1]: https://godbolt.org/z/57M9e36T3
>> [2]: https://godbolt.org/z/9P4P8zExh
>
> That's impressive and would definitely work well with a constant. But
> when the value is not known at compile-time, the division does occur
> unfortunately: https://godbolt.org/z/WK1bPMeEx
>
> So I think we will still need a kernel-optimized version of these
> alignment functions.

Hmm what exactly is the use-case for a variable align amount? Could you
store it in const generics?

If not, there are also these two variants that are more efficient:

* option: https://godbolt.org/z/ecnb19zaM
* unsafe: https://godbolt.org/z/EqTaGov71

So if the compiler can infer it from context it still optimizes it :)

But yeah to be extra sure, you need your version. By the way, what
happens if `align` is not a power of 2 in your version?

>>> Also in the kernel we tend to use the `align` nomenclature and I think =
we
>>> should preserve that for clarity.
>>
>> That's also fair, but we lose the constness of `next_multiple_of`, so
>> you can't use `align_up` in a const function. That might confuse people
>> and then they write their own const helper function... I'd prefer we use
>> all functions that are available in the stdlib.
>
> We definitely want const variants of these, one way or the other (const
> methods in traits are not available yet unfortunately). And yes, on
> principle I am aligned (haha) with using stdlib functions when possible.

Then I'd recommend getting in touch with upstream Rust :) And choose
rusty names for our trait so we have an easy switch.

---
Cheers,
Benno
