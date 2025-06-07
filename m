Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2699F1F4192;
	Sat,  7 Jun 2025 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327580; cv=none; b=jF65looRofnuHMA3ns7evAC82OtnRuy5t9xsh5RBL2SZ/ELkDpChHZKtdWra1ypa9WqHbLAnbndvGVssMHCel2fQ+0STE/43Rf3NZISrIWiaCg6pVRW4UhxflT+HpWz+YVLhu949SVDDmzj04FTV25a67LF4n1ICbFEgzO5K0SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327580; c=relaxed/simple;
	bh=fF6oAYruo67B8ANaWdEygvjygHRwVNWqO77vnfX3Ou4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KULbfLg0yCwNgqYfXenV1qUcEAZCqCjl94iPDqMJbwPtxBmnhPzW5ZURCUvkJp6jKG9+lRuTz1fSOR+cid3+cqaWqDklS7LsCmfwWrHBPQ53sEQLDtDZgdSKXRG7sG9C7eIbkgKz3/PgOXC2/VSmHTeqC3Llv99z3FaDYKAY/2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fV9kZ4kI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fV9kZ4kI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so2468564f8f.2;
        Sat, 07 Jun 2025 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749327575; x=1749932375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2LwqptFTMBLVEe+Jaa58kLLDLdto2SH/hE0L4GQVKo=;
        b=fV9kZ4kIUfBxTyGjZhZU+DEsO2cL+C8zgUB1sCqJgR0KneVm3PiQ+pxwySqY5zW11g
         Vxelcf6jOI3VIsHDvd7eBvoLLAClxLVG+epAxEEUnH1KdJV2G3k3AY1JxQeXCC6CNTie
         BQQE+wg2aqwMHbfbOZ2VLzvAH+EstKi0C6fTclTE4tD+h/bBizYd4pjxQU21u44fCuYU
         aVP17GCvYfMsNiz25StvdXHrrR8n0oOAJTQ8VPC68c9C9zDzdeIUzTsQvUsaDY1lFmyq
         7LLInL2ZHOJ7MhGvAAv29OtiiA+FmjLqOzukWofKXyci3/C2JnIEeunaS5Ech6vSpMnr
         uGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327575; x=1749932375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2LwqptFTMBLVEe+Jaa58kLLDLdto2SH/hE0L4GQVKo=;
        b=gQRjZOk8xPqPK0Ddd/wAHH4rU3VT+IMd8EmWt5ufsbfd0laX90+YAUEMb8FLQWEpjM
         Hsh34t9VDpbf8uvHU6tK/guVLJvnd90ddc4vKQlAseOSKDuZTVau07Ux99rtAlnHpo8S
         bMiTBF/zcgLaEhh8QY9zGK0bddCY/9R7OILDGqIRquBhd9N8eZdm42n7Qs/x1TBT3Pvz
         VIlVb7to8OLalqla2KFWMj4Mtwbjs1xFET0ZTSX5Iuxcsd6LrREc88x4dNA5SAXwNfmS
         mYZ/3E/1K7dhAETFZln9wdSRAn7f15aWQ/mEPJlNDePJ0xIWB1ulBOtsDSs9qPJQSa1G
         3CjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7mVQojvSpWlY5kJL+4tQ6DxM7+lcuAdLb/tLxbQxIo1lX2LVcOV5oVOkgh779a4jS09f/aUvDuW5qx+E=@vger.kernel.org, AJvYcCXBSZRS+Sa1sivZ0FcYbgeCzn20+VwI5V/BbWYWQzbZjGir2pzagB3Ku6ms+feQ4z5KkzEc9RlJGI21SES+X/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2nAeb4Gx8jKpZNMa6KXJ6rWUEfFKXkV+czGLKiLwaJ8yPF2xn
	UOn4K10M2WLmfYrfAXD9gGu3IOJKyxiC6j95Uj0c1bxyzkXYgRhnVzd3qSeS3Q==
X-Gm-Gg: ASbGnctZfXOKD0L8gZ/V3MLO7UDM2I7GCccbrewF1qLV9TX9tFcyN60DFbwcV6QAP7A
	Rv2n3Dfhpr6YAcbbcl4UHLWQqZa9DY6n7H3Ys0WkVU6dr7iaHvTuqRe9jhMXtzQ4htWh1rNY5s6
	d3iw294m3a0DcfGSg6lnSoSPcQ23cpGpCrXMqoUO/n/h7lVm+uNRPmvpXr4Z8RRBoK8WK0BgKbT
	P8PH4ZnWU04AAf6vrTFA6t6GIVvE+yZqM66JWb1WDAmXuw/BUoVaTr6ZarAHsFlBPHy1dxJl3hw
	tR7NlbVEQ+8MLtt/576bHD079mcHrxwGyCq5BHnwcScLPWHbENBLbGUoH//EK6uSE0geq5gaWDg
	=
X-Google-Smtp-Source: AGHT+IHH9rmwvl7Wb9dgNPZAPnF6qB1mJnqPAIkbYsZsAFDGCtYqCfc21JdHm9DR/dFoxlM7K5Svyg==
X-Received: by 2002:a5d:64e7:0:b0:3a4:e65d:5d8c with SMTP id ffacd0b85a97d-3a531caf984mr7084221f8f.40.1749327575256;
        Sat, 07 Jun 2025 13:19:35 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3372::1ad1? ([2001:871:22a:3372::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532435771sm5568784f8f.63.2025.06.07.13.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 13:19:34 -0700 (PDT)
Message-ID: <489c795a-ad6e-47b9-9443-aa315d59a74c@gmail.com>
Date: Sat, 7 Jun 2025 22:19:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: add `assert_sync` function
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
 <CANiq72m04yAwxtMbctCpiDpYzoMHpiDagEJsvHHJCZNJXyJ5KQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72m04yAwxtMbctCpiDpYzoMHpiDagEJsvHHJCZNJXyJ5KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.06.25 7:29 PM, Miguel Ojeda wrote:
> On Sat, Jun 7, 2025 at 3:02 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> +/// Asserts that the given type is [`Sync`]. This check is done at compile time and does nothing
>> +/// at runtime.
> 
> I would split the second sentence into its own paragraph, so that the
> "short description" isn't long.

Alright.

> 
>> +/// Note that this is only intended to avoid regressions and for sanity checks.
> 
> Hmm... I am not sure about this sentence. A macro may want to call
> this to ensure something that is required for safety, for instance. Is
> that the "sanity check" part? In any case, it sounds like the sentence
> could be read as "this is not reliable for "other" things apart from
> just sanity checks", which may be confusing.
> 
> Could we perhaps clarify?

I added this because for some reason I was convinced that it would
be possible to cause post-monomorphization errors with this, but I 
not realize that's not a thing. I guess I'll just drop this sentence.

>> +/// # Examples
>> +/// ```
> 
> Please add a newline between these.> 
>> +///
>> +///
> 
> These newlines should be removed, otherwise they will be rendered.
> 
>> +/// // Do the assertion in a const block to make sure it won't be executed at runtime.
>> +/// const _:() = {
>> +///     assert_sync::<i32>(); // Succeeds because `i32` is Sync
> 
> `Sync` and please use a period at the end. Also, I would suggest
> following our usual style and putting it at the top, i.e.
> 
>     // Succeeds because `i32` is `Sync`.
>     assert_sync::<i32>();
> 
>> +///
>> +/// ```
> 
> This one can be removed too.

Fixed these

Cheers
Christian
