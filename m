Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064C1A3178
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751307436; cv=none; b=Tw1ML43syRynXMDkFatKb/x42dtjwRHO27gM/HsO/CeYicTGfQi7Axi49Dv2LzdUXxHoA3QQgXEfxCAFK/3XXY1OFn2wCI5c2AP6DKhnEso1uaYaSFuHh4eCOItjOdLzn6aHNtb/ILcGD3kp8IVkERhX2v5Q1I8gqP0uFOymuto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751307436; c=relaxed/simple;
	bh=XzYE0ggpzi/xWgQAv+8GzWJs6sZVm5N0XHvtxn3e7g8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h+tjpEp6iYnxFirvIEs+dnpXxg9WXEaSkgV/auIAR84b7JgY62ZSoLk4wyfp4lOCPLOLYSOIgSZZDWx6sDhh8uYX9SEgFSbw4dKUUP6Jb4UFvT07sBf62PrfgYU0tSh/G/4TxZ9B7wgkag4S5vLyWYtP7AkBKCs53zrQcdJRJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k9siFlH6; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k9siFlH6"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747fba9f962so4500583b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751307434; x=1751912234; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBjVRv/LWhtEYGg3uh+SYefd6WbGxbfazNc3AwALFSQ=;
        b=k9siFlH6wyfr9RLxXvJHUnczNqaw+Kd5aILCUq3H3ZXypPZU0A/GZ0dVlJ5kj8IVnw
         DfMxBy2OUV4RrSnP9z3zEeYERanHVn2WVDLltw3LauUDA7glCi8x2FS8D8WSoTQI1g5t
         D09iE/fUN4v6d28dKQ+nP4doQdUDvnqLrukp1FD8AFVsAAJO5emaETgv+2yidruhOZRM
         AtZl0qrd9h+/Sy6xs8G1gI9KCdZLsCIZtO4tTY9XrinkCT3yLcQNF1YmGhzeKns0ajUR
         6zG9KaxgLopsgwi4TxSJPxyTNkP99kM6PClzGcRQwwYb4sp8l6+38WDrsSd9e937ihcY
         /YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751307434; x=1751912234;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBjVRv/LWhtEYGg3uh+SYefd6WbGxbfazNc3AwALFSQ=;
        b=wBNX435U2v2kboODxWrW9MDT01/lqn8T1gL4UzX2PvA8dzpalxfNjyhryQ1YWHNmL0
         /hWen3mtwSMaXRVdB+mzYv84jOYRtfP/CuYLWj3OromIJd+uIJXjZ1JYN8jNMBjjSL7C
         Cdja3z8pjMvdesguzhqEeonW1DYJ2eWT6X+RutZW+Mr/fVbmlt9gP8MIzGiPLKCJjwYk
         O97v5gWc4hN9ttcYiTtv8LJS7k1DrdOBM5tNtWbepcRjewPZHJ6DhPfZfBsElAldm1YF
         E4doISB/0DiGPtLdpwESECxyGCh5Qd27zwh8ettC4xjR3wqN7cl4HDbssAnrUmv72HON
         5lPg==
X-Forwarded-Encrypted: i=1; AJvYcCXwhirFywCLTxQiGXj6EjYmg4nZIC+dA+MXQRR/AqMFf19pYc/9fflSRPoj46nLSpEoU9QS6TXtMHbxhy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZDy74zczu5uQOlIGgD0jr8qt9+cjc2mr1UpCco+sJWDcNujPz
	l8JJAKUcjH5Bm3P4Ilxw+qsVx6i2/Srwq+w/UMKu3MLL0+vyw3vc91R9U3xRyKWqr1Y=
X-Gm-Gg: ASbGnct91iFlGUpmdBs6RSa/KhxdfLbDfyMSPwioi5Gmw32GcD9cwLxeXjG46P9/FUH
	WMlSF9DEtn6QQfIhOG+skhIXiGWN55zG4NgVJqVCsBqo0qKiI13WwSMfl4tMRfOQ8ZAuP2RAsO8
	C+ceVbQHsOQSoprS3tlAZZiJjtyGEDLnnjfeloMi/E0OaUXYuk2x/lqOxTjcUvcFw/E/DfeGNtM
	cgNNRGqmSWrkthsC6dYB5P90ok4gnPNJ6QfmC56dNzL7A3TyGba7qCArVf2CppR39SRNlB0I392
	RpYDrYHYSNyuT9rRgmL3QUb72HwuMEgd+oEpxrYPMfXAGQRQlHkBfL3Nf1kxmSycTZ0bVl4=
X-Google-Smtp-Source: AGHT+IGQOXcusfsnRzzu9tTsp4bqdnB978cAzt96coGY3e06638Az0cSdJ5vM52cbySItmU05CF2DQ==
X-Received: by 2002:a05:6a00:4b11:b0:748:a0b9:f873 with SMTP id d2e1a72fcca58-74b3bc8da15mr742566b3a.9.1751307433908;
        Mon, 30 Jun 2025 11:17:13 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540ae4csm9398150b3a.34.2025.06.30.11.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:17:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 2/2] pmdomain: core: add support for subdomains
 using power-domain-map
In-Reply-To: <CAPDyKFpTgAmLBq2ZExPoxWM0wL756zH96vW7M6wHSA1MTTG1wA@mail.gmail.com>
References: <20250613-pmdomain-hierarchy-onecell-v3-0-5c770676fce7@baylibre.com>
 <20250613-pmdomain-hierarchy-onecell-v3-2-5c770676fce7@baylibre.com>
 <CAPDyKFrO9rb0eDb2qO+EGaVjOFG=7emgca8511XACDhWY=dt5g@mail.gmail.com>
 <7hsejzp4xg.fsf@baylibre.com>
 <CAPDyKFo-iPBPgkM43q+5cGR2sptkLk4E6TAERCQbCu24o1RfFQ@mail.gmail.com>
 <7hcyb1os9y.fsf@baylibre.com>
 <CAPDyKFpTgAmLBq2ZExPoxWM0wL756zH96vW7M6wHSA1MTTG1wA@mail.gmail.com>
Date: Mon, 30 Jun 2025 11:17:13 -0700
Message-ID: <7hjz4tnlg6.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ulf Hansson <ulf.hansson@linaro.org> writes:

> [...]
>
>> I've done an implementation with struct device_node *.  This works
>> better (IMO) than struct of_phandle_args * because the caller (in my
>> case scmi_pm_domain.c) already has device nodes, but not phandle args.
>>
>> The result will be that the pmdomain helper will call
>> pm_genpd_add_subdomain() instead of of_genpd_add_subdomain().
>>
>> Below[1] is the current working version, which includes adding the
>> helper to the PM domain core and showing the usage by the SCMI provider.
>>
>> How does this look?
>
> It's a lot better in my opinion. Although, I have a few comments below.
>
>>
>> Note that doing this at provider creation time instead of
>> <genpd>->attach_dev() time will require some changes to
>> of_parse_phandle_with_args_map() because that function expects to be
>> called for a device that has a `power-domains = <provider>` property,
>> not for the provider itself.  But I have it working with some local
>> changes to make that helper work if called for the provider directly.
>> If you're OK with the PM domains approach, I'll post another rev of this
>> series which includes the OF changes for review by DT maintainers.
>>
>> Kevin
>>
>> [1]
>> ---
>>  drivers/pmdomain/arm/scmi_pm_domain.c | 12 ++++++++--
>>  drivers/pmdomain/core.c               | 34 +++++++++++++++++++++++++++
>>  include/linux/pm_domain.h             | 11 ++++++++-
>>  3 files changed, 54 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
>> index a7784a8bb5db..8197447e9d17 100644
>> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
>> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
>> @@ -54,7 +54,7 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
>>
>>  static int scmi_pm_domain_probe(struct scmi_device *sdev)
>>  {
>> -       int num_domains, i;
>> +       int num_domains, i, ret;
>>         struct device *dev = &sdev->dev;
>>         struct device_node *np = dev->of_node;
>>         struct scmi_pm_domain *scmi_pd;
>> @@ -115,7 +115,15 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
>>
>>         dev_set_drvdata(dev, scmi_pd_data);
>>
>> -       return of_genpd_add_provider_onecell(np, scmi_pd_data);
>> +       ret = of_genpd_add_provider_onecell(np, scmi_pd_data);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* check for (optional) subdomain mapping with power-domain-map */
>> +       for (i = 0; i < num_domains; i++, scmi_pd++)
>> +               of_genpd_add_subdomain_map(np, domains[i], i);
>> +
>> +       return ret;
>>  }
>>
>>  static void scmi_pm_domain_remove(struct scmi_device *sdev)
>> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
>> index 88819659df83..3ede4baa4bee 100644
>> --- a/drivers/pmdomain/core.c
>> +++ b/drivers/pmdomain/core.c
>> @@ -3220,6 +3220,40 @@ int of_genpd_parse_idle_states(struct device_node *dn,
>>  }
>>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>>
>> +int of_genpd_add_subdomain_map(struct device_node *np,
>> +                              struct generic_pm_domain *domain,
>> +                              int index)
>
> Providing the struct generic_pm_domain *domain as an in-parameter for
> the child-domain seems unnecessary and limiting to me.
>
> Instead I think we should parse the power-domain-map DT property at
> 'index', to find the corresponding child-domain's specifier/index and
> its corresponding parent-domain.
>
> In other words, we don't need the struct generic_pm_domain *domain as
> an in-parameter, right?

I'm not sure I follow.  The `struct generic pm_domain *domain` is the
SCMI child domain.  From the map, we use the index to find the parent
domain.  And then we add the child as a subdomain of the parent.

Are you suggesting that I (re)parse the DT for to find the child domain
also? 

Thanks for the review & guidance,

Kevin
