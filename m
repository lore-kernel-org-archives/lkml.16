Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2BD4A07
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738221674; cv=none; b=Ody6VPU6TtFGc3PkH5Kc9zflxZcpmBuze2sppjAVcyoFd0i0P5IiQrkAe2JR7FvNgD+8CQnVRnhQaKr9gkfybfCgP7dIsk3FiWNiRz+nr3Olj+uskpO6KOVzcLc1WEGY342hyFsRxJmuz+o61Q4izy0i7fVDSej8xUQGRCUcPIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738221674; c=relaxed/simple;
	bh=c7fcohR5vD5K4nzE9sMDEX9hU2thIVLcORY/DEy+vWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0Gs3UN7X/CiwxMEn/i+UnRlvhBflieskk+fZ4buah0OlR4m5oQ3tDlpZTAE/mlw656bfnMol0W+b3bKg4CBjzCbek1v7bhMuYUiZOL9EU4y95ozu6GWyKP/oW1b4jdcxIcgnRBh/rktXTsT2QfTccWhHzJ2fH5rmf8XESIctt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IEsIeq4e; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IEsIeq4e"
Message-ID: <df858dd3-bc4f-4aa3-afe7-15d60cc63afb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738221664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/SlYlh1t5PoKXJaFz2sSS+uOGrnd3Aev92N1ZIbsQk=;
	b=IEsIeq4e/EeSNjtZZOPi+/pQsorcqHRXDX/iPVb8bKFS/ED/ECroD2fK7vw1D5x4sh5Mem
	DiU5tsdRJ2eZi38tA91JNeFl21JKbsKuTiRTPwJh6l9PwvssBB1RAS4nXDYDhOLZrP8OSK
	oScacfexMUwtOv9RCpQnbmABrtMYUvM=
Date: Wed, 29 Jan 2025 23:21:00 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: objtool failure caused some kernel functionality not working
Content-Language: en-GB
To: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Song Liu <song@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Kernel Team <kernel-team@fb.com>
References: <0bf90fc0-2287-4ce0-b810-6e383e695981@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <0bf90fc0-2287-4ce0-b810-6e383e695981@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




On 1/29/25 11:10 PM, Yonghong Song wrote:
> In Meta, when I tried to use llvm19 compiler to build a kernel with 
> PGO ([1]) support for 6.13 kernel, Ihit the following objtool warning: 
>   warning: objtool: __htab_map_lookup_elem+0x3fb: can't find switch 
> jump table
>
> The kernel is built successfully, but after booting the kernel, 
> /sys/kernel/debug/tracing/available_filter_functionsand 
> /sys/kernel/debug/tracing/available_filter_functions_addrs are empty. 
> I did some investigation and found that the warning is at func 
> add_jump_table(): static int add_jump_table(struct objtool_file *file, 
> struct instruction *insn, struct reloc *next_table) { struct symbol 
> *pfunc = insn_func(insn)->pfunc; struct reloc *table = 
> insn_jump_table(insn); struct instruction *dest_insn; unsigned int 
> prev_offset = 0; struct reloc *reloc = table; struct alternative *alt; 
> /* * Each @reloc is a switch table relocation which points to the 
> target * instruction. */ for_each_reloc_from(table->sec, reloc) { /* 
> Check for the end of the table: */ if (reloc != table && reloc == 
> next_table) break; /* Make sure the table entries are consecutive: */ 
> if (prev_offset && reloc_offset(reloc) != prev_offset + 8) break; /* 
> Detect function pointers from contiguous objects: */ if 
> (reloc->sym->sec == pfunc->sec && reloc_addend(reloc) == 
> pfunc->offset) break; dest_insn = find_insn(file, reloc->sym->sec, 
> reloc_addend(reloc)); <===== find_insn return a NULL dest_insn with 
> prev_offset == 0 if (!dest_insn) break; /* Make sure the destination 
> is in the same function: */ if (!insn_func(dest_insn) || 
> insn_func(dest_insn)->pfunc != pfunc) break; alt = 
> malloc(sizeof(*alt)); if (!alt) { WARN("malloc failed"); return -1; } 
> alt->insn = dest_insn; alt->next = insn->alts; insn->alts = alt; 
> prev_offset = reloc_offset(reloc); } if (!prev_offset) { 
> WARN_INSN(insn, "can't find switch jump table"); <===== error message 
> here. return -1; } return 0; } The find_insn failed for 'prev_offset 
> == 0' at the second iteration and finally the function return -1, 
> which propagated to decode_sections() in func check(). Since 
> decode_sections() got an error ret the later 
> create_mcount_loc_sections() will not be called. This caused the above 
> available_filter_functions issue.

Sorry for the mess-up for the above code.  The summary is:

The kernel is built successfully, but after booting the kernel,
/sys/kernel/debug/tracing/available_filter_functions and
/sys/kernel/debug/tracing/available_filter_functions_addrs
are empty. I did some investigation and found that the warning is at func
add_jump_table().

The find_insn() failed for 'prev_offset == 0' at the second
iteration and finally the function return -1, which propagated to
decode_sections() in func check(). Since decode_sections() got an error
ret the later create_mcount_loc_sections() will not be called. This
caused the above available_filter_functions issue.


>
> The following are some codes related to func__htab_map_lookup_elem():
>
> Disassembly of section .text.hot.__htab_map_lookup_elem:
>        0000000000000000 <__htab_map_lookup_elem>:
>        0: e8 00 00 00 00                callq   0x5 
> <__htab_map_lookup_elem+0x5>
>                 0000000000000001:  R_X86_64_PLT32 __fentry__-0x4
>        5: 55                            pushq   %rbp
> ...
>      3f3: e9 03 fe ff ff                jmp     0x1fb 
> <__htab_map_lookup_elem+0x1fb>
>      3f8: 41 ff c8                      decl    %r8d
>      3fb: 42 ff 24 c5 00 00 00 00       jmpq    *(,%r8,8)
>                 00000000000003ff:  R_X86_64_32S 
> .rodata.hot.__htab_map_lookup_elem
>      403: 44 0f b6 42 0a                movzbl  0xa(%rdx), %r8d
>      408: 41 c1 e0 10                   shll    $0x10, %r8d
> ...
>      45b: 44 0f b6 42 02                movzbl  0x2(%rdx), %r8d
>      460: 41 c1 e0 10                   shll    $0x10, %r8d
>      464: 44 01 c0                      addl    %r8d, %eax
>      467: e9 26 fe ff ff                jmp     0x292 
> <__htab_map_lookup_elem+0x292>
>      46c: 41 89 d8                      movl    %ebx, %r8d
>      46f: 89 c1                         movl    %eax, %ecx
>      471: 89 c5                         movl    %eax, %ebp
>      473: 48 89 f2                      movq    %rsi, %rdx
>      476: e9 0d fe ff ff                jmp     0x288 
> <__htab_map_lookup_elem+0x288>
>      47b: 44 0f b6 42 0b                movzbl  0xb(%rdx), %r8d
>      480: 41 c1 e0 18                   shll    $0x18, %r8d
>      484: 44 01 c5                      addl    %r8d, %ebp
>      487: e9 77 ff ff ff                jmp     0x403 
> <__htab_map_lookup_elem+0x403>
>
> Disassembly of section .text.unlikely.bpf_percpu_hash_update:
>
> So the func __htab_map_lookup_elem() size is 0x48c.
>
> Here, insn 0x3fb is a jump table insn, the following is the actual 
> jump table:
> RELOCATION RECORDS FOR [.rodata.hot.__htab_map_lookup_elem]:
> OFFSET           TYPE                     VALUE
> 0000000000000000 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x29e
> 0000000000000008 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x48c
>                                           <==== problematic one
> 0000000000000010 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x45b
> 0000000000000018 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x44f
> 0000000000000020 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x447
> 0000000000000028 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x43b
> 0000000000000030 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x42f
> 0000000000000038 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x423
> 0000000000000040 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x41b
> 0000000000000048 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x40f
> 0000000000000050 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x403
> 0000000000000058 R_X86_64_64 .text.hot.__htab_map_lookup_elem+0x47b
>
> Note that for the second entry which has 
> .text.hot.__htab_map_lookup_elem+0x48c
> which is right after the last insn. This caused the problem for 
> objtool since
> jump target is not within the function, rather immediately after the 
> function.
>
> There are quite some similar cases in my build.
>
> The llvm18 does not have issues. I tried to bisect what changed in 
> llvm19 and
> found the following llvm patch is responsible:
>
> https://github.com/llvm/llvm-project/pull/96089
>
> Basically, the compiler might be able to create a jump target which 
> actually
> not possible at runtime. For example, in one of examples in the above 
> llvm patch, something
> like
>        if i >= 3 goto out;  /* i unsigned */
>    switch i, label default_unreachable:
>      case 0:  goto label1;
>      case 1:  goto label2;
>      case 2:  goto label3;
>    label1: ...; return;
>    label2: ...; return;
>    label3: ...; return;
>    default_unreachable:
>
> I think that this should be a valid code from compiler perspective.
>
> Can we fix objtool to handle jump target which is immediately after 
> the func body?Thanks, Yonghong
>
>
>   [1] 
> https://patchwork.kernel.org/project/linux-kbuild/patch/20210407211704.367039-1-morbo@google.com/#24246189

