Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF31D5147
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 03:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739243724; cv=none; b=Gov4IAsxdaDuYFavwhvNBJydcv8YYobpKooCjlTPy5rSTmEB+lHfpGRHG7wVbzalR+NbUThfQkKucRZ/9jCao8e1sY3WfN1XEXm6KJ850TmjXmA3Crsi7FMiY8t/fzr6AQagZ6rR6eSbylWFhq8r+avxmr+9yx8/PqMReEUSFvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739243724; c=relaxed/simple;
	bh=HA0eEC7kOG1cHWJvDtJcCnKolNpI4DxYE1BApqVuX5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z2g1zbF8Nzoi/It5IlKWo28BqvtduVRjEELzLgtVQ8nLQDECooLz72e8CxJVFUXdjy6hmeLzbfcc0cgF7kEP34EoMNOma0yDh1Vhe91DZLSG5ysDYF3WwY9rT3HRbsfofsLsQ5HdbR9OKR4liJnjjADyzlWPeHl3M4efZ2XWdDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PEI8wR8G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PEI8wR8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739243721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Ivl2hUzrsAFBlV631jaucRgQ8R5hnE19aUzjr9fLE=;
	b=PEI8wR8G15UFArbKY2Gs/762kvU7jGM5UB0Is/Dyu5VyzcQ3LBp95iWm6Zdptf4eUrToHP
	1QpJSVdl5OlbnzGc8LXztO4iBQJz3hHHIAL5+jYiGAcgFgpNQa49yd1XeRGTCGkpqAi4pc
	PXwTJU7HwEPbP83Bp9qyEv5i1dnzcGM=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-YSkZ5FfIPsK0AEjjCMeUIQ-1; Mon, 10 Feb 2025 22:15:17 -0500
X-MC-Unique: YSkZ5FfIPsK0AEjjCMeUIQ-1
X-Mimecast-MFC-AGG-ID: YSkZ5FfIPsK0AEjjCMeUIQ
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2b1aa0c87daso1660492fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739243717; x=1739848517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0Ivl2hUzrsAFBlV631jaucRgQ8R5hnE19aUzjr9fLE=;
        b=I2f1HT1pVZHMmLsvctUd1gdZru6RDKGICQpTrr7ZFbCkt7Z9iTRh4qHzqMrwIuHKuQ
         V52KygsAhB7g80iw80YmuQkHsBEzvstcrSWP8UQ4b2e436DeIzQKFYmaWl20wHgVmFBn
         CuWVkW6Dj+16UtFCSYwa2pR5NbZHsZAoIeD3ctpJX1nnZ4ZlYMzWZZy9g+jZjnYgDTRn
         KxyajqKImd5c7IAoJlwd5Zc1HJ6cgpXgGdkTjFQL4oP8Zv1Evr7ZPR5zBud7WcWVRSW1
         r5744+20JI/4FWBwWfHdN0bB9qir+Jz7rXpmb3ep0nvNfvuQdK+2dmbs6siEuPCpA+Ki
         iM9g==
X-Forwarded-Encrypted: i=1; AJvYcCUN+3NpNPDtO9msIVLlktDUuimAM2uZ2qhpBpar+49IXdJqwCIHSlE/lcqAXs/JLzUYKg1MAg25TNPu00k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv0QEm377S/66wIRgOYxZ3GE/LAgthgXB815KyCl0A5884Y31y
	n+BpB8Bj3ZYj6aotlKn5yOBDTZNFAX9Ze44bzIyzURFyZvc3lVIGFh3bAZxsLxI2YjUqiI71e66
	56Y/5RwOrE456ug+MXk9zYNztUVbnGfGoFh/AQj+u/YMpi7lUSZ380Llwroxt+bvhsN7A6wxTZC
	2Jz2fi/w1pESpWH/5EHpLnMc31Ac+V8kla8gyj
X-Gm-Gg: ASbGncuPHa4J61stT0q9bfiupvYHREPhA1+0Cm2jSqj85Jx9cr0HVKbs37bC1J1egsE
	T45B1ZhETKa4X7XZfiZcWkaxlqKBManOKOkUxTnSinNiK4GgZnkIEyVXpsBzvZw==
X-Received: by 2002:a05:6870:80d1:b0:29d:c6ef:cf1d with SMTP id 586e51a60fabf-2b83eba549amr9756677fac.7.1739243716922;
        Mon, 10 Feb 2025 19:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpeDE1nUfGm5pbX9Bj+ov+VzBebcDC/RED+dVFXtD78QPFmYvAX5E7sdpCS+436MdM2PtX5bHZ2CPhlreAWgw=
X-Received: by 2002:a05:6870:80d1:b0:29d:c6ef:cf1d with SMTP id
 586e51a60fabf-2b83eba549amr9756668fac.7.1739243716705; Mon, 10 Feb 2025
 19:15:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210104347.3d291afb@canb.auug.org.au> <64504o9q-5os6-79p3-o18s-5pn6q9s0q6n7@xreary.bet>
In-Reply-To: <64504o9q-5os6-79p3-o18s-5pn6q9s0q6n7@xreary.bet>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 11 Feb 2025 11:15:05 +0800
X-Gm-Features: AWEUYZnXY_mke1ik49Wr00glsp46UMJhPBgjYvzoEDy_WKISPe8kRoWnawcarDk
Message-ID: <CAEth8oGPimtR8TmQrODtExedLdvpCYzgynOiynBUU1jC4B4jvg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the hid tree
To: Jiri Kosina <jikos@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Tue, Feb 11, 2025 at 6:07=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Mon, 10 Feb 2025, Stephen Rothwell wrote:
>
> > Hi all,
> >
> > After merging the hid tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> >
> > ERROR: modpost: "led_mc_calc_color_components" [drivers/hid/hid-lg-g15.=
ko] undefined!
> > ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/hi=
d/hid-lg-g15.ko] undefined!
> >
> > Caused by commit
> >
> >   a3a064146c50 ("HID: hid-lg-g15: Use standard multicolor LED API")
> >
> > # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> >
> > I have used the hid tree from next-20250207 for today.
>
> Indeed, this was reported by 0day bot as well.
>
> Kate, are you planning to send a fix please?

Yes.
It is a dependency issue in Kconfig.
Since the LED multicolour APIs are used, I'll add an
LEDS_CLASS_MULTICOLOR dependency to HID_LOGITECH.

Thank you :)

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20
BR,
Kate

