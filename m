Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B528253B46
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225667; cv=none; b=pt72L0FnWZUoGvEExYd2cB6wzdxxxM4jGk0A1fycJ3O562n2kWPEyHvtImEbS+OCtH5FJ6MQ1uHa+Pd72Kyayoymyxppu/3tvpaqStV3oLK7PrNJNW96UsX9lN0/ZcwTzLjA1JET0wyGsQr7X1I42CIZU5Y/BHhJ2xSd/dPhaKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225667; c=relaxed/simple;
	bh=p8HVe7xedrGPEDuldvMPssv9wwdcT/NuIRjDddynKkA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iQnA8r0dOrxyR+ymccYBLkBWo2XhG7pN1Pm8J70kgPtSYIfKOeInKGoVF+1s3jMP2CetNu+fqlsmj2Vffoj45pj1IonezJ/4QIHDOwnhEWpA46trq50QBymZ6FPOLA/o/pxyMV22Z6XkQsLsky2ISh2W2KWqy0bUPDUyN5xZ7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZ48ZnXG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZ48ZnXG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2279915e06eso70337875ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744225663; x=1744830463; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8HVe7xedrGPEDuldvMPssv9wwdcT/NuIRjDddynKkA=;
        b=KZ48ZnXGLVne98z31JDpmvak5QmOPWqpdIbmnDWbtcwgcQcsjA9sXCSzbgdpYuvJfO
         NO9KXyfDVOYVBH79qAgA9ru4GEtdg4p4e6W9abKgNUPqaN6WJDDjrDmhCfQJ0mv+5kDt
         M5CgRJWTk5jvD/d4dRKbsEP7Ol/VbTavVb/7f3k28Ma7jNkLWFGI0P6M3OX6NC0XaZXd
         Ul9QxFEs45tXGSqcB0cPriYTJ2BD3GnCTqhzTBPje5Mzjdp3J22EckPJ+miztRL454r4
         W2TnWPjR+C4LyBm4i7PvKQ9YZx8A5Fs3PGrLJ0Dyn+e4Q7XovuNrt1OI5LnixsZI1cGf
         G2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225663; x=1744830463;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8HVe7xedrGPEDuldvMPssv9wwdcT/NuIRjDddynKkA=;
        b=We/WDKYC+U+5rJh8U35g8Ll+zrIPjBjvHBjg8wCmeF4y2Z5j0EtaTNvUKaPOnUwb9G
         ceSUh1pYGLVaKJZvoJ+OMz8dmjg/KD4U/PvPyr5eMa85EX8N0fo23f2mdRkBwYRxOpNw
         hA3lmksiIH+aG8fBKK6bHajShTO5czvS7Zg5+wzKVEaU0n0S3XsZuqn9E5kzvZI1tuht
         eu+gAV4YhZZYATKXc/JF8YsYBOsS+gmmaYLwzYesPISW6EWg1za1PqOOn3baSuff6TAZ
         SNAbib6o2TOp0JVavRKh8uj9AmeC2dUXEtFAX+Tlcv17TOb/jbHUXmz5id9IuO78PVO6
         BmSg==
X-Forwarded-Encrypted: i=1; AJvYcCXDabUjaHR14oAu3x7PIIP89T81tAMPz+poX0B6fxsjp190Dt6+0bzbvwSCCVsrqijvupDZhg04cigORLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLQo+HeSZF67B3VfRkpbQ3+JQ9alCW2kkZJzovehwjrvYTjHp0
	hzdF8oVzPnKPcokuevjLV60iiy5fj+6pjvrwuHuJrrrtkL4FSNt4
X-Gm-Gg: ASbGncuvuu4SWXFkLQtJ7iMuuog0eqquBAZmk/h+FCUIWJ88XnbJpPdjL1di2RMgFkr
	tkLDhYy9tO/1Oz6m++6X3fwkIvG/bR8wyFlT1LgWAD7hSTIXvhUEz0dC7kdTiWVpFDXGnRX6MtH
	ms/CRbVgpuG6u2Qkahby+Jl0LOxCyAuNDDng/oRzL3icku/ROGyN3qt72MBcTuXgvm/y+p/3/1p
	0pjHyOoa14P5AMM1kKDdBV+wJL+FV32y4cYCYX3ZrKQXy6JJI+26mXQelHD19sQV2lBtbafcMi2
	BLkB3YjQELMS02JKYIU4Wh0wHKFPFNCfBevp6AwJ/jKtk8hTehk=
X-Google-Smtp-Source: AGHT+IF5h875Jogrqv3kb3o1pmmskiEWW4ftOUzVoMmRy0SzkzmraclThn1i4sXhZJQ+6epXy1d3jw==
X-Received: by 2002:a17:902:ec86:b0:224:2717:7992 with SMTP id d9443c01a7336-22b42c13392mr371565ad.33.1744225663408;
        Wed, 09 Apr 2025 12:07:43 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ce503dsm15602805ad.259.2025.04.09.12.07.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:07:42 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH] fix mismatched parentheses
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <bb44ee43-b08f-4a4a-bdde-dda785756680@t-8ch.de>
Date: Thu, 10 Apr 2025 03:07:29 +0800
Cc: Jemmy <jemmywong512@gmail.com>,
 Willy Tarreau <w@1wt.eu>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3ACE8CC1-220D-4D92-9C91-596AF985A7AB@gmail.com>
References: <20250409181934.5589-1-jemmywong512@gmail.com>
 <bb44ee43-b08f-4a4a-bdde-dda785756680@t-8ch.de>
To: =?utf-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

Hi Thomas,

Thank you for pointing out these details.=20

I=E2=80=99m new to the community and really appreciate your advice.=20

I=E2=80=99ve addressed your feedback and will send a v2 patch in a new =
email shortly.

Best regards,
Jemmy

> On Apr 10, 2025, at 2:30=E2=80=AFAM, Thomas Wei=C3=9Fschuh =
<linux@weissschuh.net> wrote:
>=20
> Hi Jemmy,
>=20
> good catch and thanks for your patch!
> There are some small formal issues with it, though.
> Could you fix those and send a v2?
>=20
> The patch subject should start with "tools/nolibc: ", and could be a =
bit
> more specific: "fix mismatched parenthesis in minor()"
>=20
> (more below)
>=20
> On 2025-04-10 02:19:34+0800, Jemmy Wong wrote:
>> Corrects an imbalance where opening parentheses exceed closing ones.
>=20
> Use imperative language: "Correct an ..."
>=20
> As this is a bugfix, a Fixes tag would be great.
> In this case:
>=20
> Fixes: eba6d00d38e7 ("tools/nolibc/types: move makedev to types.h and =
make it a macro")
>=20
>> Signed-off-by: Jemmy Wong <Jemmywong512@gmail.com>
>>=20
>> ---
>> tools/include/nolibc/types.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/tools/include/nolibc/types.h =
b/tools/include/nolibc/types.h
>> index b26a5d0c417c..b57e054cca82 100644
>> --- a/tools/include/nolibc/types.h
>> +++ b/tools/include/nolibc/types.h
>> @@ -201,7 +201,7 @@ struct stat {
>> /* WARNING, it only deals with the 4096 first majors and 256 first =
minors */
>> #define makedev(major, minor) ((dev_t)((((major) & 0xfff) << 8) | =
((minor) & 0xff)))
>> #define major(dev) ((unsigned int)(((dev) >> 8) & 0xfff))
>> -#define minor(dev) ((unsigned int)(((dev) & 0xff))
>> +#define minor(dev) ((unsigned int)(((dev) & 0xff)))
>>=20
>> #ifndef offsetof
>> #define offsetof(TYPE, FIELD) ((size_t) &((TYPE *)0)->FIELD)
>=20
>=20
> Thomas

