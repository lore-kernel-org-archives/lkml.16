Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8696119F464
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998008; cv=none; b=kU0jMazh+ifc/X07VSTazJuKkw1utIItLa9dcBwpJQ9O4vTaTnjORdgiA7xmnHh9YNeMWmUPkbtY9dnf0Guzn0CZh3cXezTJe4jAJuXXckU6GhDzT/NCMJ/Bzk/m82RVfMS7j7g9ilTHTJYpcVhzCixYfcMoi8uNs/Qrdvc7j/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998008; c=relaxed/simple;
	bh=Bywu6j0HbIsPAlpNWsToIMMEgl3Z/F3vQHuhinAq66A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CvUp2czVEEHIHKqSfdke1hDG9MsdAr1u0J4VwMG64dXuGNhlQuQdWNt0OZRO4ugoiSg86wKz0HJtkPi0rA10K82UGWjRKo/CuIGFiOOuwax9dTLGem2G8xfEObRjKF9kku3YZiXZG4rE8Uq+7LT7ixR/4eY3xuDRcVxIS4BJKks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=egiaaqk2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="egiaaqk2"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54d98aa5981so2498707e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750998004; x=1751602804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bywu6j0HbIsPAlpNWsToIMMEgl3Z/F3vQHuhinAq66A=;
        b=egiaaqk2bbXNXUCRxobDGH7YBgWjf3HYdGfhbf3mTgHP4W8blFAUqxn1pbEss6rVyG
         y8fW4rqWmulxmAnuv63zUWB5MWPuZChbW/gpypjgBmNHLhVGxqrScfjVFKV2ei/JPeyz
         HdghjJ20tG2ik69FvZSNlZv8JMK1NwUDzb6BWEhJXUzHjfTEfTG+39OyZaw+h9XvtrBD
         bHrf+7Qi9HtLoJ7aqaknhQwS12Su2ZFC03YU2USr8TlBl5AEzbNF4Y/ho4Mgp2d1jWry
         4CDN+p63cK6NEiyEdTsHcAgIHIuLUYUKG/lJfgJQI26zwLMOVEGuRa0VrdTaj024+wn+
         x5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750998004; x=1751602804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bywu6j0HbIsPAlpNWsToIMMEgl3Z/F3vQHuhinAq66A=;
        b=j8xCQmKVSLRbPzTe8O7vSEkR+R9SqLybgfmpS4STwtkkMCXlscZOgXjv0IhMjhTxQs
         arr9p1ebOgHyvNQDPrXgb1Pq6AXcIXsQXFRHzjMxoN4KghEhlEXY7tWhu+3rpMZ/fTFo
         awOoWfekAuzB9WoD0P79i21RP+Obuvtsd8XQAmp4R4j4ESI3lYavaDDK26cmP96FNFFL
         h3pq7osq9cA3qR7a7VtEc+Ud04oftC39MU+m++LIytYAt0jOXT4o/0CIcIRTNUbFOHpR
         98B1SJVUeqN9CfwfwlrNSGUn5B1L+uBEqX56tY26CadBt/QBB6aZ0o/mu53RfM/olyom
         FdqA==
X-Gm-Message-State: AOJu0YzE30tjSULSigW0brjlKGlOJ1Lz1CGyFE/k2Y3s6GtuSjILp+9t
	fWc8RXwdCo4jXro1bdYdqHC68jY/N5hwoq7t+2V6tCsc+ZKEJulucHuHXN9loeA+i8dJEBZJjK/
	5qdEdkiGKXye21O5jq3rU93Lu8uwZtdnD6sXsNiw=
X-Gm-Gg: ASbGncuPpUTuJDdl7OKcRpPbMJZ6Pf6FeJwBF0C9iUNYGj8k0ouR12/1PX3DLC5Ada4
	h4jRX3kOuGMPTwkMKFV2LssO9uvOQ/tq8wkGpOZSyQSoj2KqUMtvjmdZyMEE3Z71guxIfPz1Jor
	9kab14X28gETnmofu62KaosKJi6Ox6lxefwQqNOz+vGcBS31bxnR3dvXaqNc4GQzV1i8w6XQq+
X-Google-Smtp-Source: AGHT+IHXuUArN8UoT4j0aLTtB89A28VGlk88zknNyBmOEGdbA2ip40r7uiTk/NJBHZ+YgwQfm26ze2jJmJ5NPxirzYw=
X-Received: by 2002:a05:6512:3b98:b0:553:a60d:68a3 with SMTP id
 2adb3069b0e04-5550b7ec87emr559513e87.2.1750998004390; Thu, 26 Jun 2025
 21:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183757.932220594@linutronix.de>
In-Reply-To: <20250625183757.932220594@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 21:19:52 -0700
X-Gm-Features: Ac12FXyvw4qamfbPiZds3S1Q4Vx8Ew8kUJOZuEjXstXaqbjlX5KatdShOECarMU
Message-ID: <CANDhNCqJPfkJ_wzi+eOuJv3XzqEOKxozY149ohSqUWe+F+_rJw@mail.gmail.com>
Subject: Re: [patch V3 03/11] timekeeping: Add minimal posix-timers support
 for auxiliary clocks
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
> Provide clock_getres(2) and clock_gettime(2) for auxiliary clocks.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---

Acked-by: John Stultz <jstultz@google.com>
