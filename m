Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB011F584F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707751; cv=none; b=AU2gO7yupeSJQrmGnX0QbLGqPAz8YzjL+t1xevwHKrznJnkLoVlZPfoSe7YLHSv7Qfd2Mbjv21qolTD55oqQOLENJbYwSg9x4lgiR1rweboXTArFerbnCCA+rWWoXvxMPDUvHTojY+1SRXAnQpXMMecD8Z6MCNx3xEEK3NWqSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707751; c=relaxed/simple;
	bh=6L0DrHSz79auKHnHlUequ/bfgNFfDjNtKmaT00LW940=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiRciIMEUTkqeR7IWUqC9KNecPzIT3IPqLo7pEjXo1IxQ5YK8XvGivg1D7GaDJec86VKfkq9SLSXC/KUbt4F0x3xuDL3lrOtWmhyW+piz/2+AIBfcgqUVR+nXBFh2g4PmL6BIIPB5mpMyKjzHV3YJb3VcHrDAxTqaHjZ+LxE8cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=M80wRiec; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="M80wRiec"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1531775f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743707747; x=1744312547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KIO51Ncx9Hm7idhTss2D3U/7NsBofCxS19LS+SoTL2k=;
        b=M80wRiec940CuLVXV8SGRzv2ifKuOoIyaRGY2zgRbAvnMF6T8/lGJyjxJHTjNOHEo9
         9LhzIkIosbQPoSawecfYLWsK4rwIH/MqpdvSjqQEBjZ/BfLBhQiq3jGd7kjxtiFRa93G
         BNSp/V+0VRL+Cflsxb1sGxOxVvMPqUyk330pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707747; x=1744312547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIO51Ncx9Hm7idhTss2D3U/7NsBofCxS19LS+SoTL2k=;
        b=f7RxZNNwDsq5u/1qodi09I83o1Gfxk6N2AaV8SJKhC35uTN17G5K1vg17szmBBeJfA
         EmLlZEYuXRQ+it+ZBfk5Fchlt/jG56+oVybyu/+6G1LlW80VbBOtRFpcJdmFdEa1bZv3
         dfRMTJL2480xeJEJ/qmEW9w5TD+pzdtSQxTs8xUp3lafYudingnLCXdHU62lx7uZs2YM
         H8U46qU3FEGDTFU1B9jQ4zwEScDof40emg5hTEXGiTdQWeIwOERNqYN7XIDZ+TpTweMO
         4qKF9TJClE96RMzW1puQTzZszwDqi7leJHnmMocPjhu3Wv2RIAj6ltERbsVUyEHxkbVX
         kqvg==
X-Forwarded-Encrypted: i=1; AJvYcCW1bp153GNoX5aFxsPKNtM8tcPhvAFnjqOItNEWRo/6b4Zk2M5jmjO2nK1oXlE8TCJKVuQDIS+Z1ZXOP1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9hGY8WDaB+5eKR4VJ6U5W4HB/60fgJe54BZ+qI2AWk6uzJ9LN
	3ogWXgLKZ9pBTJvuKclXl8sYDdZhgtiTQvaT1gFLbTyfZPzbhXyvNZljpGyDhng=
X-Gm-Gg: ASbGncuB3/EMozjl93I0pbdpP2a/qVE4wBrIO+hXBqivv9Ux19N523ejRUnKKGbCnEv
	XVr4gyRptG4PYiysEvRensbRB3QMupYEIoJpJ3kkFbLONwSPqeWXYMtb+Wfu3V4MXOUYqun1Kmr
	k6p35x7pc+5t2I3f+taEAWxWuXYbQmQAkjlO6x4+NBVJEnimfdtnsr6C/Hc79fVZoJ+Uo5r9mm3
	B7ckcDWRb8Nmodp9Lo7B4UJ00uwYfh07I0vy4v1XT+4krjjVSeBWal0Z0z3CBaFT5d+fG1Z8h8Z
	9OkV8bTf2dL0cewMvBl/TBCmTEciC7xbxMie7T7j3hP6CrqIZwzDP5zBrBXckhm+KUGE4wp7/yl
	13w0akocmVw==
X-Google-Smtp-Source: AGHT+IHekUNgwhj9DpgDv0Y5SocwKCSsCHHGrOVYzf38uFF3V6IEkKSQE+BYPCDPLt+Ihfc6Uj63Zg==
X-Received: by 2002:a05:6000:40cd:b0:390:dec3:2780 with SMTP id ffacd0b85a97d-39cba94d1eemr493930f8f.24.1743707746652;
        Thu, 03 Apr 2025 12:15:46 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226e9asm2564978f8f.94.2025.04.03.12.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 12:15:46 -0700 (PDT)
Message-ID: <ea4473f7-fb94-4fdc-ad4b-9d9f1f4be5de@citrix.com>
Date: Thu, 3 Apr 2025 20:15:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] objtool: Fix SYSCALL instruction handling and
 INSN_CONTEXT_SWITCH
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Juergen Gross <jgross@suse.com>
References: <41761c1db9acfc34d4f71d44284aa23b3f020f74.1743706046.git.jpoimboe@kernel.org>
 <2970eb7e-030d-4257-ad2f-64e378037dd8@citrix.com>
 <kykaol3hdxxvpwa7drnlidgeqb5cgkrdpo7bokifihob73hwyx@cu6sfkz3z6ze>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <kykaol3hdxxvpwa7drnlidgeqb5cgkrdpo7bokifihob73hwyx@cu6sfkz3z6ze>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2025 8:05 pm, Josh Poimboeuf wrote:
> On Thu, Apr 03, 2025 at 07:57:42PM +0100, Andrew Cooper wrote:
>> On 03/04/2025 7:48 pm, Josh Poimboeuf wrote:
>>> With SYSCALL and SYSENTER, INSN_CONTEXT_SWITCH now has a sane
>>> well-defined return semantic.
>> Do you mean "without" here?
> I was just testing to see if anybody actually read all the way to the
> bottom.  Congratulations, you passed the test!

A likely story, methinks...

>
>>> diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
>>> index 33d861c04ebd..628c2c8a0f6a 100644
>>> --- a/tools/objtool/arch/x86/decode.c
>>> +++ b/tools/objtool/arch/x86/decode.c
>>> @@ -535,10 +535,9 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
>>>  
>>>  			insn->type = INSN_JUMP_CONDITIONAL;
>>>  
>>> -		} else if (op2 == 0x05 || op2 == 0x07 || op2 == 0x34 ||
>>> -			   op2 == 0x35) {
>>> +		} else if (op2 == 0x07) {
>>>  
>>> -			/* sysenter, sysret */
>>> +			/* sysret */
>>>  			insn->type = INSN_CONTEXT_SWITCH;
>> Linux doesn't use SYSEXIT, but it's conceptually like SYSRET/ERETx so
>> perhaps worth keeping the 0x35 here?
> In theory yes, but objtool will never support x86-32.  Note I also
> removed retf and jmpf, I'm thinking it's simpler to just stick to the
> instructions we actually use.
>

Perhaps, but they'll now become INSN_OTHER, won't they?

If they're instructions genuinely expected never to encounter, wouldn't
it be better to make a hard error rather than to add another fallthrough
case?

~Andrew
