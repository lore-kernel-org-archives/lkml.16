Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9933C1B87EF;
	Mon, 10 Feb 2025 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173304; cv=none; b=TPNo9j2CU8QN3SjFWZ19lmWCWscp7nwmpCsuw9fVkGyYaeiuGrm4QegNudAK67bIhFMRfoFaXKtao9c9A9v8amMY3pZQGtebZyZb+m+ZV+gC3UARDgMEq5uuvggOkAiDU4U/9i5JTA8JMxEPztjnIDZxD3dY/MOI7OEGoJxgm4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173304; c=relaxed/simple;
	bh=4wZ2PXfur8egXNnwBo7N5ubOAev+hvve+Oxty/JG0Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvaLlIZedFgsbPZZXPpUXrDEBXkCt/Bn+WPWXFeNKpVN12KY5ESnSW/puMunAk0YPSSaf4py0xMYwXs9nP/tkSAIfKYNXLYsnkDBPKBbpcH8luibU7cJaHq+bPVciePzXJMtdBN8sW+ySq6Py3sHO8Zl3n0HjT3c81TrEC8kOiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3qnT9jl; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3qnT9jl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de6e26db8eso1986744a12.2;
        Sun, 09 Feb 2025 23:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739173301; x=1739778101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2RcdX/GqwE9yRHPGubP2yGFF/DbcGETjEu0NPc+ZSE=;
        b=L3qnT9jlIDGjf/NIQik6CZ+WpIKDAubpItUdRNKwZiYt9fW+WTFtZwGFHsUZe0dKOA
         pLvLQ2lPsZjuyt61x+kH6RljoKpteZrSu49TmEf/56FyOlgxtcJAePBSOtN4CnzRGHgT
         EiaWvTVtWUl6fqkpdZvSl0UGszYdnYRSNwyYhAcSTMuOMXoLpQHK/tv+DZH2hYequdWR
         W1GFtFqUbARMKksAhe2f0i4Z1GC3YcpvIZeijnmUA8knrSSQjObn+91G8Fmre6YAiuI5
         7/TAu0Lc4FDRWy6ifGpA2uvCnOocPxZDYH1vqIB3v5xC1wEyAsGvAhdga9r3cZxsdRGI
         hBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173301; x=1739778101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2RcdX/GqwE9yRHPGubP2yGFF/DbcGETjEu0NPc+ZSE=;
        b=bncHvzEBKh4WS2j++ErcKH4EAaywX+dXcHROXdhhtT+RqAcoU0yfzVwXDVDLNBioJ1
         XkjNmH1kPoChMbEVoSeNDNod7irnqNKysMETYszcpysw/41a4xwWF5gKA6I+gGaJkGY7
         UFe8qvBLTqPSfcExjdB7Lksc+0ezBMg/TslKBavT+IgR/Tj2bRXHZBpvGc4g0e0yIcCg
         Cd6sc3YtBSdEjlkdcHkoamBzwqGrf5k3gyGB0bib/gaeBnkg1qON0xM0Ae/ZNNMR0KzV
         AM57cbyVkiQoq4q84YNtdwIGYym6IWd90WVcBIm+v279fUPguyxR9el66AvC2j/41Hsg
         b8Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUsv3cvntFN+QuplO7n3hJ5F7hPHitjmxLcINO513RPDFPs+cgNUVmX0pgVAohfzf9X3c31mqP+3eB0HXE=@vger.kernel.org, AJvYcCWLZ4enBCE+HxyDEtrjmXQujRQXoqFa2w3gyPW6WFvB4eaGYdReNPRJBssDXtqb2lPGYeOHQxa5qKVR@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBax13wctG7vAMXeFd/LQJt3yiCuSec5sBEuxs8JqbwNkHJsW
	Dg6lDzSviZ939Yp5Z32BHQEa3wni18dKrCRoYb8Bv8UQ5K3RHHfMuE6F2A==
X-Gm-Gg: ASbGncsjCzH4R7SahBuxUG5yt926GtOZcbBPv84PA+5N4D1Xr5/WCt0YK31r3blS0aU
	BnZIilJ6XousSTz4rD3K2tlCIK6iyl6dh6XtSXnM/SE7X6332Ywb4UBBC5dxeN0tO0dZ/2LTmKD
	8U2TNcts2QzAfSivNJQxnVUKm+gbzoUNryeudPjKTkaAlTE1+LvpAllzsP0menZ6iTOBayLPTxw
	hxmj/u74uHj2NZHr8SJCh0X9f6Tbf6OzT+o/dcKNl6QMXqjtiNg6noyIkOPu2ALV4mj0MxY9IEP
	30SS9TzT1Kaf+Q4qeYjxmT5a3LjE219b
X-Google-Smtp-Source: AGHT+IFmHEz01JMwmgTiCyvn2884m6vS3unuxdPrSqOcyaZhFaMbZz9SzHMSUQZjiq8nwJ320QX/GA==
X-Received: by 2002:a05:6402:1ec5:b0:5dc:545:40a7 with SMTP id 4fb4d7f45d1cf-5de45005b92mr15481607a12.12.1739173300626;
        Sun, 09 Feb 2025 23:41:40 -0800 (PST)
Received: from foxbook (adtq181.neoplus.adsl.tpnet.pl. [79.185.228.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4ba95a32sm6086993a12.40.2025.02.09.23.41.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Feb 2025 23:41:40 -0800 (PST)
Date: Mon, 10 Feb 2025 08:41:37 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman 
 <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] usb: xhci: Expedite skipping missed isoch TDs on modern
 HCs
Message-ID: <20250210084137.5f4cc906@foxbook>
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

xHCI spec rev. 1.0 allowed the TRB pointer of Missed Service events
to be NULL. Having no idea which of the queued TDs were missed and
which are waiting, we can only set a flag to skip missed TDs later.

But HCs are also allowed to give us pointer to the last missed TRB,
and this became mandatory in spec rev. 1.1 and later.

Use this pointer, if available, to immediately skip all missed TDs.
This reduces latency and risk of skipping-related bugs, because we
can now leave the skip flag cleared for future events.

Handle Missed Service Error events as 'error mid TD', if applicable,
because rev. 1.0 spec excplicitly says so in notes to 4.10.3.2 and
later revs in 4.10.3.2 and 4.11.2.5.2. Notes to 4.9.1 seem to apply.

Tested on ASM1142 and ASM3142 v1.1 xHCs which provide TRB pointers.
Tested on AMD, Etron, Renesas v1.0 xHCs which provide TRB pointers.
Tested on NEC v0.96 and VIA v1.0 xHCs which send a NULL pointer.

Change inspired by a discussion about realtime USB audio.

Link: https://lore.kernel.org/linux-usb/76e1a191-020d-4a76-97f6-237f9bd0ede0@gmx.net/T/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 11a53e310826..878abf5b745d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2476,6 +2476,12 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		if (ep_trb != td->end_trb)
 			td->error_mid_td = true;
 		break;
+	case COMP_MISSED_SERVICE_ERROR:
+		frame->status = -EXDEV;
+		sum_trbs_for_length = true;
+		if (ep_trb != td->end_trb)
+			td->error_mid_td = true;
+		break;
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
 	case COMP_STALL_ERROR:
 		frame->status = -EPROTO;
@@ -2786,8 +2792,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		ep->skip = true;
 		xhci_dbg(xhci,
-			 "Miss service interval error for slot %u ep %u, set skip flag\n",
-			 slot_id, ep_index);
+			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
+			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
 		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
@@ -2836,8 +2842,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
-	/* Missed TDs will be skipped on the next event */
-	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR)
+	/* If the TRB pointer is NULL, missed TDs will be skipped on the next event */
+	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !ep_trb_dma)
 		return 0;
 
 	if (list_empty(&ep_ring->td_list)) {
-- 
2.48.1
