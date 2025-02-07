Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635DF23C8AE;
	Fri,  7 Feb 2025 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738944663; cv=none; b=bk5HtcLK5ShHyowH+vKAeIj3GblraumuLLtHBdHbTOGge8N/RUycTJ7gguKypbzp5Zt24o92olVUMxAN4FtpbQ4NYkmYu/pKnXfahHysuTK8SeI3pdxA+k6X5JkaTX3DCyPGZa42VLLmFI2kp0eJaTcHK4u7LwZq41PoVsQuVII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738944663; c=relaxed/simple;
	bh=hM4KkTFOQIorcGH17ZqQK7WrzrOS5j1bcy6TtjLxCQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdBYO9bOvsPE/GpNcoCEiwgvwLQjS3Hmt2VZh7poGSu6Gaq5YoE0WaPLQuMSUbZrAGn9CI4hWeba6Cdq7g3AImSaLZccC7RigYFAXbTy06+GW++b4q3TqKc8joGS03JWw0GqIevZ7JIOz6qiMlOZ56kW0gVwY/SQ3zMP/4GJj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbdhjp9a; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbdhjp9a"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166651f752so51360945ad.3;
        Fri, 07 Feb 2025 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738944661; x=1739549461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EaFFtVuKl1zD656GxgpPJx2+MmyA3YykfF2P3BlKGk=;
        b=mbdhjp9almB5x7qAIQ6AfWRcnvWLXFB6L0oHFAEH2U4yDrQDXjWPPMb1Uj0DMJQuwh
         P6j5x3FEGAMlrK6W10Doz38ns8XBoCBHS3GhtsBkqMxNoN/l7enPg4MkS4ltC6HEQQaV
         sukjNJ2WGNUU7TnzogdahxQh0vgMhFo0eM6695glvmTDGQTSDEtJMyoOwmAdevqjRp0P
         0qWrYwAsMQGOG8hY/TL9Hk1D2E+uJV/yUZ0UXZJOdAXyz8iFe7LdzSqadc9MJmhUVIJB
         MgunyaTgAZXKzgPaWl7d1V+3x4Ovhb6tHOQXCh14iYVrDrFHKwDjQvePR0/uZtqCGEMi
         uZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944661; x=1739549461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EaFFtVuKl1zD656GxgpPJx2+MmyA3YykfF2P3BlKGk=;
        b=bLNsmLYLtOlzBwt//aDjj7XhcV3bpzAOhJWmUA7ypKvIeQL70JInB3zkgUopb7yh1f
         vZudlI+uyP7jI9Gle15kh2fM1QY1N53ix0LtsuLicVMVKfufg0Vv/m56sX29wNiOUdIM
         QqBXVyDG83PlO8d9GY6++P7KzU3NyP1NDlhcCEaUOhxmYMbEgiyKH0sA/FAVtfq5pH4d
         LYOkmDztJRMwUGMKyaXEyr8x8houbIzCmAubHJMr7NaAj5eIdEm4l7RCOts8A/O30MFO
         x3wsgdlpqmytD4EeoDkyl7iIEjotjvktzvJcoeItZRsOgJoLQR5OetFjWsZgnBmpf8pH
         zE3w==
X-Forwarded-Encrypted: i=1; AJvYcCVutJJJdja0aVnBeE/tF5OdgSMVh4TH8JSG7jbQf9f1GWqavR5N2TJ34Na+71PFjEng6IbsyCeOgbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVjfVMeeNzxTzsaQJsmi3yQZlPPnmXjG4W+9f5FpK7EOT9mHNt
	09OW4WZPw4qzT0PJaopI3IjVeOCIwYE1eg6Y/8fbIvJGuAe+Iki//gJcpajqDwYZBEOiuZSO+HT
	RPKayxtuMQN09ZBM+drUTjfhFcTjZ8obwvyY=
X-Gm-Gg: ASbGnctgXPXUSD4+2x7OuS6RZLOoS6Da/gxF4MK9r1gdpqO5fiRfYsol0QXwuYqwPxw
	iq8mGyD4lszno+U4dMzYhkPvAU5/daBlsYYGMPDa1JvYvQR/ZX+gKQRXPHzahFGBk+/eKq0hI
X-Google-Smtp-Source: AGHT+IHCFrfoSu9Oe4fnnns85nXA2llvIaHH7tznuzyRHLOr2ndXK+R3YrgPe/6au3JGoFLCw+HW2VTWBVzvWziasX0=
X-Received: by 2002:a17:902:ef51:b0:215:b45a:6a5e with SMTP id
 d9443c01a7336-21f4e6bf56fmr49501455ad.18.1738944661536; Fri, 07 Feb 2025
 08:11:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAArt=Lib_PiR1z07hb1E3tqq-PG=KVKU9CZP3cPsQE5ciokLVw@mail.gmail.com>
 <2025020708-manned-antidote-7d57@gregkh>
In-Reply-To: <2025020708-manned-antidote-7d57@gregkh>
From: Jillian Donahue <jilliandonahue58@gmail.com>
Date: Fri, 7 Feb 2025 09:10:50 -0700
X-Gm-Features: AWEUYZlMan-_7BObFV56xl5hJlzxWBQF46MSW7cWjm21G2VIf0m_Cfe7bqLJHJk
Message-ID: <CAArt=Lg25QafefcOAGcvj2ZHuQ4Keip70NFSF1K3mau=2Y12XQ@mail.gmail.com>
Subject: Re: [PATCH] f_midi_complete to call tasklet_hi_schedule
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 2:35=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>   The kernel documentation should show you how to use git
> send-email or other tools.

ok, I will use this when I resubmit.

> No Cc: stable?

Cc: stable@vger.kernel.org
Like so? I just emailed the 3 from the maintainer script.

> And this is a v2 patch, right?

I have sent a few out because I cannot seem to get it right. I can add
v2 to the next one, if that helps.

> greg k-h
Jill
