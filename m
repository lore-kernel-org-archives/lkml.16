Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753F71A4F22;
	Mon, 10 Feb 2025 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173115; cv=none; b=QUVm5Tnh2mUtKG5DDKIIusCFq5nqmN3WAXDG54FttBOYLZW6IRLTER0M2VoeAdclK0MaIN9LVH2V8pSB/2JCatUYOpvkT1Wq1QNxnQjxDqlyoDVTH58UvqhZDHlpgLnSfkbKpcHJZp9bGIhCRwrT36+U2uSK04Ukii4xnLuWh6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173115; c=relaxed/simple;
	bh=rzLIcW6Uwg2iq/oUVo2eRQXjftKxEPX7IwkRPXp5qHg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i57/SreI5AXCGdLHLv5TfXSRRlBxgubrEq0Nu+Qh4Tcv8BJ1i+NtN7JQ9/OvtCeXRjjI45l5IXOjQt29EIY7xM7RDVs+FSwKrS1VaQOF1t+o3eNXOaaaAoH1hGtiCyjjSqzU1jIpyTJloCqdM+p9R3J89UxXb7AqNlV2B3ejbTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoebXdHy; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoebXdHy"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7c501bbecso80690566b.2;
        Sun, 09 Feb 2025 23:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739173112; x=1739777912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDIUrVZk2er48UMv50fmo3VWNeX5XafyYFDhgvhEonQ=;
        b=YoebXdHyeu936voebMRgXrfKTV+rtsStHYBwyikfpKufJlUQ0/5WN748F3dtE3P1zN
         fLisPCNhbq25Fo3AZIy9277SgNpTMAtO2QTjJoXPNNwrURyvlOI8FZHm8x/DZMu1PScE
         z4NxW6SNBbQy37+rEbmeOUy9/OwGQehO7Oq/sPBgi/Dgb4I2dbbL1cK/4ZeKmp3b6jO9
         usNvQp6qU5zusACn8UxaM+rEWweXxNagIGhgp2KOm8RWrklcIDADxclgvq7xxFmX6s3S
         K6JOP8i1r5gqgGNU18qZXL/QKKhUpXZ0KBJ32mZsvxTcypNuAbF22pEy/QKQ1tn+M9u3
         XH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173112; x=1739777912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDIUrVZk2er48UMv50fmo3VWNeX5XafyYFDhgvhEonQ=;
        b=rs4PkQlbFXmKkSRJo6VkU7f5M92sZIPFe8cR86LzDrY+fRhGMnXKZOyhyy+7NgD/Nz
         ryMBycZhEbTBYimzjqg86iRVl3OOs8Z5C5pDBZlR+1cuRBw96ntndCXGQShyJ9rlUerN
         U6iWwyOR9HLM5CTdSd7wa8LL+HYCYQqzREmMSrnBNjyewGmegovC8Yk1ODdNcV1GgESW
         J6H87DhvVk/D75DmLGaInxJoY81kspWVw+BJlStzblxL5+11nS3g8orCzAHyJIJsBnFD
         IjP9SUxZF2umv6tsFYJTFCELVtgk1Xxbv3PO88Fje4vQ/MGSy5CFweG5I+pbzJeokB0e
         9v+A==
X-Forwarded-Encrypted: i=1; AJvYcCWWeBnHHYV1uIKUdrN2dWKJvTJxxQFHQv3/gfQZUVvH9tZVVLcPnRMu9M1noS/VrW2U9hkkMzCE9R17@vger.kernel.org, AJvYcCWiF11ko1/LnmepNiyvzF0f7ynCL3S5CIx6XrA55dBB+UCrE48YyV/rIjFHEZik8cNlX+QyRWMBZbcTSnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXOs16v98DMx4vm+OiCsPbvbLXxwraItuZKFNK/iZi9zR4Xde
	Rkokr+pFmKa476hPNwGnbJVEwULKwaJ+I0GC7UY0jyrDQW/ysmca
X-Gm-Gg: ASbGncvsUdcJxR86t9aq2i0NeDn0hfo5CbsVF2NVnGihxfDMjvSGuQZQmCe7oxXCZO+
	+pzbvW2JF3Xe9nxJF186pJvnPlyo86pvGpVQd7VhRQqd84qBZhoV4wEmdQnYalRoYcQvHVZbjlX
	URFwgBQG7lL494Dg2goupYhbQkay04Q/J+q2HwCwQjokiNy0FIMl33gkkGptolbSM38Woz0SoT8
	Br8aY8oyZCC9/fSL9HjyEr5Ayp1QpAsHP6wpBeLp5SOAfNEfehD6G6A+IOG4y+NsR0/D/LpEqAH
	Pr7qQzHDvaOI+KZncWTEGveelXOjJ3CO
X-Google-Smtp-Source: AGHT+IG1xp7UAiVEChw5JbzI1UtuChPcdyi/g+FxQX1BvtBENBaFaPlJ4WcJOREOP9WIjsZ+qOjo4Q==
X-Received: by 2002:a17:907:980c:b0:ab7:758c:b398 with SMTP id a640c23a62f3a-ab789ac0dacmr1317854066b.20.1739173111427;
        Sun, 09 Feb 2025 23:38:31 -0800 (PST)
Received: from foxbook (adtq181.neoplus.adsl.tpnet.pl. [79.185.228.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79792121dsm543968966b.124.2025.02.09.23.38.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Feb 2025 23:38:31 -0800 (PST)
Date: Mon, 10 Feb 2025 08:38:27 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman 
 <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] usb: xhci: Complete 'error mid TD' transfers when
 handling Missed Service
Message-ID: <20250210083827.2de46507@foxbook>
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

Missed Service Error after an error mid TD means that the failed TD has
already been passed by the xHC without acknowledgment of the final TRB,
a known hardware bug. So don't wait any more and give back the TD.

Reproduced on NEC uPD720200 under conditions of ludicrously bad USB link
quality, confirmed to behave as expected using dynamic debug.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 965bffce301e..af6c4c4cbe1c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2789,7 +2789,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dbg(xhci,
 			 "Miss service interval error for slot %u ep %u, set skip flag\n",
 			 slot_id, ep_index);
-		return 0;
+		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
 		xhci_dbg(xhci,
@@ -2837,6 +2837,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
+	/* Missed TDs will be skipped on the next event */
+	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR)
+		return 0;
+
 	if (list_empty(&ep_ring->td_list)) {
 		/*
 		 * Don't print wanings if ring is empty due to a stopped endpoint generating an
-- 
2.48.1
