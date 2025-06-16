Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F1E285CB2
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081727; cv=none; b=KPik4sJSJpG2R4uweCXeD51lb1R20VxueZ/CjUKI4arVHy1LHP/qCQEaUVaIhYHgpoSv3o6c5XJOXeZ46TOBFVi6GeReO+Gx07Z3MrgKpiI7qZgXjA142bQgnIcD7i7iGiIMuRQYMcvO73fpZoGVYb5Fl2JWOzNBrLzoSEyy+jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081727; c=relaxed/simple;
	bh=hORHC5srxkLYSdtcercNBIJfYGZMJfr+bVXBwlntJR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVWRdnjjY0Wiw1289Pa9YmCasL2EjC7OcolwbM6Mfnnwelw6B3wIjpkK2DzUKT8+JXyNR896AZm3Sh5tiYSh1T7q+k9kE7km0VzyicHV7KEGLY8sXX/KyMgSCPgPgStAxWozktfvnq5eri0nVyCKDsu33CCrDsc+Uvqz6OpgdfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HC9caf5t; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HC9caf5t"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so3826394276.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750081725; x=1750686525; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uDEsIjpQxmad8FZLMr2zVoXrSneTIt+2z4fP3XcIK5Y=;
        b=HC9caf5t7Z3YV34hMVfY2iOyc8ceDK41ddWnZGKqTuEfRCkaUY3raiG3FlkrCFIjfD
         tPyRf2CTFWTmNqn1/fqrqeiU9uJtuN0/o6S2lRpPIvGheNVfGEWlXe0gKBMgT93uCWaV
         howKJOdXYFL5VBUyk2ABJnWG4of5g8jT5EQF3lfnh7+BPQPGs47ip1FBWZ/yH45SY+nE
         ITmfq9OEFvRdyraYRy2/XeNzHkPruJLRo4LNcIanLnMF1+j2wUFJAl4/IBSZ8nBmL7y3
         hnmmFLXuSOCnEaOhKiBMjLbpfE4uyCGHw7eLjaR81qvd/V7H6hVfgYy2IZI1q74yo9eT
         +LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750081725; x=1750686525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDEsIjpQxmad8FZLMr2zVoXrSneTIt+2z4fP3XcIK5Y=;
        b=XW813BwnyEvu3qxyuTH1WTRy4v51kUvcXClRxvU2Xa954TNdm/HuJlghbnRas3YcRz
         5/wqIrK/jJgi8pTX/6YVst27CB4st2rzEDK8lUsWMo0v1dODNlhwgbYjBRG4CtcUshDL
         SKV/+geDC506/SKMihygFJUC7tkbWiNmscC1XUJmTj4t6Gwq5EbyVLgN4ev3wpLxC96o
         /gfDK8aQXb5YqAGa7HNp0K+MgmMAuRFssNUALvTvSOEZiawaKOYPywqw9FGGupVq3WnG
         2pPdQmroKGBN1xaB2528mPxtW2asVLK6ignZnIwVxV+UGVnryKFDoZNZZ2MQRZfP4YGI
         y5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTQZVRXiXTPqKJs64X+OmK5DCN4wg0JhPWRowLIW7HDyGH3YIWNpSEuRNpzJrb+3ooKzV96tJIbliIEtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YypfmZVYtM9MCXuWsM48VL8ZoBfiN9KuvyiPUBtOwN5L6DGu65I
	tOPvyWgIZ9hybEsWeGQW+Y2ZOJA02iF7Xq2yqjbdPNUTq83iiUYv0rsAi0bPhPJa4vGLyIyG/3p
	YjodZPDqjcgdguc/fXDDUstwY2yv1OHO+3oSvwTHx4Q==
X-Gm-Gg: ASbGncvAbsHDGFo2hmBeTBxzAP0UPoZXNJOr8RoReUzt805EZfaVdPQ99jsgI4KCIkF
	LCDeSbTnXPv9pp7JwE2BqHYt3pRlEVB32ksyFX/AQvpCxO036n5417m95EP/64H92YSuPxnfuTe
	m3x7Ak9iB6YdZMhN2lWAtHVJEVGUzknxxlJzZMViuxkuK6
X-Google-Smtp-Source: AGHT+IHNxadKla4VrvH6YQyXKvJ7gWCdWq9mPlNx20rADiF787HEQItMLkqVHGwgE74xslQFsHpPtk0p6m7ForJ9ORA=
X-Received: by 2002:a05:6902:220e:b0:e81:9581:4caa with SMTP id
 3f1490d57ef6-e822ad8bc0fmr12562057276.34.1750081724654; Mon, 16 Jun 2025
 06:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
In-Reply-To: <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Jun 2025 15:48:08 +0200
X-Gm-Features: AX0GCFvKDYfrBoGxWHbzdQisHdQSvIWu47gSqcVmiJT8KMDILVyrcsYNa9sTBzs
Message-ID: <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
To: Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Jun 2025 at 00:39, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Currently, PM domains can only support hierarchy for simple
> providers (e.g. ones with #power-domain-cells = 0).
>
> Add more generic support for hierarchy by using nexus node
> maps (c.f. section 2.5.1 of the DT spec.)
>
> For example, we could describe SCMI PM domains with multiple parents
> domains (MAIN_PD and WKUP_PD) like this:
>
>     scmi_pds: protocol@11 {
>         reg = <0x11>;
>         #power-domain-cells = <1>;
>
>         power-domain-map = <15 &MAIN_PD>,
>                            <19 &WKUP_PD>;
>     };
>
> which should mean that <&scmi_pds 15> is a subdomain of MAIN_PD and
> <&scmi_pds 19> is a subdomain of WKUP_PD.
>
> IOW, given an SCMI device which uses SCMI PM domains:
>
>    main_timer0: timer@2400000 {
>       power-domains = <&scmi_pds 15>;
>    };
>
> it already implies that main_timer0 is PM domain <&scmi_pds 15>
>
> With the new map, this *also* now implies <&scmi_pds 15> is a
> subdomain of MAIN_PD.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  drivers/pmdomain/core.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index d6c1ddb807b2..adf022b45d95 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2998,8 +2998,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                                  unsigned int index, unsigned int num_domains,
>                                  bool power_on)
>  {
> -       struct of_phandle_args pd_args;
> -       struct generic_pm_domain *pd;
> +       struct of_phandle_args pd_args, parent_args;
> +       struct generic_pm_domain *pd, *parent_pd = NULL;
>         int ret;
>
>         ret = of_parse_phandle_with_args(dev->of_node, "power-domains",
> @@ -3039,6 +3039,22 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                         goto err;
>         }
>
> +       /*
> +        * Check for power-domain-map, which implies the primary
> +        * power-doamin is a subdomain of the parent found in the map.
> +        */
> +       ret = of_parse_phandle_with_args_map(dev->of_node, "power-domains",
> +                                            "power-domain", index, &parent_args);
> +       if (!ret && (pd_args.np != parent_args.np)) {
> +               parent_pd = genpd_get_from_provider(&parent_args);
> +               of_node_put(parent_args.np);
> +
> +               ret = pm_genpd_add_subdomain(parent_pd, pd);
> +               if (!ret)
> +                       dev_dbg(dev, "adding PM domain %s as subdomain of %s\n",
> +                               pd->name, parent_pd->name);
> +       }

Please move the above new code to a separate shared genpd helper
function, that genpd providers can call build the topology. This, to
be consistent with the current way for how we usually add
parent/child-domains in genpd (see of_genpd_add_subdomain).

Moreover, we also need a corresponding "cleanup" helper function to
remove the child-domain (subdomain) correctly, similar to
of_genpd_remove_subdomain().

> +
>         ret = genpd_set_required_opp(dev, index);
>         if (ret)
>                 goto err;
> @@ -3056,6 +3072,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>                         dev_gpd_data(dev)->default_pstate = 0;
>                 }
>
> +               if (parent_pd)
> +                       pm_genpd_remove_subdomain(parent_pd, pd);
>                 genpd_remove_device(pd, dev);
>                 return -EPROBE_DEFER;
>         }
> @@ -3063,6 +3081,8 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
>         return 1;
>
>  err:
> +       if (parent_pd)
> +               pm_genpd_remove_subdomain(parent_pd, pd);
>         genpd_remove_device(pd, dev);
>         return ret;
>  }
>
> --
> 2.49.0
>

Kind regards
Uffe
