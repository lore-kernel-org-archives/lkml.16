Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D711B1FBEBD;
	Thu, 24 Apr 2025 20:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745527099; cv=none; b=ZxAgwbO0ufvdPmMovncAJkx6VcZP4QQ84LirKU7xryAx9atIotymKuFfRbNP96LY66ltj7b3JZK1/b6eEst3YfZLd+St5Io8VTTEEw1lbaU2u4ySFO/x7o9En1wZRRWQl3ybci8/kEW2L8+SLsBdMtGqb/SEFxKKmEWRci59Yjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745527099; c=relaxed/simple;
	bh=Ygqaj75v72dq4irKpGyntOfYoDAyFmGSPseO89Eo9rI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bt12cqiWSxUiHUYLsUpqm6JbDtYmZuh02EOc+jSMmV1ZPGb+kfEBtEyP5HimgSWEJOKTGQWNFRYWA50UWVwUxCGBiuFIznAiYJNkQc19nPa0ZbQkWW4NDlqZ4CzHYkegWA6z1tbxrT6XB4BJpgkkykCCeDb1KwOlBjMScwSw2RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDn11U3f; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDn11U3f"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acae7e7587dso240430066b.2;
        Thu, 24 Apr 2025 13:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745527096; x=1746131896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=brlmkJcPjEf/CPfilIE5vgAHBwbQHUZvBfxT/AodF/Q=;
        b=YDn11U3fH30YJdeIg1L1AeU7oD+7PkbByw04V1aCy/XTWdK/XVWgABwZcYGPvMXOO3
         asD8A0tdFPFr6oO2rdHMVEmXxJecDSNpdMo/Aa/ImYA+5b9pXRoYsqMUG0o/4+uZlIOY
         J4pJJKZn5QPSqcsNfymsKaoPiH40dPoavtgcmXWAHDMLyy1exqE+cDQPOXbkC/2gGH3B
         zPhzedmkt37QsAJZhI75si/AIApYFotLcAdtMbjaSHCLSHlk7afSzy7MFuHdorlRCZLY
         2qqclF6AhYpj594thZrqI1ws69+C6iYqxDjrXBg7BTxuqAKcpCJgCXhSO3w1S3ca1aYa
         yEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745527096; x=1746131896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brlmkJcPjEf/CPfilIE5vgAHBwbQHUZvBfxT/AodF/Q=;
        b=pFJNAi7ATrx042HX2I3fs71HlxNWxNaJ8ZxGGwux7yc1E4uEd+714jP0qJagczPFy3
         vMXbVw52PGSaEhXe45kmdr1N1TcDhhV/oAmtbVG4ArCTy9QrF43hYpNSUebxsVZqmkqv
         knpvEKi3bYrUtmCRj4J0yBmCLTSrwuEaeVcAYPemeHwFsr2YU3dJ0E1A1eYQsXQTmFd8
         40WKzzaLqg8g7UUwajyUaf6V6ydIBdhdsvA01hqllnS2a6kJrjRbYosmoLkZeZbCAf61
         ZT42srC4Ti5pxddALxjxJsT++AoFG/AfDX7yIeldW11WuQ+GPYF5UgV1+PEaQ293y2nS
         uIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSqq+Iira9bbF0UBW9iFMRon5GG7rM8Lw82d9x7taNFlm3qoIjRlRMTbNurUXRUjTp0tBw7iGx7L7r1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7csnV4xnEL8lrFe7NN3uw0dNwQ5YjofLHAhtv1FufHX+2NxR
	gMtNvnkdfHFgpOVa6sELve3YJhhe5KTIwTSBoVU6INbfwn+QfIEvclG05KyivAElMoun5E3x3KB
	oVjqtgGRFhs3RjN/TigLYRW065OA=
X-Gm-Gg: ASbGncs4TaEJHeDwzLAHlWnn3KRgPgE1WNg0JsvR7q+ZSo3w6LGfx39lq+zy6Du42oV
	jFR0DQHvwmVcc0Hxt8ngwTh5ELywpoZHDT3QZjwWxWBHK9nBFM+NaJ6OZrtRGQlS0VJ8UixAs5a
	dlCwnZJYf/yx8g6hUOoGzgcI8=
X-Google-Smtp-Source: AGHT+IHntwsNNx+rA52NEawdVBcoFlvfQsnUvq20H6PAf2EEQhxAIXrGo64zntYCiBI5GVIROy/rIzvrVjgUmUGXFxM=
X-Received: by 2002:a17:907:7f87:b0:abf:6f87:c720 with SMTP id
 a640c23a62f3a-ace6b3f9592mr102861866b.29.1745527095767; Thu, 24 Apr 2025
 13:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423194958.30715-1-linmag7@gmail.com> <41157e81-0dd9-4950-b9b2-245c0007d2bd@app.fastmail.com>
In-Reply-To: <41157e81-0dd9-4950-b9b2-245c0007d2bd@app.fastmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 24 Apr 2025 22:38:04 +0200
X-Gm-Features: ATxdqUGvoQIN1uzyWcCqWCLpL5sPZkq173ISx4ax6bqo3t6C6EAYJwwEmrUruFU
Message-ID: <CA+=Fv5Q6pmCZOm1CE9uoW8YNQtbg8o67ACDxGGjLUy+-KtfVXw@mail.gmail.com>
Subject: Re: [PATCH v2] alpha: machine check handler for tsunami
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, macro@redhat.com, 
	Michael Cree <mcree@orcon.net.nz>, Ivan Kokshaysky <ink@unseen.parts>
Content-Type: text/plain; charset="UTF-8"

> Should this perhaps be part of drivers/edac/ ?
>
>      ARnd

In that case we should, for consistency, also move machine check code
for other alpha families as well. Some of the machine check errors are for sure
"edac" but the memory/ecc error is just a subset of all the possible machine
check exceptions. Stuff like power supply errors, temperatures and such may not
belong in edac? I guess it would be possible to handle machine check exceptions
caused by memory errors through an edac driver and the rest of the machine
check exceptions through the "regular" alpha machine check handlers.

/Magnus
