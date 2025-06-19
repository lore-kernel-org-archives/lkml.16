Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD620E715
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325687; cv=none; b=rspDPPvkH47/u12tMDYad+MR+KKi9BeFTgUngy0/D4Ka6ak51hO94W48IZhRAmfU8FcPafkz4JhavcuFtINlCKxtQzBZ20sPW6x2nHpIIWDSGSf9ayu3gbIbw9Jluyh1Suhz5lvpKGmWmnqRLaM0CcIPrhFBL+IB02M5EobtB+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325687; c=relaxed/simple;
	bh=EfHfHXOd58iPZEhOfSaCiBNNOoPfV3kB9Fv60eR6I00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUDyrdBoxEqv+s9/xfK7n/lK1pMRBxPi8VT5ASI9fj0BvztKoplwkbfHwpmt3xK0+usZWkNDnKwuWE+Nci/PNgAIXMBO2aU1lHmGWgc20HkMlC1TxLzUiz8YyOVnc1HVf9y1Dz7vpdKmdNTs1d69rN8z5AxldvovJ7uy12Px+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y66VWTwG; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y66VWTwG"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2ea2fee5471so342761fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750325684; x=1750930484; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GEM8aSdK4BbpZsaiGvekI/zZkHOT0NsV54eIKTj0uc=;
        b=Y66VWTwGci5eeb4An4nmkt8vdBHDMRlvH1GaB6j5K61IwVIppIAsDD+BPFSPOifuyc
         CqipbDm6RQwx/sUjLdbVJbKbVIZ4xAQpCsdby32zlQbo3V6j4lo9/SzvXa+AwLyORxg2
         29JQZCatluvCgAlH+IDXEJ27p97DyPG08paBbpP5PG3QRD2xGTpF6C+LTJfCGG561NyU
         wi3w15vy15OddgTz2auqnTT9A2+mqeh+PmjHTPLLhRkV0VGHlI1jEn8q7G0Ur1T7NQaL
         9K0Yl/656iB4l00Uk3icWSW24voE2nLTaR4+laaPi4MoywJ1fSfrU81MGiVGjqdAzaB6
         t0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750325684; x=1750930484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GEM8aSdK4BbpZsaiGvekI/zZkHOT0NsV54eIKTj0uc=;
        b=QZECQfLuj1zTyX7l+Ny/pNqTL2eKVdQuvf/BFIOswFHXI/Utph8AftG4QRB8FO+AE1
         MzKeLF7kVyS7fclyxEI6zJ0qlMgue4sUQ/NVsMMrh8rA0iy+Ml/Bbup3nZyuNx5zYB90
         P0CFhrJDTRCtQKq1HqN4rHYPgdm/mEBKb5bfo3Dvpsn+6FQfM+1LLattEon8bh5xQuy1
         Aw/D4sO1mOOzVf+hB+Eg5fQc7v7yMqhleC9HsN8lqCg2PJVeOvdX780etBLvgEftXzcA
         cYleFxWWDOAaVIVEJW/H7h/AlefzKYC7ioKeIRp4vhNUZzRk2N9iznoN5UogSbRo7wMy
         r5dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUXbQ0rTf7vVFz8KnR1lnRK/R+guApFZ0Rq8nIxUNRHCXVaQmUpcKOJXJbs6SHhTLIU9hOWB5YaJbPvgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3AwmQTyFggHUrrjuEVpROblnzbTBfu6WQEJgMKhwqby9/lMa
	lyXbhwS6CU6/YYGLYNLm5XRtZjEW/g0PvqSxhJqHmlNfhD3Py6AdCrTOoj+D3bwgkgwxmwhGyCC
	UEg+ArSTHlUBFINeRcydWfOKqzJgAIio=
X-Gm-Gg: ASbGncssqgvzWin09xFvHK3HL86E+kQ5+ILkuzZYcvRTewDftRgx2/em9B8GUy/1yIc
	BgLDgsqXOYlDdC/4AkzXIZE+E62KNJjl3sL4w3XDnbTYul1EJVCHat0/kTqStWIzO0hpPsHi4Kr
	vVQ5BO2jgTLPmekOe3qgFUOF7nNS8D3TonWATLtZWwZzsB72ElLmWf7/5ZmdvUq0RoMD+cRVXkR
	QY=
X-Google-Smtp-Source: AGHT+IEkvgD+z2fKoSt3oTmo8zIn6oFWTRfRDG+GNL6TOsFM1snRFgZfvo9twtWiiM8jezGNxQE7BUh4k4/Cm+Jc6J4=
X-Received: by 2002:a05:6871:358d:b0:2d5:2360:4e7d with SMTP id
 586e51a60fabf-2eb9e94538fmr2120732fac.8.1750325683778; Thu, 19 Jun 2025
 02:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619065232.1786470-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20250619065232.1786470-1-zhangchunyan@iscas.ac.cn>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 19 Jun 2025 17:34:07 +0800
X-Gm-Features: Ac12FXz3zKouUq1RGz_ibmj_qkiKm2C6OltBEmZ1_YCX4xaOcj7QnZw62n6NeT0
Message-ID: <CAAfSe-sQ9fCLR1ixhhJA0=U1EVLX=KiutieL9_rVTO0A_w144A@mail.gmail.com>
Subject: Re: [PATCH V8 0/3] riscv: mm: Add soft-dirty and uffd-wp support
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org, 
	Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 15:27, Chunyan Zhang <zhangchunyan@iscas.ac.cn> wrote:
>
> This patchset adds Svrsw60t59b [1] extension support, also soft dirty and userfaultfd
> write protect tracking for RISC-V.
>
> This patchset has been tested with kselftest mm suite in which soft-dirty,
> madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
> and no regressions are observed in any of the other tests.
>

I also tried CRIU below functions and they can work fine with this patch:

- 'criu check --feature mem_dirty_track' returns supported
- The incremental_dumps works fine (https://www.criu.org/Incremental_dumps)

> This patchset applies on top of v6.16-rc1.
>
> V8:
> - Rebase on v6.16-rc1;
> - Add dependencies to MMU && 64BIT for RISCV_ISA_SVRSW60T59B;
> - Use 'Svrsw60t59b' instead of 'SVRSW60T59B' in Kconfig help paragraph;
> - Add Alex's Reviewed-by tag in patch 1.
>
> V7: (https://lore.kernel.org/all/20250409095320.224100-1-zhangchunyan@iscas.ac.cn/)
> - Add Svrsw60t59b [1] extension support;
> - Have soft-dirty and uffd-wp depending on the Svrsw60t59b extension to
>   avoid crashes for the hardware which don't have this extension.
>
> V6:
> - Changes to use bits 59-60 which are supported by extension Svrsw60t59b
>   for soft dirty and userfaultfd write protect tracking.
>
> V5:
> - Fixed typos and corrected some words in Kconfig and commit message;
> - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste
>   error;
> - Added Alex's Reviewed-by tag in patch 2.
>
> V4:
> - Added bit(4) descriptions into "Format of swap PTE".
>
> V3:
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V1 -> V2:
> - Add uffd-wp supported;
> - Make soft-dirty uffd-wp and devmap mutually exclusive which all use
>   the same PTE bit;
> - Add test results of CRIU in the cover-letter.
>
> [1] https://github.com/riscv/Svrsw60t59b.git
>
> Chunyan Zhang (3):
>   riscv: Add RISC-V Svrsw60t59b extension support
>   riscv: mm: Add soft-dirty page tracking support
>   riscv: mm: Add uffd write-protect support
>
>  arch/riscv/Kconfig                    |  16 +++
>  arch/riscv/include/asm/hwcap.h        |   1 +
>  arch/riscv/include/asm/pgtable-bits.h |  37 +++++++
>  arch/riscv/include/asm/pgtable.h      | 136 +++++++++++++++++++++++++-
>  arch/riscv/kernel/cpufeature.c        |   1 +
>  5 files changed, 189 insertions(+), 2 deletions(-)
>
> --
> 2.34.1
>
