Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0F118732B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664270; cv=none; b=kTq0zPXUMzwAl/DfXl0sgBWljFhqdIooKBB/TsmmmwpLQoU2HfrjP2FkcBcqyyoyWXGySZxwbdvviWa8aUVcGKVpqptrWSbMq4rfiznyT0MKPaxdX9b9wn4HcjooBGtD01/O9p5FKfz0rxOUxXd2sM9SIvt6gNjccKnXDmwnu9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664270; c=relaxed/simple;
	bh=nNEojZgXwHTA6iMCyGgj9QMJPGIDSyQ4Bji0m/IGoIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3DoXo8CESf2/ooQx+XS1leYXNICXm0i2q6zLC2ZYz2YEn8cZbje1JDM6H+pbP7LXiXvOKjwLGNj/QaaqkGx3d7q3akexb0zfKQCGgLRtxSowH+PyKLzLyUCw4Ssu6IO663pt9jyB40j/72Fb3bG2dqS+LDS3TlDkGIBHjEZbBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUJeGcjR; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUJeGcjR"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-525da75d902so286870e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743664268; x=1744269068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaV5irKzB8BTG4VmEVwkCDqvoExYXKgjyGLGtsXXpO8=;
        b=aUJeGcjRdjqNhAusdFxQR6zVIwKPhualGwhBcqafdOQSce1RYc0rqp9vI8AyVmBe5d
         q+2lTZWtjCErvZ0ovSi1PPEHaYE7vRx3O1Me91nGx0JKaclwODJvK/anm4sp9T7xrDTh
         Ti1a82MkkKTdiWzqLQLUw2dBb1RL55BKrBdhf8MI657IhXsBmtuuufQlds4X76x3mBdP
         dXcE3VnFbvZOkOdSTPRPbkQE9V0P0hmoC5fF7h+nSY3ngsYQGeBZiD2X3c513f1Uo+/x
         zAnp7WjhEWWTrd/Ab0rGC/+MkMHZorx97NdUNhauLC6GsUbHpvWOHE5iLZu1pDMsbxeT
         ODDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664268; x=1744269068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaV5irKzB8BTG4VmEVwkCDqvoExYXKgjyGLGtsXXpO8=;
        b=p21QJn6I2Ak08K5cp7AstiLVqlUWW56sIpf/czUKyuVnVPqy3Z08WZNWRXizq6sWgz
         yvf0vE8mEcRn9Ax29O2yRZg17u4Pgt0YI6/Q2m2Fsp0Tav8n/2fgxNUl8Y25R1YMJgBT
         npMXBIEXbUoj1Vc/Gl143NWsd/Gsk5LhLwnDLiQXdLJ6hO+FhB/Z0D6vWTYnkae4oXFa
         XQbt1xvnTPDv4E0ZpYZe1HxSMuyKNg8PTcGWsbMMXrtqUN2RL7/QfocwwKK5F4d6mQbo
         FIYdHS0GdbcLJyNJZ11dihKQlhCDzpU3YincIIJXbuDRtR8p4tyLwoMQeTDmuktaqnFW
         bXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV940YBDM/TpscpLC6qHetSYbPyGP8Sju6u9eLgRYD0lSudnS0U2vfkQ9D5Ceo4QYSPI/AAOOQw0kwoJmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmdRkgS3b6SA1NndnP0xPJ5qN2IZSCbRRwmgUwHmuVitixTOPS
	R9AhU0P2rA0j1nQgWdFEbqdNobGd72K4fZWU28cIlhPm7Jhd8X58Hws0I+25HGpEW98K4TifqQ/
	mTCMkw7wMVDLRGUIHjErIorw9GQ8=
X-Gm-Gg: ASbGncs0ZIo5e3yBpQCEfZ9mEM2n4gdG2kfkDmFTpjn4EAFIEzBuXSLy4R4yALoQ35g
	9rpEW1OwTXTRau4Nh3rATTNgoTUDw7HNNq7mmA3N+PeOhh4I7DVlBeYHc9plDxKovAb9ITlGZf1
	BDCqjkAWU33PmwRE0EHOxAgB4//i3V
X-Google-Smtp-Source: AGHT+IEFtq3RywPNdwWjkvGe9eVUznDe+xyDkg1iSC1HqRGKAOJRt2mkytbKTwyDbxJvXUWhOqWMKxHqw+X8CqnNESg=
X-Received: by 2002:a05:6122:2502:b0:523:a88b:9bfd with SMTP id
 71dfb90a1353d-5274cf62070mr3679907e0c.7.1743664267846; Thu, 03 Apr 2025
 00:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743635480.git.abrahamadekunle50@gmail.com>
 <9ce32e62672197f63448e98a41902fdf6b40a79e.1743635480.git.abrahamadekunle50@gmail.com>
 <CAHp75VcT5OBxo2jMTYK6Vw8MB+h+jBWT42GVtS27YTkq-JZoLA@mail.gmail.com>
In-Reply-To: <CAHp75VcT5OBxo2jMTYK6Vw8MB+h+jBWT42GVtS27YTkq-JZoLA@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Thu, 3 Apr 2025 08:10:59 +0100
X-Gm-Features: AQ5f1JrdIw9HQ4TSfs7WivtPCCN0nofQeoT22ynNGA9vi8Iq5s2F2H8gzyFXZn8
Message-ID: <CADYq+fY2mOHortr_K+9OwXRP3n6TRZB-ZUu9RytXnWObNDSM1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: Remove NULL test on an already tested value
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 6:19=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 3, 2025 at 2:30=E2=80=AFAM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value that
> > has previously been NULL tested.
>
> >  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
> >  drivers/staging/media/av7110/sp8870.c                     | 2 +-
>
> Please, split this on per driver basis, as they have different
> maintainers and trees to go through.

Thank you for your review.
I will do that.
>
> ...
>
> > --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> > @@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device =
*dev,
> >          * if it founds something different than string, letting it
> >          * to fall back to the old code.
> >          */
> > -       if (cur && cur->type !=3D ACPI_TYPE_STRING) {
> > +       if (cur->type !=3D ACPI_TYPE_STRING) {
> >                 dev_info(dev, "found non-string _DSM entry for '%s'\n",=
 var);
> >                 ACPI_FREE(obj);
> >                 return -EINVAL;
>
> This change is good.
>
> ...
>
> > diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/me=
dia/av7110/sp8870.c
> > index 0c813860f5b2..8c5fa5ed5340 100644
> > --- a/drivers/staging/media/av7110/sp8870.c
> > +++ b/drivers/staging/media/av7110/sp8870.c
> > @@ -508,7 +508,7 @@ static int sp8870_set_frontend(struct dvb_frontend =
*fe)
> >         }
> >
> >         if (debug) {
> > -               if (valid) {
> > +               {
> >                         if (trials > 1) {
> >                                 pr_info("%s(): firmware lockup!!!\n", _=
_func__);
> >                                 pr_info("%s(): recovered after %i trial=
(s))\n",  __func__, trials - 1);
>
> But this is not fully done. Why do we need to keep {}? Just shift left
> the code and remove those {} altogether.

Okay I will effect the change.
Thanks

Adekunle
