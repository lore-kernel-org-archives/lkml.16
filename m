Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C859194C96
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493893; cv=none; b=a0tBwMqnIZ6IieI2X67CgQrLG2C5UX07fqQsd4TYrfd/HgbF+FFqUbu29Ptu7R/V6lYpRjO2VrRuFnKWgxjdLUHPwZN0RXZEHwVAtItUwaLki0Y+j2PHnfhg5r9Bw9U4BuedfPtb0V8OUj6XAjkfkq2LzRbEi7z+mipkeP5XTbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493893; c=relaxed/simple;
	bh=fgueocZZowLpXdoMcanR7Q+bBOQqTNmunyp7ptJtW4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqVhVVFtBt5wAy2CmUjbwgRKBEOcJUTsOHyMDmauclmmJSdQCcmF560eZmkRTZl1rWY7kRT6usju5AVANULXA1ENtUjKKQgvryHV05773UnBdrPG18sIw1CJrtqc67WtlxuOAI+EBrhHqBJa8z5l0EXcfF66oZn+Z8rRS2I9YiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQHtV085; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQHtV085"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EC5C4CEEB;
	Mon,  9 Jun 2025 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749493892;
	bh=fgueocZZowLpXdoMcanR7Q+bBOQqTNmunyp7ptJtW4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQHtV085EALEU9Uh6NmdxJRQrpJUYNY1kFlkYssDG1y5EFUcuVA+6NSpxy/pafhfw
	 MlvC58/dL1LWw9OSuuUykLpilsz0eNPKSHpZEUq8CIEtWzyn8IjGyzPA+PsxpbmmKc
	 ozRBj4Kr0T7a7Nj8zq9NASeN7XQNDHTQoKCLi2+gPdin1HHJWaxpl+Kp6n7eV+36+D
	 IiB6L0pBjc+Q/uWbCNtwH0qJW1/G520K2thzc8aV/Oe1UgecGPJIzcg75wfl6f/M9j
	 6MnQ2sHwNlNYDiJpVMDwZzpo2Zu6YdnLl/AY3Qz5OcCSbB1Diwh4tS4WzzLfYe0D02
	 hFz8fHY9H4Nfg==
Date: Mon, 9 Jun 2025 11:31:30 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 00/13] objtool: Function validation tracing
Message-ID: <vx6cxar2ium7zsqqzf57lmn2nhwemi2kmeu2kal6s4mazj3tp3@zdymccnsispv>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606153440.865808-1-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:27PM +0200, Alexandre Chartre wrote:
> Hi,
> 
> This RFC provides two changes to objtool.
> 
> - Disassemble code with libopcodes instead of running objdump
> 
>   objtool executes the objdump command to disassemble code. In particular,
>   if objtool fails to validate a function then it will use objdump to
>   disassemble the entire file which is not very helpful when processing
>   a large file (like vmlinux.o).
> 
>   Using libopcodes provides more control about the disassembly scope and
>   output, and it is possible to disassemble a single instruction or
>   a single function. Now when objtool fails to validate a function it
>   will disassemble that single function instead of disassembling the
>   entire file.
> 
> - Add the --trace <function> option to trace function validation
> 
>   Figuring out why a function validation has failed can be difficult because
>   objtool checks all code flows (including alternatives) and maintains
>   instructions states (in particular call frame information).
> 
>   The trace option allows to follow the function validation done by objtool
>   instruction per instruction, see what objtool is doing and get function
>   validation information. An output example is shown below.

What do I need for this to build?  It wasn't compiling due to missing
bfd.h, so I installed binutils-devel (Fedora) and now I get:

In file included from disas.c:12:
/home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h:10:6: error: redeclaration of ‘enum disassembler_style’
   10 | enum disassembler_style {DISASSEMBLER_STYLE_NOT_EMPTY};
      |      ^~~~~~~~~~~~~~~~~~
In file included from /home/jpoimboe/git/linux/tools/objtool/include/objtool/arch.h:10,
                 from disas.c:6:
/usr/include/dis-asm.h:53:6: note: originally defined here
   53 | enum disassembler_style
      |      ^~~~~~~~~~~~~~~~~~
/home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h: In function ‘init_disassemble_info_compat’:
/home/jpoimboe/git/linux/tools/include/tools/dis-asm-compat.h:50:9: error: too few arguments to function ‘init_disassemble_info’
   50 |         init_disassemble_info(info, stream,
      |         ^~~~~~~~~~~~~~~~~~~~~
/usr/include/dis-asm.h:480:13: note: declared here
  480 | extern void init_disassemble_info (struct disassemble_info *dinfo, void *stream,
      |             ^~~~~~~~~~~~~~~~~~~~~
make[4]: *** [/home/jpoimboe/git/linux/tools/build/Makefile.build:86: /home/jpoimboe/git/linux/tools/objtool/disas.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [Makefile:65: /home/jpoimboe/git/linux/tools/objtool/objtool-in.o] Error 2
make[2]: *** [Makefile:73: objtool] Error 2
make[1]: *** [/home/jpoimboe/git/linux/Makefile:1448: tools/objtool] Error 2
make: *** [Makefile:248: __sub-make] Error 2

-- 
Josh
