Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6315BA2D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744937487; cv=none; b=XHevcG8Jc64zReX012zUdlDXVrQdeVaJM5PZQMhLE6X3NazsFNaP80FuLg8ZvLgUZgjSOC5k2noEhSDnsL7bJynxkD1rTz3EKPLiXGQCn9/aH+cCQZ64b+YA+PvZ+QEz5L6Q49OhCUWBuSLN1UALucSn4tmT63MRbYh82zqs6ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744937487; c=relaxed/simple;
	bh=pmfJz9HOSf1YHC9miy/q7VstUc493X2MClNIJeftUNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAF09jgrKJp4lMELyqHJGpYPzVkK7Skb8P/m+GiRie5gyU8c1pQGHap5yHQoE4OPC8e8TG/iDtk3ZdpoApEMjNojCxYpC/fUOocXQm3qrhMopEPWJuvr5EsNGvP5tucrS5etJnkdS0gwqypOdo3W3/JSZJcwjD9v3PpjsXpYmPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t/c1jUM6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t/c1jUM6"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30c091b54aaso13189681fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744937484; x=1745542284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=espvvwCOUsOaiPeW4qBVlqsEGI9VvnOEfzXFD5TrphU=;
        b=t/c1jUM6bVMTHbMcmmsIMoOd76eAwN31S1nnOr+V4HrcusDb7UPRbA0BGP3dFttHX/
         D1/IL3/p5FzSG6rTdlUtzC6T9HnBqFBjDi3Zf6sgm5Fg8rpH8pEiBnoWD8w7mWhSX1/s
         7KYkA2Flf4PLTzn1wAwpA0Ef/bpXdSwdhxNt3lMkoo/elgwPMNVqgeYIRgOGFSz8meHF
         RegCVUfE7gk4kg9j8CO9+4Dg6iTXBDkBtX3VrYIXQBZSvOmW9P282oVPohZCn8+mcptL
         uWvartwdU/4J7xZXAOV3JFpt/jJEdpgaguW3vo6GjVOOeDoXzxsYu5jiQUN9PjkOYXbA
         LzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744937484; x=1745542284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=espvvwCOUsOaiPeW4qBVlqsEGI9VvnOEfzXFD5TrphU=;
        b=Qrx0ZKAtaxEU5HAKeAx5QAUzQPg65S93pz7y3p+cvKThKAWNmMYWGW7D+wBFR+xWQ0
         Mf3Y+sYQ7FCRUbJCqwAxAo8jy/ukF9r/2yZtUJyPodMWVx7HGU4QZ0agyOfD/6Ovhvxd
         laf23YoZSnAhvCbJkRNOPh6v+bV8HUOocUixnSs8/t/XulwVigkZohxsBHZWWut0r2og
         e5VpZT1L4lf7A6ZkNQPjPoXit8Psyig2PJyY7eRpCoevBLhCcq+206aA1OkSLaRt1ohg
         Nwt8xIzslka0hwzxJBOL0zKihGDkq8rNwcqPHgk3LpIetGIdJqAsQBj4XGEDHgccf+lV
         1xgA==
X-Forwarded-Encrypted: i=1; AJvYcCUGVwbp9sa8vp5echpZEmO2a2l0ZePccG5k9zdcEB1mcFPAziw1YZSq4TIc/MS4FR4tvhSbJqvmte+eYj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHCwY99qIMfzhyk2BdppVIbC4l8lS4wL4MyLz/XKpZk/7bPgn
	nhWWwQnrLHExh18E0zUo+TsPo8iGoY/k8fV6zj/Not5xtvHezZNArqwH0N7sqyCl6B7mYdaHiBZ
	WsKKMkuvUgDOG4Ly4MJn8M2+t5QUKEPpwqfSJ
X-Gm-Gg: ASbGncvi7Lpz518ZMzW7DZ6NV9qG/xWB+lWEGa7T2EDAP6c+c41SLBmbBQi4nlwegp3
	vuHazf2NJz9p/Pom+ylC9/Wv63FfbweCHUOjdivrW3rnJz1uDPMZhT1OSNa+WJCJsMXgTPqO+gT
	PgUXcg58lzfnl07dfoBUa+BsEneu7vpIy4hlvi+kQgsNjP8B0=
X-Google-Smtp-Source: AGHT+IE/wqWU+kEJ+uNl1lu0U9l4Nd/hTZwOvDN4HtDxpaQCKOIhack1E/1QtP4XZ5jNQUL4f+oT4lDAZLRZaMBAPC4=
X-Received: by 2002:a2e:bc86:0:b0:30c:40d6:5cdb with SMTP id
 38308e7fff4ca-310904dba7cmr3095251fa.11.1744937483536; Thu, 17 Apr 2025
 17:51:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org> <20250417142513.312939-12-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-12-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 17:50:45 -0700
X-Gm-Features: ATxdqUG3nsZ8r4b4j3azqOjFpPct1ZcFhXbrqEnzX0WXjS0gXoFni5vfKcox8w4
Message-ID: <CAGETcx_hQRr1hRQD0vyAN9bhZRx+763zfHUG0oBi0sqFUi85pA@mail.gmail.com>
Subject: Re: [PATCH 11/11] pmdomain: core: Leave powered-on genpds on until ->sync_state()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> Powering-off a genpd that was on during boot, before all of its consumer
> devices have been probed, is certainly prone to problems.
>
> Let's fix these problems by preventing these genpds from being powered-of=
f
> until ->sync_state(). Note that, this only works for OF based platform as
> ->sync_state() are relying on fw_devlink.

For non-OF platforms, this will still wait until late_initcall(). So,
there's at least SOME protection. We could potentially even move that
to happen after deferred probe timeout expires.

-Saravana

>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/core.c   | 12 +++++++++++-
>  include/linux/pm_domain.h |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 695d7d9e5582..a8c56f7a7ba0 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -212,6 +212,12 @@ static inline bool irq_safe_dev_in_sleep_domain(stru=
ct device *dev,
>         return ret;
>  }
>
> +#ifdef CONFIG_PM_GENERIC_DOMAINS_OF
> +static bool genpd_may_stay_on(bool on) { return on; }
> +#else
> +static bool genpd_may_stay_on(bool on) { return false; }
> +#endif
> +
>  static int genpd_runtime_suspend(struct device *dev);
>
>  /*
> @@ -933,11 +939,12 @@ static void genpd_power_off(struct generic_pm_domai=
n *genpd, bool one_dev_on,
>          * The domain is already in the "power off" state.
>          * System suspend is in progress.
>          * The domain is configured as always on.
> +        * The domain was on at boot and still need to stay on.
>          * The domain has a subdomain being powered on.
>          */
>         if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
>             genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
> -           atomic_read(&genpd->sd_count) > 0)
> +           genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
>                 return;
>
>         /*
> @@ -2374,6 +2381,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>         INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
>         atomic_set(&genpd->sd_count, 0);
>         genpd->status =3D is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
> +       genpd->stay_on =3D genpd_may_stay_on(!is_off);
>         genpd->sync_state =3D GENPD_SYNC_STATE_OFF;
>         genpd->device_count =3D 0;
>         genpd->provider =3D NULL;
> @@ -2640,6 +2648,7 @@ void of_genpd_sync_state(struct device *dev)
>         list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
>                 if (genpd->provider =3D=3D &np->fwnode) {
>                         genpd_lock(genpd);
> +                       genpd->stay_on =3D false;
>                         genpd_power_off(genpd, false, 0);
>                         genpd_unlock(genpd);
>                 }
> @@ -3486,6 +3495,7 @@ static void genpd_provider_sync_state(struct device=
 *dev)
>
>         case GENPD_SYNC_STATE_SIMPLE:
>                 genpd_lock(genpd);
> +               genpd->stay_on =3D false;
>                 genpd_power_off(genpd, false, 0);
>                 genpd_unlock(genpd);
>                 break;
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 2185ee9e4f7c..c5358cccacad 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -193,6 +193,7 @@ struct generic_pm_domain {
>         unsigned int performance_state; /* Aggregated max performance sta=
te */
>         cpumask_var_t cpus;             /* A cpumask of the attached CPUs=
 */
>         bool synced_poweroff;           /* A consumer needs a synced powe=
roff */
> +       bool stay_on;                   /* Stay powered-on during boot. *=
/
>         enum genpd_sync_state sync_state; /* How sync_state is managed. *=
/
>         int (*power_off)(struct generic_pm_domain *domain);
>         int (*power_on)(struct generic_pm_domain *domain);
> --
> 2.43.0
>
