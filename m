Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72C635893;
	Sun,  1 Jun 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763112; cv=none; b=Z0Vdda3ho8IFsfHS2DMYn7kq6J7qc3wOGzcbG5MyZj/yzCY3Of5Brv2S4JUywT1qsSEJBwMjaK3zJYuHdj0RQAh21v4EpJphGgc7m6NR/YZOvMqBVbWUyGu2fwXCWcKTpWCQVB6HHZhpJStu6hKQgEaKLZd50qtHTk+c+N9exF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763112; c=relaxed/simple;
	bh=6Gr5EoWy8Ket1um+xPQqA9JTH1/mAj6D3EPFq8+6IzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3pds7pbFw+phjuxJxv6uLsaywc5ANkknqCWrx3FXqvti78MzfxwXCOb24eQ/Yxu6rrEL6tugkY+aeBMEsOewPpAnav7ImTYibjrBAKchC4VXF+xg2P+YwkLnw2EnV2dUZEoLinUUzoDaSLmzLbOhC2DOY/FT5swyMERJ7A/U20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQPfjXeR; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQPfjXeR"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso635083966b.0;
        Sun, 01 Jun 2025 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748763109; x=1749367909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gr5EoWy8Ket1um+xPQqA9JTH1/mAj6D3EPFq8+6IzQ=;
        b=NQPfjXeRPC5sBZ4MBbHSwbHIGL2mvv/cN0CiqNwUWs8nbJR7U5I0Uy0Du1T2l4ATRF
         +b8Jx/S+BIuZpkV/ZTLoRWAJeFU4t1nDHQABa1YvE3wg2UQ2sVa0KUAOqCLpJD7t4l87
         mOlM0CG0DMUD1XjkR0OYp1+KJEzzVARq9FFazpO/bkiBFeqpnqcAan5GyZ+aoxip1w7J
         xPVVymNEUWmGw19zObnMqiMUbvINqhEp/OqOUGRKFNYBPisMIM/kdnK131omzXbOmDbS
         mmYVZxgrxd93cqJWzsevO7iMEErcsz2/PzXIY+2NWLxB7xTEKKFt6SgmHkD9/nxJ4gw8
         +iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763109; x=1749367909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Gr5EoWy8Ket1um+xPQqA9JTH1/mAj6D3EPFq8+6IzQ=;
        b=g8VdKE2kh3tnvEaNHQ4ZEqUv/7n4hwX9nDIfrtmBIwZwQ1mSc3+kAvEYVBJxD5qA6Y
         XSR+yZO0ZYg8E0PVa1mZ03LLOWpgXazloEgLWdxl5PZxvWP40CG4qv3d1992OS3ueqUm
         EOvZkzdDbKpelb5LUEfabPFPfUfa8bjJk6TyErFnzXRXaaZwN4ResxzL75kBYDK4Rbl1
         cgTh5f2dIHhO/iQS4wEzOa7Im2X1U0RPC+XHPG+VZ63GIULCDPKTWCkWsLtAf+9zwn5d
         W8A4RciYc2vgOo7530z8abJ4NMQTJ2y/RtnVNWWrY92ZWrlCTJLz++Vsg50cpeHbvjRu
         8cow==
X-Forwarded-Encrypted: i=1; AJvYcCUMe8S6M+iQivJwzYY32ItozfqRQfufOxtJeW64k1/PSZ+TiJ7QR4L5vS3Ji0xPHvwfY/ZcvyfUGLyjjVg7@vger.kernel.org, AJvYcCWqWz0YNQ6Uo6PogGwA9x+xQqku3zZMpHF2BT+g3mAQ31Q5Z7Wq02JkQREPZ4biOfIpT1zAbHBBgXLh@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQzHZk3OVxUyTEwqGCBCJUI+v+PIxS6sRgzaSpbiEJaAVuREV
	a0LhggUJ2MTIDwn6fqDd6qovIUXH2BUpk0S/qlGeAct3FHoPztjxEuVT
X-Gm-Gg: ASbGncvwaKxCQ3nJbRkzYjpoklPt52WNELD30wkOI06Ztdpv77YQqW66f15Fqia3cau
	wMCktvkWh0BQkulaDyKAISTDBXB3iGZo7lJfeiP+CizU8hcR/9JnjCtQ4QUzKZrTYcYgp2dnS3N
	q2Alwtn5fos0HLgk31/QaYw5GpNmcqvEiVcw5dympjrpf2cHKBmmRMbAFCwJQEF/dk+L3/9IkfQ
	I/P0FpNyzkO+e6dk34jeeTlJIJXmDzv/xD98uUIivzMKUVOxgr2AfghVF5NlwQia8tnvWzYxXzo
	PuN+utb1cP/wDF3nJ7n3bAVkOHiQ/fi41QtJwCRmosyqt1Hk3yoV5V2AFLZ3mdgkStvLHxNbe0X
	qpSMEEqbEgyE=
X-Google-Smtp-Source: AGHT+IEK3eTk+q+PoPcU1IXXHMfkiGqGbhaaAt6oJvDPx3en+jI7h9Nk9omjEYfcZvi3il8Vv3uy8w==
X-Received: by 2002:a17:907:da5:b0:ad8:af1f:938d with SMTP id a640c23a62f3a-adb3242e54dmr807905866b.37.1748763108917;
        Sun, 01 Jun 2025 00:31:48 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-112-27.web.vodafone.de. [109.43.112.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e846sm609267466b.70.2025.06.01.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:31:48 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: krzk@kernel.org
Cc: abd.masalkhi@gmail.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add Device Tree binding for ST M24LR control interface
Date: Sun,  1 Jun 2025 07:31:47 +0000
Message-ID: <20250601073147.2019266-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <852ef4fd-6c26-4f79-a1d4-b3e37926ed7a@kernel.org>
References: <852ef4fd-6c26-4f79-a1d4-b3e37926ed7a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thank you for your review.

> Drop quotes. So this is I2C mux or EEPROM?

The system parameter sector and the EEPROM do not share a continuous address
space, each starts at address 0 and spans its own internal region. This
overlapping addressing creates ambiguity if treated as a single memory space.

Additionally, there's a synchronization issue: during multi-page writes to
the EEPROM, if a control command (e.g., a lock) is issued mid-operation,
it may result in partial or inconsistent writes.

To address both challenges, the driver uses a mux-based design:

1- The m24lr_ctl driver acts as a gate for EEPROM access.

2- It provides exclusive, serialized access and handles the control interface.

3- The EEPROM itself is exposed as a child node using the standard at24 driver.

This separation ensures reliable operation and a clean, maintainable
architecture.

> That's not a misc device, but eeprom. Place it in appropriate directory.

Given the above, I'm unsure if placing it under eeprom/ is the best choice.
Would you suggest still placing it eeprom or under somewhere else maybe i2c/
(e.g., i2c/i2c-mux-stm24lr.yaml)?

Best regards,
Abd-Alrhman Masalkhi
