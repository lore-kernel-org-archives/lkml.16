Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB06231C9F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816944; cv=none; b=BnokFZg9lq0iX2z4dsqtVxULEKfAzNwMEfWfPlucge0DKmU/GR77P3MeLAR2HEx6Zfd8+qxNFbSvJsoQMikg/XIJVABxulYFDoU7TZPNUE7GhkTPEf+miukQqKIJJYmggfVy09GndVcHeWn8RhY/YixauM/+qBmaiE1DVWBA2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816944; c=relaxed/simple;
	bh=O9aboa+aA9QUrHv7NG/TajZHCYjHVV9Y+6HTFp4K5aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PypLzKuDg/Nz7+eQqh0ulAALROMCqR9wmgzXxZXAKBLvKRRwAfMFnMGUq3HskCe0CN5pzBWaMc26kb6e0nd//nKmVE7Fb/qARC8GRKjxXUkHBMH5Z6P5nHXJ+Jaj3LlNr2Vttps5kL3l3sMGnfHnw7PQrje/Zi5uOakxpakICPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llx+nxLC; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llx+nxLC"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70dec158cbcso12232437b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747816942; x=1748421742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCgJZXkhtbkjdkE3gdVVdoOPKWGJdcA4tMEqgryxtSc=;
        b=llx+nxLCMVaHbmSEvn0DFT1d896iCvVmj7/O7dzWmaXbvVDMmJEwQ1Kmw75nuIlwiV
         2khXPCNJvqhn2ub9y2YRY4D1MF1CtoHxGafOJ4YalXw7lff6T+kJtQQtTo/60E7qAMmB
         vL++SXSdc0uekzI50y2owysYu9fPpmCugd8gzAXl/qELw1u1ZvuKJjP9H/RAPhVfce8x
         S0nMyu8DmlGH72u+f9z7ELNKekTmok0BzGZfyc9ci7LnG8M+v1AYSl0esrxgnfWGbls9
         NCn4Mb51tpu9I4+D512qkonVVd8+MFBiFzNvWFUySjGcR5Irg3DWS5lZSQBRpZGXOkz8
         1HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816942; x=1748421742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCgJZXkhtbkjdkE3gdVVdoOPKWGJdcA4tMEqgryxtSc=;
        b=DW9MvbS9P5whGVZ40+TpUcWwdKJc8nRgnHlSJinikNW4IHt0JEWogjkh5ZcOF5Utr7
         HI6YLUygtCR/hsJfPY5ZiP+pqhnBQp7cd9SZ1DDUWql5e4/G3P7uyZRSQrKKaW+3aobD
         QRbCAtBjobmi+hqBMOKaXYbl4mmt6c9YAZG4UDZu2Uq9Hvbfc0Cxt5Tg3kRFI3QDiWAf
         7mfukiG9sTJXstk14PesekTm9Xy/r523pAyZZUWWX1vzhIZLh/JL5L0gsbaFZ1hGMAt6
         GEJqgb0Z1g5bbJpanm1vpcT887HyphVV76SOeh1fLYHNuWVslXP4ohfDvswT1WZDuj7t
         qsoA==
X-Forwarded-Encrypted: i=1; AJvYcCVXq1VNbvD5jrGNODG/pCldkaVBDb97+CDIY6QorOWMdn16YsymfFSwHd16FXtsRzW2rmXYiDJ5nc4EaTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YykBe/gUjjxmPXLZsC8ASV9WUs/Pr1/lGg7o5CiVoxC2ltZuOCr
	pOQHoneVGNiCm1/Zs37KzNyPztYhRUegcf68GwyMd55m2XlGxjIsfpq22hag81nJwGGk6g/88cP
	iQHY3tzs+E1gDNCVwZ1ax7EuE/p5ZfWQ=
X-Gm-Gg: ASbGncsRNw+pCnyOATYQ+yPYBRPcjMfeK3ywfmQTtI1McyY76UhTNF0JCKTtmyMzISG
	Ae1tOjkYxWrAQ3UvjYMoOp78sisKkWLT42GAA6eq4WcdbWmqNDL1EwoQZYmvVVyuq4sQnr643Lq
	2p/eEyhP/ilfUioXJVxBFyyVzFEgr2XOT6CvWj6zV7q+Pw8bP50mIph/UQRwVJHw4mrwZwztyQY
	zql
X-Google-Smtp-Source: AGHT+IFNHZSYsBdgNuwuykkG1XrjBeWI/DMdaIBKSjsDJ2IOaa44XWs61oPcZaHSqqhwBUVLkt3fM50/jwfOB7wmAmo=
X-Received: by 2002:a05:690c:ed4:b0:708:2604:4a10 with SMTP id
 00721157ae682-70caafccab3mr271916987b3.18.1747816942101; Wed, 21 May 2025
 01:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aC2ILNV6xgt11KuN@brak3r-Ubuntu> <2025052142-maturing-earthworm-cb31@gregkh>
 <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
In-Reply-To: <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 14:12:10 +0530
X-Gm-Features: AX0GCFv4llWsqgoVnjPLvP_a1XEhJ4RdYPXyZq8ZJBAv-ijFh3TqO7nT_Ne_OUA
Message-ID: <CAG+54Daj+1fj7pm+f-a-WYYzV5FGKby2_gqu6WjZMPCEXPGDYQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 2:08=E2=80=AFPM Rujra Bhatt
<braker.noob.kernel@gmail.com> wrote:
>
> On Wed, May 21, 2025 at 09:06:00AM +0200, Greg KH wrote:
> > A: http://en.wikipedia.org/wiki/Top_post
> > Q: Were do I find info about this thing called top-posting?
> > A: Because it messes up the order in which people normally read text.
> > Q: Why is top-posting such a bad thing?
> > A: Top-posting.
> > Q: What is the most annoying thing in e-mail?
> >
> > A: No.
> > Q: Should I include quotations after my reply?
> >
> >
> > http://daringfireball.net/2007/07/on_top
> >
> > On Wed, May 21, 2025 at 11:11:26AM +0530, rujra wrote:
> > > Hi greg,
> > >
> > > why is this a RESEND ?:
> > >
> > > >> I had sent the same patch 4 days ago and didn't get any reply , he=
nce tried to resend the same patch for the same,
> > > here is earlier mail :
> > > https://mail.google.com/mail/u/1/?ik=3Df63b03515e&view=3Dom&permmsgid=
=3Dmsg-a:s:12290863930259651721
> >
> > That is a link to _your_ account, not a public record of your email :(
> >
> > > ,
> > >
> > > line does not match this:
> > > >> sorry , i could not get it what it is exactly ?, if possible can y=
ou share some insights or example so that from in future i would get it rig=
ht.
> >
> > Your "From:" line in your email does not match with the signed-off-by
> > line.
>
> This has been addressed successfully, Kindly preview it.
>
> is this the way correct about the reply email ? , kindly let me know as I
> have tried to get more and more answers and solved issues, and thank you
> so much for your guidance and will be keep in mind about the process and =
will
> not fail next time onwards.
>


> On Wed, May 21, 2025 at 2:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, May 21, 2025 at 01:30:44PM +0530, Rujra Bhatt wrote:
> >
> > <snip>
> >
> > For some reason you sent this only to me, which is a bit rude to
> > everyone else on the mailing list.  I'll be glad to respond if you
> > resend it to everyone.
> >

Re-send it to everyone , as per your guidance ,
thank you, and sorry for any inconvenience caused.

thank you,
regards,
Rujra Bhatt
