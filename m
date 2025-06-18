Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568852E9EAF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249687; cv=none; b=qtwHhQYhUJ3OZn3zT5akxWVRb1ySre5zse1OUWQ28DyQLeZJQC75ZCJmCjIoq3A46UwvjNXLBvgPz/Jsd3KIUhTkIAZ9/L+fGZ7XyKefM0ohXcUOmgkOWnIAT7rI2eGmzfPjro/eX7gH10IJUyAtzEvRD848UM0SHbLDZq/gty4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249687; c=relaxed/simple;
	bh=U8U0hNHT3QH0f69IVy2wknKdqTX3ZKFcKNly9nulzEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1CNUG0KF7Eb0qNrfAn+mph124jpWleOLX+xX/9CBybvmZCUO5aNBfwucDsTDHpeDAPLLsoHw77r6yvOS+YQP55aHRCL3VYJ0ANEjO98s5d//R5mR6VVFzl2Cm175U/UIyAmzSgmYeXSgmdgw0wW9Vr8rIi1/4zaQRaH0nTaUag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EfgsISaV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EfgsISaV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a510432236so5104624f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750249683; x=1750854483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q92YfRBQEU1POkirja/ISaBqRuTyl3kSPT8DksJEY5Y=;
        b=EfgsISaVotTIsC1+kkD0pcLs5ldiYnHjAZ6j3W+Rw8n77LTXcQMoBJa5NVXCPVs9RZ
         nVVnPA/pQbsyICJZUANn/ZmfbMpseFYal5dyBPSO+68ePTeKn8XIEhmkZS6ZX730f7n3
         p6+lDItOHiCbWoLTad+FZz0RDwyQnC4Dm2d7vsn8hWuUB7cS0yOsH4WbkwIX41vCcExp
         ynJDvgZqb6ToE8M6SYJWw4AeJh60Ux5Rh6MkWKh6lpZnvuSsh/ltoyKmsp+/yMqaQknp
         0emtGnZmWNG2l7Qyrc8Z7qVU75L5J+4KyUvg6CJKNpFCZeyWtcnOKZiKds/b+X8GW0OX
         Xfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249683; x=1750854483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q92YfRBQEU1POkirja/ISaBqRuTyl3kSPT8DksJEY5Y=;
        b=GEw2falsTjXdMLXJMoKPvH4zFD3pedUWxcpSDkIk2XB7lyNR0e20ahDVM26IEnRsSR
         HGsmIa/412YgW9txJPZbMpoCVhKCTwmc1lvxuPZKMP6JALoJ6OUtDpRGwS1m3+DnOtqs
         3sBSA7cTx7EPTbPfcbye8VyJ+w4OdRhImbSqMK2CddX2xKLInhCIkpRLSSGyLC5v3fL1
         NmAUeQrtoT0x6Ndhhp/PyjD2oL78Q5lgmjaAEikg7uQX2dyniYOXxAu/SpN8yGi5B/W2
         iWb8wS+dL7jWq02cmifiJsFmSsuvYHrFIpsQwItMgE3kvHnpGFTV/UgN2Lg0yG2z90Tw
         /FFw==
X-Forwarded-Encrypted: i=1; AJvYcCUFSyYO1/MMm5rfDqCAE9kw9twN1moAsqhsLwGmIOs94KJQUGENZO7RxpJHYE0aDpBrN76Invtd2HZsQfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfF3quHpv08qtFiLcI0wslT+O7BjFxNTtV6Qox3Hz4YW9f70RC
	5W8a2+9T7ANYdvVShK6s6umrZ6xVqlnlQGekaxQdcjiWq0kUOytRL1R7McDDsQMlzGQ=
X-Gm-Gg: ASbGnctusR6+uxtYszZt5NA0An9URLyVBR3rEZy9huAycDIJGOJSSSo8vYyhq9G7fU9
	01AqMJ7ciUQw7i9n0PylVEMlm21kVq6/8VEb1Ku0ygPLJr6yXV5H+MTZpb3D8YhiecbeyRvAYUI
	HQmIrcV4yhJFJEqjwLKz2haVkgzMxM+U9qyNzOD2WhvVCKU1hCmuyWQfpqVqv5s887gu12gzFcm
	QAgqK6tWicUCz7meeRKxPHiK11vASBG35I4V9fYnokuk9aChR7/uWSULooQwVIT05fxyLLAOFaB
	pghEu+ly+HuI9h4wpEvMf1UkS/QFKbIiJKqDTv9cQ8S9fVvLjd7smD6B2tlsqQ==
X-Google-Smtp-Source: AGHT+IHAY43bGXTcfbb74SIoOCl5KnBfYsgeA8erQ2AwmXjLU96NDulChk0hUzZggqfaz89QgdOSFA==
X-Received: by 2002:a05:6000:400c:b0:3a5:2e9c:edb with SMTP id ffacd0b85a97d-3a572e7969dmr13405814f8f.47.1750249683450;
        Wed, 18 Jun 2025 05:28:03 -0700 (PDT)
Received: from zovi.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2449f1sm211215125e9.23.2025.06.18.05.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:28:03 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] module: Fix memory deallocation on error path in move_module()
Date: Wed, 18 Jun 2025 14:26:26 +0200
Message-ID: <20250618122730.51324-2-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618122730.51324-1-petr.pavlu@suse.com>
References: <20250618122730.51324-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function move_module() uses the variable t to track how many memory
types it has allocated and consequently how many should be freed if an
error occurs.

The variable is initially set to 0 and is updated when a call to
module_memory_alloc() fails. However, move_module() can fail for other
reasons as well, in which case t remains set to 0 and no memory is freed.

Fix the problem by initializing t to MOD_MEM_NUM_TYPES. Additionally, make
the deallocation loop more robust by not relying on the mod_mem_type_t enum
having a signed integer as its underlying type.

Fixes: c7ee8aebf6c0 ("module: add stop-grap sanity check on module memcpy()")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/module/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 413ac6ea3702..9ac994b2f354 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2697,7 +2697,7 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 static int move_module(struct module *mod, struct load_info *info)
 {
 	int i;
-	enum mod_mem_type t = 0;
+	enum mod_mem_type t = MOD_MEM_NUM_TYPES;
 	int ret = -ENOMEM;
 	bool codetag_section_found = false;
 
@@ -2776,7 +2776,7 @@ static int move_module(struct module *mod, struct load_info *info)
 	return 0;
 out_err:
 	module_memory_restore_rox(mod);
-	for (t--; t >= 0; t--)
+	while (t--)
 		module_memory_free(mod, t);
 	if (codetag_section_found)
 		codetag_free_module_sections(mod);
-- 
2.49.0

