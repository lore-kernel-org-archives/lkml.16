Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538FA2C15B8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749812116; cv=none; b=sfDX1SVf4gw14DL2qea1fT0k4zAFAq0njS4vpn75cHFV3ip/b+E72pN/qh/OtveTR8Fpg5qwqU11aQMcRxU0QjOXXbCKgkrD5ko5snwbaZ+CG1cKdT7kWIY9rIojHgAeHgN4RP/Qk/ewMr30QCJ3SD7ilFa2+QK5SCrUK0R+iyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749812116; c=relaxed/simple;
	bh=FQiYKnTCnJnB9WxLyBBMzZDQri5gRgtImAvHgithX9I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D5CaiaeZhJlfrJJDH+AC1yc00Um/8N+jrIBX5SGvPR9HMZID4kbv8EBcthuxrxUTilKYZXYGSngzi42QQMJQzyWozVXdLctuWIWKr0NOKnL8Ph5OOi1+JynoAOun0xaFL5d9g0FDD+JUCntYGwvBe6Yy7cBCc/Pv88iGXFRjsnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjwwsZJK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjwwsZJK"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54690d369so2012405f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749812113; x=1750416913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9ln5HGGKIXvxuo/p2ea1FkQb90YA+7FEEhjYigED1Q=;
        b=JjwwsZJKblu9H20thk6hkTsiudVWypOyz9iRSquUsOPHlbf/oCTtV7RdI6JlKgsx1e
         L47KKAyuZSOdbIogwycaxkcgSEspDyLPnOnvdQ1300O8Rj+6p+GWxYvyRT4uTSs50y/7
         0KoEyJbojPhiXgyjHM8bhfw/feJoj0lCUollOi5DGpmdPY9QwNj3SezcxwzgPOpOH/uI
         8prjIzkyR0veAxJ52TC6S8QGANLOGcyF/N2iLdCquq+X2acQCgvJlUqPUcb+0qgTb58O
         zmaVVNeIPw7N5geLd8RgSRprGqIFUtrTE0inGPp2O1eSOdu/l1f82xHWb8a1Yjct0/Gh
         MxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749812113; x=1750416913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9ln5HGGKIXvxuo/p2ea1FkQb90YA+7FEEhjYigED1Q=;
        b=L+JEdVMhCEEJbQuH+4h0hC5XfgukIdl/F84N85OhOp8BZMwelntkM7KeLg3QENc1Sr
         W5M8DgPrZoct0tmdGRei2CuseF+wyj+oM1pkyxsFPNUn8cCol/QymZ5n4Z/bOmq/gSiI
         L7rc3xEOHtHpRR2XwaORrTfdHkoz3Q7xzT33VZzp/ripDrt2OZ/gvPCA8Tqucu2pjaex
         Pne1krTbKcmPLlfi6pYwe3wBTdPpd7oMBQ005t0kOX4StoMaJ6sE3un4/mwfCllwidH9
         m5F++q81XJce882RyLli+D3mzziivKX6usXtMfPhg5kdOYaYq3Nr1yuUD5Mk4FVYqRf3
         YZmA==
X-Forwarded-Encrypted: i=1; AJvYcCUuWTQkuhUf1KJQ5mWR4poDqa397EMtBD+/YnGiWx/VwS/4wNq0pnAO27XomaKTEihxHl/dpPNZyxI9U+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2v3288+UZ77n7pV5MBB71ssKED5UjolZNdUakkroB8a/8QDa3
	BKylBXjoMoQtwJCEUNE3QeS2ffTvzEQ/noE/fSnbN9Q+aIPfLOXlQCy/
X-Gm-Gg: ASbGncvvi7mYYjVrkI6zgI5n+Z/4gQqTFVytzqnqhG1UHVp/y1W7WtoFrfqf5xqhtdq
	WT3XAWJVAngUhvQIAKGNZH8QL72HdZxRAR7UFzVMD7iapIDQpWYnGT9K8CYiXu4sLbiVztOKa5p
	YoCDg34gANaCas1xFMta97hruCuY7o+RqangWHK7D5hI7hoR9/va2xc4pq5LfJPT8t0PtUj2ud3
	CtedzJ6UoL7Uo53gpNkfKJGNG42QQkFMcJdWkkx8gtapPxzsDNPu0YmNvRr/g44cHHLz5rKXtUA
	yqeboEXzpeW4O5rF3qJnJt4GUs//xdZrIGMXW2pLub3NG+E0t26M1x74nzpLrlL/8i9ESDEMv3o
	WaBXfemlU2/pPut1/H49dh9pS
X-Google-Smtp-Source: AGHT+IFfslJ2aEALYhnP/9BaW3mXjNd6nsmmUKqVe9C01aF5V4kiO/RmoLsZeW15nbsHhQac+oQ4vg==
X-Received: by 2002:a05:6000:258a:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3a568755d12mr2100819f8f.32.1749812113385;
        Fri, 13 Jun 2025 03:55:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm2053143f8f.16.2025.06.13.03.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:55:13 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:54:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Atish
 Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/2] RISC-V: make use of variadic sbi_ecall
Message-ID: <20250613115459.6293f929@pumpkin>
In-Reply-To: <20250612145754.2126147-4-rkrcmar@ventanamicro.com>
References: <20250612145754.2126147-2-rkrcmar@ventanamicro.com>
	<20250612145754.2126147-4-rkrcmar@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Jun 2025 16:57:55 +0200
Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@ventanamicro.com> wrote:

> The new sbi_ecall doesn't have to list all 8 arguments anymore, so only
> pass the actual numbers of arguments for each SBI function.
>=20
> Trailing 0 is sometimes intentional.
...
> @@ -630,10 +630,10 @@ static int pmu_sbi_snapshot_setup(struct riscv_pmu =
*pmu, int cpu)
>  	if (IS_ENABLED(CONFIG_32BIT))
>  		ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
>  				cpu_hw_evt->snapshot_addr_phys,
> -				(u64)(cpu_hw_evt->snapshot_addr_phys) >> 32, 0, 0, 0, 0);
> +				(u64)(cpu_hw_evt->snapshot_addr_phys) >> 32);

That doesn't look right (and other similar ones).
The values are still 64bit - so get passed as two 32bit values (in some way)
so that varargs code will get the wrong values.

I guess the previous change wasn't tested on 32bit?

	David
