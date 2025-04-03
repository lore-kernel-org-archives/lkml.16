Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8BE245022
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671021; cv=none; b=b/vLKDad5BppnjdHC4Y3IGH8uzsuqnPXjVTI7ICDrNcBXEPGBTnFmheJxUeEZAluUU7bDk1FzQczvjqEj6Gf30NUi4mgZhPSVf1Az2HnYUa5PpsH0IPYrpZP/upTZxNkw5NcYHc2jvwqhOLwbmlx2FclNDrUBIE7vRVUSJcFerE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671021; c=relaxed/simple;
	bh=V7ZGOwuXQ0pcRqAldH/+ETedOGLTXRvg2tS03VFoYl8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oE5Hh90hOIswW7MbuS4MTfb0ITG9tX5rv8mQbx3d6jgQ+WtGUwRn9W98oGQMvP5aM8E5ekzEBWKwRjR9vJ6OfjjVyDKmHHX1+14frWxNVPrVhpb7MPGx8ftdGyxkL8XDdbL5avdqDWGVzGa7w1vEXGah0TWn4TQ71uhQrUJ9F6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fp65+uOF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fp65+uOF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf680d351so9738305e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743671018; x=1744275818; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V7ZGOwuXQ0pcRqAldH/+ETedOGLTXRvg2tS03VFoYl8=;
        b=fp65+uOFT3jV1rTXprfMnQ8fkjS9JHtc6KXkQfx979FtY1MfCH1l62LYXThJrhlyJd
         M9JgR2ctYQEeh7JdNh5vvEPcIEgxqIwHcASLOy2A64Y+epsGB+Ciw/f6R1rz2xwpdTzn
         VtU/8soP9xq85TOa66ro5al1rh3gwyPQ7v/hVVhVM4eUKuyELscrtLHIRBGWuPJqqdQq
         qJXHcZVWQMElgeNYDSBlFsjgxYGtYQf5yanmN/KBQjHuF17sRgZzqNaZ31d0rPWVMXwY
         9zlKLocfN01DkiKAeiAiuyzaXQ5GQtYxqwotWdxhpTbiwr70lt8Un1zgpMjjipWzPmmh
         9AQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743671018; x=1744275818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7ZGOwuXQ0pcRqAldH/+ETedOGLTXRvg2tS03VFoYl8=;
        b=aH9II5Z5fo/u8N1TP/ToUFhpYStNGtJr2VghrrHvrkvnhAD6LcNUR2tLRL9qkO8bjY
         JhTphX1j4ZYBO0adM6q2c5VUpwJZ1Qo7OElZRLMWbYgn5vA9kABPm5QvPK7KRiPzyj8E
         xSzO9LrNvUSj2nLd4Wn9ZNC1tpOUTydwvQgi96V75RUf+NHuc7Uvq7PVxgZCcHx0YR1E
         2zV/rQ55qpi3AnOfPvJbQsMPjLUJ3q7crEVh2UxEsCFt/KHgBv09hvaEHpOBtxJIfqwC
         zQ8EEAE6vs3LJlyI1aBon/WNcgbmkMRppTR/QF3vh5hZ0XN0+x51N/DBB7Se9Fxnh5CV
         5IUw==
X-Forwarded-Encrypted: i=1; AJvYcCXLelV3cNOeIbBEQwMqFtKcvjRV3kqytXqqQwT+V4acQxD6V5n6A7zt2j2onrrp8KY1kcVjM54arAs+e7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx76yuyy3R5GgRmUpZcnyJ3C753t0ChLjPAhaskFM8NuKDMGPKc
	8s3cxRV6kN28LoOJKXh/aGtvtp+HoUWvMtPMbhpK07mV13ah8aq0CeCqBg4ogz6+y2BDFrvFc+w
	/yBE=
X-Gm-Gg: ASbGncu4q/gDGy1LaqrfjOQIIDVlAUjjahekH+ffwF71djmzwZK6BptLT7rzix1E3xZ
	ewhk8NLJS0B6lmKHveFH9sVP8A7tBT+CVgQI9Sc4T4Q4gblNNsUHxM2w5GfhIN54vYpKltec614
	i1qmBL3B5DBhRlkanfmh9mwEJ9zpXd0Axo2SgQuyqAQyqyGAdc75XMDWvKZB0HMSdWRwkQrT0OT
	/FoOPrQEXZ34fA5gN5s0qYh10TLAHpRstUaJthsx8Alef/5ntr3ksC8SDcP37ICwagKPiT87qTr
	dO08F4niBeRZGCWbIJkwnqDrwHYC6zuOlhjlsd2aabWkh8zmkg==
X-Google-Smtp-Source: AGHT+IF1Z0N/QR0bqygtyF1b7lJRQ+31HK0rLhXx57VHXUlp5Pl0d/+tHSmMb5mQV4oCrGHlzNUhKA==
X-Received: by 2002:a05:600c:83c3:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-43ec630446dmr10583585e9.10.1743671018265;
        Thu, 03 Apr 2025 02:03:38 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16602bbsm15576925e9.9.2025.04.03.02.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 02:03:37 -0700 (PDT)
Message-ID: <d9a0547a9b042e5824009e73f43b808e149d5d9f.camel@linaro.org>
Subject: Re: [PATCH] power: reset: reboot-mode: better compatibility with DT
 (replace ' ,/')
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 10:03:36 +0100
In-Reply-To: <20250307-reboot-mode-chars-v1-1-d83ff95da524@linaro.org>
References: <20250307-reboot-mode-chars-v1-1-d83ff95da524@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Fri, 2025-03-07 at 07:50 +0000, Andr=C3=A9 Draszik wrote:
> This driver's purpose is to parse boot modes described in DT, via key
> (node name) / value pairs, and to match them to a reboot mode requested
> by the kernel. Unfortunately, DT node names can not contain certain
> characters, like space ' ' or comma ',' or slash '/', while the
> requested reboot mode may.
>=20
> This is a problem because it makes it impossible to match reboot modes
> containing any of those characters.
>=20
> For example, this makes it impossible to communicate DM verity errors
> to the boot loader - DM verity errors trigger a reboot with mode
> "dm-verity device corrupted" in drivers/md/dm-verity-target.c and
> devices typically have to take action in that case [1]. Changing this
> string itself is not feasible, see e.g. discussion in [2], but would
> also just cover this one case.
>=20
> Another example is Android, which may use comma in the reboot mode
> string, e.g. as "shutdown,thermal" in [3].
>=20
> The kernel also shouldn't prescribe what characters are allowed inside
> the boot mode string for a user to set. It hasn't done this so far, and
> introducing such a restriction would be an interface break and
> arbitrarily enforce a random new policy.
>=20
> Therefore, update this driver to do another round of string matching,
> after replacing the common characters mentioned above with dash '-', if
> a match hasn't been found without doing said replacement.
> This now allows us to have DT entries of e.g.:
>=20
> =C2=A0=C2=A0=C2=A0 mode-dm-verity-device-corrupted =3D <...>
>=20
> and so on.

Another friendly ping. Any thoughts on this?

Cheers,
Andre'

