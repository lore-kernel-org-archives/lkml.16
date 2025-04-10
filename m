Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5579283685
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744284590; cv=none; b=SnhV+vXsKbbi1I9hXMgt9T7khJrTs3rgZY+Wejh6zndc0Ha54K40t6qY+WaVouKpbAmU9FalEdGizw/L+mLJ4f0mtgDNVcJYhypfZg+QcRaYuG+mKxxszfujYDmWEjsZEOXZuhxZNB3gV5eJT0iLujee9enHh4xjPPaY3i7/n5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744284590; c=relaxed/simple;
	bh=7EF92uy0HqAr0vHv++Xpljd9wbqIP32aaDhXDf2csFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym8u1DJtGwhoi0i+ovEST3aifhqjYbnbKZK4R2V3XOWktg4UCKFjTKF2eNB7Jh3QpVrUoo4U/x2ErvQe9iFtASVqTgYfakomEuLvax2sy9GIUTbp1Kr94PqDZTz0tZkA3VDslEx3gW2Ao28afs/a84yoLJ7RtaI8OS9LtMkTwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CJJl3MsG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CJJl3MsG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3995ff6b066so326490f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744284586; x=1744889386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inreEjGkP2FB86SvKqikRoCXcnYDIYzGtWDBTQYF/sA=;
        b=CJJl3MsGLDMR6MEGfXjAewU7fLufwgbRvt9V3FK52IxvnTq3RD6OKYcfcT02+khAbA
         8RPf8STtBAYkhASw41OKs/2zC8/0rmjLahSqYGX+eZZUg711+DqyuOuIzqrHRVsASkxc
         7FUSqgBktoaUSFFCj285QZFah1sgSdPx8hrSJWhY8ZOiyRlonpYCRDTSbiuI2XodgEYu
         palOUjUQ9Ug1l7YTcF7nf4hNVrg/cOZemHqJ9G8u8b51u9c2YOMkczDCgr7ur+gq+E7U
         hxIPln6blfTqm0sSZU50mZwYWdBQUj2tpt42S1bBssx+E2qRRFkrCt+Dx9uTcJw8Y0a9
         m3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284586; x=1744889386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inreEjGkP2FB86SvKqikRoCXcnYDIYzGtWDBTQYF/sA=;
        b=qBIvM56rR3WNRMGOv3g9hZRUUI+4V4KM2b8wif7vvavLxUf+yqEM1Goam4C+jhvhbP
         g5+AJeETIeP5JfPUjkZfu4sIBAQkQtgNpKsy8GzJ7dWe8Ko9blItumG92D3KicLtKux5
         DTDGchkLmzGdlGFirFEIjXD9DLa5dEcWaCv9LJ379EMgfnejKZUsK4aUPdjCZTJM72hZ
         jHLIiLPjk9JIoHlk0wyua4xzsNiR6x9HT7J14wzHx0omY51uXWDFfZdn17d1mP/G2HDy
         RffEXQxSJRSZxnB+P3OxNxjFSrRib9KN2cR8npOsHMDWXVImZmf1Qt/Z2IhjKD44tPDU
         w27g==
X-Forwarded-Encrypted: i=1; AJvYcCWOxLRYYzljuzv8FX0kXuVt21y8M2pKz83PPo8nhLnmrCeKFtS3fmr1pLL8uvECv52UV7Mx2fW5fHQmiu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRk5CUkZYV4/IYcR6akwyflCih8M+tD54zGJoe+rQ1CeThb92
	w/KQ7p8l1adPz0M8Db9+JEn5EG3/VQcnJ7ylHf/b1mgCuLA8WdfgTcDoC+ohQuM=
X-Gm-Gg: ASbGncsw+LXVxgFZh5Mvg2LFFXU9L/cmfuVqF/fp3RtwAmNFTAuPdTHHCBr7EiWjkaM
	6CGECTxPPAodLAFWXW3jYFvBLxFrWswClgKxsbTm2iYSa6GNHEu0Psk6cbPc/+d6DWz4msU11U5
	e/41Ee78iXPxOn3D8OvrlhnGPnJ1l6+aybWijVtRaRz/31deT1yK+LofWuhid2xT5uvvEzS/Et9
	x3s3d9pcppWZRI/o3N2HEDgmzCpK1Yk6pMeX++ZyirMq9ApfgvRnylK3Tu6ht2QwqrAl92l2F3n
	yTbQPijIjApjD+6XD0W/zS73LFkA2N+TVeWyqauJ+w0=
X-Google-Smtp-Source: AGHT+IGiu0OWEfT2fJWCoTEv1DArNTgNn8X+CE9Dq1sIudD9zQeKyE4/MK4CcE//ivPh7Bmvd/5jzw==
X-Received: by 2002:a05:6000:1863:b0:39c:30d8:f104 with SMTP id ffacd0b85a97d-39d8f36c5femr2027739f8f.6.1744284585872;
        Thu, 10 Apr 2025 04:29:45 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0b09sm4616409f8f.63.2025.04.10.04.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:29:45 -0700 (PDT)
Date: Thu, 10 Apr 2025 13:29:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <Z_erp2nLRKzLXuwF@pathway.suse.cz>
References: <20250405145354.492947-1-ryotkkr98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405145354.492947-1-ryotkkr98@gmail.com>

On Sat 2025-04-05 23:53:54, Ryo Takakura wrote:
> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
> The register is also accessed from write() callback.
> 
> If console were printing and startup()/shutdown() callback
> gets called, its access to the register could be overwritten.
> 
> Add port->lock to startup()/shutdown() callbacks to make sure
> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
> write() callback.
> 
> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> Cc: stable@vger.kernel.org

I do not have the hardware around so I could not test it.
But the change make sense. It fixes a real race.
And the code looks reasonable:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
