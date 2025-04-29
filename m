Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6152144BC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951182; cv=none; b=KLy9H7Q/n4usJw2Xbati3KMenxv80lnvm6leEX1UUxQreGEeFN123sZY+/yUo9jUVgCQfYQc0qpTgI1v6Rv86WiynNp2A5tohrO9iqdL+jm66/7cZ42uUWe9o/I5ecpLePdB5PPt0B8NgskjASb452BSh/DRriayRXFKOvOa2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951182; c=relaxed/simple;
	bh=WWWHnCPAinsbaCY8ms85UJ0PjuPUlE7ICrq+IICV/KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQLzcyrTtyHEuztUKpi9u5qztvDETsCKwZ5tcTGC/JCEmkkKLamUGmXuOwn6OO86263z7wDDoiAksNkFRYlyaoxILKJ31rG/2dmnQGUXbDHuCzEK4aQidqadLEdjyv1/9J6W6XRuNpeUwuz8jZF8NMLGWxNRYVL6CN/ohmaUobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GLoWaPJS; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GLoWaPJS"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523de5611a3so2352543e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745951179; x=1746555979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58LgbfG3U/akqjTZ2/iNSa3gMh9sUNRwxeuhEgX/Y0g=;
        b=GLoWaPJSrfcQrG5P22jSrxwtRXd0tZ/xAjnPrKQ3Ev8nkAM/a0eG5ohQqEQ3E8FhG+
         FAr6g9ngoG38YTTMbK/2njbFEPbBgJR/QQTA7lQuMJkUebzQjp7QXev4/sJpepahgSwC
         PVFy0BtcKUZH6t/aPSXgccYMj7ekvmN3bGhrJZErNraMJXP/33ED4grVB9lKRyeCUWFy
         mxojhtIovxSOwY4Fo0IoZ8I8NYC4WHoI8szwLzvq3H50E/uiABFlFnTZlnpgMfxiYe7M
         5WqPCR59xAThOSFP1oZ4+aLaNmg/qv+WkzrGZdpgROhaMAE0mow17nVLKqu1ZVvBOGke
         VIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951179; x=1746555979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58LgbfG3U/akqjTZ2/iNSa3gMh9sUNRwxeuhEgX/Y0g=;
        b=WolUHSEbEaWAfiyWXBsKrnCNgfmRMzjggysZQqbw+jW/LmkF8OJljJ+na37BNNgdko
         7rUyhaiCFgvXfQWyZyHV/odAgfOxaRrRoodAlD378/MMCKl80hhztDz9XjBseXdZB7Bw
         cU9xRYcJTm/bZ+nPhbVU0oMQTU3TwqVD5DdVwVCKfTN003LEtPObJKyR41oYqSba4O2/
         aL1y7Uh0ay5yfcxdj3ihKL6HuQkd++RE2uo2yf+P3FtGF+8J7ibVV1NRe8gu2H45kTfS
         H0bmZQM/9TR9z1VKl28zsGBH5EXEhLsCpQG8GbtJzBUx0K5hlBzjCtXoPqihEJudaVOa
         FcgA==
X-Forwarded-Encrypted: i=1; AJvYcCXwKR76zCoesWdtF7/TaJSa98GbhYxukcxi6CxlXxQySvVbjlIyjJp41IlcOUSfEzK/EdLcgOvXjWG7ybU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZg4jtqIy6OT+TzjRjDBty9m0CMEDX9sUOxsVWjI++oR3SBhc9
	oykZrsBXBavWIMZuQYCytN5muGZYQAGGgMmonD41nJh58IGTzxrjbE5m9El6ccp/0sLcYmW6p6y
	8JEI6Pe6GfWwE2Cly1K/1SfRFhl0VaEbR9RkM
X-Gm-Gg: ASbGncvx9/6Tem5rOJs8LlRwVJx26Y/CA7T5v0m/BPrNWyiVyolZz6d4/bUGCBhT6Yi
	Wo4VT2Lkysnfu6NXr6rX7jYHrzNh03GAF0IGF3/Skw/rWIIh4V48IfgYJHfwIm1AoigGB96QsP5
	8o3aMu45kAbFdqoKYLdrowLJcR1OM/GZ8Yv+c+fv/kMCBBMO04FhL8CX5tdyCoJp4=
X-Google-Smtp-Source: AGHT+IH5cr9Ut+CDjG7qjqlVvmddBRkuDPzZ/YZJrl44vOySOf2ltBVtU1T05iiihlj09EjlDGqWtCfXcZXv/SfWH9o=
X-Received: by 2002:a05:6122:510:b0:529:d7e:d13f with SMTP id
 71dfb90a1353d-52acd85566bmr243162e0c.9.1745951179027; Tue, 29 Apr 2025
 11:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com> <20250412010940.1686376-3-dylanbhatch@google.com>
In-Reply-To: <20250412010940.1686376-3-dylanbhatch@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 29 Apr 2025 11:26:07 -0700
X-Gm-Features: ATxdqUE9N_cvxjdL3lDkLDn1EjErWG-skaiY_wth7077LARfxATSMwdtMGMIH00
Message-ID: <CADBMgpyk8hA3tm+RWLL-9bv-k2eEPWz0E9wSSoKVZ+snq3ESHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64/module: Use text-poke API for late relocations.
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, KP Singh <kpsingh@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Jiri Olsa <jolsa@kernel.org>, Hao Luo <haoluo@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Song Liu <song@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
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
>
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
>         RELOC_OP_NONE,
> @@ -48,7 +50,8 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __l=
e32 *place, u64 val)
>         return 0;
>  }
>
> -static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len)
> +static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len,
> +                     void *(*write)(void *dest, const void *src, size_t =
len))
>  {
>         s64 sval =3D do_reloc(op, place, val);
>
> @@ -66,7 +69,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *p=
lace, u64 val, int len)
>
>         switch (len) {
>         case 16:
> -               *(s16 *)place =3D sval;
> +               write(place, &sval, sizeof(s16));
>                 switch (op) {
>                 case RELOC_OP_ABS:
>                         if (sval < 0 || sval > U16_MAX)
> @@ -82,7 +85,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *p=
lace, u64 val, int len)
>                 }
>                 break;
>         case 32:
> -               *(s32 *)place =3D sval;
> +               write(place, &sval, sizeof(s32));
>                 switch (op) {
>                 case RELOC_OP_ABS:
>                         if (sval < 0 || sval > U32_MAX)
> @@ -98,7 +101,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *=
place, u64 val, int len)
>                 }
>                 break;
>         case 64:
> -               *(s64 *)place =3D sval;
> +               write(place, &sval, sizeof(s64));
>                 break;
>         default:
>                 pr_err("Invalid length (%d) for data relocation\n", len);
> @@ -113,11 +116,13 @@ enum aarch64_insn_movw_imm_type {
>  };
>
>  static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 =
val,
> -                          int lsb, enum aarch64_insn_movw_imm_type imm_t=
ype)
> +                          int lsb, enum aarch64_insn_movw_imm_type imm_t=
ype,
> +                          void *(*write)(void *dest, const void *src, si=
ze_t len))
>  {
>         u64 imm;
>         s64 sval;
>         u32 insn =3D le32_to_cpu(*place);
> +       __le32 le_insn;
>
>         sval =3D do_reloc(op, place, val);
>         imm =3D sval >> lsb;
> @@ -145,7 +150,8 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, =
__le32 *place, u64 val,
>
>         /* Update the instruction with the new encoding. */
>         insn =3D aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn,=
 imm);
> -       *place =3D cpu_to_le32(insn);
> +       le_insn =3D cpu_to_le32(insn);
> +       write(place, &le_insn, sizeof(le_insn));
>
>         if (imm > U16_MAX)
>                 return -ERANGE;
> @@ -154,11 +160,13 @@ static int reloc_insn_movw(enum aarch64_reloc_op op=
, __le32 *place, u64 val,
>  }
>
>  static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 v=
al,
> -                         int lsb, int len, enum aarch64_insn_imm_type im=
m_type)
> +                         int lsb, int len, enum aarch64_insn_imm_type im=
m_type,
> +                         void *(*write)(void *dest, const void *src, siz=
e_t len))
>  {
>         u64 imm, imm_mask;
>         s64 sval;
>         u32 insn =3D le32_to_cpu(*place);
> +       __le32 le_insn;
>
>         /* Calculate the relocation value. */
>         sval =3D do_reloc(op, place, val);
> @@ -170,7 +178,8 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, _=
_le32 *place, u64 val,
>
>         /* Update the instruction's immediate field. */
>         insn =3D aarch64_insn_encode_immediate(imm_type, insn, imm);
> -       *place =3D cpu_to_le32(insn);
> +       le_insn =3D cpu_to_le32(insn);
> +       write(place, &le_insn, sizeof(le_insn));
>
>         /*
>          * Extract the upper value bits (including the sign bit) and
> @@ -189,17 +198,19 @@ static int reloc_insn_imm(enum aarch64_reloc_op op,=
 __le32 *place, u64 val,
>  }
>
>  static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
> -                          __le32 *place, u64 val)
> +                          __le32 *place, u64 val,
> +                          void *(*write)(void *dest, const void *src, si=
ze_t len))
>  {
>         u32 insn;
> +       __le32 le_insn;
>
>         if (!is_forbidden_offset_for_adrp(place))
>                 return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
> -                                     AARCH64_INSN_IMM_ADR);
> +                                     AARCH64_INSN_IMM_ADR, write);
>
>         /* patch ADRP to ADR if it is in range */
>         if (!reloc_insn_imm(RELOC_OP_PREL, place, val & ~0xfff, 0, 21,
> -                           AARCH64_INSN_IMM_ADR)) {
> +                           AARCH64_INSN_IMM_ADR, write)) {
>                 insn =3D le32_to_cpu(*place);
>                 insn &=3D ~BIT(31);
>         } else {
> @@ -211,15 +222,17 @@ static int reloc_insn_adrp(struct module *mod, Elf6=
4_Shdr *sechdrs,
>                                                    AARCH64_INSN_BRANCH_NO=
LINK);
>         }
>
> -       *place =3D cpu_to_le32(insn);
> +       le_insn =3D cpu_to_le32(insn);
> +       write(place, &le_insn, sizeof(le_insn));
>         return 0;
>  }
>
> -int apply_relocate_add(Elf64_Shdr *sechdrs,
> +static int __apply_relocate_add(Elf64_Shdr *sechdrs,
>                        const char *strtab,
>                        unsigned int symindex,
>                        unsigned int relsec,
> -                      struct module *me)
> +                      struct module *me,
> +                      void *(*write)(void *dest, const void *src, size_t=
 len))
>  {
>         unsigned int i;
>         int ovf;
> @@ -255,23 +268,23 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>                 /* Data relocations. */
>                 case R_AARCH64_ABS64:
>                         overflow_check =3D false;
> -                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 64);
> +                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 64, wr=
ite);
>                         break;
>                 case R_AARCH64_ABS32:
> -                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 32);
> +                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 32, wr=
ite);
>                         break;
>                 case R_AARCH64_ABS16:
> -                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 16);
> +                       ovf =3D reloc_data(RELOC_OP_ABS, loc, val, 16, wr=
ite);
>                         break;
>                 case R_AARCH64_PREL64:
>                         overflow_check =3D false;
> -                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 64);
> +                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 64, w=
rite);
>                         break;
>                 case R_AARCH64_PREL32:
> -                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 32);
> +                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 32, w=
rite);
>                         break;
>                 case R_AARCH64_PREL16:
> -                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 16);
> +                       ovf =3D reloc_data(RELOC_OP_PREL, loc, val, 16, w=
rite);
>                         break;
>
>                 /* MOVW instruction relocations. */
> @@ -280,88 +293,88 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>                         fallthrough;
>                 case R_AARCH64_MOVW_UABS_G0:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 0=
,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_UABS_G1_NC:
>                         overflow_check =3D false;
>                         fallthrough;
>                 case R_AARCH64_MOVW_UABS_G1:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 1=
6,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_UABS_G2_NC:
>                         overflow_check =3D false;
>                         fallthrough;
>                 case R_AARCH64_MOVW_UABS_G2:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 3=
2,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_UABS_G3:
>                         /* We're using the top bits so we can't overflow.=
 */
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 4=
8,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_SABS_G0:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 0=
,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_SABS_G1:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 1=
6,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_SABS_G2:
>                         ovf =3D reloc_insn_movw(RELOC_OP_ABS, loc, val, 3=
2,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G0_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
0,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G0:
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
0,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G1_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
16,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G1:
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
16,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G2_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
32,
> -                                             AARCH64_INSN_IMM_MOVKZ);
> +                                             AARCH64_INSN_IMM_MOVKZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G2:
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
32,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>                 case R_AARCH64_MOVW_PREL_G3:
>                         /* We're using the top bits so we can't overflow.=
 */
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_movw(RELOC_OP_PREL, loc, val, =
48,
> -                                             AARCH64_INSN_IMM_MOVNZ);
> +                                             AARCH64_INSN_IMM_MOVNZ, wri=
te);
>                         break;
>
>                 /* Immediate instruction relocations. */
>                 case R_AARCH64_LD_PREL_LO19:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 19,
> -                                            AARCH64_INSN_IMM_19);
> +                                            AARCH64_INSN_IMM_19, write);
>                         break;
>                 case R_AARCH64_ADR_PREL_LO21:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 0=
, 21,
> -                                            AARCH64_INSN_IMM_ADR);
> +                                            AARCH64_INSN_IMM_ADR, write)=
;
>                         break;
>                 case R_AARCH64_ADR_PREL_PG_HI21_NC:
>                         overflow_check =3D false;
>                         fallthrough;
>                 case R_AARCH64_ADR_PREL_PG_HI21:
> -                       ovf =3D reloc_insn_adrp(me, sechdrs, loc, val);
> +                       ovf =3D reloc_insn_adrp(me, sechdrs, loc, val, wr=
ite);
>                         if (ovf && ovf !=3D -ERANGE)
>                                 return ovf;
>                         break;
> @@ -369,46 +382,46 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>                 case R_AARCH64_LDST8_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 0,=
 12,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_LDST16_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 1,=
 11,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_LDST32_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 2,=
 10,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_LDST64_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 3,=
 9,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_LDST128_ABS_LO12_NC:
>                         overflow_check =3D false;
>                         ovf =3D reloc_insn_imm(RELOC_OP_ABS, loc, val, 4,=
 8,
> -                                            AARCH64_INSN_IMM_12);
> +                                            AARCH64_INSN_IMM_12, write);
>                         break;
>                 case R_AARCH64_TSTBR14:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 14,
> -                                            AARCH64_INSN_IMM_14);
> +                                            AARCH64_INSN_IMM_14, write);
>                         break;
>                 case R_AARCH64_CONDBR19:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 19,
> -                                            AARCH64_INSN_IMM_19);
> +                                            AARCH64_INSN_IMM_19, write);
>                         break;
>                 case R_AARCH64_JUMP26:
>                 case R_AARCH64_CALL26:
>                         ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc, val, 2=
, 26,
> -                                            AARCH64_INSN_IMM_26);
> +                                            AARCH64_INSN_IMM_26, write);
>                         if (ovf =3D=3D -ERANGE) {
>                                 val =3D module_emit_plt_entry(me, sechdrs=
, loc, &rel[i], sym);
>                                 if (!val)
>                                         return -ENOEXEC;
>                                 ovf =3D reloc_insn_imm(RELOC_OP_PREL, loc=
, val, 2,
> -                                                    26, AARCH64_INSN_IMM=
_26);
> +                                                    26, AARCH64_INSN_IMM=
_26, write);
>                         }
>                         break;
>
> @@ -431,6 +444,30 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>         return -ENOEXEC;
>  }
>
> +int apply_relocate_add(Elf64_Shdr *sechdrs,
> +                      const char *strtab,
> +                      unsigned int symindex,
> +                      unsigned int relsec,
> +                      struct module *me)
> +{
> +       int ret;
> +       bool early =3D me->state =3D=3D MODULE_STATE_UNFORMED;
> +       void *(*write)(void *, const void *, size_t) =3D memcpy;
> +
> +       if (!early) {
> +               write =3D text_poke;
> +               mutex_lock(&text_mutex);
> +       }
> +
> +       ret =3D __apply_relocate_add(sechdrs, strtab, symindex, relsec, m=
e,
> +                                  write);
> +
> +       if (!early)
> +               mutex_unlock(&text_mutex);
> +
> +       return ret;
> +}
> +
>  static inline void __init_plt(struct plt_entry *plt, unsigned long addr)
>  {
>         *plt =3D get_plt_entry(addr, plt);
> --
> 2.49.0.604.gff1f9ca942-goog
>

Catalin and Will,

Are you comfortable with taking these patches? Is this a workable
approach to enable livepatching arm64 modules?

Thanks,
Dylan
