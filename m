Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057382114;
	Sat, 29 Mar 2025 20:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743278821; cv=none; b=niAxHdxMHpBHWxEf2K7iHA6OwfjD63RRLtQUk7JwVxy9/29K2Q//raPSNyLDMFHMjpi7mku1ll6HE9DuS1h0FP6bcQbPvNgFcGzSkLfwV3gUSrgKpprzdhOrgZn/Kg4gLoSe9AmKE3yGKNDoBsTusIOTe4qlu34sbILHMc1Us0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743278821; c=relaxed/simple;
	bh=CnMAIK2S5jW1lrFK3DLs+ctoDN+NeMvE54rkKhb2/24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2udSRp6/G7aGQlLQ3ASJ02pocPEHltw2xuMJA9/Yej55Fg79OD5cFenndouBXWk9p3aAclm8jQ3d3tY50O/YUd5gbb99eZzbM/YHi6j5ycjkktYbdbZd7fN+OBwe3RBBtOd3alLiUj7BGfVFzLjinmgcPfFEADiS7LZM3RYwNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu5H4d25; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu5H4d25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6367C4CEE2;
	Sat, 29 Mar 2025 20:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743278820;
	bh=CnMAIK2S5jW1lrFK3DLs+ctoDN+NeMvE54rkKhb2/24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nu5H4d25/ZQEThQzbgdQFI6hYbxhmumxQPSW2xyrakAiq1lBdu54vLCyO3oe17QVZ
	 ClvRkMALv+0vO5BOuoXEBVIAuwf0zMD0kpP0ln/yhFEJvx2E+knPr1/We9d7jEULNo
	 +ITz64eazUTjV0NM2QHV4dsN746Z94JH7EgRnXXd7yPLZ4rlDhHq0nHaJTe/qCcdte
	 hg9rfqOfu37wVbzWQjnzrOp3rF2H2eHU2/TIL4O8LJeOfANlkvYQD+ACaGSnBMVE8P
	 JHtsk4jUeqUyXk4wRbnzeJMNlv177lECEXwMyE5QDFMS0U3r/VA/3d9O5zOJ68E8tt
	 KxSmTRE4Q31jg==
Date: Sat, 29 Mar 2025 13:06:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:objtool/urgent 9/23] vmlinux.o: warning: objtool:
 cdns_mrvl_xspi_setup_clock: unexpected end of section
 .text.cdns_mrvl_xspi_setup_clock
Message-ID: <20250329200656.GA127272@ax162>
References: <202503282236.UhfRsF3B-lkp@intel.com>
 <az2awlpfs7wt46kwql7ke3iereryykdroymfuaxawz5gozaxyi@rhlmbjkp3sdg>
 <20250328232449.GA2955081@ax162>
 <nbth6u2fgdbtw52ll5tzc5qfrfasikqcjbx4eltdezqcagnkkg@wwtkkf2vrjbc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nbth6u2fgdbtw52ll5tzc5qfrfasikqcjbx4eltdezqcagnkkg@wwtkkf2vrjbc>

On Fri, Mar 28, 2025 at 09:46:06PM -0700, Josh Poimboeuf wrote:
> On Fri, Mar 28, 2025 at 04:24:49PM -0700, Nathan Chancellor wrote:
> > vmlinux.o: warning: objtool: synaptics_report_mt_data: unexpected end of section .text.synaptics_report_mt_data
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x33e: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x254: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1d4: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x1b8: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x156: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x13a: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xda: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0xbe: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x63: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x48: (branch)
> > vmlinux.o: warning: objtool:   synaptics_report_mt_data+0x0: <=== (sym)
> > ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --static-call --uaccess --noinstr --link vmlinux.o.orig -o vmlinux.o
> 
> Nice!  Can you share the disassembly of the function?

Sure thing!

>   objdump -drw -j .text.synaptics_report_mt_data vmlinux.o.orig

0000000000000000 <synaptics_report_mt_data>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	41 57                	push   %r15
   6:	41 56                	push   %r14
   8:	41 55                	push   %r13
   a:	41 54                	push   %r12
   c:	53                   	push   %rbx
   d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  11:	48 83 ec 50          	sub    $0x50,%rsp
  15:	41 89 d3             	mov    %edx,%r11d
  18:	49 89 f7             	mov    %rsi,%r15
  1b:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 22 <synaptics_report_mt_data+0x22>	1e: R_X86_64_PC32	__stack_chk_guard-0x4
  22:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
  27:	4c 8b 75 08          	mov    0x8(%rbp),%r14
  2b:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	2e: R_X86_64_32S	_text+0x7f000000
  32:	49 29 c6             	sub    %rax,%r14
  35:	48 8b 1c 25 00 00 00 00 	mov    0x0,%rbx	39: R_X86_64_32S	current_task
  3d:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 43 <synaptics_report_mt_data+0x43>	3f: R_X86_64_PC32	__preempt_count-0x4
  43:	25 00 01 ff 00       	and    $0xff0100,%eax
  48:	74 10                	je     5a <synaptics_report_mt_data+0x5a>
  4a:	3d 00 01 00 00       	cmp    $0x100,%eax
  4f:	75 35                	jne    86 <synaptics_report_mt_data+0x86>
  51:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
  58:	74 2c                	je     86 <synaptics_report_mt_data+0x86>
  5a:	8b 83 88 14 00 00    	mov    0x1488(%rbx),%eax
  60:	83 f8 02             	cmp    $0x2,%eax
  63:	75 21                	jne    86 <synaptics_report_mt_data+0x86>
  65:	48 8b 83 90 14 00 00 	mov    0x1490(%rbx),%rax
  6c:	48 8b 08             	mov    (%rax),%rcx
  6f:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  73:	8b b3 8c 14 00 00    	mov    0x148c(%rbx),%esi
  79:	48 39 f2             	cmp    %rsi,%rdx
  7c:	73 08                	jae    86 <synaptics_report_mt_data+0x86>
  7e:	48 89 10             	mov    %rdx,(%rax)
  81:	4c 89 74 c8 08       	mov    %r14,0x8(%rax,%rcx,8)
  86:	48 8b 07             	mov    (%rdi),%rax
  89:	4c 8b 67 08          	mov    0x8(%rdi),%r12
  8d:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
  92:	48 8d 48 54          	lea    0x54(%rax),%rcx
  96:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  9b:	48 b9 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rcx
  a5:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
  aa:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
  af:	44 89 d9             	mov    %r11d,%ecx
  b2:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # b8 <synaptics_report_mt_data+0xb8>	b4: R_X86_64_PC32	__preempt_count-0x4
  b8:	81 e2 00 01 ff 00    	and    $0xff0100,%edx
  be:	74 11                	je     d1 <synaptics_report_mt_data+0xd1>
  c0:	81 fa 00 01 00 00    	cmp    $0x100,%edx
  c6:	75 5b                	jne    123 <synaptics_report_mt_data+0x123>
  c8:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
  cf:	74 52                	je     123 <synaptics_report_mt_data+0x123>
  d1:	8b 93 88 14 00 00    	mov    0x1488(%rbx),%edx
  d7:	83 fa 03             	cmp    $0x3,%edx
  da:	75 47                	jne    123 <synaptics_report_mt_data+0x123>
  dc:	48 8b 93 90 14 00 00 	mov    0x1490(%rbx),%rdx
  e3:	44 8b 83 8c 14 00 00 	mov    0x148c(%rbx),%r8d
  ea:	49 c1 e0 03          	shl    $0x3,%r8
  ee:	4c 8b 12             	mov    (%rdx),%r10
  f1:	4c 89 d6             	mov    %r10,%rsi
  f4:	48 c1 e6 05          	shl    $0x5,%rsi
  f8:	4c 8d 4e 28          	lea    0x28(%rsi),%r9
  fc:	4d 39 c1             	cmp    %r8,%r9
  ff:	77 22                	ja     123 <synaptics_report_mt_data+0x123>
 101:	49 ff c2             	inc    %r10
 104:	4c 89 12             	mov    %r10,(%rdx)
 107:	48 c7 44 32 08 05 00 00 00 	movq   $0x5,0x8(%rdx,%rsi,1)
 110:	48 c7 44 32 10 01 00 00 00 	movq   $0x1,0x10(%rdx,%rsi,1)
 119:	48 89 4c 32 18       	mov    %rcx,0x18(%rdx,%rsi,1)
 11e:	4c 89 74 32 20       	mov    %r14,0x20(%rdx,%rsi,1)
 123:	45 31 ed             	xor    %r13d,%r13d
 126:	41 83 fb 01          	cmp    $0x1,%r11d
 12a:	41 0f 94 c5          	sete   %r13b
 12e:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 134 <synaptics_report_mt_data+0x134>	130: R_X86_64_PC32	__preempt_count-0x4
 134:	81 e2 00 01 ff 00    	and    $0xff0100,%edx
 13a:	74 11                	je     14d <synaptics_report_mt_data+0x14d>
 13c:	81 fa 00 01 00 00    	cmp    $0x100,%edx
 142:	75 5b                	jne    19f <synaptics_report_mt_data+0x19f>
 144:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
 14b:	74 52                	je     19f <synaptics_report_mt_data+0x19f>
 14d:	8b 93 88 14 00 00    	mov    0x1488(%rbx),%edx
 153:	83 fa 03             	cmp    $0x3,%edx
 156:	75 47                	jne    19f <synaptics_report_mt_data+0x19f>
 158:	48 8b 93 90 14 00 00 	mov    0x1490(%rbx),%rdx
 15f:	44 8b 83 8c 14 00 00 	mov    0x148c(%rbx),%r8d
 166:	49 c1 e0 03          	shl    $0x3,%r8
 16a:	4c 8b 12             	mov    (%rdx),%r10
 16d:	4c 89 d6             	mov    %r10,%rsi
 170:	48 c1 e6 05          	shl    $0x5,%rsi
 174:	4c 8d 4e 28          	lea    0x28(%rsi),%r9
 178:	4d 39 c1             	cmp    %r8,%r9
 17b:	77 22                	ja     19f <synaptics_report_mt_data+0x19f>
 17d:	49 ff c2             	inc    %r10
 180:	4c 89 12             	mov    %r10,(%rdx)
 183:	48 c7 44 32 08 05 00 00 00 	movq   $0x5,0x8(%rdx,%rsi,1)
 18c:	48 c7 44 32 10 01 00 00 00 	movq   $0x1,0x10(%rdx,%rsi,1)
 195:	48 89 4c 32 18       	mov    %rcx,0x18(%rdx,%rsi,1)
 19a:	4c 89 74 32 20       	mov    %r14,0x20(%rdx,%rsi,1)
 19f:	41 83 fb 02          	cmp    $0x2,%r11d
 1a3:	b9 02 00 00 00       	mov    $0x2,%ecx
 1a8:	44 0f 4d e9          	cmovge %ecx,%r13d
 1ac:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # 1b2 <synaptics_report_mt_data+0x1b2>	1ae: R_X86_64_PC32	__preempt_count-0x4
 1b2:	81 e1 00 01 ff 00    	and    $0xff0100,%ecx
 1b8:	74 11                	je     1cb <synaptics_report_mt_data+0x1cb>
 1ba:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
 1c0:	75 5b                	jne    21d <synaptics_report_mt_data+0x21d>
 1c2:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
 1c9:	74 52                	je     21d <synaptics_report_mt_data+0x21d>
 1cb:	8b 8b 88 14 00 00    	mov    0x1488(%rbx),%ecx
 1d1:	83 f9 03             	cmp    $0x3,%ecx
 1d4:	75 47                	jne    21d <synaptics_report_mt_data+0x21d>
 1d6:	48 8b 8b 90 14 00 00 	mov    0x1490(%rbx),%rcx
 1dd:	44 8b 8b 8c 14 00 00 	mov    0x148c(%rbx),%r9d
 1e4:	49 c1 e1 03          	shl    $0x3,%r9
 1e8:	48 8b 31             	mov    (%rcx),%rsi
 1eb:	48 89 f2             	mov    %rsi,%rdx
 1ee:	48 c1 e2 05          	shl    $0x5,%rdx
 1f2:	4c 8d 42 28          	lea    0x28(%rdx),%r8
 1f6:	4d 39 c8             	cmp    %r9,%r8
 1f9:	77 22                	ja     21d <synaptics_report_mt_data+0x21d>
 1fb:	48 ff c6             	inc    %rsi
 1fe:	48 89 31             	mov    %rsi,(%rcx)
 201:	48 c7 44 11 08 05 00 00 00 	movq   $0x5,0x8(%rcx,%rdx,1)
 20a:	48 c7 44 11 10 00 00 00 00 	movq   $0x0,0x10(%rcx,%rdx,1)
 213:	4c 89 6c 11 18       	mov    %r13,0x18(%rcx,%rdx,1)
 218:	4c 89 74 11 20       	mov    %r14,0x20(%rcx,%rdx,1)
 21d:	4d 85 ed             	test   %r13,%r13
 220:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
 225:	44 89 5c 24 0c       	mov    %r11d,0xc(%rsp)
 22a:	0f 84 85 00 00 00    	je     2b5 <synaptics_report_mt_data+0x2b5>
 230:	41 0f b7 0f          	movzwl (%r15),%ecx
 234:	66 89 4c 24 28       	mov    %cx,0x28(%rsp)
 239:	66 b9 e0 16          	mov    $0x16e0,%cx
 23d:	66 ba e0 16          	mov    $0x16e0,%dx
 241:	66 41 2b 57 04       	sub    0x4(%r15),%dx
 246:	66 89 54 24 2a       	mov    %dx,0x2a(%rsp)
 24b:	41 83 fb 01          	cmp    $0x1,%r11d
 24f:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
 254:	0f 85 c8 00 00 00    	jne    322 <synaptics_report_mt_data+0x322>
 25a:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # 260 <synaptics_report_mt_data+0x260>	25c: R_X86_64_PC32	__preempt_count-0x4
 260:	81 e1 00 01 ff 00    	and    $0xff0100,%ecx
 266:	74 19                	je     281 <synaptics_report_mt_data+0x281>
 268:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
 26e:	0f 85 15 01 00 00    	jne    389 <synaptics_report_mt_data+0x389>
 274:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
 27b:	0f 84 08 01 00 00    	je     389 <synaptics_report_mt_data+0x389>
 281:	8b 8b 88 14 00 00    	mov    0x1488(%rbx),%ecx
 287:	83 f9 02             	cmp    $0x2,%ecx
 28a:	0f 85 f9 00 00 00    	jne    389 <synaptics_report_mt_data+0x389>
 290:	48 8b 8b 90 14 00 00 	mov    0x1490(%rbx),%rcx
 297:	48 8b 11             	mov    (%rcx),%rdx
 29a:	48 8d 72 01          	lea    0x1(%rdx),%rsi
 29e:	8b bb 8c 14 00 00    	mov    0x148c(%rbx),%edi
 2a4:	48 39 fe             	cmp    %rdi,%rsi
 2a7:	0f 83 dc 00 00 00    	jae    389 <synaptics_report_mt_data+0x389>
 2ad:	48 89 31             	mov    %rsi,(%rcx)
 2b0:	e9 cf 00 00 00       	jmp    384 <synaptics_report_mt_data+0x384>
 2b5:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # 2bb <synaptics_report_mt_data+0x2bb>	2b7: R_X86_64_PC32	__preempt_count-0x4
 2bb:	81 e1 00 01 ff 00    	and    $0xff0100,%ecx
 2c1:	74 11                	je     2d4 <synaptics_report_mt_data+0x2d4>
 2c3:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
 2c9:	75 35                	jne    300 <synaptics_report_mt_data+0x300>
 2cb:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
 2d2:	74 2c                	je     300 <synaptics_report_mt_data+0x300>
 2d4:	8b 8b 88 14 00 00    	mov    0x1488(%rbx),%ecx
 2da:	83 f9 02             	cmp    $0x2,%ecx
 2dd:	75 21                	jne    300 <synaptics_report_mt_data+0x300>
 2df:	48 8b 8b 90 14 00 00 	mov    0x1490(%rbx),%rcx
 2e6:	48 8b 11             	mov    (%rcx),%rdx
 2e9:	48 8d 72 01          	lea    0x1(%rdx),%rsi
 2ed:	8b bb 8c 14 00 00    	mov    0x148c(%rbx),%edi
 2f3:	48 39 fe             	cmp    %rdi,%rsi
 2f6:	73 08                	jae    300 <synaptics_report_mt_data+0x300>
 2f8:	48 89 31             	mov    %rsi,(%rcx)
 2fb:	4c 89 74 d1 08       	mov    %r14,0x8(%rcx,%rdx,8)
 300:	8b 40 20             	mov    0x20(%rax),%eax
 303:	01 c0                	add    %eax,%eax
 305:	44 8d 04 80          	lea    (%rax,%rax,4),%r8d
 309:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
 30e:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
 313:	4c 89 e7             	mov    %r12,%rdi
 316:	31 c9                	xor    %ecx,%ecx
 318:	e8 00 00 00 00       	call   31d <synaptics_report_mt_data+0x31d>	319: R_X86_64_PLT32	input_mt_assign_slots-0x4
 31d:	e9 ae 01 00 00       	jmp    4d0 <synaptics_report_mt_data+0x4d0>
 322:	0f b7 50 54          	movzwl 0x54(%rax),%edx
 326:	66 89 54 24 2c       	mov    %dx,0x2c(%rsp)
 32b:	66 2b 48 58          	sub    0x58(%rax),%cx
 32f:	66 89 4c 24 2e       	mov    %cx,0x2e(%rsp)
 334:	8b 0d 00 00 00 00    	mov    0x0(%rip),%ecx        # 33a <synaptics_report_mt_data+0x33a>	336: R_X86_64_PC32	__preempt_count-0x4
 33a:	41 83 fb 02          	cmp    $0x2,%r11d
 33e:	0f 8c fd 01 00 00    	jl     541 <synaptics_report_mt_data+0x541>
 344:	81 e1 00 01 ff 00    	and    $0xff0100,%ecx
 34a:	74 11                	je     35d <synaptics_report_mt_data+0x35d>
 34c:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
 352:	75 35                	jne    389 <synaptics_report_mt_data+0x389>
 354:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
 35b:	74 2c                	je     389 <synaptics_report_mt_data+0x389>
 35d:	8b 8b 88 14 00 00    	mov    0x1488(%rbx),%ecx
 363:	83 f9 02             	cmp    $0x2,%ecx
 366:	75 21                	jne    389 <synaptics_report_mt_data+0x389>
 368:	48 8b 8b 90 14 00 00 	mov    0x1490(%rbx),%rcx
 36f:	48 8b 11             	mov    (%rcx),%rdx
 372:	48 8d 72 01          	lea    0x1(%rdx),%rsi
 376:	8b bb 8c 14 00 00    	mov    0x148c(%rbx),%edi
 37c:	48 39 fe             	cmp    %rdi,%rsi
 37f:	73 08                	jae    389 <synaptics_report_mt_data+0x389>
 381:	48 89 31             	mov    %rsi,(%rcx)
 384:	4c 89 74 d1 08       	mov    %r14,0x8(%rcx,%rdx,8)
 389:	8b 40 20             	mov    0x20(%rax),%eax
 38c:	01 c0                	add    %eax,%eax
 38e:	44 8d 04 80          	lea    (%rax,%rax,4),%r8d
 392:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
 397:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
 39c:	4c 89 e7             	mov    %r12,%rdi
 39f:	44 89 e9             	mov    %r13d,%ecx
 3a2:	e8 00 00 00 00       	call   3a7 <synaptics_report_mt_data+0x3a7>	3a3: R_X86_64_PLT32	input_mt_assign_slots-0x4
 3a7:	49 ff cd             	dec    %r13
 3aa:	45 31 ff             	xor    %r15d,%r15d
 3ad:	eb 04                	jmp    3b3 <synaptics_report_mt_data+0x3b3>
 3af:	90                   	nop
 3b0:	49 ff c7             	inc    %r15
 3b3:	42 8b 4c bc 20       	mov    0x20(%rsp,%r15,4),%ecx
 3b8:	4c 89 e7             	mov    %r12,%rdi
 3bb:	be 03 00 00 00       	mov    $0x3,%esi
 3c0:	ba 2f 00 00 00       	mov    $0x2f,%edx
 3c5:	e8 00 00 00 00       	call   3ca <synaptics_report_mt_data+0x3ca>	3c6: R_X86_64_PLT32	input_event-0x4
 3ca:	4c 89 e7             	mov    %r12,%rdi
 3cd:	31 f6                	xor    %esi,%esi
 3cf:	ba 01 00 00 00       	mov    $0x1,%edx
 3d4:	e8 00 00 00 00       	call   3d9 <synaptics_report_mt_data+0x3d9>	3d5: R_X86_64_PLT32	input_mt_report_slot_state-0x4
 3d9:	42 0f bf 4c bc 28    	movswl 0x28(%rsp,%r15,4),%ecx
 3df:	4c 89 e7             	mov    %r12,%rdi
 3e2:	be 03 00 00 00       	mov    $0x3,%esi
 3e7:	ba 35 00 00 00       	mov    $0x35,%edx
 3ec:	e8 00 00 00 00       	call   3f1 <synaptics_report_mt_data+0x3f1>	3ed: R_X86_64_PLT32	input_event-0x4
 3f1:	42 0f bf 4c bc 2a    	movswl 0x2a(%rsp,%r15,4),%ecx
 3f7:	4c 89 e7             	mov    %r12,%rdi
 3fa:	be 03 00 00 00       	mov    $0x3,%esi
 3ff:	ba 36 00 00 00       	mov    $0x36,%edx
 404:	e8 00 00 00 00       	call   409 <synaptics_report_mt_data+0x409>	405: R_X86_64_PLT32	input_event-0x4
 409:	4a 8b 44 fc 30       	mov    0x30(%rsp,%r15,8),%rax
 40e:	8b 48 08             	mov    0x8(%rax),%ecx
 411:	4c 89 e7             	mov    %r12,%rdi
 414:	be 03 00 00 00       	mov    $0x3,%esi
 419:	ba 3a 00 00 00       	mov    $0x3a,%edx
 41e:	e8 00 00 00 00       	call   423 <synaptics_report_mt_data+0x423>	41f: R_X86_64_PLT32	input_event-0x4
 423:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 429 <synaptics_report_mt_data+0x429>	425: R_X86_64_PC32	__preempt_count-0x4
 429:	25 00 01 ff 00       	and    $0xff0100,%eax
 42e:	4d 39 fd             	cmp    %r15,%r13
 431:	74 58                	je     48b <synaptics_report_mt_data+0x48b>
 433:	85 c0                	test   %eax,%eax
 435:	74 18                	je     44f <synaptics_report_mt_data+0x44f>
 437:	3d 00 01 00 00       	cmp    $0x100,%eax
 43c:	0f 85 6e ff ff ff    	jne    3b0 <synaptics_report_mt_data+0x3b0>
 442:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
 449:	0f 84 61 ff ff ff    	je     3b0 <synaptics_report_mt_data+0x3b0>
 44f:	8b 83 88 14 00 00    	mov    0x1488(%rbx),%eax
 455:	83 f8 02             	cmp    $0x2,%eax
 458:	0f 85 52 ff ff ff    	jne    3b0 <synaptics_report_mt_data+0x3b0>
 45e:	48 8b 83 90 14 00 00 	mov    0x1490(%rbx),%rax
 465:	48 8b 08             	mov    (%rax),%rcx
 468:	48 8d 51 01          	lea    0x1(%rcx),%rdx
 46c:	8b b3 8c 14 00 00    	mov    0x148c(%rbx),%esi
 472:	48 39 f2             	cmp    %rsi,%rdx
 475:	0f 83 35 ff ff ff    	jae    3b0 <synaptics_report_mt_data+0x3b0>
 47b:	48 89 10             	mov    %rdx,(%rax)
 47e:	4c 89 74 c8 08       	mov    %r14,0x8(%rax,%rcx,8)
 483:	49 ff c7             	inc    %r15
 486:	e9 28 ff ff ff       	jmp    3b3 <synaptics_report_mt_data+0x3b3>
 48b:	85 c0                	test   %eax,%eax
 48d:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
 492:	74 10                	je     4a4 <synaptics_report_mt_data+0x4a4>
 494:	3d 00 01 00 00       	cmp    $0x100,%eax
 499:	75 35                	jne    4d0 <synaptics_report_mt_data+0x4d0>
 49b:	83 bb ac 14 00 00 00 	cmpl   $0x0,0x14ac(%rbx)
 4a2:	74 2c                	je     4d0 <synaptics_report_mt_data+0x4d0>
 4a4:	8b 83 88 14 00 00    	mov    0x1488(%rbx),%eax
 4aa:	83 f8 02             	cmp    $0x2,%eax
 4ad:	75 21                	jne    4d0 <synaptics_report_mt_data+0x4d0>
 4af:	48 8b 83 90 14 00 00 	mov    0x1490(%rbx),%rax
 4b6:	48 8b 08             	mov    (%rax),%rcx
 4b9:	48 8d 51 01          	lea    0x1(%rcx),%rdx
 4bd:	8b b3 8c 14 00 00    	mov    0x148c(%rbx),%esi
 4c3:	48 39 f2             	cmp    %rsi,%rdx
 4c6:	73 08                	jae    4d0 <synaptics_report_mt_data+0x4d0>
 4c8:	48 89 10             	mov    %rdx,(%rax)
 4cb:	4c 89 74 c8 08       	mov    %r14,0x8(%rax,%rcx,8)
 4d0:	4c 89 e7             	mov    %r12,%rdi
 4d3:	e8 00 00 00 00       	call   4d8 <synaptics_report_mt_data+0x4d8>	4d4: R_X86_64_PLT32	input_mt_drop_unused-0x4
 4d8:	4c 89 e7             	mov    %r12,%rdi
 4db:	31 f6                	xor    %esi,%esi
 4dd:	e8 00 00 00 00       	call   4e2 <synaptics_report_mt_data+0x4e2>	4de: R_X86_64_PLT32	input_mt_report_pointer_emulation-0x4
 4e2:	4c 89 e7             	mov    %r12,%rdi
 4e5:	8b 74 24 0c          	mov    0xc(%rsp),%esi
 4e9:	e8 00 00 00 00       	call   4ee <synaptics_report_mt_data+0x4ee>	4ea: R_X86_64_PLT32	input_mt_report_finger_count-0x4
 4ee:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
 4f3:	4c 89 fe             	mov    %r15,%rsi
 4f6:	e8 00 00 00 00       	call   4fb <synaptics_report_mt_data+0x4fb>	4f7: R_X86_64_PLT32	.text.synaptics_report_buttons-0x4
 4fb:	4c 89 e7             	mov    %r12,%rdi
 4fe:	31 f6                	xor    %esi,%esi
 500:	31 d2                	xor    %edx,%edx
 502:	31 c9                	xor    %ecx,%ecx
 504:	e8 00 00 00 00       	call   509 <synaptics_report_mt_data+0x509>	505: R_X86_64_PLT32	input_event-0x4
 509:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 510 <synaptics_report_mt_data+0x510>	50c: R_X86_64_PC32	__stack_chk_guard-0x4
 510:	48 3b 44 24 40       	cmp    0x40(%rsp),%rax
 515:	75 25                	jne    53c <synaptics_report_mt_data+0x53c>
 517:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
 51b:	5b                   	pop    %rbx
 51c:	41 5c                	pop    %r12
 51e:	41 5d                	pop    %r13
 520:	41 5e                	pop    %r14
 522:	41 5f                	pop    %r15
 524:	5d                   	pop    %rbp
 525:	31 c0                	xor    %eax,%eax
 527:	31 c9                	xor    %ecx,%ecx
 529:	31 ff                	xor    %edi,%edi
 52b:	31 d2                	xor    %edx,%edx
 52d:	31 f6                	xor    %esi,%esi
 52f:	45 31 c0             	xor    %r8d,%r8d
 532:	45 31 c9             	xor    %r9d,%r9d
 535:	45 31 d2             	xor    %r10d,%r10d
 538:	45 31 db             	xor    %r11d,%r11d
 53b:	c3                   	ret
 53c:	e8 00 00 00 00       	call   541 <synaptics_report_mt_data+0x541>	53d: R_X86_64_PLT32	__stack_chk_fail-0x4
 541:	8b 83 88 14 00 00    	mov    0x1488(%rbx),%eax
 547:	48 8b 83 90 14 00 00 	mov    0x1490(%rbx),%rax
 54e:	48 ff 00             	incq   (%rax)

> Also, if you happen to have CONFIG_DEBUG_INFO enabled, the line number
> of that last branch:
> 
>   addr2line -fpie vmlinux.o.orig -j .text.synaptics_report_mt_data 0x33e 

That configuration does have debug info enabled but...

  $ addr2line -fpie vmlinux.o.orig -j .text.synaptics_report_mt_data 0x33e
  synaptics_report_mt_data at ld-temp.o:?

Unfortunately, I am not sure how well LTO preserves debug info; IIUC,
debug info in LLVM is best effort, optimizations may or may not update
the info throughout their transformations, especially by the time the
LTO pipeline happens.

Cheers,
Nathan
