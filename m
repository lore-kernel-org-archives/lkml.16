Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B241C5D77
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998242; cv=none; b=D6pzP3QSvjf2g1yMYJWJ1r/XrRcuYtDiVcyaM3IOIw6daj9QQwwNEwX/dOVYnLUuiNlZCDzNGPlxGO7ONCbB5Mo78On+7g5N995sZU83GkET8MVNxP2JVRZT7aQQxU4OqO88cePXXulxMKnqzkH1xeYjy7kBRUevuXapGhwFrAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998242; c=relaxed/simple;
	bh=AQk8u+AukaF097t6/dIKRIcXHl5qFFYU0nRqmvxCwTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYMAi3e7FHPhIqrbi3vKGVGHDKYUFS8pJUswDYVWqnx1q/6n3pWxAY9xncDhRQ6sC+u0g3IqySLGF0yxPeDB7U9ov2OuQ5m1zbE0YVRPyiEoQr/5OJqnTyBPDte7VZjYb/Ce8ksmBSBRBUVeHI9/o9S1QDLVhk/Fqz2GUt6Z/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SJuc/hGO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SJuc/hGO"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b6a349ccso1919878e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750998238; x=1751603038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQk8u+AukaF097t6/dIKRIcXHl5qFFYU0nRqmvxCwTg=;
        b=SJuc/hGOJNhUK27NV1GiW2kjlcMttBuZzKSS1HSPU1NUhdKe95SxyaxZz8rx3WU5+S
         DPHZ9gGs6DoSP8L/n/KTE9MATC/ZlTVX0G7ZJ+/eYGxxVjK97KMETr3Yoqe4S7DfkEXF
         uqMVRaiE6dq3lTehf6V7BUuhm7Io2p2hu2sQsyZsB6axyIj9c4qlMYCBVcgRGq20akQX
         3w5wNSb78Hn+vxtPJ7gW9CMVASfYkKd4Q+bKEMOuGR1S0p11izDeTKhb2tVy79VXFJiC
         8C2IMa0p3edS29zGiPziJDVJUfsmgzdB+yK00S0jADn2RDc7X+a0LAv/vRmIcZ5Mc8O7
         TVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750998238; x=1751603038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQk8u+AukaF097t6/dIKRIcXHl5qFFYU0nRqmvxCwTg=;
        b=v8MfOJuIrvh9mSk53vJ2u7fjTtlSDIeIiNobJcCsaL8aXxajG+Ix2JttxD9PVcxzCb
         KfS/2HAufpidrBzFUUV13l5jRiUvZ8NLVwsTV2Rx6RXaubt4IuxwzYsfjT2w6D+QhHEj
         ayW1kE2APWNE0HkTk0GJOgG/MFZzwkTSYe0qgS8j3mi/dm/psVwZQ1iRy5oBMGFvVi1B
         v23mj328Z7pRgHVVnFvuIe0d9nIV12lvIMlaN6b2YomRbJpWStuv9Np+zkakpII06rnw
         N9vS2ZOwSadsJh+KrbrFrXTTI/c9fR7ckPD7AKZouyzNWPRghQH0h+KrwjnXRJ1Y5Leo
         UICQ==
X-Gm-Message-State: AOJu0YxveMO/OL4tY0RBporXsbwl5VCzaXIVqhM1jpqrgqiQfoN86Q8d
	g85afeFiQrYqW8ju5aot/nliapLgeYcLhPHKgKWcORu/x4P8L2teSD6msnQZsJkRrcCpvmX122O
	Hx17ot0eqDjvm6GBd6Ln418m0L35bXUGin/SRa2g=
X-Gm-Gg: ASbGncsPavehTZYREi42KAb30qerzZdedvblaV5BbJH8ffs03GfqiaFGnXWGsr/F2Sl
	grqT+9yhdNAInc/V0UojlRLfrLFj+vttXVSXfE0bNa4yqWByxJ6POozySxhPw+smcyLObFiodHq
	rWquC2IqV/pPS55C+g1cs6oYaf2XuCAmKktcIX5EkNC+96MsMZsvf52xO/xGgfizG0neLoFABAW
	UuOkJbADMI=
X-Google-Smtp-Source: AGHT+IFbw9uwqwYDro8uwfyG3XZHTePS4XI+ezN8utGdLDHt/1r8QpA2Og7uGGqfEAZ6R6+ZtyZzkp10+9C3zYEbPNs=
X-Received: by 2002:a05:6512:10cf:b0:553:25b2:fd28 with SMTP id
 2adb3069b0e04-5550b8bdfd5mr636360e87.42.1750998238298; Thu, 26 Jun 2025
 21:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625182951.587377878@linutronix.de> <20250625183757.995688714@linutronix.de>
In-Reply-To: <20250625183757.995688714@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Jun 2025 21:23:46 -0700
X-Gm-Features: Ac12FXzuHfHFWe7nf24S9nkWLlVYSMh-w9sEZOHfKbzqb2or0rs6hY-DP5_ZNg0
Message-ID: <CANDhNCpu5+ZVxFg0XVU4KYEWnNCbSruPob9dOeF3btxqJ1N70g@mail.gmail.com>
Subject: Re: [patch V3 04/11] timekeeping: Provide time setter for auxiliary clocks
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
> Add clock_settime(2) support for auxiliary clocks. The function affects t=
he
> AUX offset which is added to the "monotonic" clock readout of these clock=
s.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---

Minor fretting: I worry a little that the difference here between the
default timekeeper where set adjusts the REALTIME offset from
MONOTONIC, and here where it directly adjusts "mono" might confuse
later readers?
Would something about that be useful to have in a comment?

Either way,
Acked-by: John Stultz <jstultz@google.com>
