Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBF51FDA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067424; cv=none; b=UPdkKCeQT56nHz1WOr4T1IumhDZIiW6onYCLldrmegadY4dngxQ6bgKCPyO7VCI62xa4TH5fhT8goN973E8dfndQGCXvsMoYIxESlYNTEcjsN0LJHM7Mk6oteQ8EeSzXWi1IHHfL7i5VRWNXV6wl8hdjXcCzwpEap4foeg6EUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067424; c=relaxed/simple;
	bh=/8kgAEgozy45w/iUV6if2qg8E3JCiqcMplEm7kzRpKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMrosFEaEC5DMJpT223yK2UPVFxTZ92sMIgDsE/YtoDrTtw7yX7h0hw9Nz5YrOarRdshOCfJQdBrJ4ZfvND12VgpyK/u3j0Lr1O0nifK+JFZGbMFEygJNsT7Wga19NbD+glRwM5wSixHDXzs6StRTy0G/kKVecA63rHjTNQb46o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VT/0QbrY; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VT/0QbrY"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-442fda876a6so38346115e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750067421; x=1750672221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ajWSqawneitf2a63O3Vr9RZuagx7iIr5XGjwVXy7Bw=;
        b=VT/0QbrYqE4tUm4DFo+qhA3B7jMDvpb1UsehdOSttAqfy/SmGL0e3F4MGOvOIj6bXy
         vmbPFfr8HkD15ZzI7RPMnEvHZ/+Yv8DyWUN0tiI7YFN39so/gBVxwKfrr5JzL+B4K7X4
         EHq1gF8pqZCPBX5TT+tfbMsDHCA4PQ4pDTm2cj2/17nk6/CnhNQr/Bo6MLjlOEjkToqj
         J5GGj/PfI3d3j09o3hdE6CVBzNUsP35RVF9cHD9bPqyiINGHkwynUx3JizG8IqNFGpAL
         fDtwhrYk1fLaezFngAjNQwWgXLcAmBL1hHf6jXj12wGvtbBj/YGnhL4VbQLM89g5BJkg
         K4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067421; x=1750672221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ajWSqawneitf2a63O3Vr9RZuagx7iIr5XGjwVXy7Bw=;
        b=jRjKJ64DKoEMzIo5wtaym39PPNL9EHEgqeLvP/xbHPBMj9ktdGWcID74fVrpM7Opms
         XoIs8RySGK3hlle4Jk5P4Sqq6NTpBMbOc61wyQJZHbsr4Ak8vj2b279BE9C4IG91Quco
         dQWG12dI4k5w5n93qmLDo2JKOdDjRcVAYaGv9vEeJ/IKn+F5Aj6meQ3gLVXW570bVZxT
         16O7FxF55bvMu2SVrHN0lRDMRMlgBCutdKbvSkofhW8TG1rhAIerz/Hg/BH/3OwuBGLN
         YzqXVQj8sav//9cuVLTHAcdBe7iIOnxakS6peDbg8MWctjCVHXtc+qScXeTMoQDgwQNC
         qwSg==
X-Forwarded-Encrypted: i=1; AJvYcCVf4Fs/sXK5TQJXfFSoD3a94iGQCAEnEamdhqelGEeRhQ1oDLF9ql3xbdtDSYWez8VfUpyk8ACS7KexwNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNsBbmBZPmggMAbmCu09NmoBWM4H1bHg5fDY6zSUEmIE+dsRcH
	6GesL5HNZ+t/V+w07/tB6B3tskuZkALZFpQDnAe56MWPH6g4S7mWuTu2m2mxhyiJWY0=
X-Gm-Gg: ASbGncvY9H1SaWwCvIubJSKWl5qha2YzOmfpu9WYBgxE2oi6nB6ODlYWyIpkAA+D0wb
	2KrP6W5sa/B3dcVfmB/wCzTiScqRmSspTOFOTEMzUknWBpVgtYFS2flPgxjeqeHnC85exzSGnhA
	KDePv7cI+P1HC4Lwp7dKHsLZkSE+x8PUSUnlq570ptkPZvVRwQJXpr64nnLz8fXzOEBkDjH2L/G
	RGaNGuK6VW8yjb5MukOAXDG6VV4alL3eC1Zo4wG5Ayw6n9lxZOgcz35ltws4zoQm/VORBWqW6fD
	D64x4zo7266ykcE3AzUUi8jC9cOjO1uijSl88s82N+w5gq2s45m3QBfNaTeCDq7u
X-Google-Smtp-Source: AGHT+IEk5/+TEpUz7jLMLE6hLBpf7r9+GYt/UetGf4aLcx/IH7vYvqvBD6BR10JeNscBjMv7QX9m0A==
X-Received: by 2002:a05:600c:6207:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-4533ca76ff8mr89242775e9.15.1750067420788;
        Mon, 16 Jun 2025 02:50:20 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2384cesm137359895e9.16.2025.06.16.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:50:20 -0700 (PDT)
Date: Mon, 16 Jun 2025 11:50:18 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: syzbot <syzbot+ee0ddd3c79cac08cd4f6@syzkaller.appspotmail.com>
Cc: cgroups@vger.kernel.org, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Subject: Re: [syzbot] [cgroups?] WARNING in NUM (2)
Message-ID: <qcwg7zdvsyvcxnkyn4wdn7xbzi3urqzy25m4qkb2t6zeb6fjm4@n3up3tlxjurw>
References: <684f296b.a00a0220.279073.0033.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="puayfpkzkxs45w6x"
Content-Disposition: inline
In-Reply-To: <684f296b.a00a0220.279073.0033.GAE@google.com>


--puayfpkzkxs45w6x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [syzbot] [cgroups?] WARNING in NUM (2)
MIME-Version: 1.0

On Sun, Jun 15, 2025 at 01:13:31PM -0700, syzbot <syzbot+ee0ddd3c79cac08cd4=
f6@syzkaller.appspotmail.com> wrote:
> Hello,
>=20
> syzbot found the following issue on:
>=20
> HEAD commit:    19272b37aa4f Linux 6.16-rc1
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux=
=2Egit for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1005b682580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8409c4d4e51ac=
27

Is this report a new lockdep occurence or has CONFIG_DEBUG_OBJECTS=3Dy
changed recently here?

Thanks,
Michal

--puayfpkzkxs45w6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaE/o2AAKCRB+PQLnlNv4
CMA8AQCCcXjNhexkroeo2pYBPQr38AMp0EMNGh/nNH3Ct0ifvwD/aZp2GgBP0N+f
DMaWMmj6wmXshLtEBD8OaummB6o+3AI=
=EvjT
-----END PGP SIGNATURE-----

--puayfpkzkxs45w6x--
