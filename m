Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE42D28B41D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547357; cv=none; b=Gh8HCJfcTw6JxsA3jMcpxDvbbSN6uNlzhT+8wTYudluKnzvUZfJsQ9hrJf21m7fq/E1c2/rAF3zkMKlax0Ea849H24elVC5hEy5PaE1MBz4mg3gbs2+swVzjIILc1B4Hto4k6l1VjRC4mckxUG4VL5njlskR3vGicvFk0CtyNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547357; c=relaxed/simple;
	bh=wS0CLPtfhOm5b92kf/uhx1Ra/XOqdQalM0tptjFMS7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KUwbGFjhKHYft4pFbJhifs91J/0qC9sq0M4SPhSE5tklfcENAG9lFeM0GtWLanTmy5wsyEexe8cP5xG9nzbu88QAoVFmy2BAVdh0qmSWJPS7B3IBdnmlTUMmSseIlQON5C5gzqmKtI8SXkPAd7GLYWepKnfqe9DWNyfDUdf1RCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DEWwRNAf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DEWwRNAf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235e1d4cba0so41998665ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749547355; x=1750152155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=va3siO387j2VoC06GK/4QFQK9voTcsrvQqeBKNKR4Iw=;
        b=DEWwRNAf0QB2d7GkzvpEDbRUyXqhoQQ/vHt80SnhzPnM7GUUyESOHyNPXAkWKlVIxu
         QeMWeeAbkCYiik3qIN+4ufsZB9lPUSX2fkytzQ+dsWX11E4sJyzH8DOKkfTyCqJBGYgy
         Gee0TjotVAdPxmB0+H1pWb5qNMM541rpYePFR7oXqN7OKaCaBN+FYc6iqL62FQSC2HUP
         7s15EUrFdXLtxWxrEpERwq4XyiMcN/fMfgwmwCUitSE3eWJRciRYeBHSSsrbykwQpV0N
         3Tyiteh71ern4CQtx74JD9VbpOhtEMfpXR21CXU7ROPJEXpiBGa0aNNZetOUegbHt4uV
         xGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547355; x=1750152155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va3siO387j2VoC06GK/4QFQK9voTcsrvQqeBKNKR4Iw=;
        b=PuO1MtUN9uJhjwGEN4u2M1YT6ORq6eNDojc0+nCj2v0Dt4xwxT4Syu6j/uEM/bi+dR
         MvIBGNX/iMzOHvLy+zdrcnOdSVD9IlmctlOGWrNA5Fyprbt0ALwKslXTxsxM5mX1FCgG
         HDl3HXL38bzxysGaQZuXaxk1Vm6/kHScZzAZyO7OXM0mlJMtDlinPsIPplpvyEXuBvNo
         R00ICRD7yQGScTRlGJAbmvN1zu1k3a9S1Bb/6zvARE4dfDsEFuWgVaYvlWz8qu/T1f0g
         0lPqY5ObSVzqjtKhvO9Rqrw1WcWz0S8pxlxgYWL78hQDBDkwHlMNcbRW1v0fhRXCLgqc
         r32g==
X-Forwarded-Encrypted: i=1; AJvYcCXf28ZGoDjr8jYlYBZAdDvrKNkzq4mmjcYTpzphCpX3+DfRyBYOuLjF6lKRR/zn0JDK4NGbK7oUL5kzaWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9uNGuqGjmq8de71bZKi/hs4/giWjy49ecbFZ7bf+AHote0mPV
	0lTiW9DmxG7tRZrEPzAHgkihkUu1X89wgH2zXQbwhAow5tkOwWH/AC6t8QnBPRyJgkU=
X-Gm-Gg: ASbGncsuebYmcIrBPQSjibity8Yk/dyTyl+yS2jP7TnIsLOqwfZ9EZ7gAUIAgBJUFUW
	Nz5qKcVDEm44CMwUg5loFq4JPH23XLFvUyZ5I3yGO8oQdYo1I85Ra+t2/DQ8/4npDQOQOZpE9mO
	7NGiAnk/fNNn57TH7VMXH0OEGp3lH+tU8QndwkxACfzW3mfPuBp4U3z3KGo8b01Gjqs9+h87u4w
	3BfuJIu/vBUjNbfnN48SivBk/s+rFJzSZB47n61I4pA50uqBGJqvXuQdlNduX+8rKTVPptKvBhh
	YWqZ/onLqBdg7FGnc9DvWbf55yURdUixG7e9t4fpe2AVAqhWhHBZKkKajXJFfMHBmqw3aYYIyjP
	0AWQCe0Ry7qZ8yktFldwG2kuFDuVDKO/zu7+9N9WI3Q==
X-Google-Smtp-Source: AGHT+IGbJIHfa2t3hQ2mUqrjlD8bC5fxJHJIfWVyoLl/p5BzNAK7pEuE5ojARq5pOZZifArzHeM8sQ==
X-Received: by 2002:a17:902:ec92:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23601d05c8bmr191836805ad.18.1749547354908;
        Tue, 10 Jun 2025 02:22:34 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc9ebsm66968605ad.106.2025.06.10.02.22.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jun 2025 02:22:34 -0700 (PDT)
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
Cc: stable@vger.kernel.org
Subject: [PATCH v9 2/4] serial: 8250_dw: fix PSLVERR on RX_TIMEOUT
Date: Tue, 10 Jun 2025 17:21:33 +0800
Message-Id: <20250610092135.28738-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250610092135.28738-1-cuiyunhui@bytedance.com>
References: <20250610092135.28738-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DW UART may trigger the RX_TIMEOUT interrupt without data
present and remain stuck in this state indefinitely. The
dw8250_handle_irq() function detects this condition by checking
if the UART_LSR_DR bit is not set when RX_TIMEOUT occurs. When
detected, it performs a "dummy read" to recover the DW UART from
this state.

When the PSLVERR_RESP_EN parameter is set to 1, reading the UART_RX
while the FIFO is enabled and UART_LSR_DR is not set will generate a
PSLVERR error, which may lead to a system panic. There are two methods
to prevent PSLVERR: one is to check if UART_LSR_DR is set before reading
UART_RX when the FIFO is enabled, and the other is to read UART_RX when
the FIFO is disabled.

Given these two scenarios, the FIFO must be disabled before the
"dummy read" operation and re-enabled afterward to maintain normal
UART functionality.

Fixes: 424d79183af0 ("serial: 8250_dw: Avoid "too much work" from bogus rx timeout interrupt")
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: stable@vger.kernel.org
---
 drivers/tty/serial/8250/8250_dw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 1902f29444a1c..082b7fcf251db 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -297,9 +297,17 @@ static int dw8250_handle_irq(struct uart_port *p)
 		uart_port_lock_irqsave(p, &flags);
 		status = serial_lsr_in(up);
 
-		if (!(status & (UART_LSR_DR | UART_LSR_BI)))
+		if (!(status & (UART_LSR_DR | UART_LSR_BI))) {
+			/* To avoid PSLVERR, disable the FIFO first. */
+			if (up->fcr & UART_FCR_ENABLE_FIFO)
+				serial_out(up, UART_FCR, 0);
+
 			serial_port_in(p, UART_RX);
 
+			if (up->fcr & UART_FCR_ENABLE_FIFO)
+				serial_out(up, UART_FCR, up->fcr);
+		}
+
 		uart_port_unlock_irqrestore(p, flags);
 	}
 
-- 
2.39.5

