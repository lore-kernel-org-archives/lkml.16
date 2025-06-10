Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AD828003C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543116; cv=none; b=US4QBfrXy2lffJNCrXgmg9H+uJP9HvI3XQQE5Rko3SG6lIcUPv37dCXuwvQm4k55ruERSJH7Krf94mcsK6GwQITId8tSRJ5ljBzFJ7EGB+iAlqAbE/9dALtbFfPxPA2hWMu46m3ol6uuVANiH8V/LOmAAo2Z1XAd+gm4IOviXuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543116; c=relaxed/simple;
	bh=UTQFUFyTCloQz9r22/rAhw6t2ufs+YkZOF9i5ZRNggw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSI7BHvhGAlzDbRLgYQeHRs0AlrjPGcfeJaPpCFtFuT+ycrQeu1W/PnVlv4kPt4mxzk7jyqt9eZegnSY+RLkTKbAQ/EGxCkVqdyNiyBZomLcnDdXC8vgNnarj6CWiU2UC/Xdp/S2tqq2coUkC/7Grs1mOCoRqx3I7t0vPSgomFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r6M4FAOy; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r6M4FAOy"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55350d0eedeso5316984e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543113; x=1750147913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJtbghu5MjLd9wlOORYf6KoYba3Vp+Epa5mRcL/Qk+k=;
        b=r6M4FAOy0jzOe8cidAbMdDFcFmucAZwkAGH/4lDjf+0ySc8ZSMtYRYQIWk2FE85+Jx
         Xr6WRdCOA5EBtRkri7GB69srh8/V1bWnGGwgttbaMEZfBO9aMtOujYOMsittBUNYZsTh
         VB6rDIdKpJ/X5UMdpoQLdTHYktmcuYaKS21FZBv5dujozpeoAb0Bt82uUaMp+JkVpPIy
         HFcxCgt82Q5Ss89sHLPUSFdzKRzZooyjMUHGx1mXYn4XbG0mOaajHXonNpMBOManWW89
         4SFrlAF87wKY04Z01Lc9d6aDrjpPF80YVxReT4WCQOQyaUmEE46G8VHaOA6UwVIJtDDq
         jnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543113; x=1750147913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJtbghu5MjLd9wlOORYf6KoYba3Vp+Epa5mRcL/Qk+k=;
        b=O6D5lP+JbSoVKik13elnZ+PIKTcjFi6Rw76yjmnOdAbmnGtpqr/JTrhhOZmg3h5rdd
         PtSSiv0vkqS/3Ufink1m6QtnR5kzSfL+9vLmeO99r1p193KGWuW+fL0MaMLl+XuZV0Yu
         janvK0t4Lp7wCT4ySuyCt4nK8okwwW2yXwajwOnzUvajIP0iXOKvVekUc6CGfQsc9vCL
         hu7dfxKVA22eLMyYC2w23acqzJls40dWLK0Q+fm6q+naEwGJ5+23Wrx5iCKPlcR6jFWr
         QNRTQj1NviWJp1nerF7iR+ikW1+zsad9rRJVC/KVeuo9Xp2ss99or6gUnUufyvSOQKxI
         8glg==
X-Forwarded-Encrypted: i=1; AJvYcCXyiXH2gbKQwwyOuRe2o+TCQfbnGEums/Z/8J3E6BIfzKa8082O1AjmuMUPgTMPYEP+uOQgKVNGnMDxCA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEMqTy02qlkH2gAm+h9wf84wtScVuQwVKpEpljCRmpwpYbRmpp
	Aj622HlMdic10TFH7/MUl+UPzFP5kJy2490lOgLA5v5CwkvEJVjuoTkyGSpUYz8LjgQScc0q05/
	p8B7oYCd/2FWqRGiKi0xYVaiC6+a55wWFJq99zf+dwElGMogVp0EK
X-Gm-Gg: ASbGnct7XoB8SdMFAI8jcmCCrBfwxR+fCnOZP68nd5T1sSOwfw2C9rfocX/cQAROsV/
	Yf3ZL0gx3Y8T5GcNMTpQhz6C6XHrn/Tm1chv/iLz23b2rRwHu0LPA1Hh2jM0OOHNSnajRxq2yRx
	ytNBAKmAaRK4KdIArdd2paa7gr1rfk/I4PlaAli+j/qH4rHwjo4isC0WKQAbFt49HT5+ab+Sje
X-Google-Smtp-Source: AGHT+IEdcUwTs67oKYNKfNvvDZgkO7SOMiRX1WybDEE10tjxivAeZ04qb8n5eXb9Kvqxo7q26bda9/VNxF/tQA2U5XE=
X-Received: by 2002:a05:6512:689:b0:553:33d5:8463 with SMTP id
 2adb3069b0e04-55366beeac8mr3710105e87.24.1749543113066; Tue, 10 Jun 2025
 01:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f60c445e965ba309f08c33de78bd62f358e68cd0.1749025687.git.geert+renesas@glider.be>
In-Reply-To: <f60c445e965ba309f08c33de78bd62f358e68cd0.1749025687.git.geert+renesas@glider.be>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 10:11:42 +0200
X-Gm-Features: AX0GCFv3_axzdZrKIaygxDW6_olXhlmKsx4lOsipYwivzmRNW4tQb2DarqWo3sk
Message-ID: <CAMRc=MdbA9i=SRyPV8jtHqoxgPobdsKCCWgyhMH34=Y4eHrkaA@mail.gmail.com>
Subject: Re: [PATCH] PCI/pwrctrl: Fix double cleanup on devm_add_action_or_reset()
 failure
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:38=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> When devm_add_action_or_reset() fails, it calls the passed cleanup
> function.  Hence the caller must not repeat that cleanup.
>
> Replace the "goto err_regulator_free" by the actual freeing, as there
> will never be a need again for a second user of this label.
>
> Fixes: 75996c92f4de309f ("PCI/pwrctrl: Add pwrctrl driver for PCI slots")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
