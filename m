Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02253172BD5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 06:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745042629; cv=none; b=vAkXySXTzvpr7sXIjuIJ4p1vB3tWKugr+r8MShIce+N9UbiTvb52jCJXPMc/90Mo9+22s8x0WGVwomCXJ5B63rKAmPpO1I5uR//jekPbjn7u3qcfJgd5Ll0m987N7URMJ6S5LIbqc6yKgMLy8eAfCSMsed0I+MJ4kj1iDAWdWvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745042629; c=relaxed/simple;
	bh=dBw0csETq4Oax7D/gIJsoGLgmtl6zPN0tQTFG8GjEtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QYh4Qpz4VzNn5D01BnUryQ1vcHmzpNBnu3J0uCph3GuwZEflAqKn2mUtZ8KbvzXSCVJh1mwqQU6n4RUEj9dzU0JJQd7d8/quwAdqO4RNqIQg1ER+Ujd+1h5bMXddQqETlcsfys84zs4L8TOwd0l9mgp/TGC4GmgEL7lMV6WoKK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rGD1hFqv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGD1hFqv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225477548e1so25124415ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745042627; x=1745647427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lTgQTvZYqN0TLCj43/V6Q2NyHBYHePk/+H2FCWatKs=;
        b=rGD1hFqvX+Qm6W1NKqWPKkkt1ZWZso6vUSwToAeQtLPVmc0f4UXf1eiLnelAbpyFE1
         w4r/Xhmmnp3hsZ2Zq/QKL9U15uIr1ifSkhEzPDvlgC1lsbEy22YwZlbnWI2E/0dIoPhu
         4ONYm2bnYZnJkfAOBNCteg/sZ8OYHUp7tOZfSAaPPbyr3FJXhgGcM/UtAXJrdW0+Ivii
         1Hm/xEEOhsrussOzGVNRb1AaGRpKRTZVYsdWxpFdSUlPYEzLAros98ddZ7zP/rxhw9ya
         reYIHc9XrTbphu3gXEWGVWstuCI870N1Pm3XIQZky46qCavtj5yaAGrC0nGIDxnbLHKW
         rpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745042627; x=1745647427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lTgQTvZYqN0TLCj43/V6Q2NyHBYHePk/+H2FCWatKs=;
        b=XJUgYAxFc647cAUnKq9KtJqU/tHqDyVzAVpmAXCxjcxpS0hxh85cOeqQzYiVRJWsfi
         y0ynZJ1B/38kK26yGsDiPa46apGg41N403H84obN0Pl1fH7/na8z4BE5oIzXpZ8MW17J
         vjHacfMDfYF+aUmw8LbD1Gs25Wy00nnNUyKV7F4p98g9OzaPa5G80SDy6zHdWHqRL4X4
         arHIi0XYmWmGxvqd5cTmIkmmHHJ+tBHUYsrFNiQ474JsR4LVv6HYAakm26fTCW0yjli7
         KevbrHVo5gwXYUBLkP7Sk42Wl1wz6CGzfWM5o5A7i5luVL3csPKgnUJ5NbdcsJnBGMg4
         VOSg==
X-Forwarded-Encrypted: i=1; AJvYcCUn3TevbOxrCmEkhQoRhaLR7EM/pliLY/HLeLjj1aR2UD1u1x0iFy1LN8B3C3GSZ+NBn2QNK/jeTk3UGAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfS+X4nGRRaWNKGQio7x6RWf1g5W8wjlJfg5Z+rSzz+iw2WVy
	hPFQ8RXIloxNCGYQUivXFs3LymmfVTTk2Rbvml03fooodTTUWr9o6vsiWX59uQ==
X-Gm-Gg: ASbGncs8TaufKsUt0/F8aCgtQiUzXhQfQJJzwmkRslRjR7XxGjSgz2mpCRauOHvQRh/
	ENp4b5xi032gQJXNu1YbWi9WqQk5tFIv1VfROndrlggyRbqXy9S42rxDyXRhVyytUDrurSlQx8U
	jXW8xpJu8bAsb+ZSIYjlV1MyUORb1fjV5DkOuLep1UyuAv7767vjIC5X4YlmQH6iYaQvEPsPfBo
	OD8IGqi+5hanSZBs2EHcFaOhQwzfzdIRX+jfVkV12TFx0ik8G9+tsbOnYqXO5fdLep2y6opM8av
	LjDksVtW5mwZxrH97GyACLlGCCRc1RyVtd1n++5/nVDTFfORKlHGXRnXFHFdHCCJ
X-Google-Smtp-Source: AGHT+IHe7z+mwljypPJwxHYQDW6Or2SxhxqJIzdabeYhZVRypfM4toLH9er4he0mUfYtnDMuCNfesQ==
X-Received: by 2002:a17:902:e546:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-22c535a7ec7mr65152705ad.23.1745042626951;
        Fri, 18 Apr 2025 23:03:46 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bf7ecsm2609173b3a.31.2025.04.18.23.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 23:03:46 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"
Date: Sat, 19 Apr 2025 11:33:32 +0530
Message-ID: <174504243663.11666.13632057141942882562.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241107153255.2740610-1-robh@kernel.org>
References: <20241107153255.2740610-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 07 Nov 2024 09:32:55 -0600, Rob Herring (Arm) wrote:
> The mvebu "ranges" is a bit unusual with its own encoding of addresses,
> but it's still just normal "ranges" as far as parsing is concerned.
> Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
> instead of open coding the parsing.
> 
> 

Applied to controller/mvebu, thanks!

[1/1] PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"
      commit: 506d34571e2f204c991aefe3f1300175907594e3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
