Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10940204680
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749313283; cv=none; b=QGmbxC1+sTVx8CG/VvfgYupqRX6TFWykadKx/IJQwcJZTA8cJBh4o7j8I88W+M+FXmlDDhJ48vzmpXSzDIx9vtcHgVFoQzwM/QYODklwj7sHSihIcpU0oxO0bn6LmuFL1IVltwXJaLD0Tt/6UxDOHvkCqke2NJzAdQeXHlfAzxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749313283; c=relaxed/simple;
	bh=xEf5YgI028rHADc5kVooZ5wADbUeVnr/T/EysAZOuoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptdnlA8S0DX/kW4prj/5h14xS9Joy7DvwSf+1GFi9xFsq+zW8Q5uJidncFK9NLmfhQfllR+pzI0fe8rb+iBcltmp5jWNPT9gdPSgbYf5vujdpW+rk1l/p5jjHpkNwvCtRkK/CgqBvk9sTubUq2uAybkY/JuvsSl+K2A3nV7sMtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KruhDqfK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KruhDqfK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2695859f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749313278; x=1749918078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTAHuwi5ob7zHOE4R3BZu1de8+m0yqDLb9Txz10vj3c=;
        b=KruhDqfKjuoCoG93AI7MYS6UXocAm2J3uAo/F5TvoTqlBFFQu5TkwXxkvEd0gNZ4UD
         qSMeTzoVlclPWwvi8sAoicbiRbckMo8ycj9pB4ByvDYwZFkyweBdolnCbxBi+nhAPdVU
         F4ud+B/qEt03bCKU9QAMRQgmwB6TT3mXMUnE5tCzpIkxrYbjnoUndskZb/6hVvo9gz9Q
         D4qVD/3z9uIOG1L+Q8+H/2cmeXzDxLSf/bkBrlUmYGzPeniR8BbI96o6HYRzlQosj4TZ
         gzO8BRpAzILoxwu/OsW0RkJL952uXLWNgVtKotheMzF1/37WKaxY2ZnmRYxhAcqcNFXs
         IQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749313278; x=1749918078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTAHuwi5ob7zHOE4R3BZu1de8+m0yqDLb9Txz10vj3c=;
        b=QdDPVugvBa8ibJ6fXBG/jotckIr7pVAwFeY2Ta4YlV/YeKU8yIk8neo9KEKIVrs+Va
         lsW1EarSG/wbET/jQ0BGvPMWSUHu/NBMyDgYRJqj4AR6Dzh5bNtggBBOyjwGwW9O99d4
         zjJS1reNcOD1G8wQaWiW/H5qYl0YObnJishQ+c+OEc5EQiR0Z/n/AxogiYOs+ZiekA0V
         Y+XCa3nt3WRdhaUNIJAgyIfWgvQcbnkj/wlyEWiQf9yRSfR93nvHZKcG2kh67nWz4Wc2
         Lt/YznyXqYtUl6FQZ4rQymJkAto1N8phibvnfcgem/qUfdU9blz01SegD2ncm7dCZUjJ
         cIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPJpYVYh1KQVkuvZCbpNr3P2Zb2RhYofBagTPG1hCRldZYENpi4bfEa0LgMqQK9FJg2BLNjRINWJHbb7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfbQvd3MDHBOt8wNR7TwwLkTRTQE5feRdmQmiF9rVu90GfP39z
	n8Q3qDSXtRhQ49mR1zCBx9n7G1IAvsrwVwbdaD6Du/hhTvTCxzFnNFoMpp/qZo2wvzw=
X-Gm-Gg: ASbGnctx/cfs63IJogvB46JO/jwiF05WSGX95y4UxZLj2OsDf5C2qh+f7dXqDxtu9bQ
	wlxkomk3djsuznvdEWaVcScLz7YmCeHJQxE1uEMc6/2Quko1L2Djh2ef6JjBgyWenPu7HkRuJYx
	ot/qSmirqmv2QrV7Ci6j4AHgqTdEsmkjppD99eGBUWIyCX30oDCnbYL/j5hhCGCfNwyuGGjdssd
	w4vKJqv8CJeOfsYUt8eOq1yJ/n60EDlx7w7DhoT3e9Z2jTAt9mRuKtCqKknqKzDH5bJkQy6oas6
	jK6qXwcWApp70td0BWgNSwspJZUFKANaWIcFZXGNaaCeMNj42EAfUzr2GlcbMt7BK8ucqhA=
X-Google-Smtp-Source: AGHT+IFDb592g0JwsMPxNtq/1ZdQXyvAnSTz4sLNKzI67/x8qJu7TqoYK9PnNj7U4LmghIJiySpvmA==
X-Received: by 2002:a05:6000:2511:b0:3a4:f7e7:3630 with SMTP id ffacd0b85a97d-3a531327cb9mr6993813f8f.15.1749313278470;
        Sat, 07 Jun 2025 09:21:18 -0700 (PDT)
Received: from zovi.suse.cz (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364f1sm5088096f8f.58.2025.06.07.09.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 09:21:18 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] module: Avoid unnecessary return value initialization in move_module()
Date: Sat,  7 Jun 2025 18:16:28 +0200
Message-ID: <20250607161823.409691-3-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607161823.409691-1-petr.pavlu@suse.com>
References: <20250607161823.409691-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All error conditions in move_module() set the return value by updating the
ret variable. Therefore, it is not necessary to the initialize the variable
when declaring it.

Remove the unnecessary initialization.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 322b38c0a782..06511607075c 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2615,7 +2615,7 @@ static int move_module(struct module *mod, struct load_info *info)
 {
 	int i;
 	enum mod_mem_type t;
-	int ret = -ENOMEM;
+	int ret;
 	bool codetag_section_found = false;
 
 	for_each_mod_mem_type(type) {
-- 
2.49.0

