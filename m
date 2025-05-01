Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33FE253F09;
	Thu,  1 May 2025 05:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746075924; cv=none; b=RSeXzPy1X7LzSWaRacxvuAcQ0qesZpSqmbDhbyRQpxlENIPNsRMmKypQg7WCE5z3vglUOP+bai3mMFWOCrqaF2x7GhSxkO4PhjqJm2XFB3nH/WKgIgyUEjncksGNszFNpfpodAuZWy6kNBENxXuU2t/jfP7ygo2F/GBWO0V/zSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746075924; c=relaxed/simple;
	bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASFnwg0ExcCjfiXfuASFmNOp1ao2A9Lyp3s2K6ehQ2ncM5CnkQoFiSnxeCGLJ/EF2ExkVI5VYjXx/gCNOn9fuZtNVv3GLDDh6mNlsh4jrev8Vy56/3PbZNmMRyGDzVS3HdR0cR6tHBdHTvzMYFjK10+NnY9o0lC8NhDh4eoauUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmoQAzZ5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmoQAzZ5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so936938a12.0;
        Wed, 30 Apr 2025 22:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746075921; x=1746680721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=;
        b=VmoQAzZ5KB0Cg/hU8QLNEQXm0yFJ20IX+15w15uat86LhW1RY8WmlIAvril50w9w+e
         vl0k7cSOsKT3KKOCi174Feq3cIM9luXRvbwhhYz7TWTWNlkuEYEBDBlJ/e+yYOkmjb9F
         x9PgkRv4udjPxmvj2kIBjittZUTP/aKvaQbMzGG1+kWmjLpy7YbvrrzeQRAfU3eTV5ht
         7SgQeQrfRjEgNJpQDzzNJTR0efFY/5FR+dnOoxPY79eVZUOSU7Fa/8DUTW6krFpsLI30
         j7o+97gDH/bCm0KKI9lzaPvy2TI6ZzhL6TKUrw9OEXuER9Qb9uUDKkw9V/Pox89awwiE
         H9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746075921; x=1746680721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=;
        b=Od3Yy6Y7hAXXP+rPUaLceo0wHTJwX/IHv2a+Mi/TME1n7swTBky4lDUoXO9qEHMNF4
         4lUa9oDyd14lo7SnO5Zd7V10yL0txM+2FrgDQTuEiIR7EOsbHCgWjj3xHO1gv66KtIXR
         fzfOVCz7hSb2Gsow4jkw6ym6ajXu+71tzT61fKt7u9NcMC5x3XXHi4cYY3fBLzEOJkf0
         3wUV5ayc0d3iSfz0KgjIcHAn0YtjO63ir0+JmF11+eVpGRxva8ExiIsdoT7r5+Ilyd8o
         /Fh4dg7Xsh7/vU19quW9f90DfUoUbzg+XcCF9ZyLW2nj8dhMqUCBEar8faMPM45ujBfB
         9/6A==
X-Forwarded-Encrypted: i=1; AJvYcCXuMkhWErgARH6uwzobyzlEjSPlECBeYVHJLmKdxD0e6gkQMIRM2paLKicOWl8M0r0NejEcEbkv9S/fg5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgK+V+Oeqf1ElUP8AYtjX4dthW8jVFlhzoIUAE02cU5WxibSEU
	KdxXXJkVRlHuKT8jQ035zaLizY2ODxGJLMTInCD/AhwuOJvglIJh
X-Gm-Gg: ASbGncuIlRs5uq9Vv9eF/yps/MFqz3KA7HZngaspJCPr0pEVqkOgxJu1l0QuZYiIuRI
	thR8A9ToBWOwDvVwS7uZ4zeHg0Gm6TXeRfJIIR4q+/rCxn9P5ovtVSarEUzgdC3/XxLD9quRZwz
	ZuLUbEPpqOuLOSK8qJZJfDh9IGiz1Xufaxpmel5eIkr65QvITrSIu/0oU6cOzMjHXbkVsxZfubz
	s7jGE8d/APvutUmPPRFDld9ByD+yf6jhBbOWYTztBbnG/LqGJd6J/cLt5OdLvn7HdMTySGNOgis
	oHmo6rmAEJsT6KRJfilXGezKqf0PkOXN/8CY8eBow3ZmVUAHPxTSVsXNc0U7bxS57vuBR/dr/VG
	1ibxnRkGNdG3sWt9M
X-Google-Smtp-Source: AGHT+IFslrSBgwP2oKjTyz3yJ6G0zEWqRhVwWhyXN+S+K5UzJwFMqvffPBISy6dAiekefanLK4YUUA==
X-Received: by 2002:a05:6402:3494:b0:5e5:b53:fd49 with SMTP id 4fb4d7f45d1cf-5f8aef17766mr5400131a12.3.1746075920933;
        Wed, 30 Apr 2025 22:05:20 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc361sm9510920a12.16.2025.04.30.22.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 22:05:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Date: Thu, 01 May 2025 07:05:19 +0200
Message-ID: <2220249.irdbgypaU6@jernej-laptop>
In-Reply-To: <20250430095325.477311-1-andre.przywara@arm.com>
References: <20250430095325.477311-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 30. april 2025 ob 11:53:25 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
> of the last two arguments was different between the users and the
> definition: features became flags and flags became features.
>=20
> This just didn't end up in a desaster yet because most users ended up
> passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> not yet used.
>=20
> Swap the order of the arguments in the definition, so that users stay
> untouched.
>=20
> Fixes: cdbb9d0d09db ("clk: sunxi-ng: mp: provide wrappers for setting fea=
ture flags")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


