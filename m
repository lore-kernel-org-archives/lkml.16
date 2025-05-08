Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD31220F27
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 21:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738590; cv=none; b=siH9B7hR5RFWPiLZSOwYSs8IsAi5HRpXeXWZulu4GTEdJ0V6jOSOfBh5bsarelPnX4LeLZJUsDlfeAz84bQK3wWS77tHLGZ6+wDIDCzN3itSf9ACdgrDG9W/qIQHhcvmXjBpVKLR73VKgWRhqPrMd7Ak33B49+jkeS92l9v57TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738590; c=relaxed/simple;
	bh=qbdKh6U/taZO4MYmSt7at007SJ4byPEZOOzFjEpQCDE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPdfBo89Llrqr9prm2ukgxKheaADz3XM5VvCdFMsNQIxZi4jqH5qDOD2nv+quvBICK5HuB0EiB6Ka3LttcRBCSSU1Y4UyJvVmYZalJdeNWkcpBalOy/vOdWhS9L6McF19fR3SrOV7uIqxFs+7OXoOwUNISq7RHOfxlXsEN3iMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=edX28lgu; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="edX28lgu"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad21a5466f6so52726866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746738587; x=1747343387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wt3w+Gn0EgqSBVHw6lctS6c+Nq+52QzX7+ZirB7/L34=;
        b=edX28lguEaflIKXX08fLX+sw9WNyNHPazoyiyRPyg31tnuNVqqnyFlVIk2XP9iJ9uz
         o3YArgU+qZw+35Tm92MfsJ4Pqt1UvVKaA0E5m1e6YJyno437qHRGF7/ACZJ3rnFmUVne
         fOgIoqRrWRoNwg6Z30Izr/qfq3OX7BlN74CKiCVznsn+QkArKQRZANzaRfQKoeWcRe3l
         VPmi5krrklnJE1U3O1UuoPYsPv/8pLurqrJULBj2ZMrq+AxfE7XZyfP7O819qhKmoYId
         H8aI/JqOD+myUqnYi4zBoApiSbLDzXoE+MXdpFZ6hh2DnRjf6fXlP/NxaNIIqB6DvMEd
         gunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738587; x=1747343387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt3w+Gn0EgqSBVHw6lctS6c+Nq+52QzX7+ZirB7/L34=;
        b=Rk9rIU2ITeHfcaRBuMA0AsliOnsJwaOixkOR/lRD+ikK3iFTsJ4ICP4rHX/vaaUsZN
         VTQSX5dBOgeS15kAFaaWxnNlUt5dIGuT+dzvUFkNlrI4pTO9xMXzA/T7ZLLqrraEUQ1m
         MpwwHR3SsFi3/e696btGdUOzT2+fKNq6VLQN7faJPHfYdmD/595rh43bNtrItqmuvyYq
         A1RxD51M6LZrHSYebAw05mY9HVCRk5MsncVIlgdFGO7H615sVXe9aT2R3EDZXlnqhgTS
         QrrLhDYGC8PkpLHUNeu/IPBMBgaU/xJ6KZ9FLuQ9V8KRGYA+6qDwLpnZz2Y4NM/rRoqK
         rk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYxXL2tUZAudZtF0cznvbcrenUDFj2hTSa0d6uQQcfUCM6Aa88J9stYzlXuiGsdv4S9XZDiTsnFKKA6Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvJjdCksn3Z6o99xTgnLR6AiQYMWPSWbeh1eWSbVAjl/OkDheW
	caBBEUhvTusMNdg9rFy0JTFJfHXDbx3tpV7NcdZWCihaX3VVEJZOP+983vVT/Xs=
X-Gm-Gg: ASbGncvalsnREhsBxXL51mF+oxsbhtQMQokAusSCNsLHhjQn7xKk0BqMaiJLj/Nq3ql
	Whjdwk3NYnKbRQTcBYqdQXDPPToe2qCSnwpck4eSXELox3hDaEU+HO3wE5O+YXbjtKsLMw5cPFE
	s9ecrtKvHOO7ZVJSHZkb62hZLEm3fhx7bDCmdjXlk9EfRuJjxcvChKPAaq6YziImjI9zUgInDbp
	WQE/4st7hjBYmPivMReU555i1mzioBl19J7iE/luSv0yeF4Lb3AgZgT2iPerERiTe/mKLqTyCjK
	5cuOMv3uHrU7WKTkUwd2gl7Q4YA8hC4nkZnZidpXyPVujl9T8eLoWCZY11oLHVBtDyKMOWUNV+O
	Nl9RFBA==
X-Google-Smtp-Source: AGHT+IGtTDHi/AvD/8xVF94y9tqkLvaBF9rJtu3zqfIKtlmqKgx0l8+YKQe7od5kLKnDVvo8pbUjMQ==
X-Received: by 2002:a17:907:7f87:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-ad1fcbdb0afmr453119666b.17.1746738586640;
        Thu, 08 May 2025 14:09:46 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe4c83sm405206a12.8.2025.05.08.14.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:09:46 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 8 May 2025 23:11:14 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
Message-ID: <aB0d8kNVtAEoW8Ts@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <aBtqhCc-huQ8GzyK@apocalypse>
 <779ae10a-3174-4dbb-9130-008393b59745@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <779ae10a-3174-4dbb-9130-008393b59745@broadcom.com>

Hi Florian,

On 19:10 Wed 07 May     , Florian Fainelli wrote:
> 
> 
> On 5/7/2025 4:13 PM, 'Andrea della Porta' via BCM-KERNEL-FEEDBACK-LIST,PDL
> wrote:
> > Hi Florian
> > 
> > On 09:32 Wed 07 May     , Florian Fainelli wrote:
> > > 
> > > 
> > > On 5/6/2025 10:49 PM, Andrea della Porta wrote:
> > > > Hi Florian,
> > > > 
> > > > On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
> > > > > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > > > > Add clk_rp1_xosc node to provide that.
> > > > > 
> > > > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > > > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> > > > 
> > > > A gentle reminder for patches 8 through 12 of this series, which I guess
> > > > would ideally be taken by you. Since the merge window is approaching, do
> > > > you think it's feasible to iterate a second pull request to Arnd with my
> > > > patches too?
> > > > 
> > > > With respect to your devicetree/next branch, my patches have the following
> > > > conflicts:
> > > > 
> > > > PATCH 9:
> > > > - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
> > > >     reference at the end, my patch was rebased on linux-next which has them
> > > >     while your devicetree branch has not. This is trivial to fix too.
> > > > 
> > > > PATCH 9 and 10:
> > > > - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
> > > >     added by Stefan's latest patch for RPi2. The fix is trivial.
> > > > 
> > > > PATCH 11 and 12:
> > > > - arch/arm64/configs/defconfig: just a couple of fuzz lines.
> > > > 
> > > > Please let me know if I should resend those patches adjusted for your tree.
> > > 
> > > Yes please resend them today or tomorrow so I can send them the following
> > > day. Thanks
> > 
> > Sorry, what's the best wasy to provide the updated patch 8 to 12 to you?
> > 
> > 1) Resend the entire patchset (V10) with relevant patches updated
> > 2) Send only updated patches 8 through 12 (maybe as an entirely new patchset with
> >     only those specific patches)
> 
> Either of those two options would work. Maybe let's do option 2) in the
> interest of keeping the traffic low for people.

Could you please take a look at this:

https://lore.kernel.org/all/aBxtyvI3LUaM3P00@apocalypse/#t

besides patches 8 through 12, would you like to take also binding patches + clock
driver (patches 1 to 4, if Linux Walleij is not willing to take patch 2 himself),
and maybe also misc driver and its dts (patches 6 and 7 unless Greg has different
ideas)? I know this is almost the entire patchset, but it's getting hard to escape
the dependency maze.
I'm open to any alternative solutions, more details in the link above.

Many thanks,
Andrea

> -- 
> Florian
> 
