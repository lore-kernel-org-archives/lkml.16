Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C802472BC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745739856; cv=none; b=e+zc4z1upkGRYof00k6cBGLMYCOasUAHViqZLfsTic82+cy2McpmtHLBn6CvYEDNzaTW41qzYAWrpToW+LdmAPrL1GATWHX1m9n9Rukb13tsGHlTyydZ2rD51Oc7+D8GfAGE2mzsi0Bwjxef5jyETReVmbjWo0CLHOC1Rsousm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745739856; c=relaxed/simple;
	bh=XNdCoV5cl6dJwVbDSjCJSD6fHhWGupv9B7+HEWYrjHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pkP8geSgwbqpBR96rEUXdUiiTa7G10i1Ffm4TIbpgr9QJQZe0sw/fN+DejmL1TMbUqSPiCmgYWpU3B1OSyJaBiOC4lmlt2QmqQTdSTINU2G5sSpKlfv2h0+CI3MjgpTvMaCnZsE4nBiAlc2eoYbwYCPr1bDE5BhDSoLSqsNSeig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OdFgjjGD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OdFgjjGD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ede096d73so26252705e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739852; x=1746344652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKsx1Y0DBxO5LiUGbdeLz4euTGTr3L8Ie2JztiqIkG8=;
        b=OdFgjjGDNNzYftZbT9xq7UV9LUnIZpRnsMbR7gcOBuKwASwLVmiuIJfdMNGSUdPnsR
         Io52FFYrOW62/Sbe31p55KYql7NeFWNUBkWDlUexCQbOwI8K9cIvqZ5HgB3ZuGJz/OP9
         F4A9e681DDo3ZkhrDhIs7hFPQGKk3Rhb+KK4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739852; x=1746344652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKsx1Y0DBxO5LiUGbdeLz4euTGTr3L8Ie2JztiqIkG8=;
        b=raxwP+3tbrc6ka3Q2vaciYdWtRDucfSDw0xL5mf12ChkjsLci774lswzqW4PzRCrW/
         3tFK/g/LIUgA9RzczId8sf8DmuU/7m88ZUCz7bICBraCdQcm1DGJ3YIAPXi/eF2Fs7Nr
         L/hyNfCG2JVl/rN797Tauv9qorYlImH2EpWZKdbWeUO26QsfzTEDH3UlzZCVTGt/lYVR
         BC6cofnGCOn5GlA4V2aVFA+P/qS+hVDB9nB8YOkfjVDklsr7bgm2EBlqLSGbnI45qwPL
         nBl0DlxlhPmBqROKIHdIMpdGI8IVabx2EymFSZYbI+uCdN4/q8/KpAPlFowDDMhTqmNW
         d/yQ==
X-Gm-Message-State: AOJu0YwifG9OS0wTPY6/27cHGWoswqiO9UNnyN3Z3cyfUd5XcZ7it9mE
	9hNyf20hfRQ51AC8JB+URJR3LxKoLxevm1+SBiFOIsU1meWLeFq8Jrx26jscE04XmunFxPdfdoZ
	+
X-Gm-Gg: ASbGncs373MmrLRgd1whZzHJrInBLy2PDr614yCZaAliJ45XmZATKn6a+w1wJywDKnH
	xEy7Z1QuwmXaFT+/TK0HuKrZfuqklOd1QH7f92LOa56v9TMP9PYAKhUz74PoqZMTCcj/00ofu1C
	PMey59THGW8CbB50uhpjUaKdcVPqRRlLF0PSulWNLYuwd17fs4N8AfvYM/rxuB/aWyHJvb5/3Q4
	SvUelnGXT3fpha8ap7XarwTG5AkP/L8DTkfAERYGxIjrlH74oC+VdxnmWe59te5j4Fhck9j1btT
	y2ew6AKvQYUJ8G1KN7fdflm6mxFKXLv5wAkEVk548RJkH6DveUL/STFtEwrQATxr0yTotvAeGjV
	xhq0s7A==
X-Google-Smtp-Source: AGHT+IFCEy8x0o5oo3zFYyMXFfS94FwDsXqBWsDjwWzSNdIUrFG48zSXY2rcjCPvG2HDuHNuAL8VeQ==
X-Received: by 2002:a05:600c:1c18:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-440a66abe22mr49622795e9.28.1745739852516;
        Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 3/8] ARM: stm32: add a new SoC - STM32H747
Date: Sun, 27 Apr 2025 09:43:22 +0200
Message-ID: <20250427074404.3278732-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The STM32H747 is a dual-core MCU (Cortex-M7 running up to 480 MHz +
Cortex-M4 running up to 240 MHz) containing from 1 to 2 Mbytes of Flash
memory and 1 Mbyte of internal RAM.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/mach-stm32/board-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/board-dt.c b/arch/arm/mach-stm32/board-dt.c
index 5dcc4ddd1a56..e6233c8725ae 100644
--- a/arch/arm/mach-stm32/board-dt.c
+++ b/arch/arm/mach-stm32/board-dt.c
@@ -17,6 +17,7 @@ static const char *const stm32_compat[] __initconst = {
 	"st,stm32f746",
 	"st,stm32f769",
 	"st,stm32h743",
+	"st,stm32h747",
 	"st,stm32h750",
 	"st,stm32mp131",
 	"st,stm32mp133",
-- 
2.43.0

