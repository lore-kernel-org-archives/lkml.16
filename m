Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7951A23CE
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751225582; cv=none; b=G7cLgexm4uXqIQ2LGZaWI6gMP2jJu5pcWj6NJm+w+Wsuikh78TWvCDHdqD7mipuAXVpI8G0nTCzOAbHj7YKCLzXSLbjiGXANt2LXNTnWZX+NkzmuM9CSkEVEHg7j+gksKmozQUFMsIeFcfGowHSidUjXfSvuQOuPZ+EWFSUha1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751225582; c=relaxed/simple;
	bh=AJLTGfqS/5tOlPMV5XW2523KDBahtNLYAuFkybM609E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBVmn0jR7Qk6545C2Px0K5T49Er0lfWjj9w960CNpYwbek5uxR9upAGKUizwgU1CB8mzc2VoL7BRuU9Ka0We0EglcVTIJ9LQS4qIp7koRE69DwRwPp+b5+C68oOhDUC6Xze3HOmfHTCuuL7gun8AUOSK9UwOd9njOMxdgDxK5dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gN74XoHQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gN74XoHQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23636167afeso9641105ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751225580; x=1751830380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bgLzcaCH/vEPMnZRhHHq+CXVUi9PA+EScD24rqexGK4=;
        b=gN74XoHQmuy2ZZCnEBR4NQRIUvsTmU1ihYKJAOOwwSuAeqE7lkL9bsDLxtYjGgxeAI
         hGR2hL36cCvsHzKKEH9CRbldmXxP11PD3ssxSu1SGRRPIc7A8AFnjTZ3yKB7HOsaLCMZ
         3Ntjp4SemuLFqygzX3yZPTUbSlrsw7M0vvLoQLo4wp5JOU7EhevxVWp0CbYAKwwHdlS7
         7MBc+yzjEiNx5plBnlGESvQclhkfxWj6W/zIAA+KVmUQMPWboH/bRJ8Rt0+oNb0yoCrr
         QfM2/Vw5UTrXMvHCGkB551Mmd4em44ylMY/qngzs5x4DONUGyVeobNGVDL/kQ0xivUvq
         6A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751225580; x=1751830380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgLzcaCH/vEPMnZRhHHq+CXVUi9PA+EScD24rqexGK4=;
        b=kYJjpUJ9z7nRqnAIav5/8gt7/i1v4mesvabV+fFLgeNAD8G40AmYFT+aIrUKafM9U+
         YJHrRV/AQPjWMHEa5SNv1CqBwmEDr2Vkat526re3D6t0T9/EgH7xzFIDsGZKHItAbH8z
         Xw+/mZFd/9+HwBYOPOLLCLbJrfEiN3MVhKs/TthSy/x7qC8nO7ckwwbCDFpZPCcD6kUd
         oGFQxXTSD8rGSbnVOv1XlbBx672ezDlXh23rzbywVIQYvNqTav1tDmr9b5okduyGYEmy
         eHDISKZBHN0WWkBiwYtkSNFBx91wIn7amfGOzwmr+Lv+iC/b7zylJ+4mYZ3+DHAcAAV4
         9gag==
X-Forwarded-Encrypted: i=1; AJvYcCXBxJCtjK+pN3GovFB7GnTg41V2H4gWB1kdsOs/CJnEwkStgBNVyJIHzwxGn8cRWflE8NJDX2vYQz6ha9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHv5k30i5zO4nsGDZ6Eq71tEwnu8wsyuQoZ1clunBiGd6hI+8
	D6xO7bX3PfS5eDoiy3/oxtDh19WjLKNhU9/E+D3li1W+PqJpceYISglE0LWgsUNjq9s=
X-Gm-Gg: ASbGncukj82PMZ2uQJQb6ne4CiuBQO3ts3OHP/EyqROyw1HCjZVqJ6bV6sd6e82IqYr
	RN7fsdM5w0QHtl3wl+TsY2RajFLAUUAvVuMZrC7515H9SPub54TTkx/gzmTOzzvxntAkuvW/MIf
	3eykepDpGGCouqIJqnUd5dA4VMWaTm3g8KSbzgxdDmxRZUWa1Vq7Xkkcp7+gHANI7pDNmvQr0AS
	RyOX0u8ijlPp4ORFcvvRhYB18KJVBawAlAICFylrvyAQao7igvi3zFHDK76WBHY3pKLxTfvS15x
	9ufXEUmROj9HpeDKL+b4fmbIBb6hjThxnAxN5sg0axI6/jvFVrNZn0k4dlhbblrLMMgsGBUv0yW
	2WVBUeaWuOD0thUAPWu83CQ==
X-Google-Smtp-Source: AGHT+IFR5OwbLIe+zzlcoErz34GP7sC9TYblSfNZdc+JTsF9CYaAFybDf1lF35GHnh0xkSJRdozeng==
X-Received: by 2002:a17:902:e551:b0:234:9375:e081 with SMTP id d9443c01a7336-23ac460719bmr160637285ad.42.1751225579780;
        Sun, 29 Jun 2025 12:32:59 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bcd2sm66533055ad.131.2025.06.29.12.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 12:32:59 -0700 (PDT)
Date: Sun, 29 Jun 2025 12:32:47 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] iio: adc: ti-adc128s052: add support for
 adc121s021
Message-ID: <aGGU3+EPIIRkOF8z@dev-linux>
References: <20250625170218.545654-1-l.rubusch@gmail.com>
 <20250625170218.545654-2-l.rubusch@gmail.com>
 <8eb80697-e76e-412d-82a9-5a95d4ca4f2a@gmail.com>
 <20250626192802.0079d579@jic23-huawei>
 <aGCCIwknL25yAyHL@dev-linux>
 <CAFXKEHZcUpEpKPQP0CuJmiw20igrDUUEkB19RyQ=FHRqy+JiUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFXKEHZcUpEpKPQP0CuJmiw20igrDUUEkB19RyQ=FHRqy+JiUg@mail.gmail.com>

On Sun, Jun 29, 2025 at 06:13:54PM +0200, Lothar Rubusch wrote:
> On Sun, Jun 29, 2025 at 2:00 AM Sukrut Bellary <sbellary@baylibre.com> wrote:
> >
> > On Thu, Jun 26, 2025 at 07:28:02PM +0100, Jonathan Cameron wrote:
> > > On Thu, 26 Jun 2025 08:24:41 +0300
> > > Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> > >
> > > > Hi Lothar,
> > > >
> > > > On 25/06/2025 20:02, Lothar Rubusch wrote:
> > > > > Add support for the single channel variant(s) of this ADC.
> > > > >
> > > > > Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> > > >
> > > > Thanks for this addition. In principle, this looks good to me but I am
> > > > afraid there is another colliding series being worked on:
> > > >
> > > > https://lore.kernel.org/all/20250614091504.575685-3-sbellary@baylibre.com/
> > > >
> > > > Maybe you can align the effort with Sukrut?
> > > +CC Sukrut.
> > >
> > > >
> > > > What I specifically like (and think is the right thing to do) in
> > > > Sukrut's series is replacing the 'adc122s021_channels' -array with
> > > > individual structures. In my opinion the array is just unnecessary
> > > > complexity and individual structures are simpler.
> > > >
> > > > Other than that, this looks good to me.
> > >
> > >
> > > Sukrut, perhaps you could add this to the end of your series, rebased
> > > to those changes?  Would save a synchronization step for your v5 (and
> > > later if needed)
> > >
> > > No problem if not, but I agree with Matti that we should take your
> > > series first.
> > >
> > > Jonathan
> > >
> > Sure, I will add these adc121s0xx to the end of my v5.
> > Thanks.
> >
> 
> Hi Sukrut,
> 
> Since David Lechner still asked for ordering the TI ADC vs Rohm
> entries a bit, and complained about the missing binding entry: Shall I
> fix this rapidly and send in another version?
> 
The ordering of TI and Rohm has been addressed in my series v4 [1].
I will arrange ti,adc121xx in order in v5.

[1]. https://lore.kernel.org/all/20250614091504.575685-4-sbellary@baylibre.com/

> Best,
> L
> 
> ...
