Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4078F5B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738636656; cv=none; b=sh3ejOUMkWRAM5m+QLlQjWrswCoDmDtUEW7EduyhUSHORbjZ5hXeUKrXwLjFKCppTcIA3DqgKBFDDkUtcxNJzUCgdWjHGBgl3DGxSDRYmAVc6db4tLnbz8dk8lJwNeTDb02LtSveQzmnqlPlCLbs2VShbXqb8a2tKjrrN6iwPco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738636656; c=relaxed/simple;
	bh=3akqeYOfR2u/dqg9hAp/ZLnPmLqoRwizhwaVgPamvfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwUnZsH3hFXVQNunvxKRyO2/BqQz3NbGROLyZy6PzPapyJOBFMWM0m+HmE63WFni0QyEYHXuy0FT8NW3p/YkmVrRuA/hp8QFdhfkmM2sLXczgJRE+UU0RI8BSWG8oqDIrGRHyNGHM7rjb50mv7vsAlB0bWBWj4D9cXlAmSI9VJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIvqBJv9; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIvqBJv9"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467a37a2a53so59903741cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 18:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738636654; x=1739241454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFTT1x9qPUOcycVAyXc65sG+TUIzEOUVU4ygZcgKGVI=;
        b=PIvqBJv9FzXp3SKbMcbjP/Zpx+swJfIPDQfw4/oqvhOVvhuTK/spiXbd2DSqCR0hHo
         NWq/teDuYX+Ib+7bRIk3FobKMeml1leBexUQ0d0zASyJFPH/AXE9ugjT1qQrvRkqicBv
         oiuYrg/v4qxeH3eU6Ldb9P1c1ltSmSZM/tWppoojwdrIYYnFCESlZx8DDPbkI6kRMwVg
         JX8554+bvUl5BBJFMHJLemmBIM/mNPCqNADWyFvFMzdpy4TdkC+JKegMz/PN8h6uiCpg
         BKg4ukmn2eKmwaGlM9at3X/gYH1M812J+RtpT9IuLPiv++o61Pi26EB9QEZV1UwwMpNt
         hPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738636654; x=1739241454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFTT1x9qPUOcycVAyXc65sG+TUIzEOUVU4ygZcgKGVI=;
        b=hiJDbvc5+03rt2ssSlCLCMX4i/OOv+6HldKLySL1Ssvb/EnMgobnm9akF/+AOmNeiU
         CEflzUtkVZjYyI/k+6TW5P8RT7wb7edR6qQo/8ZNVGvxIWqutMLNZBTxXeBRAhzsn72A
         QjWF/eYxeIwGpycy6zgtVYDKWlktsu/we6wDPlha61ulq68BR8YAn6Pca7yISsQtSl9H
         BBcmtfVZniprpWG3vGSez5n8PWPFketntZ2XpocEWA0dJpCqZ3rndvnxYXcOI5SFEf3M
         jCvIn4Z2DkhaMbG53ENeV6RaJThbfPyb0rW/JwvPMYHkxN5rXRg7lI8Otr9lYuiV56Bq
         58Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX8ja5stCyxGER9fCv2592nyY4BHQXwELRnksj/7YeH+7EAUNcwr8tmveXGB1TdqmR9iljf/aCt8Lvqjb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoX2O0QQlfs7Lo0Ld9C9yk3/CREeP/hcJZZ00Bj/bWvddHqMNM
	GcJew3B/ngTcIHFBdX/9BrBInbSN7bt1eRNEIX0dlMg67CmmqsBh3iBOziJ30V3KEkFG7J8LTOO
	Ib9J19KZeaEeYH3C+Unq7NsHIwaQ=
X-Gm-Gg: ASbGncshXkBmkdqg74y20cSvwyK6VMDekKkncApgkmoA8PqfwdhpxbdghwCnWnMoaHg
	X4EyV8eLSqLBUSyk3rSXtXgcphBfM+3bTmVwkBNvDTk+Lv8Dmnqa9fmIpa/KfIIE33QKd5YY5
X-Google-Smtp-Source: AGHT+IEqyV1oLh7+tRRmVcNhrW2tv9h9wmB5y5P1fx3eysiSgNvA+mtv7mTxUoVPWeywWQmF2n6glRQpG7mEOqz/dgE=
X-Received: by 2002:a05:622a:59ca:b0:46c:870f:f621 with SMTP id
 d75a77b69052e-46fd0ace15amr337077271cf.26.1738636654140; Mon, 03 Feb 2025
 18:37:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202205456.40790-1-jiashengjiangcool@gmail.com>
 <87tt9bxwc0.fsf@bootlin.com> <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
In-Reply-To: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 3 Feb 2025 21:37:23 -0500
X-Gm-Features: AWEUYZnxZ-pA-NrdUSrYdnNNkeDv2I90-xB7KJXZnxTPiDBkaK5AQdw7WyDUgr8
Message-ID: <CANeGvZUBPFUs+T_h-LDVxvVPHogerw0=n14=F-tdCmqwkeAQJQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add check for kcalloc()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at, vigneshr@ti.com, 
	gmpy.liaowx@gmail.com, kees@kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Mon, Feb 3, 2025 at 1:04=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 03/02/2025 =C3=A0 09:32, Miquel Raynal a =C3=A9crit :
> > On 02/02/2025 at 20:54:56 GMT, Jiasheng Jiang <jiashengjiangcool@gmail.=
com> wrote:
> >
> >> Add a check for kcalloc() and print an error message if it fails.
> >
> > Checking, yes, but logging, no. IIRC the core does it already if requir=
ed.
> >
> >> Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")
> >
> > Cc: stable is missing
> >
> >> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> >> ---
> >>   drivers/mtd/mtdpstore.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
> >> index 7ac8ac901306..368997155c07 100644
> >> --- a/drivers/mtd/mtdpstore.c
> >> +++ b/drivers/mtd/mtdpstore.c
> >> @@ -423,6 +423,11 @@ static void mtdpstore_notify_add(struct mtd_info =
*mtd)
> >>      longcnt =3D BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
> >>      cxt->badmap =3D kcalloc(longcnt, sizeof(long), GFP_KERNEL);
> >>
> >> +    if (!cxt->rmmap || !cxt->usedmap || !cxt->badmap) {
> >> +            dev_err(&mtd->dev, "failed to allocate memory for map\n")=
;
> >> +            return;
> >> +    }
> >> +
> >>      /* just support dmesg right now */
> >>      cxt->dev.flags =3D PSTORE_FLAGS_DMESG;
> >>      cxt->dev.zone.read =3D mtdpstore_read;
> >
> > What if register_pstore_device() fails? Your only partially fixing the
> > problem if you don't handle the free()s there as well.
>
> ... and if an allocation fails above, then some kfree() also needs to be
> called.
>

Thanks, I have add kfree() to deal with each allocation in my v2.

> And, unrelated to your patch, these kcalloc()/kfree() could be some
> bitmap_zalloc()/bitmap_free(). (but i'm not sure it really worth the effo=
rt)

I think it works well currently, so it may not be necessary to do the
replacements.

>
> CJ
>
> >
> > Thanks,
> > Miqu=C3=A8l
> >
> >
>

-Jiasheng
