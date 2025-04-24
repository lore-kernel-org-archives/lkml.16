Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030928136E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513457; cv=none; b=pJKZWWEVmZqiBFsVC5Bk5dEqUABcPsf9FeERSq82Ulw5EiJFPs9Duf+wB3QnREQhv5l7Gzlaf3SmVAyxOYiYJpMO0M0ltD87iWjGnA5m7EFuwUtqSqijmA5E4dGvqyqgKvPjzDKjzTb56Gr9D8Rjt2rXENyLJjIBQHXGIfoRcF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513457; c=relaxed/simple;
	bh=9kTc4t7o1IsnHGiUfWMlY8nneXPQ6AscrQgHYpwrHA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HEMpuANjAkmRYpLbZ63qElSucoh31dFFMzamxTSgt3tmZcYhSbndE49+zfAXsJYzY+bTAeD23b8g5DU7sBlFOlbKDUYdEhqcu0mOH9UdgO+72adfmR7ZWwomrRleaF59G8eLso07KyRQw5amcMAtK6CMlM7OuAvYlQID2/WCQtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=B8LXFB87; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="B8LXFB87"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3fcfc85f1f5so361137b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513454; x=1746118254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grEWQ0hJBXjtKLv/1JIW7cg4Vz29ZCwIkUkVu1A6LjU=;
        b=B8LXFB87Xn76NCr+CpxHwEhMr/5FnKxTDlrL4bHCz7Qtp7MimsrqSkiH9brwNUy2XT
         yevnXyL1g/CwExsjWdB9/6Vopurz2Sk3KYjnQnQFrMhSDLA8ZbFZLnU6FeyP4jWsMiWh
         YSniwYaJ5aao95N2JsciHUUFnsIjhOuIUVl1K2XRiLq18cDo5ERAlX+HFwzSCn2Nukkp
         TIt4yZg5v+D9RF+xluB/4MYTfQJaBH0fdjuWJOzHSGsopxh0jPJYB3EXRRHy0scYYtRK
         vGbgiHCdak79mmk5CGMCXLNJvWjwU7DMv8tojLANTPtEl/V6cVH5wyjOWXN32c/hwD/o
         gyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513454; x=1746118254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grEWQ0hJBXjtKLv/1JIW7cg4Vz29ZCwIkUkVu1A6LjU=;
        b=JJ6hSN20aqHhsi8gd08Jm/l15Amv+AyBANm/R0Ed0YVP7jy1aVBJE5igMQ0ArgANPk
         A9YTFtztgpjxFtiHePoBhmS0QdMSdQYe8bAHe9PVrhLlgmMEU/iIkdQbekoIKS/gQkDU
         fSf1CLHniJTZH7WZeNjTvVoDlcN+LDzaAJAgv9t7+94twwA5ZQZ3TuzZoWZNc+yFRmfR
         JRsoYl5on2rypYdmsbIrJlxS1IxxOTa7P5zJbfEw8FhN/ezlpjxVRAV0ZEAkdsAl+c9p
         0luRPq95kh1+pzaSnr8imIv2sxeSbzCy51sI5H7R5r2hfIVRlvQEvXqRcFTyFfDXu8Ps
         hv+w==
X-Gm-Message-State: AOJu0Ywp3nS4UQj3b3os3rFU+3l+PzHz3u3OuvdjmSJ6mNvXNgYov+hG
	Xc9Y/Ho+4zTBiqsVG8CfaybFSGqBVzoKnOKJ4d3nfNbj5NmQzAWqwUM7Om8wDFD/h9DHcJIPa1O
	r
X-Gm-Gg: ASbGnct8p8V2ORuDwOxrAOM5q3EUc72Qc3PHlY3TWi+auTK3TUJxp7W+JqtdLnzn8JF
	4/zee57yD5jhzZQtBcF82+Y1x/W0ep5aQIRJlRrtKt0dF6FCf9pwcN6EFVUF8Xc3SgPikbPgo1W
	xtBBCxH/d0rQpCTze9+7hT7rEemoFyttwjPcxD3B7hrvtHerNpNpP3Edlh6DdJTzEa/r5xQmm2j
	GFq0RuZw0GnLQ2L8eAl/3zHQL6pUHwnK3Oysy0uZ9oQLM8Q2Z4FkeV+l0UDHBaAGK7P70rc0jRx
	Rav/rMmfiRb3cyjLs3hzASnmvp6jYMCP8I8=
X-Google-Smtp-Source: AGHT+IEtMCTOpalPZ8d+/hnZwM3bREEt7UQ4vwzckHylq5ddbr/kBcL7ygtUXXdcd71qJvRQglwpBA==
X-Received: by 2002:a05:6808:188:b0:3f6:ab66:f4a1 with SMTP id 5614622812f47-401f1244a60mr57537b6e.39.1745513454141;
        Thu, 24 Apr 2025 09:50:54 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec8b08c5sm314413b6e.7.2025.04.24.09.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:53 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 15/23] ipmi:msghandler: Remove proc_fs.h
Date: Thu, 24 Apr 2025 11:49:52 -0500
Message-ID: <20250424165020.627193-16-corey@minyard.net>
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

It's no longer used.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 74a84eeeed9c..927556ca469d 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -27,7 +27,6 @@
 #include <linux/ipmi_smi.h>
 #include <linux/notifier.h>
 #include <linux/init.h>
-#include <linux/proc_fs.h>
 #include <linux/rcupdate.h>
 #include <linux/interrupt.h>
 #include <linux/moduleparam.h>
-- 
2.43.0

