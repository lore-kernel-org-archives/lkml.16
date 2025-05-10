Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0A822F392
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 17:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746899850; cv=none; b=rTc+meuqOg4evk+l9u+b0wwFRBoLR3XRegEhcfDe++umQCqzL6Q/VDt3ILUohNQ+epi3WwuphedDimongnjLEWmtBGLgVppGqtGByT+dfMnZOJZjJNw6lAPTjn+d9S1EO7AUjJEhvJHrucy8h7q4Cw9Fa4ERA3SEcrKr66iiHNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746899850; c=relaxed/simple;
	bh=d34ipLqVZ9iGLUvQ+y5HF9s3GNDo5n5UVO0m4PXFUMM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ERGX/4DLJlWFGM0O+CgxGXG4ReRC/FTHpXhflLooX7RTTg4tT8CpcKj5VSii7S0im5CCyHqSiIC7g0pdwZzHktZRjhSaEk+Wnk8JpC6tbp2evMP3qX59q3VaIPYQsCZ3CqnmMsEtFuOJwt244s5c/iuXlaq2GZkIZlXTn1Rldqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ml5p0kfC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ml5p0kfC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso21513975e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 10:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746899846; x=1747504646; darn=vger.kernel.org;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d34ipLqVZ9iGLUvQ+y5HF9s3GNDo5n5UVO0m4PXFUMM=;
        b=Ml5p0kfC1oimuhd8zURVIseQ3VgTDQmdhH5n4EgSpKpUkI5qeOLs/XrYSMRX0Yi9D5
         fH00pTfiWH2N57uhEE3jdkvWWDxEG7lhXCET/0xnZLaRQaa8PNwKN75xNA84L+MJ/ZX0
         PkOvwJ1wHv8qSwJ5305eHx/WErugQN1DK94OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746899846; x=1747504646;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d34ipLqVZ9iGLUvQ+y5HF9s3GNDo5n5UVO0m4PXFUMM=;
        b=iyn2Fsijt2SBNMyNoiI98S2Ub9II6rK5Goh73eWz5BaRo9z9alKoFZc06hzU9Se0w3
         z90llCa2YLqaRAbLOUSArtxnhOJlZfXVoqhxWXzb0EbwMrT3zr3+X0Y+ZzTtvinwmDsH
         fu+U5RxuvKmuk8ulhVi9JDRiG/iuWqdFT4sciDfgtCrYvW1bLdAmi8PQeIl9a+y+SXmT
         uR24P5Np+Kp6LmmIgKlJDcEFVl0ZmpBbEJQRBfCZif+Bk/K9paBXC97CHAAF4ka3n5H7
         2TfN0qN4NUePK/Jm9gz/3uuOF1E2bqXJRbOI81wxLKgdIfFs+F47Tx5KmanVkCEo2tMX
         MNKw==
X-Forwarded-Encrypted: i=1; AJvYcCVVaoEbABvHg8Rp7oWJ3G8Y3BKOkpVoe2P+KcX8hIQY7NRBLoeiibhlkXKkexGuhEXH3YncskkIyMm7grA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJQjGcVDRoC5sEUh/Z3OaPCEtVqa0b8tf4MIWqHha1J3uBvb4
	DuKZFQct5C/mtGjjgcPbVXlC1eke/WsTBWqk7NCzoPnFVvzACjtHR7ZWNyV84A==
X-Gm-Gg: ASbGnctbXZ8gvFJU0JQKGUvu457Fu1TIRd6kLMHzrmacYYUylwSYchs4jhuFZEJlu1k
	0B1Xr+uerrkF/bmXtzAg7867WglyweSs4q5lo6a57Kn+5nvzXWA9z7Jx80z5rzwmnnT3HcqSG8a
	4Snm4e9+mgNnpwAhQORkcAVj/Yb0/gc5LbqLwQGrXi+3+xeSOax2u6k4vxRmTsGTAiw17PtJBaH
	koGK4h1sYrr8H9j/u7+BKK2x/nDSl+EQjYHTUNp1iDXlIXfTnB/p4HU5nG+WPFVvZfNE/XRqvNC
	yEmf4BQed2c2XEv9bp21uBCxm0ewfM7GD1hGXRV9nMVZQkgmiYL/G2G8Ps154UAsJ5/yVHVrvJ/
	x4KTxjlehNbOcytcngYsSgbqVMXk1AyejNrJGeA3JX59P1z/KMRQ=
X-Google-Smtp-Source: AGHT+IFd2LnzlZ3nhJhhZUlH+mzupRSVkBvDToFErP6/IOhrQ2ZLeF9KLFljIhby9GdMo6RCH360iQ==
X-Received: by 2002:a7b:ca58:0:b0:442:e27c:48da with SMTP id 5b1f17b1804b1-442e27c497fmr8459775e9.8.1746899846307;
        Sat, 10 May 2025 10:57:26 -0700 (PDT)
Received: from ?IPv6:::1? (2a02-8428-1d82-4101-9376-9a2f-6774-5cc6.rev.sfr.net. [2a02:8428:1d82:4101:9376:9a2f:6774:5cc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm78696455e9.31.2025.05.10.10.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 10:57:25 -0700 (PDT)
Date: Sat, 10 May 2025 19:57:19 +0200
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
CC: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: b53: implement setting ageing time
In-Reply-To: <20250510092211.276541-1-jonas.gorski@gmail.com>
References: <20250510092211.276541-1-jonas.gorski@gmail.com>
Message-ID: <B4DA2F66-16EE-41C9-B816-3C5061A30C20@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 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
 3LBXw4WCw3QhOXY+VnhOn2EcREN7qdAKw0j9Sw==

On May 10, 2025 11:22:11 AM GMT+02:00, Jonas Gorski <jonas=2Egorski@gmail=
=2Ecom> wrote:
>b53 supported switches support configuring ageing time between 1 and
>1,048,575 seconds, so add an appropriate setter=2E
>
>This allows b53 to pass the FDB learning test for both vlan aware and
>vlan unaware bridges=2E
>
>Signed-off-by: Jonas Gorski <jonas=2Egorski@gmail=2Ecom>

Reviewed-by: Florian Fainelli <florian=2Efainelli@broadcom=2Ecom>

Kudos for wiring this to bcm_sf2 as well!

Florian
