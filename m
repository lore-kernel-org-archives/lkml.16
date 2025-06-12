Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6241F4E57
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721175; cv=none; b=MSv4eaqeO4kNchxwQzhLhh9z+9vkQXTq3nU0bTBQ1EliSdZYTFeR+OIMdvpAJxLQNvCDWNrSfJc9D9HRu4OOD9jvX/T1oh+ub4DrhQ5pZkDMU21RubUpQsikJAM1ObDRWU75JowB1NMe8W/jn4Siu+oIa2WWYNV5o/XNt9O6Kqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721175; c=relaxed/simple;
	bh=dnq4Kqm6fSqCRzF12qtgEyXi9NqtVvCQnc6eayvdDLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXNG5viQb8aY8KZslv4tUOryjdhRrpOWQzraGyS1omJAA3UZiyjtLh86MlUe2aWmxeMEbDHW48hH3LwEKYoYb78AqLqbAU3t4rNXR8HSUTr35859BDOL8YANYWqnciFS/aZTMTXltoJvudgSApLaURvu6R+ZQcPGKHB36g0EdxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EwKrb1y2; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EwKrb1y2"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54e98f73850so733934e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749721171; x=1750325971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYa9QBennZQG7PLxiRiq9NhWekReoajYsItOs8+hn+Q=;
        b=EwKrb1y2Ph+jihhJjuYYHD0+r2fZ9ZGQ0YUzS+StXcg1b0/tpG7w/LBCO2qO/AYQVc
         ljZzIKVeqX7VTr9cAcKX+YUHIiSWPF+RabcEMRzi/nWciKNTg1DRFJ83Oc1VJtQnuHcX
         C7adzz56n4MuYowlq/kdnJhvsvpuO1f1pD1O/J67827Eq1T+CUnq5UMXOuYpB1sv3rGR
         yjRWfh87OSd4ftmqtMf3758BVBDGX9mZThful9wF4DeBWs6sZFLDoO/o+P9kws2dvAex
         TmgAf/08Fio2aZAZ/UJlQX48VE2Su7AW169l4lcQ8N5IoEOXn97c6mfHap4g7nECRAsc
         4zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721171; x=1750325971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYa9QBennZQG7PLxiRiq9NhWekReoajYsItOs8+hn+Q=;
        b=Io8+PFzpIwPazy6V2BRcAagDRRAMHkzWZsDweMPRhXW4AU0TrjAjlt/nlKp2XHhO3Z
         cevZMCB8yAhwtQa4Y8KQ2TVkVslDpPpWqho31rOFh22rMm0QD/L9GkLrBKPZsru3ZkKV
         3LDzy4/QvDmd7XsqkwVBim5mOpSAQ3kQpffJDONlpAWqmvRkcDOHJJu/S3PiJTb1zYjb
         v8LFdzj1+1jDA5NUb+vA/fHAxuZRlfGMfdfl0j0u5jaW4yn5GdcPglWVeCSZlNEsp6XV
         z1pt2l8qqh9R7Y04lM3JguJqQl9ikMqafIyBqln31HoFjN8aruXprKR2UA05zUqg/NBw
         fLIA==
X-Gm-Message-State: AOJu0Yx4XgcgVh7iEcXvRK/4pX73gIQxW/174Z8+TYFp+81doEALk3sN
	5jrbMGveDGzPzvdQ9MpK+izhWq1kLhAyyjbLJ1vhP1xtrJJndxXUFqEn8+K4fZDbg5qtXKvPZk6
	C7csuBs37qIMAfMIA58USXh9sDM4d8K6tpABjLaNckA==
X-Gm-Gg: ASbGncvtikB2JZDCWP5LpzFufrUZ3zfAavI7xZ5nhS1jMemOFguIHc8d9MzhK2NfYad
	qwSe9rOod5qeVUHo2QCGkJXINQ/OpgnTed7nYFWfDNJrDq7TXGjg0b1IJ1iNzucA7Umf7wcSnuP
	pxeAgg5PQQKisjM7C6h9aWU71sfyLoekoToiX/m2oXzZlomPofchBoHgs7asYJQpcG+xq0hRo8s
	zWe
X-Google-Smtp-Source: AGHT+IEbv2oWUu7d6U0eOLPy7XjUwLgkn0WPKHAHjLrRHhZ95PRaKyt+x/omfieqfEcrlVL14UlgvYibj7Vh2Del2pk=
X-Received: by 2002:a05:6512:1292:b0:553:246f:d5cb with SMTP id
 2adb3069b0e04-553a65375f4mr640952e87.40.1749721170811; Thu, 12 Jun 2025
 02:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611131438.651493-1-marco.crivellari@suse.com>
 <20250611131438.651493-3-marco.crivellari@suse.com> <aEnuj0LuIVWrszuv@slm.duckdns.org>
In-Reply-To: <aEnuj0LuIVWrszuv@slm.duckdns.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 12 Jun 2025 11:39:19 +0200
X-Gm-Features: AX0GCFt3T9M2C6pigy-Rt6KpRhxCEgTl0RHgKiKFDZKiZB8dEC4gjSWl-NYBqNg
Message-ID: <CAAofZF7X2Uo7Epqd4zi6+AqvdP2XFWb+zJq6C1f0bK6y0S-Zdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] Workqueue: replace use of system_wq with system_percpu_wq
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> I think this needs to be broken up per subsystem.

Do you think we should do the same with patch 3/9 ?
There are less files changed (79) tho, maybe it is not
necessary.

> Can you please post the workqueue patches to add
> all the new things?

I will do a new series (starting from v1, I would say) with:
- new wq(s) [actual P 1]
- new WQ_PERCPU flag [actual P 3]
- doc changes [actual P 9]

I will likely send these patches by the end of the day.

> I'll apply them to a branch and then you can send out per-subsys
> patches with the description explaining what's going on and asking
> how the patch should be routed including what wq branch to pull
> from if the subsys wants to route the patches through their tree.

So that means, if I understand correctly:
- send the new percpu patches per subsys (I will start now breaking up
by subsys)
- send the same system_dfl_wq patch (if we're not going to split per-subsys=
)
- send the WQ_PERCPU changes per subsys and the other patch that addresses
  the rest.

In summary, that means send all the patches of this v3, except for
those mentioned
above (P1, 3, 9), and of course the new patches adding
system_percpu_wq per-subsys.

But I'm not sure I understand the next part. Where should I ask those thing=
s?
For every single patch (commit log) or directly in the new cover letter?

Sorry for the dumb questions.

Thank you!

On Wed, Jun 11, 2025 at 11:01=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Wed, Jun 11, 2025 at 03:14:31PM +0200, Marco Crivellari wrote:
> >  110 files changed, 208 insertions(+), 191 deletions(-)
>
> I think this needs to be broken up per subsystem. Can you please post the
> workqueue patches to add all the new things? I'll apply them to a branch =
and
> then you can send out per-subsys patches with the description explaining
> what's going on and asking how the patch should be routed including what =
wq
> branch to pull from if the subsys wants to route the patches through thei=
r
> tree.
>
> Thanks.
>
> --
> tejun



--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com
