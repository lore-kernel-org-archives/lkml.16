Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99F823A9AB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 23:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749251092; cv=none; b=afJaTFLFKnOYHYXmRjUljYwKMqpgpWEJrrARiWtz1s2E/Ycw3sl3DSWXuj95tHl5jYWvgKv4embh3fbF/McysMp4uiKkVy07E2mQijs+N7GMBb/x4ohtNxpdUQuvjKRmsdzWBA/9loFQU8Z0xsF7ohLHipqccdXV/nHVHt1Wa3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749251092; c=relaxed/simple;
	bh=8v1w/rx8QmKrM2H8CLoFMfy02CLFbjc7d7XobF+yimM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C5PbpXzGNASD2yVqh6dRseC72+IOMODf6wSshzeqSQhjfX3tBdRbbwsVBX3KITeK0xoI0Izi4yVjtTHavIEYB3u/4FfG5ve3SZexeTGymyXAwufrV2jPAOJutOMgQNwp4ePDYq6W3K6v5T3GiyWmJhw5EhQkf/B9ATa7G8rj2Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=pfMKRyN1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="pfMKRyN1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2360ff7ac1bso3886395ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 16:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1749251088; x=1749855888; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uhme8POsgTIWZEfbXCMl9ex2ivqucnoJucp3kGTV+kI=;
        b=pfMKRyN1f+7gh1H/HAJrCnaYTyBc0qjI4+AD1e8JAwO+2eMEcypx8Ctu0hXR6M+jZf
         HED/MQrkQSAvVs3Omz3ktNbz0SO8WKcnMcOhIfO9tLEG3GzpqxJaG0TgMfkldl5+eFAa
         wvwP2aJkw9pOSNcvkP+/2P3iLFBkta59XbwSLuW2GJM4zeUFKgTMaOZ87LGiIZylqMsl
         AOF0g+FnFhhUempN2SYFtPudNC0ONNVWqzFplN7BHtCtARLh339h7WNTmXxVqEEmZgbZ
         D40hbNoX6hkQlSeEaGxoZajQTp3/Sp/VFvNJ7rLaZHjTgdZ7nsVvD3yroQDFCkMK25VA
         jKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749251088; x=1749855888;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uhme8POsgTIWZEfbXCMl9ex2ivqucnoJucp3kGTV+kI=;
        b=QggUND0RDeSTEYc1ue7wr3BNkmR+A1Jv2ClbFZ5h1/3OEWdZExOiiiTk7yVZeLLGoq
         RFbBebzZMkBDWpPh0LPlSODu20x0peD6Y+VnIJqTxbn1x9gC3tZHguvMmGahtFLpSjqE
         K1Ebwhv5s4adW+Xsp1nbIKQHYO4/VjYwwZOoW4SsAS0DC9hwbsZB/D/XLGdsZFIxb3kG
         KTFyn2xfuznUQqYO+DflTkCR4LP1MEzr93rXUPFvgiEcL9bIr5d6tUbIJHFkRhlLAnIV
         q2ju2nZnd6c/h3c2o/dLFzZqEaLgmNKaw5mXkjUBIavTzYOhUqKzESiRKwqnmAkqC5Ha
         zsZw==
X-Forwarded-Encrypted: i=1; AJvYcCWrX7QEVm5zaoXII4d5cp5FKPz5BbSUrypXk1WOLZnhHs6qAXvpF3oNquq3OCSW9+U6uSq1RmM3tNgAzac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6fI7kHPsQwwdcpuo9WqkjneD6aHwrkkONqTH5rmhNK0cBOfS
	QzIZUYz38qvNGiHe7TuCpaLma7NVhXi9D9pN2bgqIYP3WyXHoeB6zt8OIinLdolqA2g=
X-Gm-Gg: ASbGncv5R6COX7kzQ7rVcFF07dYEBXIyrDj4j7HGY6hDjuT6V+FobXpqyUs+d7TLcSa
	IWT6BvVsO/xd+LBjjdkySQ9Zno2M6ud6awdJjdRm1djrrIXBqlKtGRYCeqbLIGjReCJdeD0Y2XW
	A2v4upp3wbDiN79U5kpfTS6XpYQuMz8S/y2SB61m6oRJHOE2v8I8RIoprwBTqlnrPOyLfkOgcX9
	s7f8t/C6QQ3Pc5EnlY8k3JkAujjVcuVmwMaJpDG7JWb7PPYell17kLOhukqLJVOhQqAOPMKdaKN
	ljifAo1zH3l/12IKVIXSAW2MiGrBAzDca0dt7AHoXZmcqfzTAfShLdHG2P/zLpxgTghOKt0BCAo
	byQUrl5OnKvaRaPN8qwUG
X-Google-Smtp-Source: AGHT+IFgrQDB6Nn2l+X/T0PcUGKKD0lTBhZasahpqZTWKrGawO0uowh230qpq/ePsvzA78EQxD38ig==
X-Received: by 2002:a17:902:d483:b0:234:9052:2be6 with SMTP id d9443c01a7336-23601d73edamr73967025ad.41.1749251088003;
        Fri, 06 Jun 2025 16:04:48 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:77a3:4e60:32de:3fd? ([2600:1700:6476:1430:77a3:4e60:32de:3fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603406916sm17406875ad.169.2025.06.06.16.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 16:04:47 -0700 (PDT)
Message-ID: <415dae31e51263864612eadfc5ce5699575ad2d8.camel@dubeyko.com>
Subject: Re:  [PATCH 1/2] hfsplus: make splice write available again
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Christian Brauner <brauner@kernel.org>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>, Viacheslav
 Dubeyko <Slava.Dubeyko@ibm.com>,  "frank.li@vivo.com"	 <frank.li@vivo.com>,
 "glaubitz@physik.fu-berlin.de"	 <glaubitz@physik.fu-berlin.de>,
 "viro@zeniv.linux.org.uk"	 <viro@zeniv.linux.org.uk>, "kees@kernel.org"
 <kees@kernel.org>
Date: Fri, 06 Jun 2025 16:04:46 -0700
In-Reply-To: <fa46baccde906c7e52b1d84264d284be1072ffcf.camel@ibm.com>
References: <20250529140033.2296791-1-frank.li@vivo.com>
	 <fa46baccde906c7e52b1d84264d284be1072ffcf.camel@ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Christian,

Could you please pick up the patch?

Thanks,
Slava.

On Thu, 2025-05-29 at 18:27 +0000, Viacheslav Dubeyko wrote:
> On Thu, 2025-05-29 at 08:00 -0600, Yangtao Li wrote:
> > Since 5.10, splice() or sendfile() return EINVAL. This was
> > caused by commit 36e2c7421f02 ("fs: don't allow splice read/write
> > without explicit ops").
> >=20
> > This patch initializes the splice_write field in file_operations,
> > like
> > most file systems do, to restore the functionality.
> >=20
> > Fixes: 36e2c7421f02 ("fs: don't allow splice read/write without
> > explicit ops")
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> > =C2=A0fs/hfsplus/inode.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> > index f331e9574217..c85b5802ec0f 100644
> > --- a/fs/hfsplus/inode.c
> > +++ b/fs/hfsplus/inode.c
> > @@ -368,6 +368,7 @@ static const struct file_operations
> > hfsplus_file_operations =3D {
> > =C2=A0	.write_iter	=3D generic_file_write_iter,
> > =C2=A0	.mmap		=3D generic_file_mmap,
> > =C2=A0	.splice_read	=3D filemap_splice_read,
> > +	.splice_write	=3D iter_file_splice_write,
> > =C2=A0	.fsync		=3D hfsplus_file_fsync,
> > =C2=A0	.open		=3D hfsplus_file_open,
> > =C2=A0	.release	=3D hfsplus_file_release,
>=20
> Makes sense.
>=20
> Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
>=20
> Thanks,
> Slava.
