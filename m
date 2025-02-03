Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A92063CA;
	Mon,  3 Feb 2025 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592247; cv=none; b=aCwPvunngxZztGyHTgirVWRCQp7l/fjqF2LF2zNOmY1IQnaF55+ODhp9TGT/WsLRWJVTUbiRri3pTLmkszfUlpQJzQmQKbs7N65TA1ZXa1WLFK70twikvuPO1/NZ0YlqgvgVmiOAHm7rjAYRxU9IeZmctXwvJqqR7gum5vgCjuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592247; c=relaxed/simple;
	bh=AmGoZl5uDwcwLndFyztdoPMsH68hsq6tadtWQvGFhGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pARhvYEbZF0gEM+A1wUtg28Ns47c5F6DJrP7lyyDHdCZeIkiLhA4qWpxhreja+PhsIyr4utt6bREtBt8MsQq+JutO00CvSDUx/r7aPyYmxE4XYM8R7dQyB3sqlN/duu44UPfHGOQona3LK63N86AxpLU0AJLU4wJE6cIyUOn4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=Azvd4dao; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="Azvd4dao"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id E1E03434C6;
	Mon,  3 Feb 2025 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738592242;
	bh=AmGoZl5uDwcwLndFyztdoPMsH68hsq6tadtWQvGFhGE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Azvd4daotMO0D6BBbypa++H//1buV1K3m4rrFlo+0WeseC31eQRFmovi6PaTFnGQo
	 EOVnlONb+d3ypGuEFRrZMByQNLvY6vCo4MzVzEBN3OSbk6D8yRjxPynhZomgHwVogM
	 1oOYaqR/ZxkQS8NgK5B8WK88LLC4kxQyNo5d/ktUMIEvZUNDCw9bMcvX2j9XXLX9bV
	 I9b339HgVjBkHVAm9AEHmqkyqzZYpiqTpaGg7EAxrvrmCyq6Pv+KB/sTZaTNEs6nb9
	 prFrfS6Qu567MGDJDw/IHNyEcfzpNd3YO28D/38QNOyozsCzJ2OHOQazZ1FG4b8T3f
	 uhlkcsN5hm48w==
Message-ID: <def0ac4e-6ec3-4f91-a3e6-02ce931c46f3@asahilina.net>
Date: Mon, 3 Feb 2025 23:17:20 +0900
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
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <CAH5fLggscATtCgQwCYSms77oSFOMkjTscRDqAOZsSgoHsOoPQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/3/25 6:13 PM, Alice Ryhl wrote:
> On Sun, Feb 2, 2025 at 2:06 PM Asahi Lina <lina@asahilina.net> wrote:
>>
>> By analogy to AlwaysRefCounted and ARef, an Ownable type is a (typically
>> C FFI) type that *may* be owned by Rust, but need not be. Unlike
>> AlwaysRefCounted, this mechanism expects the reference to be unique
>> within Rust, and does not allow cloning.
>>
>> Conceptually, this is similar to a KBox<T>, except that it delegates
>> resource management to the T instead of using a generic allocator.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
> 
> Overall LGTM.
> 
>> +/// A subtrait of Ownable that asserts that an `Owned<T>` Rust reference is not only unique
>> +/// within Rust and keeps the `T` alive, but also guarantees that the C code follows the
>> +/// usual mutable reference requirements. That is, the kernel will never mutate the
>> +/// `T` (excluding internal mutability that follows the usual rules) while Rust owns it.
>> +///
>> +/// When this type is implemented for an [`Ownable`] type, it allows `Owned<T>` to be
>> +/// dereferenced into a &mut T.
>> +///
>> +/// # Safety
>> +///
>> +/// Implementers must ensure that the kernel never mutates the underlying type while
>> +/// Rust owns it.
>> +pub unsafe trait OwnableMut: Ownable {}
> 
> Giving out mutable references allows users to call core::mem::swap on
> the object. We must require that this is allowed.

Hmm, yeah. I don't use this yet, and I'm not sure if it makes much sense
with that caveat. I'll drop it for v2.

> 
>> +impl<T: Ownable> Owned<T> {
>> +    /// Creates a new instance of [`Owned`].
>> +    ///
>> +    /// It takes over ownership of the underlying object.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must ensure that the underlying object is acquired and can be considered owned by
>> +    /// Rust.
>> +    pub(crate) unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>> +        // INVARIANT: The safety requirements guarantee that the new instance now owns the
>> +        // reference.
>> +        Self {
>> +            ptr,
>> +            _p: PhantomData,
>> +        }
>> +    }
>> +
>> +    /// Consumes the `Owned`, returning a raw pointer.
>> +    ///
>> +    /// This function does not actually relinquish ownership of the object.
>> +    /// After calling this function, the caller is responsible for ownership previously managed
>> +    /// by the `Owned`.
>> +    #[allow(dead_code)]
>> +    pub(crate) fn into_raw(me: Self) -> NonNull<T> {
> 
> I would just make these methods public, like the ARef ones. Then you
> can drop the #[allow(dead_code)] annotation.

Does it make sense to ever have drivers doing this? I feel like these
methods should be limited to the kernel crate.

~~ Lina

