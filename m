Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B6ACA4E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302497; cv=none; b=Ox1Qom8G2G0OhxtCID1011Ugxn7D3cgrJh+oRAAwo8VPiMpnu3LTBpA4aBq8v5Z2WL33RXVvZK8a6cqPOrvGL6iBGW0tRkvaoeJTdfdhyt8auOPkbNcZes9Pdr1LtgGnALvYyyZ4+oMNXzWZ8DkTEk1F/fBQ55L5/514s8R/GZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302497; c=relaxed/simple;
	bh=8iH5zt7m2aunpgIkSug2a3RaZ8VuwL6eydGausZFMns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKb2UNnhXHlsZkyNDIsATgUgEyQX+pA9RZ87/GhjKEH85+cEPJpzmA9E5vD/0CQcPV6omN+JO9VMMW+w2Qi20p3hRYZP/iY0tHvVbH4RWTTug36Ou8/pssO87o5mLM0chYL5FI3Ba4jOOpxBruPJ4SHxMnCHIruAA4WD0XkaurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQhKmewk; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQhKmewk"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0dad3a179so736135966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751302494; x=1751907294; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8iH5zt7m2aunpgIkSug2a3RaZ8VuwL6eydGausZFMns=;
        b=NQhKmewkqDw+nZG1lhVx8VczslVvuZoJNfqTuAJGbpObocB3NXxw8nMXlD80H+0wAs
         Xpk35NSyPWDzcgcxQqrtzdyWtz1Uzcq9a0jiBB2ITm0tUTVdVgNyEOMQEnL21Wg1mwJv
         GLpT631h1sdKEM50o/Zq5eAAXGTctG2mHPNiwGoWCEV1vGLU43OWwnZO4xJaAsmayC6o
         SBsMgYMhvrDoiiBnbCujVBKkm7XtSgVBVXtojfcc9sXebZSMUmUScm9oFK+ygaJaOOec
         u7ZMLH2D6jk3YiabTk3RqPyWfLP40Lds0l93DebhBgWaOdIozwHYeGtkdbA6oq7Z+P6T
         FjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302494; x=1751907294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iH5zt7m2aunpgIkSug2a3RaZ8VuwL6eydGausZFMns=;
        b=vNd4HLxuRJK9NC+lBxlYkTPOuAniHS5B4fqToU9B6tmGOZFAq14HPPqBf5KNp7vKyV
         KjJnULYvmdsjSiwZebOZnvousQPTBP1IRKvULmHQVkhJAKKHcrIo/jGlcYULaRDIzEtF
         K2qxACfcQ4JzUYhKHmxo9sySrTASlI8XhEIMY9LFGQ5h1F6GB6XSKR+pNmLzrG5dQ6sz
         B6g9K7j9/OWBNVk+vRiiS/PLE/cmiT/SS4ggzm4IqMbchAnsql6N/hh590Lhzmz0FAtG
         zRfCwVbOGem585ggx3DArMjreXTCRtNLclGyTKW6YO7Kk6yj8Nf6BoiFiYWEJLCazzZw
         t6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAdm7Q96w9m+9LFiWVISuYzPk9ezDfGJM4QFoD73W8OOAvoYPfS1VT7yhMGgB9rRCdjIwht6WbdhxRorU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXl9Y+fPU1u8/BpbRMfv6R6U3wJJqARy5nCsxbyBBThJO0y2m
	Il911gwS8Ypq9K9vD03ur1mG1kLlPpytPYrNou/w6NgmTQGPxfWJr+4OnDff+fyPiizoFeo/np+
	+gfTgIdZBcTOmaGOfF/v2xc5xys9FS5Q=
X-Gm-Gg: ASbGncuAZT28G9HXCU/pyGUyzyVDHtBN66+/i666G+ovrcKhm6fre8p5qz9smLyKrrZ
	zPXZTW6nhHZJ6bJks+TVorOggFvk8aOhs2l6iEI0CF0q9WOEt8PfgXDmX1pVgtDn0pejKGtWQeQ
	3kMmwU8z0H6Dp1BfxOFwSMZHL5aPII+zGCoMIM3UZjxfFab4iTrcLRosAcIJwtOjZf6Im+clKpO
	qOf
X-Google-Smtp-Source: AGHT+IGrANN63b/Glpkrd6Y7SNgSecVppb7ra2gdNoR2AFpwrVu6cxECycxYjcH4jNK8Ib0cVmsoEOa0rEyWDaHU2OE=
X-Received: by 2002:a17:907:972a:b0:ad8:9e80:6bc3 with SMTP id
 a640c23a62f3a-ae34fd06149mr1288723766b.1.1751302494009; Mon, 30 Jun 2025
 09:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630164503.399835-1-pbrobinson@gmail.com> <8ddc17b1-fd20-4cf7-b9c3-d002dd1aac8f@broadcom.com>
In-Reply-To: <8ddc17b1-fd20-4cf7-b9c3-d002dd1aac8f@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 30 Jun 2025 17:54:42 +0100
X-Gm-Features: Ac12FXxanOdjxPcgEBwapHOtbwLPF1-H4l5vz3zq26lT6Tx7Tk6XHgI5bmMw9ZQ
Message-ID: <CALeDE9PMrnYpjci0GnxDyPsYa7J0ena0ifJDLsHWR9EFL0MMnw@mail.gmail.com>
Subject: Re: [PATCH] reset: brcmstb: Enable reset drivers for ARCH_BCM2835
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 17:47, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 6/30/25 09:45, Peter Robinson wrote:
> > The BRCMSTB and BRCMSTB_RESCAL reset drivers are also
> > used in the BCM2712, AKA the RPi5. The RPi platforms
> > have typically used the ARCH_BCM2835, and the PCIe
> > support for this SoC can use this config which depends
> > on these drivers so enable building them when just that
> > arch option is enabled to ensure the platform works as
> > expected.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>
> That makes sense, I would also update the default to expand to
> ARCH_BRCMSTB || ARCH_BCM2835

Will do, I erred there a little, but I agree.
