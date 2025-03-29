Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F240979F2
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743207288; cv=none; b=KaL9Ly6MHf6TA1Sd+gjaQusIgvSBhKQ7YQz3C+BJlf4gjUQKQstuK6M7GyG+3C3b8IoD24fMllk2rqowRwkPcugM0GJTtYCM9iwCHq/vN0abZbKhkdhiTmUVeM8Q1vXL4B6OtazOxKBG1vzNHu66hpET3g1G8ySOxPNe09YV10M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743207288; c=relaxed/simple;
	bh=dikRvIQJE5AwEZi0HuwdAuotFBlytZMOVrU0CsJOJy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2KncoKhGvRBD+faNZocPjj8erF1suZrRFRCQ/bVyLH31lFqiLGAGeXLJZkel6Ckkq4TJFCdjpklhDhKe7bNDr1MlzM1U/b+8Tc57EH3ggCvKSRxX/NW5cyNonWVZvtl+JGImRVb6LDCcBjRPlc+Aa13FdxK9LmqH5kkcRbZpNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RiTzB1Z9; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RiTzB1Z9"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so4984104a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743207284; x=1743812084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AG8Ifwah4Vmo6gEwUtWGfmEMFesxHnV/oT3P7GlRyLw=;
        b=RiTzB1Z9mdKaMvAF1A15shseJeP4deCdtCDBkQqMtSqHwlOg+EYKCyORdoOlyOQLRR
         Vo7DmHPUKn5gA1Xdjhux+Ax7XAIsq8RmqsOAGNXo3DYIfnw1MQO/M+1ESQAeD2wjMSaf
         HYqks90A5pgHPioIj4MM/ZJAvVxR1E0nKDT8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743207284; x=1743812084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AG8Ifwah4Vmo6gEwUtWGfmEMFesxHnV/oT3P7GlRyLw=;
        b=QUzzwLYy0Ve1BEqbLp85bqoPHLV/4dPnJXF5rFTN4pIvmq7XDxBcnUO/A2QNqEiLU2
         K5m7Eyg3LGECH0MVKNgvMTJ4StSLu/xux4p+Ac6IkgmttDyd3rWPJ8N90loF7IOTdulS
         5xNcg96Rph9UYzJPysXmXIhU/jMSel1fmt3Nq1HqeXeENLMEaPG47J7wyl06NAg4oDso
         Tpb4NWXUYyUZkX0fQN8v5N+Ky3oW2ATLF6c9ORBILc3x1+VIDUaTAQUG/KJ1XZD7JWl1
         sJZJToEW5jy+OGw9TGDEhA7J0YkpJG+zi1WAtvGjKHLuc4au4BZzJb8eEaIFRf0UCMoo
         LAAg==
X-Forwarded-Encrypted: i=1; AJvYcCVC53LiODF5qlv1wCbs59GcBDa3lo2pgM01pqChx0THYYbHAIyec1EytBi8CAwQhT06F5vl9p9PBHXnCCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR/IC2fLEVGR/abWDJ2Ld6eRXfi6lUXTl1tdfott8YcZKpFZu/
	PktsXbICBlj5bK7zGdnjg43hBcWYjhq2y/Lj2FgRYl36hHaDXmbLwo1Wtdfj2h5/KRIGjD5gx3K
	CFxI=
X-Gm-Gg: ASbGncvdanCPeNZNvg/T1/A1zXBVnCRDUVFZxAKyschjf9zavF+9RcCsAmZ1f6ACmBR
	1bJbxLiWJx0FWIIDYCVyYxtb+HUMpcf0r7oW2B5Ii7wJSlTILEPadvYafrTsdtR5W9YUktx1REl
	eF+gILC+LDjFwN9X/Wo/iMKoPEI7Cjn6E/BaGi7T3RFQJWkKCcuD6rEF8f5dGSIfp1O6yeRZhYX
	vbRR2/IyeFZpPx9xGFoKUhbqXXMUddApVca77DLo6muQSVa/2GVh/LZzaSItXrmuuVVu4sRJErG
	b6Cnec+XswU7YMbWcUpjkd9Wn++LbpTDbSigChjoZIe2fzJpntWn42P9dFGjP0gQJbgecvjNGuG
	Kz0YdZUdJMSZhzzH/iH0=
X-Google-Smtp-Source: AGHT+IGe7aLukp2fj9izUO3dAwDfOSiA2v8twbFiH5p4RQ0XwZxkuuqLdLNxZgi9dTq1dcDtgabIXg==
X-Received: by 2002:a05:6402:1d4b:b0:5eb:cc22:aa00 with SMTP id 4fb4d7f45d1cf-5edfd13c985mr1030389a12.19.1743207284068;
        Fri, 28 Mar 2025 17:14:44 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16d2dd0sm2052779a12.21.2025.03.28.17.14.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 17:14:43 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so4984062a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:14:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULkchm8uFW0LJeTsABR6bodYsV7yqRo9TomnePu6YPVY0Iv6jbyjsU2nQWnS6Ztbikuz2oBI9Moh0kxqU=@vger.kernel.org
X-Received: by 2002:a17:906:c40a:b0:ac7:391b:e68a with SMTP id
 a640c23a62f3a-ac7391be94amr68288966b.60.1743207281660; Fri, 28 Mar 2025
 17:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305184725.3341760-3-xin@zytor.com> <174238223959.14745.6970497940010271580.tip-bot2@tip-bot2>
 <SN6PR02MB415756D1829740F6E8AC11D1D4D82@SN6PR02MB4157.namprd02.prod.outlook.com>
 <CAHk-=whChrRQ0kuRuZo2+9D+J2BO9Q=1CV2eEk_yjrNi8kdjBg@mail.gmail.com>
 <SN6PR02MB4157D2C2260E6BD529BCF08AD4A52@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250328162311.08134fa6@kernel.org>
In-Reply-To: <20250328162311.08134fa6@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Mar 2025 17:14:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjn1m+j1NYN6CKXvozOp-mmhXNFJLCub7Tr9JEz6Su5Lw@mail.gmail.com>
X-Gm-Features: AQ5f1Jo162yBUMXLpk32WRwO_4G_Hcq8NjyKMaCUXTIvXHba2tcHXUK7rPHUW_o
Message-ID: <CAHk-=wjn1m+j1NYN6CKXvozOp-mmhXNFJLCub7Tr9JEz6Su5Lw@mail.gmail.com>
Subject: Re: [tip: x86/core] x86/cpufeatures: Generate the <asm/cpufeaturemasks.h>
 header based on build config
To: Jakub Kicinski <kuba@kernel.org>
Cc: "H. Peter Anvin (Intel)" <hpa@zytor.com>, Michael Kelley <mhklinux@outlook.com>, 
	"Xin Li (Intel)" <xin@zytor.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 16:23, Jakub Kicinski <kuba@kernel.org> wrote:
>
> FWIW this also makes netdev CI melt down. Combination of allmodconfig
> insisting on WERROR, us insisting on W=1, and this change insisting on
> full kernel rebuild every time .config is touched :( IOW we do:
>
>         make allmodconfig
>         ./scripts/config -d werror
>         make -j W=1
>
> Could a hack like this fly? I don't see an easy way out ..

Ok, clearly we need something like this.

That said, your patch makes my skin crawl a bit. Not because it's
wrong, but because it really makes me think "why don't we have this as
part of our normal "cmd_gen_" infrastructure?

In fact, we *do* have something like that for our infrastructure: it's
the 'filechk' macro.

So I think the real fix is something like this ENTIRELY UNTESTED
patch.  Whitespace-damaged again to make sure people don't apply this
mindlessly, it needs more thought:

   arch/x86/Makefile | 4 ++--
   1 file changed, 2 insertions(+), 2 deletions(-)

  diff --git a/arch/x86/Makefile b/arch/x86/Makefile
  index 0fc7e8fd1a2e..769b29bf26ba 100644
  --- a/arch/x86/Makefile
  +++ b/arch/x86/Makefile
  @@ -278,11 +278,11 @@ cpufeaturemasks.awk :=
$(srctree)/arch/x86/tools/cpufeaturemasks.awk
   cpufeatures_hdr := $(srctree)/arch/x86/include/asm/cpufeatures.h
   targets += $(cpufeaturemasks.hdr)
   quiet_cmd_gen_featuremasks = GEN     $@
  -      cmd_gen_featuremasks = $(AWK) -f $(cpufeaturemasks.awk)
$(cpufeatures_hdr) $(KCONFIG_CONFIG) > $@
  +      filechk_featuremasks = $(AWK) -f $(cpufeaturemasks.awk)
$(cpufeatures_hdr) $(KCONFIG_CONFIG)

   $(cpufeaturemasks.hdr): $(cpufeaturemasks.awk) $(cpufeatures_hdr)
$(KCONFIG_CONFIG) FORCE
        $(shell mkdir -p $(dir $@))
  -     $(call if_changed,gen_featuremasks)
  +     $(call filechk,featuremasks)
   archprepare: $(cpufeaturemasks.hdr)

   ###

does something like that work? (And really: note the "something like
that" part, this may be *entirely* broken)

             Linus
