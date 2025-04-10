Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A57284B21;
	Thu, 10 Apr 2025 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293719; cv=none; b=lGN68+HHP4rWqeqllfkzWCLgYBtivfCqKLsTO8idthZ1B3deOr8UEZvIMOh+96W0GQCY+p81SxRW9zWhxX42aeCfeAWkUV0PA3lkHsEu1W4h0OxE1JgZRwj2QRKfFMUMSPIsVkp2BABo1AsJIUldhUSKnz/4pPJGwNkQrjXfGq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293719; c=relaxed/simple;
	bh=sw3vK6z8fQjBuRgQszQR109R2Cqf5C0TdwJ61a/B8JQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FASz1vNZSt5VfYa/eLmpmmvCQa5VzY/718T0VUdDtArmpXmp7sY6yytwYdS2HVnK8a7xRVsvDD49dGO+rKibCs2yEh5/W4+kj+EUF1PY1+qvOZoV0KYHozuFNebCd7GcJb5q9u1W63Fc8UemzlromG/vP9J3UKYvdXHWDj5N0NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWLkeK9T; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWLkeK9T"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1047435b3a.2;
        Thu, 10 Apr 2025 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744293715; x=1744898515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWAOaB8U3KFCIOrhTxD2O2vP23GerEEFQhxVmQdK6Js=;
        b=eWLkeK9T9a+y0qHsMHIHQj/fCUU9J0lRrOBLYMB/t2ofgN+Q/jJqYTGNImgyq03EaH
         eAEMSgsEthf9Fdr8GFaW4VbS6Q59exlvlF+MV1/99+taNGTup2cgNhOYsv0jBdLQc/Hg
         Ao75S+M6XplQwcmhsLeuZ9gsJb9bdExCCquSy9N4PUezKHubylU/sGqtR9cGfOVjj4TH
         45LtlxQxVrHW7Rm4lfgmE2QhtbKtb0G32Bw9WgTbddAMv8mTmnmqCIssdCZ1rIAsYhzO
         xTQTfYeyjs1tl1Cxrq20ZuwlKt1QCeRWJ6I5NSwakr/vy4ZZdHIpNDRxTslpKv4CnBet
         bCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293715; x=1744898515;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cWAOaB8U3KFCIOrhTxD2O2vP23GerEEFQhxVmQdK6Js=;
        b=H+SNAePb6WmNPo/FRwzox9N52gBMZmkPpfzuTlAmgVLoiBKsoCWADUEdW7w+4dQYxr
         g8e7yLqvbdUgmsrCZ+fgWvvUUZvkgKsOw5KwDywGt9IpCkn+WXaflyDnYknZu9w6PGEM
         lz7XJnmTQqd621PeiFVSjZev6b1xqMGMXqxp4Clw/aCgdN3c+fkeGahHH4UUgp6NeJd+
         bvQ9vK1DiaekUz1vTlx66dwOeDGjo7pzfmneBR3sKVI8beBqqrNUrYq0THDy/3wT3i8o
         dZagndtfMZQ1/IE2M/iDVIVofUYHEHlSyeEPy08Z4nIVKLsL7mizKPFQKQZzX7iulqhz
         CXwA==
X-Forwarded-Encrypted: i=1; AJvYcCVenepheHRzG/kUkz31Qw2tObJaj9VtXuXGR8di/mTLNt4V9uTttbJM5oFcDnfLH4baqQ+dwtS/Izge1tI=@vger.kernel.org, AJvYcCXM14eRiE9HC62n+ws8gdWmZ8PW7kuuPKV7OmeaAAYA8BJ+vajcRc4Z99TUP2HwBezqiZa+D4ESmh2SZY5jWFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLxCNFPOu44kVcQUOJg28a6wUA+LjGdSbhY7bWixOLiFV4JYAF
	JxC6BzFyu5SXyrl05asptIi5DdAGyD8LQHklqK4+gNDnGrmcPYE8
X-Gm-Gg: ASbGnctrUO+0b+0UM2olUa9K32JGaWLSmniBtMznS2Y3kU+zJrz9a/tevvhGNT2WeyG
	wcIfVwaB/MzF0X9ZSwvwdUTF/kpWWNxryPE+tv6PJd5XwQoDMeWlt+L5pNBBu3Mt7gXthPpnVl7
	8/l5GkHRIoSuOXn+t+tUc7TMT2fqqtCXISTgJjP9sPHgHgrHx0tA+4aNHuoa80UDW6Lp7o/CIM9
	ruUHazg5XURN+fI3umZgRj2Gxzi/EcGxFCFi4SgY5RvF1Urt5IpqCKpG8Op5+qq+7AJMudF5J+Q
	zDFxG/QZacRskU5Q5jIaia4VqiIBmG6T/Y2bwAGQi+iJuDDW5O01d9k5XFc3Ym/GXKw13/qa7Bu
	6mntMq0ZRIhEaheJq0xX8Cko=
X-Google-Smtp-Source: AGHT+IHBTE6t3tMPyBmMiDGR0D6P+It1/bo69iX0No3GsbY7YKBIFvGuQ1V6G4gotfqVUWbx+i87Xg==
X-Received: by 2002:a05:6a00:8c9:b0:736:a973:748 with SMTP id d2e1a72fcca58-73bbf01e262mr3359584b3a.22.1744293714003;
        Thu, 10 Apr 2025 07:01:54 -0700 (PDT)
Received: from localhost (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3824asm3362820b3a.103.2025.04.10.07.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:01:53 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:01:38 +0900 (JST)
Message-Id: <20250410.230138.20974725432146108.fujita.tomonori@gmail.com>
To: gregkh@linuxfoundation.org
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
 aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v5 4/4] rust: Add warn_on macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <2025040954-prenatal-enamel-373f@gregkh>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
	<20250409065802.136971-5-fujita.tomonori@gmail.com>
	<2025040954-prenatal-enamel-373f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 9 Apr 2025 09:38:53 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Apr 09, 2025 at 03:58:01PM +0900, FUJITA Tomonori wrote:
>> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
>> for x86_64/arm64/riscv.
>> 
>> The current Rust code simply wraps BUG() macro but doesn't provide the
>> proper debug information. The BUG/WARN feature can only be used from
>> assembly.
>> 
>> This uses the assembly code exported by the C side via ARCH_WARN_ASM
>> macro. To avoid duplicating the assembly code, this approach follows
>> the same strategy as the static branch code: it generates the assembly
>> code for Rust using the C preprocessor at compile time.
>> 
>> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
>> generate the assembly code; objtool's reachable anotation code. It's
>> used for only architectures that use objtool.
>> 
>> For now, Loongarch and arm32 just use a wrapper for WARN macro.
>> 
>> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
>> BUG/WARN functions implemented in C works.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> I don't object to this change, but I would STRONGLY recommend never
> using this in any driver if at all possible.  Only use this if the
> system is in such a state that the only way out is to reboot the kernel,
> which is what both WARN() and BUG() will do.

Totally agree.

As stated in the commit log, BUG() is already used in multiple
locations within the Rust abstractions.

I'm not trying to introduce BUG() or WARN() as new features. This
patchset aims to improve the information provided by BUG() and WARN().
