Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D81547D8;
	Tue,  4 Feb 2025 19:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698968; cv=none; b=Qc8LSkE0r6giKTAELFyH0T+6i3qKobxNG5opl2Gd1rA62QepD6Rv9C6ps1GTBWqFCTsAVwamI3W7exBwdZGoTdjNDKQ6yOqJ3iuvBbz0BoCTo2ddt2HXnXtxMsCIq+wZGXAO0DRh3jnu8vWBXu2NWNh5mEsrBTriUlBKqlk+UF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698968; c=relaxed/simple;
	bh=aI9ZF1XsSaAHZMRa+wJn3AAK8KCwn394QBaR32V7BUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyP18QIcxDp3cesbmNyqkKaIdWmygoQCdzF19bWz75CnlLgQ2I4Tyku1YFj6x+og7ni+nT2EtZY6jpPayMf3p2eQ+7rqDw2FehNvdxc9X5O/h0KgdP167dX5nKyvbY3PRIY/0DX33lcOktP0/j79V3Gl9ewz8BBPeiGPI62KfeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso412626739f.2;
        Tue, 04 Feb 2025 11:56:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698966; x=1739303766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swmAYw4M/WeTjADPtUccgFgxLP9bW9FlyGrjKCzqSbc=;
        b=juuitPWPsxXb0JKWGpHEC1Ne9aHvXLIpRbbR0PZqi3EWwG4kg6vl+LhY+vVDz9o4mq
         /5DIcwqnCWrW4d3zSb19R2Nl+3FoL55KNX4wBY133tqjnyHd8PrTLbG/OxvmM6LWqhZI
         tlITB43tFCINsYpPX0BsIQsv9ovFnLl8voqQblPk1Nj/yRMv6LkFqNithcBUWkhiKNIk
         tI5xjU1RvTxUpD6PLuZGaT6/o3kH/N3cRmtg2N8Zg4sOZymy+z/HkC0r5XBGUfcfIn3x
         2h7MBCJ0JM6C2h/61+U5diut493b7oL1yiujYoXM9Gl9XtIz+MjJzaAPCHp3dLyjwGJp
         B7nA==
X-Forwarded-Encrypted: i=1; AJvYcCU/h7QN6c8anBUKMAzMezAEVC1FEpbD5nsupT67AJQhZEbVYaD0oJrNRKAxqePIrath/v0og3+LRCiLtQrEIEFN3TKIZQ==@vger.kernel.org, AJvYcCU88rADsASVRGnLsVsxxCanAqZdfb2qdvHBLrfF4WPWqChTNANa7E8DZ7Sy4YeDXp1EZ6f51Tz8cFf4rzXs@vger.kernel.org, AJvYcCUBnHrmgWQzu4QqQLRYOJIecKlT2z+4eldNS8OYQjtFxBeymWN9AK1QgBJp6Deie6126cZ+d0TY1Co=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfaIfUOlybTxSrpvlw2gW+1OSZbxaxuoD/3fTxctQDsWNhNTBH
	AOfAFXDWIXpruojnt5Kv2ehjkuTfViwqmmFmWayq/WPLdXvg5xfWe2/1/vyEF8U=
X-Gm-Gg: ASbGnctjm34/AB+k7+ka40JZI58YA3R5E2cyXtC7WLdipJmM5AfUogzE8228Wm2Cas/
	phK4CPSnrbZgw1YRgMGSCMSSg5xoGp6nVcS5mey5fiAoS4NBvfJSuOK1+SZuqRcJd/2ymuJW8EY
	HdmAUhxNYR3jfFXvR6sODo3juRye4s2x1n7PyvUNQQTErNFn458tCAhQpRxH1yEANxbw3HF6YQK
	hqKyXYVnioyBJ6GaPg4tQdC9F67Y4kRm8Zrv8NEmbSgic5s7MPlmjSXodhIcf9o6RtNSNBWB07W
	uKCCBGR1juXpaAEbnUi2EWvDj389N1YBWg4WzWvXEdV+hqh5Eh24Jo3g3mDA
X-Google-Smtp-Source: AGHT+IEVNW3vyhYJXf152VA7WyXzzMcqwgVnLYJKtOgtogLM8acDSAs1y+KqNdxPsGV0dKxuhDcenQ==
X-Received: by 2002:a05:6e02:2208:b0:3d0:443d:a5a4 with SMTP id e9e14a558f8ab-3d04f47995emr2295205ab.2.1738698965751;
        Tue, 04 Feb 2025 11:56:05 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d00a4fd469sm30251585ab.13.2025.02.04.11.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 11:56:05 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d03d2bd7d2so10753925ab.0;
        Tue, 04 Feb 2025 11:56:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOZhoeWQut2Hqmjd1U/muZFnPZFBamq1KTlFjbfyU7Av70Rq0UbRc+O0///47994/p0w5siOuz/nQRPJd0@vger.kernel.org, AJvYcCWO956BF6U82FlpNRYpDe5hUyswuUoIiS1tX1XhfG5WXtmT3zO/kVVDX0eGLI0cwVxo40Z0wXnSwmg=@vger.kernel.org, AJvYcCWSrJCFZZzDEgigbA4NW/9dgDOSy2IeIdku2zuCFjb3FXI9+BvB7H/iObVgP0HBt1VccjH+Oh3f/jtJ9hGLnJOsx8miZw==@vger.kernel.org
X-Received: by 2002:a05:6e02:10:b0:3d0:11ff:a782 with SMTP id
 e9e14a558f8ab-3d04f5c68b7mr1789565ab.9.1738698965370; Tue, 04 Feb 2025
 11:56:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201105450.193450-1-josh@joshuagrisham.com> <a22ecdd5-a2a5-4f6b-0a1a-e1bc115dc01f@linux.intel.com>
In-Reply-To: <a22ecdd5-a2a5-4f6b-0a1a-e1bc115dc01f@linux.intel.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Tue, 4 Feb 2025 20:55:53 +0100
X-Gmail-Original-Message-ID: <CAMF+KeZ+XdAxVtSw5aMZ9O=J4AFeyVozduV+PYZSNLHaG=SOww@mail.gmail.com>
X-Gm-Features: AWEUYZnCPWsyTDh1EkwfhqdVw5W-kUnp97vaM0_G4cUrpfkIuxfLbaJOb9gfyTQ
Message-ID: <CAMF+KeZ+XdAxVtSw5aMZ9O=J4AFeyVozduV+PYZSNLHaG=SOww@mail.gmail.com>
Subject: Re: [PATCH v10] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, thomas@t-8ch.de, kuurtb@gmail.com, 
	Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den m=C3=A5n 3 feb. 2025 kl 16:02 skrev Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>:
>
> On Sat, 1 Feb 2025, Joshua Grisham wrote:
>
> > Add a new driver for Samsung Galaxy Book series notebook devices with t=
he
> > following features:
> >
> > - Keyboard backlight control
> > - Battery hook for installing power supply extension to add charge
> >   control end threshold
> > - Controller for Samsung's performance modes using the platform profile
> >   interface
> > - Adds firmware-attributes to control various system features
> > - Handles various hotkeys and notifications
> >
> > Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
> > Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
> I've applied this to review-ilpo-next.
>
> Thanks a lot to all who have taken time to help in getting this into
> shape!
>
> --
>  i.

Thank you Ilpo!

Agreed completely and special thanks to Armin, Thomas, and Kurt for
all of the extra time, help, and guidance along the way!

Best regards,
Joshua
