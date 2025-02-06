Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEF919B5B1;
	Thu,  6 Feb 2025 19:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870348; cv=none; b=od39EIY/khH0yI1wT9d6Ede1gUYKaxMOKalSJVlV/RHLcXuV3IV0JPy0dd0KGYD8+j2lfIzMZD4pgdo8P48IomobrwGdqG4Y5vkONoiq3NEWUebqhRE03vg3gSsC2E3mJsleDoXH0dT4Mj5UxlLKxYwOldqf0IiX2STDnZJzTcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870348; c=relaxed/simple;
	bh=rQ58ik+sQjkoIIjSZbx6DQPLXWHzxJm7hzHmaj+wqmE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=pC/DEwbgNoS2kxXPotCflEaiDT39yordstce0hVVdn87ts2sgtATreyLIR6xBqn6Hx/b15TJKaFxLARBCemecUsbcRrCF6uveJAjIkCp+IaFkGgtr0r0gGnD700Iuo1nvVG7GkVW5mdOj3d2/oEVgrc8HM0aGFyDKuRKphDMejg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsSlqRbQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsSlqRbQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9e037ee4cso2049537a91.3;
        Thu, 06 Feb 2025 11:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738870346; x=1739475146; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kWjxPjiW4yrPuUN5jCEDTk5tzHMpBtoPAkngaXosQrk=;
        b=MsSlqRbQn1iFZQ1SVROihdNTdA2YR6KGc32jQQvu88+xiEAG+/Zrf9s6jxaVsrTA84
         Rf5CKr9OrIUK36o9aIKD38JhP4z86nfXnC9Btp7PnPvjFhSGNzoaMZVOE04rNyJtk7gD
         adbH2zGGtrwcn6/RO3mHz33s5YyepKIJsc2qK/VZbQMuCgoREMqIZflHH/EVWkK95e70
         h+eSWn8sp2WYymPX61kqG/zNqMR0MWUWCcYIxWt2YTzXsJgG/6PfEOHYx9sbXuF3Gca3
         NOs6hDZ3PECfK6vchIgXKU81FN/xuBynRGVZRyYSguUztPqelGSS67f//eWOoZjl1a+v
         K3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738870346; x=1739475146;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWjxPjiW4yrPuUN5jCEDTk5tzHMpBtoPAkngaXosQrk=;
        b=iyf1kNlq+JeTzVmXfWdlXGfoXrFNm1aZPBsGWZCKVYdcqH9vRIg3pdRexggXtoZcQr
         /bbwVyLkL0N8VXC617zpGyndqxsVm1z/CJT0hb9Fa+oBy0rjPuqSr1MH2nIWQmRAJYKB
         5B5kH2xrFJuIOLGlxmiG2m5CZWIooYjoiEXkkRth5gyDAcZYAQCD/UEv3wQKX2jpk4vH
         q8AZH4+XzJWI2c53BoSzPBeFlQlxjKtpaeZ4G/lyFZypSyfCKBMW84xbKoV4QlCjmGFq
         e2jzARXHCbv1hbimb+GBXFFzQStfBgYtoU5yv/qLyf0XoNaOjLFJ2ffQl20wIuFyjkEA
         oY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+RXXLwQt68ZKXaVANCqnKijM0VXQWmtCWP1AXa/zYSwW4aRhjMDQ6zxqIyArn+Frg3w2mOfWjFtGCiM4=@vger.kernel.org, AJvYcCX5Y6YI1sTZCGnDag+QLRcMM+PftL0xw9WgnyL+0L6cgt2yEmBYzBEP5dlHbtSnnnmbO+E91/DfUu9V@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtFArS6czbms1S1vTtl5vSiFWSts3xEK5dfWDFpi7P/V5tiC2
	MwVaNac1bxXHxuMfYoqSBK01oGUJwP1wEWuDXvbLuP27WMMog99KwJU130ypk6TYeL7RHIrsZQE
	K9OowTxG227sKEKeTIwt/2cjVYx70DhCbDB4=
X-Gm-Gg: ASbGncsbdAiGVz6s0fzC/VrCzOV+UQ8wouS19ij7wys+6ISuUHCoOjmYEghBo6vo8V2
	oauDPzs3/faHJIwPDSKIV7HlZies6nE22M0FnglkUqbOGMquHXKSuctYcs8trwyt3iolGJJBm
X-Google-Smtp-Source: AGHT+IHFSxvSO8qldVsUxjH1RfdvofTUJWXX9hh63Jz9/TXhMTL/Ah2Gffy4hPFyv5UGFQewElz5awam8nZdTmXKlL4=
X-Received: by 2002:a17:90b:54cf:b0:2ee:c2df:5d30 with SMTP id
 98e67ed59e1d1-2fa242e75cemr343946a91.26.1738870345798; Thu, 06 Feb 2025
 11:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jillian Donahue <jilliandonahue58@gmail.com>
Date: Thu, 6 Feb 2025 12:32:14 -0700
X-Gm-Features: AWEUYZnp_4wDVJQScyq92zIdCm4XjQreSkmzYv0ISSXRw5T6NX2A3L6zPuWGgI8
Message-ID: <CAArt=Lib_PiR1z07hb1E3tqq-PG=KVKU9CZP3cPsQE5ciokLVw@mail.gmail.com>
Subject: [PATCH] f_midi_complete to call tasklet_hi_schedule
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 9cb2628740d9f55f6f3faa5cce2de5eb8590f434 Mon Sep 17 00:00:00 2001
From: Jill Donahue <jilliandonahue58@gmail.com>
Date: Thu, 6 Feb 2025 10:18:05 -0700
Subject: [PATCH] f_midi_complete to call tasklet_hi_schedule

When using USB MIDI, a lock is attempted to be acquired twice through a
re-entrant call to f_midi_transmit, causing a deadlock.

Fix it by using tasklet_hi_schedule() to schedule the inner
f_midi_transmit() via a tasklet from the completion handler.

Link: https://lore.kernel.org/all/CAArt=LjxU0fUZOj06X+5tkeGT+6RbXzpWg1h4t4Fwa_KGVAX6g@mail.gmail.com/

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
