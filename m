Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB933F9;
	Wed, 23 Apr 2025 21:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442396; cv=none; b=cc3syOh4BA6AXIk0jchChSFqQuxiSskEn20Iar0Ier/mnEGx0BzSj4e96WILxEKXPOyqD1e6quEcVWNuXLM1uBoKfGumIleVSmbLWvyP+zfxZ5abwEjpnJeeybrmSTFWdGnCo/qPYg1hsKh1TvfXR9dWyjKjkivGUOI2KuQ84bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442396; c=relaxed/simple;
	bh=N4QKT41EBNf3HAkmFM/arySxeneLArpbylTJ3iSI5tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=htXonxA74rHbNw8Td7Fi7fskj4JtYPgu1rtqBPUyKxiCBWcD/nc0EDp7+Et/pMiiNhT8s8HfRudOXb08OobB4vdSbyN2CgLjvTL6YOlw5QkOSMHd62LElBcxbtwpp1J1186Lr6ppxIvTioLu/QBULOQ6d/GNePHnhbtpBJHCxt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpoUCWo9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpoUCWo9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913d129c1aso240679f8f.0;
        Wed, 23 Apr 2025 14:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745442393; x=1746047193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4QKT41EBNf3HAkmFM/arySxeneLArpbylTJ3iSI5tw=;
        b=mpoUCWo9g3WOgSIFycOgY8R0I4Utog8So4eU3+E/L3JuUVFsaRrBtsityybwefAQQ7
         dz3YM+z7CRQnhtAdW/nMkWY89u1ol3yS0MXbdeWPj3cQ5k3KkDluQudcqWDuhuzN4R6w
         09LV4ot5RQ4hSe13El/2szeDT2qOU0DL1USltR+QK91ixdatCDuzBZ7eM2Sds9w5qG5e
         Mxm70d+EbOGgtJDtOIYuIS+QH1HXYQRJSAS9O93UBqb3AFSulT2pR+PLvFGZ5CqcN3ov
         nDIDTaJSa0/0iOUnZr+5fG/4PpUNGHjrHdtlBi2evotZ+q5wxVXPKgVkYyvudoCCwXAe
         cTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442393; x=1746047193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4QKT41EBNf3HAkmFM/arySxeneLArpbylTJ3iSI5tw=;
        b=QotRQjdREos0PcGFOJhmxjYQrxFdFlnwy4bvPwwLmYgjJi01CS5rkY1HTxDQiCM7lN
         bgoK6Bff7J16kZVYt+OSuPn4dETcON2EAzjHJBc0gakyQBAcvKd5/dzXBNwwioqed0Sy
         8JtPQKvF5rYsxgvDL0XmIv8f/LmU11REZJRDBi2joAbWA51VrE0+OptnqvP6JZqcLtHf
         qfA3LpxhLBuqdqqvS4IRYMEFJrSiMXBDjTpaLeYzJnRH63F7Xfip9T+BQVCUfc2ELhLm
         DnIvy/towyGH/Etj8wkUh6sMtXlKj2P/u84Gm3m9AT5wPiDc2b4fKL5zaj+9A6rjg9zJ
         Hssg==
X-Forwarded-Encrypted: i=1; AJvYcCWKaXZllO04nKCRep6k7aRRPgn2FG3NJebLd5ZEwDMcQsvRty/Ts9NYQ0cuVQWtrWUoMOT1IZhG6oiVf+vy@vger.kernel.org, AJvYcCXVvueWp/dH6jee4cwwPBCkM9AkYFzlecwaICbqdxcYhEACW4rawTEjlnrXii+S+nTYFdeDWZz7G2kGWKwxEWkhuXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4OqAz0sCCZ1iDUprqrl9P1vY2UbX7MNZ5tOl43sVt5wB4qKcS
	uwA4FAbyV1+JeeDkiP46mIz4ZFK5uOQC8I1/jzrvnCLNVrxu37Hk8ktbqQ==
X-Gm-Gg: ASbGnctxLsYUUjV1ODocw+4CXQ4siBTEd0Kgi9GwFpzzxqr3kVYAeS7P5VeABmu0RH5
	fWLbFU4J3Dy0l5W9vMeLQoo/z2qfFYgiIRlymN9Q2/lDvYEV4dkNze0z7Xch74g20p12cIxrGyE
	5rxLzKtFdFz9rKJr73FaCtrEhlJV2OdqugBduTDUu8E+MSPxdhjNsbhXUPsxXTwDtuT65vfhVo8
	+gC2inGS86gyhhRb5OYz08aAcn9jhIJA/aL6Gde4JSCdLWtRrHY9lV0wJ6LwcDjdC3FJjSGPEg2
	i5l2MzEo7aar2yh4bbDryyKHqoAoWrXETSBWaWeVjzqBi1vv8CWSMZfxupt9FPC9yLDILts9Daq
	cFQjZuJKExOdV
X-Google-Smtp-Source: AGHT+IFzXcduj7t+Sv67G370ODGZktFo13iDYRhymgWTOUPa8Usb6dAgzSTDy31r7r8+cgsZ7cFkFA==
X-Received: by 2002:a05:6000:1886:b0:39c:30d8:32a4 with SMTP id ffacd0b85a97d-3a06ced96eemr23672f8f.26.1745442393292;
        Wed, 23 Apr 2025 14:06:33 -0700 (PDT)
Received: from nadav-asus.lan (85.64.206.118.dynamic.barak-online.net. [85.64.206.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm19935327f8f.70.2025.04.23.14.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:06:32 -0700 (PDT)
From: Nadav Tasher <tashernadav@gmail.com>
To: gregkh@linuxfoundation.org
Cc: cve@kernel.org,
	linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tashernadav@gmail.com
Subject: Re: CVE-2025-22032: wifi: mt76: mt7921: fix kernel panic due to null pointer dereference
Date: Thu, 24 Apr 2025 00:06:30 +0300
Message-Id: <20250423210630.30822-1-tashernadav@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2025042316-silk-brunette-213b@gregkh>
References: <2025042316-silk-brunette-213b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the hassle :)

Nadav
