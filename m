Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB705214209
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206747; cv=none; b=Oh688pDH26b2/kc5xnlLHvzRDB2s6aoAH+swVy7noYSBr1AmNcOjKT4AHrOOYnrdawf76vWDyeRECPTAZgZaDM7wHG7clJvUY9PTCI7fjj2WVxJPpgo4mXL3yns+1/O/0c040AmeqKEIgQw3LuxdXwEphuzrSS/4YfbV499HcI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206747; c=relaxed/simple;
	bh=YkGEBOcrE27T8r3ixhzP0IJ28+ma+k+fBnXwC3McJO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OxZzEcW/QEKF5FbzWHQqxubthY1bailKkOtl97qd5LhpjGaOe82+4e3eAVdMqsZCRhJOEX8p8QtOPXgvqn9Pz/qE2DZKTR5Xl02r/atbYysXSEkwj1j0VaGQCb8b2NK+MJEc4XmVEOhdihdoIyx/jmmr3jXobB5yKKwlrw/vfQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMxbp4zu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMxbp4zu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a3798794d3so1555215f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749206743; x=1749811543; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRFHALx1m3zetPOEUD4i+1o0+6rIFbdrwCz54veiK6s=;
        b=UMxbp4zuUrI9sk8FEUuDGdtPYJH9WPP5J5PKKhMNv8n2V/ZBaYFbr55YcM/R8KZ0BU
         IpqWF9fTkgl9lrf6dAOw3jUDFmKj0RX+K0FMxDm/L7tHqS9OUXNnEzNRipASZUJNt6c8
         wqEB0300TEqNww5/gon7BddbQaSOaRMs7OSvN2r9LbmO5YaxQhRiikrdIDq67tnOJUL0
         8SJZmq5rIkBRmtya97v1P+cCjKbXlxUwvcm1HEfqvIRdC3DEjVXb36pWlbbXMx2zi7Ir
         /fic9kl0IZvdwEwdiMJAcTbRSthYfgGKO3NTedw5TdxvXmhKZ44mWrrxPtBYNiQoCRPg
         5DgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749206743; x=1749811543;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRFHALx1m3zetPOEUD4i+1o0+6rIFbdrwCz54veiK6s=;
        b=pHFED+EDbbLGF7FXRvcrVHVMAB0lgL6dzYmCc6pMNywAoNFDLafDgZ0fsjmu7QCiU0
         PU55ID8lqqUoJXp3nIdCYUu4Kc/6oybkEBjD8o15gXi6oC9TRwhgKfTF5vkjeFez9Egi
         8fNmS7ucbnuyUwzcxqX+kjrqRE1ZBmZFJASgGtyAdQfbNxG3RGD30J5NPQlPs3ddwktJ
         lGEoM61MtF8OdqriAYZX38k+dtziJBOvqdbPfszFc4/XxdEYvwPcH4cFvSKlGDjoURYw
         M5ebs0nHfByhNh3/qD+PfYEb2jtbd7Wuri5q6+1AzZ5Nz0dI/FaNA+WlPB2TNAv9bz4S
         IvJw==
X-Forwarded-Encrypted: i=1; AJvYcCVvXzJJ3cE99N32Awg7hvj6Yno6zxl0Y820yolFF4P/687+pm7DdEf0NKO5ZKvizqY4yCaYhSP1RWbgw/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxV0VRykrKD/XLHnYODdjYMWB7KD7trU/+CWz7q/VZeOerzy6E
	GgUa80LIbT30Mk34oZEWOa3BSVs6RUKEAqsVu3mog6cNPW5Up5CbopZ47q0dJvqYYMM=
X-Gm-Gg: ASbGnct/Yd5bO8p7EawmUsAqTu/Z4RYz00+dAOQX0UNwaB60I3X+QQ07XcZfLoA5kQ2
	WCXrGb6v7liRtEJ0IEqwGBawpb0hzm6iGTwGJn2OOygxm6ZvvViYpmsFti46M9Nd/WM+QVlzGEm
	tQaO/PZn6TJTwXYHGSAPx0QmJOo2OG6zfMgQ7tjrzUerdN9E1/aN7L/pXvQ48rVdABXvmw0CQXl
	YQgs/iRIHg38yhLLSUBUOjJFFPJk4UWZaaBJfb5DsJ1E8fALqfF2LgzSvJn6qeLs/BOaW2vnp5L
	iBCLWuXXaLyQegNbY3DC92Wup8JhOl1OU4DEHcCqG8slidBQftzlIdlBiKzPOjvcakiVwpBJ/SW
	gA2gA0bZORIqG/tzszy5f5UBK/l+Nr85/VZaQWqiG1w==
X-Google-Smtp-Source: AGHT+IG81ROpSS11hYFgizfgeqwfBE+434gV6QInGeIi/uhBiwAIOcylPzJAGiQB9jMO1IoJY5jW7A==
X-Received: by 2002:a5d:64c7:0:b0:3a4:d0dc:184f with SMTP id ffacd0b85a97d-3a531cdcfa0mr2411229f8f.39.1749206743044;
        Fri, 06 Jun 2025 03:45:43 -0700 (PDT)
Received: from ta2.c.googlers.com (213.20.187.35.bc.googleusercontent.com. [35.187.20.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323bee86sm1468810f8f.43.2025.06.06.03.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:45:42 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 06 Jun 2025 10:45:37 +0000
Subject: [PATCH v2] firmware: exynos-acpm: fix timeouts on xfers handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-acpm-timeout-v2-1-306b1aa07a6c@linaro.org>
X-B4-Tracking: v=1; b=H4sIANDGQmgC/3WMyw6CMBBFf4XM2prShxpX/IdhUegAk0hL2tpoS
 P/dyt7c1bnJOTtEDIQR7s0OATNF8q6CODUwLsbNyMhWBsGF5heumRm3lSVa0b8SU1Lp601zbqS
 CqmwBJ3ofuUdfeaGYfPgc9dz+3j+h3LI6O0x2QJTcmu5JzgR/9mGGvpTyBXlSLqOpAAAA
X-Change-ID: 20250605-acpm-timeout-434578500a34
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749206742; l=5028;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YkGEBOcrE27T8r3ixhzP0IJ28+ma+k+fBnXwC3McJO4=;
 b=/ygRXRUpI7htlMsGDL1WdAqzFsl3yUxqAWzsl8X50cOc+eJBsU4cW6YrAzSyW/kOU4+5Rcj1m
 7EAslsdO6LiCG5U41ftFPI1qbJm37L6utdNYTfU8JCZQs6jnxC05Vta
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The mailbox framework has a single inflight request at a time. If
a request is sent while another is still active, it will be queued
to the mailbox core ring buffer.

ACPM protocol did not serialize the calls to the mailbox subsystem so we
could start the timeout ticks in parallel for multiple requests, while
just one was being inflight.

Consider a hypothetical case where the xfer timeout is 100ms and an ACPM
transaction takes 90ms:
      | 0ms: Message #0 is queued in mailbox layer and sent out, then sits
      |      at acpm_dequeue_by_polling() with a timeout of 100ms
      | 1ms: Message #1 is queued in mailbox layer but not sent out yet.
      |      Since send_message() doesn't block, it also sits at
      |      acpm_dequeue_by_polling() with a timeout of 100ms
      |  ...
      | 90ms: Message #0 is completed, txdone is called and message #1 is sent
      | 101ms: Message #1 times out since the count started at 1ms. Even though
      |       it has only been inflight for 11ms.

Fix the problem by moving mbox_send_message() and mbox_client_txdone()
immediately after the message has been written to the TX queue and while
still keeping the ACPM TX queue lock. We thus tie together the TX write
with the doorbell ring and mark the TX as done after the doorbell has
been rung. This guarantees that the doorbell has been rang before
starting the timeout ticks. We should also see some performance
improvement as we no longer wait to receive a response before ringing
the doorbell for the next request, so the ACPM firmware shall be able to
drain faster the TX queue. Another benefit is that requests are no
longer able to ring the doorbell one for the other, so it eases
debugging. Finally, the mailbox software queue will always contain a
single doorbell request due to the serialization done at the ACPM TX
queue level. Protocols like ACPM, that handle their own hardware queues
need a passthrough mailbox API, where they are able to just ring the
doorbell or flip a bit directly into the mailbox controller. The mailbox
software queue mechanism, the locking done into the mailbox core is not
really needed, so hopefully this lays the foundation for a passthrough
mailbox API.

Reported-by: André Draszik <andre.draszik@linaro.org>
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- update commit message and fix the time shown in the example.
- pass zero for the second argument of mbox_client_txdone().
  mbox_send_message() returns a non negative token on success, and
  mbox_client_txdone() expects the status of last transmission. Doesn't
  change behavior for ACPM, but fix it for correctness.
- add to Cc the arm_scmi list, they had a similar fix at:
  Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da1642bc97c4e
- chckpatch complains that Reported-by: shall be followed by Closes:,
  but the problem was reported offline, so I don't have a Closes: tag.
- Link to v1: https://lore.kernel.org/r/20250605-acpm-timeout-v1-1-1dbfdbee30da@linaro.org
---
 drivers/firmware/samsung/exynos-acpm.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e02f14f4bd7c96de6ebb50473005de520aba1c4f..3a69fe3234c75e0b5a93cbea6bb210dc6f69d2a6 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -430,6 +430,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		return -EOPNOTSUPP;
 	}
 
+	msg.chan_id = xfer->acpm_chan_id;
+	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
+
 	scoped_guard(mutex, &achan->tx_lock) {
 		tx_front = readl(achan->tx.front);
 		idx = (tx_front + 1) % achan->qlen;
@@ -446,25 +449,15 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
 
 		/* Advance TX front. */
 		writel(idx, achan->tx.front);
-	}
 
-	msg.chan_id = xfer->acpm_chan_id;
-	msg.chan_type = EXYNOS_MBOX_CHAN_TYPE_DOORBELL;
-	ret = mbox_send_message(achan->chan, (void *)&msg);
-	if (ret < 0)
-		return ret;
-
-	ret = acpm_wait_for_message_response(achan, xfer);
+		ret = mbox_send_message(achan->chan, (void *)&msg);
+		if (ret < 0)
+			return ret;
 
-	/*
-	 * NOTE: we might prefer not to need the mailbox ticker to manage the
-	 * transfer queueing since the protocol layer queues things by itself.
-	 * Unfortunately, we have to kick the mailbox framework after we have
-	 * received our message.
-	 */
-	mbox_client_txdone(achan->chan, ret);
+		mbox_client_txdone(achan->chan, 0);
+	}
 
-	return ret;
+	return acpm_wait_for_message_response(achan, xfer);
 }
 
 /**

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250605-acpm-timeout-434578500a34

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

