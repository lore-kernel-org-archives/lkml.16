Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB576213E85
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748385380; cv=none; b=bSy2Se7y7Mr7z+h5VAKAWGKzkGd0wQw+8Myj22zjq5xHxo/un5h9pfH3C2ZT1ceyvF9dO0oNjajBhZdUTOdb14GSxT/3yUJd4ENtnwhDD4/ILwmrdzVlG7K/FqDfb+LAltLGaEvvKxP5AnfFSZ0+RshtQGY2zcQPLR1eu+WEJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748385380; c=relaxed/simple;
	bh=40TT6223RMHNBfkiH6pSJ4DCwFeYRyONDlM+ZtHOYFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TozXani8IYavDeZeej51MeNO2FU7sLCvzhHb5SNI4BhyMX5ks5GCv9WlRdKFE5a5KsjGtMBVVRkqwFAk60dpIWz7xKGAt4758zHx228v20XG4QgqnrPMjHpO41smSDBbvp7+TlF2T29bDZN7EahdmIE3nJPXPsqnXi9Xh3AECZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=d5s+Qbk8; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="d5s+Qbk8"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742af84818cso2341266b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1748385376; x=1748990176; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=se5I//8uzLIZZ2Ua7ZTNM1QkZa6yES7oyoqw0SgUaKU=;
        b=d5s+Qbk8w3KB5HsnZiGVyMHmhmocJ3LWPIQmxX5kogA4DPnsW/23M8SffDLc7qmmEH
         NiyWn+7d6yT5t+ktsTPLZB0AFR6edHZerWCfr7szbFHww143eCXeF8taF0LWMAmSrcdN
         LkTtPYwWRmZPNWjkKldH248dICF/7KUE870uSiyDI+HgUSrcm7RISAN2D5h5cNL8ktPy
         hio6n/wPA3tOMqgdt72D6nq7zkb/X3+w5lIcpVzdThods73Wzj5rDKrI2uaCz04QmaON
         /qTBla11FH2SCnLJjqxGDeXeP7UOH3aHv+8mU1lC4HkJq4Ygw1sFW9q3BBM1z1G8nGKb
         rapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748385376; x=1748990176;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=se5I//8uzLIZZ2Ua7ZTNM1QkZa6yES7oyoqw0SgUaKU=;
        b=uSCOY7Ve1ibU6y+MKWjVfMdxenwo8ZaWFqVFpUWMNsxhfnHY0Pv4Nfw32XUt+V1TGM
         N8CG8LJduJOFzmDudyZ16qulfAaRWdBx2IAVd9nQvF7Lx0plZPY5R8iigivljx3bqVY3
         B4Z5ZhWhVL111100gG3JH7FUoo35UyqpIXDMqO1urlJuxOR8GTbKlmP1n1Fqy13Pj/1J
         F8N43iAflBpn7sbyfiHjv5yixkwCDkPP4jsW3otbjVYDHmjFyJXr2fYuVmyvSOXZH0db
         SOx1h9gDaCB6/4079pK2ZoOzZQKLjED03OG/lEWIUC9zkeQSNdP2VDJtVxNybzWmH+KB
         kbqg==
X-Forwarded-Encrypted: i=1; AJvYcCWvwQUFJTj/ulkpIW4BIe0xCwo/6ndz7GQ2b6ZIXhho4bZqpORp9FJ1G0gwPUihVou5zdDgGFzTaSXaIQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1D/DIH0EA78YxVJZKXkAr6zD1o3GXeUmhYrUhSk981LwIztZI
	2U5Xfu+Y0VBN10F9X4Hv/0mB6kVXE9qsZ2v0VWd88YKLM8+wInW2PL7BULEZ316dzIs=
X-Gm-Gg: ASbGncu5qUXJ0IJYBIMkCc8cMt9rt8G1QYJSJhhzl8aUOkKjJoMowkywduG2K5oPqpY
	XwpZ1xdT//HmnrhazqsFEU1ZNH3VOYDKJcwVKyciilxsd/vyfj31Q7/ZvpPIFwxJe1g3KN2hIVg
	RzfqVMCgcRxi8Ew49ss0cf5Tfkirz2+f9xPqnqEcZotJwCo7A2DAMOc55tFfOQ/sfOVICgTM2Pr
	4U8pQaB3RA3tElEqHbuy/dtd+Widv0ldx/vyY6fzlWWSUEMjVAyWtkluLJqPTbqu54oTXeAwbLq
	WQv8jWUy1E5puK7lUZ5yAvqIWSilb8+xkhGfzYRxk08PewyuATux2TNZhvsgw8ZRTBlZv0S62FE
	38xzgL3UunOhRRyczOYo2rUE=
X-Google-Smtp-Source: AGHT+IHaiHE641xxzDMfr1wkDbFGsdFxw8FhdTQVBDaoFZF5b72J7tD+yg5+vydr3p3YDm6cayOlWg==
X-Received: by 2002:a05:6a20:2d0c:b0:215:e60b:3bd2 with SMTP id adf61e73a8af0-2188c37d5eamr24296081637.30.1748385375862;
        Tue, 27 May 2025 15:36:15 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:dc04:52d5:a995:1c97? ([2600:1700:6476:1430:dc04:52d5:a995:1c97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2cc40d6ee6sm119850a12.67.2025.05.27.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:36:14 -0700 (PDT)
Message-ID: <ca3b43ff02fd76ae4d2f2c2b422b550acadba614.camel@dubeyko.com>
Subject: Re: [PATCH v2 2/3] hfs: correct superblock flags
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Yangtao Li <frank.li@vivo.com>, glaubitz@physik.fu-berlin.de
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Slava.Dubeyko@ibm.com
Date: Tue, 27 May 2025 15:36:13 -0700
In-Reply-To: <20250519165214.1181931-2-frank.li@vivo.com>
References: <20250519165214.1181931-1-frank.li@vivo.com>
	 <20250519165214.1181931-2-frank.li@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-05-19 at 10:52 -0600, Yangtao Li wrote:
> We don't support atime updates of any kind,
> because hfs actually does not have atime.
>=20
> =C2=A0=C2=A0 dirCrDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=A0=
=C2=A0 {date and time of creation}
> =C2=A0=C2=A0 dirMdDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=A0=
=C2=A0 {date and time of last modification}
> =C2=A0=C2=A0 dirBkDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=A0=
=C2=A0 {date and time of last backup}
>=20
> =C2=A0=C2=A0 filCrDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=A0=
=C2=A0 {date and time of creation}
> =C2=A0=C2=A0 filMdDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=A0=
=C2=A0 {date and time of last modification}
> =C2=A0=C2=A0 filBkDat:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LongInt;=C2=A0=C2=A0=
=C2=A0 {date and time of last backup}
>=20
> W/O patch(xfstest generic/003):
>=20
> =C2=A0+ERROR: access time has changed for file1 after remount
> =C2=A0+ERROR: access time has changed after modifying file1
> =C2=A0+ERROR: change time has not been updated after changing file1
> =C2=A0+ERROR: access time has changed for file in read-only filesystem
>=20
> W/ patch(xfstest generic/003):
>=20
> =C2=A0+ERROR: access time has not been updated after accessing file1 firs=
t
> time
> =C2=A0+ERROR: access time has not been updated after accessing file2
> =C2=A0+ERROR: access time has changed after modifying file1
> =C2=A0+ERROR: change time has not been updated after changing file1
> =C2=A0+ERROR: access time has not been updated after accessing file3
> second time
> =C2=A0+ERROR: access time has not been updated after accessing file3 thir=
d
> time
>=20

I am slightly confused by comment. Does it mean that the fix introduces
more errors? It looks like we need to have more clear explanation of
the fix here.

> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> =C2=A0fs/hfs/super.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
> index fe09c2093a93..9fab84b157b4 100644
> --- a/fs/hfs/super.c
> +++ b/fs/hfs/super.c
> @@ -331,7 +331,7 @@ static int hfs_fill_super(struct super_block *sb,
> struct fs_context *fc)
> =C2=A0	sbi->sb =3D sb;
> =C2=A0	sb->s_op =3D &hfs_super_operations;
> =C2=A0	sb->s_xattr =3D hfs_xattr_handlers;
> -	sb->s_flags |=3D SB_NODIRATIME;
> +	sb->s_flags |=3D SB_NOATIME;

I believe we need to have two flags here:

s->s_flags |=3D SB_NODIRATIME | SB_NOATIME;


Thanks,
Slava.

> =C2=A0	mutex_init(&sbi->bitmap_lock);
> =C2=A0
> =C2=A0	res =3D hfs_mdb_get(sb);
