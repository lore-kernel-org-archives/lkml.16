Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B56211F;
	Sat, 21 Jun 2025 19:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750533330; cv=none; b=D+ymbIQiNN2yMBWWIvX62rRTEAZhvL3A+iXbzdwMBemcRxNNQ5+4BI8PWr8tiGcBcR5LA8Sj6I3RLblHJB9lbPPVFLf2cXWWoc2CTJJxapNQLASjvMMk5cPMfFaeCHhOjl9gnAupdUbqq59HOqSUHaE2LlAn5e8Yq9cT8IlOUWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750533330; c=relaxed/simple;
	bh=KzUQDnReREBPfVZQbb3GMmWlm2zqkpJbIDRwtszYAKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nx4zFZJbYsRa2c9AR2cTW5rOkkmnhCt0bvwxD9WgVevQGiQ7HPngRniDA3k7b7Ye2X6a/S5VTnbkmcszyjwrs92w8GxW5q8ZFGQas1W/7cayZ/lEX04/lO6+L8/DWBSsflqP+pML+knbPNc/ZXIrd06c9fW2PeonT/L1eq0ySVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC4a2Wdw; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC4a2Wdw"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so3381185a12.2;
        Sat, 21 Jun 2025 12:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750533328; x=1751138128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FyabKKZRpe1kbc7KaEKrqFY9IqxUD7ZU2rCerIRqy7M=;
        b=nC4a2WdwIuxRa0T5XJiPacTlmkXN3IW+Os26yLMj+ltIbNpp9r4ZRh+/REqc3bgYPA
         V9IChSrs1/YodXKluAmPxln5BJu/pTqmX/UGizTOf06+qUBFhK5dBSrW6XMtiMTaIUyd
         JnKyEFpBEZyoLdG3itDv8wuDGFN2E5E0rPJUy/GBBTzw/SWzPhpX9thaxRQpmXd0sUcA
         1FYwa+h2gQKEqxq4YkKeA+3UTPu0sRdZRoJW6cvfyOSa4ekoGIZlPWo/sHgtNRV6W3lL
         WWel5m82lB785Q441e2NCge8CgCoSjuA3oRXPvocF/nZriFZJV0Pumy8NNsTNiyipX5d
         MGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750533328; x=1751138128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyabKKZRpe1kbc7KaEKrqFY9IqxUD7ZU2rCerIRqy7M=;
        b=Zep3qnMBkkyzOTxeJxXmPteBPPHTHNrJY5DFTj8QarkukE8O5ZxIY+cWgL1ISR9zg9
         t2nGVfDGxyLcKdLoBlltwLL4AzlLWCkb2W3b0yupCVENGujQDMsEZxjcTotv7N6yuxcl
         vf8SNrKPAlbgZH75TVvLrlFauWNI6rue4Pr5CZx8V5C/EkObBn40+h7p6rTWlWmsykRD
         pr87z06jqOEBj/w7BQMTjj1Zse8ru6qV/oUp/A8B5NW5vvkffDMhWU/udSinc/i26MoR
         T27CzcXAOrxjOR5cnD1uH/9GVgTo/cFfz8zQbZkrxP6yE5VWOu1DFZQUntT0vm517G94
         13pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuXP53GV5ae/GSL8SYulpq1tb4uNQgMzse/mI8Dvw2Gthz3xWtjuwVuoXDDxMJLd52/5IWcDe9SrcoHZU=@vger.kernel.org, AJvYcCWUXCZxanspRu+G+hZjB3jh/vCHMfUg878MCZx7Q2Tqf55bgy9M68Zr8Hoy004PJTYDLdwhH7sfTLbz6wE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDjHLhYrIYNktiydonID1WvpMjBuZrGTUHLFs36I4WexUhCmjG
	VSn9/sZR6kt0ZMbCG9QorHqJJwYhX80z29HtJ85FG9TiG1KSWD3qFmZD
X-Gm-Gg: ASbGnct8d4oMzzFxna7C/eABXKFF/6UshUksijfAg0ggOnFA8Q1LvyuC3jLrxNWCffz
	EyB0u22sT0N+OaOXzvzGRegVO28uBDG/xmQVkVRE+Gfa3KrTCKyekD1IQaaR1Uzyon1TPusWHQM
	ikkdQoWWggZA8dBWVwcdK12C9ykdQPJSsC2JjBo2EOHeVWthfVaTPNhD6AVk0TULBpRIN9fEWjh
	SBGSAOu8xBXBZ3+PRiXJL84cwXmbD0d0Ma3WaozE9lX3fqBoedpEOn4O/pw9nOWbIZvVtSizMYO
	7P/IfLI3gEYhtG2rbtDohtP/HOGPmEkYrzvuyyBdEk0Ho9OxiKRGLPNUXJFQfzWVFe+TjDE5QLH
	TSQOQwBT12Q==
X-Google-Smtp-Source: AGHT+IH0/oCczFhSPKQ3YqY770/xMT6R9Vz+U/odFqTFEILAvRAB8bWMSAOlsFEqbW1XlAarUlPBfQ==
X-Received: by 2002:a17:902:db11:b0:235:f45f:ed55 with SMTP id d9443c01a7336-237d977a56cmr120790325ad.1.1750533328466;
        Sat, 21 Jun 2025 12:15:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86628ffsm44843365ad.156.2025.06.21.12.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:15:28 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	sanyog.r.kale@intel.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soundwire: debugfs: move debug statement outside of error handling
Date: Sat, 21 Jun 2025 16:09:38 -0300
Message-ID: <20250621191522.14415-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The start_t and finish_t variables are not properly initialized
if errors happens over request_firmware actions.
This was also detected by smatch:

drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'finish_t'.
drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'start_t'.

Initialize those variables and move the debug statement outside of
firmware error handling.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-sound/0db6d0bf-7bac-43a7-b624-a00d3d2bf829@stanley.mountain/
Fixes: bb5cb09eedce ("soundwire: debugfs: add interface for BPT/BRA transfers")
---
@Vinod Koul, tks for the suggestion. I`ve kept the ktime_t initialization, after moving
the debug statement, they are not actually needed, but I think there is no harm to keep that.
Tks and regards.

Changelog:
v2: moving debug statement
v1: https://lore.kernel.org/linux-sound/20250617015230.54981-1-rodrigo.gobbi.7@gmail.com/#t
---
 drivers/soundwire/debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 3099ea074f10..42d2aba285f5 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -237,8 +237,8 @@ static int cmd_go(void *data, u64 value)
 {
 	const struct firmware *fw = NULL;
 	struct sdw_slave *slave = data;
-	ktime_t start_t;
-	ktime_t finish_t;
+	ktime_t start_t = 0;
+	ktime_t finish_t = 0;
 	int ret;
 
 	if (value != 1)
@@ -291,6 +291,9 @@ static int cmd_go(void *data, u64 value)
 
 	finish_t = ktime_get();
 
+	dev_dbg(&slave->dev, "command completed, num_byte %zu status %d, time %lld ms\n",
+		num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
+
 out:
 	if (fw)
 		release_firmware(fw);
@@ -298,9 +301,6 @@ static int cmd_go(void *data, u64 value)
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put(&slave->dev);
 
-	dev_dbg(&slave->dev, "command completed, num_byte %zu status %d, time %lld ms\n",
-		num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
-
 	return ret;
 }
 DEFINE_DEBUGFS_ATTRIBUTE(cmd_go_fops, NULL,
-- 
2.49.0

