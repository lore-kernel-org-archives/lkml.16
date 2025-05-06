Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E17263C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518317; cv=none; b=XSP3GCg1XxhA1iATqd9DzRnFr/7jdL/p0AALfUMp/O4HOUxj+Iqy4DYzrZp4X/pH/1d509YnLVF5Byl5cxIdcBfpflGrUvLseWDDwwQOTKGITHUnC750DBbOPObEaX4ZURXPIIzZS8zX8z+2ifElQ5b/dv4PCvdaPBkmCEJA8PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518317; c=relaxed/simple;
	bh=otMgDfAKMDhndfNFbnuhKeKRA6gX2e8cs9z4QIFvVnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwvfDHfCUctjJj+UEJzxp5ALwl9sBTDwYQCAE/FFeEaV7yvXfIGkL/FMtEXJp0m5CqRMtjvO+7rFco5wyEsi/7pI13HV6b5TQmFwsv3b71iKxYZphB+9SN5Mm6YKA9ykPwTIQo7cDw5vtovrioUhXex2/Kf/TWCcfq1LgW6ecNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jwP2gHZt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jwP2gHZt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac7bd86f637so1160278266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 00:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746518312; x=1747123112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otMgDfAKMDhndfNFbnuhKeKRA6gX2e8cs9z4QIFvVnY=;
        b=jwP2gHZt+kM1S841Jpm5l9wBKFuH7d2rkQvxdeBHgC+ZBqZlfmcgj3/oVBYvOA4xdG
         GZKyHqD2DmLw8TPhMXj1cM9tdn47WUibnFfTM0KsMWKA+jPLOWbE5miOmeTQtdU+81ZH
         zKrP7Y30trpxdwGUYOGkBZ2Cbg6MqXIoXuveJMMf/vT/NbR8E7Dvty+7uPf6AGTzfFvb
         fQY7kCmLwPIOY9J8es7dn3YDwjdP+Ou0mOwwvJCkWLzmVNzi7WQNjCCNJKxGnhWzeiPy
         ZtKhfbytfql+mSl3zkhW6e60d82TC74wb+e96/XLS1j5zVj1yg1QkhpCPm4cJgR7Y/UX
         gPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518312; x=1747123112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otMgDfAKMDhndfNFbnuhKeKRA6gX2e8cs9z4QIFvVnY=;
        b=uc805KcM/aFtGUWayFJ8a93EukmdU0zZ0CMn2nPw3bm0MuqiO11goF9qBXnRSrHvN6
         0Denw2Ua1Y0gdQzoALcD7pYetksRv7jFB5IVlSEEL6ExBi+QhmckiGHo+AwUBrO7Kfjn
         TgiZ1z88KSrXXYKBtj/B3nDDG8H/6rFItWLiHuriMJG+2s1vYftDN0UUHLGMBGbQpj6W
         SFHWbzT7RsTXHTvDycpB3wGydYvM/a5eigMmAVfwV6SYpQp3yDr1yESnc49kBcXjvfjc
         B3KpXiJ1HeoqMpisO5G2aNx8Pkb+SynxvRRH9Ec40DLNHkFUIwnsnuZxqUuq/Ei4uRV+
         U2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXO26QRW0CZZthq/0qtq5dW/Mp8Wxj375zPEAtVkyQfFo3WQ+EgLiObJL2lIix2VulJyj1gbaUMNjVliR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOQ0KE8P5wLiVaV9ybGiwxzzrsqEms6aweeDLX7i5Dq4sSk8Z
	CjXWl88i7OgTPni4vsQ1KW+H5UKuLunLE+RDWCHOb0ohAKCfpCw6lebcpDvi5aM=
X-Gm-Gg: ASbGncuEXwz+32xnetfz8j7sVI9crA/MqUkCdJdGbfr4BmAbAskU2Cu5UtZ4CcuPmXU
	Msl+U/dVbP4hnkmuUS513zRkJJaWWlikLUTuwFQ+PgyK5BDZpsqiCpesFklrUlBvvA73E2Ew4ey
	Rgqej2tIlrMdXuDLHccR9EhVUPn1UoBtT4zT+uUfECJ+lAIJcpST+LF5Gq1wAt3AzQuk5pjooTb
	+UXYRcpN+5vbs7xB8dVlRBHzfgFDsAYZSREZfYpUEUmzN2sI5WvgyIt+fmxR09IWf8JCL1fCDTt
	DwYQLRv45KNL3EzB7Yo+g2LekfGTXMZ2tNm0lwmjlsheMCEPsmkIUPA7
X-Google-Smtp-Source: AGHT+IFFYr58SDGefH2QTO/nsOoxaqVlyOnmQ7fiobmWHO9c2KZZLAxLqCaXDivMXlOZZJK7dWO9eg==
X-Received: by 2002:a17:907:6eac:b0:ac7:b213:b7e5 with SMTP id a640c23a62f3a-ad1d2ecb11emr219935566b.18.1746518311999;
        Tue, 06 May 2025 00:58:31 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad189508c2csm652230866b.130.2025.05.06.00.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 00:58:31 -0700 (PDT)
Date: Tue, 6 May 2025 09:58:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
Message-ID: <yjymcsje4z5c2htgefya2cocyx5guvepng756vdigjmvxvk6dv@wqyeh33mfty4>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
 <20250428-enable-rtc-v4-1-2b2f7e3f9349@baylibre.com>
 <5gpvxwgqfgvb6eu6nwso3xk4xpdqayz7wo6y2mvweci2veetqw@wsurri5h7xvu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7bpbuhfrvksdohsk"
Content-Disposition: inline
In-Reply-To: <5gpvxwgqfgvb6eu6nwso3xk4xpdqayz7wo6y2mvweci2veetqw@wsurri5h7xvu>


--7bpbuhfrvksdohsk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/5] rtc: Make rtc_time64_to_tm() support dates before
 1970
MIME-Version: 1.0

Hello Alexandre,

On Mon, Apr 28, 2025 at 06:59:33PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 28, 2025 at 12:06:47PM +0200, Alexandre Mergnat wrote:
> > Conversion of dates before 1970 is still relevant today because these
> > dates are reused on some hardwares to store dates bigger than the
> > maximal date that is representable in the device's native format.
> > This prominently and very soon affects the hardware covered by the
> > rtc-mt6397 driver that can only natively store dates in the interval
> > 1900-01-01 up to 2027-12-31. So to store the date 2028-01-01 00:00:00
> > to such a device, rtc_time64_to_tm() must do the right thing for
> > time=3D-2208988800.
> >=20
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>=20
> Given this problem starts to bite in 2028 I'd like to see this (and the
> next) patch backported to stable. If you want a Fixes: line, maybe
> 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for
> start-year") is sensible here as this is the commit that introduced the
> requirement to handle negative timestamps. (The drivers that made use
> of the offset feature already before that commit all had
> .range_min >=3D 0, and so are not affected by this problem.)

Given that we're already at v6.15-rc5 I wonder if there is a chance to
get these changes reviewed and applied before v6.15. Would a pull
request help you? If yes, should it only contain the fixes, or also the
updated tests?

Best regards
Uwe

--7bpbuhfrvksdohsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgZwSEACgkQj4D7WH0S
/k4w7QgAlqa6THLQEj9lQWvkqFBMpHSH6z56IM+J0ukUkyU+RAP4TjCKb8qAKhbo
ZHUf7kNi7bdrWNX1DGEfG7T0UY/GdSSihOEr9A912AMiVzOTuzNn+pvnh0Dr1ZCO
+mnfG3ZS1dvLHSe7JbnvFR+/EV8c1HyZbS/caYrJao0iq0Lq+dnvskA/r5kNh5ys
MElR5BF0lAiJVCxxBiktuUGdAAVJh/969lAhtHKynT0ZkanTurm/lWo9QoB8wDKc
Hi7PtSbxGGv5bw/6PxzVUBJaXOeHnnu5yHuLGBKTFbu1srb6y+IylKzVCCRf8Q3U
0pviub4KQf2lnrf7d8j8bpqautf24A==
=jZgu
-----END PGP SIGNATURE-----

--7bpbuhfrvksdohsk--
