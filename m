Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8555E26FA6C;
	Fri,  9 May 2025 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776494; cv=none; b=NG1PBqQKO7M/Ph4OlhQf2Wi3kxzv/RImJiRSsyp7pTolltUngDEgg+c7D5k9vpPTDcEVwA85AyGkcpFw+EHkFcfdaN+CpLgrJdEjNzf81oHf9Pj/kL11SWKpwxb9ffS3uhzLdxioZuEJ33fWS0LOA+Z295kh1ebA2E84Ir0z5TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776494; c=relaxed/simple;
	bh=jyO31/jl+RDl/d/ZdCzc5ZoO0zv88j+FCcX6tIa4kvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4JjyQSeZeEl+XhYq+Da1SDmIqYJBtCcEFcZpEFb+JNhSWJgjw+O2Mjis/kCjOXH+engEVTv/mqy5yWv++5WL67D4sBkVOG1OeCy0eK7rQ9zprMjknRf/4TpxwIMrZH8YeSfrcLbnin81wFj7MLeVFh/J6hvQFcYC2YuYtsRb0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxW/AdrP; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxW/AdrP"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-708a853c362so17142697b3.2;
        Fri, 09 May 2025 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746776491; x=1747381291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ye7rIPGO7oKTOhURnZxVJsCn/qQWh5VCeJGEhsIu90E=;
        b=LxW/AdrPPTEWFDzmLrK89bae22NsAaXFucsHc03Pda8EQVHVpUEPVv4d7uhCitvVun
         nPnOWdrECeKbkDyne5kIEdSdpDeCuRNdQWgF78sGxhA0pqcTGcVIFB/O4IaH/HcEqSvU
         +MRRKCAifF3IV8yq4diW5vntQQKb5FhklL46AUlg7Y8AqICfnwdCGSFSPCkPdxJo5v/F
         YwR1bWJk6H2NpIQ2Jrsx+pK7Pe7p8mcyEStRDe7vm7pVhq8mhsVjKxBVz4UnO0Sqjme4
         evZ7wp3iXVr3dY9GYCzXikS0rI2BTR4BIb68/Qw2EJsgYVkT4TMdqKhdUVoNnm525AZu
         mcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776491; x=1747381291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ye7rIPGO7oKTOhURnZxVJsCn/qQWh5VCeJGEhsIu90E=;
        b=tg6wzBEEtlJuA5jlGznLW6d9+4WtY+wxxwRa4kkCg0nAFuCJRnEjYMr/BiFH2m5HX1
         wPJyxZKIymUTiAk3ykVeGb7i5th8IbMeILxu69CFKx6OqukMRDzfpMX2ZX3jeaS0D+/G
         TkMKscCTYEeST0/6P+SDJ9hi1/k4OfXQsEQqqc+bMDgeHcq84fx7OtTqbfspqrDh6cs4
         zDUr5yI8c/9SQRdqftxHfEqp4/mB4Rj1tXyNPpZy9Z+HpdwTJkuI56WAKbaRhCE9V0/v
         ZLlFVya4+6Gc7cJE6FjYDRbJ+IiLksZXUawSOxTeoTeEEHLgZUs2YYLVId5z1H4FuLf2
         09BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCPXr4Hr54Hrol4Iwe416AtYphl/px6qUkdzKl4BppMGI0Vc3Ps03XMX9kIngGTrun8WtgxqAqXhOc@vger.kernel.org, AJvYcCVJgSCNO0gloOt/q1yvu2Pv7ejy/S1bcmseBgqO46+wwfiHjC3hY6BsgkymAwINZZ6uycXoEFrbeQYU@vger.kernel.org, AJvYcCWSj3cW9Sdv00NC1kr2IKkpVFV/DAGpi14CGaPGN58YVrpFN+eZr+qr+uVYSIBkBYj4/ENp616leq1fXX8I@vger.kernel.org
X-Gm-Message-State: AOJu0YywbP7CJqpLkXB6NEfzNjtBfq8tHXFvieKe7K8QpRuvhfK4cusT
	qlD+r07q8RKKPii9J5T8YlenTVwm5W4TiqWJB+xNnWAZq+GKZeefDIxHY+WptZZkndZvBkG1hZT
	WermsXXTq5qpI0uDbSoevWdLChuY=
X-Gm-Gg: ASbGncv/fLW6p3oOcOXeeO+SZjrsnNKvbPNC0JTgDo9e7r7JTgGbOiFjc3YZkuOSuSv
	lcyFBjGq5Fdlm9boYlXs87YA7SHKnxlp7G2tIXzs2zqMC7q7Zkp5bkLfHw9Wn8PhvmsTqdDsbMp
	3CP62/4xS1mDtAp4NSltfKsSI=
X-Google-Smtp-Source: AGHT+IGvkBefmqT0OnG87syXeRA3zl+7ZbjUE1o+Op5MMkoHcI93LSKQldFIuzU5TcJjgkm7YP+ahU+NuCOdLYn387w=
X-Received: by 2002:a05:690c:3606:b0:708:be8b:8415 with SMTP id
 00721157ae682-70a3f9ec7bamr32338747b3.1.1746776491333; Fri, 09 May 2025
 00:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
 <20250509065237.2392692-2-paweldembicki@gmail.com> <272301e5-6561-499a-91eb-615fed4727fa@kernel.org>
In-Reply-To: <272301e5-6561-499a-91eb-615fed4727fa@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Dembicki?= <paweldembicki@gmail.com>
Date: Fri, 9 May 2025 09:41:20 +0200
X-Gm-Features: ATxdqUHXjtSflO8ksX9UgpKJ0JRin_SxPFkWNwLey2-t_RPh9BHyKI_7T9j8Rjk
Message-ID: <CAJN1KkxPOuZqRwysx3zu_5ChODn2wnizKXzfEZHD2AiHAbd0ig@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hwmon: pmbus: mpq8785: Prepare driver for multiple
 device support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Noah Wang <noahwang.wang@outlook.com>, 
	Naresh Solanki <naresh.solanki@9elements.com>, Fabio Estevam <festevam@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Grant Peltier <grantpeltier93@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shen Lichuan <shenlichuan@vivo.com>, 
	Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 9 maj 2025 o 09:03 Krzysztof Kozlowski <krzk@kernel.org> napisa=C5=82(=
a):
>
> On 09/05/2025 08:51, Pawel Dembicki wrote:
> > Refactor the driver to support multiple Monolithic Power Systems device=
s.
> > Introduce chip ID handling based on device tree matching.
> >
> > No functional changes intended.
> >
> > Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> >
> > ---
> > v2:
> >  - no changes done
> > ---
> >  drivers/hwmon/pmbus/mpq8785.c | 38 +++++++++++++++++++++++++++--------
> >  1 file changed, 30 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq878=
5.c
> > index 331c274ca892..00ec21b081cb 100644
> > --- a/drivers/hwmon/pmbus/mpq8785.c
> > +++ b/drivers/hwmon/pmbus/mpq8785.c
> > @@ -8,6 +8,8 @@
> >  #include <linux/of_device.h>
> >  #include "pmbus.h"
> >
> > +enum chips { mpq8785 };
>
> Use Linux coding style, so:
> 1. missing wrapping after/before each {}
> 2. missing descriptive name for the type (mpq8785_chips)
> 3. CAPITALICS see Linux coding style - there is a chapter exactly about
> this.
>
>

Sorry, I was thinking that it is a local pmbus tradition.
Many drivers have the same enum without capitalics :

grep -r "enum chips {" .
./isl68137.c:enum chips {
./bel-pfe.c:enum chips {pfe1100, pfe3000};
./mp2975.c:enum chips {
./ucd9200.c:enum chips { ucd9200, ucd9220, ucd9222, ucd9224, ucd9240,
ucd9244, ucd9246,
./zl6100.c:enum chips { zl2004, zl2005, zl2006, zl2008, zl2105,
zl2106, zl6100, zl6105,
./ucd9000.c:enum chips { ucd9000, ucd90120, ucd90124, ucd90160,
ucd90320, ucd9090,
./max16601.c:enum chips { max16508, max16600, max16601, max16602 };
./q54sj108a2.c:enum chips {
./bpa-rs600.c:enum chips { bpa_rs600, bpd_rs600 };
./adm1275.c:enum chips { adm1075, adm1272, adm1273, adm1275, adm1276,
adm1278, adm1281, adm1293, adm1294 };
./max20730.c:enum chips {
./mp2856.c:enum chips { mp2856, mp2857 };
./tps53679.c:enum chips {
./ltc2978.c:enum chips {
./max34440.c:enum chips {
./pim4328.c:enum chips { pim4006, pim4328, pim4820 };
./fsp-3y.c:enum chips {
./lm25066.c:enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };

> > +
> >  static int mpq8785_identify(struct i2c_client *client,
> >                           struct pmbus_driver_info *info)
> >  {
> > @@ -53,26 +55,46 @@ static struct pmbus_driver_info mpq8785_info =3D {
> >               PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> >               PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> >               PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> > -     .identify =3D mpq8785_identify,
> > -};
> > -
> > -static int mpq8785_probe(struct i2c_client *client)
> > -{
> > -     return pmbus_do_probe(client, &mpq8785_info);
> >  };
> >
> >  static const struct i2c_device_id mpq8785_id[] =3D {
> > -     { "mpq8785" },
> > +     { "mpq8785", mpq8785 },
> >       { },
> >  };
> >  MODULE_DEVICE_TABLE(i2c, mpq8785_id);
> >
> >  static const struct of_device_id __maybe_unused mpq8785_of_match[] =3D=
 {
> > -     { .compatible =3D "mps,mpq8785" },
> > +     { .compatible =3D "mps,mpq8785", .data =3D (void *)mpq8785 },
> >       {}
> >  };
> >  MODULE_DEVICE_TABLE(of, mpq8785_of_match);
> >
> > +static int mpq8785_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct pmbus_driver_info *info;
> > +     enum chips chip_id;
> > +
> > +     info =3D devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERN=
EL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +
> > +     if (dev->of_node)
> > +             chip_id =3D (uintptr_t)of_device_get_match_data(dev);
>
> (kernel_ulong_t) instead
>
> > +     else
> > +             chip_id =3D i2c_match_id(mpq8785_id, client)->driver_data=
;
>
> Do not open-code i2c_get_match_data().
>
>
> Best regards,
> Krzysztof



Best regards,
Pawe=C5=82 Dembicki
