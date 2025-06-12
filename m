Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218D79E1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749710975; cv=none; b=BbBH8h+oNl+/ZGcXIaA4YdtmEMmnWiHxMADU6Yc0/8jbDjnHwFMfXY3lVwP17dpiXiDHCjZyFddQEhFOdd32s4I4rn1ZoFEaTItxMKQSWkWiBzrK1BbfU1BgMTMfEip1RSjM3E9RsX7+nevzKf90TpdITwpfezgiHxz6rmTQ2ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749710975; c=relaxed/simple;
	bh=cabyoBfSZnKaZy1A3Be67KEG04uI41hK4t/8aDBkBbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdG+GzWo4LvrJL5TUupqkLG8KKUFmZiO+qlpyCD2bryk87Q4/BGp9FMT46UqS9X4MrdbpY4CsNr7nwGK7/tNmysGihErhAsfa6yEh/jOYYx0Mq3YyjCrDlqKGyuQD+7aEZsHvLyYeT8LjZxOe2wWkf9mQgitvShzHCZuH5okmYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6GxGyHo; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6GxGyHo"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5290be1aedcso1032107e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749710973; x=1750315773; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIagQ3tKw+VRVzWHIFGN+DFKgeQK8xK9RH2ZXHnRA6U=;
        b=N6GxGyHoNO+8OzANnHRl4wJYvdRvwRK+YIDKPPCDUw1I+fieASDfeM0yk/A2f1qAWT
         UVBafDwu0nFruJIQWtCqRksP3uGedSk2q1hhXXU4yqdhKHIJR07i470Z+qaA9Uq1ka8u
         SPIHAQ1yovjUW6nAl7WoThDohhZcZar6f03lkCqRbJJNwcbmLN4MqQLYxz6sR3rj5/m6
         liHce9UJ3RNPVUV8bLzL31vJ5VxVEv3d/8kVUPLBwpd8TWqDzawnFbzYqwJosBa+AKpw
         Ppf2r4MqJbzyfoMBj17Fd45Ep1PAG8uFNofwhn1gCSL2Y2UqIdqQLR7gd/WwD7dnJfnP
         cNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749710973; x=1750315773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIagQ3tKw+VRVzWHIFGN+DFKgeQK8xK9RH2ZXHnRA6U=;
        b=TfSTdDbZveci6VlJM3FP+MBvViAI9zJ6NksAXYIL+EF59kq4S2kcOUDt7qVLtajE86
         7ir9bjHs2vcFnaK43Hca5W08UNb5MHw6pvzOfKbdAt1nFuZeG1rz+4iFVfhREMhJWoKB
         QeZAjr/mY0exWe9CTIwBS5i4otEvH0T7KjZM+I3mTv+nKeoOR53NEAqmIEgEDuxkjGoz
         7uwffXJOAsIhJKrz2f5TbTpQSuP8c+ZTgwi4FrRn/4N8m4XNfBExJsD4q3MGue9lVlby
         0IBtM35LGbCVslquoNY1M4HnM8ve5hjm+oaS3fxH9qmYkKV7uyhCdfgGeKYcLi14dH8H
         ARbg==
X-Forwarded-Encrypted: i=1; AJvYcCUm5I2wCwAlwskOzo5na8C811Tg3VVNg6gm+RCZieyGh0dfTvfhjzGxXUA0SOusNeW/mdNavCDfRssauqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBdpKO+BJJA8+r/nk45he43gBXLCI/xiE/dXHpA25AgSrxNhwe
	HmeUnR+W0sj2Ggb1OrTKpS18KQtSIeYB+eplzIFpe19woPNSiNY3ib7bnJIZSB7ddINXpGQS5Q8
	Y9tQKTe8/SN2HJVZCRNhzdHVwsHPO3eBW3IAd
X-Gm-Gg: ASbGncvfBaKtyNu+VAqDEyLeOk3HewK9aMX7ygg5rGikfe3DNlGDfwHmRPj/0a8FNFt
	WNpROuygq75Lpo90kD+PZPDQ7LYih2gFfhAIuGDfpYkoFUuF33T8k8rQr0VAyIye/2id+DviYl7
	21J+SfEiAayEL/6eqBxhUonRtDuC5IAf3ECHcDL6CIkrf2Z5pKwVxGuEfWi0ltdVCIUTg5ytXzf
	vA=
X-Google-Smtp-Source: AGHT+IGD3eZR9/mZ47AnHOjtmb2jyKNdWbD8QMM1UbBROZtZgAI+wcvkLYS5Dqd7Dl/ahOh6vfuGKCSVejVpRlBkST4=
X-Received: by 2002:a05:6871:5a0b:b0:2e9:5d01:effc with SMTP id
 586e51a60fabf-2eab3fd5893mr950668fac.2.1749710961123; Wed, 11 Jun 2025
 23:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-2-zhangchunyan@iscas.ac.cn> <aEMeKIBDKUTUI3B1@debug.ba.rivosinc.com>
In-Reply-To: <aEMeKIBDKUTUI3B1@debug.ba.rivosinc.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 12 Jun 2025 14:48:45 +0800
X-Gm-Features: AX0GCFsFusn6QO5kIpgi5nARUF3bNqkUVtgblhgNgnSm2q-UjFddMwiMEi3J5as
Message-ID: <CAAfSe-tUNxzHq-GeN6AhX=46mu5iMYV4OZPNRU1pKf_2xAfGVQ@mail.gmail.com>
Subject: Re: [PATCH RFC v7 1/3] riscv: Add RISC-V Svrsw60t59b extension support
To: Deepak Gupta <debug@rivosinc.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ved Shanbhogue <ved@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Deepak,

On Sat, 7 Jun 2025 at 00:58, Deepak Gupta <debug@rivosinc.com> wrote:
>
> On Wed, Apr 09, 2025 at 05:53:18PM +0800, Chunyan Zhang wrote:
> >The Svrsw60t59b extension allows to free the PTE reserved bits 60
> >and 59 for software to use.
> >
> >Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> >---
> > arch/riscv/Kconfig             | 13 +++++++++++++
> > arch/riscv/include/asm/hwcap.h |  1 +
> > arch/riscv/kernel/cpufeature.c |  1 +
> > 3 files changed, 15 insertions(+)
> >
> >diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >index bbec87b79309..332fc00243ad 100644
> >--- a/arch/riscv/Kconfig
> >+++ b/arch/riscv/Kconfig
> >@@ -842,6 +842,19 @@ config RISCV_ISA_ZICBOZ
> >
> >          If you don't know what to do here, say Y.
> >
> >+config RISCV_ISA_SVRSW60T59B
> >+      bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
> >+      depends on RISCV_ALTERNATIVE
>
> depends on MMU && 64BIT as well.

Ok, I will address in the next version.

Thanks for the review,
Chunyan

>
> >+      default y
> >+      help
> >+        Adds support to dynamically detect the presence of the SVRSW60T59B
> >+        extension and enable its usage.
> >+
> >+        The Svrsw60t59b extension allows to free the PTE reserved bits 60
> >+        and 59 for software to use.
> >+
> >+        If you don't know what to do here, say Y.
> >+
> > config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> >       def_bool y
> >       # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
> >diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> >index e3cbf203cdde..985f6dfc80ed 100644
> >--- a/arch/riscv/include/asm/hwcap.h
> >+++ b/arch/riscv/include/asm/hwcap.h
> >@@ -105,6 +105,7 @@
> > #define RISCV_ISA_EXT_ZVFBFWMA                96
> > #define RISCV_ISA_EXT_ZAAMO           97
> > #define RISCV_ISA_EXT_ZALRSC          98
> >+#define RISCV_ISA_EXT_SVRSW60T59B     99
> >
> > #define RISCV_ISA_EXT_XLINUXENVCFG    127
> >
> >diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >index 2054f6c4b0ae..0f0f3027d400 100644
> >--- a/arch/riscv/kernel/cpufeature.c
> >+++ b/arch/riscv/kernel/cpufeature.c
> >@@ -523,6 +523,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >       __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> >       __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> >       __RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> >+      __RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
> > };
> >
> > const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> >--
> >2.34.1
> >
