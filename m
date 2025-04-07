Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C4253B5B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032143; cv=none; b=sjApTBfJioA1IZA3rCMm9jZKAkR0+z7tn2iyqw1mDbm9YdxuhSdsKVzRUy2a7CrzgyO418pI/BRKRNKUPzJoIEokr0OiABZb/Coc6P0aZZll5ZEIRbWcAK2Xth52aCNO/alU0iF3LSykSdSNt/BIoBU/k2/wrBW25LMvc3ZD8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032143; c=relaxed/simple;
	bh=RhSvphEi+Bf9p294col7eSXEeuSairY232+H7tKrkPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLg1CFFJwLFpJhGJ9Eys2s3rbIDwzWDi4741tXnpPOG8kwFA6KAK5/9g2IWoRN1MwaNpGw1VDSOZUXnPPso2Zct1RD3NF9Mg3Cl1EIuiIHAc99UE23HZmL1PRmjeUcr1nZFvjelrnNZBV9IRAaArhJMggkbSc6z86RrO9uh4j+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dk6JNQfK; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dk6JNQfK"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3feaedb531dso1046657b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744032140; x=1744636940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhSvphEi+Bf9p294col7eSXEeuSairY232+H7tKrkPg=;
        b=dk6JNQfKc+0AlD+BNse+wWIm0r3lVKr+3BPx0dTnZJ73xqmPyCftbbTuJlEemWn+s+
         TS3uw5cLeAiL3a3X9TfQ+gBbPo2+A/7X0XfNgOPpqCgn+BdcXFDOIMtZH/u2Wn3O1wKR
         jZuaJbQgKYUTclTRXxl3EsDIJ//QYcc9dgA+nAiwVMrl3vMculkmQahRUw5G2Hz55wH5
         93cqhz+159j07dbOaK5I1To7OrwKPL7kmi00B5jydR4RcunZXLun9ZlKSQgy8OWnABL1
         5opKPRmksk3T6CWtCgh6r8t2TjAKrGKghf8FY7ZAAYXWA15V3oa9PBtEkxlJ3WuKmF1l
         fwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032140; x=1744636940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhSvphEi+Bf9p294col7eSXEeuSairY232+H7tKrkPg=;
        b=vA0R6C77uWEu7Pia0yE8USjTOPLiPz45+qTifvwnRggA762ZWbOSheRcDB4NORxTMh
         aNDwVetsGQgS4NGN9O8DCwWAIX1yP0ay4SWXypvIIJtj0XwScqVDjN/KRq+NLfxeNFu2
         bd/Mjf5JiSoXgpFSmd0kK7BNiJUQM0lEXJpKJIviBGeHMsTlqUFpE7VP18mnmTx7MMUG
         n+zH0PBPZN83t0mrN69+QXAPnFst3y3V/W8sk2yTcfT/tjmJIKtkCJ+9jd32yJHVYZO3
         nV5Hczle056LEyBpgW5tlEBBettmomFZh7VXlpijAu2/N46cKBzJagUHOZWKM3AFUg82
         Jf6w==
X-Forwarded-Encrypted: i=1; AJvYcCVMRCQfqeoN9c28o/wZzzGimLar0bc5ayivJQjVsukZk7itGB92ILFNMMSZAE8bR+HluxZheOMLb4HjkV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75qeiK5lIT+C55wb5gmFXqin5K4SZqsb6aVkPLv59HBiAwRAL
	xUa0jKbKiHo1jANygoLFm5PeaFFzoW8mUSxzURNB/831S4cb1wX1hRuLOZwM8YhnXB6K8v+qnjF
	dd7LpyfApLdcCN21GaR2ilKM6kmZQA5TJnmD2sg==
X-Gm-Gg: ASbGncs6LkZ3Rb4nqgDlRl3CTTjvmE3nIWjuv66EZSLvvGix/aSOkG/+/fIB984D/G2
	27f4kxf4GKXLF5Ho63pCuyf5jPm5PyvLNuLLI8YG/wwOd+gwfRGTYeJULPtaNG9tzeDrSMwPJQO
	e2acK9qVRmm96Mr+oiV3+CSjeq2L6gpM5Sdho+ftU=
X-Google-Smtp-Source: AGHT+IF/tCXdL/U2eawbN6mcul0H+dBZkMJBUZdOeZTve86ZcGic28DUtHEBBRdbbnukWUr2WTbRPlYDMDvwf2XEIvo=
X-Received: by 2002:a05:6808:3a19:b0:3fb:bc53:d292 with SMTP id
 5614622812f47-400455af733mr8199433b6e.19.1744032140130; Mon, 07 Apr 2025
 06:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403090336.16643-1-cuiyunhui@bytedance.com>
 <Z-5yr2mFaDt8kxC-@smile.fi.intel.com> <CAEEQ3wkWmfkq06iyhxs32pyTUp7Mm=UD-dYen_9H5kHnsJe10g@mail.gmail.com>
 <Z--7Wm_erf5U2xMl@smile.fi.intel.com>
In-Reply-To: <Z--7Wm_erf5U2xMl@smile.fi.intel.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 7 Apr 2025 21:22:08 +0800
X-Gm-Features: ATxdqUFA9gAWoeBDbN_nvkMZIfpUTJWL0TGxGXx_TeKFaOWb6IawirOxVncSRhw
Message-ID: <CAEEQ3w=VVU=5a3VcrSpFXM5fOgWsM+-Y52FUdRK+w2bjr2ypfw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] serial: 8250: fix panic due to PSLVERR
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	john.ogness@linutronix.de, pmladek@suse.com, arnd@arndb.de, 
	namcao@linutronix.de, benjamin.larsson@genexis.eu, schnelle@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,


On Fri, Apr 4, 2025 at 6:58=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Apr 04, 2025 at 10:44:09AM +0800, yunhui cui wrote:
> > On Thu, Apr 3, 2025 at 7:36=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Apr 03, 2025 at 05:03:36PM +0800, Yunhui Cui wrote:
>
> ...
>
> > > > To resolve this issue, relevant serial_port_out operations should b=
e
> > >
> > > serial_port_out()
> >
> > Okay.
> >
> > >
> > > > placed in a critical section, and UART_RX data should only be read
> > > > when the UART_LSR DR bit is set.
> > >
> > > The last one is made in the common code, are you sure that all suppor=
ted UARTs
> > > will be okay with such a change?
> >
> > This change enhances code robustness without being intrusive.
>
> It is intrusive as it touches the core part affecting basically
> _all_ of the 8250-based drivers.
>
> Yes, it's small, but still it needs to be done carefully with commit mess=
age
> pointing out to the other 8250 datasheets to show that this is _not_ DW
> specific change.

serial8250_clear_fifos is already part of the serial8250_do_startup
process. The purpose of adding it to the critical section is to
prevent the FIFO from being cleared while the UART is in use.

Similarly, serial_port_out(port, UART_LCR, UART_LCR_WLEN8);

It is a correct logic to check if the data is ready before reading,
which prevents the FIFO from being enabled by other CPUs before
executing serial_port_in(port, UART_RX).

>
> ...
>
> > > > Panic message:
> > >
> > > Please, read this
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.htm=
l#backtraces-in-commit-messages
> > > and act accordingly.
> >
> > Okay, I'll update the next version to follow the guideline: 'Avoid
> > directly copying full dmesg output (e.g., timestamps, registers, and
> > stack dumps); instead, extract the critical call chain.'
>
> and make it short, e.g. ~3-5 lines only.

Okay.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks,
Yunhui
