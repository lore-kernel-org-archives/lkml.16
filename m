Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F0123C9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745877287; cv=none; b=kxzr79LNJt1ujJytEza5AOT4ykXGtvAdZHuZktgBmZ9QINJhDuYbOyW059vQf/GWyLhi0uG9Sk/nf3gbqQUOF9ykYrcvjJYo0X2/UsGnOB88DYQQilfdqHoFfCQGTcaqKhFPaMXgTdIwRavOaIuQ9vHq0Chyta5beRfxWKymoFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745877287; c=relaxed/simple;
	bh=I0D+24NhqEjNNCwy2eb6utOoFDrJBSYh2LEtPIvzec0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUuE0sNWdv7XB52FKt9/2vV2HHEZbvtRrO7dTH60FLpyj6lDiAxvxo7wmwehJk6noeTsKafbOB42LTE3p8h8jQgMOiBRIHUYgrrxQodIjIhekiq6uJRh9CN1opNcqbhazs4vZ1fbGrKS5trAPEtBIS8w3fWQwQ2+lqJoq6dclQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wPYaM4Mr; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wPYaM4Mr"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c277331eso6027504b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745877283; x=1746482083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7PrFUrYVebeKySS/v6ZqS0K5DEgZAx8oNo9TFzTB1i0=;
        b=wPYaM4MrPBE5N4Oq1PtW+pcU3xuoJGiUUcUTQdc1/XtcS9Dr4ak2HVOWdmHE3gH640
         FqdJyRdwC+GyXybjHUE7/wJQHfIu00MxoFSBP5zlfVGFJnVcf9B+uFmPND2nOtyDJOHF
         OIeEDs82aCEOBhX92hV/RsmxvlODyHQHmcOdSmh1InF5J18l7lfI7oNf0cqN21ULbdHD
         QzVoXdWpJ2ai5o8w4yRD2x7x445tEnHaC0dDl2Mlmi5JI3tOayUyI7RAwmbgHiXI7QfE
         1P+swdi2pEwYQGEp4qHj20EsuW4cbsjVow8367OAWNNc3iFfW/xJqcW70c52JJ63b7Vp
         BeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745877283; x=1746482083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PrFUrYVebeKySS/v6ZqS0K5DEgZAx8oNo9TFzTB1i0=;
        b=GEehHyS4GhPR8ll1FnXbWusM47kuTxH9i/Evn5VuRpeUH4nzGqa23bL8unHz/cbicF
         slz5o+SxMl20toUAnSd+oTBWXcTWti3ZL9HwJtbffZ6DpyEUKsbQSDgA+BaOSV0qeBJf
         W3wVZmAf4qj3FiAyK6In4b1nMofnHy90iLNGJOHgiTr/1nDzuuaErz/mg4KTXDgQWZWJ
         eE0b7acZxQjt+KzDKOt4gvrccj7hi9W46ucyd9Gqj93YFvf60z2BYs67Bg0F3D8cy68T
         DIly6lwewquqT3Yu0B+40HvzZxwXtioF++DGAVZUhBPWVPuMnGfdpfAMmg+aFtmlMOxz
         Kxnw==
X-Forwarded-Encrypted: i=1; AJvYcCWy8fnz/WPIjeOoJh69aKPG+ctkCAWawYk/QHmgTxk3wayG6i0BxJdzB9cQDO0feFZQDEkC0EB/nuP6p/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCV1RKbPQMqiHHAGTCoRvTbGKfQ7qJMsovFEKKABpjytrKG4H
	m3QegySnYkpA9eDL03B2VY9QMQsTemeuIMP/l7Z7tA4KHVMB7HAVyBzrp68J0Fo=
X-Gm-Gg: ASbGnctiQVn7cFBTY/1xN8MqPKKQIfpao9VbkRNOr4gHKxomBgvqb6y93ut9EUFxFnu
	P5zDBndJrkTN46nYj12TtIqKdhULnySi0//YTDYl+McrKaZFD57K2BPUoqlKnO6p9UU1VByP5eA
	Dcj/4U3ecc1uCAauc+V24qsDg6rWJPZ9qjmnbrdUTbI4HBmLJIyUNFZ4Np6h2qGQR2WEla5RQtM
	m4yrxb+nWoQggDh7Cnda73Ef/OWZKZg0XbWuF+HFwAk4Lju9kNXFVi5IXOBttu2MuZfMkHo+7lY
	tD9JDBxCBSyFeuUhRe0hhzyVjihsco44pMOS
X-Google-Smtp-Source: AGHT+IGWT3F9rzHKTZtgpify0Emfhlu0qposGjyGuLHhHiqFNXMP110/wH5dDuLcBSTkm/pZT1KRBQ==
X-Received: by 2002:a05:6a20:9f44:b0:1fe:61a4:7210 with SMTP id adf61e73a8af0-2094f0854e6mr1162679637.2.1745877283395;
        Mon, 28 Apr 2025 14:54:43 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:5842:f05a:498b:82d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded547sm7735083a12.69.2025.04.28.14.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:54:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:54:40 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Message-ID: <aA_5IGGvXqB7v_EA@ghost>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
 <87frj613kz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frj613kz.ffs@tglx>

On Fri, Mar 21, 2025 at 10:22:36PM +0100, Thomas Gleixner wrote:
> On Thu, Mar 20 2025 at 10:29, Charlie Jenkins wrote:
> > Similar to commit 221a164035fd ("entry: Move
> > syscall_enter_from_user_mode() to header file"), move
> > syscall_exit_to_user_mode() to the header file as well.
> >
> > Testing was done with the byte-unixbench [1] syscall benchmark (which
> > calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
> > x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
> > s390 a 11.1328% improvement.
> >
> > The Intel bot also reported "kernel test robot noticed a 1.9%
> > improvement of stress-ng.seek.ops_per_sec" [2]
> >
> > Since this is on QEMU, I know these numbers are not perfect, but they
> > show a trend of general improvement across all architectures that use
> > the generic entry code.
> 
> This looks sane now. I've bookmarked it as post-merge window material.

Has this been applied somewhere?

- Charlie

> 
> Thanks,
> 
>         tglx
