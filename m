Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399A086342;
	Mon,  5 May 2025 18:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746471271; cv=none; b=pdWA+IonEi/+bAqschq7oA2bsONAjPVJf/W9JryGGHmfM97jR33L+2M3HaUCP3KDj0jJVzsXr67kUtpnypap6p9EnmyGtJe4hIgliKX1/UWLc9PbduNZC3xlnOwF6c5stbq0W4Iu9eJBjE5rWyl2BW3V8Ly5QtpfhikKBZBqPQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746471271; c=relaxed/simple;
	bh=tfR+uUFsE2wf4T8oW/xtFftbY1RpMV6kMg3mIMSd7PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOgd24FBuv/6IaSL8GUf78OwEeBnBYvvV+6gWsc3bYiaKGjpEhGzTX5wJnpy04oAA4HFXBn3RGlL2sOcWejhRWK6RENnOc9C8+fl7cqYmkQZNOxlqiDUG4UMoq0oqb3lt+PutNWYsmEa0zd6io41h5DBFDiIOtR6cm13ZSV2pn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBANbG1D; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBANbG1D"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227b828de00so55073535ad.1;
        Mon, 05 May 2025 11:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746471269; x=1747076069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1k75FG/mf+jEboXe/jv1nQ3M+yVrWKwv3guJMm/HdhU=;
        b=hBANbG1DP1pbqAxvaB5RSgkgw/m7edmPP+1IVgGInjajW0m2+zybwNSzV/+s6QMQVc
         4QiBnxB9yCoRiXWrb2D2oF6HlbM9orZi5VeWDzIpjqRjQR4+TGR6gahGdvyvIsNa7Vkh
         yl1lupSJhfx9ny4cVqGDYZg2zVnkzSQXATyOQvcDJayTnz2AW1oPkuA61+0R0XhyEQ24
         0VNoRxGzsdaQCcZ4BLXc3PizpKYga0re1Rl8m93lrjK/G3Swc1CqxOUA0lbZmVs8KagC
         U0keW7Jm/0+yv5EFlIhfcQXveGGSS9AghS8pV+21eSdm5JMCIOw/f96hf1LPTTy8NgRP
         frmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471269; x=1747076069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1k75FG/mf+jEboXe/jv1nQ3M+yVrWKwv3guJMm/HdhU=;
        b=Q9vPMvujMW8/mvYfmj0xq6weHEarusrYTfRHjxab8m/aOxVsjGaSUeXs1ox1ltvIb/
         gFWIeaW6q6sAT4hq7ESECR0jk9sub/iJRuWSSrHoOTk8blvgwWm6neHCNOPUkCb1oi2D
         ZTgWAKDyLH+n/YfcFAhzYkwpV7OBn9aXPhmrsiTlndRb1BJVWo8QdJiSJWrb/4Uczrni
         07SDDGUdb+OpoAfHWO5Q12c5/qJZ4wjPUPb+FKHC+TnJtFxClsv6J1WgsydtwZZSZ+6r
         ZjKzzGKsS21vqYEURgNgIl/TBMSuoNWe2QzU2bmCnduBBPqPSvfuZbW6IRR1Fxs00/7N
         SAZg==
X-Forwarded-Encrypted: i=1; AJvYcCV9o90ci7sAtZw1T2ofM3gVaV6l5c9DYA6cMxyk/wrJZhSSyHoDfMwG/8mFwPCLO1f0WpaDGzGPU48dcEY=@vger.kernel.org, AJvYcCW79QUCb+zJBOufGex2ZctgHb4KYAO7FR7pS/autFi9U3FCzijOgFCVGg2ku5unbpdziidcuNznLaVZtj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvlrUfV8wxflwRiDkVY+L3TEoKUkaKm0QeuYq+UtQ2u/9XxwLm
	sPqVH2x2RHAHXP3V/NO10cyaM9e4HdfoZ1fGy6a9ylS4ftVGJKSHBoRzjG4K
X-Gm-Gg: ASbGncs2y5O+sjaBeqXUGG/O8XYW4bLzKOaBEwidonCk8wZkUlqa6LSgFUcbQID4pZd
	2rvSv3ovTTg2pSGiKOENPqPP0jIpAuKmTJqDwVza/bTGWYCdYtSdolK5LqshxQ6VRSzbGt+pMjO
	KkU4tvR6MY11tYqubRZerShlYoyORRbjn9LKo03Jf9gLSJA439dC2wFmnV/KLUc3g7z7gAp/tvM
	o9nJZvfwh/7bC8dYyqHRaVUiQQl/MnMkHdHolnW3i0yWuvqbjJpjHU0AJk+d16Wud/Of7ISJyGW
	5r/kTePKDRpC8wfv+PWz31ulHlkXKeWZwtr6C0nIKCAFeN5kzHkZS1tEM849c25j0GChLJF+eO9
	h85uE
X-Google-Smtp-Source: AGHT+IFOVAHMGeb0gXrV15cSARZ2S4e6TPbXyz66V6fkEvqiD2AYMafpQCFoWEAWqDvHGX40agETPQ==
X-Received: by 2002:a17:902:c412:b0:220:cd9f:a180 with SMTP id d9443c01a7336-22e365b89d7mr1752405ad.53.1746471269348;
        Mon, 05 May 2025 11:54:29 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:afa:5db4:54e4:f59c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dee10bsm7181094b3a.76.2025.05.05.11.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 11:54:28 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	Vijendar.Mukunda@amd.com,
	peter.ujfalusi@linux.intel.com,
	christophe.jaillet@wanadoo.fr,
	peterz@infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v2] ASoC: intel/sdw_utils: Assign initial value in asoc_sdw_rt_amp_spk_rtd_init()
Date: Tue,  6 May 2025 02:54:23 +0800
Message-ID: <20250505185423.680608-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize "ret" with "-EINVAL" to handle cases where "strstr()" for
"codec_dai->component->name_prefix" doesn't find "-1" nor "-2". In that
case "name_prefix" is invalid because for current implementation it's
expected to have either "-1" or "-2" in it. (Maybe "-3", "-4" and so on
in the future.)

Link: https://scan5.scan.coverity.com/#/project-view/36179/10063?selectedIssue=1627120
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Changelog:

v1 -> v2:
	- Refine commit message for address the problem clearly

Best regards,
I Hsin Cheng
---
 sound/soc/sdw_utils/soc_sdw_rt_amp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
index 0538c252ba69..83c2368170cb 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
@@ -190,7 +190,7 @@ int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 	const struct snd_soc_dapm_route *rt_amp_map;
 	char codec_name[CODEC_NAME_SIZE];
 	struct snd_soc_dai *codec_dai;
-	int ret;
+	int ret = -EINVAL;
 	int i;
 
 	rt_amp_map = get_codec_name_and_route(dai, codec_name);
-- 
2.43.0

