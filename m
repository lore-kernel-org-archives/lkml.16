Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096627FD76
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513437; cv=none; b=nnmSZld4C3LnOpCHd+E9fi0dEvleCKawIFcqaEfTCru3UNiyWm/QKkz2Y1VpUZuezUJnybNebxauznsZJb8fXBlFWKaR0SEchoHRDuaWoGnfmd8/2sLPxv8aVKsAi5j+cMKavpBtyfck+7174DmaPnPy1+IrzhILnUfepYTrvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513437; c=relaxed/simple;
	bh=LuPSXS2gDM+3dccuKoPqDx7Vgdx+itgEGLDoJj+6O5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLsEDlduQ71fx4H54d/TbWtt2+mTukUtEAVmXCppPjpyNNFgm7lEvlvAJsEXA16HhtEx4U0rmgHQBcwHaEst0QJZlLmea4WrM7qLrlYE0BsrHJJimFBnLVBu9quuGS8cQi0tpic2bc5ly2CrE0q0g5lqV5mMaRG2jl6lv+mdqh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=s9v0V51b; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="s9v0V51b"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f8ae3ed8adso886818b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513434; x=1746118234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OcNpKj2ULrV1lWDMQw0DBFTmPSr8bbwLxdvwy2alDVU=;
        b=s9v0V51b95Lcy2UOPFV5mTZIkbA2JF93VVlBACJ/x67Pj1r5igyyHeio4eMDZ/2dnF
         rtXSLCbHTGdSLj4ARRUAgu2+s61KujOa4HSSPKPLfB14vo0DE/+wLPDOZgSCet9hYKjI
         jOQdq+NMt8gemvB5tCe6KCMlisI2IESgXnmLvG2YLc+r+zc3AYVTYODVlg5teT70tuP5
         mWfAAWGC1PVKW09N1yqA4ie/sTViWn6nITX9SAif/USpybjCyqK3t/Ix9roEcb4v7rSe
         fi/aAQGzI8A0xLFIW5G+JSsxXrs8WsP2LQ2L8sVYQHpfXT44z2CR/3VEewvohet0Wu9h
         IBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513434; x=1746118234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OcNpKj2ULrV1lWDMQw0DBFTmPSr8bbwLxdvwy2alDVU=;
        b=SOGgI6ZviGgtvDswCaCPpU4js4LA/zgWZvgzOEvg058Dm3ncXlh8mpBfncbYjzMMC3
         LXAo5YkHQBc1JNs+U+vLABThoQl6GQK2IWUj3T3Ck1exoZn+kx5DWzJeBRPrKoQiunja
         KItP+M4UR6pM8QcEzgUJ6o8PZEPi5RSoKuOYM73snh1p1qBjJuokoGL2/OLMcynJI37D
         kmVwAit9QuBATCj4/YkVcbbHgcbt313jNeW7whpqvEEZ8LA56sVzvr+/l6vxRtgDl4J0
         Tu4euMVfk6gUQ8hRtlvVatFgpO6LkEKRijT919rlPTI0WAWAgzWHgLiYYa5rXBw3lotf
         ktIA==
X-Gm-Message-State: AOJu0YyDFh4xVJkdYt8jMCFZ9mu2JgztFJEp1Dss0Ossh46gqobXy4th
	JbgbaYH54vbck1hlidCfYJNrd3E5/xfXrEUpy3zUJCTK1EfJqEHgdf+dCRsdxo2UXpH+v77X4ke
	I
X-Gm-Gg: ASbGnctIURQwTqMg4tT4+V8JsnKpdC3T9ziHzn58IJJF6zYaQ03khe6n6i4JrVWT2Vb
	LSM+I7oMEcB8BwKL1ZIoU3NV3s5JaiiWxs0AxH/ptZONanW739IqBghAUQV5/5iOV/R3KtWjNCs
	hT8aJ/uvd7UtaVsaH8h1f6+qys08PT1sjnS9yDmIHZ6Na+n2ZPJ2064DZ16+AHv3XOcGniBuCtz
	CjhScwZOwRIz5IHU/Pp7rxZAIwRefPQrNjoxufmzuEd4wPAFl2YEwWG/Is2V15aijItNTJSfg1l
	1YEsAZL3SBgm85pZ+ZWAha2fsQ0w/O7LXj7aATrki5nmNQ==
X-Google-Smtp-Source: AGHT+IELql/wRvoa8BM3ex/dBaoFvABrW93Nk4W9CtFRx3vZMu1Go4RmhcXkY4KkH82YYqlFrrynyw==
X-Received: by 2002:a05:6808:3198:b0:3f6:6d32:bdb4 with SMTP id 5614622812f47-401eb35f74bmr1991846b6e.24.1745513434105;
        Thu, 24 Apr 2025 09:50:34 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-60646862ec5sm319763eaf.3.2025.04.24.09.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:32 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 03/23] ipmi:msghandler: Move timer handling into a work queue
Date: Thu, 24 Apr 2025 11:49:40 -0500
Message-ID: <20250424165020.627193-4-corey@minyard.net>
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

Get all operations that manipulate the interface list into thread
context.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 22813b1598b0..e08ec9918a32 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -5083,8 +5083,11 @@ static struct timer_list ipmi_timer;
 
 static atomic_t stop_operation;
 
-static void ipmi_timeout(struct timer_list *unused)
+static void ipmi_timeout_work(struct work_struct *work)
 {
+	if (atomic_read(&stop_operation))
+		return;
+
 	struct ipmi_smi *intf;
 	bool need_timer = false;
 	int index;
@@ -5111,6 +5114,16 @@ static void ipmi_timeout(struct timer_list *unused)
 		mod_timer(&ipmi_timer, jiffies + IPMI_TIMEOUT_JIFFIES);
 }
 
+static DECLARE_WORK(ipmi_timer_work, ipmi_timeout_work);
+
+static void ipmi_timeout(struct timer_list *unused)
+{
+	if (atomic_read(&stop_operation))
+		return;
+
+	queue_work(system_bh_wq, &ipmi_timer_work);
+}
+
 static void need_waiter(struct ipmi_smi *intf)
 {
 	/* Racy, but worst case we start the timer twice. */
@@ -5538,6 +5551,7 @@ static void __exit cleanup_ipmi(void)
 		 */
 		atomic_set(&stop_operation, 1);
 		del_timer_sync(&ipmi_timer);
+		cancel_work_sync(&ipmi_timer_work);
 
 		initialized = false;
 
-- 
2.43.0

