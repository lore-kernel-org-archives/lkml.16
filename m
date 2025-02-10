Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498CF25C6E8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216795; cv=none; b=LsnzexKx7K7naWQqj6K3D83R1fSEV2hIG6pH25Il1HaLFCnNqNZLyuR2pwbeSN7kr4M3w8d2HffhD680xEOXc002gn3IYNfJXsKDDq6weU0MmXCWO0lj/nuKp8NSTqBgbaG5wJizgriAiZgayRPXJeIvIOnh7L9vwgN+xPD4C14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216795; c=relaxed/simple;
	bh=+QqD9JcVdQ0GoQGZ+fwy4NqhSvaZiMmMk+i43GEHtko=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Napj3gJUShhYs1ZfdxhH2mI2T6T8tamvDVVkGhHMdF3jymJLJimPF1pA7cDInCAkyIAc/9St2XEnrINW347hDy0NbwLGWyrmtLlhzbyTH0973PIhFxOcaFj22zkLW/8T+4fP/xCh+CwvxaiEYfRFuHKJ8ZDFAgjw+lmf0aF8avU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E9BEB2BA963;
	Mon, 10 Feb 2025 20:36:52 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 3Ui5dV0zxQJG; Mon, 10 Feb 2025 20:36:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 61ED52BA970;
	Mon, 10 Feb 2025 20:36:52 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6HJqwUebRPMJ; Mon, 10 Feb 2025 20:36:52 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 401FC2BA963;
	Mon, 10 Feb 2025 20:36:52 +0100 (CET)
Date: Mon, 10 Feb 2025 20:36:52 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	frederic <frederic@kernel.org>, tglx <tglx@linutronix.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <184657480.17391174.1739216212140.JavaMail.zimbra@nod.at>
In-Reply-To: <f5767e50aaa2935b3e4a0e9cf1bc4365d6b0c1a0.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de> <f5767e50aaa2935b3e4a0e9cf1bc4365d6b0c1a0.1738746821.git.namcao@linutronix.de>
Subject: Re: [PATCH v2 22/31] ubifs: Switch to use hrtimer_setup()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF135 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Switch to use hrtimer_setup()
Thread-Index: gdUYM1ebyMHzsrXZWWcnioTWCceBEA==

----- Urspr=C3=BCngliche Mail -----
> Von: "Nam Cao" <namcao@linutronix.de>
> An: "Anna-Maria Behnsen" <anna-maria@linutronix.de>, "frederic" <frederic=
@kernel.org>, "tglx" <tglx@linutronix.de>,
> "linux-kernel" <linux-kernel@vger.kernel.org>
> CC: "Nam Cao" <namcao@linutronix.de>, "richard" <richard@nod.at>
> Gesendet: Mittwoch, 5. Februar 2025 11:39:06
> Betreff: [PATCH v2 22/31] ubifs: Switch to use hrtimer_setup()

> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
>=20
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
>=20
> Patch was created by using Coccinelle.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Cc: Richard Weinberger <richard@nod.at>
> ---
> fs/ubifs/io.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
> index 01d8eb170382..a79f229df475 100644
> --- a/fs/ubifs/io.c
> +++ b/fs/ubifs/io.c
> @@ -1179,8 +1179,7 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct
> ubifs_wbuf *wbuf)
> =09wbuf->c =3D c;
> =09wbuf->next_ino =3D 0;
>=20
> -=09hrtimer_init(&wbuf->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -=09wbuf->timer.function =3D wbuf_timer_callback_nolock;
> +=09hrtimer_setup(&wbuf->timer, wbuf_timer_callback_nolock, CLOCK_MONOTON=
IC,
> HRTIMER_MODE_REL);
> =09return 0;

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
