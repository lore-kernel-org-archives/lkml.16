Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD8D8F5B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719802; cv=none; b=rSGzoTYurjKa2is9KsLjICCaJGYa8lJT/ifPQvtuE0eZ831+fmzoIJnR0pKe0EMzOc5qw2Ga6xPWj0cHruV16+heqoYo4QUkaBqhNoscoZ/Pg/4eVzfcdjwLaGg72zXqDnbRk2IjSRyzV0Cz5kFQi4sBrxtUZ6pk0bGDIZeBcqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719802; c=relaxed/simple;
	bh=FDwek3fr/PmYXYNHgRLWe9UzPhtVYMKWLL3gd9RXr5s=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=aS4tvRTO2exf4HlI5Luzv+JMdJnKEvXpiqxZZVtf4ba1+bizax2XDT/IN/FQpyMscENdfqHaAtwH1vLIlQZHYHdNt9TnD4lRAztbzPwVII3D7zwFNKVAtKI0d0OZisLIw4HWHoJKSMsJH4cgQ3ZMIRH4nyLj3Q5u+SIXqJPci6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=saae4ktD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="saae4ktD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235ef62066eso63942515ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750719798; x=1751324598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYbY7zCqPp07CEIN2qEcBXINLkTa3pVeWNV25QfSjGw=;
        b=saae4ktD80Jy6n3D5pr+Gzbud/KOHLSai5bGJ826jyIiH3Q5a8h2472dc2zY6Qps+9
         CsQNUaiGuFVKzRHFXobKvfO5hP+Rk2yyaIi6n/7qWeGg/9a/dcG188m5boR/ri/VqlYi
         uM6gU3bTDmiTb5SWmzavaaKqagxYzNfa2O7sFaJ83Geuml8jlikd4dwj0zAUiyyfZc3/
         1m4q8Jdu4SyvUb5FEOPvamBVMHssw/nMfh0hoDt5YNhc+jEoOU/rNl0ddvzQR9oO497d
         +GgnxlyuNzCogC832yW6vvRuHY+gxonOLKAa/4zUFup9wZbOLeH+9sNCvWxlLetwJPno
         QkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719798; x=1751324598;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYbY7zCqPp07CEIN2qEcBXINLkTa3pVeWNV25QfSjGw=;
        b=snka2SJnKIWAHRgHzPu9C+oFZ2Sim3A8UVAdm8VWkzkA6bw71YlzIJtLsM4Nbl1/gu
         LUaSZMlJlS8RA/Y3+nRDxqDycmffrRoiCAnoNDfkuY+ehxLJDbk6k3CP3cOP9EraHeWL
         sHx3528NqZXBR3gUeAH4mUM1iyU0QxmEj7G7Yx6k9acYBieHzwMa1NYN7FhRPJn8hlYI
         S+0/OctE7RGSurPBc9C2xb1IddZTH2Bg/k/U/egxLD4KGwvUQ7ZDZGvP1oTkkSzMpCQK
         Aip4zOxHj6ahHdqndaeJ+pgvvmvoM2sOF+DyjONf+/yjSFcGoL3SVcPPRjZmDTDxf0NH
         erGA==
X-Forwarded-Encrypted: i=1; AJvYcCUCYIwBWCcF/5EZlk5EKLYb7iDarPnbBcmNQvlkyR8x2TV++YIAiNr6zU0SVPz+GgbQTRpSxZnErb3RW0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5cU4VO7WbMHHOvE/Y2NvW6RIh3c6QCDOnKYeSBFFA4pLaENFS
	IVsLsvDu2749zoXQxkQh3JY0d2OuFbzz1wa6ZSc8YgFu4+2Z5mZYAufcj7gE2EcuAqk=
X-Gm-Gg: ASbGnctH83U+a/n1irjYSiHNuyzK5sgRDW+H6uV/68H2wGqgTHm+Q2+6iTIgkJ2W9V1
	JTiJM2GLMoChI5J4kg6IUapi3ra3K37Wer9s6SvtZ5a8SYdqfxmYZ1owRJ1zsViF46OFUHYJbFY
	eVnOnXP9oXJpoYXRHvLsuLr/9f9kUNRlixQURmmsGfH5TPzxy1T/b9J8c8ojkY2nkPdCub2OnI1
	CsyZiuuOZ2+pMGUZ/og9nN4hRmhyAVxutt4phU+cmUeoKJmnV2PUPEsJMmxeIDThZMzPb9tRxcl
	El0ZjR1quOcyuynFX7rVK3XVB47XmGB9ysnKPd+X4DIbaN6Jpdyca8tHHhW+
X-Google-Smtp-Source: AGHT+IFXdcT+bmVShTi+PuWWIBnOBSGTJzAsIh7dVARvdUVdKMYWvf1xGRlavIA7rJMJZwYdw3qlRw==
X-Received: by 2002:a17:902:e54a:b0:234:d7b2:2aab with SMTP id d9443c01a7336-237d972fa09mr189517965ad.14.1750719797830;
        Mon, 23 Jun 2025 16:03:17 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d83f0f40sm95374055ad.79.2025.06.23.16.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:03:17 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:03:17 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:03:10 PDT (-0700)
Subject:     Re: [PATCH V8 0/3] riscv: mm: Add soft-dirty and uffd-wp support
In-Reply-To: <20250619065232.1786470-1-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, linux-riscv@lists.infradead.org, debug@rivosinc.com,
  Vedvyas Shanbhogue <ved@rivosinc.com>, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-536B594B-996C-4A15-8744-C7A27B45720E@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 23:52:29 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> This patchset adds Svrsw60t59b [1] extension support, also soft dirty and userfaultfd
> write protect tracking for RISC-V.
>
> This patchset has been tested with kselftest mm suite in which soft-dirty,
> madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
> and no regressions are observed in any of the other tests.
>
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

This 404s (with or without the ".git" suffix).  I remember seeing the 
spec at some point, but I can't find it anywhwere else.

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
