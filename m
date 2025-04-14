Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B60C539A;
	Mon, 14 Apr 2025 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744618804; cv=none; b=nhss6KnF4I0M2YbNi6NesWf2UDLoin6G7rHw/S9kl2f+ZvwAv9pKcYE3jDGh2yFQfNmbd3icjWDlGYCSGdIFy7oDPTetwfe56vsbtwKwgvPu+u7MbVw819iqNAJCwnfo4r9NK9QIg2GBouMtpS9+eFJ1dT5XvtblPjMkhSbUWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744618804; c=relaxed/simple;
	bh=921UJBwucqo6WhFaTNUPLq6nDESb4p9JH8c+5DSE50E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYPefFLSCqy7+Nh2iXf5WglmC8FWBkCV0hlpD1dRn4Kole7NDR1ftmZIxe4RXyQ+G79b6KGYUZdxC7x0ncflgT1CAgYvok8x25+UIK7YJhClEUrZ6AGcopnCJX0I9DwqcNIvgyLD67pPZXjzCZRs1ejItEKEfcBBke/8R79bjhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPJINt8o; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPJINt8o"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b0d638e86so4833488e87.1;
        Mon, 14 Apr 2025 01:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744618800; x=1745223600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbtxxyXPpc2dpTDo42aLDWwzEfCpiBSfMneX/Gg1X0I=;
        b=lPJINt8ol7IBbICbsMBTlyjtGdm+jvZNMbq0nfLdmhz0C+ef7k7zDMIanc6v+29lu4
         dbciG9Njis13FK4wsyWhRrG3iO6vpvcPqZwFX5ZnLlbw0yZLYkIkNnHgFn2CVVW6z+H5
         WGa4v4I5AvWLIKfvpAS5asmRdAAN8bkP+yr+l5hNEpOgb18W2EsriKaBZ+SnxH+AtwDH
         I/j4jPDEzbfbcwBgw04G6IqWpEwQ3eYTNr3TtbDas7Bxxyc90dQ4Vx6cB+LTfXi4pV8B
         0H0q6NnglBrLwQR9dsNI7GqxrMa1oLpkNB8ct4NwNyuSY/zX/ZQeqfoNk8yOwvr8ukdx
         p66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744618800; x=1745223600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbtxxyXPpc2dpTDo42aLDWwzEfCpiBSfMneX/Gg1X0I=;
        b=km6y+d/8NwEbls7G+Uil5QYT8HEIvCnxC8uMO0EDcT0/D+aAETg+cQs6BQHSr79fb0
         5c1Wn3zeq11RZHNHIB2i9PnbBLh0vr1mo/Ylg5TFt/iukIG3qUWmj+gFSwRcgHvxXRXx
         KM6bLLsI14Y3q+rRr8HKauD8oqayFnQdM3NYHps8ZcoN+gJDx0lK5b1T4DXUOviD51fe
         x6uR6HoyEwyHsjsImAVfDop88NVr9lVEmi+1288RvZpoYJ9An3iys8YlxxBfZ61waDnT
         l8aLUBso5HyOSpvlFjWmYaPK40ttT34YCQbEB6CmEMKvyBAx6aP+QM+x35T/wcIrDcnF
         C1rg==
X-Forwarded-Encrypted: i=1; AJvYcCUwdlerpkVkp9ONiLf+qKphBs8f0ZLtv7lb/9Fm7sAaIlwcHcb74QOCCCxsS3J2GHCS4E8ff/Ryl/eaiHg=@vger.kernel.org, AJvYcCW9CEBNvfkDvO5rV9LxhyRB5YMjEsEctK04E0dPPOmHwiJagshOhd9faqKvCVwjkOPyeyT8UJF9acOD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4a/AG6+ltEiQMIEQC5wYGuSnAqHApchEced0YE28It8rlqiM+
	zv2M6hllHXCY4kKSMCZ6V8T6umoIR9blanBJflm0djsLPqbP7xxV
X-Gm-Gg: ASbGnctRy5M/M3gF0YQd07Qh7weSQElTepGv1eFoXxClYPQ5U3hhehnjGSOGPDlc5CQ
	vH5W3crEQE69XBgpdLHCHmQs/N3cy1/HWeyybWmCKNgdk2FRI28goqKnlfJu0HFw0i6aYgoye76
	1+McmCqMxqiD/45ZRzh7ho4iVaL3M+6LyQUdalUFkNazMRSbyyaS/BWW8ekTtnBWGam7x7A8aqz
	yBW8mgUrLWRn83zALGwHaQup8eyT+goYpmjoDqzRqjeten7veyPkO3Ri6qgsYyXoTSF9ZMrL0ny
	6MLa5P6HUFIAYs5v0otnlCi21zTmWRSjwk2weVfonVrZ9OvKP7izw9D/ow==
X-Google-Smtp-Source: AGHT+IHCUUc7TrbLjYtvVCuGjE5/uzvtekJl136OTbqXGleifs/ZTfVHcpryTSz0gNM9fr2uN4CiNw==
X-Received: by 2002:a05:6512:2385:b0:545:6fa:bf60 with SMTP id 2adb3069b0e04-54d45293cc2mr2962444e87.19.1744618799976;
        Mon, 14 Apr 2025 01:19:59 -0700 (PDT)
Received: from foxbook (adtk197.neoplus.adsl.tpnet.pl. [79.185.222.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d122e11sm1030861e87.5.2025.04.14.01.19.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Apr 2025 01:19:59 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:19:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Jonathan Bell <jonathan@raspberrypi.org>, Oliver Neukum
 <oneukum@suse.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] usb: xhci: Don't trust the EP Context cycle bit when
 moving HW dequeue
Message-ID: <20250414101955.49a5e402@foxbook>
In-Reply-To: <20250414101850.2d6becf2@foxbook>
References: <20250414101850.2d6becf2@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

VIA VL805 doesn't bother updating the EP Context cycle bit when the
endpoint halts. This is seen by patching xhci_move_dequeue_past_td()
to print the cycle bits of the EP Context and the TRB at hw_dequeue
and then disconnecting a flash drive while reading it. Actual cycle
state is random as expected, but the EP Context bit is always 1.

This means that the cycle state produced by this function is wrong
half the time, and then the endpoint stops working.

Work around it by looking at the cycle bit of TD's end_trb instead
of believing the Endpoint or Stream Context. Specifically:

- rename cycle_found to hw_dequeue_found to avoid confusion
- initialize new_cycle from td->end_trb instead of hw_dequeue
- switch new_cycle toggling to happen after end_trb is found

Now a workload which regularly stalls the device works normally for
a few hours and clearly demonstrates the HW bug - the EP Context bit
is not updated in a new cycle until Set TR Dequeue overwrites it:

[  +0,000298] sd 10:0:0:0: [sdc] Attached SCSI disk
[  +0,011758] cycle bits: TRB 1 EP Ctx 1
[  +5,947138] cycle bits: TRB 1 EP Ctx 1
[  +0,065731] cycle bits: TRB 0 EP Ctx 1
[  +0,064022] cycle bits: TRB 0 EP Ctx 0
[  +0,063297] cycle bits: TRB 0 EP Ctx 0
[  +0,069823] cycle bits: TRB 0 EP Ctx 0
[  +0,063390] cycle bits: TRB 1 EP Ctx 0
[  +0,063064] cycle bits: TRB 1 EP Ctx 1
[  +0,062293] cycle bits: TRB 1 EP Ctx 1
[  +0,066087] cycle bits: TRB 0 EP Ctx 1
[  +0,063636] cycle bits: TRB 0 EP Ctx 0
[  +0,066360] cycle bits: TRB 0 EP Ctx 0

Also tested on the buggy ASM1042 which moves EP Context dequeue to
the next TRB after errors, one problem case addressed by the rework
that implemented this loop. In this case hw_dequeue can be enqueue,
so simply picking the cycle bit of TRB at hw_dequeue wouldn't work.

Commit 5255660b208a ("xhci: add quirk for host controllers that
don't update endpoint DCS") tried to solve the stale cycle problem,
but it was more complex and got reverted due to a reported issue.

Cc: Jonathan Bell <jonathan@raspberrypi.org>
Cc: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b62ae7953979..9937e7c8be70 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -694,7 +694,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	int new_cycle;
 	dma_addr_t addr;
 	u64 hw_dequeue;
-	bool cycle_found = false;
+	bool hw_dequeue_found = false;
 	bool td_last_trb_found = false;
 	u32 trb_sct = 0;
 	int ret;
@@ -710,25 +710,24 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 	hw_dequeue = xhci_get_hw_deq(xhci, dev, ep_index, stream_id);
 	new_seg = ep_ring->deq_seg;
 	new_deq = ep_ring->dequeue;
-	new_cycle = hw_dequeue & 0x1;
+	new_cycle = le32_to_cpu(td->end_trb->generic.field[3]) & TRB_CYCLE;
 
 	/*
-	 * We want to find the pointer, segment and cycle state of the new trb
-	 * (the one after current TD's end_trb). We know the cycle state at
-	 * hw_dequeue, so walk the ring until both hw_dequeue and end_trb are
-	 * found.
+	 * Walk the ring until both the next TRB and hw_dequeue are found (don't
+	 * move hw_dequeue back if it went forward due to a HW bug). Cycle state
+	 * is loaded from a known good TRB, track later toggles to maintain it.
 	 */
 	do {
-		if (!cycle_found && xhci_trb_virt_to_dma(new_seg, new_deq)
+		if (!hw_dequeue_found && xhci_trb_virt_to_dma(new_seg, new_deq)
 		    == (dma_addr_t)(hw_dequeue & ~0xf)) {
-			cycle_found = true;
+			hw_dequeue_found = true;
 			if (td_last_trb_found)
 				break;
 		}
 		if (new_deq == td->end_trb)
 			td_last_trb_found = true;
 
-		if (cycle_found && trb_is_link(new_deq) &&
+		if (td_last_trb_found && trb_is_link(new_deq) &&
 		    link_trb_toggles_cycle(new_deq))
 			new_cycle ^= 0x1;
 
@@ -740,7 +739,7 @@ static int xhci_move_dequeue_past_td(struct xhci_hcd *xhci,
 			return -EINVAL;
 		}
 
-	} while (!cycle_found || !td_last_trb_found);
+	} while (!hw_dequeue_found || !td_last_trb_found);
 
 	/* Don't update the ring cycle state for the producer (us). */
 	addr = xhci_trb_virt_to_dma(new_seg, new_deq);
-- 
2.48.1
