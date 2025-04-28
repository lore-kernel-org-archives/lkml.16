Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6B27A90A;
	Mon, 28 Apr 2025 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856770; cv=none; b=YQnbi6XMLVqdQFDRRPvZNfAqLUdVAs5ozkd4jqEhNePkb6MigGPtvly9y9J+ktlLCxQelrFR/BPIgQVfRvnuukluZBHPFrjY8b8Q1ySWEAYpg2gtd+f3lGTS6ka5SxUb4TKAoJjr5SQvRtJh+BqzYTDNstskASZVj1EraHSiyYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856770; c=relaxed/simple;
	bh=ByRxh52fka9P9JRSeYUSXOGXCFjMN0BA0b7fy8L5J5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZenEJ+y+dvtYov4+ZDMIKH785WS1pmnXOrgnegTuVVy6Foh6v3wKGPec+rEgA6dbjGBKpHealmcOzuXumXZSdXmIQKO6ERHqQPK59KwuejHdb1+ao1a1/S8mbI03OKC6hKmm5Wh7tmoIH9LEfeJwrdiEP+qhmSKHMr2tf1aZVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3MPVIkG; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3MPVIkG"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so7869263a12.1;
        Mon, 28 Apr 2025 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745856766; x=1746461566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ6LdQEoc6+Eq/+8hw96j8E1cLvu8eynjDejEQpx0P8=;
        b=c3MPVIkGrhShKrFRR3d3nAn96ezG0/TESRSGPQtlpJ/KmTqTea8tG7WLcObrxBm7PG
         cyRafX+ItIDjSRrLWDatzqFWVIRCzHBRAGPAwkXFHHwVYxDjEz+jzo8JZ49twTfkB3ws
         mZq6TRAeIZ01uQnOhwfgCa+34QXRL+1BaVPwJXWQtJf81Fc+w4uTTEegwK/Z9xBQgN6+
         TVpWQ0rkQLsPHdP6gsfVu5hOPooJKB8PhaoUC7s9GC6h/YlXCb1n9m5ojUFRyCgF4JPv
         bv/xfOD2+sj4IMHf9xsYaTMhljqHQtDyD6aCmaoEK3WXYo6Ya2srPpbsY4FKXHDv1Yqu
         ixlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856766; x=1746461566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJ6LdQEoc6+Eq/+8hw96j8E1cLvu8eynjDejEQpx0P8=;
        b=RXQbeP7+9iUZRMwzaQEndk9aTWMlbW6cvUagFdudyerrDHxgnDCjRBAVkpJ0XAnM75
         q/+7RT19dgiMA0hl1QkWz+KL90OUFPavNQb1HOLG73g6YVK987RTFHvOWS3MRXhQrx3S
         gJPByF4yqkNTJodRkORi+ImWYdPl3bJ6YWlsbq/eIsiD8tGf4XYcpnU+5EpTbwhettuD
         wWL9v8fU+gqvFCExK/SVkZVNCfQY3QyxfBFBRvUgOLs1Y6037HwDKapUD39cH0ag7xe6
         mDKIJyU3rOo2U87wRhMzd8UAfGhm8MmQZgEVc24/p7qR7GExv75T8S5jCOUG0bBKAWVL
         /TuA==
X-Forwarded-Encrypted: i=1; AJvYcCXoZ+P/hCgCRnkj5raiO58IFM6cEiX7mTlPd6uhoC9FE0hIqbqBOcd+eM6DoUP40IWUGBGX9noDSBwy4Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDMVg22NjpxJykdCuZlZxDyvukRh/Myl2N8NCK1PyzZ1VkEWs
	shUevpnXPrImhFaDKoGm7+7PU/mIY2gud/suesR2fXNs0iQMhkhn
X-Gm-Gg: ASbGnctinHU/qR9k964E2WEAcwDjxDfAF9B9R2BYWSlhCj5udzDqp46agMZSA7ghJ0Y
	d9UVP/ZdDDIddAKdpLDFLKeoZdyxEBQINOz1v8J/forsrR0Ouawx2BoBudgTCUGuX9sgVZtGBw3
	FIJRnKKdMhOeUQort3rS3YgS7E7cmYXq5DTCIMLa9eW4fryPqsD6l+sq10ioGuhhGHFobOKqqyd
	Ef+D2oSVPvq0OntA8/yAF0MP91lU/kfkXu2c0SyW8dKeD6mZO5jBTNJf4EAA7Q9t9H3tWrXDbQ7
	A7hZGAumX9DFdc0SBLovEMgluU8XSX9TGjynQFXG/R7sutq+D4513uVtUNdFGJSmRUDYn2D+6+a
	EBMLPBBdu+1qIlA==
X-Google-Smtp-Source: AGHT+IGlL+aSuwZFAf7ef5SH8B09/XSBqPd7PuCHqe4A2eNjIlK/w5Rq0KLs+zc2T078YQ1ntWDF0A==
X-Received: by 2002:a17:907:7daa:b0:acb:5f9a:7303 with SMTP id a640c23a62f3a-ace8493c1e3mr829040766b.35.1745856766249;
        Mon, 28 Apr 2025 09:12:46 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm640429266b.33.2025.04.28.09.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:12:45 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: topology: check if machine is NULL during tplg load
Date: Mon, 28 Apr 2025 12:12:36 -0400
Message-Id: <20250428161236.126200-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Check if "sof_pdata->machine" is NULL before calling the machine-specific
"get_function_tplg_files()". Otherwise, for OF-based machines (which set
the "of_machine" instead of the "machine" field), the operation will
result in a NULL pointer dereference fault.

Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e19ba94f2c80..5d3ee3a86392 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2481,7 +2481,7 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	if (!tplg_files)
 		return -ENOMEM;
 
-	if (sof_pdata->machine->get_function_tplg_files) {
+	if (sof_pdata->machine && sof_pdata->machine->get_function_tplg_files) {
 		tplg_cnt = sof_pdata->machine->get_function_tplg_files(scomp->card,
 								       sof_pdata->machine,
 								       tplg_filename_prefix,
-- 
2.34.1

