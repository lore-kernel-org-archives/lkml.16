Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB7D33DF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044546; cv=none; b=gwI0qJM6OmBtIIMYIpH182s9qYNFiVrtSCHy1nua3bHhyJ/DMwxBwHXAWuDIYzBOkfx3NHSCuQPIre5SVkxVteUS1szN0U27jVCWDdeFUmTjwZTrUWL9pOsdmal62MzJnwNcPcdga7U3IGBMyNmptyGyVtxNUnA3fUQFFZoV4WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044546; c=relaxed/simple;
	bh=dIABzik+Xpu8YPlwTdFf/8MsdySvzM2KB+LBe47QblU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+Msg7F8ScjJEOJBqjwIY7j2z24NCEMgJLqMtv2adXmRidrzUhka0f2m7Yuq1Co95NDW6l4U653RTr+YB3TUtvcdW2t+HnGhCbbyDADKsCPMF9JoNzjG6gbxJTecfNw1UzsHmH4VYSLPOFIjMUm3fHLGJAeS/mdwgunextXEUgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ejPz2crY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ejPz2crY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a375e72473so3976627f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749044543; x=1749649343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4krNLYqTu5PwEOLh0tYgHTp5VBnZZoifiHQYwqKpyGI=;
        b=ejPz2crYxqiM5ee2GjwBptlCsRtZLdTE86Ds6mlULeCOLIxRaDeXyuGLCNRk66Ah7b
         b2iYquU8MD+v4KJ70vTS7bPPxR5ZHt7TYZu5+yd76gYLmtL7vx68E8MKDXAAf/qSsX4U
         xhZX8T05hPnPC9D7zeu5l2maVyqLlUPdVRoAzhFtxBLrq3LxunOFppY0uA2mPWD/ZPDi
         Cvu0WPFc0ZQeTsqd/Sb56df7Yx9sxUXbjRzOSCDSAp7PxamDdHZm/xxYbBJTzLHG7NK2
         hcpimXO9HvDHNNbr1WBsN6boMYDKYeTidtkRiT5vwwPOHCZp2K93ibobGRztLq24qEb3
         ooRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044543; x=1749649343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4krNLYqTu5PwEOLh0tYgHTp5VBnZZoifiHQYwqKpyGI=;
        b=Gl6Kl7hxJPPJeN6dP5oEfqV1/HkFiWSdl2C/5grayNdlGMHG/dimeeZqETDPdatKwx
         Y5gbX06jzU7vd+diXW5cSCMDkMYdNcEIGnurrHjjORjAiN/6TDxvvPEKiPWDBmqd8nxf
         MAcQZkpv4WisergFuG33X+f7fbwK719YyEMMKdrK1jQsQsA5YO8/VcIUHDpvHP/1tupo
         g13RbcEpf5ATRlPCPjLNYIGD8+5teuGFYM/93XvzVFcr7kSqYBdrpgEGgF4KXYIBDb+t
         zEe0r22cZh7RWaR/HmgE/ju3NoE8PyoFx3usKHkiXXm1tSVtQHs9FI5Sl1EyhwVYg0Hg
         MVQg==
X-Forwarded-Encrypted: i=1; AJvYcCVolpCH55OH2gEPfU4vy9/jto6aWJ76bClpFD7xVt27vFDSA12b5V1gzQnwynMQ6B2eDQoW7Xrk6jS24EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDJxVR4Vg+3khkB3qwGwuC2UfWyD+T5xQ5RN/wfhtneJ9VLyP
	UkJPP0LubX1aSbdKmqa1K9OUOcxqnyypHJ5ZkEy0QBCrg2brL+CgTkGVOvD76aLxG7o=
X-Gm-Gg: ASbGncux048pTuBqRV636gC/MKfDQXzvSTtBC/UTZNi71HWW1/ErMu8S3hiAYTucqjH
	hxDLkrhi2WfTAGYkKC13E/OBAvO1Nt219baVZmsE/VhE9of2BFVtTCc2+tySnAutQ13JUXHX7GF
	d69EN1cEH2eGZArybqaG3PRc6i5LtBczWEBJ7J9lphzvrhw0j146WZngAYuSa4y3GN5WGSgzDrn
	5CN/tGTcBX2/4CtmXGVbLSQqkZbRYmW2wTtuh7PY1SYh1fypcDVXyFX7V5By84ADSw5HkvQMGiR
	VQh85eF3ZCINqklwix2JU7bt+Y08oHk/k3jd7+ne7PIMzFawUs4PEA==
X-Google-Smtp-Source: AGHT+IFBf1ks7FvkIM9/KgiSH1Nm0ceyhd9C2E9/xug+Okpyo/jMkoHYpfHI27ynqCD67VSiZ+dtUg==
X-Received: by 2002:a5d:588d:0:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3a51db2deedmr2311080f8f.0.1749044543082;
        Wed, 04 Jun 2025 06:42:23 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e32feecsm8910312a91.47.2025.06.04.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:42:22 -0700 (PDT)
Date: Wed, 4 Jun 2025 15:42:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>,
	'Michael Kelley' <mhklinux@outlook.com>,
	'Ryo Takakura' <ryotkkr98@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: Problem with nbcon console and amba-pl011 serial port
Message-ID: <aEBNLMYVUOGzusuR@pathway.suse.cz>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
 <aEApOPTqbVOR35F_@pathway.suse.cz>
 <84o6v3ohdh.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84o6v3ohdh.fsf@jogness.linutronix.de>

On Wed 2025-06-04 13:56:34, John Ogness wrote:
> On 2025-06-04, Petr Mladek <pmladek@suse.com> wrote:
> > On Wed 2025-06-04 04:11:10, Toshiyuki Sato (Fujitsu) wrote:
> >> > On 2025-06-03, John Ogness <john.ogness@linutronix.de> wrote:
> >> > > On 2025-06-03, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
> >> > >>> 4. pr_emerg() has a high logging level, and it effectively steals the console
> >> > >>> from the "pr/ttyAMA0" task, which I believe is intentional in the nbcon
> >> > design.
> >> > >>> Down in pl011_console_write_thread(), the "pr/ttyAMA0" task is doing
> >> > >>> nbcon_enter_unsafe() and nbcon_exit_unsafe() around each character
> >> > >>> that it outputs.  When pr_emerg() steals the console, nbcon_exit_unsafe()
> >> > >>> returns 0, so the "for" loop exits. pl011_console_write_thread() then
> >> > >>> enters a busy "while" loop waiting to reclaim the console. It's doing this
> >> > >>> busy "while" loop with interrupts disabled, and because of the panic,
> >> > >>> it never succeeds.
> >
> > I am a bit surprised that it never succeeds. The panic CPU takes over
> > the ownership but it releases it when the messages are flushed. And
> > the original owner should be able to reacquire it in this case.
> 
> The problem is that other_cpu_in_panic() will return true forever, which
> will cause _all_ acquires to fail forever. Originally we did allow
> non-panic to take over again after panic releases ownership. But IIRC we
> removed that capability because it allowed us to reduce a lot of
> complexity. And now nbcon_waiter_matches() relies on "Lower priorities
> are ignored during panic() until reboot."

Great catch! I forgot it. And it explains everything.

It would be nice to mention this in the commit message or
in the comment above nbcon_reacquire_nobuf().

My updated prosal of the comment is:

 * Return:	True when the context reacquired the owner ship. The caller
 *		might try entering the unsafe state and restore the original
 *		console device setting. It must not access the output buffer
 *		anymore.
 *
 *		False when another CPU is in panic(). nbcon_try_acquire()
 *		would never succeed and the infinite loop would	prevent
 *		stopping this CPU on architectures without proper NMI.
 *		The caller should bail out immediately without
 *		touching the console device or the output buffer.

Best Regards,
Petr
