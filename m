Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D8F2750F0;
	Thu,  5 Jun 2025 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146274; cv=none; b=L9U8opgDefvwn++8Q0b9OKoSYPgZuHqtFfKY3f9JtDKDMsu6OhdihbRLIHYSOmiWjYiFtaIb9Jvj/4O+9ISGGo4heKsg6baowNj6y7tYeEvhwQJJG7KUHB/ZJ7lrI7jkWg430lSqrtwheu4RZoFeEyrzrEouE3YUwlp0Ye74PMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146274; c=relaxed/simple;
	bh=rvD48nSdgnQrRF8apaLY0OWIycvkx9NLB/OwctTjzes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0cL6xE9RtAYGvqvvQrR5uoPrZPsBZ7n5DZ9bl4RMv/FW+8ScZy3dQZd2McWbpl8QFj05nbq6MEaVbAPVySY4i5bLBwGJiBqkw+IrKfoAgQTyYj7LUASJQ4PLUrlEcrcLsgBhdVYnr49D9HuHe1IqOZbYxgIP8jnJM4v6TZfaVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VK2C4C7T; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK2C4C7T"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso2306350a12.1;
        Thu, 05 Jun 2025 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749146271; x=1749751071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vDdUwwKQJNe/fkcnVHvcRpEhmg0nlamAkVjZwwBZ4A=;
        b=VK2C4C7TGHnwCiZfBjNhyha3ogasqBsMq5lS7elMm12X6lGcoXw95klh7pkDYraHca
         EUyj/nuPD6sqXFlVz9VZbXo6LmqIjA/3ZE2eTh0IECTL83b+AeQw2kfg7nlffAq9Vs25
         tREpEOeO2pBVicqjQ+9GjPtGD4SNHrNN0iVdkBNNGUMSTmgFcjUW7WexsT/VdxTQTF0J
         JQBcRtsItOrpDY8v8S+2xYM9HBHv1llQeDWa3sQPF/AB2l7Gmj92UswT7vspDy3eRDpk
         2p4dOrctdu8ZxMp0d2YgQzoPFn95WXKhJ9iJxDpa4Czwk2bbixuLla5/Bx27Z87bF7EI
         92qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146271; x=1749751071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vDdUwwKQJNe/fkcnVHvcRpEhmg0nlamAkVjZwwBZ4A=;
        b=nrcwYs59JhOkbI73JS5hcCnvDK11J7iZVcqlXz3WsP49WJ3+l/MacWVv7I4QuLPRLl
         6L24hJbcmcJR3I+ke5iCcCWTAPISTpY3CVgSnwyPcl4ASJS6NqoxS2WprY3Kl+hu0IPv
         KuZTKqhP1bAkswv+vA8oBUCxsPpM6o698mj/8nVKM2rQcg4uJmZkl7bOFVr+CdSjd35B
         J5/1HUCtTma+UgRY9SSBDheezMwiZZzZPgbOlwEtOQJ0bS8brVpa+i8UzxywMWuYZHm7
         RxtGhCTVubRNxFfY9gohMf/f3CEcrkPAdjmyDQAxcoqbXJ78z73eYuKIFIOrH/uG4AAV
         2q5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE8XZbLiICoCBGUXFusp9KsNpLwxxxYgTXPQ8U/Wf8cUOQTcbNMcg2EsW+C+z6HfJMptIGoJr7MOpAcrjMiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdWD9gVKQQInORlaLVS7BUYGAOWJojGiOLKPa9wLTYQz5KpkJs
	PVDeGzo5Key1NQhYnh7ucCz2jdfKz/5SlxJB921CWzzWAfTH7lrnAIwt
X-Gm-Gg: ASbGnctZSll7UL04rp13TF+uYcduiGEtAhqZaoUiLXCbE/WLUTRG656VTjUN9fop2s9
	kzCT9SFBgdh3iLV2U6yn6xmKbss/pz0/thml9iy+wEG5g6lUjCOK7vrLjtwR9fDnc4ZYAGaVlPq
	dz4pwehLq4F91qGRtTEYpJ5e/YrpbEgZkJzsCObanQilZ4I2DkI+zyQeUHQXeWNRqOUIJczM2rI
	pUQRSvplbEJ7OhW9O9FIMDexoS2/4Mo93XaHpLfoevRWlv3P2w8BmMj0/FsYR0aicUE+76D4QMG
	1lMAEqDeDZ20qtYAkbB7TEo4XaQkABcb93Y/jLy58zSB6Kkab48oLvyaUWML
X-Google-Smtp-Source: AGHT+IG54aLW+rl06pwJxjOcQ8r1a2fqNltqry+pbYsiFNt2bOWt1+fRbHMPH2wnbkY+c3e8hyAwPg==
X-Received: by 2002:a17:907:1c8e:b0:ad8:9466:3354 with SMTP id a640c23a62f3a-ade1a9e9335mr15216766b.54.1749146270897;
        Thu, 05 Jun 2025 10:57:50 -0700 (PDT)
Received: from [10.5.1.144] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6abc2sm1294282566b.173.2025.06.05.10.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:57:50 -0700 (PDT)
Message-ID: <63f92378-dde9-4bee-b2ae-b994052e8fd0@gmail.com>
Date: Thu, 5 Jun 2025 19:57:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Benno Lossin <lossin@kernel.org>, Sky <sky@sky9.dev>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, Ralf Jung <post@ralfj.de>
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
 <DAES0YHHTRQS.3EGLTCPLP3SK3@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAES0YHHTRQS.3EGLTCPLP3SK3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.25 7:30 PM, Benno Lossin wrote:
> On Thu Jun 5, 2025 at 7:03 PM CEST, Christian Schrefl wrote:
>> On 11.05.25 8:21 PM, Christian Schrefl wrote:
>>> +/// This type provides a way to opt-out of typical aliasing rules;
>>> +/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a unique pointer.
>>> +///
>>> +/// However, even if you define your type like `pub struct Wrapper(UnsafePinned<...>)`, it is still
>>> +/// very risky to have an `&mut Wrapper` that aliases anything else. Many functions that work
>>> +/// generically on `&mut T` assume that the memory that stores `T` is uniquely owned (such as
>>> +/// `mem::swap`). In other words, while having aliasing with `&mut Wrapper` is not immediate
>>> +/// Undefined Behavior, it is still unsound to expose such a mutable reference to code you do not
>>> +/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) are needed to ensure soundness.
>>> +///
>>> +/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show up in
>>> +/// the public API of a library. It is an internal implementation detail of libraries that need to
>>> +/// support aliasing mutable references.
>>> +///
>>> +/// Further note that this does *not* lift the requirement that shared references must be read-only!
>>> +/// Use [`UnsafeCell`] for that.
>>
>> The upstream rust PR [0] that changes this was just merged. So now `UnsafePinned` includes
>> `UnsafeCell` semantics. It's probably best to also change this in the kernel docs.
>> Though it's still the case that removing the guarantee is simpler than adding it back later,
>> so let me know what you all think.
> 
> Depends on how "stable" this decision is. I haven't followed the
> discussion, but given that this once changed to the "non-backwards"
> compatible case it feels permanent.

It seems pretty permanent, from what I understand its hard to
define the exact semantics `UnsafePinned` without `UnsafeCell`
in a way that is sound and because of some interactions with
`Pin::deref` it would have some backwards compatibility issues.
See this comment by Ralf on github [1].

[1]: https://github.com/rust-lang/rust/pull/137043#discussion_r1973978597

> 
> How close is it to stabilization?
> 
> If it's close-ish, then I'd suggest we change this to reflect the new
> semantics. If not, then we should leave it as-is.

It's pretty new, I'm not sure how long it's going to stay in nightly,
but it's probably going to be quite some time.

I wouldn't change it if it would already be in the kernel, but I think
its probably good to add the current state of the feature. This
would also reduce the difference between docs and implementation.

Cheers
Christian

