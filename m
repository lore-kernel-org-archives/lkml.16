Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A3292B2A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080130; cv=none; b=T5gQDAEnOPMMEuz9GzjwCAmXC+2m6xKC1RqjnjUJ3ClOe8xb7EqHVRX9faVsUoyCljGduyhfkfXaegxsTGtuffVNIAk2CaZ/v1xaMPmSfaDdMJsWIdNIzFARpEm0BhsX+aQwIVJF5LldTkxzUt4orBBDhnt97cW+E31pAKqeMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080130; c=relaxed/simple;
	bh=96HwMABA3lat6ZaJt+24p8PnCvjukTFtGwymnSobeyo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mqsIu+h9BPoV5NQ7mUgt/KDzg2jCkPHBlib5I4prfI1gmtmLJ6WEcyDKvbW6ytPsAjJX9FjdPMdZaTdSt8ehEWKDoZk5shVYMDwFYWNzfKOuK8Cn1z1+kpUGQNTz7I+HRTKrXo9mvvUbDxdvc0yueqmnr7ElXwBS1j0z2yPkzLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uACVJSQJ; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uACVJSQJ"
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-32b48369fadso10320831fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750080127; x=1750684927; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vO6E1genm1NfTChAjYKuzLF6v70uWc0Xmgx3nG50sAw=;
        b=uACVJSQJ3caLeXpVNEm9VxP3JsY7gfHZ0AKShMC1kFGFzOvL82Eb5TVPrX99wcTPQW
         wQPYTxjKL05wf9AF/ae1DJPFfq/38LWriKJjDaLotecAWb8S5WgpBZgTKwpA6BeBLFuX
         avfXKQi2q/8WMQCmp9aMkyLjiLb300SjozV/wjf1zeuE5BLRqeZ/M3DnsLyB1BUVlq8h
         oBb0MbNs2Oa4vf5nGz4rBux9/jwvMJ/O2atYnK7O5+ZJnWKMzrCCluPhQfvrycjpbZrE
         cX0IIDkeiTsS7he2qndIz5OVNKaVXhtdHZ94XvLqQHhIF6x+wyWFO4GpfXGFuZ2ZNOYD
         3jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080127; x=1750684927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vO6E1genm1NfTChAjYKuzLF6v70uWc0Xmgx3nG50sAw=;
        b=QeQu/wmGV3BJCec8msL1izaBAVni4PnHGmOmDuaiUS2iI1dgbumS0rk+7PNCDarH4E
         2/y4TIEmCAk/zz5d03yVajrs/2IuP/kNGJNMlNUa0fFPg39AMRgBNcAnja51Six4IJY6
         vDdMlecs8snx4Orf+wqhbmQMxuljYm1fL95qpWWtGzKnjerTmsSBb4KxL93hVS2A/me0
         MMvPMUKWceqaNvaoNBdjAHP2zDBJDuB0N4GrBzA5hf4QjTiyDcSYmAHF0YvOXx6VtlV6
         GEN25/WTXHXlL/o0WpkXS/X2MsaoCQbYAsTdA8EplgxxBeSV7aczkSdJvtQHqMavld8x
         2uzw==
X-Forwarded-Encrypted: i=1; AJvYcCVdu5k4bPhrm+0uoR0ZUDMhsWadyLAU0uEdVi7vlaVqU9a87BRvn02bRpenj06sK1wE7TXy7vd1Qdaf9T0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7bms4BSxA8Ss7Cis5tcfVO3kTQoAX2DV6nRQ1GgVP3PMZvqV
	rCyKQtVEaptmpju2vIcW99FNiCTeRhKDHBN9M9hEy342dTFWzZ+RU1YV47ANZ+LKMUdNwBvD+az
	7uk0RVQ==
X-Google-Smtp-Source: AGHT+IFkt/Rh1bB1x+RfplLzW+PaREG+5HeLz6GmLPczhv2jggzzAjkVBt+PwypmVdooMJyZhNAqyFDMU9k=
X-Received: from ljdr25.prod.google.com ([2002:a05:651c:4199:b0:32a:78e9:1a99])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:50a:b0:30b:f0dd:9096
 with SMTP id 38308e7fff4ca-32b46e8e2fdmr28896961fa.12.1750080126678; Mon, 16
 Jun 2025 06:22:06 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:21:47 +0800
In-Reply-To: <20250616132152.1544096-1-khtsai@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250616132152.1544096-1-khtsai@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250616132152.1544096-2-khtsai@google.com>
Subject: [PATCH 2/2] usb: gadget: u_serial: Fix race condition in TTY wakeup
From: Kuen-Han Tsai <khtsai@google.com>
To: gregkh@linuxfoundation.org, prashanth.k@oss.qualcomm.com, 
	khtsai@google.com, hulianqin@vivo.com, krzysztof.kozlowski@linaro.org, 
	mwalle@kernel.org, jirislaby@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A race condition occurs when gs_start_io() calls either gs_start_rx() or
gs_start_tx(), as those functions briefly drop the port_lock for
usb_ep_queue(). This allows gs_close() and gserial_disconnect() to clear
port.tty and port_usb, respectively.

Use the null-safe TTY Port helper function to wake up TTY.

Cc: stable@vger.kernel.org
Fixes: 35f95fd7f234 ("TTY: usb/u_serial, use tty from tty_port")
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Explanation:
    CPU1:                            CPU2:
    gserial_connect() // lock
                                     gs_close() // await lock
    gs_start_rx()     // unlock
    usb_ep_queue()
                                     gs_close() // lock, reset port_tty and unlock
    gs_start_rx()     // lock
    tty_wakeup()      // dereference

Stack traces:
[   51.494375][  T278] ttyGS1: shutdown
[   51.494817][  T269] android_work: sent uevent USB_STATE=DISCONNECTED
[   52.115792][ T1508] usb: [dm_bind] generic ttyGS1: super speed IN/ep1in OUT/ep1out
[   52.516288][ T1026] android_work: sent uevent USB_STATE=CONNECTED
[   52.551667][ T1533] gserial_connect: start ttyGS1
[   52.565634][ T1533] [khtsai] enter gs_start_io, ttyGS1, port->port.tty=0000000046bd4060
[   52.565671][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
[   52.591552][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
[   52.619901][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
[   52.638659][ T1325] [khtsai] gs_close, lock port ttyGS1
[   52.656842][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be9750a5) ...
[   52.683005][ T1325] [khtsai] gs_close, clear ttyGS1
[   52.683007][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be9750a5) done!
[   52.708643][ T1325] [khtsai] gs_close, unlock port ttyGS1
[   52.747592][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
[   52.747616][ T1533] [khtsai] gs_start_io, ttyGS1, going to call tty_wakeup(), port->port.tty=0000000000000000
[   52.747629][ T1533] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001f8
---
 drivers/usb/gadget/function/u_serial.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index c043bdc30d8a..540dc5ab96fc 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -295,8 +295,8 @@ __acquires(&port->port_lock)
 			break;
 	}

-	if (do_tty_wake && port->port.tty)
-		tty_wakeup(port->port.tty);
+	if (do_tty_wake)
+		tty_port_tty_wakeup(&port->port);
 	return status;
 }

@@ -574,7 +574,7 @@ static int gs_start_io(struct gs_port *port)
 		gs_start_tx(port);
 		/* Unblock any pending writes into our circular buffer, in case
 		 * we didn't in gs_start_tx() */
-		tty_wakeup(port->port.tty);
+		tty_port_tty_wakeup(&port->port);
 	} else {
 		/* Free reqs only if we are still connected */
 		if (port->port_usb) {
--
2.50.0.rc2.692.g299adb8693-goog

