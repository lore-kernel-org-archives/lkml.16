Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF462AD0F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857580; cv=none; b=qcj/zV6skBIBCZpjQjtSeujeTOKYRQmc+up5h8obFCcehIl31u0AuCz6IeboNrzg2JnDyEL+ehMF2TYkG+31oQmeiiVYLWq0rmUVIyrzKOv4Hn9qDFiQ3JJT0DYuAwgegZpA9x2gXgt6GSirsvH7y7sdgueYTDAugkNDdd4jd+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857580; c=relaxed/simple;
	bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRn14gQTVvQ1XJMsaAH8wVNV+nJJMbsXJ40PYoMu3VvKO66DjKQybrJTl7w9F/qyh9BA7u+UdMvvFrKmW3hnhgeT9Pl8pMsH+RA7Vg7Jg60+XeWGDCJnab4bonO/XmEdgZauZMD6zP8qPG7XDSmfJGdlrp7UmE35uhjrMOPpXP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gLaTRk9R; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gLaTRk9R"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso31768195e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745857575; x=1746462375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
        b=gLaTRk9RmlZXA87Y/qHxLw+5F6hE7EUQCv5GaE+cnzipekA9o6uZQN3Nv+5T4q+tbV
         Gpf3esXLZjRop29hgHBOaBhu8Gd2V26VRiejX7R5tSF7sesMzlLnDW7kjp8G1RJ/r30A
         KDhrP7PHBkX/AK+5w8tY91k/NzyPlZDvmNWx/fhhVbt72yNC2AW9jQW2GkpzE9NmIPkD
         BcYdMfrmCmJS34bGsTpwab8utWuoVP7P1lj92zTnbhvaMANx88dXjBEtawDuW2Y3QVeh
         2Qp9eNbMmR+CbDti+ytp3uYbF5YTr9fW4nhi65GoKA48VkKNxx5dP0q2WcoSEVqWRqKr
         3K8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857575; x=1746462375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XV4yjXWpsfgvi2gIF5WipGrZ8nMjBf4R4GhF3QGKVo4=;
        b=GOlqhWeGOU+0BIkl0PLmW8d1qox5XxGyBlFMbY99ya6xRqBNgrGARZddCdKD5wnQ6h
         s1NibT9dv0TlVIZoi/FbJuPOl8+pN75mPTc/IfOJWTcfpvyuCJIGaAJU+BKCZbTnbgI/
         wvI/uJUdtufc2t47ruMECZEQh0jEvXCzztqSH6J3aBj+jhjnFTiKV4oYXEqqQ/k1O+kY
         fcvL+18VrGRsrb/UyaYUklpFTgPMZEMpZMiAIc5UgYreV3pdTf6V1nh7k7JiPwK27KKt
         OopyT432q8ec3imKVyIdFeXHGZsxplIHJc5lAli2/2Bie9DN1StWiyyeBoqM5XTnvMkp
         gFjw==
X-Forwarded-Encrypted: i=1; AJvYcCV4qi/XE4HyYZTp0DYCzdICxlyyiFCRc7pZmyfBmjd43kARWSbAgDt/ITbppUvDbv8Mft5wawMXqqVKV4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YybojljFNqoWiTXssh+Hn8Z6DxCGZkcdJB5FgzSQr3x6dOgQ1MR
	6sApWvjBPYdwXofz4UQXZeto5qDkhHjmn9aPbrZibViphxExbEa4rTiByjTRtpY=
X-Gm-Gg: ASbGncveoA9IhKPlL8JVP71KF7699FlCzMDVH3KY+KPr4cvedRTxUhFvBqSv45chdGl
	TCtYN6dPE4BZT8NFZ38bSdlFVhk+5IHEmkU2B6fLS+1ihBRKpUzG/MI+MWymepbWobXySuaZP7h
	651VC2nwM3ppLDf3H7qrfsWDlTk7aScBeccsXnQWdFt9Wc1GSY6Q7IkuwiK8wSnHhJkrUXQpY2T
	mt1XMp8AZyQFIRk5WosrCnLdVG9JOxg2W3FABZ+GXA01NY2ZU5wUYDZ5FLqWqeYole5ELjZkxg6
	+3ExhekgiDPdB0HZbWL1Yd7R8bJi2BzpDW1Fg3rdwsjX4u+oWF3c1/CkCjpKHkVWgITO6GnoFc/
	ZS8k/lzk=
X-Google-Smtp-Source: AGHT+IEP8H3aiAFda5s5dKpOrFeQRMJEIdcZabiUZJB78eZVPzFrS+hWt+HhXg2/aWcVvb4/lTgz0g==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr119997455e9.6.1745857574733;
        Mon, 28 Apr 2025 09:26:14 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-440a5310a8fsm131672255e9.22.2025.04.28.09.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:26:14 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:26:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
Message-ID: <darxi3ojg6c6uhzyzb3224sb4lmpqcwx72pvoaam5qn5b6v5du@36zqss6i46ig>
References: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xvyefmwg7jcr7kfx"
Content-Disposition: inline
In-Reply-To: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>


--xvyefmwg7jcr7kfx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] rtc: mt6359: Add mt6357 support
MIME-Version: 1.0

On Mon, Apr 28, 2025 at 04:29:55PM +0200, Alexandre Mergnat wrote:
> The MT6357 PMIC contains the same RTC as MT6358 which allows to add
> support for it trivially by just complementing the list of compatibles.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks a lot!

Uwe

--xvyefmwg7jcr7kfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgPrCIACgkQj4D7WH0S
/k5uzggAkQji5a5MAOBNxwmFwsge9xxOpHA0xqM5HwRUZBCYeca34VWPG6n6U0GA
bVXWEN1KWJBrgdsv/505roy1O5c3HcRRroWFLF4euSrMAl7kKfPvKbCb92TMLNwt
KO/BFcz7rRZ60I3Re6vmSTR+tW8915S5vXOV6PNh/YgvNMCnGCtIH2lCzdE8dc49
F2tW/utynBHpBiUnDE0UgFr18FyM3PQtpSCJWVpUaGwp54yVfozTDv19k4p9e4sP
XdJBBDNhi8yhT/855addjBUKSFWAW7cxCx64lq7Agwx7yZMcaaoEgdEOq75R+8Lg
SZ4wlhsxQ3BXN7P43l5g6dm94TzLZA==
=TwLE
-----END PGP SIGNATURE-----

--xvyefmwg7jcr7kfx--
