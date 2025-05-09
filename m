Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D36623D297
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746817355; cv=none; b=tbN1J48ohXE017YosbXE3Zf13Xns4KJ0UJbE2xovNIJvP6Wn9Rvx16ZZXqpDPJwjlb23QCxdpB/sKjTavguCSgHDeEMfORIdrMVdAJxJ9wdA22oQ4JpMNJ+3b+/ka5oa/A8KocDi+6pqbTSlpYYIl/oVwWbJ3bUHpUFEoLTy9UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746817355; c=relaxed/simple;
	bh=jlIYNxCTwNnS/l56FRIIVYjtR1W9OmMKAxZDOlu4ge4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cn1y/CC59DWI6J3Kx2NYHvREjKKSdC0XjL2GzmjM5Npj+WS+N1v9OC9xcXNrprilK51FZh4P7Z2XstpoMLeHy0RHlt1iUiXtW/KCQykByppWDtwpjTVC8NVH1EP1rllAJdGmvyrJhdUHgZOeXHT9rAsjGzDvI62cUbAlIsPqebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=y+QYhiNx; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="y+QYhiNx"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2da3c572a0bso1534044fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1746817352; x=1747422152; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jlIYNxCTwNnS/l56FRIIVYjtR1W9OmMKAxZDOlu4ge4=;
        b=y+QYhiNxT+8Eq0W5s8L54Ro53OrQwxvQtddTXEF9ijWZvDVG0xJgS71vq9okjsFyvs
         TEBOWgGbwmWF924bz18mFhNq8WSo6Ji+ibfVVHf+DHPfJdldgm5vr3pIEkmz07cdevO3
         cwY/jc8FNXzTNvNHauLxyHZCXWCwA+bVV8FfX16DkW0qNmOOeYDz6gyqSQOw7v41RmoE
         7bX58tC9K1dlO6JT2Qm4z7ax4hUHcYjmSJCcY7s1zQeIHs9ppcmgXLmOsIfERklJxK4Q
         ZoveX3u2CtEy0bpz0VDlVHj0hXTjhl+ju3Qitm0KGZYZ8Aap+FYA0E/ySkXKkzYqQRCc
         vKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746817352; x=1747422152;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jlIYNxCTwNnS/l56FRIIVYjtR1W9OmMKAxZDOlu4ge4=;
        b=RCdNEQtbqt8UrZpAdbe32lUxm0TIihwr26XGL7RHBGKPpl3bQpo4jXShSBF6cDNt7X
         kszZzXf+jbDWmBanwv0emy92TNcD7icgQrNVEbscoXrrYtdkUkW7ejOhil0L7+BV5HAf
         Fg3CsuzsGHcxL7DzioV6vuHXQTTz5svQf1YTYfbFKVDA8YjYXvAKwJOfCkuvHzXdF47L
         L7kAyRKG30abfjgkXZz8rMws4Cvi8ftKInLnxdGFhkIFuw9rQUhOJIGSyumwJegc7Ab3
         0C6tF7ju4hanSSNI9VtO7XNXTG3xKMsgE4a4AZT8S79iOzw/FMdoOomVKA7uVKHI09Zz
         8xMg==
X-Forwarded-Encrypted: i=1; AJvYcCVBcNodiy7auvt4nEg0bxI2d8xsx/IIMw9YDjsPxZXk4qSTtPq6XT+DiusKrbrbxVCfLsbmw3xuIq5AtqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwGFzuXafx/QcsfQpHdcsZcTtZMlEHfjKM0fJANSrHwYjBOLZg
	LH5j820sasdsHqcIl1492s7iM6mVwDQJVV0e2UQhZAvxGhoQnE/F8mYIwKbaY0M=
X-Gm-Gg: ASbGncsNmPH6zSX7ess3jdX40pMUqLhK4oiSBkXXq4luLV3T/JlUBlHE7WrIeRQrP24
	eZ1EH0RJMO4IIAzQcC2/wjOv8x7Pm7vFyryA3kXDtPCyKvZOO8D2c6sUoVBP9SSa5uhvLqgcmmh
	pZEnPjjzP+vj4vFXNJoE1HYVxwjfVxKrGkRn7j3SziiejZLc/eiSzE+MHdAhP7nzbKtftae1yES
	+ltHQLrCDFzI3zqrDLKK1GoOnsPAXI3Hl0tLqXYasoID//9h7VZ87+kvLDGXIE+8jV+09T7LzVl
	jYFga6nQyjaZoeyG6/x2INvDNrqSTgnGYGdcFd4gF1Gx4UhkyyOUPUWuqDgOQEQ=
X-Google-Smtp-Source: AGHT+IFa0NKyRsiAGbkiBgaS0E0hxf42GonnAI7ZlDTR8C7VVJdkwGn98KDi7yyzE09SPbgqbCTUjQ==
X-Received: by 2002:a05:6870:d114:b0:2c1:9897:dd24 with SMTP id 586e51a60fabf-2dba45ccc76mr3220237fac.35.1746817351971;
        Fri, 09 May 2025 12:02:31 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:f242:4c31:ff5d:e2b7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0afc9a7sm725918fac.35.2025.05.09.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 12:02:31 -0700 (PDT)
Message-ID: <d83f9ef1820c52004ce82ce69e58333ba83af85d.camel@dubeyko.com>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D=3A?=  [PATCH 2/2] hfs: fix to
 update ctime after rename
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: =?UTF-8?Q?=E6=9D=8E=E6=89=AC=E9=9F=AC?= <frank.li@vivo.com>,  Viacheslav
 Dubeyko <Slava.Dubeyko@ibm.com>, "glaubitz@physik.fu-berlin.de"
 <glaubitz@physik.fu-berlin.de>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 09 May 2025 12:02:29 -0700
In-Reply-To: <c19db3b68063cd361c475aaebdd95a232aef710c.camel@dubeyko.com>
References: <20250429201517.101323-1-frank.li@vivo.com>
			 <20250429201517.101323-2-frank.li@vivo.com>
		 <24ef85453961b830e6ab49ea3f8f81ff7c472875.camel@ibm.com>
		 <SEZPR06MB5269E572825AE202D1E146A6E888A@SEZPR06MB5269.apcprd06.prod.outlook.com>
	 <c19db3b68063cd361c475aaebdd95a232aef710c.camel@dubeyko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-09 at 10:51 -0700, Viacheslav Dubeyko wrote:
> On Wed, 2025-05-07 at 14:22 +0000, =E6=9D=8E=E6=89=AC=E9=9F=AC wrote:
> > Hi Slava,
> >=20
> > > =C2=A0=C2=A0 +ERROR: access time has changed for file1 after remount
> > > =C2=A0=C2=A0 +ERROR: access time has changed after modifying file1
> > > =C2=A0=C2=A0 +ERROR: access time has changed for file in read-only
> > > filesystem
> >=20
> > > It looks like that it is not the whole fix of the issue for HFS
> > > case.
> >=20
> > The test cases that failed after applying this patch are all
> > related
> > to the atime not being updated,
>=20
> If I understood correctly "ERROR: access time has changed for file1
> after remount" means atime has been changed.
>=20
> > but hfs actually does not have atime.=20
> >=20
>=20
> But how the test detects that atime has been updated? If HFS hasn't
> atime, then test cannot detect such update, from my point of view.
>=20

As far as I can see, HFS code operates by atime [1 - 3]. As a result,
generic_fillattr [4] can retrieve the atime value. If we don't store
atime in the on-disk metadata, then the test could see inconsistent
atime value. I believe that dirMdDat/filMdDat (mtime) needs to be
considered as atime too. Because, modification cannot be done without
access action. So, atime =3D=3D mtime.

Thanks,
Slava.

> > So the current fix is =E2=80=8B=E2=80=8Bsufficient, should we modify th=
e 003 test
> > case?
> >=20
>=20
> I don't think so. Probably, something is wrong in HFS code. We need
> to
> double check it.
>=20
> Thanks,
> Slava.
>=20
> > =C2=A0=C2=A0 dirCrDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=
=A0=C2=A0 {date and time of creation}
> > =C2=A0=C2=A0 dirMdDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=
=A0=C2=A0 {date and time of last modification}
> > =C2=A0=C2=A0 dirBkDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=
=A0=C2=A0 {date and time of last backup}
> >=20
> > =C2=A0=C2=A0 filCrDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=
=A0=C2=A0 {date and time of creation}
> > =C2=A0=C2=A0 filMdDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=
=A0=C2=A0 {date and time of last modification}
> > =C2=A0=C2=A0 filBkDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=
=A0=C2=A0 {date and time of last backup}
> >=20
> > Thanks,
> > Yangtao

[1] https://elixir.bootlin.com/linux/v6.12.6/source/fs/hfs/sysdep.c#L35
[2] https://elixir.bootlin.com/linux/v6.12.6/source/fs/hfs/inode.c#L356
[3] https://elixir.bootlin.com/linux/v6.12.6/source/fs/hfs/inode.c#L367
[4] https://elixir.bootlin.com/linux/v6.12.6/source/fs/stat.c#L60
