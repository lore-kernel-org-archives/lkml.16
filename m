Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A024CEEB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836151; cv=none; b=BxS569a48jiGpIZhArzhEs4UoRWJTK6VOESwYVW9YlWlWETlUtPohM3qqDVA0/VVXtd3i8bFQomChqJy8NcB7MQqnz8/e4PzjhJkmCGnLEtSP4M8A3nqi4DaWUpqA78BSDJIcOO4aj1xN2TzPjP7j7xCbAIVcmya3pvIe/UNbSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836151; c=relaxed/simple;
	bh=W7NKhnTpUeOCGlpiS2roAP2cc1f4BGRsQOUiHrDOA1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iroivun+4wMOTN0/tdyqLD8hQjKaaLtmXWM+6DiZXccn4bRwakSyLqIOAWOfwtZleT7OnVMhNfzc3AIHdTNdq+W8m4MaINfuvI4xnkzpfqo4xc/+91/GNbm5SrVstrsaqKOUiJmvgd37yx8fDKkh7CAbA9UM6HTF3deGvAbnpPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=k29uOiZ6; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="k29uOiZ6"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so14810b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836149; x=1745440949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUDIvKIBsD4gxpULDKxinqYIlQSnX87hM/ddYNKNziQ=;
        b=k29uOiZ6VyaBVQiDDXpUkrNvF7xIL5114BEmfbsky1VnvzTgRpgNt5cd7+VZgS1gDW
         n4tUo55naND8mkOdXxkpcfJc2l+k8EmyWy30YJ5PEpBxtDlB5ZqYfqOfz807/NxXp0kg
         xJTGiVCjeVb4U9wxf47d7Cm+fEo4Cz0euo2vEsGz0aI8S+aKlrDk28tdm6XlL9FKgtqP
         ZTQWp9AL6ic//be8bN7yC7FSEvWj/UE2LO4eF0CjXCNJ5p33+Lvtk8qBL4nHD2GxqkK6
         rpOzHI3QThoZwc7OuZtPUhoP8E3B74hd6vNP9BJk7Ts/GCKJJQsFfIqmHsWZoDvD9+aV
         HVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836149; x=1745440949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUDIvKIBsD4gxpULDKxinqYIlQSnX87hM/ddYNKNziQ=;
        b=bhtArdkF+rmq5uxZj7iyjYxXuQaREweiBT2A2qUi72pzp/0dRkL0JlAED9iYH/wvQY
         /2DGVCCEFqwsHDjCyfh12dLXZl41eNlelPp0T/P7WHAFHezgqpkn0YMFziEEJByz2ovP
         OH/Jxe0AVSHD3yZj6EgzEyH9Jm+JybLSvA16FpE4fdi5uxyq54qif5uUPFGWPMyPiKe2
         zoJrRvNBJPLT7iqp7jBLlEEvi1XV4QAy/CAcm6oyUgJZxfnYeZONfm+w+Q5rVSGhrcm0
         y2TgUfmcQx0GZwKIEv8XoZybwFBoLCBr1+hpAEEihX9F5DdWdxcZPS8fsvhoL475vuXz
         o7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWReo6TOpJh81bACS5O5omVQeCt+TbClXVlsOz9xJZ1z/dZorBpEzFmGG6Oxf6rnvCw0SK80DnVVJ/XRT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl+JIwlSuS44RZDGK2zVnBfyFFNKQLI3aa4y0PnqSqBx8pGxSd
	LusDGZ8bi4ZwvtlyNmE2vxif1/VhEj7hDv8rQabW0MVDdv7yMmRHwZ8iWQsJOHCL4Hjr662Gv34
	=
X-Gm-Gg: ASbGncuP6oxjS4w49TE0mamIE6mgYlkzL0n9Z7mtFMTLaQQ7DND+LTWOqnBfzWNm1Nl
	Iw4PdrKsbD2gtreuF9ClZAgLfDX2iLZ7gXvdCpS7uqtSGohJPI9HGN027TwdPLeLQAaopisrDCP
	wQ2L+a3ApqavJTLsicHoG1BbVvknHfmrfQ9mEfOkhVFywUqiKr13nJNlUcrVt03yuxY+buh8UGW
	PxztzPoPKM5pr0nZ0ps5h5BGKOBe0IPM6GBr/34u0/ZqjQ0WrvHRbmYouPiNlNAPha1Sgxl8HWI
	E7OVc3VL2BFpOII0nAaMPoJt+Y5xgGDY+cDb6A3rKFnAAK3mg8OIRhGidtP1Ih+OnKW50VJ4xSK
	TBpvDEA==
X-Google-Smtp-Source: AGHT+IEX4eXsP44VjunXaWcttdOrgPWfZ/OAkwqbXiSZcKyF1PkjkyDAsrb9kEIF5F6lmw4jiz197Q==
X-Received: by 2002:aa7:888d:0:b0:736:476b:fcd3 with SMTP id d2e1a72fcca58-73c267f174dmr5267257b3a.24.1744836148828;
        Wed, 16 Apr 2025 13:42:28 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0fc5sm11202994b3a.91.2025.04.16.13.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:28 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 18/18] staging: gpib: Removing typedef gpib_interface_t
Date: Wed, 16 Apr 2025 20:42:04 +0000
Message-ID: <20250416204204.8009-19-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_interface_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 16aaade310fd..62ce174add85 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-/* gpib_interface_t defines the interface
+/* gpib_interface defines the interface
  * between the board-specific details dealt with in the drivers
  * and generic interface provided by gpib-common.
  * This really should be in a different header file.
@@ -22,7 +22,6 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -212,7 +211,7 @@ static inline void init_gpib_pseudo_irq(struct gpib_pseudo_irq *pseudo_irq)
 /* list so we can make a linked list of drivers */
 struct gpib_interface_list {
 	struct list_head list;
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	struct module *module;
 };
 
@@ -222,7 +221,7 @@ struct gpib_interface_list {
  */
 struct gpib_board {
 	/* functions used by this board */
-	gpib_interface_t *interface;
+	struct gpib_interface *interface;
 	/* Pointer to module whose use count we should increment when
 	 * interface is in use
 	 */
-- 
2.43.0

