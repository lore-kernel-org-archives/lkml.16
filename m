Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF17827FD70
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915944; cv=none; b=Xb3GF4vNxn9BeG5/OUzWksRumjAXpddHyfRazVEwuof7O0PuUezvMGDUstbR/XTBOG2F8F68zfgFG0FtzsbjzkrxBRaaeCU/6ikf9kABVMtOPiMlErsK9dXz+toZ9stYl3omdxY/pYCwD7fWA5virX3h/K5KK6msargHU7ModyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915944; c=relaxed/simple;
	bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QF2W58SPU8iFAwMf3Az3WhvCEFZnoj9YgSSjkIf9EEKeQ+UuqjL7hvostdG7Zz45xwrygv0oYv9JXdDPrYt3t2KRnubUG2enfibH8pWAWHX2u97AEkT65+BUOjR4pLfgJyEyI0ESUBxHuJDAVNV1D/Wox8XwRPF6cLOOKm4tLZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdjReSTG; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdjReSTG"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfed67e08so59859771fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915941; x=1746520741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=KdjReSTGBvgTpmFex89UFPtuKi0R6caIge7o2xrES9RIix3CJeOEdOZGFMcpVi6bPR
         d8brQ8PDTpRDM6cE8RVQa6TF7RxLAgPzJag29qIfiwR3Y0xs5zEO3lNpYq71Nbg28iAm
         7NsitqsynazK/p3V61iGztigWAiSMFQahcXHVlGikOI9ty0SWSyUZc7dhM/RONiM40ju
         c9EGjywhnwtNmhooGGNg+ki/eQIvRLaY8hJapLNLc59yeN/NFawHKSCQkj4CgZ3NJA9o
         OLbWwamhYtKZrCTeumQd+vildwSN/hCrdb3KFPidi/RRwBRUfVw3s52ZUzuHNEEMVYmK
         pQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915941; x=1746520741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJvHqnebj7+LXJjSH0Mss95pSFkkrTByr1+7aZOP8NQ=;
        b=AHSW1wqylLYV3y7auZT+IOmFRHvOG7vKaMG+vyPMn3HLt3giB2eQZKA+eOOgmG3oxF
         pVx50Zkqdyy5nfwcuwtRzWEDsBeI8xQSQd+B3mwtn9Ducdcka269Llj87ZWA6A3oLPnT
         dPHvHEvpmFMyniK4DWMMQ6DRPfuoWqk6aj4Hrb30+msjarPJSKyIClzv8Q0inevR5ZXN
         ZDRitYazrtWmL2IGsuby7x9QcRYPkPnfm5ydMsNuwz2LizAyQ0egZPZF1XJCAYEvkfqY
         Ua3OmE+fZwdsubBDaPuNbkvgshRcHQ+aiwdsgXkqu0/eBQxjue25HpnOGt2WgusY+9LI
         F7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpHl7W8i4hZEaAY1OBGso7YhYcgvzaveP6qqL9Y+SN3Ur9GWGFvIfZBwBq4a6oY2FOjEu12u9E6axWWFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmtk0Ln+QGwnLVTGkkW0C8MsT0shRbf+szPAz7oT27EwCEtNv9
	nXhRFZdaEGkV6LyvtkWJMmvjW5jOUMqSXsgd1MOSADcW9Bqz8qvs2Elxot/LrilM1zkJZJmFr/z
	m+CE/PeuUuLYT4hBpsR6daFJqsofxrAP3Z6XqcA==
X-Gm-Gg: ASbGnct7BW0Sb6nwhwtDOo/FwIFjMvG9HedD7L0yOtYLNfe/d1O4L4xBkARom0BziDG
	N0i/9UOWYeW/O861sVbN4id07l4f/nrfQ4zWss62Mr3mytBAv7rlP5FLFu5IuOEnoq72/c3/1i7
	u02979rkU4Mf9yhB8XCoXOwg==
X-Google-Smtp-Source: AGHT+IHkuz+Fr/AzkwRns1/8PwMuipfYmUnKsBB7y+2XYRW44rUzmChg+OFPShozfJlNPd9b1oQDGXqsThys/IDroaE=
X-Received: by 2002:a2e:be88:0:b0:30b:c569:4665 with SMTP id
 38308e7fff4ca-319dd7960aemr40874831fa.29.1745915940769; Tue, 29 Apr 2025
 01:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424131201.157601-1-colin.i.king@gmail.com>
In-Reply-To: <20250424131201.157601-1-colin.i.king@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:38:49 +0200
X-Gm-Features: ATxdqUGYIHeg8-bt7mFBhXIoGyjQbbgQkhokYrl1ZFztjgdxtKATBXtQXvjtsjU
Message-ID: <CACRpkdZf1KgnYKXbCWEWZA4Cd748HBHDh6Y6f2OD3Oyshoe6YA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix sizeof argument pctl->eint->base
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 3:12=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:

> The sizeof argument is incorrect when allocating pctl->eint->base, it
> should be *pctl->eint->base. (Generally, the size of void * is the same
> as void ** so nothing is breaking in this specific case). Fix this.
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

The mtk eint handling has been refactored fixing this issue in the
process (AFAICT) so the patch does not apply to my devel branch.

Yours,
Linus Walleij
