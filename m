Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173EF1B4149;
	Mon, 10 Feb 2025 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173246; cv=none; b=DbJOSmi/tcSiro/737pc+Esx8kMX8PF+v5IOQ/LX8yWlkSdBmzYIMzBACwGJIYvj+60nuFbLhITmPYZ5x730U0/RH2a+79C3zTe5yN1DUcBycLVD3MwL/gIpfgw7cF4rHhKscIA16IwDiyzZWCdIrnFednRaCsQ1RjPyScgLrGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173246; c=relaxed/simple;
	bh=eTEG+gAtpDdSPJl6g8hkkdjOZgaHcJljzPV6r1bGj0g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFF67ePI/6kFX9ULHxPwMX7HJPnY18CNG6IMAaw33lzxV/KgXaLFGfe75mvGXd9+Yfj1FKwP+u8MAmxJzGlIwz1hUi3orvNZ7/EX0JE5odBAeczrsZlfPG8KlSg1dew2MRdLwkgJ4iDipxzDWVeTeyH2jJoKdTqFkMF1j1Ec0IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEk6dpLT; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEk6dpLT"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so7899799a12.0;
        Sun, 09 Feb 2025 23:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739173243; x=1739778043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++ovUUwJH/E3x9o9N2lcwDw3LK6MWwTzZJkWbZlRbW0=;
        b=dEk6dpLTPp1xnzYa5B/b4hbzmwFRmWyNErUkB5hizzy/OfNDUezJ1hXE8SDO+sCFO2
         uCu+W5g4jo62mG8a/n9UXijXXl89Ge/OciVxmkSNH2UjziIyhTozkN0be7hXUeNTBOm9
         yct4X9eda62VROUl/3Ty+l7ZSmEDOwOSmKw6jopR3VO49cUF2LcdZiGFy43jJgtiudkl
         mj7XhtRM9c4peebMEoP5cKUVLbSeHET8baR3rw3MxXyK1xOB9+1+QHR4SS3Y8MncMgfw
         SK9HeEvEO5OgxmeE3R39b1PtGlP8pmlr3R6z25ykT4ClTzbtV/XUXBDxGspV5yNmBY0R
         MrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173243; x=1739778043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++ovUUwJH/E3x9o9N2lcwDw3LK6MWwTzZJkWbZlRbW0=;
        b=RA48W/jL+oHJW92oADSjxBz6cm2tHPZpqUQNmKj4wHz+nYbUlkU+YOgHN3Gl2+2MRK
         Vpx9b+NESCmcLRXrT+ptTxCT0jB8MwaeggGwMeDTiRc4/ZkGTTM4LFMOqRMqKEkHMoKn
         mTgcvNDLDSM3b6tYYSo3dbmt4yxWXSCY/Jg+b/8MKEeZzHCkehcBUZq+BBa+dibaP+1L
         xpu7OVjRWYCu1BQodH9aUSOZSChfdnXPYx5CSdhSiB4lFxo3KVRnOXuq0z6iOWVM0LAk
         TIikK5K7w5u6ZIVm5ma3bvkzTvKqJFLcVXbG4RxSFGuWON6dl0kHZfGs9l5Zhmii/+1L
         svCA==
X-Forwarded-Encrypted: i=1; AJvYcCUEinqA1JVpf677iMIKOYsuAc9our9D5EAHLTxu3u6apfeu3Aa2Slc4TJh4yjPTdo7kbpNoTEh0nfWQB3k=@vger.kernel.org, AJvYcCVClqYNFkU1dtNRgibZsPyEpQVmOufMCLzHw9KhHa+k/LLrkwpAbPxKk3fcl/4Xge9P5Jz02rM4GWl/@vger.kernel.org
X-Gm-Message-State: AOJu0YznlwXS8s/AiL30b9eyVURJPPEjy+jpfzNTvI9KNSZjwiD6XIEQ
	EMPhTYDkklvUalFxgh3p+U2fmfDhoM/aECHBFg4hEKExlg0JWK0u
X-Gm-Gg: ASbGncu0Llf+EeSaVxSS6YkEr4ZhQvzLxolX3LwVkCDG6zX73jHIwgVi/jNrO+17+0O
	LeQiHxzTM/KO+2rZ6Qo4kbo3GRqV0iaGYuDRVcy284daXt66PaaW24az01VLvLBnZYQHe8PvXPk
	nAH8mwz1eCpA9A4Nvtg0JyTWYTXEQFJI5d42Poi0HCHxf25QekiOwPtlTowM4HE0k558VqAqCaN
	jvbzqrN3BUZivZl5ZkJLD/HejDfTJaYKKhLhyIg+cCSXTMWhXatQ1MeyekB783eGfziJpr9FFyS
	anGbiiiEWD/euXzp0HzOsTWV+E2UhzxP
X-Google-Smtp-Source: AGHT+IFBJvUjWR/XSylcEftefCtQZBr2hODlucBtDqhpbK84II0TbhllwxJTleUn7E2m6zyXX80oTA==
X-Received: by 2002:a05:6402:430c:b0:5db:68bd:ab78 with SMTP id 4fb4d7f45d1cf-5de46a1c14bmr14072221a12.10.1739173243118;
        Sun, 09 Feb 2025 23:40:43 -0800 (PST)
Received: from foxbook (adtq181.neoplus.adsl.tpnet.pl. [79.185.228.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de45a92fa7sm6489176a12.23.2025.02.09.23.40.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 09 Feb 2025 23:40:42 -0800 (PST)
Date: Mon, 10 Feb 2025 08:40:39 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman 
 <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] usb: xhci: Fix isochronous Ring Underrun/Overrun event
 handling
Message-ID: <20250210084039.734666bd@foxbook>
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

The TRB pointer of these events points at enqueue at the time of error
occurrence on xHCI 1.1+ HCs or it's NULL on older ones. By the time we
are handling the event, a new TD may be queued at this ring position.

I can trigger this race by rising interrupt moderation to increase IRQ
handling delay. Similar delay may occur naturally due to system load.

If this ever happens after a Missed Service Error, missed TDs will be
skipped and the new TD processed as if it matched the event. It could
be given back prematurely, risking data loss or buffer UAF by the xHC.

Don't complete TDs on xrun events and don't warn if queued TDs don't
match the event's TRB pointer, which can be NULL or a link/no-op TRB.

Now that it's safe, also handle xrun events if the skip flag is clear.
This ensures completion of any TD stuck in 'error mid TD' state right
before the xrun event, which could happen if a driver submits a finite
number of URBs to a buggy HC and then an error occurs on the last TD.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9b06a911a16e..11a53e310826 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2664,6 +2664,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
 	u32 trb_comp_code;
+	bool ring_xrun_event = false;
 
 	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
 	ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
@@ -2770,14 +2771,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * Underrun Event for OUT Isoch endpoint.
 		 */
 		xhci_dbg(xhci, "Underrun event on slot %u ep %u\n", slot_id, ep_index);
-		if (ep->skip)
-			break;
-		return 0;
+		ring_xrun_event = true;
+		break;
 	case COMP_RING_OVERRUN:
 		xhci_dbg(xhci, "Overrun event on slot %u ep %u\n", slot_id, ep_index);
-		if (ep->skip)
-			break;
-		return 0;
+		ring_xrun_event = true;
+		break;
 	case COMP_MISSED_SERVICE_ERROR:
 		/*
 		 * When encounter missed service error, one or more isoc tds
@@ -2894,6 +2893,9 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 */
 	} while (ep->skip);
 
+	if (ring_xrun_event)
+		return 0;	/* don't warn or complete any TDs */
+
 	if (!ep_seg) {
 		/*
 		 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
-- 
2.48.1
