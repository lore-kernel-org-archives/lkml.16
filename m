Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F851FDA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067442; cv=none; b=WOCNwxTPZr0rGw6hJzCMCgtzFd1D09xbJCuwaAbGNjHPxBCyQg/bFHNX5FZKffYsAq4miEBhy4IeroRQ/JsmL5g7D026QMMvSzRKJwbLenXy4STyg2n+SnVCuUN05Ag0il7+nvjvWKEUTjTaC3xXbHKr9Ac/E53nTIOa6jE1XcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067442; c=relaxed/simple;
	bh=OOG5iMHi/k5zVMR0uHcC6fQDYggSaTTtgcJHQxEmyEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHvTYa+NrqRIAC+j7O2kbCNwKarNoKKTvDRCatuMPqGcxwfaLU2JP04Jse9kgSKQTrOAsUV7HFknK56gFGshr0z9W/okANVokLKE5xNmId9jnjlZWQK41UQ6ftIZWwP47Kmt+eppZjm9hKdt5wTDkcErVILJkwENHHajxXaiLNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F3yOuq+N; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F3yOuq+N"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a510432236so3189747f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750067438; x=1750672238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KT4SJEgr+yJM/5To9E7jMtsPro3qEIycq7sf6iASXss=;
        b=F3yOuq+N9MbR0VCk4fQGOoXugaF4j55ofQX/6vfvxt8FB1OaHuD+5B87nzzccPPSOy
         ilnT0MH5TLVz6JuxsuTBaPIbp4nasYytegKeSiFE2T/890CPa7o94WbsGfHyW4iDtdAD
         QrOtjE1ilHTzfXEGEUFIHi7F8v0qMfCA7Ho3BYLurpT2absrbQKvR+0es6Cg41LORHti
         RX249AYd87ZaFaDeTS9lkGKjVi4xfpcQVv0hghqGZwqEq5a2Td6mi27KKr+bT5JDqFqU
         5xXXPjo0VUmd+LqIrKRI7u7rDhbDpqfZbTEaz6Sc+vHdzROnB0RltvRgRJmAiHWvz9I7
         Oo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067438; x=1750672238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT4SJEgr+yJM/5To9E7jMtsPro3qEIycq7sf6iASXss=;
        b=DQvyt6ITaabKRaYfH8m8i28PD6Shw0vaPJYLQGN4hL6aB58x7s03l5TyZocUZun/D5
         hw4V2USpFmK30qdjFlWyg7IBj5+5HYAq/Q3vUz01/nDBnKvtF+YUWHuXxHH9MQA+PyQ/
         5MJrNrMs6VOFpRo8w9ssM0TrNjSnt60E8mumDDeRas3RJNOr7qKplooq4HQEk4Kr0JiU
         mZY1JIHzmAeYyShjmNBw2Nyn7ECo2WxBgO256p7VAQBnVpjhv4PHPaxKGWJi0ZKQSbl7
         wE0fDCDGhHTlrTkG5yVpT/LKMv9mU+kTlHB+xf88oHtyGcBSN/5pSzaU+T8J/4AtH20o
         zzZg==
X-Forwarded-Encrypted: i=1; AJvYcCUm9jstNQeB+o+pYAKzUU9IoKpE1uqCBrIvt1/vQzDnUtWQX1fLveiKbrSWeBrtlq/QRtAGeT1vV1ZZ1Eg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lHrFmLSnDJS2acQhjwEpgqxHRdoPivITbpr8Agmwg5icxXf2
	UsD//sq3wNyMKx0/NpyYOYYJPwYPTM1yZe3rr5wUFeWN7+KYZn61pz8okKNy4ggwL0c=
X-Gm-Gg: ASbGnctpextc0/Vw7V9LkHIZK+Ss5xx5L8fNtz7tTAgxV8ft+h+9E+lokruT0qv08bk
	IIpecYgxtgALHZBiqH16INOdze3gDIlRqyZ426Qz9dQuuvuy6e3Th0nIEq47ZzJ3YmbQr3rsBKD
	zwqP8YArpJ6NMFv3BBQYdx5t4g40iMvKv7hg4tw3mEQeO39MpdzWQSYdZrzYS9GuZH63QRKAMs+
	wigN+lhGtr/qbvMEADzdDPVJ2V6QHeKhIv0KWutzVpDxvGrdSLWVQIdFY1J/Dn3QEt9gdhfnMnm
	t+0acCFjJRCMYIwc1xTIpHpMMd70Wl3X57faK+x2vH42cpiuphXXUbq2/FXlrWmXzIHtqVlI1oM
	=
X-Google-Smtp-Source: AGHT+IGJoH3CoR0C1wAJmPGCe9Q9cF6rrj3mMWyWKCCCXojMC3Bwc0iRoP+woifFDqkYzLWN5XaV7A==
X-Received: by 2002:a05:6000:2f88:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a572e6be35mr6708882f8f.36.1750067438307;
        Mon, 16 Jun 2025 02:50:38 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b5c372sm10342111f8f.89.2025.06.16.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:37 -0700 (PDT)
Date: Mon, 16 Jun 2025 11:50:36 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: syzbot <syzbot+b4529efee5bf3751bc06@syzkaller.appspotmail.com>
Cc: cgroups@vger.kernel.org, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Subject: Re: [syzbot] [cgroups?] possible deadlock in try_to_wake_up (8)
Message-ID: <yo75qoe44ltntzu6qcyscsj2nluae52mfr52gap2uypqtpn4qk@jvfbspevdavp>
References: <684d16c0.050a0220.be214.02ad.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qfzwo6z7cqxn7cu3"
Content-Disposition: inline
In-Reply-To: <684d16c0.050a0220.be214.02ad.GAE@google.com>


--qfzwo6z7cqxn7cu3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [syzbot] [cgroups?] possible deadlock in try_to_wake_up (8)
MIME-Version: 1.0

On Fri, Jun 13, 2025 at 11:29:20PM -0700, syzbot <syzbot+b4529efee5bf3751bc=
06@syzkaller.appspotmail.com> wrote:
> Hello,
>=20
> syzbot found the following issue on:
>=20
> HEAD commit:    39dfc971e42d arm64/ptrace: Fix stack-out-of-bounds read i=
n..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux=
=2Egit for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D12fcb10c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D941e423b930a3=
2dc
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Db4529efee5bf375=
1bc06
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e0775=
7-1~exp1~20250514183223.118), Debian LLD 20.1.6
> userspace arch: arm64

This looks very equal to
	Subject: [syzbot] [cgroups?] WARNING in NUM (2)
	Message-ID: <684f296b.a00a0220.279073.0033.GAE@google.com>

Michal

--qfzwo6z7cqxn7cu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaE/o6gAKCRB+PQLnlNv4
CKRzAQCXHzhTb/oX0XnF+BgBqEfxvr6jPevJgCIOeAn40LGmKAD9EPPkwHPuI01n
rcvuTpV4m/mLHSZYdfq0bMNHxOt6fgk=
=Z/80
-----END PGP SIGNATURE-----

--qfzwo6z7cqxn7cu3--
