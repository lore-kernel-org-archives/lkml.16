Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87FFBE65
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148024; cv=none; b=KlXIA8N9NQ0xIYXWGFae9M1ECF/VLcpgo0ZGn+HloeBqCEJsJLWurBum5j+yIdV+g7saHbVODbFG09QCYXcitC0n2efP39zv5Oluz9MYcash9rNWPv0QPNILc+SdZ9fM6urvftuVuRFLVZRc2BCyFktMcU1OCwbG8wAYt6Y7TWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148024; c=relaxed/simple;
	bh=I1EHvaVJSlf9Rho0QjwvLu4eMTl1rbdzruHHALFqps4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bMSyWWM8fWCeDdgPZ+PzTNLxhvINqeUUcKLk1YoKdo4gtRNVMdciI1obdgqUSCDmzHR8woMjC2mhkt+sLjSvX5nEVZOx6iaSosa9yQl+t1VTzz+Kx+he6d+DFRSSX/65EjfmxDnqj6on+Z6y5xD7RtST7bcQnAGeaSkT/UWiQ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeJdAnnl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeJdAnnl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234d3261631so35954705ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750148022; x=1750752822; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WujX+FsFURe4z4iiEtEXeSpobOb65gUavCK/T69N4H4=;
        b=UeJdAnnl6F+VCUEZMRfRWZK6+dRQB2LtktFujBgI9CWCOUq2nEzOVG61uCtuvZSTE/
         NQKFInF5S9Dr1EzBhc2FIPOYLQ/oM90/cfwyfjbjUeMBQCU64TKJjvhYlfphHbHBm5ra
         WBePCui1mXMBw2/6tGLdedLErWb0nPQLBKlF9ChNPPXQlDJ0nOTU0u/upIYu26h6wIU/
         RJLHhGiS83vYDLkM2tDXTAQzXPWLnXi9VScs8A1mOg2C+0sDGCrTlF74/bpIap4Kl+zg
         PB9hnCda4ipUiNgVMRGOH1dqrXn2tOASX8kYzsHokrmlamI609m6T31Lu+oJizUleCmE
         AVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148022; x=1750752822;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WujX+FsFURe4z4iiEtEXeSpobOb65gUavCK/T69N4H4=;
        b=ag/h0rYk2lnzUVQYb/YluzHB96KMViQ8JPKOgC63Koi7g21kN2MhgzhHndTg4XR6b3
         6RX0+VFIIe7gpQ89i+volxf8BocQ0SlUxGQ31ZXFz7EOeKpTTK7wNGo+yQmwEVJBU9cn
         0ZeC1kJejr9edwFUzRIqmIJMcMPly2PYy5q/9fCnwr4KkZbZt5s2uaGDIJA7LCuZ/Tkw
         CfzdhE2YqPkHAWY/tr+j/SwU6gxUvwuCRUTiWS7QJZl/6jwlLppBIEcjND49ptfbxf8k
         buKlVFhpIx6MPMQ1Xp1SzpnJc8SRv2+MeERWeSmArli51MWqbnXHSr0zxHEC0V8mUxad
         EjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd4e56HZrV61uuhIppOT0MNl0FjFEIYHJh7biVCW+9LT6n44a6BIPLYLKnvCty8xqLdhL3CVoWZZiyp3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0pIql6Jo+tGAMa5KS4wKaSDU4DyQ6T7omUvDKoUz84h9iw4GL
	er6w09sXJIXI7NIOdXrsKRAExvmg4Iv9GvRhx6Lygu3rmQ7ES0s1Al47ttoWYseNnYZeFg==
X-Gm-Gg: ASbGncvZJGu4wmwwAQ2Qsm1E8CvKpqxRCd8VYlPOR9AKR/Duu9W2qei1HPTrQJzs9Ln
	WdMd9c0ot9V4WiaTaB8T73V3HUi3V+T3rwTZiZtEfuTRpY/IHel66C0Jj8twU8VnCn2R9wa2yvh
	BP53F4Fh4E0IE6vTkXE0wz4RfJCHOIW8tXWwHwRodo9k4PtnWH0sojYx46CGzskQ6dSlYcstFTr
	26w6ec4pUso1FpHbscvyJuffJjHZERO8uKdiov/dxp7lkvAwtCnbJp9tJAdtnlqU0Nlv94sSj11
	u85784xdnf2DG95p86CYH8U53XUwZhOb1xGZjx8fJEHTUmQzd1ZY6IY1r9SV2S/yjMF4HZyY
X-Google-Smtp-Source: AGHT+IF4ELH4gDEJLP3yzCnMbU/2mpYbWqQYo+PKSyKyYF0gWHZ++ahqmeMq2otdvCVoeq/38ffZQg==
X-Received: by 2002:a17:902:d4c2:b0:235:eb71:a389 with SMTP id d9443c01a7336-2366b17af40mr173905215ad.36.1750148022030;
        Tue, 17 Jun 2025 01:13:42 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a17e4sm73802375ad.56.2025.06.17.01.13.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:13:41 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v0] [RFC] cleanup: Unify DEFINE_LOCK_GUARD_0 and
 DEFINE_LOCK_GUARD_1
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <6850686f3088c_2491100fa@dwillia2-xfh.jf.intel.com.notmuch>
Date: Tue, 17 Jun 2025 16:13:26 +0800
Cc: Jemmy <jemmywong512@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <brauner@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 David Lechner <dlechner@baylibre.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4513F5D8-A3DF-4477-B54D-D9D614DDC2AF@gmail.com>
References: <20250616111436.665171-1-jemmywong512@gmail.com>
 <6850686f3088c_2491100fa@dwillia2-xfh.jf.intel.com.notmuch>
To: Dan Williams <dan.j.williams@intel.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)

Hi Dan,

> On Jun 17, 2025, at 2:54=E2=80=AFAM, Dan Williams =
<dan.j.williams@intel.com> wrote:
>=20
> Jemmy Wong wrote:
>> Hi,
>>=20
>> This patch consolidates the DEFINE_LOCK_GUARD_0 and =
DEFINE_LOCK_GUARD_1
>> macros into a single, unified 'DEFINE_LOCK_GUARD' macro to provide
>> a consistent and simplified API for lock guard definitions.
>>=20
>> API changes:
>> =46rom    DEFINE_LOCK_GUARD_0(name, lock, unlock, ...)
>> to      DEFINE_LOCK_GUARD(name, *void*, lock, unlock, ...)
>>=20
>> =46rom    DEFINE_LOCK_GUARD_1(name, type, lock, unlock, ...)
>> to      DEFINE_LOCK_GUARD(name, type, lock, unlock, ...)
>>=20
>> =46rom    CLASS(name, var)(args...)
>> to      CLASS(name, var, args...)
>>=20
>> =46rom    guard(name)(args)
>> to      guard(name, args)
>=20
> No, I think this organization is instructive for understanding how =
these
> helpers work. I.e.  that the macro is instantiating a function with an
> automatic variable result, and the arguments to that function arrive =
in
> @args. This becomes even more important to understand with the =
ACQUIRE()
> and ACQUIRE_ERR() proposal that instantiate different functions to
> retrieve other properties of the automatic variable result.
>=20
>> No change:
>> scoped_guard(name, args...)
>> scoped_cond_guard(name, fail, args...)
>=20
> Effectively these are not returning an automatic variable result to =
the
> current scope and the different calling convention is consistent with
> that difference.

I have some concerns about this point.

Both guard and scoped_guard use CLASS(...) to instantiate an anonymous =
automatic variable,=20
differing only in their scope, while CLASS instantiates a named =
automatic variable.

To ensure consistency, I believe guard, scoped_guard and CLASS should =
share the same calling convention.
This change would unify their syntax to:=20
CLASS(name, var, args...), guard(name, args...) and scoped_guard(name, =
args...),=20
improving consistency and clarity.

In most cases, an anonymous automatic guard variable suffices to manage =
object lifecycles,=20
aligning with object-oriented programming languages that inherently =
support automatic lifecycle management=20
(constructing objects at initialization and destructing them upon scope =
exit).=20

For example, anonymous object instantiation in other languages includes:
C++: 		People("Alice", 30)
Python: 	People("Alice", 30)
C#: 		new People("Alice", 30)
PHP: 		new People("Alice", 30)
Jave: 		new People("Alice", 30)
JaveScript:	new People("Alice", 30)

This unified syntax would make the API more intuitive and consistent =
with established programming practices.

>> ---
>>=20
>> Deailted changes:
>>=20
>> - DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)
>> The void type for _init_args is not required when the constructor =
takes no arguments,
>> as an int argc is implicitly inserted as the first argument. (int =
argc, void) is an error.
>>=20
>> This patch includes only the core changes.
>> Follow-up patches will be submitted once the approach is accepted.
>=20
> Appreciate the RFC first to avoid the thrash while deciding on the
> format change, but it is a nak from me.

Best,
Jemmy


