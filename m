Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DC52045BC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225571; cv=none; b=UIjFFkSNiQSlZ9YVJU5FkdlKq1K2NawOqf+8Q1sAi6262Phh+IbB5+4EOwuJ1q8J9pWnq4znomUuqrnTwjHymuiqYkgAEr7/kZ8cei7+ID9tAI9GqxCdTJsleZPhIS71LwI15fMTaoEdcYpp7AAOHWlxUEi9FBHEq2c0SAA5Pp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225571; c=relaxed/simple;
	bh=DIHI0tIPH9BXUto5ZY1D7qq6INW9gd1oLws920quGL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5HyJvMzrf1aY5HFzIhkW2EPSG2xJfgM2UakLhmch5cDcQ3W3P8N6fT3XoNJthN811jtPcIo5kpSYWJceVRW2Apin7/P6lwsl/a4Hv5QiLAkMlb+KDeII0KKpKWkYy9Mfnby/n1gA+sw+YH3OgMWl0TJszIK7inwcjbKmGeW1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hjYXrpIg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hjYXrpIg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2279915e06eso39057395ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745225569; x=1745830369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFbc26F8s5iAkGemix678TNWKgIFLRVWnVLyAhNpXlE=;
        b=hjYXrpIg5qs2HGBIHPu+wH7vgsVmJAi+UTdmKQRY+05DZgqs9I4dMoP3n2mRNUn0FK
         aZ84Faenowdor/wbpXgxDp2GqoPJDHDL/2l9tm0RTbhY8M2WE+Dt5/fT9qHqyEP/BCwY
         PE8xHoCPqHO6bNJoFPsC6fqldSQP7GI8SdBZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745225569; x=1745830369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFbc26F8s5iAkGemix678TNWKgIFLRVWnVLyAhNpXlE=;
        b=MWxMjzP1nUcxp5GkvSScqVnkHx4zGLgwuFbBryvegeK2A5T4+soNO5k11e0hRiSp22
         R3BjcODfrrLGCoJnfhNUOJ77M/B2/fOjbzwywGcIAKFEl8X1aWWtEa2Q7zCwmr9GeaKB
         pRNfyvqymEyNH8vpDTlC+dBdh+ArFS2H6ZJMWiaSQ6ZblwQQvQgYMfFCZFOU3eEJ0ZR3
         XoWjnnnaLrxj3TViSHYYgdMT7EXUqqYIG2E9LWL8L2N5T4w2BT/O9AZ1UvLlKiQcU/kF
         Nvo5adFiLHhw6le+8tLp5SLj1M/54KZczKOkDuF8doZONLj/BI/ZyuYdYp5CimM9S5LZ
         c8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuTjfx+d8hzJBSfmC7vsp36RjycgG5WvAatQruC7UKtEAJoNoDxZgCUdU0MJgiMmA7OCg276118CqlAtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa+oNCJwwyGY3Mp/Cg8pcND/IbChxsdZwNVJ277OM14C/rykH1
	nErFjnB5Hh2n1Lkm3VojmA2tDjkYJQabPrHPBm1fu0N+CFA/SOmEKiBErUXoMw==
X-Gm-Gg: ASbGncv54s0HYa/5Lm7+OuwxwpuImwRRmhFQbyNwM3DybOAa3vl5BJcNaF4HTNSWw2h
	CUaAMZ2gX0oaNvIYdYIgxIv0TNsicCojd5mZ/0HJReC+4qjhBSIn1w/bn8FfiqoMAFc1TkwfCL3
	1yUC7sUR3UDkpUAGx0Mjq5eaiZblRlsXWmEmJ2UsgVTIOUqO0xOm1EInah4lbkTil6AsaPxcZ4d
	UX46rQt9BcVInkh/EVbqrcUVY/MS3QxCuY9h5ccHatWMEgYNqXkuT20eDOMoTrTLyLBuBSI5EB+
	ogTCXDM7B9T/0cCdZ8EVZztiFC2widaE2vAq9310kpxxGdjcSCEM6BNBqXnFwO9yGm/4HQ==
X-Google-Smtp-Source: AGHT+IGy+yWhvnto5NJnKovlWlBqjGSLK0cR8LmnpG6uo68hWK2dR/x5E5cKtj1I7It6Il6i+U9rzQ==
X-Received: by 2002:a17:903:3011:b0:227:e7c7:d451 with SMTP id d9443c01a7336-22c535bfe27mr138367845ad.29.1745225568851;
        Mon, 21 Apr 2025 01:52:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaca6sm60671705ad.9.2025.04.21.01.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:52:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Make snd_pcm_lib_malloc_pages() debug message say "allocate"
Date: Mon, 21 Apr 2025 16:52:42 +0800
Message-ID: <20250421085244.377228-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_pcm_lib_malloc_pages() is commonly used for allocating buffers during
the hw_params callback, whereas preallocating buffers goes through
preallocate_pcm_pages().

Having the same terminology in the failure debug messages in both
misleads developers.

Change the debug message in snd_pcm_lib_malloc_pages() to use the
term "allocate" to match its intended use.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I found this small discrepancy in the ALSA PCM memory management debug
messages that made it a bit confusing for me to trace code.

 sound/core/pcm_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index ea3941f8666b..56725d36825b 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -458,7 +458,7 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 				   substream->stream,
 				   size, dmab) < 0) {
 			kfree(dmab);
-			pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
+			pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot allocate for size %zu\n",
 				 substream->pcm->card->number, substream->pcm->device,
 				 substream->stream ? 'c' : 'p', substream->number,
 				 substream->pcm->name, size);
-- 
2.49.0.805.g082f7c87e0-goog

