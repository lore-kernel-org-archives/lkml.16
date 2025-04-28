Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9668B2951CD;
	Mon, 28 Apr 2025 17:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862002; cv=none; b=S2L704dVvIbjAe8U2q+5YtgnFg7FNfxBQJrjoKieFC2OCiGhezMDQdEb5uq+fD/mc8TwW6j5XyT5oPk+8rjGNa0Obhapcah6KavY6UPxGDkd09aFlMl1+nu5SY3RHYqrMsqX6SQ2LDlRVwHCRdL+k/H7jkx1oX4anfqG3EiVfRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862002; c=relaxed/simple;
	bh=u3kRpxX+dwguY5cKTFBSVH3h/qEQNbBinsO3CqrE6Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mUJzEmZIvZ1erw4j3jzs61QiBHN5R1uPgLne6ErR+ceVBer/TGeXDzEzjwedHBi12kBI7aNL3jhti6lH/BRAAoo5q0dilsk1igIzpvGwKHXwV6NQ9dxl/4ALgjcHKTdx8PzT5muR4OQ9nRA1oD+2FIcNYM/u4pMP2PJri2Gvn0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI6I6CV6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI6I6CV6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30863b48553so5697121a91.0;
        Mon, 28 Apr 2025 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745862000; x=1746466800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkZM0DTdnAiuvM8+UD5o6XjxAdhuknzBZ7aUuv5ED0s=;
        b=AI6I6CV66/1Nqr2enuQaj4/pjDPvE/GdCulCfHgjXJBEZDKM9iBqMQxffYaCUxAI5N
         fEKI8gpXvUz80e94kuA+dt6eky3Dqjdkvuam+gj0nx2qQMwv3uuQ7gg2W7Ryr9Ojwpe0
         ri2Qy+RhnLa3W/iimKxsgWxk49eRp0ZZ9l5Z0aGGRkR3/1nvlFY4LlJyGUKrqsywe1F5
         NuZ9fqEbZXqCqz38WUKOGz+boL0bpi6HQw7cf3SM494uFDFj48TDCr/YW4vCtDgHAG+n
         FVFX4oydlviajlK7ET1FqtszH+zJ5hpxlrlwLUFjLkKUHr8SKjDLJo4wWq3QkzWyXYls
         I0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862000; x=1746466800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkZM0DTdnAiuvM8+UD5o6XjxAdhuknzBZ7aUuv5ED0s=;
        b=bNHs4xPQOHUd6fQ3nqOcNhaby3yRjxBxOrP7EcOfDAKnK9OA798MN8zTwc/q2ccagA
         WsAnUmaQ7TuvAOn09/50EtSULmcw16Qq8Exjp8I6Ujg8OmTPFke1hTwzxxMpqRXY3hxg
         NQO4g8yDQ8L1xzINZ+wQhnR2HhhXRyIdVLNGNwUZnj57SGq0gVCPl6vs7/gpd9g5jVDd
         E1vCNOp+F5RwDY8T2+OemDumZQS/c1wdqvEQ/S19QJz7oxVC+86FvunoPdqjGMFoETns
         iV25Sr3F5lN53IjcC3IaSr4MO105q9ZMdaF5DCKRXTNjxK8U1fezT7dlblDtCyzGSMLw
         ljvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU289YU2twL8tEIRj6hd6pNaHFJ0tP2C5DAlXSPf19hRmeOuw70dC8YLRJ65hJdOCGAvQ1LtI3FpnAf@vger.kernel.org, AJvYcCV6Mwe+nkFAyjb/xFhaCJ+OW28ijo4i251hTt+v1YZhVpGxFXvGCwXhkWXIksLAhiJb/WViG0l39mei2pDD@vger.kernel.org, AJvYcCWt/a4N+m3Hy2Is+pEti02IRATmRfRhPFU0kcBxxV1FuxWtQdcEHZw5Ha1YlwQWl+h2cjJWpIisTNNj@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVQqZJipHYOvpGLXRl8m+GUDptwgsOCtbzNt/Gfwu2TPCNLQV
	XZeCmXID3ISBr8ZcdXpZr9af7/xmAYVKZqvBu0KLIw1OzkP3cRh8
X-Gm-Gg: ASbGncuGCgNzBVcqC88pz05xc/icYjlDc1sUAzPy0jERTkW+yu1U/640yg+/BeYYI5L
	kutParNNfa4vJb9EMesQI0agocECAC6RC3b3dnifeDsRW6jPLieDBf+xHOXjq3n2XW7VTAarFwB
	VZ8N/VXoGgRW9C/epRz8GickA04urLwaycStIuGtYBe9UewWHEV9m1jqLmAlCnQPsuNKxCT25jQ
	IMZ18/ZpsRxpSC8LgwARw6fz5z3PqPFA4hPNfPHx8VdaOWkajj9bE8BcgXFG3IWFbxcw/Zylkw4
	5mG8zoxk7EtB/TDD2XdQznFTTkli/A/t8zbpw71cwlYYGR7S7KixUg==
X-Google-Smtp-Source: AGHT+IGAnl22XWZ3hE6CVJurtKTWJl4h3CjdFp9y6JsvA3H9KfOapXTXAl5+O93sKWKawvjCUksDgw==
X-Received: by 2002:a17:90b:380f:b0:2ff:6e58:89f5 with SMTP id 98e67ed59e1d1-30a2245d8d6mr110710a91.6.1745861999664;
        Mon, 28 Apr 2025 10:39:59 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77652ebsm7519746a91.27.2025.04.28.10.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:39:59 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: rdunlap@infradead.org
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
Subject: =?UTF-8?q?Re=3A=20=5BPATCH=20v8=202/5=5D=20auxdisplay=3A=20add=20TI=20LP5812=204=C3=973=20Matrix=20RGB=20LED=20Driver?=
Date: Tue, 29 Apr 2025 00:39:33 +0700
Message-Id: <20250428173933.27454-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4c17ae51-475e-4bd2-8bbf-c5e3233ef319@infradead.org>
References: <4c17ae51-475e-4bd2-8bbf-c5e3233ef319@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 27 Apr 2025 Randy Dunlap wrote:

> Hi--
> 
> On 4/27/25 1:24 AM, Nam Tran wrote:
> > diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
> > index bedc6133f970..896f02b9a06b 100644
> > --- a/drivers/auxdisplay/Kconfig
> > +++ b/drivers/auxdisplay/Kconfig
> > @@ -539,6 +539,23 @@ config ARM_CHARLCD
> >  	  line and the Linux version on the second line, but that's
> >  	  still useful.
> >  
> > +#
> > +# TI LP5812 matrix RGB LED driver section
> > +#
> > +config LP5812
> 
> Missing one tab of indentation on all lines below here:
> 
> > +tristate "Enable LP5812 support LED matrix 4x3"
> > +depends on I2C
> > +help
> > +  If you say Y here you get support for TI LP5812 LED driver.
> > +
> > +  The LP5812 is a 4 × 3 matrix RGB LED driver with autonomous
> > +  animation engine control.
> > +
> > +  To compile this driver as a module, choose M here: the
> > +  module will be called lp5812.
> > +
> > +  If unsure, say N.
> > +
> >  endif # AUXDISPLAY

Thank you for pointing that out.
It was my mistake, and I’ll correct it.

Best regards,
Nam Tran
