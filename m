Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC561DA4E;
	Mon, 23 Jun 2025 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690992; cv=none; b=LF4MN6J9TTICgysFMpRarM9BSJDEgKWzz+OmzTPSb8tb4UC5eqwLiOPSUpwPnhdsjpNNq0gAwlE1RdPDgOShmiAsvtDN4FQWN0JmFnqba2KCCju4CXsdA0zobFCcCYYAd03Rb4g+GlgsVMiKgmmSbMWp24wen6BMmk4zZhtMD+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690992; c=relaxed/simple;
	bh=ptw+OLnbhQoou1tvc49UIB1GAA1R3x8wTb0I0R87Zd8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VXRQGIem5xILsFyQsrYoOG8TZz9mqLtyUJBXi/H4CzCutoZ5y9VP0kyDIR+gPmTJ0BPB8oguv1fqxdkFcgeqXymE9ssTNWqUPmWAigz2fljPqaLFa4C3yJRVOXmdabHjjr4lb7ZVUWX6DH4exHq9cXfQ9XGFd29diaELf3GupLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPeo3YNj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPeo3YNj"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso7768001a12.2;
        Mon, 23 Jun 2025 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750690989; x=1751295789; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXl0cMLudBpdlj8wR8LOIlD5+oXM7nXzkbSpaXpGmEw=;
        b=UPeo3YNjgYrE9nbCs7ea7uq+LGq88S0LWFTtgkSE8cz/eMZXjr3wldwN9B94w90WMg
         ulMIWzyptZ1O+KcS02JN990OrjwhItAnnjGD7wPYUvEfG3Mt5fTNQRnwi0AovcBohcH/
         DjLPY3CDBsYRTZcm9KMN4ph7KDsfpOyw876Ewtukzyk587dAvAApoNccFHnt7ocM6PRA
         S1mJrPEHaf2+RrTv32R5DsXmH5RspSoDgP3aNlND/BQ07euTpO+t3QEoUlSBtzmsvQZG
         D9Upz/TktBB5JIgzCNJAdNhb1e8+HHPRpcXmzJTU21auwbeMb0Sd/G3DLSe6E9q8vrYv
         HA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690989; x=1751295789;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXl0cMLudBpdlj8wR8LOIlD5+oXM7nXzkbSpaXpGmEw=;
        b=v54s5yotBWim3ZvIOVwxzBJ+1+VwJlDhLQT8r6yhVO/hluR9MjmWZATPKRzybIxzvs
         kRgjHohzq/jr+4bHY2afrd8xnIpp0/tif8ZAkQyg2xFu1kZv/yr68iWNWVNe8HtWsivm
         XDyIBljVud1niJjmELKDFD3Rgb9VRyhmkYYTV0VgFJMoA3HoFge2Y1wZR67ZbvO7kX+1
         4JqEONquYhm4C0ef+L0GY23Ww+Mo1LOMiGBaVY5qBo/pw2mVlj7TPfRinQxri02/Sehb
         KsqzKSFIPoKqCB5ThPr4QW06pHEQFoXkPI3CbPhR48Esi4I86hp4QSa6vlReek8H175o
         Y+SA==
X-Forwarded-Encrypted: i=1; AJvYcCV5huojR8U89g7ejRseIShncM0GbtB2YrzqU0ao8YJ4xotbsadh8LKwAlcVtHFE0w9jbCG4eCK6bGLX@vger.kernel.org, AJvYcCXIYJpZjYNAQ3k5FaSQ0p4h1rYC2vV06higysiSp90OHUgqU4IAsADhaSJebA/GCQXl4C3T+14VAkWj8j6s@vger.kernel.org
X-Gm-Message-State: AOJu0YyOTZtfSA2zGT3S1/Vi1UpZtR00vG13iocCFDw2SbLEJT2eWrMn
	6+KIRoQbcgIw3ats9/HMP8CFFIiMOc9INiZNCqJWf/aDEe/tldVNBkIc
X-Gm-Gg: ASbGncvnryddrAYxEQbG/aAbplkqJ71zBtMW8ZAj/BnvkDJO3+E0s1P75+RDiKwAqHY
	S0LZkk4vp6OCgzLaViMdKhmKdOtkU7e5uif0urF3Jj6CVjL1iAIeMj7VRepGm+2/Pg+Bkp8baxp
	7t4DpdgdcUwF1MANndCgZ866DPoG2uVa84lP4OJRT96kAjY9OOjyci8OdO+158eDv9cki8sqUTw
	wlgo+KNFvMtprdKvL/ZX2k+NxgDSSiM0JGfCr4bmxFR6OV5PAjCCipB9jZrKm6vlqIbBcgoDhAx
	I2dsj+/SqFzlRpZu6TZ1CYgwlf78rgo2w6yH08Ee07+PlLxXa1QUlY2hHtuR6LWVgzePPfgIoYA
	KzdbuBMcwrA==
X-Google-Smtp-Source: AGHT+IGgziI+e+vJ+MXDsuPrI0s48ZwgitoKIP9UnUUKH8556Bz5CkOWTC/xSH8NNs/2JksNufd3YQ==
X-Received: by 2002:a05:6402:34d2:b0:607:f42f:d5eb with SMTP id 4fb4d7f45d1cf-60a1cd1af9amr12209304a12.7.1750690988966;
        Mon, 23 Jun 2025 08:03:08 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18ce62f9sm6107984a12.68.2025.06.23.08.03.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:03:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
Date: Mon, 23 Jun 2025 17:02:56 +0200
Cc: Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Transfer-Encoding: quoted-printable
Message-Id: <36711B65-DD45-4539-BD9C-0382936FD0A3@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil>
 <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil>
 <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
 <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
To: Alexey Charkov <alchark@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)



> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> =
w dniu 23 cze 2025, o godz. 15:58:
>=20
> On Mon, Jun 23, 2025 at 1:19=E2=80=AFPM Alexey Charkov =
<alchark@gmail.com> wrote:
>>=20
>>=20
>=20
> Okay, I've bisected this.
>=20
> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
> v1.08 and earlier work fine.


just fyi:=20
to confirm: replacing only bl31 to 1.08 makes all good
with perf gov. clocks staying on 2200/2300
clock estimations are predictable, constant and estimating constantly =
2400
ux is =E2=80=9Elike=E2=80=9D on 3588

Alexey: many thx for finding root cause component!
 =20
  =20=
