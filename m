Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7361FDE26
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833317; cv=none; b=G3oZ95WirLLP9DWPvZbmnqAcIntEF7NB1JqVNhz3qLX3wIkTqjV6ekUm0zAGsztIXlnupqKMOhijcnlFnIIDjMrDFYzicl4Vnd15ffUEB7LDGTzZnnPoVUr671LUrk7E2UPG9O4QA76lzBiSiLjcK5EQH/DtTG8wsh2CtAimgUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833317; c=relaxed/simple;
	bh=tRqJLc+O0FDbedoqglzuXzm6t6RtebcSpmdqWw4IkkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ky/3ZfC/hJgEdCeHBtju6nYopVdiRM+NeFMyvaniZdiVEFMsNlJnRQhhBwTfXALyB4tHRiFIjZhiav/Z7fH9gOeu6m+lXQ/KSb7oOF9iVJFpBNvCC6lvYNOTfFCEhI2VdH4TS+/q/veVm0Qi51vuvLn+YPinkUrV6OmE82uakAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c+mW8Vch; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+mW8Vch"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5401be44b58so786424e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738833313; x=1739438113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRqJLc+O0FDbedoqglzuXzm6t6RtebcSpmdqWw4IkkM=;
        b=c+mW8VchR84wTHE4wz976PiIhW68sVJOmk8hjTs0OslgqjGgeYaf/sl6evTmncWqa/
         5E02ZOU0pd+Hm9VPO2Cx4bSKO2UEqANmERWWpzdko7lXdbQOi/x8z76WdDrLwfXPdmRs
         MRmLr385wOd8+U7coxDYpWM3QeS4Lr/iKtApNH5+cv2u3Kt3OklBseSp9ckkaDl5ls5b
         qtjE49Y9HqoQkRz6W0k5UBhV1dUtbMHtefoaiQVAm/biZbVG5cNTf0czRj45FTuWcP9T
         no3EJlWg7nw5PJXtad/WtPVFt0d5AdjvR3xQe52UfGqyIpw8AMg7Mo0AaIqH6Xy3PPFN
         6yUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833313; x=1739438113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRqJLc+O0FDbedoqglzuXzm6t6RtebcSpmdqWw4IkkM=;
        b=waEUpqz9Gn7svqs56N8WwLDaSzybyNdkXPoXAJa6E+pHbc5Ud8kx+aLq/qAJJz3RrH
         Fdbise69MVyAcH11G763SA7KA4J/x86f06N8wRSuKZAE5g8XeGrWJ5KjUysVt9BBz7BC
         b7D4kIgNFVtfHeCX8KrJsTKhjavxRORm+I2+1IbExKt2kFO9rQ4YjplG3dCFd527KwTu
         BeuEKW0GGEtT21/gFVka0mvoRddTd0Tdy5xWLjpL8jk6Q7aIsGPNKtzTOZ1wcgPzYcFo
         xew/G0VySr8rklv89P1/Ggjp90hPhIn3XCQUz7OcBHg22HIm9wHMLUT8cA/2Yz+sIrQ2
         88AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSma4IudiIbsjZzVTDiKHKEq7fuQOjgs7blL66guN/i56wqGoWvS02CeouvsH745Y91hXioRKdqbgXjSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjKhsAcQxOmh9rgExHyfcjjGozkymotNADnTSumUJtjOVU8nyu
	kyiTT7jYo/Rhs51DJ+41J3VnkpaoQbgJ8mdqRk9VXFkCGc6qIovr8EfQSDlSFLRt81ERD4aUUlC
	qyH7ifcjZA6OLBL3+PtDJaO+jBOQxu3KMZ1sQ8duwT6JU0Nm7
X-Gm-Gg: ASbGncv8kZbY0QPC+oGQ/oVD7EDRRva67kzeRyRBeWIIJWra7SUnaIA7OJ5IDdgwttu
	TR77v5GtI6D7O0RZ2jw5Ttr9Cd0njnKVsH2IjLruZZXFsMf1cCnsGdRgd1GxjUDa6JAlzQSk=
X-Google-Smtp-Source: AGHT+IElLnUlOzbE8Puyjhx2m9fT2KJol5uqVVtfoRbXKJQshctEXy1e37MJc99UBpwywse23HEoui4DOzqO7+aQfjI=
X-Received: by 2002:a2e:a912:0:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-307cf2ecc76mr23223341fa.4.1738833312724;
 Thu, 06 Feb 2025 01:15:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205101058.2034860-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250205101058.2034860-1-claudiu.beznea.uj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:15:01 +0100
X-Gm-Features: AWEUYZmZ6IZ3PcFl2s36i0IngD6WlXx7rnFQanVdV3a5Nwbe940ogp6JHOjNsb8
Message-ID: <CACRpkdZh0mDkob62k=_v+eMqn-mKNpeetS3h38wpNHWyA+Eijw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: Print unsigned value if a
 format is registered
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: peng.fan@nxp.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 11:11=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:

> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Commit 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")
> unconditionally switched to printing hex values in
> pinconf_generic_dump_one(). However, if a dump format is registered for t=
he
> dumped pin, the hex value is printed as well. This hex value does not
> necessarily correspond 1:1 with the hardware register value (as noted by
> commit 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")). As a
> result, user-facing output may include information like:
> output drive strength (0x100 uA).
>
> To address this, check if a dump format is registered for the dumped
> property, and print the unsigned value instead when applicable.
>
> Fixes: 3ba11e684d16 ("pinctrl: pinconf-generic: print hex value")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Patch applied!

Yours,
Linus Walleij
