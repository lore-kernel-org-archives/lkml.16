Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D0E19B5B1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772752; cv=none; b=YaS1dE7S4Abqt1ZIAewwVuQRovdbtrnA0feDQo3t6hkNOx/l+GLVNzWGeBqejAC1xugD1/rvn+QiSdlP/nmJnf4W1kAdftjUKVKUec4KZg9uPF0gLC0YlNW9FumfrjfF0Y5NnOh1ieKIkE3hkv0ArP6aMb3Bb2guPpdHijbXC2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772752; c=relaxed/simple;
	bh=Hf8YfHPn2WOKnrcZ1v8ZI5P+OLb2LEzI6O/h3SFv1Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQ+g3FwJYUPCOqdmgqWOx5bDqyLe9ybQQioAKNJWY6RkLutLcVw5Uj8+BFBDV92S8nSplW9idCQN2JvAtCPQBFjggmWcsaBZaqLXE6eGtEeMkYYc3nrofh/NvotTglyFvMtvwtMyY+t62UOeGJsKAWz/D5d0li/bMbvpHs7Hm4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pVI1hawV; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pVI1hawV"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-73a5c41a71aso275784a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750772750; x=1751377550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lT4n++xpjyEFl1i+V6mrdGeWr7oE0xpHnDaKlN0JQpc=;
        b=pVI1hawVYprnYFYP5lIeunKuu7FyjUcd2GG43VFGxgJbLZzEOR7caPwY24h1dGV5P6
         Z230SEmIx5NsNSpaoJst9swPo5suSRCgcO8LZN5gW10QjbKkGgXX8Fi6p1NSGZn5sPSr
         0D4QKrLvk9yDeno6cq2lXA31vFUNR+ymSL2gfc5ZcdDFg7NUpzYuNa7jNRQpYydergWN
         Cnfqs9b+rlvGpIa/dJuVBdRVXtLbKUbPvpIphLKF3WsyoGZEOvPkBaDreBGv07XQ9BZa
         A0sgowHqHPa4T+Dsfzd38RVpOk1iPTGaaYAn+ZRu3ste4OFXxvEHVCgBkioa+vgDjqI0
         yueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772750; x=1751377550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT4n++xpjyEFl1i+V6mrdGeWr7oE0xpHnDaKlN0JQpc=;
        b=O7xjzmk/a/mFbKTzehTFe9HmVusB4HRJhwmbhymDny8fm4j8tObF6sEJYpL22iVHwP
         ALhSzg8ruJy4o9XSl70lPVhv9E2BngRnBO6Ijaw21J0mJJ4E4EKsqeeL+VPFFvq3bNQq
         h1sQPJgTZbRKz61yMdnbrqa48cmTxGShVcSO4FqN3ncPsGqjMjaE9gQ0+YzgVy+UeYBw
         RpidRK5rpQox/zy8uLEDqct4CopojDLExUvhOoG/8AacpO11SWVU3rwGQWZj0ZfNKeej
         x0mZ2uXVws39y6uHUQeb8NmPindqQj7KmVow31MDlcIJWU6eolPFDHwqcJ/BVjDNy+YJ
         sm+g==
X-Forwarded-Encrypted: i=1; AJvYcCUNFkzxet6UhhhV3rBKpxelUhC6w468grfItpmr6HS2xGm6+nkjQuePUkTLFQrCGBufteFEoIfVt65aKlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFq9KuTT90ncJfAQaTS2bLXo/3AZXsmUAh/hemOVpCwzzkKSZS
	QyMoljzMnnM/77mxyLiaqBm4fqayJ8XwWxnwEdSsCZggiLetFb7aVeTMngA75MkjeFdj3UJku2O
	OuNyg
X-Gm-Gg: ASbGncsSdpvNMrtO3dV0V5Iw8fwCwLnmvQdgh4+AWy9wocWJt1t4QLUO90rXqaYnNHm
	M4qWyFTJqI52I0ZeIWcSySyxWvllIJ3X/JOv5xz52RMGdcQ+qbspsRy+zRy12JL+LKkw44+tfxM
	XEddoY9sKz4ZQ8B+yS9CZDRDiNn+JcrRVElM08P0T//iS440t6zWMuNTbfscq0tyw0K5qBygs/w
	hOaFRRpllv7i1KSZCjdIJiRIbJW7X7+nGeFCI3IyCvVU7T23Hx06dCf3XLnRDCGbAYmGaD45T6X
	5Fv7l4+Du1qG7FbYDNEY9c7KVC7B3uWWdJwd+5WuKmoy37T4zn/vFlvg
X-Google-Smtp-Source: AGHT+IHye5NBlD5obt2KHWoCZCbO/Kdn5WPzM6Oou1wfcuG9MpPN0E3391EUVBxmyqZpv7fNFU2AyQ==
X-Received: by 2002:a05:6830:2814:b0:72b:9316:d596 with SMTP id 46e09a7af769-73a91c0fa67mr12338717a34.3.1750772749751;
        Tue, 24 Jun 2025 06:45:49 -0700 (PDT)
Received: from ved-XPS-8940 ([12.0.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90b15261sm1843265a34.18.2025.06.24.06.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:45:44 -0700 (PDT)
Date: Tue, 24 Jun 2025 08:45:41 -0500
From: Ved Shanbhogue <ved@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: zhangchunyan@iscas.ac.cn, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
	akpm@linux-foundation.org, linux-riscv@lists.infradead.org,
	debug@rivosinc.com, linux-kernel@vger.kernel.org,
	zhang.lyra@gmail.com
Subject: Re: [PATCH V8 0/3] riscv: mm: Add soft-dirty and uffd-wp support
Message-ID: <aFqsBW1CT6qeG9Wv@ved-XPS-8940>
References: <20250619065232.1786470-1-zhangchunyan@iscas.ac.cn>
 <mhng-536B594B-996C-4A15-8744-C7A27B45720E@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <mhng-536B594B-996C-4A15-8744-C7A27B45720E@palmerdabbelt-mac>

Palmer wrote:
>>[1] https://github.com/riscv/Svrsw60t59b.git
>
>This 404s (with or without the ".git" suffix).  I remember seeing the 
>spec at some point, but I can't find it anywhwere else.

The ISA specification is available here:
https://github.com/riscv/riscv-isa-manual/pull/1907

The corresponding IOMMU extension that enumerates support
for Svrsw60t59b is tracked here:
https://github.com/riscv-non-isa/riscv-iommu/pull/543

regards
ved
