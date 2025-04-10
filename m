Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FD828CF71
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307152; cv=none; b=HCYPOvel6+X8z+ic6ZNnhclNlsDLVX6VDeyApFZ5au7CL76ImTBKhHceKwU81Ksi6zzoLYfsMBhOVmla1uAr1D6t5HPJgZWn88XYfgPzEj50qFREPMhE+8wys9qNob6ayp3MUS48pLbyLhaNWwq+ZtCdGA1CEuBJ4CyxgWe8oYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307152; c=relaxed/simple;
	bh=cEZAu9tvl0UjsVKyxpW5HTp16L+klq+gUgLQuETOTGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COzio5Ql4dXtho43S1r1VvpXJymVjPi8Y8pm2lu2689YUkI5szWv6MNOMAbaQuE+2Au0QcK9bUdELHViuCmDJNa0/eIhohMHQkUyyO06hafW+xf1ySA05H/FIiyaarq7wJPapTo5SxBXi3lcMrn5azi1ujwij/zSH/NE+M+jsgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=mQjAnV7+; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="mQjAnV7+"
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53AHjJ7n028183
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 10 Apr 2025 10:45:19 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53AHjJ7n028183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744307120;
	bh=/Y7ECVM/3qDzGWeUBCLMo/B6clqN9FVRsb1Jhfwi/+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mQjAnV7+3HjL95j0BI/yHtPQpoFmi0yRgDFay4sRTNGroocLPOrPFaD4DhD1SxzwD
	 DY6c58ZcWek7dlzfJ15AoeMO75wT1KoUh0oEnSuEGkRuc7k9/H9TkzbI2jaAO5ctxT
	 f1csTbThEtBea3c8Eue2JwNCR3Ev2vMSc4sI4gSctk5XP5a5uz+vqa/FLGvNN/M0jk
	 mlqghA0J4rMM37F2Z/ynAd3k6cP2SYITxsgJIQ3wVW4t7yRKn7E0lM34YnjKaX/uL8
	 emFJ7xR7c/mTstr2NXcN5413BO2UDo4jossCElfA8apA90Jd0pKCi6MWqUt/oFOTc/
	 kvjAWbmmxR7jw==
Message-ID: <43203e47-7406-44cb-b783-3d71ff4d01ed@zytor.com>
Date: Thu, 10 Apr 2025 10:45:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] x86/msr: Standardize on 'u32' MSR indices in
 <asm/msr.h>
To: Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
        Juergen Gross <jgross@suse.com>, Dave Hansen <dave.hansen@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>
References: <20250409202907.3419480-1-mingo@kernel.org>
 <20250409202907.3419480-7-mingo@kernel.org>
 <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com>
 <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com>
 <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com>
 <3B57B3E5-47C9-4196-AD2B-44916E18B6D0@zytor.com>
 <3e2a52c5-791a-4e96-a768-8579ec841dd1@zytor.com>
 <e3d8db6a-dfb9-49d5-8c7f-b4a1d2faf575@zytor.com>
 <20250410074828.GU9833@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <20250410074828.GU9833@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/2025 12:48 AM, Peter Zijlstra wrote:
> I have vague memories of locations where we*have* to use native_{rd,wr}msr()
> because the paravirt indirections cause problems.
> 
> I don't clearly recall the reasons, but it could be instrumentation
> related. The paravirt muck has tracepoints and other crap included.

Hey, I was discussing this with hpa a few days ago ;)

Here is the existing code:

#define native_wrmsr(msr, low, high)                    \
         __wrmsr(msr, low, high)

...

static inline void notrace native_write_msr(unsigned int msr, u32 low, 
u32 high)
{
         __wrmsr(msr, low, high);

         if (tracepoint_enabled(write_msr))
                 do_trace_write_msr(msr, ((u64)high << 32 | low), 0);
}


So native_write_msr() is just native_wrmsr() + do_trace().

native_wrmsr() is used only once in arch/x86/coco/sev/core.c, and Boris
explained that in commit:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f980f9c31a923e9040dee0bc679a5f5b09e61f40.

     [ bp: Use the non-tracing rd/wrmsr variants because:
       vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x11f: \
               call to do_trace_write_msr() leaves .noinstr.text section
       as __sev_es_nmi_complete() is noinstr due to being called from the
       NMI handler exc_nmi(). ]


It's confusing from the function names when to use native_write_msr()
or native_wrmsr() after removing the paravirt MSR APIs.  And I want to 
rename native_wrmsr() to native_wrmsr_no_trace(), and then
native_write_msr() to native_wrmsr() to make their difference explicit.

The same to native_wrmsrl(), which is used in VMX noinstr functions.

There is only native_rdmsr(), but no native_rdmsrl().  And 
native_rdmsr() is used in microcode code only.


BTW, using the native_*() functions on Xen shouldn't be a problem,
because they cause #GP and then Xen could:

1) emulate the MSR instruction, and advance guest IP.

2) inject #GP back into the guest, and the guest MSR instruction is
skipped in guest #GP handler, with MSR access *_safe() APIs an error is
returned to the MSR APIs.

Thanks!
     Xin
