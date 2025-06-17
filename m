Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541BA3C01
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156333; cv=none; b=UfWp1ynnzgJupRIbEJjhvYbw24Pi+/y9ZkA57zh+eYXVdewWfZjl//unY1vDLGhIsLF2BzCxBRBpboPhX2HWJBf1r6RKuDy/E6mXse44tTsOpAOYZmvpgXF4P81O8n27fi6MHahxqNTEotnQ+F2b5BC8hkSemO+6k96slxWvYMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156333; c=relaxed/simple;
	bh=lP7tH50EHKaPV7EyWetW5r7OCsBFgzuR44QXgtQDigs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCaup2B2IlKK/Qh61b2TZlqwAu/PIRSoO6DdDPKhbRbYuHfNNYcvE4lEzbhgpXaI79oMcYB+L3Nc1L+pvK89DKa9sH4dvLS0A2x16XdxbNGHrb5LRJro/z1M19svWLJT9jv0CxB1wDG0k1Ycxw3J1ILn+e6rXVEQhOUzEXSt+s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zr3bpOjU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zr3bpOjU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so47840485e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750156330; x=1750761130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lPe5/n2oxf3JVaDKVRX7NszGG8b7ffzWhtjq7tJpjOE=;
        b=Zr3bpOjUBVZL0TN0Fh7FSjk895Sc1i10qcUtUTG4fDoiFfEpAkGJ6qApez6cuUw6gc
         yHjgAOkqx22C65VMRwdm8P6n9Lqoz97ospsETG7ktkDd+vNs+FGdNjJU6FS27TFMEDIT
         tZilWrhdUZFmm6lh+1v/0ks2ox34R6cya+Fdmrc/sUqSMKj81yG4E+Lh0rnSJ5UHDiQ3
         GD/go4JUNMIWx/0S4PJF/fHc7jb8I5Jm6EgJlVrGyOZGCvEiuP3Q+O72ofdqth21x/pE
         YjuOBiHId++jXrDEZU5lstdC+1J2nrfBTJDzWR4a0A+W+Cykl1d3NyWPTzMwqpja9IJx
         xJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156330; x=1750761130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPe5/n2oxf3JVaDKVRX7NszGG8b7ffzWhtjq7tJpjOE=;
        b=L9K9Aqm5WEeIqhpA18zdRyeVhRMCSuKISwD8VnYd35eBeRweZl0vQk/s3gnjAppnKH
         49qFy3CYNUKGOIqWEAOef2LbBW02ZXH1gVKF44vOlPAdzqhtvyn1O2zBDjbjzB9Fb4Ug
         DBOSbiWyh/vts+0Pbulo6V4lrCGH3K8WExJP9ndtPMDkx7Qhi8Cm+nMcWDEV4XOPvxhZ
         AO4U5NHp8KTuHwdh3rjGlrfPROkRMtECgGBRLtrzg1tveKFjFwzY/DwNuUO9FTJabhIn
         3p3UlHWLYGb00rRXtmFCSdRR2e6bAmJNoD6CC75bxkGgJsasggMY5ta2pTvllXF1UQwH
         QTwg==
X-Forwarded-Encrypted: i=1; AJvYcCUU/n90HObQxkMvqLuGcJGyAw8wDtH6ik4Mr7FF2AtKTcvRn0NHyxX/o3N9wCQeEjcA/F9S0l4JNbrJLsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzT/Tj7Zw0QddY1EpSb5FWr/T53GJSyxHQB9PMirSkxIFAipDA
	/tD2xFC0q+c1CuBvWI4Hs7f9u3gILyTNPgm2G6wM2dsLYE18TpPjI/9hVsBVA9K6/EE=
X-Gm-Gg: ASbGnctjZ8rI9fxETLTj7vtalwRH2qTj0A7GorpGFdmis+9jlKkcD4/HAx4wXCWrxVh
	nLSQsKvpcV3ISacspprqg8Sk5ORZ7FaJa3GS63Qw1Ko1/Zhz39dEaQyL64gfO4FI87EdyXcsfqk
	xmHlIfamepyDTNvv1tiv5PJ+i0FtlMwPS12h5kG9Ag+hjI4lE4zHrOnl7tKIVZW6IGxMLjSTHDr
	9T3RoOEVqtlYuGgDgZKRC0bXLE8nXFAnNkM0/iJw0r3tLM6G4doRM1kFAOW8/O3OqPvwGD2TKvN
	HTZLB8RznyB5GHnJJ311JUzhelhQGZpPgJ9NT7fNqtM48aNk2r6aqXIc8G8ol34/
X-Google-Smtp-Source: AGHT+IFag/LHC1fg3QTYxJ2FuZ5C6WpUqnU2Vk1SsLFs3XYCQ1UnDVQBufbgznLsytK8lFA9A4HBfw==
X-Received: by 2002:a05:6000:4a03:b0:3a4:fc0a:33ca with SMTP id ffacd0b85a97d-3a572397d6amr8482421f8f.4.1750156329592;
        Tue, 17 Jun 2025 03:32:09 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bcbc9bsm10333461a91.9.2025.06.17.03.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 03:32:08 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:31:59 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Toshiyuki Sato <fj6611ie@fujitsu.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v1] printk: nbcon: Allow reacquire during panic
Message-ID: <aFFEH4urEYEx5IpI@pathway.suse.cz>
References: <20250606185549.900611-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606185549.900611-1-john.ogness@linutronix.de>

On Fri 2025-06-06 21:01:49, John Ogness wrote:
> If a console printer is interrupted during panic, it will never
> be able to reacquire ownership in order to perform and cleanup.
> That in itself is not a problem, since the non-panic CPU will
> simply quiesce in an endless loop within nbcon_reacquire_nobuf().
> 
> However, in this state, platforms that do not support a true NMI
> to interrupt the quiesced CPU will not be able to shutdown that
> CPU from within panic(). This then causes problems for such as
> being unable to load and run a kdump kernel.
> 
> Fix this by allowing non-panic CPUs to reacquire ownership using
> a direct acquire. Then the non-panic CPUs can successfullyl exit
> the nbcon_reacquire_nobuf() loop and the console driver can
> perform any necessary cleanup. But more importantly, the CPU is
> no longer quiesced and is free to process any interrupts
> necessary for panic() to shutdown the CPU.
> 
> All other forms of acquire are still not allowed for non-panic
> CPUs since it is safer to have them avoid gaining console
> ownership that is not strictly necessary.
> 
> Reported-by: Michael Kelley <mhklinux@outlook.com>
> Closes: https://lore.kernel.org/r/SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

JFYI, the patch has been committed into printk/linux.git,
branch rework/fixes. It is intended for the next 6.17 merge window.

Best Regards,
Petr
