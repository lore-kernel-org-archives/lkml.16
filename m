Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E961275114
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382340; cv=none; b=WXep73+rgL2l3yPpEoPzrTdCLxdicAfT7F90/2+edYAdrcY1CO7zgN7521bN4nczL8QRpP/EIuIZ4ovM7b9p0Vv/7jHCqmjCFgBAZDORHjJq9f/itvAiYGU04anSqeczer4VnELQ2bQVVXm+vD99R/cIXqpYWOlOGVGJz8OoDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382340; c=relaxed/simple;
	bh=cC81D9mBHYbYtcJMVF0VKar/7co57B2vWE8jFmfT+Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtgVYSY26kjsR8w17SfjOFzjZsRNAbBfO1fLiwsRVgDTsChmCNPTYYUT3Ssx1xNHovBPH5ncNe+NyuSWzZoVrvQ6Aty9BYnOJxF2ly4WCIYGX9ZRgunjuwoEv6lvTZH/U1VU42Opdi6YtoU8Wzu5tjzo3zW/muR3iC1Z1uIvN7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g1TiYSWI; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g1TiYSWI"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so231735ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751382336; x=1751987136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAeW+QO7sIyTqGTIUZ5T6GJ2TGH6wrpJNIN7Yv/NoKg=;
        b=g1TiYSWIZs3mVH7JLhZA854QEXqydIolRfCdM1Is4a/ZPERYkybkgUc/sAeXcPYdea
         wGmJ+oyS34r7P6zqCAbWL672oFrXEa+d6miEzcz3UoDzxEM4NVv3Co5rxKnHTdSFBBfK
         6Xd/bCybp4nBjk5wpc9pj+lwFGSgkMCKYZ/2A7OQa8X1ZjSp5oBDF98GgExA9Dw5sHYm
         affVk2yvo14ldTxjxgwCPxqkk3sOGgC0agpkwz1Q2ttDufCDyGe9SyB7zhU0tUDAO3hn
         LSJK7TVrkfcIBcAMiuMkrZPoCQyGtBP5hrMOA54Ez1o19FwUM8FtpNkLLR3cKMBRYx+M
         ZWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382336; x=1751987136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAeW+QO7sIyTqGTIUZ5T6GJ2TGH6wrpJNIN7Yv/NoKg=;
        b=gZr/AHbuAKT+BnBbuUcQGDzNFf5fFS0MOiOIrAug7WBmoRdcV+aWJG0g/gQCUUY65m
         VHgxJunbjnjWwRm0G/vs2pVVKsYLrGiApFE9zNPLaEuztjJitVZp6R0SCVVBRSyjoGnZ
         ND7pBZ7yo6/OGNRtWKKEy9GjYlB323vlLpv4oEuuHQ4V737mHEsZz77rIZ8s8/DlO7QM
         txQWA14DAX7Z31nMx4yRWmuiZXtV5FkWw4nTZGyRYpEiMv81ySun90WXakuvRv+QXF0d
         uf6nUXMihyPhC+84EP1jwC5I5I7gRmjTL3mufLvAcfiQBB8uMDQzmJeh2BKRKlDThefT
         PTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGBMUTVgACIYAoSJPJzqnWk0n24FT+Ye7rMpZN6pyCtYI4PYymFZTtog4gwQLL2etmTJI2Bz+3BI7SFHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmuKLR7c2G4RQGDqVFnxv5Kwm6Pm68WR/wJnIG6IGv+cLtCCNd
	dZXCezAELWnm/o0pmoWkMf8p4oEBcwPKVOxeUouLClHuL5menZwAbiwtW0EwZy6po5kk87KLocN
	AVBd+/gABlDae0fLmX71e8HhLjILlPrspGW1HOYEf
X-Gm-Gg: ASbGncsc2jIjuOwEVK2qSp/qUlmoLjicxqj+p2zKs5xeERR/VfhS6yuyUCxL39qTjuT
	S9DkLXu2lplNhA8WsjSHlPZImajgKiH3V5lC0kXvB7Emm8N1wcr9HB8Kpgx54PZhDHdBZ2fBUCh
	CFfFjK6D7HrliJcI0Hz34GhMw/HYPxReGrWwPP6ZQaQ22C1iRmD5LgvMYk2g/rklTxhoHJ7Ihlv
	w==
X-Google-Smtp-Source: AGHT+IEcCC0GTWnthgBn4E5DR2h0slceTx2Oizv+khLKkJqEWL6UehzGXwpFPJ5xPOXnQV+0akv4aGjYDR9ESIMhqJI=
X-Received: by 2002:a05:6e02:1b04:b0:3dc:7cc4:3cb0 with SMTP id
 e9e14a558f8ab-3e04a04a0fcmr3015485ab.18.1751382335868; Tue, 01 Jul 2025
 08:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com>
 <2025060407-geologic-excuse-9ca5@gregkh> <CAOuDEK1471toXVEiNySQtmrRTSPwzo840Q2d5pw9M4fCOfsgTg@mail.gmail.com>
 <2025061957-daylong-legal-fed1@gregkh>
In-Reply-To: <2025061957-daylong-legal-fed1@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 1 Jul 2025 23:05:00 +0800
X-Gm-Features: Ac12FXxBjFsDAoOgivLlVGoqGQmIP8GxWeWcWT2DlyAl6K8ndpCHuMUKdEOEMac
Message-ID: <CAOuDEK1mY7++0NxRYR_+fhQB5+74KB-=MHhk4Dx3cpD6XrG93A@mail.gmail.com>
Subject: Re: [PATCH v14 0/4] Support system sleep with offloaded usb transfers
To: Greg KH <gregkh@linuxfoundation.org>, quic_wcheng@quicinc.com
Cc: quic_zijuhu@quicinc.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 5:27=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Jun 04, 2025 at 08:32:00PM +0800, Guan-Yu Lin wrote:
> > On Wed, Jun 4, 2025 at 6:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Wed, Jun 04, 2025 at 08:23:06AM +0000, Guan-Yu Lin wrote:
> > >
> > > Is there a reason you aren't cc:ing the developers from a "big androi=
d
> > > device company" that is currently testing and finding problems with t=
his
> > > patchset in their device testing?  I will require their signed-off-by=
 or
> > > tested-by in order to even consider accepting this patch series based=
 on
> > > the issues they seem to be finding with it in an
> > > internal-company-bug-reporting-platform that I seem to be also copied
> > > on.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > I'm not sure if the company wants to reveal its testing right now
> > since the company raised the problem with the internal system. Hence,
> > we still use the internal system to communicate with them. We
> > understand that "signed-off-by"/"tested-by" tags are required to merge
> > the code, so we'll keep working closely with multiple companies to
> > achieve this.
>
> Great, please do so for the next version you post.
>
> thanks,
>
> greg k-h

Hi Wesley,

Right now the system sleep with offloaded usb transfers feature is
pretty much settled. I was wondering if you could test the patch on
your platform? Thanks!

Regards,
Guan-Yu
