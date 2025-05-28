Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA461279912
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428391; cv=none; b=jP+QgSOx6w5q90FjyT0+z2ycx5J/dYWv3ytRL5r9e41J2qN51wmZJHK8V3A1EiPVJAP2FbF2oDbLUTALOWQsf5cLuY2peLX7tY+U1Vnrer7UhlHYJe9GrI2yojqiGnSR0Uv3ILpcrLzTVmueRe9VfooZxAhQ1dyzWGIyKWT93bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428391; c=relaxed/simple;
	bh=k3gpEJcg0kYry2W0tqCCHTbk//8aSpTV6Apt8u04Q+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuQ2YxkGEtC5emnT+xhj3e1MFIO0mI8x+/BBrPagwB1BqDtwHXj9skgKVhBDVHeS4iptg6C718IaK3r+NwkaD5Lnnot2O4rm0q2mxw3D/6Gt8kaTuDo4I2OKdLdLOfDs4nNytTNEu1UIyxKDhWCbGFpSJ2KkkkVXUJJHkjDmW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wL4Vlu2J; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wL4Vlu2J"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a366843fa6so2720735f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748428387; x=1749033187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3gpEJcg0kYry2W0tqCCHTbk//8aSpTV6Apt8u04Q+M=;
        b=wL4Vlu2JVrupEUnF5guft90dYBsfUNuccqT//3q5q1Lpkqkk0k3mBdeR8JyapwOg9R
         weNxwll1844iXzXeJgo9stX5vsfCG8XllJ6AQk1AInGo6vygHU7svh8vcVSX2CF3hoqz
         yEAm2QCxbpNXNXkcVATz+IYP7/LgpaarKTnQ40f44TOYnJNj24Ba34ugjedP2R8yulpn
         vFukBoRBJ8fIQgTu78AogYtpqsa/Rxnr+Vjb5SSe5KgrWWwZNfGG7QvNAQaGHjd5WvIs
         +8oFxTD6dt6O2J/IMaDlJUc63A6OeKjhZe3Ya3CZabRzR90Dc3tpGx3nYADFMTovW2oC
         qxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428387; x=1749033187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3gpEJcg0kYry2W0tqCCHTbk//8aSpTV6Apt8u04Q+M=;
        b=JjDCRAyP0iDzhNyfvu6kx0lWji0N5QTrQ/Aij1Birl/7MB3YLZJgm5uA64xDhebOh6
         AUNIOBfZWBFB8nnznoj/pFkzCU6BrA90GHcUjKTCHIzgo3FbUlGL0/lAfVvK52JzqaOW
         T6pSzDCaZvZB0XC7jDD7EWLtwYlPeQG9N6wOircj0OV7wJ6DIi9x60S6nK5/1HoEyaAp
         3/hiZXSzeJ4XJca/Yv0IBQ4YPLU9N/4ncefDa5+36L9KdSgRRzSFQHXtcXZfW8ZCcegd
         1f2o62yD9+vDdo1zssEP+ilPq52cy/oA6Th2sKUHK0qV0WHTfvFhXcRkrmYpGjep7pZz
         BkLg==
X-Forwarded-Encrypted: i=1; AJvYcCVq0K3wurEYxQlN3RfQ9wyRRvrTMj8KEbZJ0SPAdMCTp90hezOcKulFwue5TR6yi3UprISCfvhZLnqHgEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CcXyhEeySBfiqfxbBfK05z2V9iHHCoqakKGt5ADPl0G91BC3
	JSLYSvNCQfaZEOSWIKWlaOpRpQcd47JPAcuB7jh+OPO+Ov5LELqI8Y8PJZ3N4qq3ri8=
X-Gm-Gg: ASbGncsImDCpRabEhXxwnHDfOgJFpPCHyqsr8TUgTTaZ4sZLPZqmRaBHkH11A3/v1cD
	yXcCDDQssNgFsPkb1tna4Dfg91lYleca7jc1gKIu01DxhK1F4XHTrBaS6saoUMbo8dJYfAXQ0r6
	i236VSJvrnN79z5/Qd6U961q/KGSBVCtDKhvXXj52I2Xeo6Q3vpc/brVYtSR6djDPELnJ9L4eP+
	BrvbQUOgbfL+BVDWbt9XWtFD02ZPs7yBiXXLkovr42B7lvDHkgSuSDkXnMrd59NyIhNTeGyQjMv
	TdxqQ2r9bJiYwEuihEsql/BOL2K5JCDeWawVtSugVN7kR5yC6FDOuExWVlniKp+hpH4LuO/Ngmr
	IZAxGea9KjOcb+9FzTA==
X-Google-Smtp-Source: AGHT+IFKnjxzu4eBQmsvCPg1xaKU/IIhLdWicIu7kaut12YixanQTz8B9WBJEx1lmJ7Uy4Pqov78Rg==
X-Received: by 2002:a05:6000:430b:b0:3a4:ebf6:49cc with SMTP id ffacd0b85a97d-3a4ebf64b1emr1076486f8f.52.1748428387150;
        Wed, 28 May 2025 03:33:07 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450064a1bdbsm17144885e9.14.2025.05.28.03.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:33:06 -0700 (PDT)
Date: Wed, 28 May 2025 12:33:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
Message-ID: <oedecrcylyiorqnbymuk65cjgqbvh6gr2wox753ff7hj3qbaw3@blb3sgh7qia6>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
 <20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com>
 <5gpvxwgqfgvb6eu6nwso3xk4xpdqayz7wo6y2mvweci2veetqw@wsurri5h7xvu>
 <yjymcsje4z5c2htgefya2cocyx5guvepng756vdigjmvxvk6dv@wqyeh33mfty4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ru76mgvkjhofjrqh"
Content-Disposition: inline
In-Reply-To: <yjymcsje4z5c2htgefya2cocyx5guvepng756vdigjmvxvk6dv@wqyeh33mfty4>


--ru76mgvkjhofjrqh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
MIME-Version: 1.0

Hello Alexandre,

On Tue, May 06, 2025 at 09:58:32AM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 28, 2025 at 06:59:33PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Apr 28, 2025 at 12:06:47PM +0200, Alexandre Mergnat wrote:
> > > Conversion of dates before 1970 is still relevant today because these
> > > dates are reused on some hardwares to store dates bigger than the
> > > maximal date that is representable in the device's native format.
> > > This prominently and very soon affects the hardware covered by the
> > > rtc-mt6397 driver that can only natively store dates in the interval
> > > 1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
> > > to such a device, rtc_time64_to_tm() must do the right thing for
> > > time=3D-2208988800.
> > >=20
> > > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >=20
> > Given this problem starts to bite in 2028 I'd like to see this (and the
> > next) patch backported to stable. If you want a Fixes: line, maybe
> > 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for
> > start-year") is sensible here as this is the commit that introduced the
> > requirement to handle negative timestamps. (The drivers that made use
> > of the offset feature already before that commit all had
> > .range_min >=3D 0, and so are not affected by this problem.)
>=20
> Given that we're already at v6.15-rc5 I wonder if there is a chance to
> get these changes reviewed and applied before v6.15. Would a pull
> request help you? If yes, should it only contain the fixes, or also the
> updated tests?

We missed to get the patches in for v6.15 :-\

I see you recently applied some patches in your rtc-next branch, but
this series isn't included. That makes me wonder if you still have it on
your radar.

My offer to provide you a pull request still stands, just tell me if I
should include the tests if you want me to provide such a PR.

Best regards
Uwe

--ru76mgvkjhofjrqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg25l4ACgkQj4D7WH0S
/k65MQf/WSzUcpB1XhqT0a0RlN0FfyIlADZVVqI+WuuiDznaDCOfGuaq7w5tljRN
LfW6en3fTwRpLyGM7G7aAMhElqIoSw/wL8OkS8IW6B28+ASu7FDxeuKcTBj44P4S
Nxd4lPW1r06ce5L7F7SUTdGOPRNORkbx0/XXRM5UKuyMV9W9ycNHYS/gp3zKeJey
NXQiIO+LPxRecRYjY6aDvaCQPLDSkEh8NrGMamG6Za9EOUN5vWnQ/1KuZ5jy3kcB
yDC+VnQpQj2yx3286OrbULJbO5fShzCowDj8eXQXkzyF0tFNjzhRBr8MGNZdoSTz
QxD0B1uTCIfcN0deT/xqWcfKnQ72Mw==
=M+MM
-----END PGP SIGNATURE-----

--ru76mgvkjhofjrqh--
