Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BD01A3159;
	Mon, 10 Feb 2025 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173188; cv=none; b=JKLsxHosUKnxZUVsNh1nUvl2EKJTdYtBjBDyFxkN5YXAQRErahk0JH1myrjAF+9GnRYaPm0crF5hOc02HpiTXlk46s7tpKVoCHeKJBWAWXeR6NaiRvL2Ny5yudHYC74vp+T20qBKnj6YN6aU4aGsSf1E7K4uCjxkfZM/wpCGAFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173188; c=relaxed/simple;
	bh=/MhUaxMiXFtrw1l+HuClnUI74j6x65PHqprv76q92dw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7Vhh/FwwSuo1umEfEHQfZNpRXeNRbcXAEE89Qruuv6qycAFMRjKHxcoa3ahLPGGFWqUOXflsYuekzkT7vs4xiE3ytOtnFKUR9D/7KZvNnAYkgrTGbxrt70JDTLdy4RxMpT5SSC4tuDWS1hxrsAG0uguTvDNOkHLqwTnovycW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jawnz0TL; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jawnz0TL"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so5210331a12.1;
        Sun, 09 Feb 2025 23:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739173184; x=1739777984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElG9QHShsG3QPSus8iOZDuN/TU1JSfnKVnU9TxLdqKg=;
        b=Jawnz0TL8Adllc+231bO/CgaJGF/duZdLquKE5sTS+YEm0VuI12tbju+jCCQ763mbf
         9LcP7rAh0wmvc80NPQH6RGCTUHX5u64KrH5ndtoVxgpEb1QPEaCYCrXc/dcrCdhYNVUR
         B2gODvmRwDwNVWMHR+8aPNRcZe4RgHjLt3wnO1a86HcUkPOY+i+SPQ82bFtpN+SVEtXb
         KPKoQB2LmmRa1HxFMFcgLBKL2IphjwHsEs0rSIy/oGYH0egnXffYu5BOz88xnPjDKAA9
         DAHe5hMl4WbnFM9vqsDp2tw745LUU2lYbDdX5TORYgC/a8KAeDGKEdSECBfkU20NZeZP
         m1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173184; x=1739777984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElG9QHShsG3QPSus8iOZDuN/TU1JSfnKVnU9TxLdqKg=;
        b=PrX7ze2BLOUNypLyO3cExxSVwFSYneysXU1pkVvstFSAECs2uui4oxqKBbEkmvr1Z+
         VL6eeC3OGD8JfX2h5+MU6cC6yGjKF2sGdAc1sIm9f75L6w5z2Gycic8FlUu5c9pWE1xL
         MhxX3Ms/LIvydEdWUSAUdxvmWj6Y/Rjom/X2Mx1ZznEZVAidcKr0lie+SPOvVacupS5Y
         mIiyDtgraBUC2o1y9GXcx6Ias1F9Dty1OjEVIHruZecIct0NoBV5mhi9CkviBBFdD0fM
         AChJcTKSiCBZdfQw+EtOolgTF+EMDB5fzvKNo2GcsVAmZsy4JJyL55uJudABVjuxZaoD
         jIyg==
X-Forwarded-Encrypted: i=1; AJvYcCWjsg2jRoOBS7l4VHW1lEHTlbDV1fYkL0MvRHfKA4nxN5sCRTVrCybynrSmBuxGJtBr1OjSbR+XSCFdsrE=@vger.kernel.org, AJvYcCXQtv36Flg9aX3IQxwFOzaEs2GEKKaUMhPz39FbUw6c300tPfkxbXH6A+9iUwRUe9f2mVDS1t4yDemO@vger.kernel.org
X-Gm-Message-State: AOJu0YxjS6NmsRE7QnB20ffmuT0f5LWKNQKt3V5SWqsoyXlvSvB3nykq
	r3UMuU3D+DvGo1FIWqVSvcnkKSHfnV/kPI1Z8umDAsDGL2agv+Wx
X-Gm-Gg: ASbGncti2G3R4kITyJIKSYamblzcIkVpITAW4AR6/zkNTCniVhPBsv5OfxwAfkpxPj+
	RHZsu/dsDoUAE8OMmUhwWJEItqqzOkamtXx6MDWsvqx2it6vJWP0TfE486S6TZlJC2bx0wFxHiz
	NBa8YfpgbO06/ZaJnR56ZvQDA6jDY5+sC4VWBxpPHZRqhGaiPaOFPuzCyxuB+7qhCzvw7M23AAn
	pwsBIa3k55U2A6L0jkUs3OnlImyvMwx+iJUNymxsmZipMzHmVXgYG45/r2s/SucR/byrsPygjmu
	FfoD8gvhdQ8Fvm2riQWn8sKhZeNxcr2o
X-Google-Smtp-Source: AGHT+IEkEAyX/0W9vuSkw16lXtvFgCGrx/a3k3X9899oxde55ynWWq5pMfdYJjB9Vl34bnPB2ut3LQ==
X-Received: by 2002:a05:6402:2106:b0:5d0:bdc1:75df with SMTP id 4fb4d7f45d1cf-5de4508dc71mr13640776a12.24.1739173183444;
        Sun, 09 Feb 2025 23:39:43 -0800 (PST)
Received: from foxbook (adtq181.neoplus.adsl.tpnet.pl. [79.185.228.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4bd92f60sm5693293a12.71.2025.02.09.23.39.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Feb 2025 23:39:43 -0800 (PST)
Date: Mon, 10 Feb 2025 08:39:40 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman 
 <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] usb: xhci: Clean up the TD skipping loop
Message-ID: <20250210083940.626c02d9@foxbook>
In-Reply-To: <20250210083718.2dd337c3@foxbook>
References: <20250210083718.2dd337c3@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Half of this loop is code which only executes once to deal with cases
where no TD matches the event and then immediately returns. This code
has no need to be in any kind of loop, so get it out.

Shuffle the remaining conditionals a little to improve readability.

No functional change.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 68 ++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index af6c4c4cbe1c..9b06a911a16e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2866,9 +2866,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		/* Is this a TRB in the currently executing TD? */
 		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
 
-		if (!ep_seg) {
+		if (ep->skip) {
 
-			if (ep->skip && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
+			if (!ep_seg && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
 				skip_isoc_td(xhci, td, ep, status);
 				if (!list_empty(&ep_ring->td_list))
 					continue;
@@ -2880,38 +2880,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				goto check_endpoint_halted;
 			}
 
-			/*
-			 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
-			 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
-			 * pointer still at the previous TRB of the current TD. The previous TRB
-			 * maybe a Link TD or the last TRB of the previous TD. The command
-			 * completion handle will take care the rest.
-			 */
-			if (trb_comp_code == COMP_STOPPED ||
-			    trb_comp_code == COMP_STOPPED_LENGTH_INVALID) {
-				return 0;
-			}
-
-			/*
-			 * Some hosts give a spurious success event after a short
-			 * transfer. Ignore it.
-			 */
-			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
-			    ep_ring->last_td_was_short) {
-				ep_ring->last_td_was_short = false;
-				return 0;
-			}
-
-			/* HC is busted, give up! */
-			xhci_err(xhci,
-				 "ERROR Transfer event TRB DMA ptr not part of current TD ep_index %d comp_code %u\n",
-				 ep_index, trb_comp_code);
-			trb_in_td(xhci, td, ep_trb_dma, true);
-
-			return -ESHUTDOWN;
-		}
-
-		if (ep->skip) {
 			xhci_dbg(xhci,
 				 "Found td. Clear skip flag for slot %u ep %u.\n",
 				 slot_id, ep_index);
@@ -2926,6 +2894,38 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	} while (ep->skip);
 
+	if (!ep_seg) {
+		/*
+		 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
+		 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
+		 * pointer still at the previous TRB of the current TD. The previous TRB
+		 * maybe a Link TD or the last TRB of the previous TD. The command
+		 * completion handle will take care the rest.
+		 */
+		if (trb_comp_code == COMP_STOPPED ||
+		    trb_comp_code == COMP_STOPPED_LENGTH_INVALID) {
+			return 0;
+		}
+
+		/*
+		 * Some hosts give a spurious success event after a short
+		 * transfer. Ignore it.
+		 */
+		if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
+		    ep_ring->last_td_was_short) {
+			ep_ring->last_td_was_short = false;
+			return 0;
+		}
+
+		/* HC is busted, give up! */
+		xhci_err(xhci,
+			 "ERROR Transfer event TRB DMA ptr not part of current TD ep_index %d comp_code %u\n",
+			 ep_index, trb_comp_code);
+		trb_in_td(xhci, td, ep_trb_dma, true);
+
+		return -ESHUTDOWN;
+	}
+
 	if (trb_comp_code == COMP_SHORT_PACKET)
 		ep_ring->last_td_was_short = true;
 	else
-- 
2.48.1
