Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A922F767
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963605; cv=none; b=TZLeAgy9XVFOkyl58IK9YIsIjtmkh7Ahc7tSqb+WoaW7V/WsLT9ubqijMUsutxUYFyL2WsHcCyCJfabs1PYf7b74DG/G5YU9FE6S9Vsev2/c6jY7UMBo00boeRTvp5dFConeUhNXCaSHkUXZvJsxpE81lIZ+ARPMxGE0Ol6TZ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963605; c=relaxed/simple;
	bh=SDrJA2heEfO3acGwN161/YSuu79b0rUMxQJRzB6X4nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZ+duzVNprR+2It1nMG4a4JqJHFw90ZwF+5wvkWo1lX/4xBMxFtedXvMQyOvhYbc4dryRC8aQZsuLF/BHTS9B7YIogaIMoLKFy+B5Zyl+sG56PqBqe48MLgdUCjd5q6Dc2FeRsEP4WJ1Zn03r3w3ECtmjfuMIUeYyFa17CXosi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncskI327; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncskI327"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0EEC4CEEE;
	Tue,  3 Jun 2025 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748963605;
	bh=SDrJA2heEfO3acGwN161/YSuu79b0rUMxQJRzB6X4nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncskI327tBVw4nf0zXtQLAE+PNC/Cxo1lYA5S65uqpL+VrN30Lf9u/ZuBXksazvo+
	 BbI6p100RtCVDQCYfnNcNmpzc2ve589cY+xmAU9udFZK/SRPrBXlio5wGkGC3knXsI
	 gK0gY5vuyNibdidJ543zYMSjglBuhjRstEp1ZBGpwbrE3tFQNr2mLCSkLcT98zK5it
	 kkSyqD+8o8yBd/nuzN3LLPXev4KOOh2E2cbrGPP67im1mkGS7swpD0F+UY735yhJ6w
	 eb9UMXdizDZVnrB3g/HnLRvI8GYL0UHhMWRvlAzZac3hJxSf4LPWyP+G5nRsSDgQIH
	 1jlEh1p2aAaww==
Date: Tue, 3 Jun 2025 16:13:20 +0100
From: Will Deacon <will@kernel.org>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v5] arm64/module: Use text-poke API for late relocations.
Message-ID: <20250603151319.GA2611@willie-the-truck>
References: <20250530000044.341911-1-dylanbhatch@google.com>
 <20250530141325.GA30733@willie-the-truck>
 <CADBMgpx==FnFj4okXs1n3NPngh7Os1YpnGrDDe8z_t2X7bzOOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADBMgpx==FnFj4okXs1n3NPngh7Os1YpnGrDDe8z_t2X7bzOOQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hey Dylan,

On Fri, May 30, 2025 at 05:11:00PM -0700, Dylan Hatch wrote:
> On Fri, May 30, 2025 at 7:13 AM Will Deacon <will@kernel.org> wrote:
> >
> > and this would be:
> >
> >         WRITE_PLACE(place, cpu_to_le32(insn), me);
> >
> 
> I'm seeing this part give a build error:
> 
> arch/arm64/kernel/module.c:158:2: error: cannot take the address of an
> rvalue of type '__le32' (aka 'unsigned int')
>   158 |         WRITE_PLACE(place, cpu_to_le32(insn), me);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arm64/kernel/module.c:56:28: note: expanded from macro 'WRITE_PLACE'
>    56 |                 aarch64_insn_copy(place, &(val),
> sizeof(*place));       \
>       |                                          ^ ~~~
> 
> I can't think of a clean way to get around this and still keep a
> combined write helper. Setting an intermediate __le32 in the
> reloc_insn_* functions would work but we were trying to avoid that.
> Setting an intermediate value inside WRITE_PLACE would also work but
> then (I think) it won't work for the data relocations because we'd be
> converting a signed into unsigned value. Making WRITE_PLACE a function
> instead of a macro also fixes the rvalue problem but then the args
> 'place' and 'val' have to be of a fixed type so we can't do the
> typecasting on 'place' and 'val' has the same signed/unsigned value
> problem.
> 
> Do you have a suggestion here? In the meantime I can send a v6 that
> uses an intermediate __le32 for the instruction relocations.

Sorry for the slow reply -- I see you already sent a v6. I think we
could add a temporary in the macro. Diff below (on top of your v6). WDYT?

Will

--->8

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 862f6d50ab00..40148d2725ce 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -50,10 +50,12 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 }
 
 #define WRITE_PLACE(place, val, mod) do {				\
+	__typeof__(val) __val = (val);					\
+									\
 	if (mod->state == MODULE_STATE_UNFORMED)			\
-		*(place) = val;						\
+		*(place) = __val;					\
 	else								\
-		aarch64_insn_copy(place, &(val), sizeof(*place));	\
+		aarch64_insn_copy(place, &(__val), sizeof(*place));	\
 } while (0)
 
 static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
@@ -128,7 +130,6 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 	u64 imm;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
-	__le32 le_insn;
 
 	sval = do_reloc(op, place, val);
 	imm = sval >> lsb;
@@ -156,8 +157,7 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction with the new encoding. */
 	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
-	le_insn = cpu_to_le32(insn);
-	WRITE_PLACE(place, le_insn, me);
+	WRITE_PLACE(place, cpu_to_le32(insn), me);
 
 	if (imm > U16_MAX)
 		return -ERANGE;
@@ -172,7 +172,6 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 	u64 imm, imm_mask;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
-	__le32 le_insn;
 
 	/* Calculate the relocation value. */
 	sval = do_reloc(op, place, val);
@@ -184,8 +183,7 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction's immediate field. */
 	insn = aarch64_insn_encode_immediate(imm_type, insn, imm);
-	le_insn = cpu_to_le32(insn);
-	WRITE_PLACE(place, le_insn, me);
+	WRITE_PLACE(place, cpu_to_le32(insn), me);
 
 	/*
 	 * Extract the upper value bits (including the sign bit) and
@@ -207,7 +205,6 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 			   __le32 *place, u64 val, struct module *me)
 {
 	u32 insn;
-	__le32 le_insn;
 
 	if (!is_forbidden_offset_for_adrp(place))
 		return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
@@ -227,8 +224,7 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 						   AARCH64_INSN_BRANCH_NOLINK);
 	}
 
-	le_insn = cpu_to_le32(insn);
-	WRITE_PLACE(place, le_insn, me);
+	WRITE_PLACE(place, cpu_to_le32(insn), me);
 	return 0;
 }
 
