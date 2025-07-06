Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06ED2E36ED
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 21:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751836195; cv=none; b=Eu6KbPzhqdIiL1XVcd2S4318Q1hsBbVebg+w92jEh2mxF2TODRgKooEm6VHUPh+4QGZsSfNXr1xkdvlc+NCQ4cjUkdRhkAVKRi6jqISBU1VsSwBnMmU0/CEUGQ7UTYJxpoG3q2z+Kq/aqa6mEa+kTwW7/tG+2QyVVUgB7uFn40Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751836195; c=relaxed/simple;
	bh=14xc/UbRDGdY2Xndq2VfpIaojZKxUhmzvqjdFfnWODw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KmbW1sfv//7YWlnR8u9WAzrSYwx4jQ+GJBDJtDJ7nURzgo3CjGWQ0wxyqgJjvGOD1LmjaRxtwoeIJyB+OIDT6yr1ZpC2/V4QpD22VIBW3Mv4ZdDwch/bREcptIzL764rifs2TRnnD821j9BGj4Ap6BUnP5jjj2AGhw4uyFpmumg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=stMADxs1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="stMADxs1"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so11735575e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751836192; x=1752440992; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aWdzYZMD2X+7d8TrDHbqBltR8re7YcGVkWpir2FMrGo=;
        b=stMADxs1N85DgGt2evLUf4CYzG1i80wi6nFdNcEY30CbFbtatxkl8ekxIwxCyoeii1
         qeaJgGPp9sLdU5fvxQqQpdmFIDUdjdrQLzf/DMnbt1W0o7ICt+NBDMZOg/cxHwgSHHGB
         /4jZPUDVcbZSdC+SSrdAoc4RFQJD4e76XFQPbGDZaBy/sOaXzjOSEOnXXZHPWDrqXlug
         sZZOYpk2lgU1I9S1s12+qJbcuSvw1Eocx5Z18MmjOi7Kd3HjZ5zNiluhnPfe1hoyfLcn
         on7NsDx9gYa1of88uuAJiigUU3LD9y0eJpbOedsXa7JztsqKRLF/eYklsLfIQ0DYEZd7
         zd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751836192; x=1752440992;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWdzYZMD2X+7d8TrDHbqBltR8re7YcGVkWpir2FMrGo=;
        b=mhZuVxHNRrVc/BB/FgPGA1LDHlejua+N7LnnBxQFtzTw8Gu6PVQZO5E2q9sewEqhFE
         7vS+t4EhJELrmkFgw/5TQW2cy/Ri6ndppILN5XlW1o4TNR8LCvlo6wKg7iGc33Ps7QvZ
         ABYE7+sfJDjGjXcR7oTtTcYS1HTJGjBzrehUa1VsAvobrTY3Am9tyWdiRr6jA7T3rc4J
         LPE4TK5sInRDBV++NFgb6yIpk6TGYhyrpNexLp7JzQdqcTnhX9jNzsyVFOBgVo9x2s9H
         NU8SiE7b7wDHjbkijgWV6EWon5iG29SsNXaoZ8egjEwHgjkvkzuFk4Xk3b+GULQIOoEV
         uJRA==
X-Forwarded-Encrypted: i=1; AJvYcCXZgsXTeCLqUT0weGGzBab3bgkWnHP3N3aRJaHhbqsBG0g+vsTPg3i2oN9N9VwJFtIHhifHqRGTLYYAygY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlpp47nsE5m/moW5cJR1UXxMKi5Id8oFlyEALQMGGUkTSFV5Pd
	ayagBoTJiBzfAfv/DcllSk1JzY860BXmLU4AvjaPhouSZKNyPKqawk5segTk+yliciN6c8cfaiF
	TfkG+WIkeuZyp1J4A1g==
X-Google-Smtp-Source: AGHT+IFJ8G+CrfYTTfEkdhNdUJz2U26DztZqW9PcSzm3+9oLzYnR+EGgWWEfO94VNvAWvlhdXd3G1XOt8kliwmM=
X-Received: from wmbdv27.prod.google.com ([2002:a05:600c:621b:b0:450:dca1:cf91])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5251:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-454bb80aaaamr62156395e9.15.1751836192366;
 Sun, 06 Jul 2025 14:09:52 -0700 (PDT)
Date: Sun,  6 Jul 2025 21:09:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250706210940.1720720-1-sidnayyar@google.com>
Subject: [PATCH] modpost: check for NULL filename pointer in find_module()
From: Siddharth Nayyar <sidnayyar@google.com>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"

Pointer for dump filename can be NULL when a module is not created from
a dump file in modpost. The find_module() function should therefore
check whether the dump filename pointers are NULL before comparing them
using strcmp().

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 scripts/mod/modpost.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5ca7c268294e..9a64d0a55f89 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -178,8 +178,12 @@ static struct module *find_module(const char *filename, const char *modname)
 	struct module *mod;
 
 	list_for_each_entry(mod, &modules, list) {
-		if (!strcmp(mod->dump_file, filename) &&
-		    !strcmp(mod->name, modname))
+		if (strcmp(mod->name, modname) != 0)
+			continue;
+		if (!mod->dump_file && !filename)
+			return mod;
+		if (mod->dump_file && filename &&
+		    !strcmp(mod->dump_file, filename))
 			return mod;
 	}
 	return NULL;
-- 
2.50.0.727.gbf7dc18ff4-goog

