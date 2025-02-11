Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F59A442C;
	Tue, 11 Feb 2025 00:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232495; cv=none; b=LA03tbEXEtGA/oEux980LJst9+LNjq+7hTxeDcayNAybVXwnubskwuus2SWPjbRHHfFdYIcvviQl3Wn2+/DtuU6ywhYoPJfQPlybCVd5QFFJ/3itB/No8s53k3y+BCLjMNeIw62XDyYdff92u90UlDOB9+U2ACYLlfHMDwx54FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232495; c=relaxed/simple;
	bh=r8ssS56hAPXtodtixrj272AAWEE0+ByT/2dXmcrHiMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=oj6Zxf13YNkLGj4WYD4RlIwpCTBz65YaQgBX0vzfOXTpJKUXkS8bvmctkbYpFvXv+pZmurke8GZsZQ3gHLLsxDs4X6oRLCRzN32mzTolr3lwQJR0zY/6KAUcN3EvsF86iWQ3U/EVScDnlO8LJH44opRKnWIji82NPdp9VMGzYBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ylz93osI; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ylz93osI"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e46ac799015so3643817276.0;
        Mon, 10 Feb 2025 16:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739232493; x=1739837293; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8ssS56hAPXtodtixrj272AAWEE0+ByT/2dXmcrHiMk=;
        b=Ylz93osI/bg3J1cQPctIAQ109VEEpzbSBeXmliZZp2Anrrs7o7mUBcDhlmOU8VX3sU
         et7Wqb2jcD3VewwOBgM4PYw2Z6G+XR+e9YtXpJ99SiZGoHsrVDXyUJD3XnGVCxPmSK1r
         WUxywVLsHGvQecVFVUbA/ic38rFpCJEZJNb/3wydA1okOoZ94ieDoxQGwyrcif1ORH0w
         k2/K8huru68hkvcojCinM+dRoCtYa2hqv1Ja6UzhTKENgycXxxilDP8ENe2pNFfFFlMI
         WF6662Um+K4nWxMWlK7wW6Tj7fgwGPQlaBQBuZKCT0irDPd9LEXeOPqKtiKpiBdHMXrY
         E1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739232493; x=1739837293;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r8ssS56hAPXtodtixrj272AAWEE0+ByT/2dXmcrHiMk=;
        b=QX8166xwvnDXGfEuZybmgoMcsp4i2lWSYa+iPKV0TN3ONfLdpjFwrajTS69YyRAykT
         2bq6/UkLKu7/1ZPsXBCjurRcGU02pef0Wpd6q1MHsf6QcgR9kUlnjMVqRl7e8ObLGZJl
         vLNBCls6Zi+Vq5BGBX2bb1obMCAv+CpiDjpXRJJkkJ4cOJAUER4SaVyBE58jJIqgx88d
         4qi0ooDtTh2mcdqz/1Nui3QQgnuy5Jhybj08vw/QRpnPu3VRqGJgS3UVdTmqHPtSDhLC
         JSMJ6KfGs0v/agOopcaKTCyXh4fPVgqyVik6zDhavwEm9UnFFwSPdKLu9W62zIiUuWB+
         iAEg==
X-Forwarded-Encrypted: i=1; AJvYcCUR3ZfZ4o3mk+rmDS3JepSKmF4BqfTD36L4d+lxe1wqrBYP4AwIsneTHJs4mI1Od/GMJRTp81wv9XfiIJc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyop/CoJuoC5RBLdxOwvqIp9Aet6mofKCSHEsVPZNvDhJMoApZa
	iZj/1x0rMIY5DUS8LualqA4bI/DO+IzIvF5lL2LtQolFuWw5FcFK
X-Gm-Gg: ASbGncvHVIY5tMYEAhibpkzJ2GrdcnLF4Wve7bCDoTmHhDHjnikadab8HtOfa021G4M
	eV8JAY7TK5jkoD8JDEZTbL/Shj9FWC9ECdBE9VT2xrcRzLk97viVG3W7PUZ53SttdVbk42WM5II
	HxuWKvIGQFf+uT+b3DMVZhq1F06j8TWn19ALbn9BJC2QOrJ3p3SXGSjH83KhWQ6ws/0ilmPeZ3t
	jDEgGXpLlKjhi5MJ8qNOQMJN9a2Ejlfqx/9LPZpe3oHGtqDkFj/YAtZ0QekUU4/zu+bJyj5dgMx
	zoucM5+0Wg==
X-Google-Smtp-Source: AGHT+IE5Cq1f5OxVeQM8FVcVASOEov5DIu32EsqiCXrw2pP3XmXDo2/OaYq/ink7dXLhTJGR4M+1gQ==
X-Received: by 2002:a05:6902:120c:b0:e5a:e655:be68 with SMTP id 3f1490d57ef6-e5b4619ef5bmr13094379276.13.1739232493005;
        Mon, 10 Feb 2025 16:08:13 -0800 (PST)
Received: from localhost ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a4898d1sm2798124276.51.2025.02.10.16.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 16:08:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 19:08:09 -0500
Message-Id: <D7P6GNOLB1QL.2IHCSTG7671L3@gmail.com>
Subject: Re: [PATCH v9 11/14] platform/x86: Split the alienware-wmi driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>, "LKML"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207140743.16822-1-kuurtb@gmail.com>
 <20250207140743.16822-12-kuurtb@gmail.com>
 <85e378b4-a434-efe1-fd16-416fc3ce3691@linux.intel.com>
 <D7MBDPIDK7XS.3DONIQK22EIBH@gmail.com>
 <c314c485-7a6f-b10a-2d80-45a8c5fb331e@linux.intel.com>
 <D7OT982LY0H1.1P6XUU7YTDDMB@gmail.com>
 <a360d20e-4c14-18db-64d0-99149cd89d0e@linux.intel.com>
In-Reply-To: <a360d20e-4c14-18db-64d0-99149cd89d0e@linux.intel.com>

On Mon Feb 10, 2025 at 9:07 AM -05, Ilpo J=C3=A4rvinen wrote:
> On Mon, 10 Feb 2025, Kurt Borja wrote:
>
>> On Mon Feb 10, 2025 at 6:53 AM -05, Ilpo J=C3=A4rvinen wrote:
>
>> > It is one of the reasons why I prefer to have move patches do as littl=
e=20
>> > extra work as possible because I can use pipelines to verify the pre a=
nd=20
>> > post content is identical.
>> >
>> > I usually starting by diffing - and + lines in the diff which is how I=
=20
>> > came across this one too. In the best case there are no code line chan=
ges=20
>> > at all but all changes are in the boilerplate, it gives very high=20
>> > confidence on the move being done correctly. When a rebase conflicts,=
=20
>> > everyone (me included), might introduce unintended changes to move-onl=
y=20
>> > patches so I tend to check even my own move patches in similar fashion=
 to=20
>> > avoid making stupid mistakes.
>>=20
>> Speaking of this. Let's say I want to add a new model to the DMI list,
>> how should I go about it?=20
>>=20
>> If I base it on the fixes branches it's going to conflict when merging
>> with Linus, and even worse, it would need to be manually added to
>> alienware-wmi-wmax.c every time it happens.
>>=20
>> My solution is to just base the added models on the for-next branch. Of
>> course users wouldn't get this until v6.15 but I'd prefer not to give
>> you or some other maintainer extra work.
>>=20
>> Another solution is to make two patches one for for-next and one for
>> stable, but I don't know if people do this to begin with.
>>=20
>> What do you think about this?
>
> It is possible for me to merge the fixes branch containing the new model=
=20
> into for-next to avoid Linus having to deal with such conflicts. However,=
=20
> it only moves the stable conflicts problem by one kernel release because=
=20
> after 6.14 is released, all new additions will be based on the 6.15 code=
=20
> anyway so any patch going into stable will have to deal with the conflict=
s.
>
> If you so prefer, it is fine for me if you want base them on for-next=20
> after such a major restructuring, I won't complain. But as you said,=20
> there's a small delay until stable will pick them up. They do actually=20

A small delay of a couple of months :p

> start to pick the patches into stable right after 6.15-rc1 (and=20
> sometimes even during the merge window), not only after 6.15 release.

I will do it like this then, I'd prefer no conflicts.

Thanks!

--=20
 ~ Kurt

>
> You do get a FAILED mail from the stable maintainers if a patch they=20
> wanted to apply doesn't apply without conflicts and then can send them
> a backported version.

