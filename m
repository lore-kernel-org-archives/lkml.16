Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B29320F098;
	Mon,  3 Feb 2025 19:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610266; cv=none; b=W9n4O5n4QOrQvfPcVrU0fx4JVxHGA56YE4fwWLYJkMRVtVGfjv2TEDAURXbfSG1Cr558yu+Sirej2llUwDhvi1DowUsEcB/mcjBpmBTphlBSWxRs/7I6PJk6j7rZLxAjv4sVQqTeyPISXUErzNoPyBp97ZzIZiz34dN1R2l/oZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610266; c=relaxed/simple;
	bh=LT2/Yf1z+TNQiO+U9g+rhfC5zMEZaRWAdxzwNtxlZUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmTVJt5z2Jw4ARA16HLWJV7rlKT1KBvmt3z1h5yANuIVw1QLDsiKimMz/1dMYXLl0h7CuIY+BZib/zKqzDrKiqFSLehcmA8Dwccvy/sf2oSXa0VzoP3nFLx8EpXHxZFfm2bGsxGlJSfv4xfYhAryH7mA/s/SY3+mkKd9SIKpJko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=uOa6ofKd; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="uOa6ofKd"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id EC6FC41F5F;
	Mon,  3 Feb 2025 19:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738610260;
	bh=LT2/Yf1z+TNQiO+U9g+rhfC5zMEZaRWAdxzwNtxlZUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=uOa6ofKd9OXGhMAmfr+cL5LXLbYuCNtr7M/fb0HciWv+6du9svov8+Q/4q0PxH1FA
	 732VjRIbeyWXzD3oNEY32AbpHvgG3NlIZtARoJ/ZB23cV05717kBH4UDAVnYokFPnm
	 gHbjsFhX9nlPpESZdzz3uGuTNcT08YHTkioU0Ew7h14FyJQ5ovjAQKoQK9+9LygWBO
	 G0JEhSH930JJYiaMbSHtxiiY6uJIuqY954KQ/+XRw3AeHGVcjZaUsfX62VoDYYU8ga
	 im1iw7VBD3GrzQPXJ+5HjM2k216I6JLtbWLxEveCAeIEAC5WXWXAbUVQaR05QqJ7UW
	 4DxHyV1RE63pA==
Message-ID: <585deb4e-3d05-488b-80dd-df64a6983d85@asahilina.net>
Date: Tue, 4 Feb 2025 04:17:38 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] rust: types: Add Ownable/Owned types
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net>
 <CAH5fLggscATtCgQwCYSms77oSFOMkjTscRDqAOZsSgoHsOoPQw@mail.gmail.com>
 <def0ac4e-6ec3-4f91-a3e6-02ce931c46f3@asahilina.net>
 <CAH5fLggcT0_e3EsBppxsGfxaqvs6rTkbbRvrFEHthEff5s1x0g@mail.gmail.com>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <CAH5fLggcT0_e3EsBppxsGfxaqvs6rTkbbRvrFEHthEff5s1x0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/4/25 3:17 AM, Alice Ryhl wrote:
> On Mon, Feb 3, 2025 at 3:17 PM Asahi Lina <lina@asahilina.net> wrote:
>>
>>
>>
>> On 2/3/25 6:13 PM, Alice Ryhl wrote:
>>> On Sun, Feb 2, 2025 at 2:06 PM Asahi Lina <lina@asahilina.net> wrote:
>>>> +    /// Consumes the `Owned`, returning a raw pointer.
>>>> +    ///
>>>> +    /// This function does not actually relinquish ownership of the object.
>>>> +    /// After calling this function, the caller is responsible for ownership previously managed
>>>> +    /// by the `Owned`.
>>>> +    #[allow(dead_code)]
>>>> +    pub(crate) fn into_raw(me: Self) -> NonNull<T> {
>>>
>>> I would just make these methods public, like the ARef ones. Then you
>>> can drop the #[allow(dead_code)] annotation.
>>
>> Does it make sense to ever have drivers doing this? I feel like these
>> methods should be limited to the kernel crate.
> 
> Not having drivers use this is the ideal, but I don't think we should
> always expect it to be possible. The Binder driver has a C component
> for the binderfs component, and it also has some code that's
> essentially an abstraction inside the driver that I was asked to move
> into Binder because it's so specific to Binder that it's not useful
> for anyone else.

That's fair, I'll make it pub.

~~ Lina

