Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5014E2116E9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151305; cv=none; b=aCtRnmD3nxU1Xl3LOHeBjA2WJgGN2uicevg9NP+byPdEee9psS4Wr86F/P3efgKDaeXe/s1EM6HPtYDXB2dqQAhTRFrslolXlkHvtvjkhGm4Ac4KrY2GGcVMyB4dfebfC+9xqqM+URwhZbBDOi1MrbYXF/AtypYM/tOaCQOiX/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151305; c=relaxed/simple;
	bh=z0fKOYwV+dsFs21nS2jxYOO5t4aC6ljU0NF3BjIkz5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llBtBM/NMsr6KfTGfPLK+hPgBXFfjwBrAoIDVSc7k4KBOX5lCAZHO5kzVeotAwfAntCKNOQGPaYH1P2sTwghq8uU3eV6zN12Ewkh+spkQSZyzukUHRzL14wnwJWL3IFSbio/Bm/2o30DSOx53bCc+pPkUTFjJu3TOUOyt0g8Zgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fby11LH4; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fby11LH4"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a53359dea5so3729961f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750151302; x=1750756102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKAD3svXOw7buq7HtIEdYKllqfFeijr7NxfdlNG4wcY=;
        b=fby11LH4Wt3FtCM6ebjWHIb+SlIvq+3hOl1Vyr23S8WpyRU9CU7V96JQujTyJsIpVo
         jfxLDPyovDLDvY+4LqXuNVtKDlEDME2dzx9TPdb1jwrvv7ACVCNm0Qy0HDaLHusdncdV
         eT9dZvtN7Fe4DQTVXbr78dGf1Q9Y8ouop9sOz+rLPaBID/hedM5EZT6oKwwkwP8ccqoO
         FiR51C7qvCn+FXbDwJi+rawRsEFl+H2ZzLjvBn2Ey00SFept7ACNSwlhOtspPwoytK8l
         L3A8b7fBAU8MmcsjAyvuKvxpSfwSQpHJe78PUj50WO6w3qk8K/kdRUP7XrQI0Qh+6sOI
         lG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151302; x=1750756102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKAD3svXOw7buq7HtIEdYKllqfFeijr7NxfdlNG4wcY=;
        b=c75rDiAOfiHiJf4lnL3lICqFLtDPXkVxcinB9OES7G65nW4p0GmpKLTHv8+I+Bkcmp
         vj0cB0WCeLNScJstHXs8K9jR5geNo5uYgp1wwM0uMs16s+cyq0W/+3OTNt/eDbJqlz8c
         xEJmqrkDaIHNhSe7eL25T8A+4DaqrhSPVU1isEGfi2qtGboQvkSFevkyNokEFLan7beL
         FDmXPaKsyrZhgZWcuUJ8WXY0puv5z4DtfsZ+SpBRJK8+42EipIvMOUNSR1cRT1rpbuOF
         hGhU5q0TcO3hFSbu5BBf7jmWKKNnKFPiNOoetYHzlJ+g2/ajq8m6KyRs3GaAYHuGcnNT
         PvMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgk7AW4Eou33HkZj2/2eKlpJyes8gcdOrofwS1GiYUPhrpN0UzClMFcus4aiR5xXBNDkWThl4poRGuNqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIgsYKEWB/CvXNBTTxYN8f/wD1TkHyXZdfM5wLqhfb08shFRc6
	CJtqHV+sU7+X0GG99MbBE3PCfRtGMWUp9D36msIVDO8t8zaInyWiJ/GrtDtT3dppcMU=
X-Gm-Gg: ASbGncsVxtW+E+8waZBokmRE/dAdagLfsXOeTIz22iIvLd2i4lSAdrrs5i9QlYI45/i
	6z5Wf71MGVLviT4g+oF/J/2wKMpMs+MSc8Qz8KyEOormhcM+beXLifUQyMCH4VbUW5Uu0JEfivb
	dehZhU8FWYHTWKxlsNZuJZdOgQ6KSmBmIyhS9q/LUc2w4RCIX+cmUg0TcyeqJy2JSRK8heMjMCN
	q2d7SH/9Fzhrh265ySWksrenlAiHvYrWIGGvJX0uAQ1W8sK9mhd1o86v1VsNhZ/54ImNLXmvJqq
	sofK6DbY0Qo1INU6Dpwie2ASCO4tMZD3waoEzNGvfiquVtWfS/xwi5WAWiVj8WtU
X-Google-Smtp-Source: AGHT+IHZD55Cs3Zu1HygCPmxe5Uy/nwrwnFD2un/64EwIJaV4i4CI3mWQiyOSmwe7CiHE9VlU6rzCQ==
X-Received: by 2002:a05:6000:65c:b0:3a5:8a68:b81b with SMTP id ffacd0b85a97d-3a58a68bcc4mr888857f8f.44.1750151301539;
        Tue, 17 Jun 2025 02:08:21 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e16a097sm174029075e9.33.2025.06.17.02.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:08:21 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:08:19 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jemmy Wong <jemmywong512@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] cgroup: Add lock guard support
Message-ID: <2dd7rwkxuirjqpxzdvplt26vgfydomu56j3dkmr37765zk67pd@aou7jw4d6wtq>
References: <20250606161841.44354-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="toh6m6x3hhh3r2az"
Content-Disposition: inline
In-Reply-To: <20250606161841.44354-1-jemmywong512@gmail.com>


--toh6m6x3hhh3r2az
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/3] cgroup: Add lock guard support
MIME-Version: 1.0

Hello.

I understand why this might have been controversial but I'm surprised it
remains so when the lock guards are already used in the kernel code.
Documentation/process/coding-style.rst isn't partisan in either way.

Johannes:
> heebeejeebees - it's asymmetric and critical sections don't stand out
> visually at all.
- I'd say that's the point of it for functions that are made to
  manipulate data structures under the lock. Not to spoil the code.
- Yes, it's a different coding style that one has to get used to.

> extra indentation
- deeper indentation =3D=3D deeper locking, wary of that
- although I admit, in some cases of the reworked code, it's overly deep

Further reasoning is laid out in include/linux/cleanup.h. I noticed
there exists no_free_ptr() macro and that suggests an idea for analogous
no_exit_class() (or unguard()) macro (essential an unlock + signal for
compiler to not call cleanup function after this BB).

Tejun:
> There are no practical benefits to converting the code base at this point.

I'd expect future backports (into such code) to be more robust wrt
pairing errors.
At the same time this is also my biggest concern about this change, the
wide-spread diff would make current backporting more difficult.  (But
I'd counter argue that one should think forward here.)


Further benefits I see:
- it is fewer lines (code is to the point),
- reliable cleanup paths,
- it is modern and evolution step forward (given such constructs
  eventually emerge in various languages).


On Sat, Jun 07, 2025 at 12:18:38AM +0800, Jemmy Wong <jemmywong512@gmail.co=
m> wrote:
> v1 changes:
> - remove guard support for BPF
> - split patch into parts
>=20
> v0 link:
> https://lore.kernel.org/all/20250605211053.19200-1-jemmywong512@gmail.com/
>=20
> Jemmy Wong (3):
>   cgroup: add lock guard support for cgroup_muetx
>   cgroup: add lock guard support for css_set_lock and rcu
>   cgroup: add lock guard support for others

As for the series in general
- I'm still in favor of pursuing it (with remarks to individual
  patches),
- it's a good opportunity to also to append sparse __acquires/__releases
  cleanup to it (see also [1]).

Regards,
Michal

[1] https://lore.kernel.org/r/Z_6z2-qqLI7dbl8h@slm.duckdns.org


--toh6m6x3hhh3r2az
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFEwewAKCRB+PQLnlNv4
CK2vAQD5wq0LatsmiHUSbsmOJCpcGVFHuDfH/0uJGeQSmsKWFAD/bb7kMZdxWv52
HASiX8FCeJv9AO+0Oc7OQOOKl9+Rlgw=
=luDQ
-----END PGP SIGNATURE-----

--toh6m6x3hhh3r2az--
