Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE67C8FE
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451834; cv=none; b=ZXeJv0MzV77aC20ASDN5QjHSo/xHARW/pPJPeysYY810vpKn0aN/CYaxpVdi5MZiB2Q7feHimqpmMppqCgm2PE1QtwTmKjd7QqmCqHHKEQbaqUn2g1W7RFF+S3W76CJPd7RaRmEX/lK/AjRLKUnufiP8kgi0tsm7GJcgC/BIu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451834; c=relaxed/simple;
	bh=UsRJmxSzX5ZOwpe7JqsYy/4OxjCEXYbODGaUrJyxL2k=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=aad7EFN5/uscEb1JupffwLMJue8OMSKLLOGnKICLY67O0hGHOyEIZ1w16MyLKgYqfBg5JnQX+fRnx+MxZO9mJX3v/zfa5UdIe90uMZGEuNRDyqqmEwsQ3nUF9T0fZR0Ai/6uPIv1OIZZJsqEECuniqDxUuzY/mypVnaJTFqLK5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=rrx/XmeU; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="rrx/XmeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746451517; bh=2/FFJmk/+fGXLOIPIpdneqACysAwX5YZ9QhmVvofnu0=;
	h=From:Date:Subject:To:Cc;
	b=rrx/XmeUqF2EQf0gE3tLWLo6hE+Akf0Z+Xzla3z48cwALG31iOj4sG6FMDmm8spjc
	 7fRPR53Xqg6ZU37JhNB+kIcj1FvVG8otqfwmvsgJm3Bf37zMAroY4E6w+holHkGBaH
	 HWmGmm5cQix2adN2V3IgVwslbMEOBQq7rE3AGWLY=
Received: from [127.0.1.1] ([112.48.12.6])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id AA8426D; Mon, 05 May 2025 21:02:42 +0800
X-QQ-mid: xmsmtpt1746450162t93d9i15s
Message-ID: <tencent_593580D8307F26937D7A7AAA0721D8CA8309@qq.com>
X-QQ-XMAILINFO: OGr48utWQcJErgkr0OisvbP+BNPLpEilUs/bh8G4dbo50M4coI+EkxVcWacsaE
	 HLrS5+d3BUWV4jrR5k4no9vwv+HRdxh7DsTqkjmSk0/1HZ/bjqEZJISZVvDEUzVldgURLgwSxq+5
	 aQFrflS+fZWUvZXem0mUfOBhd0U/t5tb2L/6CoN+vQ46NpOtpq96exc1zNJqRn0pi22pv43h8mEG
	 U6E+3XpygaES3Br5djlUze/DPemnGBgNonmQ48axQuMnDYgQr3YLpzmD/hVYlz1uqtGF7GwcSDgU
	 HWluplzGCxx65OkcLRgC4B1MvaHFOjpdpIK1LAIGQZqjSV6h1KRbar87faVLPJLrGspikRms9nE9
	 yCWwdyjJ5bR4MJ/RxDV3p8ZtW7TMXknY9csrCvuDVcWb1CFa5AT8XvdV/x9Mtgo71wudAsle9tjU
	 aFdgKA9aucGQtukK2qdq/Uhd6pgOuMZADBnvcUxkxb1uFeMueapW3t0RVrf3E4HlB2vf5m8k3QWh
	 B2x/STGGLEDFbnJVXdaNcecWp6OfS76UY3nPVEs11t/tVqYZVV+5/BXOUzvd/4uJ04KjCQyKfbeN
	 vjr2RuGfYANUqNtUAMeUEuFyOR57dZ/fYcj+toDBIfHTH2DvXJlOohS20I4WOeHI/KTiqESWF9kK
	 WZIdyjpr/rLlE/CxT5aBtlbpTQLbC91FGwzrafF3nepa2uSc3iuF/JDzB3WMf2KIpocI7/5/VO3Z
	 p/3pQU6nYkNQK1PYBllu4T8Z7HjcgKKVXReDb+WrqBTcvwsvEmHAu9YG1l/JQjtC1lZuPJs3mtLi
	 bnLX7T5fJnPah3WafrWUSOIdg8ifS3NOJPYqWN1uUq2vSFNSAKiAIgVotXxxv/z7ZAQDmF30V4a4
	 JpCuuZBRFuFw4hZsdtuGzF+us5cccKTjpZ85QWt64dBxOvoQ7+5duLD65lRWaHb6ZMGiTOSb2YG9
	 dYUH5Zo9cHgaULGqG+CfN4L7JtN9R2B1KsE82doalu/7uef+TmYbyN/NPH2yPd7xkcmJqENXzoev
	 7sSYxpq7Je8pRtS5u5BEJdEkplfI4eiDm0q6h6wtswGJ32SFgY/CpTyrqEHsc=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Liya Huang <1425075683@qq.com>
Date: Mon, 05 May 2025 21:02:36 +0800
Subject: [PATCH] sched/core: Fix missing semicolon in init_task.se.slice
 initialization
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20250505-sched_core-v1-1-248eb27f0d12@qq.com>
X-B4-Tracking: v=1; b=H4sIAOu2GGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDINQtTs5ITYlPzi9K1U1ONjc2TzVKMks2NlQCaigoSk3LrAAbFh1bWws
 Asxqar1wAAAA=
X-Change-ID: 20250505-sched_core-cc737e2b6c31
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, Liya Huang <1425075683@qq.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746450163; l=1237;
 i=1425075683@qq.com; s=20250415; h=from:subject:message-id;
 bh=UsRJmxSzX5ZOwpe7JqsYy/4OxjCEXYbODGaUrJyxL2k=;
 b=LfG1oThBX1XHxxECNoSiE/XT9fDmo+AsGJJ4uNPGI/E1zB2/sSfy8jR4zuiO7sOuIHLjVZODd
 YGGw2wZvX/rAunsnztZzpCsvb8jHZlewUNMWFcf/eYVWWfqTJJSX/og
X-Developer-Key: i=1425075683@qq.com; a=ed25519;
 pk=nSnzeGGcMXBimuyIWYIZpZRN8DboZqwr67IqWALwrGs=

The initialization of init_task.se.slice incorrectly ends with a comma
(`,`), which may lead to unexpected behavior.
This patch fixes the issue by replacing the comma with a semicolon (`;`).

---
sched/core: Fix missing semicolon in init_task.se.slice initialization

The initialization of init_task.se.slice incorrectly ends with a comma 
(`,`), which may lead to unexpected behavior.
This patch fixes the issue by replacing the comma with a semicolon (`;`).

Signed-off-by: Liya Huang <1425075683@qq.com>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba055544704faf4492bd0e053f5ae42..e393aa82399b1f7ef3b4b6a3b3fb3e624bcd031e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8685,7 +8685,7 @@ void __init sched_init(void)
 	}
 
 	set_load_weight(&init_task, false);
-	init_task.se.slice = sysctl_sched_base_slice,
+	init_task.se.slice = sysctl_sched_base_slice;
 
 	/*
 	 * The boot idle thread does lazy MMU switching as well:

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250505-sched_core-cc737e2b6c31

Best regards,
-- 
Liya Huang <1425075683@qq.com>

