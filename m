Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBC423A98B;
	Thu, 17 Apr 2025 11:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888708; cv=none; b=DY9pJ0zPGMUYoWfMceC2AvQd5ovaDb282OK1z0rAfN3OYCxNA6pdzSHfMSJHFbolpXot3ClUhWzlGMiVjz7Lj/xq6PJpjOhBlHRqT3LtG4nvaa8WyWp2/v2OxFC6d+tegdm7v9rMXRg/4Ap+pZodUwPonSe9bjryZ1fpkipYBx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888708; c=relaxed/simple;
	bh=dKMIHb1S6571ydBn3lEnTNtLoHrKyfQUv7BgHtM4Wc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xit3Fh6MdLiFUyyNjGGE7MnySgE0Wcg6NXO38UqbxoLZa8x2gLO/3ZoHajRgRQ9YKTK/L5VZ3+4Vba87yImmBEVzJDYS0IixjJcWqXNhmWEZnNGR8UzTUycbkYKp2ZZuQfABzJCglwzaDKDrV21yAfoX1myTPLugu1YstOESZzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iutut7Hp; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iutut7Hp"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2d0920c6f96so384357fac.1;
        Thu, 17 Apr 2025 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744888705; x=1745493505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4GG7mgkzFUoZqWeT2Tf0Q4QNFO5CH7b3xCbrus3OBQ=;
        b=iutut7HpTcURpq1TW+yZ7yp3MvtphgVYy1o9uXUvyZAWzo3wd7nyIHQ32zjNyHcM8c
         +Dfz/eTTQ0FpzJ2fceSDAfXG/9eVYgv/CqS1hmo7e2LNd0/SEagVroYoLepNvEHh9PJ2
         ChILf02bgj2zr5KNumPYW3ZNGDU9jfXhBjEafjLQCi8mApL/vQdOxn+aCL8H6KzfAgKD
         Wrr/azYqwbasaRhC6keUynUt/YMU5vraHHdKJGKIanh3GyLwufiU1Wz/+17mMVBx1KVq
         kvCrMjdPApdSsseXmtePHUHdFj6Wqd4+hpxezp34M7bC5shd6bDuNIz60I6sGtwkqilR
         bIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888705; x=1745493505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4GG7mgkzFUoZqWeT2Tf0Q4QNFO5CH7b3xCbrus3OBQ=;
        b=M9Iz1ckJJXMEbmnUaqX0iRz+qgCJuyLPwaTgDxVGiKIfFZCLYIl2/HBTi5i5AWJ1J+
         9irA+JQ7kdv7ZfFfq1iLmComv5hNDRbXzFQxHoHBolYPHB0EFSAmwClOYW7qN0xnbf7j
         NCEmOmVFaPA5B52ixZU6Xrar9BsmD5UcT5SAM3uaFbNEqTbwURbKnmB3UMI2vrL6Nt7r
         f8eT45oOcMIbSH4ucsPz5ztssXDY1dshrU2UwJOhnVdLUUtD3k26t3kcHSrEGt7qkmG0
         3+mMrkyK4xeNTpByiWGtcPFwXVcErg1CzEM3Do9hOdSw1LBW/2YP8c6FP63UioFcGit6
         QkDA==
X-Forwarded-Encrypted: i=1; AJvYcCWX2nUybPpRUfhQgy0wjMoawoCxr/KIRQbN8Z3lm7YeB7hwWrgnI+q+Nl9b22QsiIzZv2zYnsYZW6CVHYTyX/REVMgbMQ==@vger.kernel.org, AJvYcCWi9tchRTUnsBhuNXXsJ13Y5AgW6mI5SAVliuaxDhDRWdgX6K4+6waIwYnwVlKegibMGljUQfPa641NzVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMTBfnHGD7LiykzaeV/+KFU3uG/d4d7ezSEJRZ6S6Ljnnf/bjl
	Z+vg16H54uS+HGamc7HzTI4p/Jw+QBRpFI+79KWxpZIzMqHVLvJNlt61IVvy5l8kYvFwMo3yrfs
	hxJYZjhIaSZz7r1iE8P01iXiK0Aw=
X-Gm-Gg: ASbGnctGEoh5WK4u1DVYkrltcRb7AG63ZHQoZmShIYblJUnLs5xiKRSxdtNiV2AtpXA
	592WWl5z35JIRYQcRFdB6svf92wNNnDjWYIBGanWjzxef2gP1tp0hsa5rFuhJNXt43JQGYVwR+q
	IL7wfFlWbALi5JU7Dt/uSaxLKW6CRr0rqr2Qj6r6AmblfqcmjsOPgL1YM=
X-Google-Smtp-Source: AGHT+IH0HSnN/+LmZ5KKcaPEA/CtnPyE/zdEeBijGPlnrYXfT2VNXnFT98y24tAbxtFcuJyICuXjCnc95YN0nLLlz84=
X-Received: by 2002:a05:6871:a506:b0:2c2:5b08:8e42 with SMTP id
 586e51a60fabf-2d4d2d13558mr3675849fac.27.1744888705172; Thu, 17 Apr 2025
 04:18:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417105758.100675-1-gasper.nemgar@gmail.com> <fad8f831-c813-433e-83d4-0a45ecb6ad0d@redhat.com>
In-Reply-To: <fad8f831-c813-433e-83d4-0a45ecb6ad0d@redhat.com>
From: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>
Date: Thu, 17 Apr 2025 13:17:58 +0200
X-Gm-Features: ATxdqUHYihN_6qwo53D5Wbti_2z5xYpyJHeUuOXLu82PRon8QtNDJCHJsGdnFrg
Message-ID: <CAKi4K-hTj+S_hkR5PkhDSAza9i8eDYCriiR=o=dS5B0OVMdKCw@mail.gmail.com>
Subject: Re: [PATCHv5] platform/x86: ideapad-laptop: added support for some
 new buttons
To: Hans de Goede <hdegoede@redhat.com>
Cc: ikepanhc@gmail.com, ALOK TIWARI <alok.a.tiwari@oracle.com>, 
	ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I see that there has been a mistake.
Thanks, I will send again.
Ga=C5=A1per

On Thu, 17 Apr 2025 at 13:05, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ga=C5=A1per,
>
> On 17-Apr-25 12:57 PM, Ga=C5=A1per Nemgar wrote:
> > Added entries to unsupported wmi codes in ideapad_keymap[]
> > and one check in wmi_nofify in order to get wmi code 0x13d to trigger p=
latform_profile_cycle
> >
> > Signed-off-by: Ga=C5=A1per Nemgar <gasper.nemgar@gmail.com>"
> > ---
> > Changes in v5:
> >  - Changed performance button to KE_KEY
>
> Thank you for the new version, but you seem to not actually
> have made this change to the code.
>
> Also below you still have "User Asignable Key" instead of
> "User Assignable Key" (with double ss in assignable)
>
> You also still have 2 spaces instead of one after 0x3d in:
>
>                 /* performance button triggered by 0x3d  */
>
> (both pointed out by Alok for v4)
>
> Maybe you accidentally send out an old version of the code?
>
> Regards,
>
> Hans
>
>
>
>
>
>
>
>
>
>
> > Changes in v4:
> >  - Changed performace button to KE_IGNORE
> > Changes in v3:
> >  - Minor changes
> > Changes in v2:
> >  - Added more codes that trigger with key combos (Fn+N, Fn+M, ...)
> >  - Added performence toggle in wmi_notify()
> > Changes in v1:
> >  - Added codes for buttons on laptop(performance, star, ...)
> > ---
> >  drivers/platform/x86/ideapad-laptop.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x=
86/ideapad-laptop.c
> > index 17a09b778..72d3306ef 100644
> > --- a/drivers/platform/x86/ideapad-laptop.c
> > +++ b/drivers/platform/x86/ideapad-laptop.c
> > @@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] =
=3D {
> >       /* Specific to some newer models */
> >       { KE_KEY,       0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
> >       { KE_KEY,       0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> > +     /* Star- (User Asignable Key) */
> > +     { KE_KEY,       0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> > +     /* Eye */
> > +     { KE_KEY,       0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> > +     /* Performance toggle also Fn+Q, handled inside ideapad_wmi_notif=
y() */
> > +     { KE_IGNORE,    0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> > +     /* shift + prtsc */
> > +     { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> > +     { KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> > +     { KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
> >
> >       { KE_END },
> >  };
> > @@ -2080,6 +2090,14 @@ static void ideapad_wmi_notify(struct wmi_device=
 *wdev, union acpi_object *data)
> >               dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
> >                       data->integer.value);
> >
> > +             /* performance button triggered by 0x3d  */
> > +             if (data->integer.value =3D=3D 0x3d) {
> > +                     if (priv->dytc) {
> > +                             platform_profile_cycle();
> > +                             break;
> > +                     }
> > +             }
> > +
> >               /* 0x02 FnLock, 0x03 Esc */
> >               if (data->integer.value =3D=3D 0x02 || data->integer.valu=
e =3D=3D 0x03)
> >                       ideapad_fn_lock_led_notify(priv, data->integer.va=
lue =3D=3D 0x02);
>
