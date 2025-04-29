Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CDC229B05;
	Tue, 29 Apr 2025 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745946169; cv=none; b=CVgJHVeWRy6tW4q+ft+fGByEmu/j1XCt/xv8gbVLiqfZG/JFzNudOO/toIakLXzUA3u/RuxstqRA+45PMwcsC9HWXhkyB0sW0FolyJj2+euknENem7OZb0CYZ6vEO/HgkhBLxc2BmG9rTKVBDSV3ebEG4HBLrkOzvqrwVTAYuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745946169; c=relaxed/simple;
	bh=6UX2TPQeyyaW6QYwF8k3VvFaw1V+YcGOAb0D2eR0MeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rz338/78eQi+iA+jQZBeiNFFhXckGods4N4In0k33lcs0L311fToLF3olyn2sL0yho9jalWljuIa08urDE7vJ9xPHqG4nR0yKd+BNSYqVnYHPvOmdV8AWQ1cMRxziaXRNTpNTwO7UYf8R/+vcVSsSFEUEfqDsFzh9eqUhWx4Hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZ72FXn5; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZ72FXn5"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7394945d37eso5460987b3a.3;
        Tue, 29 Apr 2025 10:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745946167; x=1746550967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5DxCVqcGucwh4N3hivAkEJoUPhsQ84ofXfBNoKwfSE=;
        b=TZ72FXn5e3ECqLpBR0uCZw1qRCbJkHGs37z7O839zENnQbtCbVvPuLSF0yLr4ua70B
         yEkus+LHCUmAExXE7VhQnialRD0EJkSmtvMgqijM70TXApk6aPRofbY9ltgzGlLHBAqp
         VDwaiSSiyaE3p8c4xgvUJs2Uf2VWTk8cIYzyDwwb5J5KQnJGktx1ZFVXyNZMxsgpL+od
         RLmA+bTCKgFkg58TAE3WyINOoSCeEgEbCKPkIThhZyqgoTICNUCWwx9+t/pPjDtelxWr
         SO1xdX3bOKgY1WXQY9CT/WY59aO4TnPlh9UcnhxjpERb0CffZeM/PsyyiLOEVsVwhg8/
         RSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745946167; x=1746550967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5DxCVqcGucwh4N3hivAkEJoUPhsQ84ofXfBNoKwfSE=;
        b=JuJ65b+hFKABSIvCkmR3GqAkY7ZN1UGMSF5Bs8SWCI1wPZ6C440m+H79EzwZbFyPMA
         LCxykva07Bs5LEBs9/keoRWYekUa1EXU+H3tNUNsdC6K5KtmlL9SzsCVE28BXAXda8za
         xiewii7LKN2QF4ohV7hDDkRlVE7vHkK/JBltG2nHV657HeC7l5UAQMgBAxcAeE0nkFd9
         Aznwjl0u0UgeQ5O7VmA0HxysS4nAK2Tdti3NjYGAUIB+SzL6m8E/ujfPiFRCxnEuGGnF
         pYBw/G/40Zv9yd2QX/bGyT70+h3745u9bu/z6blkIwZrzKNzKWssvY6oK/AU5bHMZz7v
         SnqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtacuuE3QGk/CyYxhdWBh1rtKMV4QToJ3W+yyxzObFJm/dO3oRtRvi39VDUmnk7eWpx3jRyZ9E9xjXgNME@vger.kernel.org, AJvYcCWIGCaeykdK7cFCe8NA1XIO3/h5BHEKhcotjkox39Lumwt+B/hg/aufaXq1tIZRnBtXBy46oB4klsV+@vger.kernel.org, AJvYcCWMt5lBF214AAlX6Tmc1qXTed6sOt9FPK6jvO2MybNtbj6IXMcqsOEL6qupCQlUyBRVNktmh74kzSc0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx8N2KwVzdbay3C/1SoBkWMEyyEw1GQN4uDTTC9T/9Yr3q1iet
	Z2g5BQpnRNNSW8gnXKJWTTMPKXjH1MmycXyRkokSD43zWcJ5RtMi
X-Gm-Gg: ASbGncuxgT6mTU7lKpviCdEdCnUune4gzjh8q9enZjG1Jo1CjrnDevRM/mVj9NeeXbK
	b5jsCkdrdxoIx5RiKBbyK0jDLte33rs7g0Jg53KQyZEIeOO9q/+l9gthjC8l2Su72h3HpRAIuGC
	BYvwOz6cyb9OOgR/1/gAAVtY1j2WZqt/mpGb/G7E5Sfj1Ear4oL8DU1dx9afN+71c9UwMFShnhm
	4LMLLsRfOm/LDce5fUc68LV9bnxCAjRvCRUcL9CByb/6YHl4GEIXqsZs0fk2M+fbyy1qWDxplQu
	K/3n6/MSuW23Zsmkg8K1e56XQjRaqi0HPZs474MEpvNLwJSdvc5ljw==
X-Google-Smtp-Source: AGHT+IGkGtI96G7NWFN2E89NjJR+pbgDvKR6btVNRTveJJNzLLr8FiP3p5cA/1KhvFXQjNJDS77KfA==
X-Received: by 2002:a05:6a20:c91b:b0:1f5:8622:5ecb with SMTP id adf61e73a8af0-2046a6364f6mr21636131637.34.1745946166704;
        Tue, 29 Apr 2025 10:02:46 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912f97sm10216513b3a.36.2025.04.29.10.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 10:02:46 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@ucw.cz
Cc: andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Wed, 30 Apr 2025 00:02:20 +0700
Message-Id: <20250429170220.8145-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aA/ineUBAM5IU79J@duo.ucw.cz>
References: <aA/ineUBAM5IU79J@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 28 Apr 2025 Pavel Machek wrote:

> Hi!
> 
> > Thank you, Pavel, for the confirmation.
> > Thank you, Geert, for the review and the question.
> > 
> > I would like to make it clearer.
> > 
> > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > 
> 
> > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > >   and update the title and $id to match new path.
> > > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > > > >
> > > > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > > > Thanks, no.
> > > > > Please, put into the cover letter the meaningful summary of what's
> > > > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > >
> > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > > but...
> > > 
> > > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > > wiring detail, and should it be exposed as 12 individual LEDs instead?
> > 
> > The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
> > It is not just an internal wiring detail.
> > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
> > pins control 12 LED dots individually through scanning. Each pin includes
> > both high-side and low-side drive circuits, meaning matrix multiplexing is
> > required for proper operation — it cannot be treated as 12 completely
> > independent LEDs.
> 
> Scanning is really a detail.
> 
> If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> 
> If this is used as a power LED, SD activity LED, capslock and numlock
> ... placed randomly all around the device, then it goes LED subsystem.

The LP5812 is used for LED status indication in devices like smart speakers,
wearables, and routers, not as a structured rectangular display.

Given that, it seems to match the LED subsystem better than auxdisplay, doesn't it?

Best regards,
Nam Tran
