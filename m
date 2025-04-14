Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFFB192D8A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645121; cv=none; b=afu26aejAiRZ37/OvwLoV/qzdaUikLEYYBVnUli63XEtMH+9iCpgAsPQKNGLPZEvoPcZmpQu5v2rtP4SZkrxN8qOMpK00kinh6NJvh+no43FmoX3Dp8xeIuK21K2uxPYs7AQz/RqrBNw+/H3DwO3a/OtercFBO+Gk0uEL4eHRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645121; c=relaxed/simple;
	bh=QQWrFCU0lxYwyZvkufIrKpj9QZGeF1jQQqxeadFVPSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PhHhQUi1YfMz7EM5zziq2XKV75wjZ+pVH5WTTrjDGgxsZJjvlZuW5TIXX7Rlbqje9mZew5+TyQ5RTLQQ9+F6pPQZpJ15BQLJ9bWEnuninlpSU0zkBMQsr1lqlogGO5QjtHMFH1No6F8kDzTsvnWAwXCVHi4oSX4bt/wh/xjXK7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sargun.me; spf=pass smtp.mailfrom=sargun.me; dkim=pass (1024-bit key) header.d=sargun.me header.i=@sargun.me header.b=HHJtgGjE; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sargun.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sargun.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sargun.me header.i=@sargun.me header.b="HHJtgGjE"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e707fba5a16so229296276.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sargun.me; s=google; t=1744645118; x=1745249918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cg7wm1gQKxPnYT5N6cnKLlagimUWPqnH4hJORex0FBs=;
        b=HHJtgGjEv06ipS7G0Ge46lVbecHEBRJSmXdDLuOmcl0FpN/pv+Jt2h+bBmYx/vB3fp
         PtEXqMA78ovGjreYYK9OtDhRweY+eAX+wmRJ1o+UPBRnStwQQWa+kGnnKP0jRYgp1cij
         DAyqzayBxZryvTfZX2hrp0/jZfUGVGWyEm3Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645118; x=1745249918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cg7wm1gQKxPnYT5N6cnKLlagimUWPqnH4hJORex0FBs=;
        b=wAyWbOdcWZGbfeie2rWhWQ/kp/E0tRgC7fMOxdk8a2pAUWtrBI09iSHFOAdS4rKSv4
         hrEtgoDQhRTwP/3e+9UeVDSkgWExxtetwh4yvcZLqO6eAsQbuYWx8OzK/U3emfFLr16d
         FV2seBDQBIS2vEirL94nXJzQTFFovqpBU3RTkxhLF4OoP9P57wvhixC+xQ52LyLQyzBF
         GtsbansVHjdL960R2gpPEVqd1CiKhcJ2pLZMrP/ckPgK7zP5rdMHbqU3vqcVZsDCZm8S
         e/wSdFT8b5sUJoeq228qNRzkjgqbfNrAHe/I4YFwz8S8jMNQhBTcx5tk5gvbP0m+Flcq
         PMJQ==
X-Gm-Message-State: AOJu0Yzmwf8toeOBRP58MvcK/8N1ruD1dhqPk7kJeTpnoTdH3C4p3pLt
	WANwEoMBlk5oDNLGblh1DEtBsL9Ymfkspz3I6gilSKgybmyXc++2DqbStSBljy+zSdGCBVVhi+Y
	x0m8=
X-Gm-Gg: ASbGnctXXzhoZyFTg6lf7IUBY+XVXlMug3yaipAAqf3Zz81xeZ3Nw/IAnAYLSYTzvf6
	2GgPi2P2I+7a9/3UlygGivfMN9MmqJdzBBD3bx+bzwQ0rtTctrxdP5s4/jkkRt4e29y9+zv5HUD
	oW64ztiuN4+oj3UlnXwkVrNWCD+9qSxtvIC1joD7qhp2y0YVBwOwTDvB6igZgLfUHwvZNaNDAzz
	2hm+M84jWw0AuyVKp4MQFVrqvXa6+CiFubpchJe6ACeFKxU2/C0JKjT3EQWaM9y+PreDilAXLuZ
	jRRW6yRQdIPz0v7xGB5NkVPhPtrO7w==
X-Google-Smtp-Source: AGHT+IFXaJHA4jn4texV8xgFTA2mT/ZVZHNvt7z4f2KvUDw2pLx36QdW+AE9X7ghaoCnIgTjMYyeMA==
X-Received: by 2002:a05:690c:d94:b0:6f5:be28:632c with SMTP id 00721157ae682-705599965b5mr95917727b3.2.1744645117480;
        Mon, 14 Apr 2025 08:38:37 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:8::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e11d349sm31264617b3.43.2025.04.14.08.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:38:36 -0700 (PDT)
From: Sargun Dhillon <sargun@sargun.me>
To: linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org
Cc: Sargun Dhillon <sargun@sargun.me>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Subject: [PATCH v2] trace, RAS: Use __print_symbolic helper for entry severity for aer_events
Date: Mon, 14 Apr 2025 08:38:34 -0700
Message-ID: <20250414153835.947207-1-sargun@sargun.me>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chained ternary conditional operator in the perf event format for
ras:aer_event was causing a misrepresentation of the severity of the event
when used with "perf script". Rather than building our own hand-rolled
formatting, just use the __print_symbolic helper to format it.

Specifically, all corrected errors were being formatted as non-fatal,
uncorrected errors, as shown below with the BAD_TLP errors, which is
correctable. This is due to a bug in libtraceevent, where chained
ternary conditions are not parsed correctly.

The before / after are as follows (and also tested to make sure
uncorrectable events) still show up as uncorrectable.

aer-inject was used with the following AER event injection script:
AER
PCI_ID 00:05.0
COR_STATUS BAD_TLP
HEADER_LOG 0 1 2 3

dmesg (unchanged between runs):
pcieport 0000:00:05.0: aer_inject: Injecting errors 00000040/00000000 into device 0000:00:05.0
pcieport 0000:00:05.0: AER: Correctable error message received from 0000:00:05.0
pcieport 0000:00:05.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Receiver ID)
pcieport 0000:00:05.0:   device [1b36:000c] error status/mask=00000040/0000e000
pcieport 0000:00:05.0:    [ 6] BadTLP

Before:
virtme-ng:/# perf script |cat
   irq/24-aerdrv     424 [002]   392.240255:          ras:aer_event: 0000:00:05.0 PCIe Bus Error: severity=Uncorrected, non-fatal, Bad TLP, TLP Header=Not available

After:
   irq/24-aerdrv     424 [002]    29.198383:          ras:aer_event: 0000:00:05.0 PCIe Bus Error: severity=Corrected, Bad TLP, TLP Header=Not available

Signed-off-by: Sargun Dhillon <sargun@sargun.me>
---
 include/ras/ras_event.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/ras/ras_event.h b/include/ras/ras_event.h
index e5f7ee0864e7..9312007096d7 100644
--- a/include/ras/ras_event.h
+++ b/include/ras/ras_event.h
@@ -327,9 +327,10 @@ TRACE_EVENT(aer_event,
 
 	TP_printk("%s PCIe Bus Error: severity=%s, %s, TLP Header=%s\n",
 		__get_str(dev_name),
-		__entry->severity == AER_CORRECTABLE ? "Corrected" :
-			__entry->severity == AER_FATAL ?
-			"Fatal" : "Uncorrected, non-fatal",
+		__print_symbolic(__entry->severity,
+				 {AER_NONFATAL, "Uncorrected, non-fatal"},
+				 {AER_FATAL, "Fatal"},
+				 {AER_CORRECTABLE, "Corrected"}),
 		__entry->severity == AER_CORRECTABLE ?
 		__print_flags(__entry->status, "|", aer_correctable_errors) :
 		__print_flags(__entry->status, "|", aer_uncorrectable_errors),
-- 
2.47.1

