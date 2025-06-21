Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63911E4A4;
	Sat, 21 Jun 2025 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750523054; cv=none; b=ku8Zh5WS4PRQjdw2Tf6CiM2dQdim6FI8D3BmahfqlhOTDb319LCqypts0kdBSNhJyMYBqb2gmXii26rOAk2C/PWQEcVH/i+DzLRiG6JDSKp6GetNHkLDkhSohK/9bZujRwTArDNVuBBxsBo9P2ZH+Vu3QvOdTmB8eqXOJcSoZ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750523054; c=relaxed/simple;
	bh=eiUYB0OsVU+n1MaEMpwIEV7gsdrcmIJQB/BK030GGt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BB+ICg+PG0nooAkbJR1rKpdUZ8ydk7hCOKTDDwlC6XaHHr3WQsIeMHb6cTYpXFIVIvjsUHQQHvzZRIGQE233jzOQVQu5bmJGlsOxULlJ/8NLfbnKb9p7rYyDydJB5YTUeJuUGaEsVucdHPOOHxffGgPyrlsDlkhVwCpGxmqfjrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZAxpDUP; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZAxpDUP"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b31aecc78a3so481566a12.1;
        Sat, 21 Jun 2025 09:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750523052; x=1751127852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiUYB0OsVU+n1MaEMpwIEV7gsdrcmIJQB/BK030GGt0=;
        b=lZAxpDUPU5UZ4oIRPZKydmx+xRlW/RoN7Sj9EAwf+sBPv90zWWCclsGSJlwSmlHyHP
         bAnNo3rk9FDstNxbRXgcEAoC73sBt+tm8jwlJMTSnwfrmGA9FozwZz5zA50FTO12oc6w
         0gt0DKoB+VfpCk5qF5d4xbQ7gDXU8HbLoEPeiJjhPwK59QcwDgg6izqu+KNywiD/izbv
         r6MeX+dbAz7fgDSUgGgY2keVw0H7wuF5X3Tws++reG4pY8B309L66aVj3Pf1SyoyBA4y
         6HC4SYNjDxNKs3AS5iFMMwA8N30PWUinNnubVmMqr/uso6tiMoGhZdzXUhEgktfBOKco
         +ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750523052; x=1751127852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiUYB0OsVU+n1MaEMpwIEV7gsdrcmIJQB/BK030GGt0=;
        b=J7MzDLsjbGqyCOkTTmpqhPqVGyIg8eH692UA2Vh5F4FsIiPHmMbQsGw7Lhz0f6Cd0t
         hN98fMrwKIayKxnr60UxjByVbSX0YVmZ4Dd09oNn5BWqyejCSaqK3gRom3TdwZ8TbIQ0
         q8ldZnQKr+Rspv0Cx9s3BnaKGccXmA03cA6KS4ZYYLlsp+xDFfH6d6w1aKH1Fxo7wldu
         Dfwc4vFrDh68b/xvLlnbxwsVRV2LiKvR7bfcUpkocgmA+puoRyq7byglu5gZmLi49Jur
         KNpSKj7vgqvgPpCykI3uiq9fDOArmGJxAghS3/eEdW0qROowXlloNeTPQNRvA14rOMUh
         NZQA==
X-Forwarded-Encrypted: i=1; AJvYcCVLuvyp7zVNO6Y/zK7a4ADImIHTVt/S8RybcwBFOrohrWNf1OVvb0A9DDMvAskfNPEbb0EGS3dQt8//J78UFVo=@vger.kernel.org, AJvYcCWjVw7wbWtdlOYuiIRB3X31GKcPWaETAatErCtWePATizVySyqjgVBakn/Ykni69am7+s67WIY5J8kfwlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AuNI5Q6AEM4oA3Nr5MGCfhjiKTruJks98OMqxcuskJSPvAIC
	SXBJZFZ5ihZNKvGdcSOXznr5ObjEkuGxWvrGPOWwmL6/Flq4mFpm6rYYr77E3OYtHYe29HOh+j8
	lGOQLB/VVgii11/ypiO4ciEQT5Uubrrk=
X-Gm-Gg: ASbGncs6s0zETsHEBwW7xNzHU7cJALULxlKKicHzuAWUB9OyeLn//WO1ZV6NZQo9QGG
	o0/m4f+q121dZgs8R/F2ZvI21Zi72kyXzJUpg/Sqby/HNESuUUjPIvqTnjubkM6YR7kHKTldzTT
	tJIGJXjkwAuDS6IuDtvnsEe9WeMzw8LinDeziTZGSgN48=
X-Google-Smtp-Source: AGHT+IFwECQIHlbcWhvDGYlEVxqhVwL+k+ZZ8wTsYkeWvyY+BIjP4jj5N0iL9hFrlqIVzBqKTd3AKdAFLBI13L3+jFA=
X-Received: by 2002:a17:90b:2ecb:b0:313:f9fc:7214 with SMTP id
 98e67ed59e1d1-3159d628b4cmr4323355a91.1.1750523052185; Sat, 21 Jun 2025
 09:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614081312.763606-1-ewhk9887@gmail.com> <20250614081312.763606-2-ewhk9887@gmail.com>
 <CANiq72=QUbe-koU-BEhEJ1-7AafC0kGcG6HOhiVaR1TWqPoLFg@mail.gmail.com> <965a9fcd6bba9915b4e0cdc442067c7479477b84.camel@microchip.com>
In-Reply-To: <965a9fcd6bba9915b4e0cdc442067c7479477b84.camel@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 18:24:00 +0200
X-Gm-Features: Ac12FXyXVkE_qjpRCuHCcaABTW5sEO1KQfHpAgGaeXmStAgHMi1DGl7Qk5rOh1o
Message-ID: <CANiq72mALYRi5O+gmLbv=vy=9caJ0NCkpBwSyCq4A+YPV5QgFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] spi: spi-pci1xxxx: Drop MSI-X usage as unsupported by
 DMA engine
To: Thangaraj.S@microchip.com
Cc: ewhk9887@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 5:44=E2=80=AFAM <Thangaraj.S@microchip.com> wrote:
>
> Thanks for pointing it out. There was a mistake on my end during patch
> generation - the patch isn't part of a series, but it was mistakenly
> created with an incorrect header. Apologies for the confusion, and I'll
> make sure to avoid this in the future.

You're welcome, and no worries! Email/Git can be tricky sometimes :)

Cheers,
Miguel
