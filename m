Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FD14A28
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743386494; cv=none; b=GfVrsSz90GMSS0P3g/IhGLJYk+vW4+yyGugUDs1I4Qfv6z0dwjyuWsdrg1/Rss3Jog313mWzUyDHyT6OYUhEtUVXDzpSHc/xqh0H75JeEu8Z1C7q0YB5gWjMjwqDXT7r28PujkJOiCR49J4Fqip5OySW/LSYsGqOZpWTw/Beikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743386494; c=relaxed/simple;
	bh=USRK93rskzLluJ47JzXzuHE8ZkocAIUliDwrj6oVY8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnYQe6BG+kwR2EpFGOJt9SRWyfG57KzDI6JcNhGkT5srCOtDPI1KJUDodMvx32mhj/rhGv4JdjgQIbuvSXH/ZV0+FL3p9VsVW9Jf1smWx1ONQZfAMPaGZOzjKZN1fAS+LDMUq9EZuTzulI/CNbg4X2CuRF2OxbknpTVbcu/5hOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0LNvbKo; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0LNvbKo"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72bceb93f2fso2781409a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743386492; x=1743991292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d2JS6EGqc0l3PzKtje4HJKFvA62a4rcCqEYUHac+00A=;
        b=K0LNvbKook3fRCURRmkpvP12osmgPhqEtRtcbR6zpLZpJnKfoXsB4c4tK4G0uruUlF
         64Dbc/5bmvCVuVtd7pVibbdwvs8+/DSco9NWFjSgh3X7tQg95QcE+C/qYxJwlHs8PO46
         6fATlljs5PZl1ygYWxU3YiGrjqdO35CZEil/30m9M3w65LTFGYHMKKRKO8yRXtRKDKU8
         iGJsi0eFL5GwwmMOovEAQgXYB9Rztae5pqoO2D2Yi+AKEuoZOA54xp/1wZyd8bWvn13j
         gO21gBRgF+nR9wPj5svtISlaJTrk8VYZb/U7SROXL4OM9MYj/8ahNiJLjox4wWN45sdF
         oO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743386492; x=1743991292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2JS6EGqc0l3PzKtje4HJKFvA62a4rcCqEYUHac+00A=;
        b=xP/m6ErEHKBZLoY/5glnx+pyH3KqKfpXtKwHzd2HNHAWK4RhljKULzNHMMeOml09bW
         67gonfQ/dJR1C+4qRCPBZYbKJGl04tdftiToidoeKW9/2cSCLoEHv0q9sa9maTT2/eMc
         uxpz39hdLHHduigp1+jLbJVE8PKBIJTlmO3NQ5XBZQ/cy5l8UxTKtksfi+HGYg8IQaF+
         fij/FGzDnvXHkioBwoZFBthyTBqv+ULEo7/JMUp2ApQ9NY0pOpd7J5/B1CYZh4g1ewDY
         YxU+gyTLygoevzMWDcOh46WPwNVi7VUjQoFXAH0Hzl5lw65rMlMQUPTxU2r+Gpl/iUK/
         9kgg==
X-Forwarded-Encrypted: i=1; AJvYcCVxZ4bL84JHHn51NzGwL6s4WJjbnOkiLFOeAW3WUNrHHFXYQfhw/3tD88AYXAC9RLNoY00xhqc6OVfOCos=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGm8QB2tn7S5g3Dqcws3+XbQitwMjxMwedluYhf+XEI761Q3RQ
	BN3x+9jHSLVVsBnZyVVZDsGr2lr75wTUWLRiSPrrTX4mPerWh4a7Vl8RIXLmLPI3C2K2KtjNhjs
	PFzQyZ18G0JJ9+L2axZBVE+U0+HHQQAAn
X-Gm-Gg: ASbGncu64GI5j0nxl3US4AyzJygSdB/4YpTek6VKZkMUdOFGdOIFZbCtKnEEORm8IyW
	os/Pq9ZpQWtD/ISpterG7g8xl5BjKQSqcSeCuZ5f1ylcgzMiq3lzYpjGw9GXKd/as22JQCREbUr
	M4bgCROWGp4I52R/aXIlYgb7YtDma54q+wsjUxRx3j2l/p6RNWzmy7Bw==
X-Google-Smtp-Source: AGHT+IGCia+4Ex6NvLyvevMc9mKF3cPJmD6OJrIk6RNzqydwS1bAInXnp9yrCAsUBCFXOqxYOjoiJeXm5cnsG4w2QTI=
X-Received: by 2002:a05:6808:144c:b0:3f6:a929:c41f with SMTP id
 5614622812f47-3ff0ed03b7emr3895364b6e.16.1743386491794; Sun, 30 Mar 2025
 19:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn> <deb70c8d-aef9-49df-819c-53007a9ad699@ghiti.fr>
In-Reply-To: <deb70c8d-aef9-49df-819c-53007a9ad699@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 31 Mar 2025 10:00:56 +0800
X-Gm-Features: AQ5f1Jprv1mywV8jNuO9bqjz7phUTCJf-fZc6-R1RW6Kyq__r4IrV8nRfXiW904
Message-ID: <CAAfSe-tbuFudwJZTzVoYExvGyMm1w6KxybczYbGHBxS2zVkywQ@mail.gmail.com>
Subject: Re: [PATCH V5 0/3] riscv: mm: Add soft-dirty and uffd-wp support
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

On Sun, 30 Mar 2025 at 21:51, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Chunyan,
>
> On 13/11/2024 10:58, Chunyan Zhang wrote:
> > This patchset adds soft dirty and userfaultfd write protect tracking
> > support for RISC-V.
> >
> > As described in the patches, we are trying to utilize only one free PTE
> > bit(9) to support three kernel features (devmap, soft-dirty, uffd-wp).
> > Users cannot have them supported at the same time (have to select
> > one when building the kernel).
> >
> > This patchset has been tested with:
> > 1) The kselftest mm suite in which soft-dirty, madv_populate,
> > test_unmerge_uffd_wp, and uffd-unit-tests run and pass, and no regressions
> > are observed in any of the other tests.
> >
> > 2) CRIU:
> > - 'criu check --feature mem_dirty_track' returns supported;
> > - incremental_dumps[1] and simple_loop [2] dump and restores work fine;
> > - zdtm test suite can run under host mode.
> >
> > This patchset applies on top of v6.12-rc7.
> >
> > V5:
> > - Fixed typos and corrected some words in Kconfig and commit message;
> > - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste error;
> > - Added Alex's Reviewed-by tag in patch 2.
> >
> > V4:
> > - Added bit(4) descriptions into "Format of swap PTE".
> >
> > V3:
> > - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
> >
> > V1 -> V2:
> > - Add uffd-wp supported;
> > - Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
> > - Add test results of CRIU in the cover-letter.
> >
> > [1] https://www.criu.org/Incremental_dumps
> > [2] https://asciinema.org/a/232445
> >
> > Chunyan Zhang (3):
> >    riscv: mm: Prepare for reusing PTE RSW bit(9)
> >    riscv: mm: Add soft-dirty page tracking support
> >    riscv: mm: Add uffd write-protect support
> >
> >   arch/riscv/Kconfig                    |  34 ++++++-
> >   arch/riscv/include/asm/pgtable-64.h   |   2 +-
> >   arch/riscv/include/asm/pgtable-bits.h |  31 ++++++
> >   arch/riscv/include/asm/pgtable.h      | 133 +++++++++++++++++++++++++-
> >   4 files changed, 197 insertions(+), 3 deletions(-)
>
>
> As mentioned by Deepak, there is a new proposed extension Svrsw60t59b
> which will free 2 more bits. It would help if you can come up with a new
> version of this patchset using this new extension, would you mind

Sure, I will cook up a new patchset using Svrsw60t59b, and will submit
the new patchset after v6.15-rc1 is released.

> working on this? If not possible, let's discuss how I can help.

No worries, and thanks for the reminder, I didn't notice this new
extension supported in the kernel.

Thanks,
Chunyan

>
> Thanks,
>
> Alex
>
