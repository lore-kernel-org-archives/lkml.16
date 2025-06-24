Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B180C238C2A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793824; cv=none; b=Qppt3V0zaiKWtBKeFwKBKA8Om6hemN7XIux/CaxzZ0yrJ7ww2PHizMkgv80QIf2PC+SHwB/OAuMGsUTlaN8n/ckFh4L6nmR7TSWzjwIW8WGn5LP04HroKo56wp/UPs3IM9Od64p6pkoUPx3JrYCwZM9NKMzn+HnwySiAoJq0NLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793824; c=relaxed/simple;
	bh=JZqxzc3n4hGVaiBbeSBreJZxmERoCl0/CXAHzC0ay4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncOHlRKx4RqJ2JEHlKWPi8ECIbK0qctn+MbF1qXq9hdqbfS+uoYEtPATCSJPcB1VbZVw2/ddv8l4FkORKttyuzkwQCjCqLhOXNjSNuqLoxIkrFGA4FWM5jb68OHtNNrOE9QS5yqF5R08CRWKOSHevBT9yko9WS7Veyo5DUDoqF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D0xgjMWO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D0xgjMWO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso5815797e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793821; x=1751398621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWx4ZbqmjuoN+GAAAjyTNAW/3x01CyhLbr2HZXGfdww=;
        b=D0xgjMWOyF3KHvczmtjAV3Q/PiM35tiT+5D8J6tO7JPh05UGPOywZMG+fMt7vRhYuz
         7HcBz1tUlIrYq9uRP0Zmd9e46VdOSIBjgSpFO34DhgDBOXa9nSMtNtr4ypfzA2HBPP0f
         9vcqIj3nThANA6Yo1us8puJgZ24UqGwTSjMU2/kXkdf3cHupoDcUWXD1fLYzau32TooL
         yc/1yfams5wPvtzARw8RjLi11HtgZxQdCrfvDO12lksbSxV5j6A0qg7Gws1SR+pDexCc
         tuQeJfHDts/Pa143m0mkQ+Q+xgy2ea3hUyy44tGbRw3iuv6W8EInnOqQ6RjjiYF5/1/D
         nCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793821; x=1751398621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWx4ZbqmjuoN+GAAAjyTNAW/3x01CyhLbr2HZXGfdww=;
        b=kW09Wm+BSD1M1Rv0Mndj0qY5C/xQZEGg+H2BLwXKDRQCcIRjz/XPkqZoQhnthu1kH5
         38e1qM20aDap208PIRSgmtuw9rlEaJAimcvvC2j0zYrV1104/cAE1K+5V6hSDDZuhIqq
         AtvsR0z0RZL4oysjAKrHZeekCRvJNrST7c+VSf371VwM1QJ/IvsCKFnbmUJK1kwNHYnb
         1BrptPvFrrKSyFHWkQBwFxH+fmEDa2obLkx1laNr2QNv/ve/41hweO6KJJw4zoixny7O
         Z+aOwaKXUb+2wd4737Jw0qCqvn5S4hs6LFvGLTXQ56f1eBGuAo0n/Rw0awmxrGB8MRcm
         44yg==
X-Forwarded-Encrypted: i=1; AJvYcCWtbHOWjLG5rkvHLnczjwEWeqxA76dwhSyMwNiySbekcscul835Xgbc+dEzlNEHQizEWl/qpCbdpMVjxR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSUjfc4i/JD8C6mQZZHpEV2tAjs0mkmVZbbPfSXI35nHyWF4O
	DJmE9Oi7dj/wKUVpzR6pAqQUAYpfTQLaOk8CrQWg1PR90Bvru6GFz+lh9MrBQF+rxF7DHeZtz54
	Jn9k3ApYjrT2fr77UlpUxGB6+FYv8Xj9xUfV+T0Mb5w==
X-Gm-Gg: ASbGncsNTu+1muZk2j/fYYU0x5W2VxczZR/eUJqJ//2YBQ0g8dJ0QNNZOuaSmvePP74
	csfrSZEbTBbzx8u6++jTGu8Dv+OAjVybPN/iAosjJyZRKN8pv/2YE+GzQx56qewMpO1i54MktSa
	spAvz6u4JCiaRF1/85AHpg3PGqWipx+94q0wvR6ZRGg8cFlUG0jq9Nxg==
X-Google-Smtp-Source: AGHT+IGTAkz9C4D85zB1kQRLKN+kg1CzqDWzK8T7Zq3cCjKU/bU0Pgyf3W2KemMQkOy8Ax3B2qtJIPcdQTQB2/vKgbg=
X-Received: by 2002:a05:6512:114e:b0:553:2dce:3aac with SMTP id
 2adb3069b0e04-554fdcd71acmr54580e87.16.1750793820825; Tue, 24 Jun 2025
 12:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
In-Reply-To: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:36:49 +0200
X-Gm-Features: AX0GCFtQ1H1_4Ze356zkPlmDngrt4CualoQkn-4hS5it00YgmSIZZpN3pwFkejw
Message-ID: <CACRpkda0w6GthVHe+iMGBG-5QKrF-3yP_8o6M4_xeJWsU=8h_A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: canaan: k230: Fix DT parsing and
 registration order
To: Ze Huang <huangze@whut.edu.cn>
Cc: Ze Huang <18771902331@163.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 6:11=E2=80=AFPM Ze Huang <huangze@whut.edu.cn> wrot=
e:

> This patch set fixes two issues in the Canaan K230 pinctrl driver:
>
> 1. Adds a NULL check for the "pinmux" property in the device tree parser =
to
>    prevent potential NULL pointer dereference, and fixes a typo in the
>    match table comment.
>
> 2. Moves the DT parsing step before pinctrl registration to ensure that
>    pin resources are fully initialized before being used.
>
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>

Patches applied!

Yours,
Linus Walleij
