Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CE72AD04
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749774208; cv=none; b=b5jHguAIkC9eMRKOvcjJ1TTqdVzgG1rz1kRmreWahMM/OUI0mHfQXqttz2QV2SsN2a2B7WuqofVzYpAuclA8Yu+Og1k8DE9vtxqmQiCby7Jm8a7y8AINoE0wQHPNW7R1FYNlNfDj4g7Mi3dm8+9aUguO6gy3IZ0MJ0++nm+fIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749774208; c=relaxed/simple;
	bh=TS3wkFdfUoxaY5a+vs416VExxBsFbCH8qzAMg6qQqmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxlM4uDvmJmRmTGm3pqgMB9Moak6khBxsIQQuQl0GEWvwXAkYq5gigdeL7IgYhbEkN964YT8/jbHa4FCIV49KFowQax+J7OMWP+oGRy8OT5IkHWdiMdACtOSpIPJq1GT7OGFzrFR6g3Y+bwhmhphKJxZNYs7pghNjlRF/jtC4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q2qwPmHm; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q2qwPmHm"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54d98aa5981so1995104e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749774205; x=1750379005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS3wkFdfUoxaY5a+vs416VExxBsFbCH8qzAMg6qQqmU=;
        b=Q2qwPmHmrRgvWHlr5SsyAQJBCR3mHq/Gf1GjZviP4ctCmcYx6yRYGe8+kJ8D4jVaib
         n87rACLU6wyPmSyNsbe3FjWOW14zyD9Og/SSimie5D2T5XvgZxmC/f8qvoqgY4LHEODr
         wfPNpK4KF4kxP1RzZKQkgg0+wpRc81vo5RaKHAK0hN1i8X0edpb/Ch495sZ1HJKNyUZp
         doeaRfEf9fTMmHx90SXfQPo5+6pRqTvfgxEmRyCASyIDajY6sWE6Q06g+lH5DWLVkpvd
         eK3mE3JJCHSaliiKJpPoTAKkaOB+yb7M3RgnNvBRsIp1GA4XJckNh7XWj8Unz6qiXHTL
         c0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749774205; x=1750379005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS3wkFdfUoxaY5a+vs416VExxBsFbCH8qzAMg6qQqmU=;
        b=uypBRvmnT4YTon/y52YeJaWcHqo1qQ/jLRniUH8JDj02LN8znyuv7818cNKM+ifoWj
         Z3S41jV3oEoa2plyo/4mvkm5RmUl/FIPU7CETRuJ46+fz9ySrHE4OtrEmX+WECk7YbCo
         A1HBK4Qn1Yf4mQlS120nYu7p79IOrHQjTLlyqJwC86wu/J/1BTMBhjRWN92bTLIWU7Zq
         0moHZk9F2DsFb8adatw70R2XxMb5JA6LuAHtUrBCHNeC3MYjysqWw2NJQrXf03WKFnKv
         KwndQ5OFtRi6bc3y6tvp3QgsCx9NfVJVdHFen1CtVeoQcJmPWHS5tRfDLQh5gJqo1jLM
         rJpQ==
X-Gm-Message-State: AOJu0Yx40TIgAVEnFcCtxff1wMTUKQZeL2noqdFArajWVR4SKATfEFvv
	mNmaMMwSpmCeFlXBXdNbgz/5IAXDXVuxUREcttSF65YBIyhUP1mZzAFm28sd9WI4MOq/Cw6Yq3n
	PRG3XytDYGIiDyxNlo5mzMrGhfKF7nOTVgsum6ZIWZVj+6RBnz4NBM7s=
X-Gm-Gg: ASbGncs3bbC+z0DFbnaMkBC6LU6Hz2VBn8bu4Mtu+AmR17AKxtsVARA6uj13iEfnKNs
	jzIT6gqs97KdaXBdfFDgTcYpMCkHCI2JfFqDXNY5EDktEfmONv0Jb2D475OL07/U+VOzkja0PPV
	8ZqvJlPQkspl7iRcGV0/Muc6Zb3nQRCtJ0jtQVmYOwyGCuMxy3ag9Lkl03Mc6QNEjVtBWxdDZ/
X-Google-Smtp-Source: AGHT+IHcAoV0ZONWAntX/rSo3VVoA4FvIxK60Y8BbvgIcNzQhU9I/mNNOCSSR75Je2/IGqS6rDIM4xMyeYKoYouHXdo=
X-Received: by 2002:a05:6512:b1f:b0:553:a30b:ee04 with SMTP id
 2adb3069b0e04-553af907766mr267255e87.14.1749774204575; Thu, 12 Jun 2025
 17:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083026.160967312@linutronix.de>
In-Reply-To: <20250519083026.160967312@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 17:23:13 -0700
X-Gm-Features: AX0GCFtV2q7e7qLHBw_niNRwvEth_ypgrFE49dyQa37Y-AtXub8AEe7HUlEA0tU
Message-ID: <CANDhNCq8SGR0oD=OZGVVn0z329P20fUt+fxFRGJOv4J_fyJSLA@mail.gmail.com>
Subject: Re: [patch V2 09/26] timekeeping: Make __timekeeping_advance() reusable
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
> From: Anna-Maria Behnsen <anna-maria@linutronix.de>
>
> In __timekeeping_advance() the pointer to struct tk_data is hardcoded by =
the
> use of &tk_core. As long as there is only a single timekeeper (tk_core),
> this is not a problem. But when __timekeeping_advance() will be reused fo=
r
> per auxiliary timekeepers, __timekeeping_advance() needs to be generalize=
d.
>
> Add a pointer to struct tk_data as function argument of
> __timekeeping_advance() and adapt all call sites.
>
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
