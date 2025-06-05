Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A792153C7
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128129; cv=none; b=Ug8I2xQ5kyML4nG7A05asVvtNJPUP+dCafpoPYJyOx1kqRp8wtDT6fYkiS08oKlh/nlQARfEnE6EsrhDpTjLoYO8Yej/BJRXEtgM6NLB/bIL5/d5gPioXS8NnYq4G5rQg5tbZvHnbAt/pTV7dUYn5x4S7tSFceDREeVmnmpBNGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128129; c=relaxed/simple;
	bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmDBqW4RFbUwUluMS8/3j3uR5o8K0//KoeiFndYvhqizgdW09ikU3b7o+gP6ErAYQMmQ7Y549q0ontqJGB8fchmxOwGmc4yPlhUvu+be28Eh1BIia3GYII3M9GQ7S/QoSYoOzAzWRDDLC8T5eBIovqk2sbp1eQLIR9Y6iO7+MC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBum1WoZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBum1WoZ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-552206ac67aso1081769e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128126; x=1749732926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
        b=sBum1WoZ3z0r4BE7gVJLZuzsycj7D4rrWlW19JJUORC6Z1/IjLlfeSq7JJI8sOqQyF
         A4fFs4gzFDZLFyalN08Vuhyo1Ay4xZah86ix1vMIwVdh3NkNaps3SuGU8EzaNWHoCzVR
         bHnXI+WMgeVx/fE2bX3qJt3uObzlq5iF7gLAoHpQ8kzUvDv+XiwKhiO/mfXtCEiPDEK+
         0srdlSqNT1oJzPywA7DcHBYTci/BpINtClXPO8cFDV2Jng956vIRUUGUrITGgzbYwuat
         Hl6mq/6i3rGDJYDd703evepjZjTtcRw9A1plNX6wIQhDjcPOgJtbbylWO1vC+QH6yixP
         H1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128126; x=1749732926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIIQM7TR+T1o+dHAZkYojtv7Dh1o+Bo1e/gCVkYcYrE=;
        b=d4LLxl5E2g3+BdQ/iXWTDWqKVR8mkB50MUDDID8LBPtwquMXaxcICn+ERgH6TldpZj
         YpY89GJfKq0XdgupACN883m592vMnng1gjn75gi/VbxNONMfMzZzZM+fvqDiLYzSvXzZ
         nnDBFUOvFmyYfgVuR26aN/a3+1r4wcDjaK7xDDRnm24b4An12q2Q/tuQlKciZsEomK+Y
         yR3yF2vkXRlNC4FsZR0jvKhnMAtVHEjleIYfCxVgTd7dGy+VUd7DAlgm5Mnu+guaTFcM
         +pjjmA8kZQGHWjH8QfcNV10ipJVc76A91FK856oz8tvsNESD3xFNb65Z+T3UfX9dHc4F
         z7pw==
X-Forwarded-Encrypted: i=1; AJvYcCW3F7fCNEWXEsFquj6Ht9Dv1j7aVaB2nlajHYPNAT7P1jin9XdrA33tAbgk1/TuL2iMMOZomhGIjkEl6ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0b2Hc5leVs8j00b5n2dxWFkOiPrP0yerCY1ZvJUhJvgoW1Lz+
	0Ngsryys46+5rG/R/CTXw8Zt/3RtT+qW/aDEr6GH1PMK8s1MBjr/l4f++48b2UOEYbGWju+BybK
	PoLYCIh6/fuZJtgKT9/bWvs3MgxTzID/oygQCkGZ7PQ==
X-Gm-Gg: ASbGncs4VP/lycmrr0nGtmVcc40x+PaLY0Tm9+rr7a0IbqzWVuCjYMtEHX3rNhpFoA9
	VMUzWkP/gVHrfdrOE+kx0zsro7OqdnlZrVd6ggB5I7MJRLxIrcxu4IjaULrOlpJTqEMbgjx3Lkd
	8iqLBU02GVlLh+x21EYYG23BlkF7x2AtAw
X-Google-Smtp-Source: AGHT+IFktJaRVQL3O0Bp6utEO8UMc0VZicEcSyobSFeL3Ri7u0e4wIa7Sl6wlc7e4nLZc48ufle+q9gKEzK7mexYjhQ=
X-Received: by 2002:a05:6512:ba3:b0:553:2868:6355 with SMTP id
 2adb3069b0e04-55356bf1294mr2148839e87.18.1749128126139; Thu, 05 Jun 2025
 05:55:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523101437.59092-1-wojciech.slenska@gmail.com>
In-Reply-To: <20250523101437.59092-1-wojciech.slenska@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:55:14 +0200
X-Gm-Features: AX0GCFvnKpjs7qcRC4zueo0StcdisXIytgLKoGyc_FirjmAk_wruvxxdurKXjDY
Message-ID: <CACRpkdZ7CEJJkc96Z=nu+Ax8jUJSK_YcMntzEBmoXK1g9d7uYw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add missing pins
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 12:15=E2=80=AFPM Wojciech Slenska
<wojciech.slenska@gmail.com> wrote:

> Added the missing pins to the qcm2290_pins table.
>
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>

Patch applied for fixes!

Yours,
Linus Walleij
