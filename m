Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412631FAA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747371957; cv=none; b=sfGrMz8Ca9eJrAgEtsqqHGOet7+FIVhGMM+QympEobU5hVqD24KNRXQREKuPsfCrv8NzfKoOC/gT5+pxTtP4DVNSSwp3rpNaUCb3/YLKEUT+plHxw4VB4h8tOlhc/SYENxNNCANTHM4/waJWIELRyNc7VXh1SDV5jYvfiy+dgBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747371957; c=relaxed/simple;
	bh=pNM4L2X+L/0C3QZ8j2kxPo6S+C9SsxrBucubd4sDLhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ItObrekFCtMfAipEHT/7dJ2bdr7O9qvG4NTGRDxlfF28VbaK4rHK3ONW8y2B6Nl4viZ25naFPdPEUgAd0UZR5xrdsVR7adNkieC/jU7c13K2u48YihObEvCAItujMKFOwT0TE609YmCRvNszGzeqrZX5uo9mhxc6xmsaWYj5zHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AesWd0/X; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AesWd0/X"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1101324a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747371955; x=1747976755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FZYfWobUsai4Anc24HWgooUiX7BPMHJRwh278DHkFhg=;
        b=AesWd0/XCkddMsN0RPgeMbP0qqoZVe4N1wgXPHlUyA2XF35rqxp1LOOSFpgl+SCQAv
         ID5XeK3ZO8I5W28EYRBOXc9Udl3Q3GZvzO9Xa+76bfEEkK1q+ZuWfNNZtzm+vtLO+aoQ
         yDvjjq9tK+zRajZuJb/lYyQ7aq8YioMEG58+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747371955; x=1747976755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZYfWobUsai4Anc24HWgooUiX7BPMHJRwh278DHkFhg=;
        b=XP0dEItLpCFu3pjG/7Qvz5Se6w0zoN4aY2NS2v+CKs/2ssqwbAVKKSL1/1KF7gOA1F
         /vohKR9Q8lWfF3k1y8yp5S5Ls0Xazg07ACi9xKR5Sid1+JotFrpBPYd3JhM7o8YL3FgV
         5hZr11Y9CzJUNAm1dMHLJnw+56kE+zCmHyCrZpYhDhs2oKjFKbQLGCjBp6whBZGxeOrL
         DSGOqUld+jJ1o/i5VD95D0SOtesWNCu+N8Vkb1gQNBkCCv1w4PdqMH9PgsafhHJ3w/nO
         YAjMQMMMFdiOxWjy4ABwTkXy0/QavMBJspIFokdmO9mUehcgqDEzBFcnuGo+pbFQ7Zb8
         NC0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY1ryA/9TT+vnn/FOHAxU4eb0NRCALUvottfmaTCa+lqG64xV4wcXzhs1cgMgyxoEhVtVxaqtiEb+fKBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8d4UCuh4jRpLjHedsC/Q6G4mp5zdjvHj4PBFER55aQsaI5lo3
	NWjf/dgyy5Z1ThX2ZfnX71DY62ZR/NpvUFUCPQ+LmLeJuvI3sszUZL6UnfiZIhsMhA==
X-Gm-Gg: ASbGnctc+JarAxU5vZR2Czgb/h3CrXd6+eSTiTFS2zsRdFuBZQn6EOzmuCswa2+0SMC
	1DwgGsOC0jRTjbgov82izWae5XzBpu6A9B6ZEi8B6DwZBVLNdEJE43Lbnp7fj7IoSdeEv/M9wOp
	oYRK+NdGakGjB8dJNmxRGeK9ZfaXDlXOYUpEnDerDUueQr3Hk6JNk3zdn42PGFENjLfjvxRe0hd
	GjfCepbcQ0RuTxH/bB4xKUZ+ANpgl8uD6P/wmccPgr+oHAbxY58Xu63DbTTnwnoxoPMSnTNLftG
	fykaX+3pM2AvjiAVxITqi40rVgG4KzUpSbPtnWEFxPwjxyf9vJ0Z9ahmrMBgctXOtgzYxA==
X-Google-Smtp-Source: AGHT+IH0/GDb4r+wiufJP7iwzsEy+MWQRcekYSbQLeI/kLmTr/rbqnbWo/loA5DWMHtf5lSSzKhPKA==
X-Received: by 2002:a17:903:22ce:b0:231:b456:b97 with SMTP id d9443c01a7336-231d459a539mr26785735ad.36.1747371955405;
        Thu, 15 May 2025 22:05:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c43a:aaea:5f52:5763])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97de4sm6312355ad.144.2025.05.15.22.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 22:05:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-utils: Check string pointer validity in snd_soc_dlc_is_dummy()
Date: Fri, 16 May 2025 13:05:48 +0800
Message-ID: <20250516050549.407133-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the recently added snd_soc_dlc_is_dummy(), the helper uses the .name
and .dai_name fields without checking their validity.

For .name, this field is NULL if the component is matched by .of_node
instead. In fact, only one of these fields may be set. This caused a
NULL pointer dereference on MediaTek MT8195 and MT8188 platforms with
the subsequent conversion to snd_soc_dlc_is_dummy() in their machine
drivers. The codecs are all matches through the device tree, so their
.name fields are empty.

For .dai_name, there are cases where this field is empty, such as for
the following component definitions:

	#define COMP_EMPTY()                    { }
	#define COMP_PLATFORM(_name)            { .name = _name }
	#define COMP_AUX(_name)                 { .name = _name }
	#define COMP_CODEC_CONF(_name)          { .name = _name }

Or the single link CPU DAI case in the simple audio card family, as
covered by simple_util_canonicalize_cpu(), in which the .dai_name
field is explicitly cleared.

To fix this, check the validity of the fields before using them in
string comparison.

Fixes: 3e021f3b8115 ("ASoC: soc-utils: add snd_soc_dlc_is_dummy()")
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/soc-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index a1bcc852a6de..c8adfff826bd 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -267,8 +267,8 @@ int snd_soc_dlc_is_dummy(struct snd_soc_dai_link_component *dlc)
 	if (dlc == &snd_soc_dummy_dlc)
 		return true;
 
-	if (strcmp(dlc->name,	  snd_soc_dummy_dlc.name)	== 0 ||
-	    strcmp(dlc->dai_name, snd_soc_dummy_dlc.dai_name)	== 0)
+	if ((dlc->name     && strcmp(dlc->name,     snd_soc_dummy_dlc.name)     == 0) ||
+	    (dlc->dai_name && strcmp(dlc->dai_name, snd_soc_dummy_dlc.dai_name) == 0))
 		return true;
 
 	return false;
-- 
2.49.0.1101.gccaa498523-goog

