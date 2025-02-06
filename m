Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F76A1990C1;
	Thu,  6 Feb 2025 19:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869806; cv=none; b=VWoRgdXIPpepC0lTo//57p2kapdCIzoCHvKLYESw9d3dloBeTIZBt5wBF2sSmtdyvK8tKcVE4DCsJk5SuLpQ1d/ULBav+Q4mqvK2AOviMSpoPpsVjymg5yMGfa/9IlU1e8MoUeRgo1boflxjJQqcAy8rkUASGNS19b88YjAywz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869806; c=relaxed/simple;
	bh=7FQ91HxxZUZFwIqS9OHExe5Wo6tbMXSmIZFvEnHpG4Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H50N0wMi/iG1EsBHWW2ZMayQdPrZvDDIsZ8fg7XIqEfbTLQNg9rT9wRnV+/M1lshLMAPJvOzzvShycys6poPxKf+Q0dNMZjW2OVBSsZpQRxV796M3OqfIzN4/+oH2PI9BkYbb4NzNJNKaIPrXOFw0LzTNuex6jj00rGQMlJdGY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSfFJSpM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSfFJSpM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f9bac7699aso1872395a91.1;
        Thu, 06 Feb 2025 11:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738869804; x=1739474604; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vHNnmawOI8BEs8dzEepShX+Y+oBMZO48g0tiwba/q2I=;
        b=NSfFJSpM872QUVWXdGsO0zOWYA62yb27v+4aeZMKFJdkU4A5d//SaT8S+Fus65wJvU
         kTOOxHpvv2b/28DC/FSFvRyqZvay2lEQLulIlvGN3171heKUvSGjm6D4Ce64xXYul4yS
         LjK4vQL5W9gicDgi3SHFa7FUPseWuQv2rcaa1zR3dVq9Esz6TJy5AJvynbf2NSIQpBnF
         uCOCbkkauqSdDCNQoNzWHP1NWSVUmyRvEESr41VgQTx5iGorGRknTUINYpEO36dPXvQL
         bd3cW5qHCrH8f9lQo2Om8NIk6Ch6S+TwnGI7pa03LfakSB6XefRRz0eBiqtZbrn3/14G
         9L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738869804; x=1739474604;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vHNnmawOI8BEs8dzEepShX+Y+oBMZO48g0tiwba/q2I=;
        b=gn8bwxv7z9y2WsbBxcikBPyjLf+wjW4KymtdnqPSPKOitLj+vLc2N/hS8yz8NVPN1k
         2MPIB++6/CQcN38+yZGpb959QQXGI1GDaXYOTWc+5w41f3tQQS1LR5mGxJy7ks9dKurS
         prCsehgR4WS4ArDtcWM17zabv1kPOpht1MwcN4NNsHE4KsnoNllCZvyFLuf4ol1fJ862
         kGuONoXk3ilVJeS829trWNruzdXo15yZcyZQ9TXljeDyXxEe4NpDTb82ob5sr3SHasQj
         vHjgZ6kKfabttyl1bGH56KUdeNW5BbfQfevnbhM68pHg4FU/NaUmnRUVN2nUq+pa2uLN
         eUdg==
X-Forwarded-Encrypted: i=1; AJvYcCUxbVer843rv7/SdD5TaJQsLIgDbDmrcMtqTfPj1f/YusB8rXlYfIJm0/ODauaQ+qn5GvjUpA518/hHqTk=@vger.kernel.org, AJvYcCVlKhFXMMInePahpNlOIfmN3tThHIpYPZFqIHm+tmkAP6LTN4xUI9rOVoHonWgWcyu+JS+aU2Ahtz8m@vger.kernel.org
X-Gm-Message-State: AOJu0YyQCPwNFgSlPlbZY1eOmYW6yYtygEFNgCfpdV2yb6DQaiCJ1OEP
	J01SGekI6v0PmSkFimRu+M0f+oZvNft08pNEhtDdQcko1IsoPPHqAoLPIxz9v8kaYibPEVOx0Xd
	JOsCvsKYQGH7PIU0RZjAriG1o7ak=
X-Gm-Gg: ASbGnctUwKpGS247N0efH0bW8Rsoq/cVrbLhx+KaYuSWdcgJaSUjVs52qpzbQQ+ZB80
	W0yGAbB8fdNtnCDBtq39fg6oARTNiyY3siUmEJ44RlXiUmmmecF6O68KAxtLC5vQPVejbZlHQ
X-Google-Smtp-Source: AGHT+IEanAKmRjGNZgbz5ESpSc8aIJ/ZpZ2uRJfyuK20Fvml0mR7X3Ju8RNx1Ka83OTcEBbV4M7I2rmTNjIajipzwHg=
X-Received: by 2002:a17:90b:3903:b0:2fa:13e9:8cb0 with SMTP id
 98e67ed59e1d1-2fa2450d280mr288944a91.31.1738869804254; Thu, 06 Feb 2025
 11:23:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jillian Donahue <jilliandonahue58@gmail.com>
Date: Thu, 6 Feb 2025 12:23:13 -0700
X-Gm-Features: AWEUYZmcY_HNrVVA1y_4WRrfNiT6j17LJzENL7TzDayJjqvZOwq7yKn3nySl4hE
Message-ID: <CAArt=Lh0S6UPX0OAhudTWxE7g7xbukQqHmuDAwCDwjBUbuJUnw@mail.gmail.com>
Subject: [PATCH] f_midi_complete to call tasklet_hi_schedule
To: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 9cb2628740d9f55f6f3faa5cce2de5eb8590f434 Mon Sep 17 00:00:00 2001
From: Jill Donahue <jilliandonahue58@gmail.com>
Date: Thu, 6 Feb 2025 10:18:05 -0700
Subject: [PATCH] f_midi_complete to call tasklet_hi_schedule

When using USB MIDI, a lock is attempted to be acquired twice through a
re-entrant call to f_midi_transmit, causing a deadlock.

Fix it by using tasklet_hi_schedule() to schedule the inner
f_midi_transmit() via a tasklet from the completion handler.

Link: https://lore.kernel.org/all/CAArt=LjxU0fUZOj06X+5tkeGT+6RbXzpWg1h4t4Fwa_KGVAX6g@mail.gmail>

Fixes: d5daf49b58661 ("USB: gadget: midi: add midi function driver")
Signed-off-by: Jill Donahue <jilliandonahue58@gmail.com>
---
 drivers/usb/gadget/function/f_midi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_midi.c
b/drivers/usb/gadget/function/f_midi.c
index 837fcdfa3..37d438e5d 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -283,7 +283,7 @@ f_midi_complete(struct usb_ep *ep, struct usb_request *req)
                        /* Our transmit completed. See if there's more to go.
                         * f_midi_transmit eats req, don't queue it again. */
                        req->length = 0;
-                       f_midi_transmit(midi);
+                       tasklet_hi_schedule(&midi->tasklet);
                        return;
                }
                break;
-- 
2.25.1
