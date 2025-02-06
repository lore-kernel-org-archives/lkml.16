Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934692248B2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830560; cv=none; b=HLvLgVZDOPlRLMnz1HA+og8TaiXg+7bZa2PfO7I/Xl02cUzd89Av+CVjrkx1/hO7DGZ5vuIRs7JuO5WQd3E1gIr507V8g+iw8dw+PBjGF3MbG17eHYvnErdow2A3ckygNZFJ27Scs4Xo/aLZqV0pT1qz1dtHkVPdXDgdAZzTMbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830560; c=relaxed/simple;
	bh=KhLZSgX7LH9kRhckO8phRGSyH6BbaS7wgCPghNqLELc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDrNlcE0x4SEH9TflUFTSR2M4GlQHtTxnVbsCSqenN2RuShj55nY33HMYaJALfmOXQEYGs5z0S6P4KQlodi/pMaRJldpQzo31ezEPXzkQmN7mBvu7n9jgPG+91ADmS3NZFS8Q2U3ytquf5F1buK56pnWD2HegqOkywMnnYFxd6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SD8D0cEs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SD8D0cEs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f301269cdso10498785ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738830558; x=1739435358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMiuwQxnZL8hN7cBfXpXr8CeaByDASFkZFzoKs1uVw=;
        b=SD8D0cEsj+9ONe7LhsjI72Jb+5myd4tnUCiDd7EQEPiWtXzl1COcLPhn0lNiNz7xtY
         kE3yvCDOd9GMPZ2cgQPVVjmApttoa8MdaarpjHRnOIi5WHKrhGSHlfpHfcXBZvP4RiQo
         y86D52jwZ8KYdu6maHKtJ/7k3SpBpvNerlr6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830558; x=1739435358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTMiuwQxnZL8hN7cBfXpXr8CeaByDASFkZFzoKs1uVw=;
        b=iIFxIUBolVJLE//Un6bZ3gMXBd0XDbA26d7ujDnZrGSrPYv7K+2c8KDpxk8SRxFw23
         rOjtF13X3UvPlOzxAUjNe+7lJtaOZhYx/LcnaCkSeb3odmgj8+KHbXbEM3P0tO5ilCXZ
         2AgbHQNWO4S/LZtY8IywV/vmk0paWlov5M9RCnxryrRqM/D8xLSYExtnMjbI5rSq/g1u
         1UQ2k9x7A7K+5RAuP6HVFsu0e39Z97xNgA+5V/FsiALO2lF+j2ynW46B0BDI3CRjiLJ2
         DTv5oPX1Zy6BxzGRpHkTg/zZj01ufOZZiZCoxbCrnlcT7ybbCWGQ1T/xQ2dZGrwXtVjA
         +pWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXrHoFRLLmV78K6NgsQbGuBVoo3kiGRpOB1ddKGnu9I0GQDZEc+ZotJjquygX9DuLnP4gwAUyvBFnXyTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3CI6mEDRWAq/4LOGl4Nro2WgJnzAggFFZKqBWCYS9WyigVg1s
	wHx6upIQU+gD2A+n+8ialKbhzJ7DTPtjh4l9sTvzsWb1B+EjKahjQO9OSqYhsg==
X-Gm-Gg: ASbGnctjuy9ZI0aQ4JedTTluvQaPsNrO8rgXPIUEzrX4cXPeIXtuIFE9Abud0jtMLb/
	wP53cbdmEt70Xr6JLFcfpml5qepElY+CikjYChoIpv3m7PXxIZu8UzKfR6xYhXBoDAjEPC5oN06
	u2Sr/ppbB6fWyzUn4BEx0HXVAlf4vKswI4dDtnXJHpuSQ92jyc4yjkRGMq43Qx2zxL/kpuPlGiG
	E3WJNda/rtybctttVUM4u6KIlPq1+I7pJxeL4jmrPkfyhrzflyN3jZMYDACOwhagU1Pz1vTGvcl
	HrJp2dRTVk52OJ4CGaM=
X-Google-Smtp-Source: AGHT+IHKu+/kkxv3nh8DeKbuRIC1L0v/M07cqILr0sFaf+TajiM4acbw0AF9YRCI5qd+AEJ/u4FMDg==
X-Received: by 2002:a17:902:ce8b:b0:21f:3e2d:7d41 with SMTP id d9443c01a7336-21f3e2d8011mr8566605ad.11.1738830557712;
        Thu, 06 Feb 2025 00:29:17 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653baa8sm7133985ad.73.2025.02.06.00.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:29:17 -0800 (PST)
Date: Thu, 6 Feb 2025 17:29:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>, 
	Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <y7d7otbyqolio7767wbetli2fmv2ugja6bwriz32dncqvnsmj7@4jrdyk5gnch2>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <itapje7ikrv532bwn67udwtjmmmyqp6j4yqc777smbi4rjgmm6@6se3rdy6ufbk>
 <20250206073803.c2tiyIq6@linutronix.de>
 <46ttdyaiweca7qou2t3mx5jy7hefg3htrv4covt5htcex7zaq4@p6is3ukmtbhy>
 <20250206081326.xMa5Z5oJ@linutronix.de>
 <zgaitute72xlzukunnhioqk4e2copgtkonxtn7iuvjq6gufwhr@yg4kry4wq3p2>
 <20250206082635.dZ1qhyhU@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206082635.dZ1qhyhU@linutronix.de>

On (25/02/06 09:26), Sebastian Andrzej Siewior wrote:
> On 2025-02-06 17:17:41 [+0900], Sergey Senozhatsky wrote:
> > > Okay. So there are requirements for the sleeping lock. A mutex isn't
> > > fitting the requirement because it is too large I guess.
> > 
> > Correct.
> 
> I would nice to state this why a generic locking implementation can not
> be used. From what I have seen it should play along with RT nicely.

Will do.

> > > > wait_on_bit_lock() has might_sleep().
> > > 
> > > My point exactly. This makes the WARN_ON_ONCE() obsolete.
> > 
> > Right, might_sleep() can be disabled, as far as I understand,
> > via CONFIG_DEBUG_ATOMIC_SLEEP, unlike WARN_ON_ONCE().  But I
> > can drop it and then just rely on might_sleep(), should be
> > enough.
> 
> It should be enough. mutex_lock(), down() and so on relies solely on it.
> As I said, preemptible() only works on preemptible kernels if it comes
> to the preemption counter on and !preemptible kernels with enabled
> debugging.

Ack.
