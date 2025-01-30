Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70111494C9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738212304; cv=none; b=d0uUOH3TDoXiDMhM5YwhQaGR1eE/bPP7Wwle/X6baepu9CMEZNt20QzwELEiyM0EDgcMhFrwzDo+L5BrgI39JtJVGCqV3brMUZZvmSsPA6R7rlotJ7/JBxVlCMpjN/P1n6u+Pe4VNkj41v69rEd0BR5yAXujcDm3X3/idk26GfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738212304; c=relaxed/simple;
	bh=UCW6WgvipXPkDMGPfam+h+FXh/InNG/mCDvCSUK8ghs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=arbGJU9mUaV5VdzWSua5GKX/XIkfh8cLAsya9p5rxVopQvxBfDsifdgFSA84lJuV71+N3gVooaqbJ0DBl2DNzs4XIzAbHnthq++2o2Xi4HUcORqLpcRWuQG2ARN2jQGjJ0yuY40Hf7drmeWuWvP+qlbOAOlFin5OnTEVYNSKz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ICHk3NGs; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ICHk3NGs"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21670dce0a7so7478925ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738212302; x=1738817102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wp/wqKAz8lT7ubXbwwLLqI8OYR2q1r36R1/w+GLSRuc=;
        b=ICHk3NGsLnScs1YWujWBGxTOGsFuFajX36GlUBTaol5SFgN+Oa1Tp5ARwW9maMm0Bg
         Ambr7IUide7EiEQQ/VZ8gbUJVhq7fQiG9MWL5Vjo8rlPHDBzzAYJmvaOmmS4NtuhNn21
         iKkNawVcAPqiDzz1KEoNHkjTxt0XhCOxzwIxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738212302; x=1738817102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wp/wqKAz8lT7ubXbwwLLqI8OYR2q1r36R1/w+GLSRuc=;
        b=HyNsVnUGjtw4dLD9fI1O/b+TkZSRdVX+GeavguYONFvDq+GwMeQL0acm5TkPAcs1BK
         A0mm4xnj9siKvYDhmzJc/mvyXZlPE4mQg00mvbqBwHGyoceTP2TX8lRdS2OthzrDBghO
         Dv2zY9Ibo8wTf7spTIWl595llltpFJEIP2fklUlYkTtOG+VXOreXDC14EjePwjy+c+7A
         OYt2U45SY09bAm/0/8cQ/rdpzm8S1TPWKMuFDHZ432j1czn//Iih6w+t79IB59/z4s/c
         s4yYomZBQIUkKPtuEzdUHeWQFRTlXP5F5yaQbkZW8bKaxqO7e3NkSiESRq6oYqsuBw9g
         pYOg==
X-Forwarded-Encrypted: i=1; AJvYcCXDFm+0JO7uk2Ped2IMZWGJ2otvjK5Sie+opxzXyqhDn08q3dDssQXzPVdS/ItkQivI0ZN9mz1nQlf2PMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2SfUTEhGeZzqZPl78MSl944GmKnh5QzUeyOpZ4a8lKO/m9KNh
	JI1Fvf2K1nn2pumCy401Ay+jjCTXYvRW8afHUkeZHk8YlkDtvbqWD3WL7hZKaw==
X-Gm-Gg: ASbGncs6m+rRrvYSz4ipLtAnFtB6fYhkzXlsqTWy+yypC6La0jaCJzXhzlRB9LdH8cH
	Ua9ZfPqUTCRBMYwlmDhULgeXPsGq6s2wa/ZN5EaNjJ+CJi2cSwsql2lgYky3AfiWbCsc30o1GYA
	BZh4wKP8r1EfpoQ9PGht6gM57ogHxvdehZY4LoP9nK5XHvMzUEGUUBv1sD9wOI3nlhmIUIkeWGO
	F/095WmoFnlpN2Idmaoz30OCzqYgm9TKk9VBAtgdxNlRFXD/rHR3yEGwBWajnfSYNfo11qs40ju
	R+JfEFXMnpR2LZ0qIg==
X-Google-Smtp-Source: AGHT+IE+jTurSVbP5RHK0HJJXvm6F49R9W3yu8ODTcVpDcGP+GZ+KVPXpYzFtBPDke2AQKxhs0qqow==
X-Received: by 2002:a05:6a21:33a4:b0:1e1:a9dd:5a58 with SMTP id adf61e73a8af0-1ed7a6c87f9mr9888284637.30.1738212301909;
        Wed, 29 Jan 2025 20:45:01 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe631bd9dsm427630b3a.14.2025.01.29.20.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 20:45:01 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Minchan Kim <minchan@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 0/7] zsmalloc: preemptible object mapping
Date: Thu, 30 Jan 2025 13:42:43 +0900
Message-ID: <20250130044455.2642465-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is Part II of the series [1] that makes zram read() and write()
preemptible.  This part focuses only zsmalloc because zsmalloc imposes
atomicity restrictions on its users.  One notable example is object
mapping API, which returns with:
a) local CPU lock held
b) zspage rwlock held

First, zsmalloc is converted to use sleepable RW-"lock" (it's atomic_t
in fact) for zspage migration protection.  Second, a new handle mapping
is introduced which doesn't use per-CPU buffers (and hence no local CPU
lock), does fewer memcpy() calls, but requires users to provide a
pointer to temp buffer for object copy-in (when needed).  Third, zram is
converted to the new zsmalloc mapping API and thus zram read() becomes
preemptible.

[1] https://lore.kernel.org/linux-mm/20250127072932.1289973-1-senozhatsky@chromium.org

v1 -> v2:
- Tweak cmpxchg loop (Uros)
- Addressed feedback provided by Yosry

Sergey Senozhatsky (7):
  zsmalloc: factor out pool locking helpers
  zsmalloc: re-shuffle zs_pool members
  zsmalloc: factor out size-class locking helpers
  zsmalloc: make zspage lock preemptible
  zsmalloc: introduce new object mapping API
  zram: switch to new zsmalloc object mapping API
  zram: add might_sleep to zcomp API

 drivers/block/zram/zcomp.c    |   6 +-
 drivers/block/zram/zcomp.h    |   2 +
 drivers/block/zram/zram_drv.c |  28 +--
 include/linux/zsmalloc.h      |   8 +
 mm/zsmalloc.c                 | 379 ++++++++++++++++++++++++++--------
 5 files changed, 313 insertions(+), 110 deletions(-)

--
2.48.1.262.g85cc9f2d1e-goog

