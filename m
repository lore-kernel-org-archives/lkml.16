Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C861DE2C9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000210; cv=none; b=ny58zaieQzYpAcmpzipEkl014AX9sm1k+XTFH1xH703UabYnDHxNeJfb8DsJ1oKgkzGLGD25oq4ACWTCY00024tJmVy8NG6b7Cs2yVRrfIYohXuwgBbfY3rWW40XZUGjTPQJNbygt5pzg9KeXK3Jm80TKdI6f36W1Pu8rphv/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000210; c=relaxed/simple;
	bh=Zv6mkUr/Euphf/sOKT6hhTVY3yWD7uxMOkBVG4NiSjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R80mUZp1biZyosORBLYG9xpPsNlq8+Vdp3uQd2fOlNfrnUGZSSc+FBJ2EzwICO/aljCTsqWZVsD/1/z5baBFKxT1vcOToW6QUySKvGFD79p6WRA4PFY9Mmx0Z7wbCnTycUvXvhRbO+hGurVoqNKRLirX9t/hEBu4MYXmNMngPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qKs9Izyi; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qKs9Izyi"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b9eb2299so2534515e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751000207; x=1751605007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zv6mkUr/Euphf/sOKT6hhTVY3yWD7uxMOkBVG4NiSjU=;
        b=qKs9IzyiNAOboJEot+SNUHhEzuhHsvA1jIrxFy+w9JpE4J8quvwyKmj0wVXO6vok3p
         A40oWC1L+GLfOn2SEfMN7ogMIC2PZaMu8wIlDMSsZ/HYiPsjAc/LjQvLuT4qNltGGBEq
         1yEF8hF4bt0M18zYjpuZn4RyeaHPROIVQE7K3vk1O0aEUh/MdKAMPy98980Uww5duXUr
         K3+koPksfmFpYccegTg7+GK0+mOtUvIFDhC2YeFlPqoJCafJbFCA8n8urCJ5s9Xu/svM
         EQizxr1YsSovG2+jTQiZ1D6jgyNHu60n7pPkit1lbgJX2EAm5mSfEuK4TSV6uB8lmnzM
         aNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000207; x=1751605007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zv6mkUr/Euphf/sOKT6hhTVY3yWD7uxMOkBVG4NiSjU=;
        b=M9opZYCOvIL50GZDIOXkTnXdHtALbyySNRUFOAFFcjms2c8KWwQnFPQhrHCdF+gTtn
         qQAEU1MUyCoCn459cvf7GCDQeTLzT241dYvk65LMXx2AufNBaM0wd25rAOjF85BaR+V9
         HTf3qsOYmocSxkM8dFlhW8xwO7soytn4vItNIQw6Y8ILICmZ6ozqPfhaEgNQ+FlSZtxA
         SJXQYjUdAFuXAErBWGHfGdDW1cIIWVlmcJGn5IKfbSytKFS9YimNFnYWNfGVStge/gSr
         eeHv9uwhBNb+aF8MOKHngLv6Zw2QJ6EJoUmQGvowqjh107WbgK4sGxMP7+CzhkCYF+Bo
         r7cg==
X-Gm-Message-State: AOJu0Yw7wyxjXYI3Gx8a9HorrFD7mvlTS9kxYXYl+qV+4BWPWiM+V2nq
	A13H4Hkr27jjVL9alkg92w0GszAYfMoYMjojjyNwkg+i5jTTBFdRjWA24M/zxcstxWbqq0SYHCk
	2grarsiGgKl5+lSikTx89EK+PTMAfpprMII2eFGo=
X-Gm-Gg: ASbGncs6IEQ2o6+i6p2GuUXPEvq9ZBf9BY4yfqtP+MOeSaHi+dgKkgg09DOijpOP5rn
	oLDmsnuoos4rvz5kajKT2noHHROVaeWUJflpzPGWu+/iebUXcQ12IeHUT8qF8iMWH2zN3Tgw4Uc
	1eQhy2yAzu6kwLAH8S3708muiTdNxcuTnECnRBr912hkPpilzipobVZze7IGTI1hPEfbsHfDwr
X-Google-Smtp-Source: AGHT+IG1WjlZkyIbsccktZjNQrYIsbUfTY10eKJpeHSrD2SHzIU3QkMBbhEO25oUaZ630Tmra/pi6PFRBg57ie5hXyM=
X-Received: by 2002:a05:6512:2353:b0:553:2159:8716 with SMTP id
 2adb3069b0e04-5550c35c0famr449258e87.26.1751000207239; Thu, 26 Jun 2025
 21:56:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183758.187322876@linutronix.de>
In-Reply-To: <20250625183758.187322876@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 21:56:35 -0700
X-Gm-Features: Ac12FXxThCCAUfCE9_7KpBD3nksP3SCcmnqrN5H6dj6J3m5deRuxRVa_3JHc-uY
Message-ID: <CANDhNCqXP-S_ebrHeGMGgE+vqMaAjOzC7p2hzRxff8JrRrpkzg@mail.gmail.com>
Subject: Re: [patch V3 07/11] timekeeping: Make do_adjtimex() reusable
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
> Split out the actual functionality of adjtimex() and make do_adjtimex() a
> wrapper which feeds the core timekeeper into it and handles the result
> including audit at the call site.
>
> This allows to reuse the actual functionality for auxiliary clocks.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>
