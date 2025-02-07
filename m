Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA20523C8BA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738944198; cv=none; b=AME0QhTQooUnCoqUKhcLfS74oj13YR+I2BwW7h16KjLVgy+yh/p16pUdk3zVj74p/1eCK+s7GG6BuNw+41KzLEZuGp3+jVJtHTNSu+/ZMiMj3JTu2rzwAwebtHD5KgmF99V12lb4Bx9ITYc/kazUUKIDd+aFjImznzFsKiXXkAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738944198; c=relaxed/simple;
	bh=GHIvu70WhmvWUGg5M9QDzOCrlBwTZ+HBxP8CnmsAMwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEtd2FGdMUYAsgJUiOr3ivTD6ijo1S58EhCVE1LLplSJuamMSptZb+YUJLm7yy6Y/P9wCoB5J3bh9tw779wfgo0gUuEQQCluLwY62bBElZS8G6HJZuN63izEUOzmO6mt/8t3lteJgcEIlQz3+p2B9SpxKDIS/wzjUetbA/BGQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ggUZYF0F; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ggUZYF0F"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4678c9310afso290981cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738944196; x=1739548996; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MdDEU/QzTK0Yv60rlv7pPkEUhIKKBhNRZbHuip232OA=;
        b=ggUZYF0F61+5hqQtQvIzgxvxwc7eQIuRRe7NwxGjuflLCUSdhGYLKa++b3eR0iACpb
         A5B0gTcMc7A/fKFimvCNddEZiqx1KP6jp7Jn9sep4rIyltgs5RyZufDSyOPy1501ChT0
         GuQHAYLYHoupNgMeL4tXNcJOJVyyRE5v7sJ0d9WtQfckwmcWoCh94yl5So0BJ7/okEWg
         F0ktBNZEoMWEw6n6FeRNYfyo17Ax6aoMA1gnJWaT4ssIBrunAFvVMpViUCfuHaK0NLMZ
         l+YNqCHpusrixYbnE1DEw2HmAcIqJadz8//GGlgo/6iHQyy09ZY+II0OStXgzxga86kI
         Wk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944196; x=1739548996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdDEU/QzTK0Yv60rlv7pPkEUhIKKBhNRZbHuip232OA=;
        b=Yo+0wA57qrwFVQv1EbS7vknOrqcgKSzCLEP/hq1EiPso8DFQoWo9nGDa6syQRAeCwT
         zraV20a4hpGgm6WmjJZoN4XYW5zvbxT9/QX6z2AubS7hjsvrq3itQHccGz5eE+k9ycJx
         K0F2e/1upEHcaBHmOlyuW5/kQna1CjK8WX+trJoPXL0kmL3VWe1vMAqUGfp4OADOr8Bc
         kI/3u4rYu6EVOzKt7k62K5vBiUmJreJ01bWIem1T4vGg8/qVqWA5EFL3NwR+O/ST70iX
         Wsko/oJvByvNPqVO8zBEcpcsaxm0fuRbkKxrUqgTDajqPTQY3RKtf5xonVVf5Yfp6W9L
         e+gA==
X-Forwarded-Encrypted: i=1; AJvYcCXpWjmybbSXPn+dLcnNQe+Fb2p9GNOWV7qt+Cr1hGaSFu4frBjB+FkDIqTDuWNYOp/1h89PyHFqYwTt9vI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv5r69GwG59v7lX3jucOjLi13b4yOG+qojSOD9g1VV2mkBd60a
	5gFRvJYEtuyf/cXlxmMvGDjd+je70Gswrtdmi+qRUi0WX5oV4m4QgbaBkrz9H3i3uQ6j7EA2nRP
	mxl2EM1Rexo+jn7b9V5ciW7X+2eegBDpnwof9UWD0Oqak+wPO8D+qem4eaQ==
X-Gm-Gg: ASbGncsN4azS12KYnQdbt/0XxiTu6pbksqdaLjCEorLpj2oQ/GfAsxsSpKJi3Ipcn0V
	lFXMjXsBqIHIuK3gd3c1BE1BpDIndvBLI1KBBWNHXoAU1Rz+ga5WlVXe5JcPvDeOdl2RJJT88Ea
	H8RhImtdiy5Hs041j4GHmtyNDSjE0=
X-Google-Smtp-Source: AGHT+IGDyv0tdeFgXFK4+NXokpnrs/Ow3uJbgvKxbsWdPKX1+p9MQq8C8C9h8dofo0MMgYw3EfAQ2y0fXmepjUd7Zo8=
X-Received: by 2002:a05:622a:613:b0:465:3d28:8c02 with SMTP id
 d75a77b69052e-471685b49e9mr3654221cf.26.1738944195478; Fri, 07 Feb 2025
 08:03:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-7-riel@surriel.com>
In-Reply-To: <20250206044346.3810242-7-riel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 7 Feb 2025 17:03:04 +0100
X-Gm-Features: AWEUYZkA3hse0G5JQpW_KHFyjXe2jABBlo7SQc0ZzAcOAMPI-l3KDCePqFxbKzA
Message-ID: <CA+i-1C3LDJTf26WdBo7MvCdTs-dybqsUp3Ze7NowcOUHPWMXrg@mail.gmail.com>
Subject: Re: [PATCH v9 06/12] x86/mm: use INVLPGB for kernel TLB flushes
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 05:45, Rik van Riel <riel@surriel.com> wrote:
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 36939b104561..227e972b6fbc 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -1086,6 +1086,30 @@ void flush_tlb_all(void)
>         on_each_cpu(do_flush_tlb_all, NULL, 1);
>  }
>
> +static bool broadcast_kernel_range_flush(struct flush_tlb_info *info)
> +{
> +       unsigned long addr;
> +       unsigned long nr;
> +
> +       if (!IS_ENABLED(CONFIG_X86_BROADCAST_TLB_FLUSH))
> +               return false;
> +
> +       if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
> +               return false;

I think that first conditional can be shunted off into the header

diff --git a/arch/x86/include/asm/disabled-features.h
b/arch/x86/include/asm/disabled-features.h
index c492bdc97b05..61376b4e4fa7 100644
--- a/arch/x86/include/asm/disabled-features.h
+++ b/arch/x86/include/asm/disabled-features.h
@@ -129,6 +129,12 @@
 #define DISABLE_SEV_SNP                (1 << (X86_FEATURE_SEV_SNP & 31))
 #endif

+#ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
+#define DISABLE_INVLPGB        0
+#else
+#define DISABLE_INVLPGB        (1 << (X86_FEATURE_INVLPGB & 31))
+#endif
+
 /*
  * Make sure to add features to the correct mask
  */
@@ -146,7 +152,7 @@
 #define DISABLED_MASK11
(DISABLE_RETPOLINE|DISABLE_RETHUNK|DISABLE_UNRET| \
                         DISABLE_CALL_DEPTH_TRACKING|DISABLE_USER_SHSTK)
 #define DISABLED_MASK12        (DISABLE_FRED|DISABLE_LAM)
-#define DISABLED_MASK13        0
+#define DISABLED_MASK13        (DISABLE_INVLPGB)
 #define DISABLED_MASK14        0
 #define DISABLED_MASK15        0
 #define DISABLED_MASK16
(DISABLE_PKU|DISABLE_OSPKE|DISABLE_LA57|DISABLE_UMIP| \
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 227e972b6fbc..b8a8665359a2 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1091,9 +1091,6 @@ static bool broadcast_kernel_range_flush(struct
flush_tlb_info *info)
        unsigned long addr;
        unsigned long nr;

-       if (!IS_ENABLED(CONFIG_X86_BROADCAST_TLB_FLUSH))
-               return false;
-
        if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
                return false;

With !CPU_SUP_AMD and the above, broadcast_kernel_range_flush
disappears from tlb.o. (Caveat - I didn't actually read the disasm I
just made it noinline and checked the call disappeared).

It's actually more lines of code but now they're off in a boilerplate
header and it's consistent with the other flags that do this.
