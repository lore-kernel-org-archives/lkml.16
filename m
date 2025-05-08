Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602E253345;
	Thu,  8 May 2025 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714438; cv=none; b=DdYe6KICV+qYlq/7YmRUqzyCfS54/17j6E34IMuTkjwkBKrBRz4xkm68pGIYuVsZBHtq4Q624cuVRQGoiZoGK8LmYuTZtD0ddj/aKQLAVUN1Dzet2nb81HZbtF3haCTZIe+slyYyGzSGuEsqWBvfDSkGNgWmsfFXbHYrcvH3V4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714438; c=relaxed/simple;
	bh=inNKiF9nZuE5TZzlboihKKxxO+YidsZDOpnVoEQTlMc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GGp2jAQ1mHZ3kJy6c69moleVQMUVXho26Tc5chAmleP8Eh3gDvMUIfUBRIGht5DOF9mEB8d2L3VQA0F9jFEvJ5lgQeyLb4BOqtwtUqL9lIoSK6a3YTtH973UAuildehPAXuQCo9hOuFULuUy7Jy4fTDHKcSpv2kN/uahuy/m/ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJCiikU2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJCiikU2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-740b3a18e26so551052b3a.2;
        Thu, 08 May 2025 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746714435; x=1747319235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1X5Gjv7/09h4a7I6zwRasGWexPXnv1aX5JDZjLolKU=;
        b=TJCiikU2RfA9OjKddvyB/jfoD2riZ8RVNs9CD3Wg0DbdVHgdqwXqty6TG5CvIG8hZ7
         cuHYf8jGcKezo6Jb44hMli6rEcXmE/s07SnE66+DeX09SwNSLWVSCLl/Q67K20CNF3RA
         sHk5yifyYl98zZlvBPM+fmyim/O8Y8Cf3A2q27Y5FTdP+YAjCRQI2M+CrcgnVNWmZ4tl
         GvbS27s4YZDHNQjix4aic07DW9qEMXkmdjTUWdLOl3WG6FTflpcXQW0bSfndlKBO0/g8
         7Yd4pHcLDsFQeSY0IyTGeXkJXMlaThT3tUUxqHTzaIzbFSPfDht7UUZ0K7q+iA4N1iNM
         uJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714435; x=1747319235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1X5Gjv7/09h4a7I6zwRasGWexPXnv1aX5JDZjLolKU=;
        b=wNlFngrd3d0SH8YuN8SHcKpvlOXNfa3PDxaCVaktHZdvqWZ6C+DTmFWS4kZhlC/JTR
         +DwdfKEKIs0lxsCR3kk74Rjo5UjHDpDB7c8pL4CYQAc3CVGlnnuHNmVhv5GGYPrlucW0
         R65Crky3A9fsbZC+IdrzoWHcluC5fYn3mVvSElhUbQAsCc7Stsc7b1YCmGdoO3RtVdGd
         Enec6228yb9mpw76sVC7KqsccWbgf1FWmykq9YH0M2HurOLHYLg+BcZIJp54cSX5PxFc
         4e9bj9GE7lYcU7QRyxm9ZR/pVcDEGYXxT3UVn/4KGpN8wH666Q0uHriikZ5BG2PCqbUp
         jefA==
X-Forwarded-Encrypted: i=1; AJvYcCUER7Yo6d/aD7nnoz6xXOkgMZj7j1Ureuj7/47JMcraNBC/UzegZZOlhinTG4emrdDNoRq8W0iWKvq1@vger.kernel.org, AJvYcCW0ALh28mZbBqWswhbeB5a4fPzeDjGTz7NJEKzORfnhiQdQzYdibXmubjuSk7uNUn/nb2mle5L/yKWL@vger.kernel.org, AJvYcCWi7JETv+mu/Dq10B8kaaBcRV1Js5rPxXKTdgU9oOxKS6C9NVUsqAgVgbNUz1Nn7VgvhyJOXEC1lZrNxHVG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8J6DXZXXc+fH7rgzpm28BH/gz0+znfg2H8A+dsk0/daSYqi64
	/qCJcHPLbtuyo6oo/IcTOfJGS9LebsYYOuP7jjAihtYql51ZJAHL
X-Gm-Gg: ASbGncuEKreS8LiLE/S0Y2EV23X2IhlLrKh73c7ed8jV8jL1sI5QSlu3vXc46mDSwy4
	b7dOwaoPE24oZAFf3ihWWr+Z8cAiLYlAHpUxDEbmAzAXjgD6n2AH6AFuX0+6hi8iGwBNB8RYSKJ
	uJNdWidl8kPPkcmLqPqnOUS2tB9kiMYciTdXxfqAe78DzTeQVfvmO2hmsJu42ZjtpbWPiFD8rRI
	o+EO/Z1vW4hyt6Td5z4aRwQiFZY61b0NJ0Sw0+eKjp70QUb0Qiu1BR6Vj4bMzVS/RLo2fRHJ77s
	4vZRJw7oOGdpAn29Oykgec80RIedlkKK79WFL+pgd2J2v+VOsYPVVA==
X-Google-Smtp-Source: AGHT+IGX69fKV8SIz5ble6uUkvbicpRW5QmwPdXGWbWOXvCG1vLa4lPWJgZNrqXL8Q3jFUOwyoJcKw==
X-Received: by 2002:a05:6a21:6d83:b0:1f5:86c6:5747 with SMTP id adf61e73a8af0-2159b05448fmr6089580637.32.1746714435380;
        Thu, 08 May 2025 07:27:15 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b62502sm11383288a12.32.2025.05.08.07.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:27:14 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: andy@kernel.org,
	geert@linux-m68k.org,
	pavel@ucw.cz,
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
Date: Thu,  8 May 2025 21:26:48 +0700
Message-Id: <20250508142648.7978-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250508132659.GL3865826@google.com>
References: <20250508132659.GL3865826@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 8 May 2025 Lee Jones wrote:

> On Thu, 08 May 2025, Andy Shevchenko wrote:
> 
> > First of all, I just noticed that you excluded Lee from the
> > distribution list. Don't do that as he is a stakeholder here as well
> > since it has not been decided yet where to go with your stuff.
> > 
> > On Wed, May 7, 2025 at 7:42 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > On Tue, 29 Apr 2025 Andy Shevchenko wrote:
> > > > On Tue, Apr 29, 2025 at 8:02 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > > On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > > > > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > > > > >
> > > > > > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > > > > > >   and update the title and $id to match new path.
> > > > > > > > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > > > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > > > > > > > > >
> > > > > > > > > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > > > > > > > > Thanks, no.
> > > > > > > > > > Please, put into the cover letter the meaningful summary of what's
> > > > > > > > > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > > > > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > > > > > >
> > > > > > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > > > > > > > but...
> > > > > > > >
> > > > > > > > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > > > > > > > wiring detail, and should it be exposed as 12 individual LEDs instead?
> > > > > > >
> > > > > > > The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
> > > > > > > It is not just an internal wiring detail.
> > > > > > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
> > > > > > > pins control 12 LED dots individually through scanning. Each pin includes
> > > > > > > both high-side and low-side drive circuits, meaning matrix multiplexing is
> > > > > > > required for proper operation — it cannot be treated as 12 completely
> > > > > > > independent LEDs.
> > > > > >
> > > > > > Scanning is really a detail.
> > > > > >
> > > > > > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> > > > > >
> > > > > > If this is used as a power LED, SD activity LED, capslock and numlock
> > > > > > ... placed randomly all around the device, then it goes LED subsystem.
> > > > >
> > > > > The LP5812 is used for LED status indication in devices like smart speakers,
> > > > > wearables, and routers, not as a structured rectangular display.
> > > > >
> > > > > Given that, it seems to match the LED subsystem better than auxdisplay, doesn't it?
> > > >
> > > > I have mixed feelings about all this. As per hardware organisation it
> > > > sounds more like a matrix (for example. keyboard), where all entities
> > > > are accessed on a scanline, but at the same time each of the entities
> > > > may have orthogonal functions to each other. Have you checked with DRM
> > > > for the sake of completeness?
> > > > Personally I lean more to the something special, which doesn't fit
> > > > existing subsystems. Auxdisplay subsystem more or less about special
> > > > alphanumeric displays (with the exception of some FB kinda devices,
> > > > that were even discussed to have drivers be removed). Also maybe FB
> > > > might have something suitable, but in any case it looks quite
> > > > non-standard...
> > >
> > > I understand your mixed feelings about where the LP5812 fits within
> > > the existing subsystems.
> > >
> > > While the LP5812 uses a matrix-based structure for controlling LEDs,
> > > it is not intended for displaying structured text or graphics. Instead,
> > > it controls up to 4 RGB LEDs for status indication, where each RGB LED
> > > consists of 3 individual color LEDs: red, green, and blue. Based on this,
> > 
> > So, you probably should have started with this. As I read above that
> > this has to reside in drivers/leds/rgb for colour ones which seems to
> > me closest to your case. On top you might add an upper level
> > management to prevent users from using patterns whenever the LEDs are
> > requested individually. So, this driver should represent 4 RGB leds
> > and, possibly, the upper layer with those fancy stuff like breathing.
> > 
> > At least, based on the above it's my formal NAK from an auxdisplay perspective.
> 
> This is fine.
> 
> Just be aware, before you submit to LEDs again, that you need to use
> what is available in the LEDs subsystem to it's fullest, before
> hand-rolling all of your own APIs.  The first submission didn't use a
> single LED API.  This, as before, would be a big NACK also.

Thanks for the clarification.

Just to confirm — the current version of the driver is customized to allow
user space to directly manipulate LP5812 registers and to support the
device’s full feature set. Because of this, it doesn’t follow the standard
LED interfaces.

Given that, would it be acceptable to submit this driver under the misc subsystem instead?

Best regards,
Nam Tran
