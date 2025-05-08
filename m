Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8072AD20
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711072; cv=none; b=bg8KtrH89Nn/PIlT+M2LUhgLSWR1Q/WlCZB0B8rtkGCzc5Ke0r9frpR/HWAaegUDelwtEd4rTDTHmxdglBH3tEJVoZZ+6DCWpFhMKcHjnCsDmysn1UIzjGvRXsLWx6Lo1/wIj05uydg5OlbNIW58/0Kel2XXVSZx0a+qS4sgXFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711072; c=relaxed/simple;
	bh=PTIxFNCKUc6RCmBCpLXRdipjalC9UH6iNZPNrIkp7Uw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mFtdDeNS35/5IUSg3PBUBoTq3RNT7ic3wrR4OmPhQHdia+fsdhOOYX5Pu7lmoudvyyOf9PhlfXhOZ8vMvTBZIXk9G7xfhtelSUY/AcywHhxopATKF963W3qNVVu1DZQ8oxSphdgU0cAOVxdehtuNuEiR0iBPep465YEvEQaXGGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Loz0hoos; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Loz0hoos"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so454555e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746711068; x=1747315868; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S+40JPuRC3gzWdqTu3aQzXeyhaHlO7szVi8IcUpV9U=;
        b=Loz0hoosxbjIh9XfGXwj59Q6xVNvJ/uHTMgTfSbilrV3FYkFJ3NjL9koJmZF5Hkq3f
         w4XHy2UStdeBxIyVCH/ZfMSrGNPAiKhzdVPvRN52nhimI476gay5+HzmwznQv4pkPmL6
         0R7C36boN5Z7+1xrwhf7+aIlcw8afzHWALVxbHpXMfqatfwsMYzVZB2/4reriCFC4G1r
         Lu2FuuBSnxSGvDxSKUepZLTa4t6OEix7lVaNaYt5Ngl9/LdpDy0Lj966YOoowqDJbkIx
         gwT39FjStKIuiY9RYZLOXzSMRatTWqlCrMZxJkFohyx2AEkawAVA9JvC7WZ2cWwjn8qi
         wFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711068; x=1747315868;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6S+40JPuRC3gzWdqTu3aQzXeyhaHlO7szVi8IcUpV9U=;
        b=YF+FQ4ZW5UQcHXivovYOJPPz3P17VstWvBOVBmLxNsL8fF2DRAgMzaNgeuMDOpD4jY
         +kYi7AsjfK0iPv3wbsOFdbiVubjK44t5ZnA8w8Zvvt7o49tPCiO4vTIi4rpJciUMtmh1
         4JRnFVgfqYgZZbxkz2vF5TLQPXQMpGNQekF6xJ91bE83x36Hq81s5UyqL23WYXN3Lp/P
         oyYqTncRZHHB5TIJB9Kmzbbk/8dqz+qyLmZ4T60gKizPnLGqFqevrX9GT3eg9IShHKx/
         PaLdzP1g9oK6kdNBMyYTlaAB54hO1esPKwu9mVmrWKaJWT3ELdNg4P3mQ/PcUInhiYy0
         hAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbZyO8m48TT7K07n57x6HSi3UB/WZr0z5fW+oO1IhPp4XDUhV0kzRXUFX5OOkj37KshyZ1LGzCOfKMNNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGjBSyzpa/6SaNF/+5wlSuPkNEPtERb5psBYahijzKBC0iqcY
	QmFL5GTmTcJ6nHe5jAEX2+egddGTb2DHBfPIbD3cZtPh0r6M5lA8PBv4hPMPpnI=
X-Gm-Gg: ASbGncuA9dw7uHwPwqACvuTb7ch6O3uB2GbGWX2idMSTvUl+/ijFk7FGevOxk4OHBw7
	DqipDsj7w/J9PQqQGfbbEEh59klNig2qmmJ18skKeR8zClUmlCnHz2wW1nud8sqJFep5vShxuIO
	lXrhI/f8j5bp3SeVSBOJbKl4KtvHNnI5aypOc4rr6x/L74lKI7Jny4PK6X/kcarLfYYwVPAvEGy
	/bHpsgYEIo5NAPZko6HC+7E7VtjGF90qQYEbXG6qyxROAl0CSqBYl+W3Bs51aPdCg3ygBeIQEBn
	9zwKe0S/uagmGLiIn1R/1kSwH1dLLvBXsUSnvNLZF3o0chLS
X-Google-Smtp-Source: AGHT+IGijAnvSUvNKAgb7ZNKd5QJJ9UF+zXOT/jF3FQWpi7RwPSldc9C2Ir4SMyQ4xieyEHWiNZ1qw==
X-Received: by 2002:a05:600c:1d8c:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-441d44c4749mr23230845e9.3.1746711068529;
        Thu, 08 May 2025 06:31:08 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f238sm37108665e9.11.2025.05.08.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:31:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 May 2025 15:31:07 +0200
Message-Id: <D9QTEAUN0RNE.11G3ZW4IBGL5M@ventanamicro.com>
Subject: Re: [PATCH 1/5] RISC-V: KVM: Lazy enable hstateen IMSIC & ISEL bit
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <20250505-kvm_lazy_enable_stateen-v1-1-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-1-3bfc4008373c@rivosinc.com>

2025-05-05T14:39:26-07:00, Atish Patra <atishp@rivosinc.com>:
> Currently, we enable the smstateen bit at vcpu configure time by
> only checking the presence of required ISA extensions.
>
> These bits are not required to be enabled if the guest never uses
> the corresponding architectural state. Enable the smstaeen bits
> at runtime lazily upon first access.

What is the advantage of enabling them lazily?

To make the trap useful, we would have to lazily perform initialization
of the AIA.  I think it would require notable changes to AIA, though...

Thanks.
