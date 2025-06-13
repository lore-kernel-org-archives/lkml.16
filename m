Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F9C79F2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749773025; cv=none; b=dxp1JptKLkt6B34V8dRxGzdbx/K3NW429h8AeeHSyG5FMWvu3AMLTkLMSkeluQVLQpJzvq3Ucy+sj4iC7qIY/w4ZrCNUw2OyULSY6xc/1+hXSRdoPzG600gIpFAsYlRYXm0/Pskzl6TnWSBpAsvzP615BzladixVx6PRhyfxMo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749773025; c=relaxed/simple;
	bh=pzH8pMXUcalp6pDfuzsK2/D2VK/1SBdaD4K20Qy+vNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPgMo1pL8dlN1dSocvfVH7rQdDxvXOMkdWmkwDFy09BnNLiKd+o5+TKmledGAG9R7QcVIeX01yDq2MN09k5w6RTr3ysR3R0aTcLz8+qcGRSLpixrEBVlm73gKNxhC6W0MijRtnx1f0HkRQZJuqQv0nF6qlRG24PYFA9y9AUSvN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3ohBsyk; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3ohBsyk"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-551efd86048so1391824e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749773022; x=1750377822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzH8pMXUcalp6pDfuzsK2/D2VK/1SBdaD4K20Qy+vNk=;
        b=R3ohBsykmXpeEX//EHoia/Cbn50mv2FL2fOoz4wLFsdblAa9Eqvp5ziDxdL9DYvjMd
         xQWB3GTSQnua7MxxuE/jjj00t3vSmJfXuCVCVIWWP3ogWm2tTC76XdrUURU2jJlNEHpf
         qMPz4zb2BI93nMi3QJFvv/kQ47HXeyiyVyZ8htiztBbge62bLni/GqNwUqvrjjooa7HS
         5LZDQXZbARhvYOUPL1nV+cVVL5GjV6jYPXnDfuzZVoLmfTDEWUiIdTWsBJMzx+cPejH3
         o6X0ium5r7HAuVatROrOLRTgt+hs5tBguGP2mGSolteWzApQrVHBYFX504C4l3g8HfYv
         tFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749773022; x=1750377822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzH8pMXUcalp6pDfuzsK2/D2VK/1SBdaD4K20Qy+vNk=;
        b=VM7HCSNLGrtXQqlK5hh8gtCGg+WRLztBSjvtLe9gmh7oC60BPmk10fg30yiivy5iFd
         PWYkFLWnTQqJZhsDfTL7PqXQky0X/XD5oibfzWwyqi0m632JcSmk571xiVoqtHWk6637
         8NwVJHpECn3+TwRNdkUHpG7PHo14gvUe9Uwir5oU4MjpkPT0yGMBxMqSU+3TfKTIp3rk
         6Ixm+K6pt7+FRDuyLyHmnMyrXgkVRCGjLyNw4SvOI5s/xTz5TfKkY7tvstJXnHEzf9eI
         nv/wZm7rcqr2JfYZM8Z0djqWD3QNX+XmAOUQqUH9ylIb0dxNzwJA4XqD6RUAvbb5ZI6d
         Mdxw==
X-Gm-Message-State: AOJu0YyUVNlkbXrm3C3AL0rfRFG9xWkCUU9M/vF5fuRYXbBYwPDa7X9Q
	x4kIA+X9J4boE3V+ejNB/zDDp/zpdxbXmpQNmnDeS8KV7guy0n5Ehtb/vY4yE85SIGVi/Eggxf5
	iVUqC4JLnnFFcOdOosmiwWyu+AhI6/jGeNkL79oU=
X-Gm-Gg: ASbGncuP7Hn/PgTSM/h0+GIz3Rs0JhQ4QseISoYYyIfxID7sy1Se5d097FMw7gdys07
	0ZoZn74CJCXezgXLbF64nptUAJjVzZPIF1g9NGUVySYpDt23/6EETgFGvWp+Lyi+BwsD/0QtVUi
	i4IQtPhV1J97WbVKWyuegC0iFnnpA4diXna1kjnE68rVgJtJNwmsm6ZXm9hQERiLmZT/v6XhORZ
	jOCPX9A9bY=
X-Google-Smtp-Source: AGHT+IHCryRchnM7kCKhNYJZSBNu7zRh8pUHzqHQ0apcweZpI5BCqRoJWSeLJsU3qoa5bR5qdbcwHv+BrtrUbRsXMC4=
X-Received: by 2002:a05:6512:1381:b0:553:35f5:7aac with SMTP id
 2adb3069b0e04-553af9bbf01mr179570e87.48.1749773021612; Thu, 12 Jun 2025
 17:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083025.842476378@linutronix.de>
In-Reply-To: <20250519083025.842476378@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 17:03:30 -0700
X-Gm-Features: AX0GCFvdBUhjhbTIICZQJsoZZ6tQWm4NpoXbd06TKsPSSSZ0mvn1EVyJNHREOXY
Message-ID: <CANDhNCoqYhFNfuyArrt0Sj7sWoLNsVJUn7YCUuxEL8nFrZPHog@mail.gmail.com>
Subject: Re: [patch V2 04/26] timekeeping: Introduce timekeeper ID
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
> As long as there is only a single timekeeper, there is no need to clarify
> which timekeeper is used. But with the upcoming reusage of the timekeeper
> infrastructure for auxiliary clock timekeepers, an ID is required to
> differentiate.
>
> Introduce an enum for timekeeper IDs, introduce a field in struct tk_data
> to store this timekeeper id and add also initialization. The id struct
> field is added at the end of the second cachline, as there is a 4 byte ho=
le
> anyway.
>
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
