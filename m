Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715D1E51FF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178361; cv=none; b=ClJbU4WpXQw8CeeX3KFnd82n74ggW1BWSVVkTOZH+pkLo4lQ54e21BsoI0gZbv27KpAuNDP2WslZo12SAt7wh46iGTjTdx/uxjWWleWqKi7IIiqqlE4mftnMiMtJQFzO9VaPQ9ipTY79kM8tbwq2nronQrjdFE47SJOmRfxkFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178361; c=relaxed/simple;
	bh=ZYocG4WpW2v0G18PypaL/RWNtd0f+kY6Gh7yo5tCZXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXGGfGKc8TgLEgY9CH8x8tTf6S5TdTBwgmFu8BCGER4Ub4YMW/baBkCuMPpFNuGJ73wNLHTyq/0GhJffmlLIoYfIC/Typd/Ij0VhwrTxbr8QexYQEZKVvQ8oXbZzZJU6eIgmD0XvqVVMhOt1PpQWOswX1fkia4VD7Ju2wIhOCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HTxeoGCf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HTxeoGCf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so3490558a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178359; x=1744783159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsHO17LnKKqQLTT7VMA/aJzN4PsTAXWxtYSCZZAyv7Y=;
        b=HTxeoGCfe3ncEA0sunyzaGr8Vk44SRciT21UQ7YnaqK/6JzWKhN+vTT14yQv6aCOAz
         3C49zWVSqKHAuClwfO4BO8+rJnTUg4/7Evub6mJMUVZuxruVCiLBhMq+uY8YU5SuqYw1
         aCvaSFTsy01Gp4km5bBZ24rYsHnzsXdWJ3awBSONDhXhqIBc8+ORDh9Mrouw9O9rVM/O
         e56PJ9gS/UZbrUVhFHbjruEFBIi9ugnkY55BdQNCBogW9+txliSjEs6r29Z5qoGbBYJ0
         EvoUid03cuYUxLneRMzLdUVobfAjdzalK3/63cY/8V1wARDMeims5E8iDDLvsM85ohd7
         4/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178359; x=1744783159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsHO17LnKKqQLTT7VMA/aJzN4PsTAXWxtYSCZZAyv7Y=;
        b=eoQhWsxYoxA1T3hzdQwrx/cNJI5cGgLvKlZCjejQ7R8xRWJKgc5pSb7paMxnFq1fsD
         DkcBs1XPNv/6WkmRnvb2WMAGKXdxcPl7WenGonUMA7Ot3Yoj9PKmO/Dt74wsLhkH8SiJ
         /gq2xedlEoHPFQnFBYr/R0xBa05hhV6OePE4MgOYwwkX8jhR7YwsyIz7ayzwvU6m7Wtg
         z5zxCv5vEsziaCBiXEvBkZuvhzVIGhTPXsFj2tLusbEGThWCfWldLfiFsUCgeLI3jETz
         sG7m1oUHTKrmMliq7eEt0ro3kDEbGkKY7cR+ifjIr+FKcw31OMaEpWlohas2fBAgHWKH
         sm5g==
X-Forwarded-Encrypted: i=1; AJvYcCXCn3QR+En9hha+OqMV1YUs1LVDPq6+F7abmOYJZvxd+VGO1SracwAJUPeQVLD7bjdgxHtRtoNxKRy2YWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCNB/5dt9Yy1S4Qp/107Gw4XUVkMBeoV5NECeHxapp6bKIgVaL
	Cau4qq5B45moBMtD/SQYUn3PP+JoEmNnh4h9T0tmI2NkJY03Kb2Vm3pguKBAXw==
X-Gm-Gg: ASbGnctiEvI7s19CVqg6iYrGOTlsp5gnuQgRZ172pB+iqgoIBBIhyt/0Ynf/9SgmORf
	SGGcTTxnnqpJUSerKNdqj01/JCDid0rUsLNpiJHOrsFYYikPJoxNhZnsREjT2Pnm9ysPfj3Yh8C
	KZImYfJ6bMfuJJxFJAophr/d+SHczzrtm8rFxTGndnSmA4r2KrCx+V62JY8FqDkbPNztGWhAfo5
	6lW3y1fuG2lIZzZB7xhP9kX2tgXvKwCznsjqZQkJnNNVawbuh7G3A+JD01FR2Zof/wD1sJpcRix
	7+Kzt2GZ428EZRkTl1SedAFoz1AbNHLsuLNBjgdGJrB68V/pRXWBx+R8oKwigi31vfU2ySuniXL
	AShARRQ==
X-Google-Smtp-Source: AGHT+IGxInF1tlWAEb5ecTeN3SbQ4ysc4Fo+Y8D2nJkd/pWinm4Tv/gquLdEGrWGnjCy7RBPBMLM+A==
X-Received: by 2002:a17:90b:528e:b0:2f1:3355:4a8f with SMTP id 98e67ed59e1d1-306dd3247camr1986546a91.4.1744178359515;
        Tue, 08 Apr 2025 22:59:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df2fb171sm493574a91.34.2025.04.08.22.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 11/21] staging: gpib: Using struct gpib_select_pci_ioctl
Date: Wed,  9 Apr 2025 05:58:53 +0000
Message-ID: <20250409055903.321438-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_select_pci_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index ce2184c5de03..5cf425fdcd89 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1797,7 +1797,7 @@ static int interface_clear_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int select_pci_ioctl(struct gpib_board_config *config, unsigned long arg)
 {
-	select_pci_ioctl_t selection;
+	struct gpib_select_pci_ioctl selection;
 	int retval;
 
 	if (!capable(CAP_SYS_ADMIN))
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 041b0a1593e9..5681a66483a8 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -81,10 +81,10 @@ struct gpib_board_info_ioctl {
 	unsigned no_7_bit_eos : 1;
 };
 
-typedef struct {
+struct gpib_select_pci_ioctl {
 	int pci_bus;
 	int pci_slot;
-} select_pci_ioctl_t;
+};
 
 typedef struct {
 	uint8_t config;
@@ -151,7 +151,7 @@ enum gpib_ioctl {
 	IBBOARD_INFO = _IOR(GPIB_CODE, 29, struct gpib_board_info_ioctl),
 
 	IBQUERY_BOARD_RSV = _IOR(GPIB_CODE, 31, int),
-	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, select_pci_ioctl_t),
+	IBSELECT_PCI = _IOWR(GPIB_CODE, 32, struct gpib_select_pci_ioctl),
 	IBEVENT = _IOR(GPIB_CODE, 33, event_ioctl_t),
 	IBRSC = _IOW(GPIB_CODE, 34, rsc_ioctl_t),
 	IB_T1_DELAY = _IOW(GPIB_CODE, 35, t1_delay_ioctl_t),
-- 
2.43.0

