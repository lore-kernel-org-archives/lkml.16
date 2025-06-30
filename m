Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD80215F72
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273332; cv=none; b=SS0PSEIUuG1n3DbsVRVXF6ughScOdIT5C+sxp+fJ+48ig9u25wrEHHFZ3qQLOUUHGY9nu4or1iNjeksvnWfIMyUVRQbW3tHzK+YblAwYh/lTquEwsJuFvdDdUQmKuBYVq7pLrZxslKj1DQqL77Gq0vpJxj2oA080TyYAQgF/VfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273332; c=relaxed/simple;
	bh=9LX9av9yvxOClo7gCs52aPEZGCecg5/87QicfzfhCEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4qK5kSUUBxLglRPPRQG6vuKWqZC6nR5G2UxV04P/2RC72p+BdlKAElRhhfC4MeDvOiSNM9Lvex9ugPkCxsprQHOFOepaewgv5rpd66GqHcWj6XyYuy+AS/KYwsWCTpgxaB6cck9KDRz4tR/ty3y22f+P8lfhw58JxN2BqJgoVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OP/02MND; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OP/02MND"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a582e09144so1349179f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751273329; x=1751878129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0MFmQYTIhwQaPU7YK/VjsEzsIiL6rLtVHCSHLdz344=;
        b=OP/02MND348iZGO/JSYbUVZDr7EKMIVoSp4PuVBXyDMeEjCkMzOBm1NzsJUvjzRRgg
         7/QcuTJ2UGfZuTmwxzkvMA/PreLR5kBCyOpPD4gum4Tv+IH4ddUMQ7C4jhNf/6FRhfBV
         KZN0VEkdsirC51kh74EvzVMONLyAXCjf/g6LlmHcafBG+LgsGGNUgnGUUoTW6JFr35l0
         VNiDvsvdumNC2OJCpYd892Mx1XFu3BKiBtK3vGjh4Z7juc5UA/bSMz0Y+fn8FpHLQgCB
         MvOlQ2xwSAC5EVZLYW8wbPOSUKxRk7qdYLBhlYB2WGXh0tFMdGP+vmPm/oT8DjXlc+DM
         Mrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273329; x=1751878129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0MFmQYTIhwQaPU7YK/VjsEzsIiL6rLtVHCSHLdz344=;
        b=bGMqQcvhYJu8sQ7aj23Jv7Yk3N0t9TuB9stDNnTH5+avuNA7oTwcS/5ICsb2YYIUQ9
         Tu2a3+W3vJSQG2bwDkTI8KxbCAGffclUlP20lbi/bJe5ftQfwFvxpKj/eDGxKJTgC+Fq
         5cSdYFv4tVaGnURbVWtc5p+kXJGKpoy/9UyQfJnk5ETrMlsj+T/q/UakzEugHP1I2HbF
         JoQSqgLWYwlMjhuGWH0mtvPMPgRjJAs7gEHRE2eRyLgkiPtskuuk6oxu2FvYN5a9F8ci
         gQyWxKDeaPzZiewCrw0CpgYQ8hcpBXfy5ec99RT5KIStXJFfn86gKdHr98GRHXGnHFr5
         7TpQ==
X-Gm-Message-State: AOJu0YzMcNnAGwbs2c0ljcyIOIM56jxunmEL42U0POJEhbTxAciLIsP3
	hfXx6M6RrN7K0PLub+klo2wdla/5SW/RyvGhMYLoo6xjCUJ2eoXriJlGT+heso1/c5R6a8CkSH6
	rFUdVKfQ=
X-Gm-Gg: ASbGnctnrivQFsIe/rnrEIdD3HuqWLHQCpKU2bAWA7cN0sN64fYyG4PFzB0UQ2fGZyM
	4beJQ9M+LQsCrw3fmK7ZsV3aE1dwJyfV15Qv7aK8xk348wu8cEFo7oVfhZ04+TRaRfzXZwa7G7v
	3b7jqarDBZek1egRALNELT2sZaAp+kZh8bE3/v2TAYnUpu0DT/bpz0CGZOr7tBpWQJOoMVdfmvl
	VsN+ripRbymAXQeR5rm2ipMjUuAo+ccHSy0iMmq2ZPsSSBi9LGb8FIyFKgDIzKYRwb87NctOCjl
	BELOR5RRtdquWbtNlK4uxxteoHVXVythKKNBDWroiFJsDlR+Sg==
X-Google-Smtp-Source: AGHT+IFkP2IxHQSzwTBSX2V8J3HFEeGEU2UchiOHVWbWGfVFsEoSfKrpjADgwPpJXxhXznoj1gfTMA==
X-Received: by 2002:a05:6000:4b0d:b0:3a4:f435:5801 with SMTP id ffacd0b85a97d-3a8fdb2a190mr10032131f8f.17.1751273329044;
        Mon, 30 Jun 2025 01:48:49 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7386sm9698288f8f.20.2025.06.30.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:48:48 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:48:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 3/3] iommu/riscv: Add ACPI support
Message-ID: <20250630-43f937dcdcd84599d28169cd@orel>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
 <20250630034803.1611262-4-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630034803.1611262-4-sunilvl@ventanamicro.com>

On Mon, Jun 30, 2025 at 09:18:03AM +0530, Sunil V L wrote:
> RISC-V IO Mapping Table (RIMT) provides the information about the IOMMU
> to the OS in ACPI. Add support for ACPI in RISC-V IOMMU drivers by using
> RIMT data.
> 
> The changes at high level are,
> 
> a) Register the IOMMU with RIMT data structures.
> b) Enable probing of platform IOMMU in ACPI way using the ACPIID defined
>    for the RISC-V IOMMU in the BRS spec [1]. Configure the MSI domain if
>    the platform IOMMU uses MSIs.
> 
> [1] - https://github.com/riscv-non-isa/riscv-brs/blob/main/acpi-id.adoc
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/iommu/riscv/iommu-platform.c | 17 ++++++++++++++++-
>  drivers/iommu/riscv/iommu.c          | 10 ++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
