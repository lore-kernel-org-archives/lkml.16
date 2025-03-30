Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC146B5;
	Sun, 30 Mar 2025 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743346707; cv=none; b=SEu/AXv4A31W+7neATOJvT803H8DUI0X8JV5rLm9cTaGac6NU+4crVDuMAoVzDPKV+2Cl7tgR+qzwHvROZuSRb+BojXnafvAuaiaPPO/WhezSkHfFR0gIAbjs3ICMHeDNKdySLj4CzAu8AyXbJzSnrhJ+eGSBFQQ0F/c5jszBso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743346707; c=relaxed/simple;
	bh=vdOAGHLxbMItBbiFY9iHNCWbLYXgDn4DhPnj7HUrDgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5dMUrooO9igmZASP9QCVrPA1dRSjrga840gvN7xaH7ZosC0rQ9DLJDxDCmwSrjVNvfw7ooKDJFYrJUBmKEKqjxobiz7r1aJR39vH5ET1BPehNC9FLeFEZnFOVnaCbQHe4ywj13Q/lt50BlK8udjSSqtcO8wwBYZGdBUwh6O2rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YXHdOX+6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YXHdOX+6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224019ad9edso41689165ad.1;
        Sun, 30 Mar 2025 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743346706; x=1743951506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdOAGHLxbMItBbiFY9iHNCWbLYXgDn4DhPnj7HUrDgc=;
        b=YXHdOX+6f5Py+CMrGnjh0G4TQ4y9bcnHkDKpYsxSvmv/K8H4d9a0+BNX9nWySwdO0e
         0F/B39vQ+XASuaUlnKbAUYKb8pNPEGHEyOs1FrV86/QuXayBIZIkOha8rs5dkrLtiwvW
         FHNLTlAQoqXFvzV8xVwOp0AptNkOVwrlIJyxvFuxVJDKUyc3DvxqBs0aA7dB39Nt8Vmb
         FaWeat7nm7ABWPhuv8rrKJQsq5lTNdkE1aCoy77zwfxwtQVE/DS+rBhYMHkU5IOPSybw
         5jqnNKl4TiTB2fbk8A++wPCQEIOl7pa+gGh4WM7dwm4hhKPjPtvLA/Y+I1K6rNAHDJam
         /fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743346706; x=1743951506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdOAGHLxbMItBbiFY9iHNCWbLYXgDn4DhPnj7HUrDgc=;
        b=U0uca130+ZCnEDmbWMLWA4W9pFHF7RMcX16fOb3skJEyq/2xMiRfFk8O9WbVh9J781
         j1QaBCd4m6YjZvsYL2q4CcYDio+RcoaVI2JFfs1FoO0uL59Z3QNNHUIX4mCb3aY1KYeD
         MFNCy4hl5UG9JF/oJaOjjzDTpBZRgOZDMC5nv4xIoPMCZmS/zPfG+nn+qm/rouVj0orU
         6vWPgFJu8gmOW3TeblsJs/L1S1tF90OuNjie8ag0oZsgoRjmKQhyjFPL6LDt+h9En4K/
         +ZmLqxwpvB2KlQxMHRZ3e7+HppQvLRLoGjBQuFQDkesnQVMW2Iqlezdvfu6AqjeKb6ne
         xR4w==
X-Forwarded-Encrypted: i=1; AJvYcCUDuj6WuF6umxz0Mo/vz4ZNULmHRLjgDW5Gj/2cHrvuz744kE3YzeJPHkiZtzS9XOKgjQ4Fq2fKJmQk@vger.kernel.org, AJvYcCUbMBNAx8qGv87U+nF8wQkxQUoADvRNkkBysqVeKcNLfufN/gOYlKWa5vaN8nm6IrgDl1ojUo7+0nZ1wfCq@vger.kernel.org
X-Gm-Message-State: AOJu0YwLw0HVaz3Ww4hWg5dYBifMQCJ8QLrHMT4z/139023NGDKCl2AG
	b64JJi9p8QPIACcEfaGMet8W46tx08noa1ynxXRNNp/p1puzli1SYGhDGW/511n06CSsgAHoqlE
	5iUY6GTR6GiCQpegEHXavKWfGlTs=
X-Gm-Gg: ASbGncsm9+uQ7oHfsu9ULy3Ua4kp9Augb9Wag4BSfWJFzgZWnnRr/MDXcgetEqYpA9O
	73Ade6hmOZJn0A+Ax0ktzi+QopOT/+Yw37VJQb3kou1lPWmwnseF97Joo0POcYRYHOZmesRshP1
	DBDtrCWwPFgCllCZkJG4pJ1HXGxxQd2/ffAkHjdrq7rCUIpc0RiIg=
X-Google-Smtp-Source: AGHT+IG4Jkc9gXUSv+wEsEX6SgVo8adn3w5Ep79nMPuvu1HAehPF+DyxWNUs1H80EL5KcTcYImCxJs06lxOsr3L3jDQ=
X-Received: by 2002:a17:903:1c1:b0:224:a79:5fe9 with SMTP id
 d9443c01a7336-2292f975394mr94533925ad.30.1743346705656; Sun, 30 Mar 2025
 07:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330143254.3159519-1-christianshewitt@gmail.com>
In-Reply-To: <20250330143254.3159519-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Mar 2025 16:58:14 +0200
X-Gm-Features: AQ5f1JqLwUBn_vStmnEBY5lsQvrYI65RiuPeP7Vq4pNLt0KL_i30X5OO_dk1zJQ
Message-ID: <CAFBinCA87aJvLhsEm0-YeaAKy22LpviZZ2AA_FSD-XSPtDXm4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 30, 2025 at 4:32=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Add the saradac node using the meson-gxlx-saradc compatible to ensure
> MPLL clocks are poked and audio output is enabled on the p271 (S905L)
> board.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
