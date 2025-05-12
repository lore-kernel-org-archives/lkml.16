Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1271D139D
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747020685; cv=none; b=RodGQjVGmrwsUyossCEEln9cYlwKqt74Y3lotb2r3G4xsDKO5tefxEnONCby3A0CZ8f3NPO2d3QYBKfppgtRVTAL3viQnO2eAdqFnhulq2KyTbjviCGMEvy6sEmTDwD4qArXyBC6BgyoZqAV14TbNrm2BOPLxa+eLIfvN9LRDfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747020685; c=relaxed/simple;
	bh=iDgPC4nPPUwJq7NIVaVrJzY5mFEoRMmTduNpc+9o8M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLBA+8dGmt1vmarlRxR1QE4uR4JnShudyDeoe9nPruCssBZYHNBxYOg1kkg6nHnKxPoLV/1ziBhmHzOKfkp6pp7wyD4c9HNZX3pkOxA35qisNtazGXsKYEty/C0lHNfkB+oUOOVHEQUXImGNisib11APwJrOGZ7wYSELsKvrFxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNoQlajw; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNoQlajw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22fb6eda241so39813025ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 20:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747020683; x=1747625483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/WssY9yXV1+tK4NJiyCXiRRN23AcQI1nbeYnFAYlis=;
        b=PNoQlajwKPXpmiRO3znWwoTCpJ+SkSINwZ3zCsOMwa2vIMLev/erqdEQJ9vbk2r+GL
         8IyLbjou8VtADihYYOSwAzZNsy/DToCZG35bR4dL7AxY4ciLjuLKsYSjAJpztpp1gfnm
         J2YyXxEmPqEQY2Wi9bt645+Oy8zsznQhUWA0hFLGmtBqK/UVZCSniXg1WTKTY0JGcpRk
         Qzic81ddgFluZWVV1ksrEwpTHEvunDDXtEfKbmKY8/u6PZboUcnOccf/Fp75TcIQ1nAV
         wOFAV/m4PmXTotnRKwmYZe+/cPJPgUYQ2oaZmnX42g5xr6+R70QCCVF58OiO+ofbhYZ0
         v4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747020683; x=1747625483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/WssY9yXV1+tK4NJiyCXiRRN23AcQI1nbeYnFAYlis=;
        b=lQSQLp+sV9srs/q47WgXZf2cX2fiE1DtckdWlwMZ5u7qgqoEerJMEiFydV0G0sieo4
         r7IpeFpFJuwJAtHmrHTX1bfrA3EUFnCkES0/QKjGxhw957PXF1/S/EOFseV/fJwM7zYJ
         x34EkoR1sWwxlvGZBB5/pylbhEErHqBU7DLB/19ApVmf2YjZKr2+12I3C8CD97XoC9f3
         wV5c3VZSTE4YZqU5mKeELRr6UGuU4Sk0AfSt1uOCskUyZzAh/NSoRJxnmlknS3lFkF5o
         3nUZZZ0849af1FltByBUxTy4o01yY9cf+bYS25kD8G5BLfQ+XG5QQx8CYCM2PTy7ywF4
         q85g==
X-Forwarded-Encrypted: i=1; AJvYcCUfuCPWQ9IMKTZX496WdyW52yZhUN7azW6xZI8DF0Rf+K/nnN9Dm64E9WiE97P+JM+kvvWbT3qZPHRVnZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuqKK6klsQypFQNAZqR95b8U2Ewqyif2G6niI+4Eo635HX+QsI
	BGXOarhFkK9rqEX1IJkYt279WlZYROoMjVxIy8BCyeYkcL384USj
X-Gm-Gg: ASbGnctK/XI7oA7898TlXrYSBTHLSd165bBqvt4QRExZ7zfRd8Y/NMBQLjWviRRXXm9
	BomC7g7pxO63QoHwtpr3a9EDZwBkITwyTjOlAQwHvbG8EvpP+QSixy2iSy6eUDZTv1E3UP29HL/
	JJ7bphZEmrM3ESEK8OhiMJ8VNyG8rm41Te19H4JL1UVQHKhintfslzSZhR4xvbtAHIrdzgkE7hn
	3qfV04Jbfq5npnLYjrjAppJhdUq3YcOrSSXSm7HrxZjZzJbvE2Kbd79bomMKZLfK6jcshgO3FMx
	RFAzKbx5ddyaeUftEqjS5bkkNC7Laklmo7uj3omWbDQC
X-Google-Smtp-Source: AGHT+IHV0sT/Lv6DN9WosHj9i5x1s5Dg+ynbITyJd4SjAQ9qVpKEXA3d0dxinHtz/Sypy1WncJ9paA==
X-Received: by 2002:a17:902:da8e:b0:224:13a4:d61e with SMTP id d9443c01a7336-22fc91d24abmr152464005ad.51.1747020683160;
        Sun, 11 May 2025 20:31:23 -0700 (PDT)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc773f225sm51575375ad.89.2025.05.11.20.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 20:31:22 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 2/2] riscv: Introduce support for hardware break/watchpoints
Date: Mon, 12 May 2025 11:31:17 +0800
Message-ID: <20250512033118.1071577-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222125059.13331-3-hchauhan@ventanamicro.com>
References: <20240222125059.13331-3-hchauhan@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Himanshu and Charlie,

> +static int arch_smp_setup_sbi_shmem(unsigned int cpu)
> +{
> +	struct sbi_dbtr_shmem_entry *dbtr_shmem;
> +	unsigned long shmem_pa;
> +	struct sbiret ret;
> +	int rc;
> +
> +	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
> +	if (!dbtr_shmem) {
> +		pr_err("Invalid per-cpu shared memory for debug triggers\n");
> +		return -ENODEV;
> +	}
> +
> +	shmem_pa = __pa(dbtr_shmem);
> +
> +	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> +			(!MEM_LO(shmem_pa) ? 0xFFFFFFFFUL : MEM_LO(shmem_pa)),
> +			(!MEM_HI(shmem_pa) ? 0xFFFFFFFFUL : MEM_HI(shmem_pa)),
> +			 0, 0, 0, 0);
> +
> +	if (ret.error) {
> +		switch(ret.error) {
> +		case SBI_ERR_DENIED:
> +			pr_warn("%s: Access denied for shared memory at %lx\n",
> +				__func__, shmem_pa);
> +			rc = -EPERM;
> +			break;
> +
> +		case SBI_ERR_INVALID_PARAM:
> +		case SBI_ERR_INVALID_ADDRESS:
> +			pr_warn("%s: Invalid address parameter (%lu)\n",
> +				__func__, ret.error);
> +			rc = -EINVAL;
> +			break;
> +
> +		case SBI_ERR_ALREADY_AVAILABLE:
> +			pr_warn("%s: Shared memory is already set\n",
> +				__func__);
> +			rc = -EADDRINUSE;
> +			break;
> +
> +		case SBI_ERR_FAILURE:
> +			pr_err("%s: Internal sdtrig state error\n",
> +			       __func__);
> +			rc = -ENXIO;
> +			break;
> +
> +		default:
> +			pr_warn("%s: Unknown error %lu\n", __func__, ret.error);
> +			rc = -ENXIO;
> +			break;
> +		}
> +	}
> +
> +	pr_warn("CPU %d: HW Breakpoint shared memory registered.\n", cpu);

This is printed unconditionally, even if there is an error above.

> +
> +	return rc;

If ret.error is 0, rc is uninitialized here, which may explain the error
that Charlie came across.

Regards,

-- Qingfang
