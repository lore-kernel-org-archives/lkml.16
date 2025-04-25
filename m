Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358623D2BA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581489; cv=none; b=IpT5wo7jONkpbCrXpaE7MBc3wIckXCWHDdV7MFDqvzMbnaWcytT1fwJdYaYMwk6rdvO9L7koT2cmO9dYAomYYQYXPWxAozQQ/q48MrWLmupWc4Er+p9+nUipjg2rPkk39JPkBKvVw06eCf2FjnsyET04rza5+jFNc+5jSu+H6Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581489; c=relaxed/simple;
	bh=gMa3ssEUpcVwgHPMOV8wk/GlL9ZwJKDD2E7AauYhnRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+wjikVQKBTtk3BpB1R895O7herI7fQdCKboWNTQQxju+UJNSdsJcdd/Q93N3shCkbFyKv3eQOiDnYhm2WIxyglKdf9wBxqCXzmbUjGov93ebHabMkuPLsxwPRxbHrmYvokfPntj3QJAUiidEcdf6pF5PIVevHbfOFke6+Y9hvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ouzF2G+L; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ouzF2G+L"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-702599fa7c5so25339077b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745581486; x=1746186286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=esSq99zt7CxJ83pdRXGK5NP+KblKe1C6+QRELy9ZoFs=;
        b=ouzF2G+LZrCOZLC574/PEekAqN7gkXjoJYTRjN8N1B9uTUbKq6/et8vpsReI+/jtBH
         3Pg8a1bJ9+5KvzyLljCxWiVo0FKjNR7bPS3jnuCVHFSmNpKgmwO1cfu+LwbFwkuThP/K
         2zt05cZYwiYVAP5YNmvqDzUp5/WpwL6XkXYrgmqGM1O7j7G+MnJ7BNf/OPZXjkSEdg6q
         QzX54MImkhmCDZvPpdKuBHOCOMi7Fimc87FMAIQsQ2WM7GeH9xQyzhrp+AyXIl0/kYqN
         Rz2EYME+n6YQiyAi5RNxQXPl6/v3TtnHnhsaryOEoz5mtaphafYHf/Q0ySwJJNVgIFGA
         zUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581486; x=1746186286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esSq99zt7CxJ83pdRXGK5NP+KblKe1C6+QRELy9ZoFs=;
        b=BJzOWptf8zWlp10WU0w8y0V+/7In3aQWzfV0gZrtUOR7Pg4FKV0HRoMFaEtY26Zrqy
         lv+8/n9wI1gE0pBtQdsR3+vwF34LQI4BVGigikfGkkxxTPnEeZ2CUPhBSvYgKzXVwZYn
         PXVzG0mN6th+yJ2aD5MvU2g+1hI534ZPHYT1I+oCZGNzR5lNvaMaG0mRkCfyKX/oiRHP
         ZIFzV33yAfLNX+U0OV/Y6INqPjeD4HGUzoH795z0dZt22wmUpFXv3utIMrpbsRciyad4
         FNsQ6yGELVZ4GVTBaClyT9jvBNPE09vuHJD/HgrmO07ovUR/U9f31VaU7f7NG/JGNShs
         V2yw==
X-Forwarded-Encrypted: i=1; AJvYcCVBG1GGAEPRbxkY/PDekaqNWki3uL+2gMYdgqB3BONzoTNYY79qAsrqXpj8BvAPgsXEfJOeQ1i1ZNe5hmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDc+gKJP7OaxVYd0xycGzJpxtOkjDI7HN2ENgQRe53N1sBALA
	oh4wYXXBozNG0vowc8Jcf9ZdjokUXShQ8gft6ZeUHZ06y9vU+c1mVufjZqIIORbXszFmnkQf6Jn
	WC8y1QgIeXpcZdvtHZrnWaxmwh1isPuvr7Hn16Q==
X-Gm-Gg: ASbGncsH1Mq7ccxbzEKE7/dw3PutMg2/1hRX4VibsLdA7SBWGQxySwd7CemEKH5FSJW
	n0GUJMh3jhR140kIMEskAW759IJQGARH3vFUxrBpmdaCxmHKiZPm5NVSyJtvX5cvIDZ4aiaPhtG
	QkfaCYtsogQfBsxl6N4d6ykFEY3Prtq2gs4A==
X-Google-Smtp-Source: AGHT+IEL3N0R1jVxvkTRj2zeMmdPph9d/Vt7V+IZqwZArjRPQ0F6K/RnSoN7cuZ54z2colfHGXbhgejnQ88r07obhQM=
X-Received: by 2002:a05:690c:3403:b0:703:b200:9f08 with SMTP id
 00721157ae682-708543aff69mr21890897b3.4.1745581486092; Fri, 25 Apr 2025
 04:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306115021.797426-1-ulf.hansson@linaro.org>
 <Z8_Fgx4YWwdpB1XK@google.com> <CAPDyKFqp0874O500j1StQgVyr_fQud6eJTqzQW_GqEj49Yt6bA@mail.gmail.com>
In-Reply-To: <CAPDyKFqp0874O500j1StQgVyr_fQud6eJTqzQW_GqEj49Yt6bA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 13:44:10 +0200
X-Gm-Features: ATxdqUG1CWJrrgR6i9i4qMve8TXVlsm2c5EfOVYPWVNwMDvFx09cSzSOZOTI9wQ
Message-ID: <CAPDyKFq7Es8rP9JGjLQ=70=OX3vWtt=69kcf6kQsDSvZOnr1tw@mail.gmail.com>
Subject: Re: [PATCH] Input: hisi_powerkey: Enable system-wakeup for s2idle
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Mar 2025 at 17:37, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Tue, 11 Mar 2025 at 06:09, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Ulf,
> >
> > On Thu, Mar 06, 2025 at 12:50:21PM +0100, Ulf Hansson wrote:
> > > To wake up the system from s2idle when pressing the power-button, let's
> > > convert from using pm_wakeup_event() to pm_wakeup_dev_event(), as it allows
> > > us to specify the "hard" in-parameter, which needs to be set for s2idle.
> >
> > I was looking at pm_wakeup_event() and pm_wakeup_dev_event() and I am
> > afraid I do not understand the distinction. Why would we want to
> > abort suspend by only by some wakeup sources and not by others? And why
> > does a driver need to know whether a system uses s2idle or some other
> > implementation of low power state?
>
> Good question!
>
> In regards to waking up. The CPU that wakes up from suspend-to-idle
> may actually decide to just go back to idle, without doing a full
> system resume - unless there is a wakeup that requires the system to
> resume.
>
> In suspend-to-ram a wakeup will always trigger a full system resume.
>
> In most cases a driver doesn't really need to distinguish between
> these cases, yet the wakeup APIs are designed to allow it. That's the
> reason why pm_system_wakeup() needs to be called (controlled by "hard"
> in-parameter to pm_wakeup_dev_event()).
>
> >
> > FWIW we have Chromebooks that use S0ix and Chromebooks that use S3 as
> > well as ARM Chromebooks and I do not think they use
> > pm_wakeup_dev_event() variant.
> >
> > I'm cc-ing Rafael to give us some guidance.
>
> Good, let's see if there is something I failed to explain.
>
> >
> > >
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >  drivers/input/misc/hisi_powerkey.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
> > > index d3c293a95d32..d315017324d9 100644
> > > --- a/drivers/input/misc/hisi_powerkey.c
> > > +++ b/drivers/input/misc/hisi_powerkey.c
> > > @@ -30,7 +30,7 @@ static irqreturn_t hi65xx_power_press_isr(int irq, void *q)
> > >  {
> > >       struct input_dev *input = q;
> > >
> > > -     pm_wakeup_event(input->dev.parent, MAX_HELD_TIME);
> > > +     pm_wakeup_dev_event(input->dev.parent, MAX_HELD_TIME, true);
> > >       input_report_key(input, KEY_POWER, 1);
> > >       input_sync(input);
> > >
> > > --
> > > 2.43.0
> > >
> >
> > Thanks.
> >
> > --
> > Dmitry
>
> Kind regards
> Uffe

Dmitry, is there anything else I can do to make you queue this one?

S2idle is currently broken for Hikey and - it's rather annoying.

Kind regards
Uffe
