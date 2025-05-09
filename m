Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E091E235C17
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807318; cv=none; b=pJIP5K4sER1t9F7pNzwgiWxoGGRZ1C4ozxgBSON4eq/s4craCJSYmcotoi3QBtksSHSxetnKEoLgmUScVmR5u7oK12WgjlZ5Ktbn0Ryw8PiVFsnVFbW9FvD0w05sHU2WbzkMe5nhWyPor245/Nuel9MmW3JUNS2IYSQLHRrPZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807318; c=relaxed/simple;
	bh=lnXJqnJ6L2CCxfRYIrwQ87XFrZmjVVTDVi/is6Su21A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLsGZchLYm6CDBLPYbBVu7d33TCV5soD8pEvTsfOSdbL513kpClzVSqfSEMnxOXQ3fcYcYPX7wz0T7AuDGPUV17vBeGtHr90vAbj8ORjTJwOZwqm+e0RMHW2BFh62pshfq48ce0AceZYWuI9T3U9EorkvGUeTlRdYrDC/D+p4WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9vWsaOE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9vWsaOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116E8C4CEE4;
	Fri,  9 May 2025 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807316;
	bh=lnXJqnJ6L2CCxfRYIrwQ87XFrZmjVVTDVi/is6Su21A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9vWsaOEIRPPVVdvRwuw2KqhhHdFXcfQS9hCv8q2bIByUVDTZ8zNsPgYGB0xrdmGk
	 Apcr9OEfyp5TOYGDGAH6quvyLtR6qiG2MyGwURgHFttiZXH1YgCxIBs4ndKdfWTyyu
	 rrNhn8ibiMJcR96v3/Zgs0oIFH8wTzrHVoEWH0jaQ8rAlogrfYq4+qUhiWFB4J/cpy
	 hrB0aVDir3GlzkXySdN+iyMZ7PwAxmblKxBcOF8QU5Fl3cle2Z/zw8tFAkn9rrszaz
	 DQCq5RIFAF1yzw710UVXF+l9GsRmFkrHPGCa8paQ7/GyIOBnU5vMON8AAyHRIW7Hf2
	 mWH2aD6BIxyqA==
Date: Fri, 9 May 2025 17:15:08 +0100
From: Will Deacon <will@kernel.org>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Song Liu <song@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late
 relocations.
Message-ID: <20250509161508.GB5984@willie-the-truck>
References: <20250412010940.1686376-1-dylanbhatch@google.com>
 <20250412010940.1686376-3-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412010940.1686376-3-dylanbhatch@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dylan,

On Sat, Apr 12, 2025 at 01:09:39AM +0000, Dylan Hatch wrote:
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario, use the text-poking API to allow this, even with
> STRICT_MODULE_RWX.
> 
> This patch is largely based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> ---
>  arch/arm64/kernel/module.c | 129 ++++++++++++++++++++++++-------------
>  1 file changed, 83 insertions(+), 46 deletions(-)

On its own, this isn't gaining us an awful lot upstream as we don't have
livepatch support (arm64 does not select HAVE_LIVEPATCH), however I'm
not against incremental changes towards enabling that. Are you planning
to work on follow-up changes for the rest of the support?

> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 06bb680bfe975..0703502d9dc37 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -18,11 +18,13 @@
>  #include <linux/moduleloader.h>
>  #include <linux/random.h>
>  #include <linux/scs.h>
> +#include <linux/memory.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/insn.h>
>  #include <asm/scs.h>
>  #include <asm/sections.h>
> +#include <asm/text-patching.h>
>  
>  enum aarch64_reloc_op {
>  	RELOC_OP_NONE,
> @@ -48,7 +50,8 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
>  	return 0;
>  }
>  
> -static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
> +static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
> +		      void *(*write)(void *dest, const void *src, size_t len))
>  {

I think it's a bit grotty indirecting the write when in reality we either
need a straight-forward assignment (like we have today) or a call to
an instruction-patching helper.

In particular, when you get to functions such as:

>  static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
> -			   int lsb, enum aarch64_insn_movw_imm_type imm_type)
> +			   int lsb, enum aarch64_insn_movw_imm_type imm_type,
> +			   void *(*write)(void *dest, const void *src, size_t len))
>  {
>  	u64 imm;
>  	s64 sval;
>  	u32 insn = le32_to_cpu(*place);
> +	__le32 le_insn;
>  
>  	sval = do_reloc(op, place, val);
>  	imm = sval >> lsb;
> @@ -145,7 +150,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
>  
>  	/* Update the instruction with the new encoding. */
>  	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
> -	*place = cpu_to_le32(insn);
> +	le_insn = cpu_to_le32(insn);
> +	write(place, &le_insn, sizeof(le_insn));

we're forced into passing &le_insn because we need the same function
prototype as memcpy().

Instead, how about we pass the 'struct module *mod' pointer down from
apply_relocate_add()? That's already done for reloc_insn_adrp() and it
would mean that the above could be written as:


static int reloc_insn_movw(struct module *mod, enum aarch64_reloc_op op,
			   __le32 *place, u64 val, int lsb,
			   enum aarch64_insn_movw_imm_type imm_type)
{
	...

	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
	insn = cpu_to_le32(insn);

	if (mod->state != MODULE_STATE_UNFORMED)
		aarch64_insn_set(place, insn, sizeof(insn));
	else
		*place = insn;


meaning we can also drop the first patch, because I don't think we need
a text_poke() helper.

> +int apply_relocate_add(Elf64_Shdr *sechdrs,
> +		       const char *strtab,
> +		       unsigned int symindex,
> +		       unsigned int relsec,
> +		       struct module *me)
> +{
> +	int ret;
> +	bool early = me->state == MODULE_STATE_UNFORMED;
> +	void *(*write)(void *, const void *, size_t) = memcpy;
> +
> +	if (!early) {
> +		write = text_poke;
> +		mutex_lock(&text_mutex);
> +	}
> +
> +	ret = __apply_relocate_add(sechdrs, strtab, symindex, relsec, me,
> +				   write);
> +
> +	if (!early)
> +		mutex_unlock(&text_mutex);

Why is the responsibility of the arch code to take the 'text_mutex' here?
The core code should be able to do that when the module state is !=
MODULE_STATE_UNFORMED.

Cheers,

Will
