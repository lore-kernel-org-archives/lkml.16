Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4BC171C9;
	Sun,  6 Apr 2025 21:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743976134; cv=none; b=ayWzzxtF6J6XjVjXRLPEaWughYgi/6Flw7wf89THs3Ta/ptaoj1IlH921CEQ6euvpuq6VJxvmxtPpnnAjYAmog7OTf9wvGhGT4tO9i40kw9BSr/3N2E5WV7Gc8ZW8Xce6M61VQT8jWPXpvtbJLJN6E2J6XCxw5uxV8CD16OrVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743976134; c=relaxed/simple;
	bh=PRiUAHuapsHhA19g4WPSvr6Qs5u3n/NllBUUPCf8VJs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=IZwcDnCSNDDZvgvkwRBeG2y1RgmvET5hR2R3+iMVXfhmauFyyyiqezQnacKQ+OXu0C6itmmTPnWfXiIU1SFW+UvEunEBBa9f4JQpYIllqg58MSzPZvcirc5Jz+QX2rnJRLYeH230KVNJebq3uS+nPdxY8G1Ztx+L/b1g19/XcZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOt6/DUa; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOt6/DUa"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ed16ce246bso18188876d6.3;
        Sun, 06 Apr 2025 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743976132; x=1744580932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNgkV292MAez/Ftrvz5rqrrsIqnUNqRnV30Y0Cya1t4=;
        b=lOt6/DUao1AfpUUeLkwRoigudxWPWcFJh382JmyIkY30mwbiNVQPFqFMWqbUIxqgUK
         0ms4W+sQIcRWOWj68D6G+AhEV8Q4e6sicpfV8C4k4ADZ/FNrqWIbVc9YYXHjMPBbxFNE
         mDHRTzlsBXYyJL7zZNkCbgIjlCh2II9PV0/KwvwKfSzL/WVCf4/FFDrtmviewPTKTP81
         qvkDyDkK8PZKcrqev0P1LC/JXOkwi9L+LxGXuUiXjfCYM+IwjcLOBmolNpSTaHTApRxn
         UzWX2m4AKHXpia64vxQNzBSHGJoBBRAQpFesSj25zkV8vXczbAXVLP5ZKE8QETn2O+A1
         rR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743976132; x=1744580932;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNgkV292MAez/Ftrvz5rqrrsIqnUNqRnV30Y0Cya1t4=;
        b=NANrzMQQSQH1CaILCSHMi7lyqrDtbhFggXaL6LQst2rGsh7lJq9iW1U0WYjIlwVNDS
         3H+DFUbReai0Z05Ctz4tAiU2B6q8ifZ8RxFpHs5dVqQPTVyW/2K2p5qOknw+42R4/XRI
         plaUWZxfsi0vINHxGvezCVQgMMHT6xkUFfoeu4FiUrkng4hdAoyUZigMznLRCPFdgG0u
         3BWQpY7rbg5x3yjjlSBACDucjBgAzExBbjhbyq+XCjmLDESkjINUUzIW/7Ude5jsKCaU
         sCnEU2x54KHuIYkqS2BFKhaRR+1MQ/cH6vr+tvOUPr5Vcyo4YFpKzk5iY5JsBQy7X/Ok
         wOnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXMbr++W44nqx5rO+E6T/Lkt2fUDgDqRkWZM41ZUzDIBs3vYrln7u/+5BNKZO90xpzSl5yKoxxDHc=@vger.kernel.org, AJvYcCWNICzkpK57fGs/LVBlE/sHeR69Wy+gZ70txSd/2c05oKTUL/C4T827tEI5NWIiV23nUtJJL/AHQXplAnN6@vger.kernel.org, AJvYcCXA/C69gz4DjuSzjmj/iywj1z02P/n3CivHBsJawVoZE4FG/UJn7ICWPytdHjhPvRfxyOSvbNKN+vMiGIB2Ox4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fXFG6LIrqSTmGcnPNPY9A6osEffYQ37t1rKjp0Amn4x22/eu
	8Dhif/tt49wtkry7HHxW7HCtCIPLTkFdcBokkXaAdoUj7oY2GY/a
X-Gm-Gg: ASbGncttCFPhJY8Xv+99P8LwIP+piZo62re2ACyg12bnzzntQgFd858lxCginQW2eIp
	iC92Mg4BqgTtlNciTTUnK7cMr0NKqGr2/1mAKjySgitMzAIIZexgZV2ZhZEjnCFvQwEZgBfhdQl
	5OBcKV4jvWjnff9FJqxZW3BiE/rzXEDrKr4NPC1Q9sMWpITnyueDZo/hZHUERhRnz10TiNbzsDT
	zB3rrcegPbMQw2jAgNIWtfSFV4oyS9RjPu2o6jUOd31X+BDzGFUVdYRbwu9ueLVHWtG//xm05RC
	45CFVnooxXZaweVgvQZ0NHUMaIRnLu6k4P5lPnWaMkrXmg==
X-Google-Smtp-Source: AGHT+IEo/vvFQikPb5wxHN+5EYi3j68mWX6w5dxqxY4oIDDLekC3VENJPnI/ETKSgmdjhcKRZswhKQ==
X-Received: by 2002:a05:6214:e86:b0:6e8:fa72:be51 with SMTP id 6a1803df08f44-6f05850ca4bmr173026176d6.19.1743976131657;
        Sun, 06 Apr 2025 14:48:51 -0700 (PDT)
Received: from [192.168.38.58] ([24.35.8.11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75b747sm510189385a.36.2025.04.06.14.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 14:48:51 -0700 (PDT)
Message-ID: <10600492-5f89-4c1b-a8a4-0396af93f264@gmail.com>
Date: Sun, 6 Apr 2025 17:48:49 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: chrisi.schrefl@gmail.com
Cc: Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, alex.gaynor@gmail.com,
 aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org,
 benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, stappers@stappers.nl, thesven73@gmail.com,
 tmgross@umich.edu
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Content-Language: en-US
From: Manish Shakya <msh.shakya@gmail.com>
In-Reply-To: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I followed the Documentation/rust/testing.rs document to test more. It 
seems that only the KUnit test is possible, while the other two tests 
are not feasible in a cross-compilation setup. What other tests need to 
be performed?

The KUnit test passed.

[    1.162374] # rust_doctests_kernel: pass:128 fail:0 skip:0 total:128
[    1.162388] # Totals: pass:128 fail:0 skip:0 total:128
[    1.162401] ok 1 rust_doctests_kernel

Here is my current setup:
# zcat /proc/config.gz | grep RUST
CONFIG_RUSTC_VERSION=108600
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_RUSTC_LLVM_VERSION=190107
CONFIG_RUST=y
CONFIG_RUSTC_VERSION_TEXT="rustc 1.86.0 (05f9846f8 2025-03-31)"
CONFIG_HAVE_RUST=y
# CONFIG_RUST_FW_LOADER_ABSTRACTIONS is not set
CONFIG_TRUSTED_FOUNDATIONS=y
# CONFIG_BLK_DEV_RUST_NULL is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SAMPLES_RUST=y
CONFIG_SAMPLE_RUST_MINIMAL=y
CONFIG_SAMPLE_RUST_PRINT=y
CONFIG_SAMPLE_RUST_HOSTPROGS=y
CONFIG_RUST_DEBUG_ASSERTIONS=y
CONFIG_RUST_OVERFLOW_CHECKS=y
# CONFIG_RUST_BUILD_ASSERT_ALLOW is not set
CONFIG_RUST_KERNEL_DOCTESTS=y

# cat /proc/cpuinfo
processor       : 0
model name      : ARMv7 Processor rev 2 (v7l)
BogoMIPS        : 298.84
Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls 
vfpd32
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x3
CPU part        : 0xc08
CPU revision    : 2

Hardware        : Generic AM33XX (Flattened Device Tree)
Revision        : 0000
Serial          : 4014BBBK0948




