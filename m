Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434842505B9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743706667; cv=none; b=XK/eLb+bfHf5///dVDm8WCQT9XSohI6BWHz44zER6ZBBCRFIM5VFFgXl0QhU3oU7mw8dGS2c/p1lErg/UgEgYvExH3PYymuFcGjKMJ5Higtto5t0KMECm0vIKw/6UEMd5gacK7+xduauptDOtg8RT0zGyAxlLCFnNL76pTGoLAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743706667; c=relaxed/simple;
	bh=/gBP81I5zNLL1Q2D2v1JUnUwPv37K95XsmPx64/liNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bv/+mAnncgE/+zm3ZPUp3+V7X3Dc5s8droILAo6flnCf4uyTYPwljXwL9jIDDtAK1TVHfzqGewM5sAfhh9r8pvRin7UhwkEIV3VGwhiXHaryocN+SBjhN6/M92h+UHcfGXQbgNXWxXCcn8d3IA62MOxVSG3hNr9LMxcHPv/JYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=BFOqTnqO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="BFOqTnqO"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39149bccb69so1104977f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743706663; x=1744311463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rzXg6/n+niX3ZCFwB6Fc/ze62p+d9zajSVGy/YRWKJ8=;
        b=BFOqTnqOcGtnrsWg6gJASCxz8Ge91l7XyoPXvN7iU0CBUtzgEMpLGQUxUP0ekh/QWr
         dpQjsGs8eo6nDUGW5eNFTfjMfI7C913JGN5VHwxaqXowsMseHVam+j3GsF9Fl3MYiL9o
         +ei0ftA6fZ83bzoqlG77h4xr2mDU3DY6MwfI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743706663; x=1744311463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzXg6/n+niX3ZCFwB6Fc/ze62p+d9zajSVGy/YRWKJ8=;
        b=v5wN6n+TJyFysqg4ydFpbUDQGTRkwHM/Nc/QKtW292ifTw5f34DPeRH7073rHvr7AK
         TIVpTkIwhGq17rxONuuxEOYsPHPa+hVDr853ZO7KMW69orHzDbt06YJY860oTJHkkBmz
         wujgu9ll8PNF4U3DxjTQdOq2V4iP52m/MRfssgxzXSPR8m3ErAhDI24mVhnrnkvrC8YK
         NazgNVUtEXdJpRQFjLi1Vqcc4/MQq6EHAwob6+fstQnBaERtRwLKpVfhv2b4zpKL8xf+
         hrCtJOEm9AMZM05Sp+Gphx9Z0DZcpXIqyyXaHgqKTxCPJRKtjOPqHoTxHIaqzHiyRYUu
         mj/Q==
X-Gm-Message-State: AOJu0YzsW9gbCG3JVm3cydVDJyvSOBQgrQNtutafqRBu5hf0PIlEDdjD
	Hyf646mqDKLc9GQwbGmYQhdcNK36WnD10K64aGHkNt1G4Br24OR2XvYgo0TTvWY=
X-Gm-Gg: ASbGnctmtmH74JDid8wEiN57vu0YYr5QpHdN9E+Y/874sbyGE++XjR8aDkuZdN7di67
	tP/EzNtdtxsGsWHcJkE1gbxCwXKOp5wdQwj1o8M6o6igwUbe+FsVoT04jWH9HWAA5lnKYTVdcTi
	c65aeuTbUvpGNgTA/GyQcA1R8VHpnOqOL9YCGSglQ0Wyx25m+mH74eLJLtgDQ4OG/jxuuHzBqZc
	I9fUMoL7P8EecabI9Rmos2vWEof02ZHYM3W5PTREqp0LjSQY32fuQ0J8+2av6il4FxhUceO2Avs
	iKajI4kqU2tOnS01TdJyFD8IwdVm6zL9sm81kDDdFsxdwkvEVKFP0IoOKi8gBkMHB5qE+TduXL6
	vtloz0bsU1Q==
X-Google-Smtp-Source: AGHT+IF3Os9I8mNYrxum5iu2+yPwOfy7Ho0IFC5zjF/NHjT5hty7rZ3L55lXCd3EubdLm9+5d8Nh5g==
X-Received: by 2002:a05:6000:2283:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-39cadc701e8mr412660f8f.0.1743706663489;
        Thu, 03 Apr 2025 11:57:43 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630de9sm28929825e9.1.2025.04.03.11.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 11:57:43 -0700 (PDT)
Message-ID: <2970eb7e-030d-4257-ad2f-64e378037dd8@citrix.com>
Date: Thu, 3 Apr 2025 19:57:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Juergen Gross <jgross@suse.com>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
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
In-Reply-To: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2025 7:48 pm, Josh Poimboeuf wrote:
> The !CONFIG_IA32_EMULATION version of xen_entry_SYSCALL_compat() ends
> with a SYSCALL instruction, which in reality is a hypervisor call to
> trigger an IRET.
>
> Objtool doesn't know that, so it falls through to the next function,
> triggering a false positive:
>
>   vmlinux.o: warning: objtool: xen_reschedule_interrupt+0x2a: RET before UNTRAIN
>
> Fix that by adding UD2 after the SYSCALL to avoid the undefined behavior
> and prevent the objtool fallthrough, and teach validate_unret() to stop
> control flow on the UD2 like validate_branch() already does.
>
> Unfortunately that's not the whole story.  While that works for
> validate_unret(), it breaks validate_branch() which terminates control
> flow after the SYSCALL, triggering an unreachable instruction warning on
> the UD2.
>
> The real problem here is that INSN_CONTEXT_SWITCH is ambiguous.  It can
> represent both call semantics (SYSCALL, SYSENTER) and return semantics
> (SYSRET, IRET, RETS, RETU).  Those differ significantly: calls preserve
> control flow whereas returns terminate it.
>
> validate_branch() uses an arbitrary rule for INSN_CONTEXT_SWITCH that
> almost works by accident: if in a function, keep going; otherwise stop.
> It should instead be based on the semantics of the underlying
> instruction.
>
> INSN_CONTEXT_SWITCH's original purpose was to enable the "unsupported
> instruction in callable function" warning.  But that warning really has
> no reason to exist.  It has never found any bugs, and those instructions
> are only in entry code anyway.  So just get rid of it.
>
> That in turn allows objtool to stop caring about SYSCALL or SYSENTER.
> Their call semantic means they usually don't affect control flow in the
> containing function/code, and can just be INSN_OTHER.  The far
> returns/jumps can also be ignored as those aren't used anywhere.
>
> With SYSCALL and SYSENTER, INSN_CONTEXT_SWITCH now has a sane
> well-defined return semantic.

Do you mean "without" here?

>
> Fixes: a2796dff62d6 ("x86/xen: don't do PV iret hypercall through hypercall page")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

Thankyou for all your help on this one.

> diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
> index 33d861c04ebd..628c2c8a0f6a 100644
> --- a/tools/objtool/arch/x86/decode.c
> +++ b/tools/objtool/arch/x86/decode.c
> @@ -535,10 +535,9 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
>  
>  			insn->type = INSN_JUMP_CONDITIONAL;
>  
> -		} else if (op2 == 0x05 || op2 == 0x07 || op2 == 0x34 ||
> -			   op2 == 0x35) {
> +		} else if (op2 == 0x07) {
>  
> -			/* sysenter, sysret */
> +			/* sysret */
>  			insn->type = INSN_CONTEXT_SWITCH;

Linux doesn't use SYSEXIT, but it's conceptually like SYSRET/ERETx so
perhaps worth keeping the 0x35 here?

~Andrew
