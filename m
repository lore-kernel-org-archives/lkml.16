Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44A10F9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665950; cv=none; b=FUOQgdzMdCD8G+OeDowJOOtwe1A9yqXG5S1w5icubBUxBs0Z6T9XCgHamWfNgQEk1G6kgKXwTZmLaDgswzcw34XjlJ5ejTfBP1ev6u0lwHeC3qRpFKk5F/n4+4VPWFtMoUFL+SgD1FyiqXdZhq7lbY85pEAf780H19GSZl+buzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665950; c=relaxed/simple;
	bh=LVm9Iv2hx52+HP9qYYIZESda2VyWeo0JvwSZYOWtwqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uWCYX1ldkuoa/TbcWyJaEcVg2hLccHqIlYZ/g5ejwsWbga8VgsymBGATXGwU0MmigLLWlKxtnMeJMqZz/Vwxu0NlvaTCQFBL4x81h3oB60FINwYFILyCm5yY3U9pz9q4lQ2XfXdJrgkQcXuKUU/SCSuTKQXo0GZkv9QEyNJDwhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3C2OAXz; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3C2OAXz"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af51596da56so558458a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743665948; x=1744270748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhmLpddOTBMmGteQ6sWfDTmDIUN4SgTiI28/klHQeRU=;
        b=i3C2OAXzFGhNHsreK+3YlttL0px+FdZZsFO9kXGfY0EvNEmfmlMJ/iVOxSoVYnKq7p
         GXY3MoaDiETL8AWLCe5QHoN/3me4RV9Nb8f26ottNd+/VNBpkUtrQ/mm3pQfCEpyjJID
         J4dBBW73Bl+cGzHqiphDYUB/yOBlCKudauWpSLppcdUmz4Rqqja3jAZeGpR0zttDDNjt
         xct19hhKz/jeC0hSy4ICaM/RaUpoUJ/V+TLhbrdPNx8xRu9OAddko1WLr1K7i3MXFZRd
         0rRoaaUe9blwI6ujEo3xQvcV+fiowbT5++LzDDCONZTQGKkb89ldNKP7AX9IRwdWnuW0
         VvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665948; x=1744270748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhmLpddOTBMmGteQ6sWfDTmDIUN4SgTiI28/klHQeRU=;
        b=wAzJT8X6o5R+wet2W0iuAKwJ+GcU3U0G6ddHHJ0HnPA1fWdVpmVLxFLQXOXnosj4PX
         7HZRJ0MLXIc+JTxRdzxku+jM7Z6sF0+CacFSdJld8ackIIt2eZEifJkIXCkao+1YfnpI
         x0O9/1LkvoXYm0+gFmQ9EC0534PHWNjsCqEouuh+NpJUoQv/7bY8+ru9AOn10OsDfrFr
         F9p4cxSZoqHbuJ6jnC6JRJsPNLZkW+nDH8RoRl/EyXRgxxzinXphotNQ1CuxQ0TYo4Gr
         nhn+hS7f+422EJkgkBOsosSVo6lK9QsBoWuxeflFH1tFXKS6bjdD/HdA2GWBMQ9J78yN
         dXmw==
X-Gm-Message-State: AOJu0Yxrzxb2R+Z51B9urK9TDECAYII/GHGkdyjYL8hrvnyBhn0qRZim
	BQw5QgbV98Gq0Z/lwVDNsfUsWRpvkQc+2mm0jukb14Bv1z1icljXdGhdctjJvdc=
X-Gm-Gg: ASbGnct0uF/BRAYJBzXc8PlSV01xGBwZjxW/zODG9xnSmXkoz0TJ5O+9JLJSr8VbhLN
	B0A65n2YpQSvxg8qMlpLgzHcqcw47DedhZWe/FtKeS55pCImGqsWBP1LTGhp7X3P8WERYdRdHSn
	G4KdvlnVwx9qlH/zYcDckN5AVQ4IP0VIHslFJCKO1Ej6jYTzz0ky6X7A7ntMs/JI8CZtOZLVpNG
	3Wy9h0BkQKTF45F2n84oQ8pjUCg1eJ5IwkMoDatQrzREKU86x+2MZW94nE/DjmciYLsnG0L+P55
	3Fq/1gXKUeNKNtvXUUzBDJoX18LWPPj66UARQPAQpceqwGWVU6RYb+DYqT57f1OPTfuOGowigEg
	y8dOKAZOEOw==
X-Google-Smtp-Source: AGHT+IEaOjW8rDxOV/ttSLc/1oBInnOK5N2JWSko0Tz9Tvu2qYOI7rg8gANyUYeHWPBOdV+Y6BsPIA==
X-Received: by 2002:a17:90b:3b50:b0:2fe:a0ac:5fcc with SMTP id 98e67ed59e1d1-3053215c05cmr21921345a91.34.1743665947618;
        Thu, 03 Apr 2025 00:39:07 -0700 (PDT)
Received: from ubuntu24.. (36-225-104-143.dynamic-ip.hinet.net. [36.225.104.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b9cefsm773340a91.38.2025.04.03.00.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:39:07 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	tglx@linutronix.de,
	mingo@elte.hu,
	corbet@lwn.net,
	jserv@ccns.ncku.edu.tw,
	Cheng-Yang Chou <yphbchou0911@gmail.com>
Subject: [PATCH] IRQ_NOTCONNECTED: fix typo in comment
Date: Thu,  3 Apr 2025 15:39:02 +0800
Message-ID: <20250403073902.265838-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a minor typo in the comment for IRQ_NOTCONNECTED definition:
"distingiush" is corrected to "distinguish".

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 include/linux/interrupt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index c782a74d2a30..51b6484c0493 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -140,7 +140,7 @@ extern irqreturn_t no_action(int cpl, void *dev_id);
 /*
  * If a (PCI) device interrupt is not connected we set dev->irq to
  * IRQ_NOTCONNECTED. This causes request_irq() to fail with -ENOTCONN, so we
- * can distingiush that case from other error returns.
+ * can distinguish that case from other error returns.
  *
  * 0x80000000 is guaranteed to be outside the available range of interrupts
  * and easy to distinguish from other possible incorrect values.

base-commit: 92b71befc349587d58fdbbe6cdd68fb67f4933a8
-- 
2.43.0

