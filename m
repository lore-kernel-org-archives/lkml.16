Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDCD22D7AD;
	Fri, 16 May 2025 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381937; cv=none; b=OI+pJGcYcw5aKwPZfG2dpqCdtPx+aZEZY4Rx0lu2T95CPOjWcb/4r729DXLoeVSqmHMaTuxHOOHiUiK3i5eO9IH8ImWaurHrH+DfBJmkcLoqBzUQre4qw7BG3YNNBDCzdSGtEu245tTEWoiW0MxNsj5ixSpyUeCkciKrM5ViSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381937; c=relaxed/simple;
	bh=gGhKxd4MfJ8gSyOxkV9cgiFXqIbGm6a2vqq6gJUGHy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1MeaaukPk6vVMVQsQCIqS41kHRJMwlFo8qS3gs41TGaSJ46epKF62tEpgwN22n9K+aJhnCry6AZfXz0AMgTcIAYkhLNGXJicEI5iHJ4arr+ocdmVjljoWzHomEVCvdu2Rx5zVFGSsW5Q61ge7IX0tJqRxBPkT1NC3TECeachdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4UX3TkG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4UX3TkG"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e7967cf67so1894506e87.0;
        Fri, 16 May 2025 00:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747381933; x=1747986733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyhhlTCQC+PpXTytpRM3Qb4SBbdAcsxAzz/OOOJadJM=;
        b=U4UX3TkG27OP3z6mydY/2ZwWN/H9KWJ+0pDhcg5lxDZIk/uJu0yPZTE1Abw4pSkPgO
         EOph1zW2xqMkM7cY9RB362yUNVjNaP1hP1i+CxMGAoCNM2zg05+I760DhdXg5pBaFyd4
         zowFXcDUWsaAF0qyKgV7oxmD41iMljHYDQyvZU3nkJEtGHgjuafultLAkZq7B+0FQGq3
         mo83OrtD6cIqMNF8QYfBHK45wXSMpZyXl/lXQl8pxFvTK/Jysy5P5d4dVmFQ9C/EPSwi
         ZYfTiCsOwS9NCuLLcAz4GWhkURbsEKsAWGy2pvYuNFD4YtMkBC/IZYy3p0z2tqqOJWK9
         t0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747381933; x=1747986733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyhhlTCQC+PpXTytpRM3Qb4SBbdAcsxAzz/OOOJadJM=;
        b=OUqs+X+gvlNKxwGa3xrkbs1oJO0/j8ZeZ3l/Q0uob0XCVAAx8COG+Uri7HvESnIa0Y
         OmA9Oant57knqwiuFlDzVUxb6XZQxoop2H154XO4cdH5v1YAV/tbUf49riV0dFZ3+Bel
         ic36uksL/JFCWxlTbdV8PwD3nh2gpx5JsxKJ/NfNCntQscaU5eZxQnrAhIJOylPdJlGY
         oCielo1nhLFDLEvlQsm/t0ymWwo7/+ZXdsOMPRWpDgyXgcvsG+Wv+Xmdlen5yJtJ6R5O
         EIEpK3+JXlRPZsrLpa8bYzGS5i99+DJZAR4iPKI+OhR4z+5qQM6EleEaFkSxz5a5qGpm
         ZNxw==
X-Forwarded-Encrypted: i=1; AJvYcCUPl/Na+k5RbaSeuyWWWoBC/ziKA6iLQ67PjcuNqCuVk7EAh5EAdy+MOd/tEkCJc0wnWdkcoWUhebFurxc=@vger.kernel.org, AJvYcCUmJLiSU43TLgsUJFDt3tTp1ojboNjL6llI0jMrlfSrig7NKsIlJkUl2ohomfeh6FA+8lcGrBkLZZqJvBV8iLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50mwtfDXtl71S3h+7Dq0EnxcSbLnUF8SVyyFtYXk/9C3DrxoE
	KKPpW8EF2AZrIf/yC8cwrDthrCKPoTtNa3EE5IF+Js2bdWK6pPiF4WTB
X-Gm-Gg: ASbGncuYUd1seEi/7Vktm0034fLJIx27tgdP5HbJ3ZY6flRPenH03u+hYjt8aUpZprA
	zsmMPKXD8MvNVOC6DHMP/vzxqR9LbEcQRwFAGPe/gud/AaPT+YYcWHPvMzU3H6XPWKDY1CT9zNa
	Su+QapkRXWlrfgIbfd3Ng7YBINd2NfGQ5ONZoFRfCroTeAXd65fjj0gnnHEx/SkEjwbeke7mi0x
	6hPjfGg4oSzxU861GA2Tfx8NWAITYZCRwYR4JhAKOkZtwZMbBZ6vEQLRQcQqtqSam4y/b89e/Ud
	7ukx4GaXpB1XrZ93sG83sXmVVh8aVb1DbUWqlCukZuku0IT46sKgNnW/CCXAlSjPa7IUvDHK4uE
	BZMrDGJyN8e0v696wDI9t6VZbSpzL
X-Google-Smtp-Source: AGHT+IGUwRD8SrdUFp/6fy69XEpREOdcAlMGf0IrBmrI/0/o5tUR3qJ92f+enoVLZn0u4NDeuQxn4w==
X-Received: by 2002:a05:6512:2913:b0:545:f4b:ed66 with SMTP id 2adb3069b0e04-550e71c2872mr533138e87.21.1747381932888;
        Fri, 16 May 2025 00:52:12 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702cfedsm310589e87.183.2025.05.16.00.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 00:52:12 -0700 (PDT)
Message-ID: <c4126cbe-e14a-48a6-942d-ff2685b8859f@gmail.com>
Date: Fri, 16 May 2025 10:52:11 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] rust: add initial scatterlist bindings
To: Alexandre Courbot <acourbot@nvidia.com>, dakr@kernel.org, lyude@redhat.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
 rust-for-linux@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Petr Tesarik <petr@tesarici.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
References: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
 <20250512095544.3334680-2-abdiel.janulgue@gmail.com>
 <D9VQQAY6G20X.RVU8H169KQL2@nvidia.com>
 <D9VWA9ZQLY85.277DFA3YTH5R0@nvidia.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <D9VWA9ZQLY85.277DFA3YTH5R0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/05/2025 15:50, Alexandre Courbot wrote:
> On Wed May 14, 2025 at 5:29 PM JST, Alexandre Courbot wrote:
>>> +/// The base interface for a scatter-gather table of DMA address spans.
>>> +///
>>> +/// This structure represents the Rust abstraction for a C `struct sg_table`. This implementation
>>> +/// abstracts the usage of an already existing C `struct sg_table` within Rust code that we get
>>> +/// passed from the C side.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// The `sg_table` pointer is valid for the lifetime of an SGTable instance.
>>> +#[repr(transparent)]
>>> +pub struct SGTable(Opaque<bindings::sg_table>);
>>> +
>>> +impl SGTable {
>>> +    /// Convert a raw `struct sg_table *` to a `&'a SGTable`.
>>> +    ///
>>> +    /// # Safety
>>> +    ///
>>> +    /// Callers must ensure that the `struct sg_table` pointed to by `ptr` is initialized and valid for
>>> +    /// the lifetime of the returned reference.
>>> +    pub unsafe fn as_ref<'a>(ptr: *mut bindings::sg_table) -> &'a Self {
>>> +        // SAFETY: Guaranteed by the safety requirements of the function.
>>> +        unsafe { &*ptr.cast() }
>>> +    }
>>> +
>>> +    /// Obtain the raw `struct sg_table *`.
>>> +    pub fn as_raw(&self) -> *mut bindings::sg_table {
>>> +        self.0.get()
>>> +    }
>>> +
>>> +    /// Returns a mutable iterator over the scather-gather table.
>>> +    pub fn iter_mut(&mut self) -> SGTableIterMut<'_> {
>>> +        SGTableIterMut {
>>> +            // SAFETY: dereferenced pointer is valid due to the type invariants on `SGTable`.
>>> +            pos: Some(unsafe { SGEntry::as_mut((*self.0.get()).sgl) }),
>>> +        }
>>> +    }
>>> +
>>> +    /// Returns an iterator over the scather-gather table.
>>> +    pub fn iter(&self) -> SGTableIter<'_> {
>>> +        SGTableIter {
>>> +            // SAFETY: dereferenced pointer is valid due to the type invariants on `SGTable`.
>>> +            pos: Some(unsafe { SGEntry::as_ref((*self.0.get()).sgl) }),
>>> +        }
>>> +    }
>>
>> I think Jason mentioned this already, but you should really have two
>> iterators, one for the CPU side and one for the device side. The two
>> lists are not even guaranteed to be the same size IIUC, so having both
>> lists in the same iterator is a receipe for confusion and bugs.
>>
>> I have an (absolutely awful) implementation of that if you want to take
>> a look:
>>
>> https://github.com/Gnurou/linux/blob/nova-gsp/drivers/gpu/nova-core/firmware/radix3.rs#L200
>>
>> It's probably wrong in many places, and I just wrote it as a temporary
>> alternative until this series lands, but please steal any idea that you
>> think is reusable.
>>
>> There is also the fact that SG tables are not always necessarily mapped
>> on the device side, so we would have to handle that as well, e.g.
>> through a typestate or maybe by just returning a dedicated error in that
>> case.
> 
> Gave this some more thought, and basically it appears this is a
> two-parts problem:
> 
> 1) Iterating over an already-existing sg_table (which might have been
>     created by your `as_ref` function, although as Daniel suggested it
>     needs a better name),
> 2) Building a sg_table.
> 
> The C API for both is a bit quirky, but 1) looks the most pressing to
> address and should let us jump to 2) with a decent base.
> 
> Since an sg_table can exist in two states (mapped or unmapped), I think
> it is a good candidate for the typestate pattern, i.e. `SgTable` can be
> either `SgTable<Unmapped>` or `SgTable<Mapped>`, the state allowing us
> to limit the availability of some methods. For instance, an iterator
> over the DMA addresses only makes sense in the `Mapped` state.
> 
> A `SgTable<Unmapped>` can turn into a `SgTable<Mapped>` through its
> `map(self, device: &Device)` method (and vice-versa via an `unmap`
> method for `SgTable<Mapped>`. This has the benefit of not binding the
> `SgTable` to a device until we need to map it. `SgTable<Unmapped>` could
> also implement `Clone` for convenience, but not `SgTable<Mapped>`.
> 
> Then there are the iterators. All SgTables can iterate over the CPU
> addresses, but only `SgTable<Mapped>` provides a DMA addresses iterator.
> The items for each iterator would be their own type, containing only the
> information needed (or references to the appropriate fields of the
> `struct scatterlist`).
> 
> Mapped tables should be immutable, so a mutable iterator to CPU
> addresses would only be provided in the `Unmapped` state - if we want
> to allow mutability at all.

Good suggestions, I have a quick PoC based on this and this actually 
works. Need to clean it up a bit for v2.

/Abdiel

> 
> Because the tricky part of building or modifying a SG table is
> preventing it from reaching an invalid state. I don't have a good idea
> yet of how this should be done, and there are many different ways to
> build a SG table - one or several builder types can be involved here,
> that output the `SgTable` in their final stage. Probably people more
> acquainted with the scatterlist API have ideas.


