Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43A19006F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738278046; cv=none; b=C3bGlIiePl5dEU794exoccPNrzOjUHTHBCK+Ad3PAL1MAWv6M9Du2XwlXAx9YFjbB+cL5ueq9hWOgVDAF3hkiJogmolQktgA3FtS6Lk80QKLYkh072BOgANrS7jntogHXQrX4UYVqtESDH/MwmLCGC3OWOePlGW+Q2c6Z8xpqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738278046; c=relaxed/simple;
	bh=tz9CniYMQo+zBaZNz6OnSEQKioJsOjwS1FMN+Zkbufw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wgwh44KhG/Cmq/d1RH10YBfeR9fkqaRO81quo0yyfHdJ1QKca3R7/frtuU1EhEiqEbbV1CtYNNZ8DZ2020TyvSTtxLHAPYCBi6Z78fGDxsviUHjgCybJec3hTLQsG533tP5lGTuqz0ro4PJ785e2hP3yTq7JDGKIhgTlw0puNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=miK7RG/a; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="miK7RG/a"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f42992f608so1922997a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738278044; x=1738882844; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GbdFnQsA2+ijVtkjeNBQrudx+f60ouLemRPuBfJepVA=;
        b=miK7RG/aCcd2eFcUysghJ9EWzPrgZROmSXDSEmECKwXOEbXwYM/JnM6f5zZ+pqkwQf
         UZ87yeQSNqd7hhmHPmt0eOevvIpl6v6dug2uT1VU64RgWRJ7i4QXoqXn04pzJfZ5oHhm
         O+4NFxOZI5vHgOiIuggNlD74FReAxZlsWwJzGAE76h3PQLGvBfymS4dW0DDLWr41RUMD
         nrIPbKrJC15bbQgQPUUXWthbtjgVd0Pfl5HKmtUSu1C9Hj+6vbcgYXMYW+0B9ZPjiazg
         lUuJFhx7leMa9MwmwFOJWZvu4tplwt1RND26J6paDFL/KA5Um+6fayischm4Z6Ie7qWt
         S9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738278044; x=1738882844;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbdFnQsA2+ijVtkjeNBQrudx+f60ouLemRPuBfJepVA=;
        b=Fz22oc9R5idDYPNnl0weKrvfDC7YvBBJ8qD/Vx2uIHxGDxHgXbJ/GcDiqz09rzLdjD
         MWIEnxQmhWGemzXNvzOPspDZ7lVo1wCtl4QRmRJDOBmGhTOLWurmvqeODPEYVVXq4kOT
         5ul/FkEpUZlowWobDUZDRdu2FlZfVtHrB1ERmfrR3JJ3cnyJCLPRTyBD5FA4voD2M1ot
         OOJdEP0lqgU9lGDD4Fp7RTSrIQ5JQrX5IWI8thNqKZrs1f8ROcic9Kd7sY9hsb72RJut
         HJt+8sytTvbP+sNf1elL8far8021H2XyO9fuf6OyzoDqYGtUIOAVU9LnATKvER6KHWuL
         +mYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU0OQfOsX1OGHNValp+desftDraHcWUYsnyzJ2WogG0130jx8PSwebs+znsXxAzoIAsmAirHvrAkZhZqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpQPJJ5mq5Pr/yzC3Wrk/ZgzXlVHA3t6gOqQdbM/EfHifZzqc9
	xPGLHvtXF3Jvyfg6WL9WcKeWDCKAAZQ3y+4iKj/J/n0pkkc3z2pChih6+SphOiM=
X-Gm-Gg: ASbGncuE0FsGvlANfhncwVXOy+CjPJB9+od+83kmbzPCjU92v3qmBW+W4cl1NRxP8AP
	l5B2PC4zAWvYLm51vPqORLgoEQjwTL89e/gmEUojn4eknkS5XF6y2I1bgMb7Dsrl8sVt2QoWAlT
	CqzdtLH9CYJ0uKx+YvAEWqR/46kwkOQBLp9A1Aw2xwvLHBE8vb8n6CL8eXR6tlAGVMayyzwANYS
	LScwqbRvVzDOqmxtDbn/rM/0/9v8NwC7ZrfijF5Mhwa1gXrD55w2pdzj5zILAOL8s4NBhQjjc+x
	f9VsZ3sr3A==
X-Google-Smtp-Source: AGHT+IFLWgsLUrLOxl40W4xTTVvUYH5wdpkg8jyUgRi9f0Lpi5/Hc0iLnKkZO5RIOcZhgJ+cqwRAkg==
X-Received: by 2002:a05:6a00:e14:b0:725:460e:6bc0 with SMTP id d2e1a72fcca58-72fd09700f2mr13043330b3a.0.1738278044015;
        Thu, 30 Jan 2025 15:00:44 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:cd5c:b7b4:1f3d:62bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf9asm1999761b3a.27.2025.01.30.15.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 15:00:43 -0800 (PST)
Date: Thu, 30 Jan 2025 15:00:41 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <Z5wEmX2ykQJmvnTV@ghost>
References: <20250129131703.733098-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129131703.733098-1-arikalo@gmail.com>

On Wed, Jan 29, 2025 at 02:17:03PM +0100, Aleksandar Rikalo wrote:
> From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> 
> The riscv MIPS P8700 uses a different opcode for PAUSE.
> It is a ‘hint’ encoding of the SLLI instruction, with rd=0, rs1=0 and
> imm=5. It will behave as a NOP instruction if no additional behavior
> beyond that of SLLI is implemented.
> 
> Add ERRATA_MIPS and ERRATA_MIPS_P8700_PAUSE_OPCODE configs.
> Handle errata for MIPS CPUs.
> 
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Signed-off-by: Raj Vishwanathan4 <rvishwanathan@mips.com>

Please copy people who commented on previous versions of patches in the
new versions!

- Charlie

