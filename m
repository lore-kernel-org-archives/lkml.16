Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7411F09B3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324343; cv=none; b=gpxoVxy6vMBE286v/3JVoRN0ZMYc/ouhXFb0zg5zCP51AyR9lLdhHbyLQ7y0KkJdo0+aXfHFJoNbXetDLXzahcQC64y4t11Bapf8JObYzlSfXN7yuGRiMQ1qHGGbeDnwJZszRUHAbW06MAJa/vZ2nkoMAtOMhzBY/KbheeqGa/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324343; c=relaxed/simple;
	bh=FEb1vp9zsmFr2JcPIb0VWNcIkxax01MRvDIaLi1NWfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wjr/AKIcbhg0x7J6cn5MzITCLILpkavkF5BIzk9IlaVp1AhaCyCECgYYaJ1UK7xwfsR9XBS8PYz2EVTm9tF22irSZRggZhZthd5lxKMojsYWJyUI2vY9+3JYs5d6DGlrIFr5DzbyBaFHLnCkAcioLhXYT3b3YPzzFbbygexHo5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f6RPD7rZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f6RPD7rZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso779380066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745324339; x=1745929139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FEb1vp9zsmFr2JcPIb0VWNcIkxax01MRvDIaLi1NWfs=;
        b=f6RPD7rZsrqWa0d3m5zGKyFjrT/Qv3Hx2VvG/aeUP/JRGP19hY2e53GaEjRSHPfJm5
         e4E9F4Nj7ZMGqtF0dbA/iR2TVu5SNOL73HBv4yu/2WGc6ein9jUV/R26oKNMfMfKx+5a
         OtuWdBQo2zysnD6BsfzVxvV2+rhDCdYDnAfolWhVorDt9Nq9BgQspro1Kw0zCTpotzbn
         5lj05rxGkFcKZ9TO7rzDBgVlwOE0lg4cVyn+TIkF7jYQQMoMAu44iNsj7E9kVR44MvzH
         LYh3QYCGG+7+A6AXX1/aTXHxVnrlVC5mfQxYQxQWH8vId0BZxkUZ58sbs31xcUA8c9A9
         ssHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745324339; x=1745929139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEb1vp9zsmFr2JcPIb0VWNcIkxax01MRvDIaLi1NWfs=;
        b=ot/d3w7tqHvL4w+8kK+0waIUK32+UEQHEiZm9tcSlPyZ7aVeITNnqemJ7wzYSe0obB
         x4bTw2X+agpC82Eb/k4T8GQvxL2dVr+OV/3+9AD8qHbPMmhEGgVT2zyEsXbr/g8On+Gy
         cf99Xbx9O6JcW3HJdGmhVqrskP2f1drxyKEqF7UpCbK8oPagFysHiubw330swm8Aeg4K
         qL5mYGWj95+kJwHm0IRZf9NipKu+WvH6PCyaPV6SAvEuakKgW050fR/9RSrtEqJXe42R
         lVeUZMfK+u6czmfQu3j7rua9UIixYp8Ko/0Zr5XS+Y+GhBcjkMEiCLTLYaKhBajXcHMP
         VrUw==
X-Forwarded-Encrypted: i=1; AJvYcCV+TkLmqKb2i0BTBsNMWLyiGxwddG3R/ApYQazc1Wi3HGw/ZAYQIjBKHlkOCILzrneERy5jwolvtiqeqmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10VoHfOw0vS7gV8iHv99/viMwlr5o/zX9bZL3r4z8JM5Sff48
	fGcalzGSyYDce+hYZ1zzNULCEH2Gr7aW2E9k8FTzzAZXK+74u0TLEX08+MmiSEI=
X-Gm-Gg: ASbGncsOIzjqoIGnOuzGA/xsMDq9HKNxymJDbNP9ItKGpiyJomUP0faiP00E8fFCuNh
	su3GTVn1H+uw3wAM4FsAVEeCMzCRMyOkxABSTF/ys3GybEDO9tCuF8sigj6D/XtUsPwE6URLI2K
	GRNcmztrVGCeA8fPVdjyK+JwB8emENlCVnnA1D2awfQSalFpkrPPeoPyqf5bvcehtoWTyp+m1+h
	U+iUBgXVGbRHdNIaME53IRgWvOiLRtLmPKZsRZxrtOy2c48pPSXRoH8KgMbgVAV+N5SWBPL1+bG
	FYvjfSDWVu4K7Lg2E284vaxKlL2QAk5HmvNZSmWIcqA=
X-Google-Smtp-Source: AGHT+IEvO4I0PXr3VK52/nbiHGb/HzcVEaKVg4zzxE5USQ7ElhY0GjljRx4O+2j+s6yFoHcQWu17EA==
X-Received: by 2002:a17:907:9496:b0:ac3:446d:142 with SMTP id a640c23a62f3a-acb74ad9369mr1114924566b.2.1745324339474;
        Tue, 22 Apr 2025 05:18:59 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefc6f3sm655834266b.106.2025.04.22.05.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 05:18:58 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:18:40 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: tj@kernel.org, cgroups@vger.kernel.org, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, xnxc22xnxc22@qq.com
Subject: Re: KASAN: slab-use-after-free Read in cgroup_rstat_flush
Message-ID: <2eatfmps723vwbvqgqppswny73axxgbmmkaseqjkg2hxojpwvr@3fn36fsfed6x>
References: <Z_1JBt3RMATxnDgL@slm.duckdns.org>
 <20250419153843.5035-1-superman.xpt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hiej3wsm4kzjo3ca"
Content-Disposition: inline
In-Reply-To: <20250419153843.5035-1-superman.xpt@gmail.com>


--hiej3wsm4kzjo3ca
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: KASAN: slab-use-after-free Read in cgroup_rstat_flush
MIME-Version: 1.0

On Sat, Apr 19, 2025 at 08:38:43AM -0700, Penglei Jiang <superman.xpt@gmail=
=2Ecom> wrote:
> On Mon, 14 Apr 2025 07:42:30 -1000, tj <tj@kernel.org> wrote:
>=20
> > Maybe another casualty of the bug fixed by a22b3d54de94 ("cgroup/cpuset=
: Fix
> > race between newly created partition and dying one")?
>=20
> This issue was maybe caused by commit 093c8812de2d3, and was later fixed
> by commit 7d6c63c319142.

Ah, I overlooked that the original report is not for v6.14 but
f6e0150b2003 actually (correct?), so this is sensible in that context.

Does it mean you cannot attain the KASAN report post 7d6c63c319142?

Thanks,
Michal

--hiej3wsm4kzjo3ca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaAeJHgAKCRAt3Wney77B
SVALAQCxpvY+YXDCaGceP86Ps37TAi1fztt+MjmyKf9IWzf4VQD+LGcIjiluUvvf
3CDAaVURoOL8D/lTu6M3RIITuf41bQU=
=V4iz
-----END PGP SIGNATURE-----

--hiej3wsm4kzjo3ca--
