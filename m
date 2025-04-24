Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C4F28BAAC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513451; cv=none; b=fnkgyuCqOHeUajhGVTWsMnbeDmW49iumSflOpR58Ry1/rLHaK9FWovDMXiyLWS4FSfg/h1UH6nYdww9NcQP5cJvj5rVNRDcCSlJhoyDNLBpT4tOMMQHyTqikS8p84ocv5FarZwNuhWM5SUZlp4vh5t+iDJB4Y/CzC4yq8Zz+jLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513451; c=relaxed/simple;
	bh=xx6WjQQJI7TG0s8jN6ebesWLtmwT5S6KXNjgM9mjaoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGZJFSoqha9NRxXUycW4WpGuD4hc1XLRCW96+c7+r2LykRDybd47aqS1lJmbYBgtvB04M6Tk+NM6sWD++lTGW4chewlkcjJX6l2XaSACWviKVSKEemqNRvRvRcC10BxpRyD2Jyta5n93FyRanhDIy3sbVOZBzrzjnr5N/14sk3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=E5ofKRFy; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="E5ofKRFy"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72c16e658f4so850860a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513448; x=1746118248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo8OORB/CMRTqZ+jmfB+YUkyYwA6MdIiB5QaJmUO56E=;
        b=E5ofKRFy1QivSOzZEhkyAYg8IHUSmY4tfwSYhqEFj2HVykCXGv5UzkVJz1RAv9rCPI
         nPDhP+rYb/gQbzmXJTCkooS74iYigRpZKrATwCPIVIOhHWIsY1z91gjg4bpBF36hihQK
         0QEUpdSMDKiDVa0ZaUPaLpnSK3JH46vf5SGsTucZ3HN6mf8IbHqrRMFZKtxeu4iaoyHv
         my57sr+o8H2R4a0LB4WOYos4jlSh/yY0EahkqocTA1nvh5HWAFmYbiAJLoVr+1IwFC6E
         Teqk2/uQjzDO8b5H7yIC0e1wPh/qoZXOxPaKkJnxyLvAUzFxVe3ySfT6Ho16Soe4P+Ie
         aPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513448; x=1746118248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo8OORB/CMRTqZ+jmfB+YUkyYwA6MdIiB5QaJmUO56E=;
        b=egmF+IFCW7MBXQvy4Z1oUMmhgLSAscd4HSj0T+upfXRIIbKxM0n4S21ALZTUrVwYL+
         yPPJQc9dzHu/xgqIkhGlFliZDO1aucqv6Mirpo/QjnQOX7zWuVF3WefpSdR9PUwrPTKn
         M0S+zI+CevxaCnmOUbqSFG0/0773/vvI972mfRzGnAuNg2qOd2PXOR5gYIjgwDT5vYrF
         TIoQ6bpWh2WTFQMd1+iNd94zJ2IzaeinFsPHatVCU33brZlgaGeSkO6dyTvtSry+INJm
         QiyMlVZT2tA7JbVo0w/735SdUulSye2hrTJesoMrLembcaKFFHUiOBSzXmI2/2Do9MJh
         h6Fg==
X-Gm-Message-State: AOJu0Yw8mo6StgufUPzJRjzA+lqBUWcjuEC1dc/mM12hAw+SisVZdAPu
	piTrdjm8LS3g3aj7N1qpZ01M05+9olmFIrpFkv90R6jp7t4o6Ucx7OR76quh7xmhGaDE+Fo+gO2
	E
X-Gm-Gg: ASbGncshb+KH8IwRff92o7IB4m/H02WDtQKqzmBXJuqOjkfdL0bMsZ9kR1TOLwJALhr
	0enoyUYL2GqX0VLYJEKK3GCQQaBL7mzMluIl62rtQA5SBLA74qnkm5N5+q7+pvTCGPtBvmdD65r
	s9SYOeigaL7hcDcjpQMC5tQ0ua5fw1NwH1/bsrpd6oL94/EGWHjvuzG1Ki8ViTZ2AiKWZ0fylG+
	uiHaFldTBzQNsNxAUvRZw6h4I/z95FtHsNL4O8TrgqBNQ1wX/or5ZcA5WTOV1J7ZJmNyM1RqbVe
	9zP+q2lzka9WbYKsLRM92AnAGl+dIRrNCjA=
X-Google-Smtp-Source: AGHT+IGActbYLMI+4Dv1DxR+pkcu73M2Hm6w/m4/WWnj+zX8JKJ9d7TyKjUutOCfa+lPaH6GRQXn7w==
X-Received: by 2002:a05:6830:3741:b0:72b:8000:d487 with SMTP id 46e09a7af769-73059bc8b48mr414897a34.3.1745513448417;
        Thu, 24 Apr 2025 09:50:48 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-7304f187fa9sm292307a34.11.2025.04.24.09.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:47 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 11/23] ipmi:msghandler: Remove some user level processing in panic mode
Date: Thu, 24 Apr 2025 11:49:48 -0500
Message-ID: <20250424165020.627193-12-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When run to completion is set, don't call things that will claim
mutexes or call user callbacks.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 3e88ac6831d8..e7bed764b4bb 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -4808,6 +4808,10 @@ static void smi_work(struct work_struct *t)
 
 	handle_new_recv_msgs(intf);
 
+	/* Nothing below applies during panic time. */
+	if (run_to_completion)
+		return;
+
 	/*
 	 * If the pretimout count is non-zero, decrement one from it and
 	 * deliver pretimeouts to all the users.
-- 
2.43.0

