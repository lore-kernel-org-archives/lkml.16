Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC827AC42
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530630; cv=none; b=I8ryZR3ghlBnwimsjIXW2Bznev+I/bJ/1BAuQZmbpb3V8EtNBkmAzNgzrH3FbAeGyn7WWxwaDVRetzD594CIBc4NPDAUjHj05eYI9x0x0iMH9z874BDlYp2r3AmcJMP33BHiAFNDVIWv51rUzJdbZ/8izux1VoBp8CVpnZwUWpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530630; c=relaxed/simple;
	bh=tqLDKDef5O6cJ4keWnJtbG4x/2kNRBP1ukrtog92iYs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AxBGUcW2FjyN1wtOhmlzveLYHBLHB6xI73f0AxSdjKkIlkMzzmWaWd3zkg0kLzEs4Tf4fgS7jWoZSwLH15qBCUfX2p6sWh8ubZB48a1N54ZKPNgi233Ooe6xosODbPymCUZEfTk6eH/41L/1ds6szRdbMGZeRxbWsSK7/SFKw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XISo3Ikk; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XISo3Ikk"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-afc857702d1so5325717a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746530628; x=1747135428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUMYg6viYOA1qi+ywdeJSO+n/kzbTJsKc7vLbt7F+/g=;
        b=XISo3IkkncqT0Uwe++4YFrS11kFHbkEmw6ZHlWyLtGrlKUGQwQk9XMK/2Vzxt981TU
         ULsVTRjifUjpp5bXTUjHtXOlIwH5Gav42hk8ENmisRxg/J5GHDx6qKQ3pj/zBFwEED/z
         gTOcZJL8zI83N+I2D5n29Wi7P6x/TOXVzeXaaMUeNR5DrhQzURUELZ6IQAKSuaVEo2kY
         6kzTYmXMyxatPiEHwJQvqE/zzTxVOk90kr3JXrdKVhWn1QlOCUX7jfOIIfUIODqed4Vb
         MO0RCClJEEhOVL7ROJ7GuZdS5BH1Fc72pzHe/1iM01/QIg5UV81OpgGuNzNjmgohkX/S
         DobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530628; x=1747135428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUMYg6viYOA1qi+ywdeJSO+n/kzbTJsKc7vLbt7F+/g=;
        b=DXs0IV9XlnkBEMD/y164H6oxvieJQGzFtgoDQwNq9QdtVt9itbP9pYS8Gc6amHSFbh
         MCg0Yb12jLx12kDSyCENc45uKJIQC/NPMBUuJXbyuWUKthYEFktlvEQZJgm1++fAYV6w
         tY7S3S+96F0xG6Hj6/hDpWixKxnvSjrgx+JwS6d0oIRgJ1LxCBRxF/H8ltQTOvlY3A5S
         hEQoQLu6Fula5wHssvCSAk3kQS/7Xo31A9f3AThZ8JhZGfF6maGHd0TF/7ZiHqPqC/XF
         SmilhQ08E3rTtieyyDsYJ9WRqY9zs8cUeAQGqh4o3zYMPULD7VY7QrGsqN0As6CwyL34
         PAhA==
X-Forwarded-Encrypted: i=1; AJvYcCWgMO1ozXYwTknbWEf61OlsXe+PX/FWxUcKDehzuFob4HhgBEdOhVkxMdwzAOtI1yWf5Vx1SrJTMFtGYBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMb+nk3ktifw6y1hULstFO8b8SUm3U1R+zdQgHkGU7KLIqlBd
	dRFzjkyjoIJWjjMJLR9bKFNv60fQYgt4f2wo2h8dYz0URgccBTQTdRR5H4HYryc=
X-Gm-Gg: ASbGncuszWRt8cwsyy+6dFQYPD43OwweBbcdLAxU1decfWzt5FSkbrn8vjdzh9U3G4h
	34764I7k6mVD/hKo9RDL3kCjwT1TR63qhYf8SNf7tMylj+bu0omaabgpmF5tNJ2ktc5AwXPgD9q
	hKdlLqfM4qT5DOpB+K1CBBQpSpBB7K47nXIWJCBxfi9//iJX5nCzF87Ei89nZC50hvWrj+VkbLj
	al8DBvl6eERa8gVTyqp/52wI87FiUpjVrhAt9qrZGMmwqE2hanBtJbF4y+pkB872FitI1Oc+4/1
	tTdZxtL7SA57Oy2KHPwEZOuI/NELvJopEaCukO621QwewlMWtQ3vz/p/eXUl9AqoIx++/rECbIO
	91SGwIaY=
X-Google-Smtp-Source: AGHT+IFIpS3jKbFdovjmPaz6TQujDc77vnxGWRHeMmuNuGEMYq/uCxYu8Y3tDR8UjdI1Raunfojh2w==
X-Received: by 2002:a17:90b:3909:b0:309:eb54:9ea2 with SMTP id 98e67ed59e1d1-30a7e1af162mr3039230a91.20.1746530627764;
        Tue, 06 May 2025 04:23:47 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480ea0dsm13630303a91.37.2025.05.06.04.23.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 May 2025 04:23:47 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: arnd@arndb.de,
	andriy.shevchenko@linux.intel.com,
	benjamin.larsson@genexis.eu,
	cuiyunhui@bytedance.com,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	jirislaby@kernel.org,
	jkeeping@inmusicbrands.com,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	markus.mayer@linaro.org,
	matt.porter@linaro.org,
	namcao@linutronix.de,
	paulmck@kernel.org,
	pmladek@suse.com,
	schnelle@linux.ibm.com,
	sunilvl@ventanamicro.com,
	tim.kryger@linaro.org
Subject: [PATCH v5 4/4] serial: 8250_dw: fix PSLVERR on RX_TIMEOUT
Date: Tue,  6 May 2025 19:23:21 +0800
Message-Id: <20250506112321.61710-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250506112321.61710-1-cuiyunhui@bytedance.com>
References: <20250506112321.61710-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the case of RX_TIMEOUT, to avoid PSLVERR, disable the FIFO
before reading UART_RX when UART_LSR_DR is not set.

Fixes: 424d79183af0 ("serial: 8250_dw: Avoid "too much work" from bogus rx timeout interrupt")
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/tty/serial/8250/8250_dw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index f41c4a9ed58b..ffa8cb10b39c 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -288,9 +288,17 @@ static int dw8250_handle_irq(struct uart_port *p)
 		uart_port_lock_irqsave(p, &flags);
 		status = serial_lsr_in(up);
 
-		if (!(status & (UART_LSR_DR | UART_LSR_BI)))
+		if (!(status & (UART_LSR_DR | UART_LSR_BI))) {
+			/* To avoid PSLVERR, disable the FIFO first. */
+			if (up->fcr & UART_FCR_ENABLE_FIFO)
+				serial_out(up, UART_FCR, 0);
+
 			(void) p->serial_in(p, UART_RX);
 
+			if (up->fcr & UART_FCR_ENABLE_FIFO)
+				serial_out(up, UART_FCR, up->fcr);
+		}
+
 		uart_port_unlock_irqrestore(p, flags);
 	}
 
-- 
2.39.2

