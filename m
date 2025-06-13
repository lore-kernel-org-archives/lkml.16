Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2BF72636
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749773679; cv=none; b=QzdI+AY/hGAaWyCYYhPyb1WgmpSvORokP19y2cetS7AxAoiqBQXV1MbNXi797GcF6SvOa3Q7BxYrTQFAMyUSa6zEREkNsy5K2yRpvJcqSqnwIkPIKyHh0a7jD3ewLj9ihCdORV0NMvffAoBQOTffYBAsiit+/8ymKnkQObfjT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749773679; c=relaxed/simple;
	bh=W95sicYb3DBTHTvhMHg2QIVP9uKVoy9ZGlZkVbqNXxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoWPu5108zs4rnxV3Zb2ROs97Cs+tmMUWTjkcBLOM2tVGpuSb9c6W6tPuV6VocgzfSzaKbUmuBRBkdMVwD+0/tQaRUlpoN1X5Jd+AMB1SQiWecBHO5/4zvXkrqVkcs0PB0S9A5XBIwiExP5zFzeNGCLEsc9Kx6KLzOfoBJGIsOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gjcCqDkG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gjcCqDkG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5534f3722caso1789424e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749773674; x=1750378474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W95sicYb3DBTHTvhMHg2QIVP9uKVoy9ZGlZkVbqNXxs=;
        b=gjcCqDkG/+nPWjDV8HT13gTmFg8QZ4RMpV//zhRXTmaWJTUbLCREWx1xV7T5/6ReIW
         INxuaazjm8rPM+B1yShVPcluW7HqG0pEF45hzKde9gRtfBjHXzGOrri5bo6S3X4Altwi
         JDkzyWXaf+Hag4Ad32UtIuN1dwVK4oUTzbiPZwINw8BAGADnUqPgf5omUkAzHOp6OcnO
         1fqE2gkxhYVnn4t0AgKyipLu7FTxeKcKlpdJni5bMqHm3V1RFhSMhiFQn4c1VjYucNRR
         N578ZwlneVUjMqHADRcvr5EdtAqKAoVOA2InsXlg3CstRVLeN9jGmH4E+vTmBoW+1U6n
         vBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749773674; x=1750378474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W95sicYb3DBTHTvhMHg2QIVP9uKVoy9ZGlZkVbqNXxs=;
        b=Mqp5lIEmGQuo8ZY6EcffE9NmMrThGt/5JPz7HgQi0QsqpassTccWTOBm4H8pRdZSoT
         q8UNMmjxEByH2W8KJ0v9TwIFIYRCi8HGzPrdCpZ00E1+He00LUQSXQOCQolPX73Q9YPt
         2AVJ0na0jjeXlX3WuMX4WTwgM2r22i8NwHHwLe4jx9mbXXS7hGB8p8rBxE5ZEV1S7Cnv
         oqPcGGg0OZltl5wtiw9TxUND5DvQarSCywkf+48nJaQ7hB/qX+7EQ0kWgSIfWROQlqLd
         oLyO9FPEkbobQPxelBDXLtjFG3dVd6wUcxJWkUpR45hxrNF2/pUoGajjYgKdr3NbPxab
         1nfg==
X-Gm-Message-State: AOJu0YzX/Co5uvRqOnn9bHM3tV4Ckrk/FanLS0dkEX/eHHR8MZZjBfOM
	CKodh7mHS99TjWMq9n3mvHDTAKA8TD0g/XdLg7WJ6Pfm+IG4YYGf0U8mE+VLF7nzfaUcZO5/rtj
	M/S4kAZ+AOxqqw497S/518jTRfn/bcuz3hlzZvlE=
X-Gm-Gg: ASbGncttCPfAFjsHmbwNxmVi27lcmzKdGRbrWNJQSPCG9lbQEUKnzqRvA3yFg+gRC2F
	VXZwX5t+fx9Vwh0G1shsJbEVznbpugTiMYpeE49cSKMrIIyDWJ0R4hYv7EpYytq4zNZJz8E0k3E
	5LO9SKTPZQN3lPsOA7ZlM4+IsDuYvM/4H93lfYUupiRs9RTxOf7X9THleAIKfCq6LUbEMYDKNp
X-Google-Smtp-Source: AGHT+IGXfe072/S+IbrdLEVdgbY1mrI48ADBA/gbdqhoZm57Qazo5mnk0mGi8CKpUzjLaZXKIg32S2LPiScek293jjo=
X-Received: by 2002:a05:6512:108d:b0:553:267e:914e with SMTP id
 2adb3069b0e04-553af8f1103mr237080e87.1.1749773673482; Thu, 12 Jun 2025
 17:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083025.969000914@linutronix.de>
In-Reply-To: <20250519083025.969000914@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 17:14:21 -0700
X-Gm-Features: AX0GCFs5q8dW1D4KFUP8MHqTFKr2PwuUJB0Zhfra-q9b68lRNxXBwYSYoWZY8_E
Message-ID: <CANDhNCpouVL82iGnBb_gDVBVkjPs36wx0T0Dp+zPYbatTgeY3g@mail.gmail.com>
Subject: Re: [patch V2 06/26] ntp: Add support for auxiliary timekeepers
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:33=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> If auxiliary clocks are enabled, provide an array of NTP data so that the
> auxiliary timekeepers can be steered independently of the core timekeeper=
.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
