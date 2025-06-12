Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8589280BEC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714445; cv=none; b=FCC+CUWCz8sKqFuiE1X6vhLGTnK004P/bowSe5mlHQZzSxhdlPyiym7QQv0ugIOOFXQUQg4NeTzh8rofHLSy9ke8ewtHy9nxhvuKjjSPFYaNP7H38LFLtK/n+8WADHdo1tjQGAU9DN/IoTDmQFR9u4ty4h/XQzQI6YYgxotN2U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714445; c=relaxed/simple;
	bh=fc6bfP0xgbtbQmbfYLX34eWUky+PFXXuaWFAKjBvay4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvB5q4aS2JAV1louxWikm/74KdYbjvT9WQlk/APiFek6RwoEKWsP2FQwU+c8A+BimLIc6uYehTb5/+1yD9dPCRJI2PEBuDJ+MBt32nOtjNH5wudKHqI6nBBtTVmhZYMbPT12bhB5eMi9dyOqOUMr3uRyRWoP4oWzIZZMBhEU34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XLE31jFq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XLE31jFq"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32a806ef504so5885441fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749714441; x=1750319241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WD2/H5DRIQn2qUXSHtWj5zcgfuXeOq1gBJm8OtnThSc=;
        b=XLE31jFqhS2ZiVsl8xD2WYRzldVJSQxIZAs2xPF9ZznXQ81BFQ/sX9/WWj3EB58YZ7
         TqZn4piRAK7TO+dyT1ReGWfWncrdjyuv98wQdTYwJz8rFG+BvhGbSUcXFLr377/MTE76
         tobHCj57L5KYyKinjPCLWht2/JynnQzF8nyS7wsh3FbeoI3QHxPv4Zmf5fvf7UlCMBzN
         40L44K0l8o9Xxj9v2ORwpWVdJYqi9NPsTI/2EWnf+Au43v3IFN2BldIdhNFdq671WDGO
         Fa+Z8jqxiGZZUU6zeer8kCIfm1PO9ImpMoTyBc0+ipOcfccms/fbb9Bl0IyEFdWChwrI
         4tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714441; x=1750319241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WD2/H5DRIQn2qUXSHtWj5zcgfuXeOq1gBJm8OtnThSc=;
        b=FpcsZv+X1JM/psXYCPni1VySZq2RcDM/VUnlp3rtIIvX52gk00Geoz9lPPD2rSsy/p
         w1D629gUqazusD1MHW/Qe2NwESEUv+vSNKD/2n1/YOHgEuHDl6+v3/56KJchGYHwgcis
         1eUPWUbXj7+8aX2jZMx2Nga9RymdmmHIxAygEeyBhlgyBZFMQlmcnqriGWvYkuhBl3iD
         Rr93yVhh8pihmboEJQYwN6Sy7USwdac+D8/OlgKdDg4LrN6ENHlcZiohhyEGvd3jg0px
         aou2tJRZAV490GWagFOlBH0XpKzxDc0eS7fgROyzj5gW8KS6r8qCpGlaUUKDgtzqD1ad
         ZPxQ==
X-Gm-Message-State: AOJu0YxxZVYx/Lu69JXlpNPrAZrIhEi4S+efPi4OTBpSLg/DCdgqE5iO
	h9OzF5cWhrKTSFyv3FXmGy3FgT1nY++kiy+vH61kEjcSpY0nqX50+KOOUJAw9TewfPDvevQTW+D
	926lwMQ0ZRps9dUU0h+h2apg4+VReyYiITmUg+ep6xQ==
X-Gm-Gg: ASbGnctKVUcisbqRDHm0n7CB2MAWY3NblCNN131jd18u6IVZMt/xa51MHYBd988NtSl
	G3fRzfqkD9c4CoZpqqErkB2wx9KotI3JRp35dISFiV17RFZQU2mR2MJE6lvpxBVFg5M7dPzraVq
	rYpdeQQH/dfoai8c872/Cb7hhN9iGmnwiXB8tHDngzkm9UKdsO+CwFXaWU1d9WezcihlKv7x2f4
	j/l
X-Google-Smtp-Source: AGHT+IEHaC0Jlu68E77dZWFt2uo6Ms70mzERgW2HTSHU45uJ9pkeuPurHtzvRIcJTAaiAlTUyhARN820Cq//8P/5SjA=
X-Received: by 2002:a2e:a552:0:b0:32a:943d:e43 with SMTP id
 38308e7fff4ca-32b326c56e7mr6013101fa.22.1749714441418; Thu, 12 Jun 2025
 00:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611131438.651493-1-marco.crivellari@suse.com>
 <20250611131438.651493-2-marco.crivellari@suse.com> <aEntuUxOGU1DA7Fu@slm.duckdns.org>
In-Reply-To: <aEntuUxOGU1DA7Fu@slm.duckdns.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 12 Jun 2025 09:47:10 +0200
X-Gm-Features: AX0GCFuv68hn1XWuYdQ_AeP6QoRxbac7nMI3j4biPyCM70oo7w-ZnUqZAdEITnE
Message-ID: <CAAofZF7ThUEqdg4sGe+LjxgH8VDn_BBVQqbagycGTQE1cECF6g@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] Workqueue: add system_percpu_wq and system_dfl_wq
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, sorry, I messed up with the rebase.
Already fixed for the new version.

Thanks.



On Wed, Jun 11, 2025 at 10:57=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Wed, Jun 11, 2025 at 03:14:30PM +0200, Marco Crivellari wrote:
> > -extern struct workqueue_struct *system_wq;
> > +extern struct workqueue_struct *system_wq; /* use system_percpu_wq, th=
is will be removed */
> > +extern struct workqueue_struct *system_percpu_wq;
> >  extern struct workqueue_struct *system_highpri_wq;
> >  extern struct workqueue_struct *system_long_wq;
> >  extern struct workqueue_struct *system_unbound_wq;
> > +extern struct workqueue_struct *system_dfl_wq;
>
> This patch is just adding the extern decls. Shouldn't these be created?
>
> Thanks.
>
> --
> tejun



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
