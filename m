Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B921DE3DF
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698780; cv=none; b=BYvUS5o6qvboB7oJFhGXzs3SQH31hEJT9EpioXjB/PxLVgPhD/REvbl4Jjf3uasE2lJ2R/HzKBOKCgw9hfXV4kJCNot7YSL54/NK/AHQU4sIqLsVdfiiQ3mXomPiLqqJNpb1ROsbNUHwmYTQyU98eJIg7HGn0rnlZOO+pY7i894=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698780; c=relaxed/simple;
	bh=q7yD9E+5FXTgiEn9PuCJp38Irfbdm8jMWmnkpBAIlqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1LnDG9lt13HYcQZoKCqivPINS+7KyLZfI7hxoACcF///B5vQndGHYEoYg8/K3QonWon9Nn5jYfQWgM5AhswoljT9UHog5dOtFUsugGYDMVWWTn20QJdXi17AlDlVtNmI9foglurz4r/od+iKPN343DLheq1Zl7PO47MMnES6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AHBosqfQ; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AHBosqfQ"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7387d4a334so721087276.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746698778; x=1747303578; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Dt6fILG0823sTCQVUZRbrKoEDN8bmv7wajBdn4+1Hc=;
        b=AHBosqfQ1XmF3ojUJqbdIaMCu1+VPtMBv4K6utJsMzCY6LZh7l2Nana0VNsdl2SuSX
         uGkAARdEdWry4Rj6l/o4JLN1Zr0CEwdaFcmHSD3so2b58Oc7G2OQKb6gMpZTxItzs7Wi
         z5lRkdbx21hv4Uc1JdbHCpV5QohPjM1Ax81iwJ0B/MKHhTp6wliBDuqNbXM6Kq2BhL8i
         UVDEKnsWObTVzUTe2rrmq6c2zOspt8I9vUM9rLv9Q2lXCGw+EDkRA5FNKIcFOsh1qTBh
         wkO+Pd97tDsXZ0asJWkzGUcxittVQAhmVWMg4ic26Hpwo8sGwOUQIJemzjbQ2a8p+V+d
         Fk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698778; x=1747303578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Dt6fILG0823sTCQVUZRbrKoEDN8bmv7wajBdn4+1Hc=;
        b=ZXINvwbT/3R/Hes1iCxVRpvfpeVv48rhOxqZw1W5lisAtbxDMKggoeyYH4ojtLTrjY
         0Mg5ri7fZZK77fhlXVtEUtVJTVukvpaEklQdkhxWFGRNc9opuCoOWRImotfBE+jzIItG
         mqIxyVcHw0DghLagdF9/5BhBz96Ygbe7efBTLlY0EadlZ1BFlcS/RSfdPSXPeqAN7SJw
         wqB240Xw/ubrsmMHmRfRtFspWUXoxl23OEBl/1rKfR2UbRVRtAuXa7FUd5DHznDo7dfY
         62o/oASgFFaxtCQJ/NXKIY3jexYDeTUTCWnkpVSJ1Z5svPGnYSDGgTOvq9hGEbvQKMaG
         sWCw==
X-Forwarded-Encrypted: i=1; AJvYcCUy62eN9xjU7AyKzVUKBsOpdFJvPnX7UL137yRgs80nI0sfad49rBgdFQlWexOYJUCe6Rfux0H1vY217FI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaXVY1qIzMtK/UFpvQPepzX3mgqKX1Hi/HEQbdVKIkuirtFrOn
	FGm9mCF2f0xBaGbsSBYrbcrizIJw5Zavbo414F5jx8tSRXxnKTF1KyRQBIKw+gA+/gDIYkunhTM
	0oj8l6xl8bQxOk5NfAcsGVZc4Vuh2y03wcjV09g==
X-Gm-Gg: ASbGncsGMvsZpLPgBKetXqJxWbWyC5j5ZFpdfqFvwT0ZscZ2hPojoVJNi783zvJM6r6
	z28F87hFZqRfn2WVgqGijDO+hhKADz4LulRYoyEkLa6SuF+cD+WdkON6ON1uUaPbjOUvDfo1X+B
	xAClhTpF+sOr6aVtdsl7GuZe4=
X-Google-Smtp-Source: AGHT+IFLG8pqmlzvCqduNnPSERGgsArPUvpsmnVAsVQdb2qKBzJ4ictnEHeRy8JSqGPAm9xU4RfpdLw3POTBQQleFHg=
X-Received: by 2002:a05:6902:238a:b0:e6b:8025:a9d2 with SMTP id
 3f1490d57ef6-e78ef6612d3mr3061543276.24.1746698778096; Thu, 08 May 2025
 03:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-8-ulf.hansson@linaro.org> <aBuJD1izaMqKUJ_s@stanley.mountain>
In-Reply-To: <aBuJD1izaMqKUJ_s@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 12:05:42 +0200
X-Gm-Features: ATxdqUFYpoIU6GGp0joDEQyexOZbHsuxgOGeWCwXDFxBwA4ofoG0Bbeb0aHcVlg
Message-ID: <CAPDyKFrxzg2V5qjcnXQ=SyudkW4-nmSWG-8TkMOim+sSWKfboA@mail.gmail.com>
Subject: Re: [PATCH 07/11] pmdomain: core: Export a common ->sync_state()
 helper for genpd providers
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 18:23, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Thu, Apr 17, 2025 at 04:25:05PM +0200, Ulf Hansson wrote:
> > +void of_genpd_sync_state(struct device *dev)
> > +{
> > +     struct device_node *np = dev->of_node;
> > +     struct generic_pm_domain *genpd;
> > +
> > +     if (!np)
> > +             return;
> > +
> > +     mutex_lock(&gpd_list_lock);
> > +     list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
> > +             if (genpd->provider == &np->fwnode) {
>
> Presumably this would be "== of_fwnode_handle(np)) {" as well...

Yes, in fact there are a whole bunch of them in genpd. I am making
preparatory patch to change all of them.

>
> regards,
> dan carpenter

Thanks for reviewing!

Kind regards
Uffe
