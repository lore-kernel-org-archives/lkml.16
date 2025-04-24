Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E221FF57
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484800; cv=none; b=PUoFBdsvEdP0MgLpmNgk55lSLqs5mjo6qkhi0HGZRJGyKqEMsBHSY2i4L26KH7hd33TDFxs0iXAMpghWuBfnPqbLEBv1NEmwkOURBKBQxqOalo/76ac5E/R/OcsHgctAOvOIbK0cNehRAJv2HS0eXYh3p3rnmtEUMv1KsV1pl+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484800; c=relaxed/simple;
	bh=h56jXaRg0lp1qzwbK+Upo+lq//JNs74dFUZKk7h9pdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOTyui2PlcTtzQPrK96xtiNJ2HHcA096goxO8yAg0HySFGQ9v7S1pM9kDS4PhX6H6uHWn9oYjWYTHt+fJ5si0LwaoLn/9MDS5Qmjan0/NU/H0M2l5/9beMXdmDtgi5z/Fcz2kMI5BJfraDaXPujiiJpfPTEDkd643FeiLnT89og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VHlUNkLj; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VHlUNkLj"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso8080121fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484793; x=1746089593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h56jXaRg0lp1qzwbK+Upo+lq//JNs74dFUZKk7h9pdQ=;
        b=VHlUNkLjIzYXGo5Hrmnu12dreEkd2QefbMZwb36B32d2nRiy4fEOhN6WCe5aN6ewJP
         gFjgSC2OdPdjT67LsMeizuTk6QpVsseL8QtPCjd4hqJFP5CM7jA2+L0e39eIhNAMOGt8
         fHtYnbzQi5MZQDlGEDQEhCQKvvfPxho15OhX1g9k9oV3ELQyE1a5DVwR/Bwd1MN8GezZ
         JEo0stAig8Sn7OnojB4xNNj2Z21xKsjj6b2/9OEsU/KZDssP2TtQEbhcM8WDNK7kS4IO
         Iye6lSq/H1BPxFaDOIwV0ye3//q6mbqzrJ9fDaHn5fg5sptsttVZYT4YrfmaFKOwATZQ
         puXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484793; x=1746089593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h56jXaRg0lp1qzwbK+Upo+lq//JNs74dFUZKk7h9pdQ=;
        b=f1bTDdWBtVJ6qob/5vsgL3i7gYbGDsujqapuIcts6EMZ7W3lCJ0K3SaCZl1w8B7qNL
         Aip7kJDmbVRySITa8xRbeXroCVlrm5Lnk5fTQYsoSYme0+38iBck93p4Yb/fINrysNgn
         4I4xK40mCr4/Hfw3VSRr+/B1YaV2uOZWn7VRMVuQYuyv5qyNfZt2+Muw5bXp/XVjq5s/
         K4J2wToWJH/s4ZpDhXHnJxMxFHxxbCIL/ifhouzn34H9hBLkUhFVMNABtXiJOm9TJNAe
         a/cdkwWm+9V/B3cl9PuiiOLlSyKoAILeOgXvQRRWdbqGU/QVD1Js2iuEB9BhRkFDpZuM
         5fAA==
X-Forwarded-Encrypted: i=1; AJvYcCWGg26BkiV/+f91HwNDXO3Y/2MC6LNTSxH3PpVYRWQqp+CwYzhRpnkwv27rvfkVsmjhgBwQc0i92C+pncI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDR+/EcLUBz1ynNTua3pTWJdGSu61p7zbPgoihmfuQlVP7Hws8
	hJiDzGZAhsCjfK35et2n83ESoKAcPygq5JyGiUbJyTdl0VNwHO57Qo1Zf2mM6FZ+/JIUv+VKKga
	CnMriYXxswQhhIAJ6NMVO9lB7QYzWaL4B6vvctg==
X-Gm-Gg: ASbGnctZ3HqBLebNLsFWVJmiAdYJgWOuFHD9hFoUbgigV+pUvJmUMOC6eA3lPaDvQMG
	54OXwQIYpZJyfk5qp4t/PFDgHNcjLCrTmam029tCz7PflUSADaa25LP6fD2LewkakRO0L6ls6ZX
	puws9z32r6IGg4Oe96+fs0QQ==
X-Google-Smtp-Source: AGHT+IHgkO9f8zTL30SNdRQ+BRVHRS6jtRSRScOybGqEhwmwfSQ4uSfTrGXFEJi9QQxgHCp3XvKQsl4yaO5QsXTeojQ=
X-Received: by 2002:a2e:a906:0:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-3179febb3d6mr7298421fa.32.1745484792686; Thu, 24 Apr 2025
 01:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409211243.20105-1-kabel@kernel.org>
In-Reply-To: <20250409211243.20105-1-kabel@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:53:01 +0200
X-Gm-Features: ATxdqUFlpK3NKryA434lMtbxZVmggFLJMy1QdvghVFUGS0ueoPApOyfPx3gU2wM
Message-ID: <CACRpkdYpPmuLnJLYk9fxkF_xnD09DYrE-J1hrY=x61CFUEu4Sw@mail.gmail.com>
Subject: Re: [PATCH v2] platform: cznic: use new GPIO line value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:12=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
