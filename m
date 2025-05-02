Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6DBBE4A;
	Fri,  2 May 2025 00:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746144499; cv=none; b=fIeZIsIaVEkdjcdFXT4HDOfFlm3FVCyQoF0So16rcaVFrPHND1dh2dqp2yFWok7RONWoO4qzVTi5EyK4Rr10z6/4ovEHUTRqabGbB0KJprBArLu1539M5U0hVN+CKQbpnLbX1i3JwPwoOXKm0Y5dryXV9g4jB1pvlnnZstLN/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746144499; c=relaxed/simple;
	bh=G4Yelyaq4K575lkOWnn+J/9krWtW+nzfnMldXMOHTYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+6p5fudzKcTFBcsMre2Ef+IsngkcqTpodHm/18iZ8NkZBf2CpNxFo/H/7PE+/3XZlneiXl+tZvwy+SEG/uSAHZL7dN5UKYOfv4gHKjNKGvThWlTyGARurGjY//cCkuaJHdULybbQqOOPT2uB//fTyeoToIHYwVXACRJIl9aezc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7NesTyq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7NesTyq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1052777f8f.0;
        Thu, 01 May 2025 17:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746144495; x=1746749295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qmmz7QPWO9AKqsoz/lze3ltHGKhYQq6ZhSbT7GiQVWw=;
        b=T7NesTyqlbMR3SKGU21UmmmjBsU794Hz5iyC1VcZtsegKszLmIlqn+wBJbd6COyDza
         XTY7T1n9SWUtTQ1+R6gkOHlnIjK7SxAoQg7r0HQLIHUH8jxxlzzhvGkWk5SWQ04MubdR
         Id+3PgypT3Fg7er+P01mRe+zGBjJgduaQKgk1UzeHzmL1TYuODxoGNNdgdBwTNFt6iGj
         u9b086qu4iri10ElI0lXw43YDNuUE+KxLlmAeiXCI+aneZ+Y3EeYETGazBiRhr7obWqe
         T0UvidLn4hV4E/PEpNX/vsm6QqnxmuZIpTHUQJb4/tvJlyJtTn4x/lj98AUXmQxsjvrs
         mjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746144495; x=1746749295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qmmz7QPWO9AKqsoz/lze3ltHGKhYQq6ZhSbT7GiQVWw=;
        b=t2yGZw4Qr4PM7Kv2hcuzaV9Cd9Ji/nDVgT2nUjCrgiuveEA2xM3eGP1Lok5UZpNMRm
         vEg6wfi2tbr5Hqvowt7/6WhJo5pdhtmqW2dfgFC3p/Q/KqgXcXJTMbzoT7fEav3Y904x
         5l9ZIYERKufQ9PA9xATE8fnjWFq4DSpFj8Vo4uSpTL/o6zeUwRDjMW3m/pQPofR1xnE/
         3vMH1g2OO1uYkNNgozNsg32kv85efnrdhG0da5+nc71ZFQoPJlSh+jIrrxodynrO2ZvT
         q8RlpD44w8pgl1xMVAb/PcWhNCdZT58a35PdiYfx9s1+/lS0oPRRpABJMEJmUSWBQExY
         sNpw==
X-Forwarded-Encrypted: i=1; AJvYcCUrah/NYOiQEC2cKF1m0iqYmBMeEy1edJlB8o/4gHJ53LloOH2ywLYWw8PSOuYPoPDP+1KRmdiQiENVCo2RDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQuyS/R9Rop9i4rXToCZdmvoNPhY+DHv41o09GPpKjAPnriBE1
	YR/ry9wE1qQDoO0ov89+sboJvJpEnD++y/JmSVPzrhIh7t41FlF8
X-Gm-Gg: ASbGnctCHNb6Bt5GJUn8x2xKTcWjL6UcreLc3YCjoifi5OluiNJBfT3T2hDE/rPBDlH
	w9d87Z28xus9CxsuJLskdaBXNx67N15U23/d18flG9r93Quqt0o0Kw/jm3WGRvVnmooFBmFpGQz
	hC5Z2d6XOqytmNqwxP713hIF9Loc89LYsj+EuYgVJvd/RGExmF1y0QGT7lLa6aHIwUPjAe6dAHO
	oCUuyNqYphmjnZQrHDtUAmTPex/IcfO6jEthedwVWFuO4rLDejEzuooL0xLYUCpzTwMPFi7M0Xp
	qS8QC3nOWO4MhlSOFkK3ECaKvVvUMq/eG9oyHeOEHQdD87822HFcww==
X-Google-Smtp-Source: AGHT+IEkItABsVh/c7tEgCdZWiLWMAao79UBNmfnMlL6qp3POnO3tE6eggDEvNwtopzWCoRYIMDV2g==
X-Received: by 2002:a05:6000:18ac:b0:391:3f64:ed00 with SMTP id ffacd0b85a97d-3a099ade0e2mr341854f8f.26.1746144495239;
        Thu, 01 May 2025 17:08:15 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b1702dsm536931f8f.88.2025.05.01.17.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 17:08:14 -0700 (PDT)
Message-ID: <d5e8e635-08c4-4d3d-99a8-27f3b3a2153b@gmail.com>
Date: Fri, 2 May 2025 02:08:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
To: Benno Lossin <lossin@kernel.org>, Sky <sky@sky9.dev>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 Ralf Jung <post@ralfj.de>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <D9JVKYI3LL5L.2SFOJMSK91HLA@kernel.org>
 <d433986a-fdad-4859-b8bf-080a18158189@gmail.com>
 <D9L1TI5NVKJU.361JFPWMLDWN4@kernel.org>
 <7bc9f839-a69a-4819-ba6d-36eadd8776b3@gmail.com>
 <D9L6XO6T7JEU.CK47C5BOQ0NG@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <D9L6XO6T7JEU.CK47C5BOQ0NG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[cc Ralf]

On 02.05.25 12:51 AM, Benno Lossin wrote:
> On Thu May 1, 2025 at 9:11 PM CEST, Christian Schrefl wrote:
>> On 01.05.25 8:51 PM, Benno Lossin wrote:
>>> On Wed Apr 30, 2025 at 7:30 PM CEST, Christian Schrefl wrote:
>>>> On 30.04.25 11:45 AM, Benno Lossin wrote:
>>>>> On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
>>>>>> +/// This implementation works because of the "`!Unpin` hack" in rustc, which allows (some kinds of)
>>>>>> +/// mutual aliasing of `!Unpin` types. This hack might be removed at some point, after which only
>>>>>> +/// the `core::pin::UnsafePinned` type will allow this behavior. In order to simplify the migration
>>>>>> +/// to future rust versions only this polyfill of this type should be used when this behavior is
>>>>>> +/// required.
>>>>>> +///
>>>>>> +/// In order to disable niche optimizations this implementation uses [`UnsafeCell`] internally,
>>>>>> +/// the upstream version however will not. So the fact that [`UnsafePinned`] contains an
>>>>>> +/// [`UnsafeCell`] must not be relied on (Other than the niche blocking).
>>>>>
>>>>> I would make this last paragraph a normal comment, I don't think we
>>>>> should expose it in the docs.
>>>>
>>>> I added this as docs since I wanted it to be a bit more visible,
>>>> but I can replace the comment text (about `UnsafeCell`) with this paragraph
>>>> and drop it from the docs if you want.
>>>
>>> I think we shouldn't talk about these implementation details in the
>>> docs.
>>
>> Alright, what do you think of:
>>
>> // As opposed to the upstream Rust type this contains a `PhantomPinned`` and `UnsafeCell<T>`
> 
> There are two '`' after PhantomPinned.
> 
>> // - `PhantomPinned` to avoid needing a `impl<T> !Unpin for UnsafePinned<T>`
> 
> s/ a / an /
> 
> I find the phrasing 'avoid needing <negative impl>' a bit weird, I'd
> just say "`PhantomPinned` to ensure the struct always is `!Unpin` and
> thus enables the `!Unpin` hack".

Thanks I'll use that.

> 
> If you have a link to somewhere that explains that hack, then I'd also
> put it there. I forgot if it's written down somewhere.

I haven't found anything that describes the hack in detail.
From what I understand its a combination of disabling `noalias`
[0] (this PR enables it for `Unpin` types) and disabling 
`dereferencable` [1] on `&mut !Unpin` types.
Related rust issue about this [2].

Maybe Alice, Ralf or someone else form the rust side can provide
a better reference?

[0]: https://github.com/rust-lang/rust/pull/82834
[1]: https://github.com/rust-lang/rust/pull/106180
[2]: https://github.com/rust-lang/rust/issues/63818

Cheers
Christian

>> //   Required to use the `!Unpin hack`.
>> // - In order to disable niche optimizations this implementation uses `UnsafeCell` internally,
>> //   the upstream version however currently does not. This will most likely change in the future
>> //   but for now we don't expose this in the documentation, since adding the guarantee is simpler
>> //   than removing it. Meaning that for now the fact that `UnsafePinned` contains an `UnsafeCell`
>> //   must not be relied on (Other than the niche blocking).

