Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC0226D08
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 20:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748896386; cv=none; b=Rr4EIldBHJYBL0VpvGhsefq3Zg0Vcx7IIpfY/wO/nT0lsFq8fC56GfxycgwPuZy5HDc71e+/nSl2GcJWpob0NXRRIcSvmeRSDHNUhYnWZpCJKknqfYi386hZJFTgt6SvnenrW8wtb9EuZnmTuFH7gr3pffjhZ7GLZbW47EOBbM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748896386; c=relaxed/simple;
	bh=1igCTBg9M81etI/7/Mz0eq6DzBa8ui/fcMAMLIQ4xMI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=N8LfwawdOZPvAPkcSW/IsbC/e2XOoZneR6bqfz9/IrsaxRrcdFR+C+WFNMuvywI6sRUcsoMl+wUAvQLSij2yfDyoEsx17xbHUsTfclzWQYUqxpK9s7j5HRZ044c7Zq8UyqC5538Fkpxo1Lxkk4OfEavn5sx2p8HgykeXJHdCKgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=TZ2O+KIk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="TZ2O+KIk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a375e72473so2813746f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 13:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748896382; x=1749501182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1igCTBg9M81etI/7/Mz0eq6DzBa8ui/fcMAMLIQ4xMI=;
        b=TZ2O+KIksRGjRtvkO/Ln6aTJxDb7SunEX1vso66rsihUyrP//M9pbaZiZRIDM/H9Ip
         GEVNqG2vsLqJ0FhxhEkax/+utF2K+cVgGUf6ni+zmfAnAD0cNsMtcx9R+OCPukWDe9B7
         yO6aj8OGs9sV99BeIx5a0bsUFP2WQ5dPTHgeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748896382; x=1749501182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1igCTBg9M81etI/7/Mz0eq6DzBa8ui/fcMAMLIQ4xMI=;
        b=ouOGr3BA+W/lgVx3428xKI4T1gL1AtXtv8Tb1eCVPwHWlFddOVLt9EwDHy1A4gB41t
         ffnGYOTZazkvzMAmUsEZrEZZODKhMVY4FEm5/Pkhb1/yTwR1dshwtx4kz9hCXqI0qz5U
         GEcO1LvMH0f3UwNtoYQpwDDdQ+BawRSosidnf00mk/3pbre2p7vyk0Qwo9+igPVr/kbt
         eX2W0SM3/DBuMA3L1KUbNCjfW/sCBBzoZcAK6YeT9sqIrwAZcM6XcbN5jM3YTimGdkd5
         wnOp9IidhAMPDGeR/pyZ50805RElv5pxO53tsNXUelMESMm4c/aT+pJXAOacbFus5zZy
         44dQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4txIuqVa0it1gQm6e6sBuJrpgc5+s8EQlKdV8np6zjqi2WNVhQLVUY6SceIWbU6e4yTPW+FxnBWLP1Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFz80D+gp+hGOMfW7dbNbXMoYXnNOwSYnlOKWXjBWbqWsVXf8R
	8WukgogzqpqkJORo7gxB+NMl5VpqkZ2J0L9SIpqpNDFg7UHMbR/JSSQTGvy4VzD3+S8=
X-Gm-Gg: ASbGnctnlbn9d8HSnzKw/3nzfYHJg/X7U8mJDLZX7AhcDHsi617AXR8jXvHpJZcK6t2
	w6VzBybHz/sdI/UvTUMc0Vk9vtWu0BEnxs0yECMIhtCMQKlxU7zbW89YbY7+62X1tnycJ8BBGU6
	54CLCTMHSCvcwl8kdUeuhgrgK/HyGHf5u02Q0zI2xH4EYab26W+7l6VdYiHJ8cfvNNBTZ6u0+1X
	i6pfdwc47qh7ie0J63s96SOUvr6APFn0U1s4ovHF7kGHsVFvsSLwluHguK3Ag8ErL9SIcVRkT99
	K/jbJKqMWyhNhs5NguyA7AKZqJ9OFUKGBIKvAR+KLuQ0H4164QH9J8GqC9g3eCpob+IRckoFDDq
	dpATuaJikai0BQPPd
X-Google-Smtp-Source: AGHT+IGOvpazNhuZMWJQ17+Yy/GhcjW53zYX10UajG+DWN0YUyI16gKxZfI2YhIPBmqpryYnvC8fCw==
X-Received: by 2002:a5d:584a:0:b0:3a4:cfbf:5197 with SMTP id ffacd0b85a97d-3a4f7a1c629mr10706766f8f.18.1748896382549;
        Mon, 02 Jun 2025 13:33:02 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f90c40sm136392385e9.2.2025.06.02.13.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 13:33:02 -0700 (PDT)
Message-ID: <4e592449-7abb-4d41-992b-7fe25f667691@citrix.com>
Date: Mon, 2 Jun 2025 21:33:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jpoimboe@kernel.org
Cc: acarmina@redhat.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peterz@infradead.org, torvalds@linuxfoundation.org,
 x86@kernel.org
References: <fm4xl3yt26xbqq3oczrlbbo6ot5t6nelxweuscrbkcialcz6sp@zx57t3jh463g>
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <fm4xl3yt26xbqq3oczrlbbo6ot5t6nelxweuscrbkcialcz6sp@zx57t3jh463g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Yeah, IIRC, the problem I ran into was that clang doesn't allow defining
> asm macros in global asm().

Macros in global asm was fixed in Clang 6. 
https://bugs.llvm.org/show_bug.cgi?id=36110

But https://github.com/llvm/llvm-project/issues/60792 is still unfixed
and waiting to trip people up.

~Andrew
