Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A9C23A9
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036652; cv=none; b=XU0GbUOl9y+sm95iOmVtJRgMwnIC/I8Xr5U2EMysdC4agR9hK+KiYFyi16BDKlz9ZDJB+L67QgiE/86nDBp/pL5m+o1jSFjjejL+Yd3VqqqByYQGKbsAubM/RwyrjYuD3majudNq5hCpo97CVRh9MGSk3VC65cTvIRWJJGnhBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036652; c=relaxed/simple;
	bh=MNsWX/MaCJozDCvNRtgGThYZGYQRomkQ1qf5vv5TS3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9NspTh1pAG/oSf8/PLv5fJaoHy+dKOMJPRRJwYj7b3G4OEmEXDy+ipeEzki50OuTxL3Vue4NrcV+l/grh8N6QTxFvD+LfXdSDkb8SsVmmyQ0H174jpMTCr+O+WJ2GG92otQNQ08FJ6+58sgkiIDGQP8SnDWkHGUSFNS1C62CAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtrH0EgW; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtrH0EgW"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5505918e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 00:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747036649; x=1747641449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSrUBxWWojvwqe/WEpuGAakvw8Xmmk3ZVwFQ0ufc+T8=;
        b=jtrH0EgWSEVa2i+JU0sZn9nn+kDrGOgd77yXKlbTJ+d0/+s/o6DCu+EjObd28A6594
         r4ALo0qnI84R9VxJNvWI3gFhnh/AOnwLlClVBBcqKCGQo2Q4kalOqu7XWiw/pMhTAhBN
         oNGRR3xdVZP07hNzbcYu3mBk42/HOOM36h9NGjb5KQ4A6zZM3eCODoYA0M0IL0wdS1bC
         ELbX9/PBOygpGJA+ukq6YDNgW8JbbwgR0z/0MkdVRW2z65ysbK3fKTOa/yrgn92PXFnM
         0w2U5w/fLRulOsL1DYQBJCxMl0NdK+sjeT5BTB/trR6H9HXBdCQq1YfiaEAStFPCZ60C
         KNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747036649; x=1747641449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSrUBxWWojvwqe/WEpuGAakvw8Xmmk3ZVwFQ0ufc+T8=;
        b=KdNzuOWVyGBDgu/wMLyvsFZjEQbMSQdy2Ve+u/i6x7ek+qS6ixseR8MNNx0rYR2Uc+
         x+j0RuwwAvm/mIwMenW1anOfGxJH0X6WG1Nsvcl2LKCAKCqcD2bvUrhJaf1WkCaewEOc
         ioT5pc3y0Ba8EKnLKDlk58vlQ3+KPJ+7YN3YfT5hC4/03RTdrFmIAfsnFydc9lkdZXqa
         zfHlm6QtVepBjnCXPKkbCGnqvFp/H8HnWpKLTBX87KGoqd9DO+g21vfclrPDyBp3u1Kv
         waejv7uiwOY/gtYyC7SgrUE0x+IrMPt6IBg22qOZy+B56m93pKslWtYgEpcdjOleg29i
         j0zw==
X-Forwarded-Encrypted: i=1; AJvYcCVNdf2etW71zI1JbupMpuBDwlaRlDQbnoEG7oca04ySOdeekCp4bT8KjRPUSXLlxxaFCyuLBZ76oo6231o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTBI0DEs1RLKcSOgN3BTdtW+iqRIBuxL9cMHv1qjRPw096BGNW
	6mgEkpW/vDn/oZYuoqaGf9UyxGxxeqBNa42sNTjLqtUY/ndN4E5gO7uYnmp2NTY/M8g93plW41x
	/UnWlAbk1SyU4V8Gquyqwb0PvWNEdVBROAfNQKQ==
X-Gm-Gg: ASbGncuWOXPoNXTTkLfMLmJab4Lxnjjp2VBk88+/m3pEPaDfJ98ZxTs6nh+alPazvH+
	tRUlwTb22BweefyuA5xbWLsuIerkgsp95nx4To1wpwEQLDIBS8TKEgKstplG9WlMEIYky0RAER1
	pHsiKMOsP0gjHPuzRnLN3gOYJlzZy3w1S75Q==
X-Google-Smtp-Source: AGHT+IENi5p2bYLOI3JnEgdDg9mPV7tdfPVtcND8BcoS+36s47QW8uagPl0uHl8geBf6sbWITUBDmdezf6FAIzGrvlA=
X-Received: by 2002:a05:651c:549:b0:307:9555:dc5e with SMTP id
 38308e7fff4ca-326c45460f2mr47762931fa.3.1747036648872; Mon, 12 May 2025
 00:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
In-Reply-To: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
From: lihua - <lihua@huaqin.corp-partner.google.com>
Date: Mon, 12 May 2025 15:57:17 +0800
X-Gm-Features: AX0GCFsX1XuuIhEJSjplLu_YCwSa5UniiusnI5n9qOnZKm5KsUqOge8i9lwauj0
Message-ID: <CAAkVrDM1TyM9VQ6rctF75EcLCRbimgJqbA2oH_RvJxC8ex6_vQ@mail.gmail.com>
Subject: Re: [PATCH] Input: gpio-keys - Detect long press events in sleep mode
To: dmitry.torokhov@gmail.com, hdegoede@redhat.com, 
	javier.carrasco.cruz@gmail.com, zack.rusin@broadcom.com, namcao@linutronix.de, 
	andriy.shevchenko@linux.intel.com, tglx@linutronix.de
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, All linux team members:
      Could you please review this modification as soon as possible?


On Tue, May 6, 2025 at 1:58=E2=80=AFPM Hua Li
<lihua@huaqin.corp-partner.google.com> wrote:
>
> Previously, long pressing the gpio key could only detect short press
> events and could not report long press events in sleep mode, we need
> to recognize long press events in sleep mode and fix this issue.
>
> Signed-off-by: Hua Li <lihua@huaqin.corp-partner.google.com>
> ---
>  drivers/input/keyboard/gpio_keys.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/=
gpio_keys.c
> index 5c39a217b94c..b546f38ecf8f 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -426,6 +426,8 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *=
dev_id)
>                          * handler to run.
>                          */
>                         input_report_key(bdata->input, button->code, 1);
> +                       input_sync(bdata->input);
> +                       return IRQ_HANDLED;
>                 }
>         }
>
> --
> 2.17.1
>
