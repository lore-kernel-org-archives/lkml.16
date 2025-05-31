Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B75944F;
	Sat, 31 May 2025 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748663343; cv=none; b=DsfOGRVFliRB/EfdQOouVriQqkQw6e8pBbfZ1HZneC61F100yFuxxCBNXBmYKsu1UhXeDse/N0Yl08v8MItSjDue9TuravdQiBFlIyTZ8ZwWSgkOnRZVx9ojLSVXPCPqztcPOFmrRfi6iv/gtaYbbQM5p0mAXgEieKLg4GIaI0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748663343; c=relaxed/simple;
	bh=bXKgutgBBgDmFxEdbyOlpIc/AywSS2pEfOu4ZPuyFZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4xXJcXCQ5J4izcS0JyzshjoEMRZ0Mwdf5Qnvdo8BibvVMywvKlSs4BvVTCrJI3lT8kzQXMYKWhUVT0KHPtxBE8xcDOx4YaHWsG1STILH3i+cj6+p5ffu1SyXOsSKWWMFcQlF/hxhD8hxvp9DyChbzdXd/rTq80HvqBm0tumBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myyq3npL; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myyq3npL"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6facc3b9559so29743866d6.0;
        Fri, 30 May 2025 20:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748663341; x=1749268141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76qLuztV60iQGLn5sp4b2X4+KO3vVQw6ocNKjB2Ik0M=;
        b=myyq3npLCEWvzgwEX42bofM2etn5fhSEtu47s8hpUKO/04yT9K4QVFdL5Jm6cKMSp+
         GBnj0k74bPilGroang6oiuiHmJ/2lDl1fCVvYKDBm6uNj89OD4qStSKjEo35zgQdidjJ
         hXwQwwkTeeEQlBkKSNmlTXJM3Y6HNUxuHyWQczFncXIrZvkGLZptOJHMyhw2bC3NhLg1
         9KruaiZ6soeKkFwaN+FBnfKYLTsVEpj03mKlKdjDwWlwzSZZ+0GH9XF27dOEfq/9fuSK
         PxsjflKyIFBZRpSOsNkxg7VJHHldFkvJi5S6xJhRsuNfjZ0fofmxXtYST9TcmIVNf42u
         X0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748663341; x=1749268141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76qLuztV60iQGLn5sp4b2X4+KO3vVQw6ocNKjB2Ik0M=;
        b=gk9/vyzZwb9vKbnb4E2o0+F64IquSRoR25Bmfcl5LfDaPjSvmWpQiywOuhdS13nG/q
         fUO5GCRIMu1G44WRznc5o0TcBBX/f5rns9gLdoUtb77wDXafeEKDON8NWwP0csZgf4/s
         RTZyUUgI+EEzAUhSMGwsNSO6ZDrqPQeqr2niubTxTP+M1aef/f6lC9uqFYD0j7lFG1NT
         /j+cfdlDGES6nuUx3rwZT4GyBrzQQz5LzAHO4sF0vJIro0aCyuPB+zFbtOB7vT2vf2jo
         QPF5OXoELE66rxD54JdaCr1QbvpbHi3rVEZy8xPdQyezzkYNTjHjscD1LjhEJHgsjHfa
         ehtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWLgtEco9OuGa9JLhSApyC+H/F9EYhRoWhAr7mLHr7hG7rk9Jto6BtJTq8GmGMz7Zid9X0+qM/RKQ=@vger.kernel.org, AJvYcCUdanpIqt4qntuQLckGT6NcA5LC3kHvKVXn1WcWBeFoTi3jPJ2rX410PhKjsOBbJQjTKtKqwyMmK9TYmDto@vger.kernel.org, AJvYcCW6VpFTlOyjBvBWLVTUTc6OfcGvzvqsHyGG87PtaF7kaMxRib/NgxGxnxrqxOqTBDVeNU7DTvbZeu0SI56An44h1J6LRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPh0rP78tCwt7ZVVWpVxwu+s+R1+I9srTg2W+zN8MC9qkD3PfM
	aIwnTbwzb5OlWKzkIwggHQyXyhkVyXOow/ga34n4nys1kTHx1g8xhHw8i69kjKeHZvX8Agenl8v
	Bqs/62maajtwcqhIS5GPwnNh597++XPQ=
X-Gm-Gg: ASbGncuC+WRRYYbW68+vyhZjDFrGp6IEZ/RY48a0TV2VMiz5Oy0FdZDnHM/NHrOmt4Q
	YZCP6G57/+vDmG8DhQo1Xk8rrw/2+r4Eb4wmfyD1RcS13P3j6W4fyuSY53Zpe5xSIVQBhasfdAR
	EVcgA1wPDJRfNfuifeK5cpkF6fET7QtLJuXssePO4SxYY3
X-Google-Smtp-Source: AGHT+IHX2JVirrixh78so9Fn86OIa5AbSRfPoDhKRveiPy+oOBGtB1HhyqEnfb3cMFWL4dRiIoIYKcR38dCrk6pr69o=
X-Received: by 2002:a05:6214:509d:b0:6fa:c18e:b8d7 with SMTP id
 6a1803df08f44-6fad1952c9dmr75779106d6.25.1748663340985; Fri, 30 May 2025
 20:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522015350.471070-1-derekjohn.clark@gmail.com>
 <2972c4c6-7080-e058-ec39-b8c1dc603f7a@linux.intel.com> <2c7ffaa6-e639-e215-42d0-78a2b185ad45@linux.intel.com>
In-Reply-To: <2c7ffaa6-e639-e215-42d0-78a2b185ad45@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 30 May 2025 20:48:50 -0700
X-Gm-Features: AX0GCFvYSFg8JfeoEW8-4Z12btdwYqpfGj4nyKSFF7YoM6Desoy-OcsA4bzYXVo
Message-ID: <CAFqHKTnp2zMTAfdYBpxestSErpsgwSf_TmkLjjU0W5HOFiC9bA@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] platform/x86: Add Lenovo WMI Gaming Series Drivers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
	Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 2:42=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 26 May 2025, Ilpo J=C3=A4rvinen wrote:
>
> > On Wed, 21 May 2025, Derek J. Clark wrote:
> >
> > > Adds support for the Lenovo "Gaming Series" of laptop hardware that u=
se
> > > WMI interfaces that control various power settings. There are multipl=
e WMI
> > > interfaces that work in concert to provide getting and setting values=
 as
> > > well as validation of input. Currently only the "Gamezone", "Other
> > > Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, bu=
t
> > > I attempted to structure the driver so that adding the "Custom Mode",
> > > "Lighting", and other data block interfaces would be trivial in later
> > > patches.
> > >
> > > This driver attempts to standardize the exposed sysfs by mirroring th=
e
> > > asus-armoury driver currently under review. As such, a lot of
> > > inspiration has been drawn from that driver.
> > > https://lore.kernel.org/platform-driver-x86/20250319065827.53478-1-lu=
ke@ljones.dev/#t
> > >
> > > The drivers have been tested by me on the Lenovo Legion Go and Legion=
 Go
> > > S.
> > >
> > > Suggested-by: Mario Limonciello <superm1@kernel.org>
> > > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > ---
> > > v11:
> > >   - Fix formmating issues.
> >
> > Thanks for the update, I've applied this now into the review-ilpo-next
> > branch. BUT, this is very late in the cycle now and if there's a build
> > issue (or LKP doesn't build test it in reasonable time), I'll have to d=
rop
> > this series and postpone it into the next cycle as I don't want to dela=
y
> > the main PR to Linus too long.
> >
> > But lets hope for the best, I think some depends on issues were fixed
> > earlier (IIRC), so hopefully it works good enough now. :-)
>
> Hmpf, these give me a few new warnings related to this series:
>
> make W=3D1 drivers/platform/x86/
> make C=3D2 drivers/platform/x86/

When I use scoped_guard the warnings go away. It seems to be a
limitation of sparse in that its not correctly identifying the guard
will be unlocked on the return perhaps? In any case, if you're okay
with a scoped guard here (matches both other invocations) I'll send it
up.

I also took care of the warnings for W=3D1.

> ...I really don't know why sparse complains about the lock context
> imbalance though, those functions use guard().
>
> There's also a copy-paste error:
>
>  * lwmi_gz_profile_get_get() - Get the current platform profile.
>
> ..._get_get -> ..._set
> Get -> Set
>
>
>
> --
>  i.
