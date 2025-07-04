Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221F28A1EE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625605; cv=none; b=AuV3zgBWa4AR9TRq0u6iSj4otGDU7LrkMYN3y67rh+e87c980da5eZ0e3wiaeF0s9OSH+QGIbu+NR7nuELmVTowk3AvLXXIFeELBLfq6MVwj0x6yrs4lSvff9dLlqUno0MbNQjsRfteFm4LrnaawROaJG5rZYiWy6b82aX3TSE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625605; c=relaxed/simple;
	bh=QTDQwxpmMa7bdrjCOtTfl4c7nTDaps3asxtgIQRarGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRLpkVfSAZcfkccpcOgu5HJEeBgXZn+ikIQtArZqjgpLQRkJRuzgZKEg8nphoa7fr9QLrb6A/MIwVE7T0tof7g821dRAJTRDEKvTzeADh6vCKzQ3lrI9KP+Pt/1Ca1LAli8lNZYnHDM5+YUaQlCCV5E5bf6UE1MSMAhck6M+F/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Z8S2ENiT; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Z8S2ENiT"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73972a54919so830517b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751625603; x=1752230403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qpm9oVk31iPLMFRDyV/0+2lbwRDN6/sR7bTcFUqHlY=;
        b=Z8S2ENiTkQoIN1MVeLNIfnDmEKgJIztplobAA5pYZWftRJYOCcnBVIisz0/onL9Fmz
         z+x0H6RkA1epXBUbkYWhiZ4/248WiX6fwVqu6SXwgteYmu1fN9ZM5Xk7OMKo1aeh64+b
         pNF7OqtI9Jaupe+NTY0sQ+WEIBMGL5wcSIqbG5AUiwKF7/peC5nJ4P1cZr9u9ibWUyvc
         ZmSlanbe91kE2n1iOxmqrit5N34SNSx2J7PV4wQlR+QtE1fv7tJgDWW4Ue/Rg+fr1Us2
         yJTezJEaNc0jLUyZZSsCmF7SYgo6HZpWp+giCAiVaHPYfUSP/W6CtUXgXF4IuHvuRnMS
         LFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751625603; x=1752230403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qpm9oVk31iPLMFRDyV/0+2lbwRDN6/sR7bTcFUqHlY=;
        b=DVMKSFvCUyBdhib6h5if2fac/xhWTgf+E79T1GmiXWLCbN7bXFgDwyHCLfwcQHvUt7
         +qYZMW/FsmsuUiL9MsPkG5u0quDCySiQnr6Oe8G8xv8EvyM0kE6rgyMjfIFDorq6JY5v
         T/qc3zntrOD5XhOZnIXVvScR3Yh/+Zq1wEy0amNoSsdf7GHabNkVOYAyCFyDctLWphPn
         PiLbfzJUV2mmPi783lgCmJngYuJZM52bK6L1gG/uplChop7Nrtb62wkLlDxXOOV5epvh
         OT9mOYThnuMYd2J867x2WMDAG5i4+JI3txO+Z1S46BL793cpzPYVUtlSMFGvRf0PLeNE
         JP+A==
X-Forwarded-Encrypted: i=1; AJvYcCURHTTKQWgLIlbSv2rjpo94UlP4yb+VHIc0c+BDJvurpcU/q1q8TJj5/aIKBt8WwZL7QEOesz7YX4kUvlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOCz/i5U0yqHHT/4zShf8Auf1FVqIs0vs32OEA/hs+8hTgXsh+
	LlfJZHI2JTgJdJ8gprshbZEqiGEsrNZOhCaCQTSM7rbOYvxR6rlNFz+wHfWf2n9YifyTL6R94nb
	FQMvkT9BMKl8XbyOqbFAJ+BXf4Mp2rDPkTBlAxOPleg==
X-Gm-Gg: ASbGncs9ScIsB6iWmYkYnw/Rkeg0FaRY0kukQX9svtt+Bk0FZmHaEGRH403YUMbeovq
	EbCe4nxzmKk3N4qreoB+BB0BmZuTmJa+K8WKXwpRCUOhM+/NpZw3xIuUAAWt3H+fOCOAISUw8jJ
	DZvJ5/CAy/Rp20wUdz2lgGCpNhDf815aEcXzYh7oyM8EQQ1Z/De2lR3qHLPhxC6fsCvLbykDC5V
	Z0R
X-Google-Smtp-Source: AGHT+IGBs9C/a1h9wEnSJ4u2whXXZ8h6N1fXxSXBnoBq+aBJJFdxWz87n4GrI9gt5Rt5fyk2gdtaErEvJ5wxodxEPAg=
X-Received: by 2002:a05:6a21:328a:b0:21d:fd1:9be with SMTP id
 adf61e73a8af0-226095a50bemr2186092637.12.1751625603014; Fri, 04 Jul 2025
 03:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-25-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-25-ulf.hansson@linaro.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 4 Jul 2025 16:09:27 +0530
X-Gm-Features: Ac12FXzyhceuDUHxAgg09E47FfPnvNTySeb2d62SyjDeeom2LGwO1x_uyESViw4
Message-ID: <CA+Oz1=aU=2KFEsJNmO6LHjE0Wsdyor7Z4Yr30nLwRkAGm=ZO6w@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] cpuidle: riscv-sbi: Drop redundant sync_state support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 5:23=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> The recent updates to the genpd core, can entirely manage the sync_state
> support for the cpuidle-riscv-sbi-domain. More precisely, genpd prevents
> our ->power_off() callback from being invoked, until all of our consumers
> are ready for it.
>
> Let's therefore drop the sync_state support for the
> cpuidle-riscv-sbi-domain as it has become redundant.
>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: linux-riscv@lists.infradead.org
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xi=
linx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
>

LGTM

Reviewed-by: Rahul Pathak <rpathak@ventanamicro.com>
