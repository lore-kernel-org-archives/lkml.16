Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CCB1519A1;
	Thu, 10 Apr 2025 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292865; cv=none; b=LdTv5KEQcrLd4QnDZAG0PSkUDMNXwO2ikglNGhUYebtaYSPzNv7ivT+E8w77X9ea+r5h0AXfIxdlhr/3pQP96QlOUE3H+cY9DbI5o7QDgdCkuq9wElKjKqZAvfk2KuDOW0KSW7mOey7NPOQqJ5sZIXc0YFuwpeaL4Hk66SmYaCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292865; c=relaxed/simple;
	bh=B8eP9Hns9fzoseZHZS5omu5nHeDHk+QA/EBW6wjSZbQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=peubC6fhfob1QGKk+LF+jvO/+MyvYNge2cgP1R6CZz5eG+e2mVTtXzt0v1ElWsidtRh25Mv2AHxLi2XXPzzUYBjZmFoHMGGGa/JR0qPmkdsSROu5dVBQ6dXmbsuTN28NsRXOdMmVWuTlcM+7PUAAHGGG/9ctbk/Zf6lAuGGr21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oo4loiUu; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oo4loiUu"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so786727a91.3;
        Thu, 10 Apr 2025 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292862; x=1744897662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTWNdzXB6EXtES+qhh3ul9FC9I/MOcomdwM+IhVWquA=;
        b=Oo4loiUuUCYnnfuwfnc7BCPVNU0Svf+cC8buLd/NRhqSVrmsb5sBFJZYGNFoB9Lphr
         c7R5xVtTBxtSXBGwA/wp31Pg369QAI+udT4Mwet8aYxTTOyui211vFo2ZsAaa+dj4aW5
         pq2GOaUoFTXQ6kw1UhZEEwgVxZwOBjClJG73dkhECZTaKUZ9/+vwRCNWZZcS1dC6my0a
         Z4srG5P7CLuEdRA23htoU52iAp1IMlGyyqUmFSwjhfWymM8jSngesVRdSe4+rNsMZOZv
         k5ueVccSqTMF3kk9v9+GuZPy+l48f2zb7BoDSPURANkrV3T0FOXyO0jVmtWvTwLp3kY2
         GjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292862; x=1744897662;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTWNdzXB6EXtES+qhh3ul9FC9I/MOcomdwM+IhVWquA=;
        b=KtaKWzmTWWrYD05JUGpMtDK8gcifAOj7hYvWBOjmdAceJbT4E+uAx6GXgXJCdBpm8N
         scLH02KoZTjoUjGI2s5R0iaY2NynJ17tnD1q/QTaQrbaYKTeILaAS26fu+5CIazRAsoY
         b0zPt+TyndiruewZo9SgWUhTDXklde44DY/QUa6mLeAcZSTnk1GtlCEd8Gv/yLidZj+0
         377v+jrN6eX6ViII08iecEt/9/dRr8xEyRtspQJInjKRGiP6MjjVBwd3pizHTvg0umXc
         HImoAzkz1GZ80DUI7dbT6ereVV8gIuSSRMsdOZmoj3EVfucZEWEgWPFNtamKQNiIymiX
         Vhwg==
X-Forwarded-Encrypted: i=1; AJvYcCUAshz5xQWsb1neDrWgmc0l417MGy8J4SzpVj4nzoQH75eY3SzeicZCbX5apogInP68qhhl7EI1lWNGgaY5vgQ=@vger.kernel.org, AJvYcCUogRJXzSkVds1nd5uoUwqNVrd5IJ+I9sU3RA9x4SN+A76uW9nhRd/rzqCO2BrGEOUW/YE/16ckAJUmmyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeWj8fi758J/VCtSPBT3H31YhBkLwomkgHREM46/3zLW9B6nW
	ExTWkE0TqfUAsLPuBs+5LEh8CTlBz4fyiQackf8MQZ/F1hsIpG8b
X-Gm-Gg: ASbGncsbHb87D6UAdWmu2eQLmQPEy0q6EU+Oxe+HcQ8zADLtNgfqEYig5+4zyGt30dE
	oy/o3u2vD683+CM1A3woPXFXTjyAVn5E+l94InlNLl5Gl+k4kSt7RqO5JwWp9RqVb7R4PQwdJr8
	sCA0HgHpfbk81s017TMJyh6MpQ0pemJT9Bo31RET9wvDVIsPEC1Rdj/Gb/5PFVaRUzOUouB6zSm
	z9oWdP4L99Q403MNoPZxNyq/HNC9PgF6KDND8wskDZED7bhnJ7+el8LCtLjYI9zXJiH0d3BxBqp
	MowlBXJdzSeGAyIUWk1NzoWZ7CjPP2w2d7lEoumsG2NeIl49PTgIsWYijlntmIurgc7shkfXUP+
	k575Pj6p6LdrzcuuAj42vPuM=
X-Google-Smtp-Source: AGHT+IGSeOa7k+Tn7DNVUea9Xi4b+WqhH4fDjHADHuQUu23dS+AjkhYJjO3wHWxruQi+IrKs2vIxtw==
X-Received: by 2002:a17:90a:c105:b0:2ee:aa28:79aa with SMTP id 98e67ed59e1d1-30718b67f03mr4218603a91.6.1744292861612;
        Thu, 10 Apr 2025 06:47:41 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fae27sm3478281a91.31.2025.04.10.06.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:47:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:47:24 +0900 (JST)
Message-Id: <20250410.224724.1795885541320306236.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, boqun.feng@gmail.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, tmgross@umich.edu,
 dakr@kernel.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com
Subject: Re: [PATCH v1 2/2] rust: task: add Rust version of might_sleep()
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z_Y1IBcp_NNnks8R@google.com>
References: <20250406110718.126146-1-fujita.tomonori@gmail.com>
	<20250406110718.126146-3-fujita.tomonori@gmail.com>
	<Z_Y1IBcp_NNnks8R@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 08:51:44 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
>> index 9e6f6854948d..1f0156b38ab5 100644
>> --- a/rust/kernel/task.rs
>> +++ b/rust/kernel/task.rs
>> @@ -380,3 +380,29 @@ fn eq(&self, other: &Kuid) -> bool {
>>  }
>>  
>>  impl Eq for Kuid {}
>> +
>> +/// Annotation for functions that can sleep.
>> +///
>> +/// Equivalent to the C side [`might_sleep()`], this function serves as
>> +/// a debugging aid and a potential scheduling point.
>> +///
>> +/// This function can only be used in a nonatomic context.
>> +#[track_caller]
>> +#[inline]
>> +pub fn might_sleep() {
>> +    #[cfg(CONFIG_DEBUG_ATOMIC_SLEEP)]
>> +    {
>> +        let loc = core::panic::Location::caller();
>> +        // SAFETY: FFI call.
> 
> Overall this looks okay to me, but this safety comment could be
> improved. This being an FFI call is not the reason *why* it is safe to
> make this call.

Undertood.

> // SAFETY: `file.as_ptr()` is valid for reading for `file.len()` bytes.
> 
> And I might separate the file into a separate variable for clarity:
> let loc = core::panic::Location::caller();
> let file = loc.file();

Fixed.

>> +        unsafe {
>> +            crate::bindings::__might_sleep_precision(
>> +                loc.file().as_ptr().cast(),
>> +                loc.file().len() as i32,
>> +                loc.line() as i32,
>> +            )
>> +        }
>> +    }
>> +
>> +    // SAFETY: FFI call.
>> +    unsafe { crate::bindings::might_resched() }
> 
> And here you can say
> // SAFETY: Always safe to call.

Fixed.

Thanks a lot!
