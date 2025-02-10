Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8772309BE;
	Mon, 10 Feb 2025 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195240; cv=none; b=cIxS9jDq383sLEXHp/pD3m3EpP6HdF5COzEYj6jX7NcrVDfhAXrSpZUyNJ9wd89/ze1j38vwsVHnL/xTQbLr1g6LFtMaFslmMo6p++2cF7T1kTAUPt8FfX9ObkBOO+JoyCptc8U/j+ItR2wd1/lPAlauULHQk2b1TCouoDJ6wss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195240; c=relaxed/simple;
	bh=OE6XGBIVNrUQL2X0paYA0ncCdwG0GLCPQRTqsDlLEhA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=hvTlNRciUs+Y6To1veMCKfwWiXO+Ud3U73ENRrUPJCpd88HtGLHu6wV6tPlNmggZA5SqDV64sELjNm5BUWFwujbcdNs7Ac8o4dWolEYog8svyn3gFUf8lazWsK2E14/P7J0y6OflRp6x1xAAcibDrJ2QChYVvp3CbiOtYTeI94Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD5g2yFW; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD5g2yFW"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e587cca1e47so3880592276.0;
        Mon, 10 Feb 2025 05:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739195235; x=1739800035; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrX3YgBJLa2r93sxirtaJIVzX/eqKeDGRDGwfMCm+yk=;
        b=ZD5g2yFWK+TRz3IpH5tuonL2i0xLD1E/bKv23S/G4VtazCHyL1dI4SoBizdcAadT00
         RxlEMwlmYGi01Y2XgJRtSqoEgsNAihCQGbgRdKYXWq4+zelQMe4h25dS3FI03jqAOUil
         QPKv/MQxv/wQzSn3B17BhriVKxbzOuTrprRYzk3F9pJGbu6u74oHBdNLiy93jCPNzfDF
         kHOaTlZyM6l4vRd0BvDnskFn/sOwjHjxobDT1seIo1zkQAPum/tYrPYKGGA6gHvvH4ci
         Yi3dZTKYyuIDW07M88R5DX6rfFbiwFOI4Qx5lnrOk6BdZOXq4Zjx4exu1ineijqKYJcV
         r5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195235; x=1739800035;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QrX3YgBJLa2r93sxirtaJIVzX/eqKeDGRDGwfMCm+yk=;
        b=JyEbGgzQVgN54wBF1u1PcMsFPR1V+T8kiSDSugkWOSxH2nYx/i54sbkHYtvaGBn7Cr
         80LqoS1kMW3abdZreRMUZ8SfnqEaSSnJ5kvRNSZsxJudaRcPuS5oJxPALpLAC0Umbedt
         q/4RBmjEV+wM+G9JBrQlRlwfU5Bm5JQZl5KJaGM/f7XIvMjI+9FcU2Vgsey56hzqaNCV
         SLBJt9CpNdms/txG0MF7g+nuEAm1pRyLnj26K9akcqtac/MnKnZgaoA4Gk6oCXdruxZa
         5N2CSEvJKyzjo5O4c1f4+h0TUsrXhYf+FLlnPT14QRs/2zf5N99VxcEeuMxiDUOBqjtQ
         Wxaw==
X-Forwarded-Encrypted: i=1; AJvYcCXWQlxxMDHNasWrzfHoOpTkC6fjq8g1POqnEkl5Uy2pytuaWjZN9o5EX1AKJ1zI1DZWg4QWNxLGlAVzgGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0ivjtAE3VHxEo2GHJ7kjTCWHh/Avrxk6pTTzp2KDs5PXtjpI
	bD8l+N81xp2RNLvm1cCO2n1PbObv2TWRO64J15bPbn4kh1p0MlyDDuAsqw==
X-Gm-Gg: ASbGncvnRZO6f8BtbG7Mr+20UFZEAW2SxTHjEnFx4svUiT0B8R4bQgKf04yB/wR8KV0
	r9hob+M2neiTkSlwtawz0PyX4uf57+Gfk6cz7E4tGYslTjbcEL7HPihO16HCGBZfuS6WdY7dONd
	OMWILoIIdPNMIx5OkUHOnNBYrNV/OkzTm3ikRt8Gh3bMUtFa4esp3s8+Jmcyb06VWCSGDRCK25s
	PQ5pGzuUSQ9MhyWx73Fm6ZV1QRCgj2rDpl1dvCrJoJ6UBDk8Dx+XkKrzpPFKy88PLZ8KrkJyaDY
	tD7yuoY=
X-Google-Smtp-Source: AGHT+IG2ydJB/kD8KUGjIxJciDbKdmA8Ey9W6q7DsRvSZBWswHwgkjLy2vz+1J9i1OmhP/9nFIOAMw==
X-Received: by 2002:a05:6902:120c:b0:e58:2f56:c45 with SMTP id 3f1490d57ef6-e5b4629d9damr10453832276.43.1739195235176;
        Mon, 10 Feb 2025 05:47:15 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b68bd21c5sm948620276.33.2025.02.10.05.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 05:47:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Feb 2025 08:47:13 -0500
Message-Id: <D7OT982LY0H1.1P6XUU7YTDDMB@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 11/14] platform/x86: Split the alienware-wmi driver
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207140743.16822-1-kuurtb@gmail.com>
 <20250207140743.16822-12-kuurtb@gmail.com>
 <85e378b4-a434-efe1-fd16-416fc3ce3691@linux.intel.com>
 <D7MBDPIDK7XS.3DONIQK22EIBH@gmail.com>
 <c314c485-7a6f-b10a-2d80-45a8c5fb331e@linux.intel.com>
In-Reply-To: <c314c485-7a6f-b10a-2d80-45a8c5fb331e@linux.intel.com>

On Mon Feb 10, 2025 at 6:53 AM -05, Ilpo J=C3=A4rvinen wrote:
> On Fri, 7 Feb 2025, Kurt Borja wrote:
>
>> On Fri Feb 7, 2025 at 10:05 AM -05, Ilpo J=C3=A4rvinen wrote:
>> > On Fri, 7 Feb 2025, Kurt Borja wrote:
>> >
>> >> Split alienware-wmi WMI drivers into different files. This is done
>> >> seamlessly by copying and pasting, however some blocks are reordered.
>> >>=20
>> >> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> >> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> >
>> > Hi,
>> >
>> > Can you please check there's no error in driver_data assignments as th=
e=20
>> > numbers in removed & added lines do not match:
>>=20
>> Hi Ilpo,
>>=20
>> There was indeed a wrong assignment to Alienware m16 r1 AMD, I'm not
>> really sure how it happened but it's fixed now!
>>=20
>> I'll send a v10. I apologize for the noise.
>>=20
>> >
>> > $ git diff-tree -p 73224c076cf2fa2968d61584c62937f6180c8e71 | grep dri=
ver_data | rev | sort | rev | uniq -c
>>=20
>> Thanks for this amazing trick btw.
>
> Apparently the rev trick wouldn't have been even necessary in this case=
=20
> but writing those things are a second nature to me. When reviewing=20
> especially move changes, one has to have a bag full of tricks. :-)

Any trick would have saved time I spent working on this patch :)

>
> It is one of the reasons why I prefer to have move patches do as little=
=20
> extra work as possible because I can use pipelines to verify the pre and=
=20
> post content is identical.
>
> I usually starting by diffing - and + lines in the diff which is how I=20
> came across this one too. In the best case there are no code line changes=
=20
> at all but all changes are in the boilerplate, it gives very high=20
> confidence on the move being done correctly. When a rebase conflicts,=20
> everyone (me included), might introduce unintended changes to move-only=
=20
> patches so I tend to check even my own move patches in similar fashion to=
=20
> avoid making stupid mistakes.

Speaking of this. Let's say I want to add a new model to the DMI list,
how should I go about it?=20

If I base it on the fixes branches it's going to conflict when merging
with Linus, and even worse, it would need to be manually added to
alienware-wmi-wmax.c every time it happens.

My solution is to just base the added models on the for-next branch. Of
course users wouldn't get this until v6.15 but I'd prefer not to give
you or some other maintainer extra work.

Another solution is to make two patches one for for-next and one for
stable, but I don't know if people do this to begin with.

What do you think about this?

--
 ~ Kurt

>
> Even the diff of diffs wouldn't get me to 100%, it find that <5% that=20
> differs so I can focus on whether it is sound.
>
>>=20
>> ~ Kurt
>>=20
>> >       1 +               awcc =3D id->driver_data;
>> >       1 -               awcc =3D id->driver_data;
>> >       4 +               .driver_data =3D &generic_quirks,
>> >       5 -               .driver_data =3D &generic_quirks,
>> >       7 +               .driver_data =3D &g_series_quirks,
>> >       6 -               .driver_data =3D &g_series_quirks,
>> >
>> > (That commit id is from my staging tree, not available to you but it's=
=20
>> > this patch.)
>>=20

