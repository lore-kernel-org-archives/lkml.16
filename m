Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141833993;
	Wed,  2 Apr 2025 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603298; cv=none; b=DQU1TXN8UW6LC5nSXlbFIPuOYnfHbfDSYmn9yRyhuXdNfYGBfXLuFj+45ZjxlceEpHR4hfcR2QQANtmr+Y9Y0kbAHAQzzZHGkgQWqH7kgk+TuC4ygYwKjcLhTZeccW/Zh3+gFr+/Vy+9BG5D75/XYdMRLhnRYC9tQtkKVQsnt9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603298; c=relaxed/simple;
	bh=jinJva6VmkIdixrc44SfhYD9QbRViWUn9sjkKwbuZ24=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MzRWRzigCSfbZupoieJetDjKppgKWanPuFvHkC1WiC/v6IKrf5wct+Z2FJqwh5dp39H5HopqDiHhsFBJsNvCO5RKTz8YOFDizi4i7bkqpkYLyRF80GSFSukHdRCD1mDO/l4/0SnN6jFYwmjyIIj4kz4K3DwxnS+BWn1Aq2hSXhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bi9ubqbt; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bi9ubqbt"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-227914acd20so12569375ad.1;
        Wed, 02 Apr 2025 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743603296; x=1744208096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z9aD1hMOgbWptS9Ck8Mm5LdumYoWsU5uiQAqSmaElE=;
        b=Bi9ubqbtIUXMpJitNho0lbzom9eqYZVGXRftUeveA9CbfdZwUEcMif8XF1xExV2coH
         dYqT6K2hblCwx3+5mMLumrEihQngnzji6DTaoXzrNrciArcNvNNlViFE6zjrzFELIa/V
         LM2MwpnGvobmsJHWluei3z+WxHUFDGRWiaTZT+wHHd/1AFSjnIB23H7xI33jCL7fyR8e
         OuX+rNGkUXQJsjHSAz9lAl7+YlGKHczc1oGsIq2taHTnLJHcWvvATd4npbgBCeqnJAJB
         FTdXQscYdiE56FuEKVnViaOF7apZokv36PQsH8+4NWwDreZcb99AbO7HwkbltaZe/0Yl
         W7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603296; x=1744208096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Z9aD1hMOgbWptS9Ck8Mm5LdumYoWsU5uiQAqSmaElE=;
        b=RsJfe0t0FWVTz/amYausvggTAXSKJyNZX9Zaxmhb86D568fMQcTHVCAht40yz+flHy
         0gBc+MT6YmTgrBl/GBEpu4zRDxNzf8ZaXi13INVOmhzSwVWeM9f8XkOx+uRyhXZNVYw9
         zYZ5qJotIS3SsJmFr7OYk8yLDvqiBKORQUILwJyP613HiV2vCsnwVJuZ3TfWBeONcKLo
         BbSL7lIdPJeTCxAJf/b18ckPFfcNkljXEbmCZyNOF896LJpus6iA4cMiQoqa41YzhwVG
         ZrL+6h4SvXM+YyA66wcxOuY1kZQXXg5ydDCbCQ4AwQ34EVtZo/J+LglbQ6AyyFB8lLn3
         NpxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFeukZ5QBOdkIWzqHXdU7W4wypjCmRrLbIUMOlUwrIxMCYAz2tvMKPCvVp0Fb7egziPPUJXhvJPZHtp14=@vger.kernel.org, AJvYcCWSy5MGLyfMpVPsBUKlvsEBR+ryfyuA7CjFwS5yTJgvHEtG7pMG7I5B+IcF3wIkg7HGS1YNIhp41idgqEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnosu5E6B6CkmmQLcmoYMcuZAsDVmoO5udhl3r3H6u02CtZ3qY
	cMOClG2lGEmeq3asKiX4BqRgTDj57HLCZHJwg83qDUER1V+XqV2nEdAD95gI374=
X-Gm-Gg: ASbGncsm6Vo1ZiS1aN3EimjRG4Hjfqa31Msq6jm6Bq14+nWM8eG4JgQvLtp7VLeRFyW
	a/22TbpoRUb5wZSZZaDkcu8QkFXjucZYcCtCkchmqie7nTLIk3369TIT2KXuHI6sjqMF3nvmNn6
	0wgdE0CewOmKAyyhpIh3oMpQN4ntk/58YT3ueMLpwrZh8CgYMPpYyhNI8Br3WK4ZeeD0wHMl6U7
	9vrqFN6hRiN31QuO+teNJI/a+9nozoqFSKhXKseffprIKUWHoswutmUu62n3m+wi1WHRlDh0o2Y
	xQf12hr4MZ8Jklhw4Bshvhh0bmAo5g37wI/07bcWsqXaoGdcW2EQGf/qbny+wmh8DaUeeyY=
X-Google-Smtp-Source: AGHT+IEVk9ePgij9pw83la/9RPj9XKLPUH+QbMvCEHd9Rgikgo1alzV+jBIHAZFyN1Ec/TTZ34JfQQ==
X-Received: by 2002:a17:903:1c5:b0:225:abd2:5e5a with SMTP id d9443c01a7336-2296dea036amr30067385ad.4.1743603296169;
        Wed, 02 Apr 2025 07:14:56 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971063689sm11344920b3a.99.2025.04.02.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:14:55 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	ethan@ethancedwards.com,
	jbrunet@baylibre.com,
	bsdhenrymartin@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: Intel: avs: Fix null-ptr-deref in avs_component_probe()
Date: Wed,  2 Apr 2025 22:14:11 +0800
Message-Id: <20250402141411.44972-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <95c39d93-f35f-4017-843e-e5d836f1b091@intel.com>
References: <95c39d93-f35f-4017-843e-e5d836f1b091@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
avs_component_probe() does not check for this case, which results in a
NULL pointer dereference.

Fixes: 739c031110da ("ASoC: Intel: avs: Provide support for fallback topology")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Ethan Carter Edwards <ethan@ethancedwards.com>
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: No functional changes, just correct title and redundant commit
message.

 sound/soc/intel/avs/pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index dac463390da1..7072bcf4e56f 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -927,7 +927,8 @@ static int avs_component_probe(struct snd_soc_component *component)
 		else
 			mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
 							     "hda-generic-tplg.bin");
-
+		if (!mach->tplg_filename)
+			return -ENOMEM;
 		filename = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix,
 				     mach->tplg_filename);
 		if (!filename)
-- 
2.34.1

