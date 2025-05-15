Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7769C801
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747271435; cv=none; b=Dojnv9FHVyrMlV2RadCfO6/tAIu4Kv44V3GywTsVfj2uqzyT3IgRbjYSt/407+kiNWzusAm5KOriKgDtPaSIiPMHszIcwGaZekeFLLqLiMrhjAUfhQFxS4bDxpB2dAoBBjDhRu7Ls0vuIGyDFsbqh3Pg9/UZkGKMK122taOYzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747271435; c=relaxed/simple;
	bh=Vpi9yO3lle9qXbfYWi9NIZVtgdUtOs1fM2z5YMQE7aI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qd66g7akDdke6kahYhEPlkTTe2mmQZYnUv7MjcadBK/nVo7oCG4bNkeElxH2008Qs/lLoRlw2dLKuwGm3b5kavXscMIRXiBAp0arwy7JaUut629MUrjI/9xRwFTeWnUcb5KWKyu3mm+SBwz7QQw7xcnPk0h4soX7zq5caNJAhyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=C8qJuhi9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="C8qJuhi9"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54fbd1ba65dso378458e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1747271431; x=1747876231; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5n+9oNBJa8I1ajVPNmF7REMZSoiE89WgACRz/GpvLA=;
        b=C8qJuhi9+pK8klWhqgaZ9wDkhg09VYXr+49AOnG1yGI05kpjVkeS+Lj2+uZyFP8u5q
         TyxERTSHlg7dhgPU/rJhLxSLvBYOG9xK8iDvPl42W0J9ez5yW0JennVhamyFnL+sKN5N
         1Mlgi3IGGooG3MgV/hZE0S+gEyX80RykhaYzmLAiV1LcitlERShCF1dNaSi7UymHiuNN
         cV7DH0U8lg3V7nm4VAWXHUHeY/ux0Cvg8KOewm/CSAdtGO16dIA9+JI6gw8AYqxhhOCN
         57CEjXjPG6P5fOVCyfejLscaxZZLkqOm7COQru6JU166Taw4a9m96qDevLxXWjY65iVM
         10UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747271431; x=1747876231;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5n+9oNBJa8I1ajVPNmF7REMZSoiE89WgACRz/GpvLA=;
        b=GVAYSweF7KhnPcms9OUHfEYufOKWaNN3ftpmnT6jF7DUbA/pIxZb3V+zOGXBSKZc9b
         iYWZH+cc9SJpUPkAaBN2zU5A+oN7urUuUhmAAijFh5tFY+EodFvdZEmUfcCaaS3FN5M+
         wvY/pcuu4+/Zvz2YDG4Rk4Vlc9UiVuyO4zA0EZALHlsLdIarBFfRoiSsjHbwKtda7ztB
         HA/TZw2ZQz5DtDUsHFz1JKD/6Ec3d3+1dC9X9Fnoc1BkyayH/1e/qTxLfCm0kAmwnBMm
         c7ZVfHi/k51kLaOR0Qs/+BXY1OPYMsPLsiejCp8Gi1briO5rEMtM82z9Ie2KWbfglySf
         uDLg==
X-Forwarded-Encrypted: i=1; AJvYcCXL/0ltjzKaSz8ySwcvUUXXhdyjLTV4lWT+eUGBJhzgUabWlVss0LlZpozE4TiN0cviEXh1bHKUv/i5ToA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzginCQzq5kEdbPur90o5nSMPzzqLwr/WEIKnkGPrIcGp5wj+9d
	rl0RSHh2e6fXI0UQ5xGIi6pAsBugpMstDLxbt6SRQKj8wWDsH7xmOwzfOnRBMFY=
X-Gm-Gg: ASbGnctkZLsXZcvtwj9vEvMMtmcZqnii/yLIEpeqlVZyzqg4kjnMI/MMpf1TFHyTaRK
	EacWpOyHBWD8ddVL6P8LbLeq7/SZVSEgNEvepOHsoBzKrJ0i9XjjLXzG/b6rh4FZUokkaWyqoG3
	Y3+CmyiPTmc59wipdcnxFI1ItuCnADCloxHM3JlM3bfX5KWoEsPp+vmYkgLqKPhWuUNlilMQNTR
	wBlRfIAzvxP7QJn3OJk/wwMXFwlTxN5biwxAAdsyTdpxM3xNOkYSI+vwVILVgpJyvTn19vv9VhY
	y/EvV41T7hnHydbdaIJeAScBeKGAjJyKUmNofX3UA7VxAKXh7Mp6mA==
X-Google-Smtp-Source: AGHT+IGQdtgUjYwqZiSEo4a5YI+wlqPvR0EFz1KQrGzfKFyM/SVmJN7/CJAxhwlH89l4W+9gi2visg==
X-Received: by 2002:a05:6512:3e0c:b0:54f:c3bf:988e with SMTP id 2adb3069b0e04-550dd0135d3mr189215e87.33.1747271431225;
        Wed, 14 May 2025 18:10:31 -0700 (PDT)
Received: from [10.24.138.144] ([91.230.138.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd208sm2438411e87.253.2025.05.14.18.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 18:10:30 -0700 (PDT)
Message-ID: <44bdd2c97a8c91acb4b7e101f85f9a261b6c5cbc.camel@dubeyko.com>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D=3A?=
 =?UTF-8?Q?_=E5=9B=9E=E5=A4=8D=3A?=  [PATCH 2/2] hfs: fix to update ctime
 after rename
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: =?UTF-8?Q?=E6=9D=8E=E6=89=AC=E9=9F=AC?= <frank.li@vivo.com>,  Viacheslav
 Dubeyko <Slava.Dubeyko@ibm.com>, "glaubitz@physik.fu-berlin.de"
 <glaubitz@physik.fu-berlin.de>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 14 May 2025 18:10:26 -0700
In-Reply-To: <SEZPR06MB5269F2CCD9AD085D2712842FE895A@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20250429201517.101323-1-frank.li@vivo.com>
			 <20250429201517.101323-2-frank.li@vivo.com>
		 <24ef85453961b830e6ab49ea3f8f81ff7c472875.camel@ibm.com>
		 <SEZPR06MB5269E572825AE202D1E146A6E888A@SEZPR06MB5269.apcprd06.prod.outlook.com>
	 <c19db3b68063cd361c475aaebdd95a232aef710c.camel@dubeyko.com>
	 <SEZPR06MB5269F2CCD9AD085D2712842FE895A@SEZPR06MB5269.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-05-10 at 05:31 +0000, =E6=9D=8E=E6=89=AC=E9=9F=AC wrote:
> Hi Slava,
>=20
> > If I understood correctly "ERROR: access time has changed for file1
> > after remount" means atime has been changed.
>=20
> In fact, it seems that it is not the atime that has been changed, but
> the disk atime that has been not changed.=20
> The inode in memory has a newer atime, but the atime is not updated
> to the disk when write_inode is executed(hfs has no atime in disk
> format).
>=20
> For ERROR: access time has changed for file1 after remount
>=20
> Before:
> 	Access:=C2=A0 2025-05-09 14:05:40
> 	Modify:=C2=A0 2025-05-09 14:05:38
> 	Change:=C2=A0 2025-05-09 14:05:38
>=20
> After umount&mount:
> 	Access:=C2=A0 2025-05-09 14:05:38		<-- back to mtime
> 	Modify:=C2=A0 2025-05-09 14:05:38
> 	Change:=C2=A0 2025-05-09 14:05:38
>=20
> So we get inconsistent results for atime.
>=20
> Am I missing something?
>=20

This is was my point. We need to make the access time (atime) always
the same as the modification time (mtime) because we cannot save the
atime on disk. This is what I meant by atime =3D=3D mtime. And this atime
change is happening in HFS driver logic that needs to be corrected.

Thanks,
Slava.

