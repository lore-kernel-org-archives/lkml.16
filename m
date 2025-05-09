Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C66828F942
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790201; cv=none; b=aYnO548mNAWZSlDfTTdSLrJuDHy51gvjmzaNhOntQk4kfPxZKC6bIkjzAGKvnGSIL0s/bHTixw8XQo4c0ga7pDWEIWVxdXkTQcp1Hwc1rhpwPcjnUt0wA1kEbbbWWNiCiFIJ/+a1NBdBHEy+e5Vf/M3SSXuEZXo6Cy8B3wLptgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790201; c=relaxed/simple;
	bh=fzs4MBOvD+LF7kzFPGxEsVFsEfSDbIKVc/1rCNfRN5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkiRcexLVty5X6iNi8tXjtm663VflFqZdziNQxHBPCF6x59B+zzAhztFDMBkP7wWSB72Bj1zwMIJAnpHcpxdQu5mMwKTM0yNvx7gfsk/8gwfB8hTJ4df9OmqOrt99fxMRsYcP65yPTVxHPpYgyToGtpzHkZjqmwvb4juZ/76+aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jJRn4jiu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jJRn4jiu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0ac853894so1702623f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746790198; x=1747394998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PS161WiIseqQMvNduUZogtk3N3mmBOCWz6m7XRDgGoE=;
        b=jJRn4jiu8D89meBWhVKaKxXTJxO0mIREa4bVYTi307NVfp72tQvcylqqqZX7Ur92Gs
         8xj3aJPEIFkvh3CTfa+b6V/7GYu36VfDkhBfDKA1fy6ea6d/XrI7ouXsKv1bM/03Gkii
         xQ/NP1zpg3f5UXK7H3pnSgOdXm2/SeqjNItf8miX/2StDX5/l4JjWMrcI8Jpja8zwBX/
         kfHUmIxrIT3u6ZeHb7zlyio2At+oWsKpp8Jb/a0aFbD31xbB+ZkaStja9Yed0ygEmKGf
         gBMqI3x9i9FvPk4Mp7q4IxygRetqy0Mb3zrbBKA2gm3oLEX6jXmQG3CMMMKoVwIHqmj5
         bIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790198; x=1747394998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS161WiIseqQMvNduUZogtk3N3mmBOCWz6m7XRDgGoE=;
        b=l89zodOqZOGTXpjEq3cOFHdfLmWASNORzpSPa9jMlwdUcmmxZb6QDiGN7No+D79s6C
         j/6oTBZf1KG3GgwHhm8ZCVy4XlbitP3eEg0flyhl09U76ePVnTlcd1Sythfpu2eKp/rl
         dwspvfY4A6aw/yV6gEQ5A+vKwJOSrA1DmBh3EKuHT5kKwyDNFc8dF4400Jf3nml7AglE
         PFArt4bOjTf6bjJHWTftN9YphwSfwX/b/s7GdskNVunULJMkHm3tKumnL9HXEAD5tgV5
         kvpS0NdwYmJuHvbzn9EYIc4s4BCsUof0ecER9H2NuVMuG4j8b2PgHXTK+oRiVT68VEhv
         MsMg==
X-Forwarded-Encrypted: i=1; AJvYcCXbaRUEdKSMIkDLsCYK01mjFqmFs/kIo9gSZz9zr+fPMosik0JLHuCbVZ2ysWBaOiBtIBh+b/satEBdTl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2UBM7HjMXeeNOjOlpTvBt/eDWPLGZDZ2MAKLiDkCtirKjElT
	tzak9cK8xHA91Qif4XHGQJMWGbWhxHugNg2Ni+QPFCzfh3Mm+Fz4O4M4QeY7i04=
X-Gm-Gg: ASbGncvYKTnbEsvHLllTpZ+Y9q3jh6Q2oTidiewpF8zF7rmJ2pLlyxrimZyiyR3ARLV
	RSMi77Voy6+Uwn5BZgKBeorTa1qnjwoT6VCikLd0XfDWIR1Ea46P6HG1qeDOnrk5q3KSVQvIZ0K
	734vezC6jLr3Vh7Puq9IKVaIBDlC5smPSAl/Zgq3GmlucsJtkYnnoLJ9Q8eMehWUAzFdgybUv6O
	63l/VkSjDjrg87BIlPaNOnZbBiZHaP9//vLKbFlo40miB7wjKJdEpn3rkrD/eXT0l7fJs5gcSUD
	a/1KTzP6zBC3NQkrNUGAFO9Q0+ZA
X-Google-Smtp-Source: AGHT+IFyD+sjIl6oyk+GUqpe3q06X8ef9h4zpi/ejp13lhZHBDbgLcyRC1n+m1ZiSGeYARfIOQsk7g==
X-Received: by 2002:adf:e78b:0:b0:3a1:f70c:19bc with SMTP id ffacd0b85a97d-3a1f70c19d8mr1667927f8f.48.1746790197611;
        Fri, 09 May 2025 04:29:57 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2c8sm2977553f8f.61.2025.05.09.04.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:29:57 -0700 (PDT)
Date: Fri, 9 May 2025 13:29:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
Message-ID: <20250509-1b7cbe3ce1c23a20c571d3c6@orel>
References: <20250508125202.108613-1-alexghiti@rivosinc.com>
 <20250508125202.108613-3-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508125202.108613-3-alexghiti@rivosinc.com>

On Thu, May 08, 2025 at 02:52:01PM +0200, Alexandre Ghiti wrote:
> RV_X() macro is defined in two different ways which is error prone.
> 
> So harmonize its first definition and add another macro RV_X_mask() for
> the second one.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
>  arch/riscv/kernel/elf_kexec.c        |  2 +-
>  arch/riscv/kernel/traps_misaligned.c |  2 +-
>  arch/riscv/kvm/vcpu_insn.c           |  2 +-
>  4 files changed, 23 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
