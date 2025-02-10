Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345771A3159;
	Mon, 10 Feb 2025 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173347; cv=none; b=nuVrip8FeOAojy9kL2SP3yBBk4EplXgcTM4i1NdB3gmfKEvMAiJjmEhsuKboy628vhM81a09TMMfNPwXNVXWx6Yv/hw4KiNjw8Pm+kbXOFIX41Nz5yGfLzcXMpBREJBi4/YcCOAKoGd+JfNQvDkftbf4Z7uho4fY1JftyjjfoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173347; c=relaxed/simple;
	bh=QSeVFrS8AlRqMMnu5KVH+XMuflenwRZOO6LZ39/DS28=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f7F7LODxW5lZi2EaMJa2gneZK+guvlH9JWXjwocJeDuniEdgkugQUtcMsMnAzvRiS35FuVDRYzkongKJxpuBle2EeL/0chz6GxDu6f8g/ZMfSzTDXM11YFeHHDhdnu+EU8guSCL7SQro6kV0vlgRLbL/SKZru9mLDwdP+2l0SNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lg463z4c; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lg463z4c"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab78d9c5542so470461866b.1;
        Sun, 09 Feb 2025 23:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739173344; x=1739778144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltfGinCJ7NHfrB+q5DH7Wu/bz6rIJOHJC14+oF7o8aE=;
        b=Lg463z4cDCXrxvmQic2S6BYhduZNUcioZNbFoIjd98Mf/LZFtO7b9OpJFlbMk9bZSQ
         lq2E2IQnL+Qb74UlJlYkxe19qRWyNd7fzdQU7yRj5xOnTFfzaiGXnMdHABT4cjDZjAwx
         44L9TbFPLImQe7lDS9xBmFpdVaS22K0V6gAgaNv6wglVYZlHfirc7zwN1JbpC2qapUNu
         u0kNX7dEaOUqKyFYdLINwRNSV66yEKkLT4DiMWl5vx0Qi62X2vNFTaSKCcVp/X0Rbkr/
         QjtSaWWTShEG/e3Lv2e5HFXdpiXKzHig4DuuKZ+23ubIeiQvaonL6NmaEbLIMsrRPzBS
         M/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173344; x=1739778144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltfGinCJ7NHfrB+q5DH7Wu/bz6rIJOHJC14+oF7o8aE=;
        b=nM31m4Ho2KieF4CDsT1QshZjKk5lb+OOaOn/qPxKHNFqHLl/TnJso7medmww49Fp7o
         X5ZVqnhtparwzpaO95IZE7gQhdyhd06fj3pz2Q+1AEnwHzL0KRelfehjh/9hMDC7M6kA
         rOQiHTDJ6am6jmxRb+Kub4X3k0QRSBeFaR7m3yhsLzyX7rMu6lhNlM98n/nywcxWUSI6
         pamY2QSQ/aE4bH2GWXJy1rn/oejlX2dd365j5qjL+EWg+bptMlwuLtuJbh6xHTqtsA9w
         uiHG2THM+7hheLMxqBUban77lJO8U8cZYZIx2gDVWdKRSkfw+7SnxGGuU8lm4rhq4q3B
         j0+g==
X-Forwarded-Encrypted: i=1; AJvYcCVA89t/Gd0Yi9kPCY9VE6XFiZ0BW8ICKB/tK89FYDuYLgMN+IQ4IMY0NE12KEMoi9hbLkblY64hKD0hp6I=@vger.kernel.org, AJvYcCXmdQRmlPSUpwu9E6+U8taxoShSCmvd1OZ+KUIC5PIpE9j9VNZOHUQla6+tHnFf5BKAZhtGiAvYreHh@vger.kernel.org
X-Gm-Message-State: AOJu0YzmUj1jwwlUhfKMgDqdSxuYlKNh9/gjMwoJ0f7BMEaN4FDYoEmI
	Nj/cnHEz27YRglfn+gDZT8GGlvimpyYiPVvR6CsHv+km85hPXfmS
X-Gm-Gg: ASbGncvcEjbvJZoQ67rYgsyNy1pDdWPQmpxJXsbYnAxay+80MgAPmJ/m/VxaIMXl+pW
	t091NTXhl3c9u8ZNmlB4alGK8BWyuBNbGRr6tU07GrgxeAFAT8V97jABnuRE5AjuUJWWcLHrCYq
	mUfTDTBJBj1V2KmmNhZsLPYi5APD9KZpMPNFEJ7A+rpukcd9c7to5RfV3TyE1Khx/fylBN3PaDk
	Ld6Ji+mCw35R78rfL8RXtVnDahr29mNAhaiM3cSbhr+LEq5oXrfQWJzcIn9ZvyTkTf7AHf/5uQh
	0IIDCqYWohmpeYJfnOaIbeOqgBn0WZeQ
X-Google-Smtp-Source: AGHT+IGSeWpHu/qJEW7zfEADCO3fh7nw3R6ZvVw1kcqO7eQWmoYB4onDA2ciAEdKNsc9ooJau7TgaA==
X-Received: by 2002:a17:906:46db:b0:ab7:9f12:6787 with SMTP id a640c23a62f3a-ab79f1286demr749705466b.50.1739173344134;
        Sun, 09 Feb 2025 23:42:24 -0800 (PST)
Received: from foxbook (adtq181.neoplus.adsl.tpnet.pl. [79.185.228.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cf027239sm33229166b.181.2025.02.09.23.42.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Feb 2025 23:42:23 -0800 (PST)
Date: Mon, 10 Feb 2025 08:42:20 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman 
 <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] usb: xhci: Skip only one TD on Ring Underrun/Overrun
Message-ID: <20250210084220.3e5414e9@foxbook>
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

If skipping is deferred to events other than Missed Service Error itsef,
it means we are running on an xHCI 1.0 host and don't know how many TDs
were missed until we reach some ordinary transfer completion event.

And in case of ring xrun, we can't know where the xrun happened either.

If we skip all pending TDs, we may prematurely give back TDs added after
the xrun had occurred, risking data loss or buffer UAF by the xHC.

If we skip none, a driver may become confused and stop working when all
its URBs are missed and appear to be "in flight" forever.

Skip exactly one TD on each xrun event - the first one that was missed,
as we can now be sure that the HC has finished processing it. Provided
that one more TD is queued before any subsequent doorbell ring, it will
become safe to skip another TD by the time we get an xrun again.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 878abf5b745d..049206a1db76 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2875,6 +2875,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 
 			if (!ep_seg && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
 				skip_isoc_td(xhci, td, ep, status);
+
+				if (ring_xrun_event) {
+					/*
+					 * If we are here, we are on xHCI 1.0 host with no idea how
+					 * many TDs were missed and where the xrun occurred. Don't
+					 * skip more TDs, they may have been queued after the xrun.
+					 */
+					xhci_dbg(xhci, "Skipped one TD for slot %u ep %u",
+							slot_id, ep_index);
+					break;
+				}
+
 				if (!list_empty(&ep_ring->td_list))
 					continue;
 
-- 
2.48.1
