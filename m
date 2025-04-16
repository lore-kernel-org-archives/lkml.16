Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC9E1FFC55
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792452; cv=none; b=pcK6NNQAj7o5iNAHvVJkhKn/0ZuIorEDlq7Ynaj2KcopOmdatrgMKpECDSIvC6o8LY1/mzOn3oGLpAXRmmbnhLp0BN+B5h31N4t8T/lbRkJMrdz9b8nZaRLOdmxcOGnlhvmmO4+L2Z+lqhLDrBOl/p0ROPxNC9PkRU6Q75eUirs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792452; c=relaxed/simple;
	bh=p6TnZ/CKicDj5Ksyj8vyeb5NLMWnc0/9QDk6PC8l6Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aApJ0r0L69nonch9M1Xhs6NNHpK7tL5HD/7OJpElcLuJZwzR5fVXdzE0h/7KK13P9/RwnrtIz/WgC5hcZX7b+cisF4AR5Yv5bQI1bWZ5rznN/akUhd5iet7sInNs2IHDK2zO9VJE57JQ6WvBwqEQIFUFmzaCbt+Fi3NYno8kKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SWSIttHI; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SWSIttHI"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so5763583f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744792448; x=1745397248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lkeRSSXovGINyynGZ8ZsuSX54OiYzhhOx5T2XgU6em0=;
        b=SWSIttHIgLpSI37EBZ5q6VeV5EjfSopBCFCC7latvx72Acxgfo5oRG7Qu0GJuAcUhw
         uHDTyKxiyzS5TSMKtu1Eqo4SzoyuapbiJRGG0EBIq39MbqDPYX0CaPt5Mr9erZOWAWuY
         H0Ib65bgMMgEvfnApvhfi4/2ahoMuUG5u8ASRViCxSj56DvSVXU2s8rrYLgU2h6TKOlZ
         XvJOTy4c+5ANictR0a2vLo0/rv9/RLYyLflM7Hj2t9sKx0Ct5ep2RW+4w+j4ZXGaLfXr
         gJEyBURcGolNFLGumrdp/SIYplSbs44kuhendilt+ZdFieUQuxxcpVT1lH1ZAqWj0V4v
         vivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792448; x=1745397248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkeRSSXovGINyynGZ8ZsuSX54OiYzhhOx5T2XgU6em0=;
        b=IC59B4DBVKZz6fyJXPi1/LNPF3ZMUnd7I70dXKOCGO0zfMkU/sNmEaWnS9E4hAWYQk
         7jhfgt2DSTK7i2Hf6zAXBDuIW+N9ak23kn2/7MGgbpvzSoYzEPIjptahdz/rtNFr5l6e
         7YvXemOjBN4aTCzdTpbxC3+TyrJcYPnSfAEsa352NSktbFXsrrYZolAHE/LEcmS6UuCe
         fplma1wYZcA8UvaD3+Gc8ung7HiBxuVZi5kG8qwE8cCFdTtHheBlGrBikyuLiGz7NR0o
         MSkDdX4AJwhrqCFmIjph0I6c7g7ewpSeNI+sy0FCYLLmYCLsY6EPCav4aqh2w/TK3A/a
         DuZA==
X-Forwarded-Encrypted: i=1; AJvYcCX0VNq+DLxwHqzCCnZr8IL0Thi4bFINBZQkVKsLVflGXi4aYxA5MM1GnF5kHcNXdYRJcwfaY2Sx351cpjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWEOGfKYyBgaFz7GSk0+8SBukXHIqzPacxhjLDjTzt+F9Wr2SQ
	9ZBXlxcXOSKpGFZJI6uq7GPkisAPkc9WuUoid5zP3fE3ZDycwr3Le1XjkS8MBxHCbfoAuqz8gC2
	LDlw=
X-Gm-Gg: ASbGnctWW9gxBuK2Vz1+beBvWpJ+Ze+FAVl9qqmlDRJgT66XYivM1Jj0L8ws4KIrxMV
	4kGWyCryeEC+HZD6jlUPdfbz5nVGUOk5BFZ+4ecijFJJM5CRBQOdmriA+wyO3Aq7TTC0Fa1TAwH
	/B/Hrabq+UifOx/8aVsZrthzkppTx18QQC/WoTPNJ/uABl0Ywo+HOskA6qh/c8r5aLp5DvC96W/
	hVNNI0+CgmU3nJBlnVVLnyvg5zHfl9KBLXq41o+pOsfcKoZ92kXRjzPHOVWPELWLv54ozQbi2Qo
	S4Y0qcyAPTzSl8pZdh2DECzx03nWCXybciF5dKSFtfQNaJNbKLN5f1EesSRjvmpB4Lwsl/t9o5H
	54OjChZk=
X-Google-Smtp-Source: AGHT+IFk6ffCmveyDFjQEN2c2zgFb5GDDDgKa3HvYYBMlgaFVpLjRQXf8qm2p4Eu7CeJwjMcnw2Fpg==
X-Received: by 2002:a05:6000:1ac7:b0:391:1923:5a91 with SMTP id ffacd0b85a97d-39ee5b9fa3bmr839877f8f.55.1744792447905;
        Wed, 16 Apr 2025 01:34:07 -0700 (PDT)
Received: from localhost (p200300f65f13aa0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:aa04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae963f62sm16216034f8f.5.2025.04.16.01.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:34:07 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:34:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>, 
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] pwm: pwmchip character device
Message-ID: <kylbs7sod5xgvhkutxs7mmuxyeww65pcies7ed7lnzuwloym7i@jebshr47dnir>
References: <cover.1744120697.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ob5nu2gmojt5e6be"
Content-Disposition: inline
In-Reply-To: <cover.1744120697.git.ukleinek@kernel.org>


--ob5nu2gmojt5e6be
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/2] pwm: pwmchip character device
MIME-Version: 1.0

Hello,

On Tue, Apr 08, 2025 at 04:23:53PM +0200, Uwe Kleine-K=F6nig wrote:
> Uwe Kleine-K=F6nig (2):
>   pwm: Better document return value of pwm_round_waveform_might_sleep()
>   pwm: Add support for pwmchip devices for faster and easier userspace
>     access

I applied the first patch to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git
pwm/for-next. Will respin the 2nd.

Best regards
Uwe

--ob5nu2gmojt5e6be
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf/a3oACgkQj4D7WH0S
/k40Hwf+LU10B2plsdQKrs7KHKR42UFnBjLi6eotHQ4xH8xEBlOMa3z56E/D93tA
xXkQmn0KJckkkiWQ1ol5Y9MeNeNF9Dm5EDM4FWY21UvK33xwjBuFjbi7Fv9ivtNF
FIpCVpZPd/Fpuo/ZhU4GnUYPk+9QBvIk5hXqsYcxd6Hm5MFMcbbtCYSkUHlo6OT8
V2vCn543NCUmLXL0BZ6ZO//9KncLhMRKT0tASvmiLJveVt+hl1OhfdwI7M0i2tqz
mLe4fbNBDmveKnzIqwNErfGuwytfaXocoxZjrItqMcZ6V/RfjJHI+g9QYoBvHwpN
/MTpfMAx94+ax9ixnHJhx7rby0Fp6Q==
=lYsT
-----END PGP SIGNATURE-----

--ob5nu2gmojt5e6be--
