Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED9E269CF0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164885; cv=none; b=l4gAULruG+qwjOMt6fisl/AhYvNNrHVsB2xyjQrzLiZ9J2sdu8Rm24/Mf2hgQoVDOkhYZVBvTsh7/O5SB+cEI1yzekx4ZJfoBjtPaS1vuZnw51+9viZ8XwFF8shQqFdIidSsz9lJtitmXyWZL0UE4rIYhodXAUEN/x4etIwERvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164885; c=relaxed/simple;
	bh=FxzlxQZZ8ErMBigR9fc+Rjf5JKpOe1VdKISwtp/3ATE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMda+mrH/gCx6JjBgGjmOIpSfkpnq5y2o129VpiUfI3wB1zYytT9dKBpbFfXij9OizyexrFt8TWzCi65jx2AJ2M736ntoS/jMG7CGjhPnBUk3CSj3mgFg+JdkvQIbfl3mIXxHHBWplFIMWzhIV5I49UlvTtT3pP+F5yqBwHpSTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MXPtRxzw; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MXPtRxzw"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7481600130eso6216559b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750164883; x=1750769683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIz/FMRtgwsTC+HYTMdCl4f60+W4V34OeVftKEDL+z8=;
        b=MXPtRxzwQXk2l3JY8lPGaA8SNNErTITJVRy38BJeZXZ8rj9SZthnZgFA9PKeHBAYbq
         G6BB0Q7pMQyJzTnTuVg3mK4xv3RJrzZzJD/8EzAzBz4XV2t+Ihyl/BK1x3yUINNqQQuI
         65FIjlr7XZU0CrV0c5f+dHuoaupgsfReN2JFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164883; x=1750769683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIz/FMRtgwsTC+HYTMdCl4f60+W4V34OeVftKEDL+z8=;
        b=GrwlbvJzBnWTtnWA/mLGztVPUV2rJWDY/fD1eMg7eqBQdTolorr3gCL1IpkqcBeXZs
         9sz7ii7H2sB+QROCQtMfMrHmy3QSETkS8ECrJ7xtzuJ7M9uAgUl9BPtNYYpaDb/s3OHq
         +XzyJxQMYvJgbNlYBxjgsryJkbTEmAc7NiNbIiueM9j2bHlEHeBJ+/XWoPh8rpcA8QTi
         nAawINr+8aak3q7Myul6SnNZ0TAPSh/LbYoTdhttlQzPlFqDw17i0YKqriQxiEzXt/5J
         g085X95UeZUncOJt8E/w2mmBlJ3xCj5/vfv/mmyI3RIin5bLdtJ1qOjpSruI6ER+y9x8
         ImKA==
X-Forwarded-Encrypted: i=1; AJvYcCVocrRD86APQ3ourJ0XFFjpq7aYME2pe4yNYRURzTO2ueae8JZ4dCeQdikcDItRjiuORl+mrwGV11fiqb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkwZVguPLYXy5IP8eU7TgQRWp7gqp/5+5nS4jm46uOkL0FJa5Y
	SvHd2JYouerJkSWOLiFFbnGmXhihKdIrkmp7o6soGlkcz36QMgtA2Fnl618YZkWCpmBKPOUL2WE
	hAgv/Wcjwf9Rv6iPY/eRy+KaVCZXHwNpGhH7oOT7Z
X-Gm-Gg: ASbGncvhd6ycV9pgGXkKScEftda3Du/5Ukf1Z59SzNtmZu/XXMUnI7vv9FowRTAa5im
	RgUxBOGhhAvk+MaEOnBTY06ph+ifnSVUgee11HO9+N6PhyN6nd3xDA6N+40g3Riub8kHjAfNTo7
	6UxQKjVmR7PJuenRkfPh+iqjAIoo02hzxGBrD1wc389uEmNzZN22/B1fhtxPAkIoGJ0Lds
X-Google-Smtp-Source: AGHT+IFNOIUYi+5hHdN381jMozlhdv8TZWEs3iifK29iavCfU0mKB9p4IykhjV/IvnnwJXRpXtMdEPE9xxaRduPeRhY=
X-Received: by 2002:a05:6a00:a86:b0:73e:598:7e5b with SMTP id
 d2e1a72fcca58-7489cfc27edmr16829475b3a.1.1750164883054; Tue, 17 Jun 2025
 05:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-7-akuchynski@chromium.org> <aFEtT5JAaGQIs-vG@kuha.fi.intel.com>
In-Reply-To: <aFEtT5JAaGQIs-vG@kuha.fi.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 17 Jun 2025 14:54:29 +0200
X-Gm-Features: AX0GCFsTu0UqkokKiq4xWkmUWDTeZ6ZnpJ0o1xk-NKRJ9vpe9u9k_-Fhg2uUkHU
Message-ID: <CAMMMRMctfOabMK3Rwfk_i+P0XsLECg5yOfhYO+9yqp-SFZrVEQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status
 Update NAK request exit dp altmode"
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <groeck@chromium.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 10:54=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Andrei,
>
> On Mon, Jun 16, 2025 at 01:31:43PM +0000, Andrei Kuchynski wrote:
> > This reverts commit b4b38ffb38c91afd4dc387608db26f6fc34ed40b.
> >
> > The commit introduced a deadlock with the cros_ec_typec driver.
> > The deadlock occurs due to a recursive lock acquisition of
> > `cros_typec_altmode_work::mutex`.
> > The call chain is as follows:
> > 1. cros_typec_altmode_work() acquires the mutex
> > 2. typec_altmode_vdm() -> dp_altmode_vdm() ->
> > 3. typec_altmode_exit() -> cros_typec_altmode_exit()
> > 4. cros_typec_altmode_exit() attempts to acquire the mutex again
> >
> > This revert is considered safe as no other known driver sends back
> > DP_CMD_STATUS_UPDATE command with the NAK flag.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/altmodes/displayport.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typ=
ec/altmodes/displayport.c
> > index b09b58d7311d..ac84a6d64c2f 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -393,10 +393,6 @@ static int dp_altmode_vdm(struct typec_altmode *al=
t,
> >               break;
> >       case CMDT_RSP_NAK:
> >               switch (cmd) {
> > -             case DP_CMD_STATUS_UPDATE:
> > -                     if (typec_altmode_exit(alt))
> > -                             dev_err(&dp->alt->dev, "Exit Mode Failed!=
\n");
> > -                     break;
>
> Commit b4b38ffb38c9 ("usb: typec: displayport: Receive DP Status
> Update NAK request exit dp altmode") addressed a very real problem
> with failure to execute data role swap. You are not really offering
> anything else for that issue here.

Thanks, I see the problem now. Reverting the patch is not feasible.

>
> Is it not an option to just schedule the mode exit here instead to
> solve the problem?

Of course, that's an option. Alternatively, maybe I could resolve the
deadlock within the `cros_ec_typec` driver. Regardless, this seems like
a separate patch.

>
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index b09b58d7311d..2abbe4de3216 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -394,8 +394,7 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>         case CMDT_RSP_NAK:
>                 switch (cmd) {
>                 case DP_CMD_STATUS_UPDATE:
> -                       if (typec_altmode_exit(alt))
> -                               dev_err(&dp->alt->dev, "Exit Mode Failed!=
\n");
> +                       dp->state =3D DP_STATE_EXIT;
>                         break;
>                 case DP_CMD_CONFIGURE:
>                         dp->data.conf =3D 0;
>
>
> --
> heikki
