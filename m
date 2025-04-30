Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CE26462A;
	Wed, 30 Apr 2025 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746031544; cv=none; b=hToNsxoIVTPFo4DsmpC/dQlcv3f+9iGc7V5qygTEG1seH/olTwZhjHFG7VWMwlfe+l6OsaeC0EVFdKc70ysb8wVZS9xuwthSiF2JIem8R5EM05PCKLEw51MbjkfMCF7/bw/6omzXB3GEbKC7tBLc4tejHrWkCKx+U72jiI2vC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746031544; c=relaxed/simple;
	bh=B+6epQmRu6aAM29sRnHSJHrCA+DIUmhRfWz0R1Ej17U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pH4LWU11ZCEgLsmtxoPfr23ppwYLeHeBCjzH6xpQnguO0Cn73SN8sKGtLMSeUojySJqCs/5fVWIAUCD+F/vNZyuXu7VMT8swj1GTfc7++MhoCE297Tj9Spl/GkucKAXLqT8vby1D2bQvsGnJKAW2m7smHtllTHCnEJrGH9FTa7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkQwzLdS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkQwzLdS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so9465095e9.1;
        Wed, 30 Apr 2025 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746031541; x=1746636341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjRXEWIFTqTSwI6s8gL4rcvQiMkOK5OYlEpGCyQUo30=;
        b=UkQwzLdSi5fKFp/T7J/apcTZBgvxkv7kZb0zVw0swPD34iXgSjJkDcM6KcZlQVs5Oi
         Ra8qNctpK4l5TaP+kTH/gn3Tx7rBBnRFmWQd3/peNPTv2wbFf7D4Ect8DJSSJqJvBosx
         fndNax4Eux384VmORKhNjFl05pIChvya4kNVrYR36z+KcOBM1M2Ti4h9fr0872DqOeNv
         JSr5sIy8q5cDHqsaRseEzxBuY7hCGE/FYC4sSqYrKz0/0vQhIlTrFGuW9HG10cIgrY2H
         mmF9tSWYbQ5uKIRK3M6Jkkkk5zBsM+Rvb1TtP+JZCcWjHr5FLZ/VVgdPn+1zCpjpa6IZ
         VSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746031541; x=1746636341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjRXEWIFTqTSwI6s8gL4rcvQiMkOK5OYlEpGCyQUo30=;
        b=eN4sG3NaoBQFK+211F2FJwXC8BfvZb9iBgkCu8mg/yAL6y5i+/jzpmI7RVpR+oOin8
         iedYENMgkhyfkKSfgtCXCRKVR6difYveACOZyVhHvhP2SwAiLSAolTD9NXgfG/ajLF+s
         4f5tJzKQcFP9mzIglQ8FQ/zsDtRx04beXilMMoJvwPKLcflx994ZpMFoP+Wf8wYIiYe1
         iC7abrtvH6A7BygeWPohjUVY9Ih5Em8XknZfX+GiSexzS85VwDVhDnH0I/kCIMKmQudS
         RDRxiKv6iGGZwM3x/D/MEpZBAz0rLuSEIYZrWBBvkI8NBUjxggthJsuemo93ev2c308l
         o5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWZQCbN+2S+LOQW1anuec1IwkQLwjU7AKL6XgxwEQzeZTeWY3qgEsDaSPi7lxJHDQxXsPHreTWncXRKK/IpNzQ=@vger.kernel.org, AJvYcCXYH9isR/6Mpl9O1iQdYBws9Ykt7yqRrjjxDvrMy52cskA0x22afBd8jlmSpazAYsRjTYgKuZG4hT20k/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU9GquzBc4wOTU7YgpTUlTMX0oHy6r7AtSEHlnKoIhxnMmMc5X
	mf+sv2hJxc42Hj9IwLJByeirzwzZx/zTyN/j2OSlGKgX7CUEyawX
X-Gm-Gg: ASbGncsy+Sns/ruQMQYmz1OPP5nYtWA5t+7zDs/vATvM7S/6hKHzClwHZXxd7fHL8Ep
	zVAEM1bYl+bncaHn8G8gCvGUmp7dgWPnrIXiCblIjdYiSKj8omy1W5f+/smVte9fwH3Ob2SxzE+
	81UYDwsx6vQ+dfpx56sc/oSU02qNS1dB1WCaTrVb/sZUZqiNOVUx+NBx4L2xGxyhu8FuT6as54/
	qaR7dS6pydN44YxiGD1T2IiA4vL8qY/Z7sWmyEDCiY7ddCo9z0hw702jNt1379s1OgAcuBIgDo/
	URc81RXiuycSGOV6rop8pOD+bwjLfKtc6RhMFvdUWhQGXeAIaWH1+w==
X-Google-Smtp-Source: AGHT+IE2aMt++LC1H0+BWMSupUM1f7yZvyDXar+UBiQyNWKI+kWeQ6zYt4S/IzAeep+Ms+FjfOs/bA==
X-Received: by 2002:a05:600c:698c:b0:440:6a68:826a with SMTP id 5b1f17b1804b1-441b5cb1dedmr1501205e9.13.1746031540814;
        Wed, 30 Apr 2025 09:45:40 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad7688sm31328575e9.3.2025.04.30.09.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 09:45:40 -0700 (PDT)
Message-ID: <4ba59b40-7842-4ff3-8ee2-cfa5aa8002bb@gmail.com>
Date: Wed, 30 Apr 2025 18:45:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: add UnsafePinned type
To: Alice Ryhl <aliceryhl@google.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-1-fc8617a74024@gmail.com>
 <aBHrO_hE0CEb0Wfw@google.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <aBHrO_hE0CEb0Wfw@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.04.25 11:19 AM, Alice Ryhl wrote:
> On Wed, Apr 30, 2025 at 10:36:11AM +0200, Christian Schrefl wrote:
>> `UnsafePinned<T>` is useful for cases where a value might be shared with
>> C code but not directly used by it. In particular this is added for
>> storing additional data in the `MiscDeviceRegistration` which will be
>> shared between `fops->open` and the containing struct.
>>
>> Similar to `Opaque` but guarantees that the value is always initialized
>> and that the inner value is dropped when `UnsafePinned` is dropped.
>>
>> This was originally proposed for the IRQ abstractions [0] and is also
>> useful for other where the inner data may be aliased, but is always
>> valid and automatic `Drop` is desired.
>>
>> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
>> as a unstable feature, therefore this patch implements the subset of the
>> upstream API for the `UnsafePinned` type required for additional data in
>> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>>
>> Some differences to the upstream type definition are required in the
>> kernel implementation, because upstream type uses some compiler changes
>> to opt out of certain optimizations, this is documented in the
>> documentation and a comment on the `UnsafePinned` type.
>>
>> The documentation on is based on the upstream rust documentation with
>> minor modifications for the kernel implementation.
>>
>> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
>> Link: https://github.com/rust-lang/rust/pull/137043 [1]
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
>> Co-developed-by: Sky <sky@sky9.dev>
>> Signed-off-by: Sky <sky@sky9.dev>
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
>> +config RUSTC_HAS_UNSAFE_PINNED
>> +	def_bool RUSTC_VERSION >= 108800
> 
>> +#![cfg_attr(CONFIG_RUSTC_HAS_UNSAFE_PINNED, feature(unsafe_pinned))]
> 
> Actually, I missed this on the first look. Where is this feature used?
> You only have a re-implementation right now.
Was just a leftover from the previous version, removing the feature and
config flag (to be reintroduced once we want to use the upstream version).

Cheers
Christian
