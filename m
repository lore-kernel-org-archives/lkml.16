Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF4214A64
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748385993; cv=none; b=GsEHvl33DEeigtU73pTdokuuvab91LMggsR3/61SamoEADFkXP0DawrNODcurh/ds8lHrg26AuhkMfTIz/cWM0oJS0RMcJE9TPTGPg41jI9W3A51V2lTpJwz+kpOoMFk8+kashPEIifj2Qpr3KTemJ3Gr+mOX1m9Df5+7fSrdpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748385993; c=relaxed/simple;
	bh=lOUqnh6zlgBeQIUb30emAgDDxUWBy/K7XzQ/IAOJ10w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mU0HM8pb4mqrVWmwX8i9E0GZ1KYc82MXaCItUm5xbDg2AODLMe32T1BMDW1OZhXqOi/VVK/YKSoW0F59EH6AdnqtI+Z2Tx1OQzZNJfktJh6h+HFyMGCPuq23o++fmvpc9ReFTUQmFyrhW2I9oDPlF2pERlS3L2qNhKWOAfD8bZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=tb9jfkzG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="tb9jfkzG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so3377059b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1748385990; x=1748990790; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iEWlqUp6AjwrQz8VBkkI6kcZdrVT9V6EgrDsAu2VRl4=;
        b=tb9jfkzGOuJzmEamQhhcQurwl+EVdWlnAoGtBsvfozz+yabAJKrFlfDGYdYCJGAsLd
         gPJm+eU4WFuxTOWhd+TI0k+9AureJC71jisHB/Rm2B6PSRXiv+Hdmxe5KHXLfI1fK+i9
         Q+k3Fkt47ovtgn/xpnw1ZHJv4J4XKIFNQQ/DnHTdR8PGpeC3Dgvv0nQpa5AAm4APmGub
         IUcCuPTOA5sJqzSiNscrmryWr/XZflsFsFKcyjGa8Ik9kaPouC08pzypBfBc5dGTh4wA
         R/g9YgN20M0by56sRWVOaJOIX2PNvUuh6nplIcN/73LtqY7nBpjEiUDRtzpJgr4iBSoB
         a3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748385990; x=1748990790;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEWlqUp6AjwrQz8VBkkI6kcZdrVT9V6EgrDsAu2VRl4=;
        b=mfPOqf4RkN1S7MS1WxHkDlndf0Lj1qSj8mUdhoguvYPR3P8NvOVe553s1T3B1AYyOf
         Ki1blLciXVggSivry70CqBGF5UeYoEnYBNTYJS1I39B/KmAkKKuzXv1dlH5f1nOUtGlO
         sjbgdQ2eQRpWMCDQW3nP8j6TfE//Wkig3J2XhBdl6kcgHw5pWyfH9ShdnKDDSa59Yhey
         Trel/0UQInX0pGDZKosaB1QXJzn5a0qYzcARP88+ZfObOEDIJRYh2DYlGtEX66JpP/qc
         2Uk1e6HLe/k9PCL+3uXFxSOnXPLXkUdcVYL5Jpye4rdIL7aOvm5ZctopbCt932gPekyJ
         yE8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQvoDSBzb/OL1REHJ4PH4TMoX6ZZ+nT5f9tVgf/GAhuFeKhwo93oKvEZhNtNfmIwI2lCReOMr/Y14XELQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeU9C/b+pX281lMiLk4rvEYyMNbhBNG+edVPVedo55wGfRkvjq
	QNRnkf6+HGOYkpaEM7tbzW0r4m8SzOiq+n/79I9IwA8/+O0u0uRcnOaUgMtnEYLmqSo=
X-Gm-Gg: ASbGncvtgCagCovZp8nu2KENysAGYFqTR32fZuRfBj2lfbI7FcSDjNuXakqSjIQCiaY
	nX+YdeFgFVn6kmux32pyBg6Gpsmf745ALKHryp4WWG/9wMJVIJEaSymjJc3xriVfLxG7ZfeP9gl
	TY66IK422i+35SQNnLqlfN1Y1RXC9IFM7yrT1BGBtmvjddhAnvnjAKhcyGYP9Xd5McNxUVQ95xW
	qmGBUXmjb6iRM2U4v9uhR089rDR00ElxbDPa+b3MaII6kfhfN7vm98R1+pDRhcwc9M/x3qFjWie
	uNRDY60GUdXTBUgrywrtNTCTMKJ4u36P2VXsC48svG2lwpR8qnVoZ0uQ+EuCgepaZWPiTmGU4tA
	Z/rkD/eCtoM/dAaYGi4hjL/PuVzcHgvu2ZA==
X-Google-Smtp-Source: AGHT+IHW0FlyFCy2Tk4oM9nybIEHfyutJ6kk0DbTc32pC46klNxamK+5Q9E3J23coi4/jymOLJ1YsA==
X-Received: by 2002:a05:6a00:a06:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-745fdf76e13mr17990887b3a.11.1748385990008;
        Tue, 27 May 2025 15:46:30 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:dc04:52d5:a995:1c97? ([2600:1700:6476:1430:dc04:52d5:a995:1c97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e66243csm112202b3a.63.2025.05.27.15.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:46:29 -0700 (PDT)
Message-ID: <3bbf9fe0b5e4b2fa26e472533e16a31c9d480903.camel@dubeyko.com>
Subject: Re: [PATCH v2 3/3] hfs: fix to update ctime after rename
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Yangtao Li <frank.li@vivo.com>, glaubitz@physik.fu-berlin.de
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Slava.Dubeyko@ibm.com
Date: Tue, 27 May 2025 15:46:28 -0700
In-Reply-To: <20250519165214.1181931-3-frank.li@vivo.com>
References: <20250519165214.1181931-1-frank.li@vivo.com>
	 <20250519165214.1181931-3-frank.li@vivo.com>
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
> Similar to hfsplus, let's update file ctime after the rename
> operation
> in hfs_rename().
>=20

Frankly speaking, I don't quite follow why should we update ctime
during the rename operation. Why do we need to do this? What is the
justification of this?

And we still continue to operate by atime [1-4]. Should we do something
with it?

Thanks,
Slava.

[1]
https://elixir.bootlin.com/linux/v6.15/source/fs/hfsplus/inode.c#L519
[2]
https://elixir.bootlin.com/linux/v6.15/source/fs/hfsplus/inode.c#L562
[3]
https://elixir.bootlin.com/linux/v6.15/source/fs/hfsplus/inode.c#L609
[4]
https://elixir.bootlin.com/linux/v6.15/source/fs/hfsplus/inode.c#L644

> W/O patch(xfstest generic/003):
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
> W/ patch(xfstest generic/003):
>=20
> =C2=A0+ERROR: access time has not been updated after accessing file1 firs=
t
> time
> =C2=A0+ERROR: access time has not been updated after accessing file2
> =C2=A0+ERROR: access time has changed after modifying file1
> =C2=A0+ERROR: access time has not been updated after accessing file3
> second time
> =C2=A0+ERROR: access time has not been updated after accessing file3 thir=
d
> time
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> =C2=A0fs/hfs/dir.c | 17 ++++++++++-------
> =C2=A01 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
> index 86a6b317b474..756ea7b895e2 100644
> --- a/fs/hfs/dir.c
> +++ b/fs/hfs/dir.c
> @@ -284,6 +284,7 @@ static int hfs_rename(struct mnt_idmap *idmap,
> struct inode *old_dir,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dentry *old_dentry, struct =
inode
> *new_dir,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dentry *new_dentry, unsigne=
d int flags)
> =C2=A0{
> +	struct inode *inode =3D d_inode(old_dentry);
> =C2=A0	int res;
> =C2=A0
> =C2=A0	if (flags & ~RENAME_NOREPLACE)
> @@ -296,14 +297,16 @@ static int hfs_rename(struct mnt_idmap *idmap,
> struct inode *old_dir,
> =C2=A0			return res;
> =C2=A0	}
> =C2=A0
> -	res =3D hfs_cat_move(d_inode(old_dentry)->i_ino,
> -			=C2=A0=C2=A0 old_dir, &old_dentry->d_name,
> +	res =3D hfs_cat_move(inode->i_ino, old_dir, &old_dentry-
> >d_name,
> =C2=A0			=C2=A0=C2=A0 new_dir, &new_dentry->d_name);
> -	if (!res)
> -		hfs_cat_build_key(old_dir->i_sb,
> -				=C2=A0 (btree_key
> *)&HFS_I(d_inode(old_dentry))->cat_key,
> -				=C2=A0 new_dir->i_ino, &new_dentry-
> >d_name);
> -	return res;
> +	if (res)
> +		return res;
> +
> +	hfs_cat_build_key(old_dir->i_sb, (btree_key *)&HFS_I(inode)-
> >cat_key,
> +			=C2=A0 new_dir->i_ino, &new_dentry->d_name);
> +	inode_set_ctime_current(inode);
> +	mark_inode_dirty(inode);
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0const struct file_operations hfs_dir_operations =3D {
