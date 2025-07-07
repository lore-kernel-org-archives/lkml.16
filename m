Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6E28B3F9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881139; cv=none; b=Dg5AYXg+2UyQvmYOxuc37bpc83XUz+1YSkeYW/TA5neYw6reE+eGmTWNAKLiWzY5/Q0L5wsWB5j+jbXlG9zUGbw1J+C69FQFXzwjd6WrlaN6Q5bOVKUx+N84rK/Bgxk50cHDmaw+SMY0jJByoNXnOmeocWbhQW417t9z4q0SRO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881139; c=relaxed/simple;
	bh=JmyGLpC+42D1l0yTrt8dfjaa/SIQpHvRIl/uKou1cYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCQmA7Cy98A3Qq0iZ+JkEtnNXMGJc230ZrCpMoO6sk+eAXjtleydShEoc0NxUaTSf8UNbb0wIUX2fHTAk9ZZKza9tnul0ZHaES1Evb0PIYWovgTBt8xvhMW9D5ZRs5iT0X52Vvhhm5MWg7T0nLwsjysCCSEkemIBXk99MZnFZk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=jQbpegDf; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="jQbpegDf"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3df4bdadca5so11135735ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1751881137; x=1752485937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgZsROmV74i3LKEIf/xZRowc3GM1ebMqOxLJS5yWzYQ=;
        b=jQbpegDfrbS+dNQtr8h6YpGlElKpsBcfB+m9LT2brR0hqetXc+936IiByuCQTkx5zf
         6FqqIuTljav7WMpveG/POp54GiuY/VEdcvSPHnfD9xuGN/u7jBaTvvRidTnnNHbnbNif
         5zO5yyIQoeeY+lt1shCgYzxqOkkpUY70CRdPKpNaB6NmKlV7AQHa1CWijGOlYONQ13Pz
         8R/fIv0zIkWi/H4tcp0e5VGVsVwl2Z3VNlVcKFay/1W135S0zbobOYOtEdIVOf50DmLo
         qudMTdkxPnMQNaH6+eNT0kpd3NEoLPLSuMtK+DdoJ4SBJqX2GQD50HdTq79W8O006enD
         zNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881137; x=1752485937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgZsROmV74i3LKEIf/xZRowc3GM1ebMqOxLJS5yWzYQ=;
        b=cNpCK9FJ23Rfl8/5xtu8R0LXekzppTX2qJLxUxQZhOadSZpbp4fnSzTI71OsJYlxIf
         AvykIHu+w6zFzGrirCjAEB/9HslKZhZR4Gs0TIXX7VrFPbF6eBivKnvoUeJl3rN0bcUz
         wNdbmYvgqYd82MHGqIUOddk4V9G7HbulJZSZBkxKfX8mKzeZ/0C15Saz4ut94yxHF1uq
         F6aE4LIJUhPPQf0kQPdfqUm40BgQZj0cPvH24KGMW8JHS8PqxeGiD+wRLfCXp9mgJZw3
         7mhi9yT0PuUHiROCkrRy6E61diwJr0Y9mTQmfGZb3bTbYSqlz+hxp433RzmBSKxWtPDz
         mcXA==
X-Forwarded-Encrypted: i=1; AJvYcCUKHn8sVmDFzzqQeHtOqt5aX5LNVugPIa8hyzq42YucVwDRtmMPb3kN4kL2w6jJd2/YuTRz+v97PcOIX1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG7erY2xhd2ahrx4npP2WaX2XsiBQzrotzD5efCwu0WfGhwttV
	gIrEji0g5YEU0yuBNVdMJvWBLN+p9Y1EPcym7Fix11OvuTZkBMtwq+AB3RXmNJuTPmafZMocQI0
	GP89yyHQEJzBAgQ/LNjz7ZqFgay6c8KGIJptz3S3NVA==
X-Gm-Gg: ASbGnctuAFOF9U2o7RqoWMhsnZecJceEaOY0jEGhfvUyrZsuD+KAzX9C+aHR+azCQcr
	cz8uoahWp0mzpk8JB7U5D8GE8hY48CSzWp5DR+LhnQtt1MA8unELaIfUa9Y2R9/Zd7Kr+e/DtRf
	jxJn3wf75+zb0vvc0oYuCzH3mgasduXYbysVhgoJjPmQMB
X-Google-Smtp-Source: AGHT+IFKjzUQeQQI7LB5Qa2/KiIun4MBso9sECmrBCp6niwPJVZxqnnGmZUVkWEtGZmc3+SOF9owpQQYDocnGgSsvgQ=
X-Received: by 2002:a05:6e02:2589:b0:3dc:8b57:b76c with SMTP id
 e9e14a558f8ab-3e13ee92f38mr68372945ab.9.1751881136933; Mon, 07 Jul 2025
 02:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-25-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-25-ulf.hansson@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Jul 2025 15:08:45 +0530
X-Gm-Features: Ac12FXxDUsc83NMJbxmZApkih2qJ3f4DnyYJbjNzkyF_HKvftJAST2PYGqAG2oQ
Message-ID: <CAAhSdy06D-7PGbt4jR2rr2D_rJG4CnevHV+LJm-BZ7CxMpECQw@mail.gmail.com>
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
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 5:18=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
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

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidl=
e-riscv-sbi.c
> index 83d58d00872f..a360bc4d20b7 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -44,7 +44,6 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct sbi_cpuidle_da=
ta, sbi_cpuidle_data);
>  static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
>  static bool sbi_cpuidle_use_osi;
>  static bool sbi_cpuidle_use_cpuhp;
> -static bool sbi_cpuidle_pd_allow_domain_state;
>
>  static inline void sbi_set_domain_state(u32 state)
>  {
> @@ -345,20 +344,6 @@ static int sbi_cpuidle_init_cpu(struct device *dev, =
int cpu)
>         return ret;
>  }
>
> -static void sbi_cpuidle_domain_sync_state(struct device *dev)
> -{
> -       struct sbi_pd_provider *pd_provider;
> -
> -       /*
> -        * All devices have now been attached/probed to the PM domain
> -        * topology, hence it's fine to allow domain states to be picked.
> -        */
> -       sbi_cpuidle_pd_allow_domain_state =3D true;
> -
> -       list_for_each_entry(pd_provider, &sbi_pd_providers, link)
> -               of_genpd_sync_state(pd_provider->node);
> -}
> -
>  #ifdef CONFIG_DT_IDLE_GENPD
>
>  static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
> @@ -369,9 +354,6 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm=
_domain *pd)
>         if (!state->data)
>                 return 0;
>
> -       if (!sbi_cpuidle_pd_allow_domain_state)
> -               return -EBUSY;
> -
>         /* OSI mode is enabled, set the corresponding domain state. */
>         pd_state =3D state->data;
>         sbi_set_domain_state(*pd_state);
> @@ -401,8 +383,7 @@ static int sbi_pd_init(struct device_node *np)
>         if (!pd_provider)
>                 goto free_pd;
>
> -       pd->flags |=3D GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
> -                    GENPD_FLAG_NO_SYNC_STATE;
> +       pd->flags |=3D GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
>
>         /* Allow power off when OSI is available. */
>         if (sbi_cpuidle_use_osi)
> @@ -570,7 +551,6 @@ static struct platform_driver sbi_cpuidle_driver =3D =
{
>         .probe =3D sbi_cpuidle_probe,
>         .driver =3D {
>                 .name =3D "sbi-cpuidle",
> -               .sync_state =3D sbi_cpuidle_domain_sync_state,
>         },
>  };
>
> --
> 2.43.0
>
