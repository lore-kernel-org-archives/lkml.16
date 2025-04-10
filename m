Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D871EF37B;
	Thu, 10 Apr 2025 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744305336; cv=none; b=ck1dy6gS5OlW1oCT8YhELloDiAhDNS+DHt0uAiv4b9mSRkdhhUSN6edaa5zSWgcaD4z3+SbXddaLInIloKI65WqT0vSANhklp9gvB28Hox/QY1FhhysxXXF/GTK6wXTiRhcggBpmXTudxoWxms9rijkDZCS7hDM4DU5++MwV5DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744305336; c=relaxed/simple;
	bh=LKLFe3uF7grtVdstcoaCEtsKxdwcCfekK19e6QLhF78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyWC9GZrMLTU/4rfojwdZvhnmynq9szo8jgE003X38zLZ/rBQBMUahahzoYm/6arsQ4vwd3Z9cUrEKns5cL1HFEq1bI5IqjM9OG9u8SJg8cgNEq+wgUdcmpgbMEMmAtAOhp+BEVRjLAkCIxTWBIlUDnwnRBLB8jxhhROUBSUxBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXIGDBj1; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXIGDBj1"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7020d8b110aso9767027b3.1;
        Thu, 10 Apr 2025 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744305334; x=1744910134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzsGSfN3zKe9L7HiNcL3vhZCWqusG/ETlw5Q2TYe9Mk=;
        b=kXIGDBj1+clltsMy74hwWbcXmASY/frqRnI+6jOl8wl8yQBYzqzPIY3Ncu1/3NdqaN
         tswszRM9TTAgFeP9rQrc7Hu4m50pUTXUmSs6+9MB1RjXBTvgLB1jS2NKyMBp+AaFXKT2
         YPDYvUlNY3j7TtraqQT+xeEDmXHPi3RmRXzSzGxhUGRvI5eGMabc6I5pi+Mi5DU4GNvh
         t0DEaHHP04vR6/zSgOEIrCUH/eV9K+ksUJwLc+so/WqGrM6sOPPR7Qt3e23A7ZHj4csO
         AjcpbWuZAOSF7G03eWAl2Hyqo3Kp9ieRDoQfgNLez0YOd81U622C7wkapXZ5fnXVb5Ry
         a+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305334; x=1744910134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzsGSfN3zKe9L7HiNcL3vhZCWqusG/ETlw5Q2TYe9Mk=;
        b=gBiBEPHG57Pnf/NrFrPyffAw/GaIBSPCFHo7FLOh0z7eQxYp7Z2KgFYNlPFTiHJjWV
         O/2KIlyvcAws9agA+1NvYByYRk17lpoyot2J9avW+dl4fTBKCD8Nop3EEVapAFG7ZtLp
         +zaL2U7Hnm+JtMP2LfViJV+1d5VeVmDXe/LwQz96Qik9vlkmNcxyCwJ/jZq3WkffJF46
         y30oxao8HGffx0T5Ifp3VzID3Fp9ZTcYxhqoNpJaqlAQpLzoQI53yvWfdpagbcgSE5wa
         db2MmDOdqKONMtyUG3Ga9mQj1KwaBdSkqZL+IbqJdxKK5JCxZvDgXEUg8LDQ2cnv9vyj
         qYpw==
X-Forwarded-Encrypted: i=1; AJvYcCWacf5IGaATWiK5n9J65HfUBTINKfkU5GUukkzWH2SvQcsd8ex6AsSffthPs6SInhcDEMKAtJ8Qik8g@vger.kernel.org, AJvYcCWna+jFcgwsTNjrtkZYtppBWXSfUCEWJYM31ZSy0ZEKJtu2oYCgIZamC1O0UDO7nEpFxLL4g8DjGowaHPgt@vger.kernel.org
X-Gm-Message-State: AOJu0YzWae2Zm2pBVcDHOu7qvUnhQ37fg4pzG+/W9TXn9EKOhwhuRMu2
	qPMcnBQ//V0RAf5h5HN5XyMvNFS12zZLoKUHbXJqqDuBdaqfdjNOT+CO3CnVceM+85+sx4ZNg7k
	+lqo9hsv0nuUNJV6qW/Xot17AbqQ=
X-Gm-Gg: ASbGncuoqR+6CnHulpRHcAkSvLymktNyuOPWh0h8EJs4/EjcuZOyuJ2WufffDMaizFd
	wXjwrgbB381Xle5PirHV93qhsOi9x4HMM7kWkVjde+xRU+1bWo+usGHhyacpYNY3DRPTB0xi6mU
	sKFoi2ydvZ0Zo87rzNX9VLfxo=
X-Google-Smtp-Source: AGHT+IE75dOoZN09smDMXY1cC+wHVZjhX1T1PY+rQ44c2yKgN9zJ/mwy/47jExP1TRN/IVjGQE47AEM8UYqhmhfw6Bg=
X-Received: by 2002:a05:690c:f91:b0:6fd:4849:62ec with SMTP id
 00721157ae682-70549e7fbdcmr56554307b3.12.1744305333850; Thu, 10 Apr 2025
 10:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408231823.826163-1-robertcnelson@gmail.com>
 <20250408231823.826163-2-robertcnelson@gmail.com> <CAOCHtYhFKO=LRN8qp-w+rkTGKJ8t-LnqgqbQW9P6CO3=EeuufA@mail.gmail.com>
 <20250409130918.d3cyzv3to65oktv2@vision> <CAOCHtYgpkBXZmZEDz6gUCO2x+WGA_paKHFHS-Br=ypo+AFrBmw@mail.gmail.com>
 <20250410120822.3vsrt42iyfs75h6q@spearhead>
In-Reply-To: <20250410120822.3vsrt42iyfs75h6q@spearhead>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 10 Apr 2025 12:15:07 -0500
X-Gm-Features: ATxdqUELa8ezNkTE2O4f0TujIZmAX4NjS-OVoR-6J0hXWh-oJ7Wu0PtUUFD8BoY
Message-ID: <CAOCHtYh7LWhTBOSsua9_=wxSTNt9HmvUaAFCiVS6a8G6dV4AoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
To: Nishanth Menon <nm@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>, Andrei Aldea <a-aldea@ti.com>, 
	Dhruva Gole <d-gole@ti.com>, Jason Kridner <jkridner@beagleboard.org>, 
	Deepak Khatri <lorforlinux@beagleboard.org>, Ayush Singh <ayush@beagleboard.org>, kamlesh@ti.com, 
	praneeth@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 7:08=E2=80=AFAM Nishanth Menon <nm@ti.com> wrote:
>
> On 10:12-20250409, Robert Nelson wrote:
> [..]
>
> > > Any idea why we are crashing?
> > > https://gist.github.com/RobertCNelson/c68c96a8a1dc6e4d39d8c48fc13ca1c=
1#file-gistfile1-txt-L311
> > >
> > > I don't see the same crash in beagleplay:
> > > https://gist.github.com/nmenon/5709a8714d3ab31cac5c00b515d04752
> >
> > On 6.14.x i have a little more, info...
> >
> > I've got all the CRYPTO stuff enabled, pretty sure that comes from
> > CONFIG_CRYPTO_MANAGER
> >
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > CONFIG_CRYPTO_USER=3Dy
> > # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> > # CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
> >
> > https://openbeagle.org/RobertCNelson/arm64-multiplatform/-/blob/v6.15.x=
-arm64-k3/patches/defconfig?ref_type=3Dheads#L9578
>
> OK this looks like to be a independent pre-existing bug then and needs
> to be investigated, but it is probably independent of this patch itself.
>
> Could you share a clean defconfig bootlog? I have no existing scheme to
> test this on my end. In the logs, please also print
> /sys/kernel/debug/devices_deferred to ensure we have nothing sticking
> out in our defconfig?

Okay stable v6.15-rc1 with arm64 defconfig..

https://gist.github.com/RobertCNelson/666638abac8eee4ed573997996362450

root@am6232-pb2-87:~# ls -lha /sys/kernel/debug/device_component/
total 0
drwxr-xr-x  2 root root 0 Dec 31  1969 .
drwx------ 44 root root 0 Dec 31  1969 ..

Regards,

--=20
Robert Nelson
https://rcn-ee.com/
