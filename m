Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F7926AD9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381645; cv=none; b=BA9SVX+UeVX9yfJ/qSo1oyZiqfTb3lLksf2iBHH2HIaX0Wpate+VFDYUD/wwgH/0gb71WSaG02zXJFC2Iw2CBDS4PTlejOr/38krr1bwhB6jnsyNfHGi0FuUcEAPeO34CYO9x3kWoSbnZtqosUH4ZgwyBJbYU0ZaDkiaGi/mTBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381645; c=relaxed/simple;
	bh=qKrKM9zA7GTqQdCuPeaq+7zcbxqyXjrCtpoVdskcyuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFvZ9gmZyx3um5PDAlpoEz9WWrUjB5pY1rcrxLGUev8GjFxoJd/PtDX78XDDUTo8LSrTbA9xSj4hskW5kk17T3P8qsfIjKUTAujT/NCq8KgLjoOW6kMy0XouVeEjqL2i/2pK2kcJayHEBP0fSDoBmBHIYZcd1BHXA9YEUV/CIyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etBt9kzK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etBt9kzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744381642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Im7PLUkW7j3mmQzh3EFVKWQVrxz4pA7bf7TSdZHW8os=;
	b=etBt9kzK/GM1QUBfetfP0L3vI9gvpvyt8Co8eyTeZ1+RHxV6lep+umbMtkkKI4ky2XeioI
	Od0LK2pwEo9oFs2yYbe43p4LXRcTj3d3K1l2iRcRKImMGo6eliQUZcGXq6HIQNcD56aCVB
	5kx0/o0F+fkf++cSvirgDq0kfajpU4E=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-OEM17uTVPuWp9paJNAxULw-1; Fri, 11 Apr 2025 10:27:21 -0400
X-MC-Unique: OEM17uTVPuWp9paJNAxULw-1
X-Mimecast-MFC-AGG-ID: OEM17uTVPuWp9paJNAxULw_1744381640
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2c24ce4d924so26229fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381640; x=1744986440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Im7PLUkW7j3mmQzh3EFVKWQVrxz4pA7bf7TSdZHW8os=;
        b=PwMp3f+JVQhz9pl0HwTyo6HvWruoGAgHAVUoCm1zu5+Nxsxr5LJaAD6fsS4kZELihA
         VMOBxHbNWHH98KgSk5xQH5OQJuQrNCULIm/O1jXX7pg112t9c/SFlIGm+05rHvu8zglC
         VN410qwbSiCchPqFgZYBwK8ZohF382OydiygW8KQoJHym6jtzwSvXY3rkzQYSPwWVc2G
         FCP66bjHQamlCuTaVlD+LurU07ojRRfEf+jT85DR+qC11omGGiDvDu0KOykJ/SMBC0on
         sUznDHmOLEmZTsk1zSDQjiTq2sfhBoHPWuRPLeyMiRa1tBDYkFWP4OYkU1d7+z7iTYHj
         cUfg==
X-Forwarded-Encrypted: i=1; AJvYcCV5nvfy9A1v0nnwm1a9NkdIhYZIZJOTy7mfQ9HpC6+0th5VgCTcw/BFJzcQ3+9frajs9UThhMjKKiuFZpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUWoqSHVJGkVbs4yck5tUSc820A2ADRAO3B/MojGc0G2hDGSx
	rB42hR5+voR28uqM1W2vqYkBqUxO0+CYmmcD9n6wACsSAw4o/MnxsxR/csCb09GsiX8PFDFM2QF
	gminoUgiJdRcmk7BBaANsQhJwoWXcGrvXW6wAqsoyLcmy0ZwRpqjyPydpqTZ1rm4rGTgHRemmLX
	sMJBpdFM9V2sXHj49IBItLSzru5ieuGNvMeumi
X-Gm-Gg: ASbGncuwOU0d51zDublwdVyEOOv8CuKXMcjvx98YCiMApqXQr9Cy11aEWYLbVxvjWrR
	VU2v9Jo2qan4m3TDub8fRTUnFBbAodW7evwkCrSMkDFCymTEuQ9y4CqO/1HK1DESafP4=
X-Received: by 2002:a05:6871:4102:b0:2b7:fc4b:8408 with SMTP id 586e51a60fabf-2d0d5c4f9damr599361fac.2.1744381640294;
        Fri, 11 Apr 2025 07:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtyIy8awglJHeyK/BCOHDP8jLvXWR8za9vqwQmLys5HN7G2p0PJqVELul9ZwicD73ayRi27zCy73dC8JEDk38=
X-Received: by 2002:a05:6871:4102:b0:2b7:fc4b:8408 with SMTP id
 586e51a60fabf-2d0d5c4f9damr599349fac.2.1744381640021; Fri, 11 Apr 2025
 07:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409144250.206590-1-ivecera@redhat.com> <20250411072616.GU372032@google.com>
In-Reply-To: <20250411072616.GU372032@google.com>
From: Michal Schmidt <mschmidt@redhat.com>
Date: Fri, 11 Apr 2025 16:27:08 +0200
X-Gm-Features: ATxdqUHHcxYvn-_fU1mId7EG_BUpa6k1ihUDWebZvcqQhgKIHJ5La9lAEIRJHKA
Message-ID: <CADEbmW1XBDT39Cs5WcAP_GHJ+4_CTdgFA4yoyiTTnJfC7M2YVQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Add Microchip ZL3073x support (part 1)
To: Lee Jones <lee@kernel.org>
Cc: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 9:26=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
> On Wed, 09 Apr 2025, Ivan Vecera wrote:
> > Add support for Microchip Azurite DPLL/PTP/SyncE chip family that
> > provides DPLL and PTP functionality. This series bring first part
> > that adds the common MFD driver that provides an access to the bus
> > that can be either I2C or SPI.
> > [...]
>
> Not only are all of the added abstractions and ugly MACROs hard to read
> and troublesome to maintain, they're also completely unnecessary at this
> (driver) level.  Nicely authored, easy to read / maintain code wins over
> clever code 95% of the time.

Hello Lee,

IMHO defining the registers with the ZL3073X_REG*_DEF macros is both
clever and easy to read / maintain. On one line I can see the register
name, size and address. For the indexed registers also their count and
the stride. It's almost like looking at a datasheet. And the
type-checking for accessing the registers using the correct size is
nice. I even liked the paranoid WARN_ON for checking the index
overflows.

The weak point is the non-obvious usage in call sites. Seeing:
  rc =3D zl3073x_read_id(zldev, &id);
can be confusing. One will not find the function with cscope or grep.
Nothing immediately suggests that there's macro magic behind it.
What if usage had to be just slightly more explicit?:
  rc =3D ZL3073X_READ(id, zldev, &id);

I could immediately see that ZL3073X_READ is a macro. Its definition
would be near the definitions of the ZL3073X_REG*_DEF macros, so I
could correctly guess these things are related.
The 1st argument of the ZL3073X_READ macro is the register name.
(There would be a ZL3073X_READ_IDX with one more argument for indexed
registers.)
In vim, having the cursor on the 1st argument (id) and pressing gD
takes me to the corresponding ZL3073X_REG16_DEF line.

Would it still be too ugly in your view?

Michal

