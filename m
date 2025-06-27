Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335BE1C5F10
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000520; cv=none; b=uhUsNQhvd5gqTx7fegqs/zibaASsF7f6gegf4d15C551gYiVPr3ubibbIiedHX/z6yJoi6K70OtVlT+ScoRK49b0LsvDiR6g4pk4q3JJitnq0zz0901qX36357VsW+Q3NRkC/9Evi9NQ+ycDi/jkXsLW2ddQGg+xrtBJ8MqlLqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000520; c=relaxed/simple;
	bh=Z3FbewX8QlK07rvYN/BaaHNV4fDQCo+Jqv86OpCEw0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwL+Bkmpw7HL/NsX8jkz3sy7+bTyjqBShcSjDlMEfQG2kWYwOWVmub5x1xlcszdlQy7exIvxoBHYJjKrD2x6mBul9NdtZPDgHwnTtB0v/+XcUeCPgDfERGK3/6jDhai2AkoDS66nDQY2tmseyBdDg7B43B/L41sa7veezHBxB6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ycItnuI8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ycItnuI8"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b51f5218so1946138e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751000517; x=1751605317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKjKjCy0SRZNvK1D86lVvJiAl2KlWhOCZZnxJO+0yho=;
        b=ycItnuI8URYG91Se8BXra7inKvQwORHBopONHzSvQhjQvShydgUXO7yz9HNR49ktNy
         p5PR/c+rqxVPNtrt2kYLyqXyhAfvvFUUKvPJRULSR14P1oAzE4NJUTRBsnJAZCFrVO7s
         moRbCvV6U04rTTyDGSJ8H2RoctY3Bkrs40FLs3r3KTS0afnav4YQMRpvW/yDJd8/5+Mu
         9G8WRYXy4oAqVq9QWCcefxSUYB2+PQu2/AqnL6+804ovy/b1TNQ58MjPa0GRBdIucYjy
         QBHOgTU5KAtTTHNDYain7WRACfZ5lo6/Rxd2IBKzva/l2EEkL+yf9CTIh94rs50SsQyb
         tIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000517; x=1751605317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKjKjCy0SRZNvK1D86lVvJiAl2KlWhOCZZnxJO+0yho=;
        b=ttg+c0VAwP3BY1GwaSjltqr95p8iEXTmY6McB4RsdHnn+bA3QsGyPeCwlYhUjo4whp
         YtnVpop3jGlNh3Gc8yTSmHEOBaCIAuJbfUROgNdxa5DLsanWcqkApECuWrN74pNMLE8f
         FPa96oshZhbw10XH0lCZcP96nPrHp48fRhGrtaYnhU7ZCPxrtIGJhOOdLefu9CKaXGs5
         a/oA3IiC3IxuFg5SMdFnNbJkTdHKYXigP2j1irnh688+n480QPEjThjvzd9BVM+ID5E7
         RJ823UIf9mfdAE/DugvFQbOruDHuPLwXM/US0b+VMP9kAWq9bxFNB0HJcqe2hr4qRjHb
         RwRg==
X-Gm-Message-State: AOJu0YzvtLQU+kGQIbiaP1QXyv1Xnp358BCpQZHMpAdUFQDLNwvtVaiD
	NcBbfBuZE++Lwnepx4bJlm0B8mgVPVBy2W6Cal8zjQsXQvdZYPDuIWY4FHTNPToVWlaVA0TEINZ
	SEwkOJHCQJt7/vKayavL5rTM/JZCG04gysXXZgbY=
X-Gm-Gg: ASbGnctKjgJUOsrt6ga2t9VpUafi4fwhjRimJ1nhHgVQ+h2G89MAFGu1WD11XDG5Mkw
	03jS4qh4ciWyev1DVNums6T1eh4g18veiTf2csuD3lTVFxmujQJ/w8uHjf0ewBzbdgmTdHqPlO7
	X4jfVo4NriduK1unOU0dGl/VcZgJ1vtSld9Kq4b9GSQdUGynLAJZVFpAPyqsAa4vfRbQjgW0vi
X-Google-Smtp-Source: AGHT+IEHs6nVqj1swP5DaPQYt5yJHxac9/Yjg4QyXlE/hTdB/XiNJ3W195Tx8y86sMh3C+YAwIxMBcQtnjr556e4AJE=
X-Received: by 2002:a05:6512:220d:b0:553:65bc:4232 with SMTP id
 2adb3069b0e04-5550b9edf7fmr701066e87.31.1751000516969; Thu, 26 Jun 2025
 22:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183758.317946543@linutronix.de>
In-Reply-To: <20250625183758.317946543@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 22:01:45 -0700
X-Gm-Features: Ac12FXzsDWO6JYo14Vvw0pilvx6WlxJJ95tYAxaKnJ44M0hc4eUPKeoJOV22TSU
Message-ID: <CANDhNCoNCdJoC6X1yz+EHC5dp4+nJ11vnDj_s2Vp5=oHfxXnhw@mail.gmail.com>
Subject: Re: [patch V3 09/11] timekeeping: Provide adjtimex() for auxiliary clocks
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

On Wed, Jun 25, 2025 at 11:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
>
> The behaviour is close to clock_adtime(CLOCK_REALTIME) with the
> following differences:
>
>   1) ADJ_SETOFFSET adjusts the auxiliary clock offset
>
>   2) ADJ_TAI is not supported
>
>   3) Leap seconds are not supported
>
>   4) PPS is not supported
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
