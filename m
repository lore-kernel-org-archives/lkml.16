Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36DD204594;
	Thu, 10 Apr 2025 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288462; cv=none; b=H+5c9bQfZLZfUWEnQTaaAijLYOuHTFA4+/HldgMaL3OI2TV3foKERQd1mlZ+H+4AcgvepDxhDfSB8RpUH0t1kH9IOH2HjVTzCcuPKUZ9L3JhVYvUV11pJdH1BhXXzC949mfaDnCau8nIPsD+3Sa4xlIowPp7gSsE0QZqQoUgB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288462; c=relaxed/simple;
	bh=aYnz96tviR6JkjQrvqHBO9WzzIuRSa6ZnA54LbzQIXI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sQgWKx00lZwrAHY8Ejn0H8hx+3N1S/+tyLZv0nbyGJxyqurre+Oiyg8WJwkTYBWOPfRCvWPkcMqx7TQBNRRIieSsgjsi+C6FnEQTyw7OglOsT7Gd1H3wXHbIDvxOvpgli79MijjwFUM3ljgwnmEJV/XymkizRj5y0Q7LiRvnaSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD0IiSgG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD0IiSgG"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736c277331eso1750751b3a.1;
        Thu, 10 Apr 2025 05:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744288460; x=1744893260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYYB8xWXXp3NrY8EvpLd9vo2DOULWKf7nlbTH+Fs28E=;
        b=gD0IiSgG0fx+2p8Agr0OL6E9soVb352FEEt2gE1zJxpM8TUiVPxSACRMz2sJDwojva
         IUR9qpegUJWk2tgFnpnpG6LbUtDItpMbcjjZGtnxjwnILN2iQmuLjgW3YK/EleC6LLcQ
         8nSqprwVzBkRVoCiaRjT5IpavzN7FPpMUPp5jKRMtWcD87SGXN7+zbPKFTzDWukLTsgU
         RVewoRY6kAnxYhJyfDOmG0Tfmd+U0eI2hJ81H9KDJS+GvwNgxcw7tgKHGlfEupFdIMQf
         OzPDtLRGM3aDZrdVt35/4BVfkmDB6YDxftvw1yh41lDn73ztW9XSMoIJLGNsiUHaE5Df
         n30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288460; x=1744893260;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CYYB8xWXXp3NrY8EvpLd9vo2DOULWKf7nlbTH+Fs28E=;
        b=tPT0IQDILhEY5NLuZr4GTL0flp7458xy/41k7mIaraz0ntn0Ldy6B5+Q53zMQpxZi4
         1WBUkyVE8mw6O//Xn+QuWKOmYELKn9ECH+ryerSBqpgzSEodfI9ZEF/tPZ8WC8ztbN8p
         Ks6xLA1mu3UikELfeizv2G4LSS2kfPw9R7Mev8bNJxOBPla+nDSsot5uZ9kPyLkHPsYo
         LO0XczFxiKRLYsnK9SqDwpWfcnNn9qWoXYU3Jsyi7rpp5q/duxS7QLfJS9+MAp2nrUZ3
         QzeWEFiS2U1gMCMtMPide2qFlfQl9tuYHzjzbtVmpxjAwOBbmtMTFHLnAw24d1bQeemd
         ugxQ==
X-Forwarded-Encrypted: i=1; AJvYcCULLZyDe3brA1gTuWPBbpaLRRp2yuNF7RL71IJdCAyXAqBlzexSML5c1Kwj6aRmRkrQkvjwVzXtMw/nVH0=@vger.kernel.org, AJvYcCVTYiWahOMOngEv8toejlkfMLJcaypa5rT3nm7hIjmqwJtL/Zh5HOuurCMg2sCrJqRy/DOYgVvjasYSNOOq4d0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMVZzcQsmvq2TD23JSkZapY9WH0z/7W5i4bEw6MPY4BSz/Ksa
	dyMqVKBp7xoR+zvKyQsaH90RnwFABlBHD5d3TKPJdIcVLkw3I+t3
X-Gm-Gg: ASbGncsQe0tcS9ktW3JYKN91uYxLu/zl/SH0PHxnF/0EZ1odpJy/fMXQm2cBmHLgJy1
	HHxgn26j/ZctX5YVWZaOLOFx/aelCbd2yEnSae3XRHoEvYiLqz1LWTJqdWmW4qSgy4CVBZ3a1ed
	pFrGE+RmJ81I2TDLFn72nt+OcBlLami6AHqtrVlM4+Huu7GoUf6pjXIYGIpIDrVi/I6/Y/b43Q0
	0tC7NYPMUBlAb2e5qfxCqKTMq88nTZN916cFb6IKyOysLvQPIF4Xehe2oLjRQu5Rr05yWFX2VZP
	KS9ykXdVzWVIC7UAIQaOs3ybxx3mUZq6BU+EaKFpAy53qwv74E6uLCN4aU1CJYoYwSdHHUbQA7x
	iKW4r4dsNudKYSH8xbLqV4u0=
X-Google-Smtp-Source: AGHT+IGl2utS2unvYHRMdT2RP9ueZqQhdCzDP3jwZyYMjQoG9MrpSlL23CvVNg2kZbwezJItYp/l0w==
X-Received: by 2002:a05:6a00:1487:b0:732:1ce5:4a4c with SMTP id d2e1a72fcca58-73bbf869048mr3236065b3a.1.1744288459852;
        Thu, 10 Apr 2025 05:34:19 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69ae9sm3206479b3a.173.2025.04.10.05.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:34:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 21:34:02 +0900 (JST)
Message-Id: <20250410.213402.1373597003035091247.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, peterz@infradead.org,
 hpa@zytor.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tangyouling@loongson.cn,
 hejinyang@loongson.cn, yangtiezhu@loongson.cn, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z_d1xAAptnfzqg1l@google.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
	<20250409065802.136971-5-fujita.tomonori@gmail.com>
	<Z_d1xAAptnfzqg1l@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 07:39:48 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>> diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
>> new file mode 100644
>> index 000000000000..761f0c49ae04
>> --- /dev/null
>> +++ b/rust/kernel/bug.rs
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +// Copyright (C) 2024, 2025 FUJITA Tomonori <fujita.tomonori@gmail.com>
>> +
>> +//! Support for BUG and WARN functionality.
>> +//!
>> +//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
>> +
>> +#[macro_export]
>> +#[doc(hidden)]
>> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML), not(CONFIG_LOONGARCH), not(CONFIG_ARM)))]
>> +#[cfg(CONFIG_DEBUG_BUGVERBOSE)]
>> +macro_rules! warn_flags {
>> +    ($flags:expr) => {
>> +        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
>> +        const _FILE: &[u8] = file!().as_bytes();
>> +        // Plus one for null-terminator.
>> +        static FILE: [u8; _FILE.len() + 1] = {
>> +            let mut bytes = [0; _FILE.len() + 1];
>> +            let mut i = 0;
>> +            while i < _FILE.len() {
>> +                bytes[i] = _FILE[i];
>> +                i += 1;
>> +            }
>> +            bytes
>> +        };
>> +        // SAFETY: Just an FFI call.
> 
> Safety comments could be improved. This being an FFI call is not the
> reason why it's okay. Furthermore, it's not an FFI call.
> 
> Otherwise, this series LGTM.

SAFETY: It's always safe to embed metadata such as the source file
name, line number, and flags into the .bug_table ELF section.

Looks good?
