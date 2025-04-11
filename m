Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E361F3BA2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378429; cv=none; b=eqa+vKsxJV3ZZG54/SDUgwokJ67o9y2MzakiYrFnIHsQi6rVCl7MpV37xPe3pauZNanOBv4GKqErU9P+Yz/SuuKwyYLSy61/P5s4Z4xQ6q5SGocKJ32UiERelonXrjKcS8xVizmEC0j2BBi6GRv0fPw6hb+uC5JJ2D2Dh+WjDOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378429; c=relaxed/simple;
	bh=kF3cYo+9ZX5AnaEg+ET+3O2y137GIGf0dpdHyvb4nkc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iPoQg3g0z4lzFfuaYeuALA5Llhg/DG2rTMnHmwp438BNLs7p5QPLq7PrS+3CDy2IwgF54l/+AEI8LmcCx/3M+vKwrigH3tmIUMx8ExPaRKQtT5q25cNmjtG+7C3uD8CT+FZS75qbQ6ynMJVbb2eRfX6HUxK6IM6yTBF2LqS1Rq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--chharry.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AUG5wKj2; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chharry.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AUG5wKj2"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736cd27d51fso1772094b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744378427; x=1744983227; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Avme7hgEmKUTqQ1UkfiyfhWbnWDAeHSTUd0R6dH556U=;
        b=AUG5wKj2ML6cFyKv2H7WJZoH6h2lJzaaaAeqEGE7110gy+v9F+y5Rbr2LUBqmaHfAd
         pUcsGokCS9ASuSmSbZzTx49Cw3YMek+AB3Uk4meGzlEQ+6uxv1C7K0sxIVMKHfEDkUtP
         j23v3zxwEhKmIHCzCdCeh2sIszeGfyePCd4SCAAdSCP26jZQ45UsvQW/42g/T9WMSDRS
         w4WwjeALhtGVuuYB3rgXkYnahvSZ9y+G9remZTGt5EYItQVbT87oF5jAb23vEziPkGkj
         lWW+DKQPmVZwcGaqkcAq3R2KtGlk5BF9XskfFqyw4wMivciCa3RhUERPGcu6Gs/NPjvy
         vQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378427; x=1744983227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Avme7hgEmKUTqQ1UkfiyfhWbnWDAeHSTUd0R6dH556U=;
        b=Jn1PbPX4FYH6jI3b7YmgVjx7UuO6v55FFdZoLjUluMcSuBz512DETK2SVdUtx5O0F/
         VLEENNBTyptDkD9aQhtNAKW1SVe1GJRXQt4VT5JW0gppHTbf+Bbb1JPg8jxUK1tQ6EXu
         AtRdUiSpVU5LRPJSwIW0zUCN/yjGFX8Ig2TweRpnvIYdjyOPTwDVbxqZncFNeDKc2d4z
         b8iLDCz91P/afLNZRjNKNcmJ1uVbFNmkGdHWjcjF6EQuTyhqylql0a5j06c++mUV9r/Y
         4dHk3JSn22bm01PSPxORS201QRI5jlPcdPbK1AsEZ3SGCRTaGgIks70aB/ydILJTpFyd
         5+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUgTmghxIyrPzCkwcC8viVf+oqzm3JZegHgpCUy1KmYwOKtRx5yX8zqLqDk7CZp0EbiAG2tfJ0fn/auiaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqgfXfQspP1JcoMwDmuO+2AA2R5TrrLDgtYN0FI/6mCIpdiIjW
	zAFeQdxqgiUG2DfMlbyf0IvWSpEhiCndFfUHHtd1DNvAsSdcmXnetafTh8qNG8mKpDiT+zrMYx5
	GmOxd5g==
X-Google-Smtp-Source: AGHT+IH9tt0vB0SA1rLTx3Z8KH82TTbxyMKES53R4Cv0H6wOgUihDZjLX53YmZfyuTT+w/137Zxq/DoUtKv7
X-Received: from pgbfq11.prod.google.com ([2002:a05:6a02:298b:b0:af9:5602:ea50])
 (user=chharry job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:32a2:b0:1f5:7007:9eb7
 with SMTP id adf61e73a8af0-20179983274mr4551733637.37.1744378426754; Fri, 11
 Apr 2025 06:33:46 -0700 (PDT)
Date: Fri, 11 Apr 2025 21:33:07 +0800
In-Reply-To: <20250411133330.171563-1-chharry@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411133330.171563-1-chharry@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411133330.171563-3-chharry@google.com>
Subject: [PATCH 3/4] Revert "Bluetooth: btusb: Configure altsetting for HCI_USER_CHANNEL"
From: Hsin-chen Chuang <chharry@google.com>
To: luiz.dentz@gmail.com
Cc: Hsin-chen Chuang <chharry@chromium.org>, chromeos-bluetooth-upstreaming@chromium.org, 
	Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Hsin-chen Chuang <chharry@chromium.org>

This reverts commit 75ddcd5ad40ecd9fbc9f5a7a2ed0e1e74921db3c.

This patch doesn't work quite well - It's observed that with this patch
HFP is flaky on most of the existing USB Bluetooth controllers: Intel
chips sometimes send out no packet for Transparent codec; MTK chips may
generate SCO data with a wrong handle for CVSD codec; RTK could split
the data with a wrong packet size for Transparent codec; ... etc.

Cc: chromeos-bluetooth-upstreaming@chromium.org
Signed-off-by: Hsin-chen Chuang <chharry@chromium.org>
---

 drivers/bluetooth/Kconfig | 12 ------------
 drivers/bluetooth/btusb.c | 41 ---------------------------------------
 2 files changed, 53 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 7771edf54fb3..4ab32abf0f48 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -56,18 +56,6 @@ config BT_HCIBTUSB_POLL_SYNC
 	  Say Y here to enable USB poll_sync for Bluetooth USB devices by
 	  default.
 
-config BT_HCIBTUSB_AUTO_ISOC_ALT
-	bool "Automatically adjust alternate setting for Isoc endpoints"
-	depends on BT_HCIBTUSB
-	default y if CHROME_PLATFORMS
-	help
-	  Say Y here to automatically adjusting the alternate setting for
-	  HCI_USER_CHANNEL whenever a SCO link is established.
-
-	  When enabled, btusb intercepts the HCI_EV_SYNC_CONN_COMPLETE packets
-	  and configures isoc endpoint alternate setting automatically when
-	  HCI_USER_CHANNEL is in use.
-
 config BT_HCIBTUSB_BCM
 	bool "Broadcom protocol support"
 	depends on BT_HCIBTUSB
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcaee5cd728b..b7040747b890 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -35,7 +35,6 @@ static bool force_scofix;
 static bool enable_autosuspend = IS_ENABLED(CONFIG_BT_HCIBTUSB_AUTOSUSPEND);
 static bool enable_poll_sync = IS_ENABLED(CONFIG_BT_HCIBTUSB_POLL_SYNC);
 static bool reset = true;
-static bool auto_isoc_alt = IS_ENABLED(CONFIG_BT_HCIBTUSB_AUTO_ISOC_ALT);
 
 static struct usb_driver btusb_driver;
 
@@ -1121,42 +1120,6 @@ static inline void btusb_free_frags(struct btusb_data *data)
 	spin_unlock_irqrestore(&data->rxlock, flags);
 }
 
-static void btusb_sco_connected(struct btusb_data *data, struct sk_buff *skb)
-{
-	struct hci_event_hdr *hdr = (void *) skb->data;
-	struct hci_ev_sync_conn_complete *ev =
-		(void *) skb->data + sizeof(*hdr);
-	struct hci_dev *hdev = data->hdev;
-	unsigned int notify_air_mode;
-
-	if (hci_skb_pkt_type(skb) != HCI_EVENT_PKT)
-		return;
-
-	if (skb->len < sizeof(*hdr) || hdr->evt != HCI_EV_SYNC_CONN_COMPLETE)
-		return;
-
-	if (skb->len != sizeof(*hdr) + sizeof(*ev) || ev->status)
-		return;
-
-	switch (ev->air_mode) {
-	case BT_CODEC_CVSD:
-		notify_air_mode = HCI_NOTIFY_ENABLE_SCO_CVSD;
-		break;
-
-	case BT_CODEC_TRANSPARENT:
-		notify_air_mode = HCI_NOTIFY_ENABLE_SCO_TRANSP;
-		break;
-
-	default:
-		return;
-	}
-
-	bt_dev_info(hdev, "enabling SCO with air mode %u", ev->air_mode);
-	data->sco_num = 1;
-	data->air_mode = notify_air_mode;
-	schedule_work(&data->work);
-}
-
 static int btusb_recv_event(struct btusb_data *data, struct sk_buff *skb)
 {
 	if (data->intr_interval) {
@@ -1164,10 +1127,6 @@ static int btusb_recv_event(struct btusb_data *data, struct sk_buff *skb)
 		schedule_delayed_work(&data->rx_work, 0);
 	}
 
-	/* Configure altsetting for HCI_USER_CHANNEL on SCO connected */
-	if (auto_isoc_alt && hci_dev_test_flag(data->hdev, HCI_USER_CHANNEL))
-		btusb_sco_connected(data, skb);
-
 	return data->recv_event(data->hdev, skb);
 }
 
-- 
2.49.0.604.gff1f9ca942-goog

