Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B41BE871
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998390; cv=none; b=rgKIOqdKQbEGQ/CIaKDWQ9wLItz5HvV6MpXSVOD2eFig53nyTspEfQ1ddYj5xQByNSaatHnu4l3coWTH+J95uUR2tWkH6sGzbEuiR8ZnDjuqAXkWgkNvBHzCmGcooE0cwCplrqm/wBcavUyzpq6xVM3egVfEixqwyx8hSvbC5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998390; c=relaxed/simple;
	bh=VfNg7i8DnarIz0vddVP/BSr8IV38z86RUZ7+o6IvmQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8xIcGrgAGrWz9WJYN37QgSzOO+9cayY1Iys4/mV8cPRZj2wyn+VkkqSId0vIuRsKzu/M4cskHjS8gtIQBEowDVVl/NEqf8eEi04Kk83jz2bC/woZ30+1j0j6QCtd6Nymcfsa0bV30pJawFGVe8/YH8gDH72qo+5RhmOf0Cmxus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2GpTstop; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2GpTstop"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so15135861fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750998385; x=1751603185; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfNg7i8DnarIz0vddVP/BSr8IV38z86RUZ7+o6IvmQ8=;
        b=2GpTstop6QMTk0pSOfbkzxb/r2vJXp4ElRxzbfx+SD2kLaZSnCA5kQzDjxBDttnHGs
         lJT5jIH12q8QHH0UvYrKZA1Kq1MF+2QLa3hpjBZGqzQQWspJmIadP5U53mXZdbOiBYLJ
         DbD2b7dOgZxbHMXDRfwWgiF3UgHgCbjWe5UR67/eusFGgPVuBD3hXWg6ZwvnHqu6i/YO
         ij/ojtlQ57wtxgHVMpbdRQUGq3P1N8Ggo1LJpKity7wL7AG3XrW67IcN4qTpePzeS9zx
         ZaVQjZPaAgPkcA6E2TEY+U1MWpnyBQifKTek1N+aCAt/4/MX4Uc14+pGFyIwdMgG6nyW
         mxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750998385; x=1751603185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfNg7i8DnarIz0vddVP/BSr8IV38z86RUZ7+o6IvmQ8=;
        b=eaggoE3sQv1fjwjcVCQMUoUVPwkA6hJK4sikclWRzK+lJPAxr4fxUuEXL1JonzACSJ
         IEa0MarwHKBsid6e+HKqUO1PARHXF21yrCY6bcySHlNMYvB1JU1gpc9NxMMkltbNGX/m
         Yx9vsMqkRbbhSHtc37dFRbdaaF5ZG/YPgzm3QAZX4FuK/hEnZVE8AC3ZOMbC5UKvO7Sb
         OxDmtruzJHlRLIwN3+KPiBcu61XTe/RJ0TkQRSzaZauF+wVKluaHqFPgcF5GmQevFMVy
         aWjYNb3JkneWqPVSBpkuxnjcb9apnxWJyZdxz9L3uJZu+r76MNVWcnv132F+UJ9fYqP3
         5g4Q==
X-Gm-Message-State: AOJu0YxDi0zgzPP1PvC+7s8muS6doYEInoS5S/JAIbqPrim9wHlepTjs
	Af7W0KXOqwLZbvb+EOxQda+E9+2rINyiV9AaBi6N8FYOHeUXEi0AO9pkABuEPh6Ajn/VGBdVYfa
	nCDXP8PKltSEoXUZDN7wt5UFEVVk9q06a2n/l5aY=
X-Gm-Gg: ASbGncsB1KHZCnCPxDoy5Mcvgj/Om1ENzs1xBIrfaUwV41A/6HsnJItB0eYXHmkAf3I
	S8514avN0jPqIQMi3QvmVcAM4+dNEDnJhWSoApJm5Vj1uL6jClKr16BtiqrTCyDhzge0nCCg7Pp
	G4pqHF2KZuGJyI/C5edZ35p7uHC3crp8829woNTeGG3rKVAN33RFPRn+XJ/gkGFYdnTJUr9QFp
X-Google-Smtp-Source: AGHT+IEN0up3efKrhLZsd3nBpPiaMWt0HTAJctuZuXsO4lV9GjEKhsowTIRAiuY8Spw+0nSc6ymf2ZnARGVEAMJ3rL0=
X-Received: by 2002:a05:6512:3b9d:b0:553:a2c0:da70 with SMTP id
 2adb3069b0e04-5550b9e5d1bmr591838e87.26.1750998385370; Thu, 26 Jun 2025
 21:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183758.059934561@linutronix.de>
In-Reply-To: <20250625183758.059934561@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 21:26:13 -0700
X-Gm-Features: Ac12FXw5F6Tv9EinXUyVRVWX0w62FmgD8aJPlvktltqCpTRwogZjjuf3K6zok1o
Message-ID: <CANDhNCp+Zu4aAy4G__QZd40B2z0uiLJ=WSa_6h+bQkeRE3Ga-g@mail.gmail.com>
Subject: Re: [patch V3 05/11] timekeeping: Make timekeeping_inject_offset() reusable
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
> Split out the inner workings for auxiliary clock support and feed the cor=
e time
> keeper into it.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Looks ok to me.

Acked-by: John Stultz <jstultz@google.com>
