Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5E32AC17
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745260540; cv=none; b=djuQzfLvqhYO0YP07uVUv9Nz/37Dcv8ANjBEqLuWAxeisPeDheUeKph+lR58J1jITiwf5LZ8Sn5yTgD8EJuWSKdhEcHydrITHLvN7j3aAxLwfWuxGOr0lGYkio8Sxikn2394Z1NLXfiZJX07yTAszRTj6anBdYt5BADcZAvclDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745260540; c=relaxed/simple;
	bh=4FLRQyjA75esPKig7/y4NlRRSxQw8Np0LZk/qpjqZyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoIBsDiaqgkiQwMqnkOguClSKLiqEeUx0IBaZowf4jrsqAOnJfWY4EVBreuWxUaGOnvbYRtOS3Rq+QIAH2b5SGY94T91b8Eo91Ui0hAp7m0qrK0Um0Hr5r+yk/Jm3YBeTVeTeExdqvBLFrZOOWSQ50gtStn1mELYxAJg8jMAVq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=AUZow65w; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="AUZow65w"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so602105766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1745260537; x=1745865337; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4FLRQyjA75esPKig7/y4NlRRSxQw8Np0LZk/qpjqZyc=;
        b=AUZow65we6O0ghO29cfljfr0QONWBrtSmS1BmishEhzy7XCm9dWjRp2ln1q72ZtIDk
         15zRlkWjAuFSc5WmpotRBXm73810rv8ZTkmm3iCUA9zFp1Bz59nlGxaRDlxexcpav20L
         O7vj4tEd8mCOz73vUbOUcCXKRPWpvqXZGFPxzZtc0MBp5hj0qY/2tW6EKENvp4un9H5p
         IbMiRmJeFI7G70Oyg5IEwoOR9HjVO2O3nyK0Ni10B9ZlMU5mUMWUN2GZ+vjUvajC8Eys
         +mckjpQclI1BCJE2njzEDT1vIB+949Cz7P9DLLBSsxxjwvgwzexGct7XE3GVP+819YXF
         8oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745260537; x=1745865337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FLRQyjA75esPKig7/y4NlRRSxQw8Np0LZk/qpjqZyc=;
        b=u9yFuYZf+LG6YnpvIrBKWh0UMM67RjPs4KEHtS1J+ZNB9YshupLjLOFCahl0s4fL+e
         xCyoTgnTfwP9DqfBJ846Yo2iuXYWxWjCDxKykKxGqTmBVeDKnUbTa6PKadA2/Vh9egSJ
         u4PEABigd+jF7pRLhGbL/v/xOsLDcnYdfXdMTwae7iY8PfP/CH+mfRUqj7C241mmR4iu
         LkrLFnoq+UX/9a6ReNGLE3XY9D5691t+amCFhbI3Gbuw2wxkxHED6KHLE44g8td6hcm1
         im6tXw1x6NHLo9GVAmmS9hb4q2Yl0HuSJ57D04/xBI3HrN4ZgnnMRReHjHNmrsTxt0KV
         /4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVXvR+cAnsKG+4TF5eDhYlUprT8vk+YIY3g73bA8QWbcL+IPuEWHdE/EHM9c6XqGBCwsV5JJNyhQVIW2Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJxMmtqHJIa3NKeA/FZEVu+EIydLSF6k8wJ4y7pSQ2pcQjFd/
	WxhODXiILaQk/XZTJ2g4Wyxp7aCG4zoVC8naq+I/Gq//Ojwm4mIYyjI0862hlJbFufLbAfdrdOn
	+UZkpP9MjeEG4I/5qnGOxBlaUW13kLfiJkZuNag==
X-Gm-Gg: ASbGncsdfgd6x61p7yz2YWxijzYI359aIdedAcO+fPz2UgiSvCQ06xUlEBM6iOyqKp2
	xjNaE3wQLH+o7spO5GAIlPwO8bff/X6M1i9TRNI+PjENmHeZ99Zvk6szbaRgdc8jmQYmhb/JBxg
	atOcFjYyxscU0MjYP6h6mfQ+PQ4J0d7PsDiuRgxA==
X-Google-Smtp-Source: AGHT+IE5NsNCI+kSyoHvC9OQcfQ6IA5pnZM66lb3T0Xl4ORadIa8suDDI9TihzbYKF8je2HDB9RwxpCTtXdUnDxvDpk=
X-Received: by 2002:a17:907:9484:b0:abf:c20d:501a with SMTP id
 a640c23a62f3a-acb74b0594cmr1252111766b.16.1745260536560; Mon, 21 Apr 2025
 11:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGis_TVSAPjYwVjUyur0_NFsDi9jmJ_oWhBHrJ-bEknG-nJO9Q@mail.gmail.com>
 <aAZiwGy1A7J4spDk@kbusch-mbp.dhcp.thefacebook.com>
In-Reply-To: <aAZiwGy1A7J4spDk@kbusch-mbp.dhcp.thefacebook.com>
From: Matt Fleming <mfleming@cloudflare.com>
Date: Mon, 21 Apr 2025 19:35:24 +0100
X-Gm-Features: ATxdqUGuIHx3xDv6mmbv-jEXqc2VauXMxiapduY7E4gkT7FUIdHRX2Vdm7bOYvQ
Message-ID: <CAGis_TXyPtFiE=pLrLRh1MV3meE4aETi6z36NWLrMkYKkcjGNQ@mail.gmail.com>
Subject: Re: 10x I/O await times in 6.12
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Apr 2025 at 16:22, Keith Busch <kbusch@kernel.org> wrote:
>
> On Mon, Apr 21, 2025 at 09:53:10AM +0100, Matt Fleming wrote:
> > Hey there,
> >
> > We're moving to 6.12 at Cloudflare and noticed that write await times
> > in iostat are 10x what they were in 6.6. After a bit of bpftracing
> > (script to find all plug times above 10ms below), it seems like this
> > is an accounting error caused by the plug->cur_ktime optimisation
> > rather than anything more material.
> >
> > It appears as though a task can enter __submit_bio() with ->plug set
> > and a very stale cur_ktime value on the order of milliseconds. Is this
> > expected behaviour? It looks like it leads to inaccurate I/O times.
>
> There are places with a block plug that call cond_resched(), which
> doesn't invalidate the plug's cached ktime. You could end up with a
> stale ktime if your process is scheduled out.

Is that intentional? I know the cached time is invalidated when
calling schedule(). Does the invalidation need to get pushed down into
__schedule_loop()?
