Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512878528E;
	Tue, 17 Jun 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147540; cv=none; b=BbJ8tDt/lwzpkwTCzL7MJ21FNIMDoSOob93tzCyWnuLaeiLXPQuFbpHQ+aIVDVC3VoaGVUa+zdrC2HEliRBTxRHzh/ELZo/ych9PosNeQVd/eikJyK+VCqX588g21yvh04RFYLUpGPSlpBjw8SHToiYYUcCDoic+p/Ii07DwH9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147540; c=relaxed/simple;
	bh=hTMkAnOpO3h9kFAXwJeSt50xEMbiPiKvCACkDl+q/V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBibdwjvv7PKK47c9MzvdurYuFkN/5NrGdFV3xpyBL3Aol1ClbAVkFptwuiWi/KYm1R+wkQ1LsO7uwqHpf1EiK5Lre2374/Uc0APNFeBHV/+qO9DdFjdmnGFK3NMGNskRY3a5pvuZrkc/d1ruUDn32uS8tHajtV1eKW1DDbtDwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgtb6/qk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgtb6/qk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3138e64fc73so881368a91.2;
        Tue, 17 Jun 2025 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750147538; x=1750752338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTMkAnOpO3h9kFAXwJeSt50xEMbiPiKvCACkDl+q/V8=;
        b=Lgtb6/qknzoXnVAx0MV/1Zxf5v7fbB2zneKfindTMYl9ni4EflwFP4MnwaabDKmrey
         XMIFOhAHqtcf5Z0tU8zdg3xMVgb8Mi+lG7VhPU4RDb+NeqAkLUKxx4sqrbPK2jMa7WT7
         txLw+J0/tVE1bxY+/MJ56asOz9sBXb7WFyDWAGQpCeH8laVT2Z6QMD7BYbtoRy2RvhMs
         gwfnowVNC46vSXOC0zAgdOPGSucMvo6PZE8PCbPpnt/roOe+JfT0bS0jEy0eOL6AkJQU
         gRMzReUJyMs7YPzFKjUkB4NlowgJd6YDzILIB+I2aDZwRYrZox/FPRNC349DrNi0S39S
         lc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750147538; x=1750752338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTMkAnOpO3h9kFAXwJeSt50xEMbiPiKvCACkDl+q/V8=;
        b=wmDatlTeulTMgtF7BwKbV3n8dyzn3j/ixpIITVsUyldBp1eK0xInnpvx70j7M8KPJq
         VXX6KyoeJsD5JLLqkqdYKJiBkX0IhDVH/B+r3qQoRrcAzoOR+0NE9CqKYsC8hP3rK+OO
         TrRbD9l4bnqTZkawsnL18ZOyQ0xSAinseHcgsH74Lcuq4RRIDkThA5do7TYwow/9nU2Y
         r+0ImdyxfjKMTsHbRT6U1T7V7fTM/ZTzBAh7XWNxVy1z100DieTf0LswD1Q7EwpDDaD0
         ADlnYlcfd0UEpmpte8tL48OHv4LtOqk+5nltRMfXRSsZBXhtFVmL/hbcq2EQR3IFedaZ
         sMyg==
X-Forwarded-Encrypted: i=1; AJvYcCWUuRaL6cje+qdecoRDmz2T5DdbOJyu1naK1jCTtoWszZT7/c+WFMEeplDgVbN2GrBIwGD4XL80ePP921s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQzGxQ9mIeqaKZEaDHf6pPl0Urv4FizdxRnv8Q8SifkGuYHyCq
	AS0wnJqqLfHhcEGAUXXbWZaDiak7IgFJPWc5uw/RGRTI7XN6HfaRgQvrlDv9bcum7d+TBvidjfk
	hPtwOomR/cevxPClhuf3fDglN7Dm7hts=
X-Gm-Gg: ASbGncsWPHK3nI2jT40+UNCmA3eVM7e+8OeyAxjdpBsnkfMFstFBmoL+aSnmsySEklv
	kO0JQwxtXkP4fkdXOwNNfKF/PbOfWMeI6YsJARpTb+uY3PcPwHY85u2UDgjypwGaeVgy7ADEF+0
	g3td6Eyn5x6myqsquWN+c5BxFOdEfEua6ZYJo8p+MTMvs=
X-Google-Smtp-Source: AGHT+IHZKDHyodVHty8ntGGnSDjjROJbytSqRsyWC6kcBmpcm10w2HC8W8rlgeb/Bl7t7NWLgU2VNeoYX0K44zRR1GI=
X-Received: by 2002:a17:90a:ec84:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-313f1b312d5mr7013845a91.0.1750147538432; Tue, 17 Jun 2025
 01:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614081312.763606-1-ewhk9887@gmail.com> <20250614081312.763606-2-ewhk9887@gmail.com>
In-Reply-To: <20250614081312.763606-2-ewhk9887@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 10:05:25 +0200
X-Gm-Features: AX0GCFsFaxv42nHmuQTqqoetT119TRzHdkOJWzvWUay70mcy60hGGbsUDFuH5zc
Message-ID: <CANiq72=QUbe-koU-BEhEJ1-7AafC0kGcG6HOhiVaR1TWqPoLFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] spi: spi-pci1xxxx: Drop MSI-X usage as unsupported by
 DMA engine
To: Eunsoo Eun <ewhk9887@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thangaraj Samynathan <thangaraj.s@microchip.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 10:14=E2=80=AFAM Eunsoo Eun <ewhk9887@gmail.com> wr=
ote:
>
> From: Thangaraj Samynathan <thangaraj.s@microchip.com>
>
> Removes MSI-X from the interrupt request path, as the DMA engine used by
> the SPI controller does not support MSI-X interrupts.
>
> Signed-off-by: Thangaraj Samynathan <thangaraj.s@microchip.com>
> Link: https://patch.msgid.link/20250612023059.71726-1-thangaraj.s@microch=
ip.com
> Signed-off-by: Mark Brown <broonie@kernel.org>

For some reason this came as a "1/2" patch in the same email thread as
a Rust one, and that got things confusing. This patch looks
spurious/bogus, i.e. it is already in mainline, and it is not authored
nor signed by you, and it is not even numbered as "2/2".

Do you know what happened?

Thanks!

Cheers,
Miguel
