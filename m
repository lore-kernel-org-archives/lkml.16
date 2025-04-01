Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F36C2C6;
	Tue,  1 Apr 2025 14:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517955; cv=none; b=GNSMXRCnpo6qsphAA+oW+TT/5KnrUrHtIFDkoFBXwDc/StY+6mZGHDrdw7kJ9UQ2zEHgPrkvgwYjQ5enHnhx47xKTNgVMXHn5hHn3G+3BbBeRJfIYo7LdeOwFarUy/WcjK+hZhzixiGiCpdwd5WXshdlR51uXG5nyp7TV1uyKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517955; c=relaxed/simple;
	bh=hbq+gfrSP68NJ1N5XX18is7enUJgqkm8sza4WWJKW8c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N3MAdEt6IJDrVmlMxFDe+BmmzZbfOvd2TxE9A/PO3g4ZnyTR9radfb0HvbZpMlxQBY7PRoA6DKyWzbxKEPmZwctVqHSbNPrVOgJ2Faz1UTUO64HO5Ivt6jlwbYgvpNMA3NURq9OwLTkcovT9lqzSh3OzQVhrpRayvQe7VBqLywU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQxxJr9u; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQxxJr9u"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-224171d6826so84001715ad.3;
        Tue, 01 Apr 2025 07:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517953; x=1744122753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lQz6HN4WVo2BZhg1nM2qkj9xljoy6K5gdXERS2m6T2M=;
        b=iQxxJr9uoD6VdgpDzIdlGQrdJw/PO9Fb50k8MvKT622kv001IgLIMn9Q8eIL/0yBCD
         9aipCAR1CiAjmntfjeqR+90ZLR64W+TrKvIMzA80w6fO/apFg3ZxL3jxBTv8bOCBTkY8
         CLYxHMnmrm4Os1Vn2W8PHQ3q8QB1uu64r0LsvuxLlTuLlZ0y21hELgC4+5Yc0pVX6hZ6
         GS7N6CU7MRJJD9rx6FoRuTg3FIN8kCKHf1zTUpT2HAy9rEigiKG7bEcGjr90VzxiIbNw
         biNjNqrgBwsxjViL3WyjZaXduPponGR9W2MX8fV5kAhndh07X8HHWCO+E64GNuit32Fv
         Tijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517953; x=1744122753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQz6HN4WVo2BZhg1nM2qkj9xljoy6K5gdXERS2m6T2M=;
        b=c787KWVV4WYVMLKTy/LfIQVcBK1zzPNfs4XCSjZsEbKdz7SSOzORH1mtL5wpi86Bd7
         NVPN941XGAlzZwofq9CyqBkMM1KqPZofD2vB232Sh0jjg599P0r3h3Z2o+3xLSRttJ1f
         t5Nu74OuzWelwB7Trzzvz9KrdERY073XVg1zzR9aPP42aarPsyLbNLUkSJXx8MXdQxjt
         csJHVXJ3yklLhpY0IioqMg2UZ1fVtC+8XM4IhANtNKVcrnK1nuOORndTya2pfdP0b7xx
         6pQQ2ouc0agoHhGcJV0vIaYWjTSzS/SSsQxB/jWth48DC67mK0uSrNuluVIOlcAAjJQw
         BggQ==
X-Forwarded-Encrypted: i=1; AJvYcCU74a49YPHB0Ok23J66dmV+jhvnAE/2P/FU94+ASCjBlglvH8GojCUPEYBQ5ZLEE3LtZvPlftlPOHFnS2k=@vger.kernel.org, AJvYcCVY3jPJI9YRU0XtmrPcCACvVacyTP33x53+Jv5NS6mCU6mYViFhq/d2oioefi3Wats0wvpIrGajgeYkuIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Q9kzGE4H8mZ2lmJh3p3uiJ81pTqr1H05SL6HYSLXghDVLIld
	eAyILD7Yd23+GKIMJ5sCeitFFL+G5nuSY9Bor4MbHG8lkBr5QhMquzpd0ii43X3iow==
X-Gm-Gg: ASbGnctyGDBI86XTkcMOgH70cWH/CwrjfFRJXlg9pjEGotuMMJiELiXJ2XFuK847T7o
	7hlyM7YZ8JttEwrRDrni9Iq7KMX+SnxEZA+Z0OZEvC3VdWmEiq0AT9luScWoEqOcpYPNhO7iKIY
	bXyLqiTJuQOQB0+hLMkvWZSmVmL5cJuWtMSEBCHTIxtzXxRfbwMgUG3/61T0rHL8VCyQjSqv2oc
	wA/isIM+Sb6IivEeLY641iF48VaefpeSxZXfn6VmMy0wVnpZqi4QOACJQxTEn0gtT3Cxo4iVvCn
	M1hu0npuPbzXoJLezF4P0Zcc3td5e/orOzGYJXqEmocIADk4/Y/mo6+VvgPCMgy1+vMwt3c=
X-Google-Smtp-Source: AGHT+IHQlATV4czNANr3zOAV9cgx/Gc3dz18Sz7QLKNg40G8czZ9t2zuvL/IEt7vhKlS0crxjdo15w==
X-Received: by 2002:a17:902:f550:b0:220:bd61:a337 with SMTP id d9443c01a7336-2292f972edemr215748525ad.23.1743517952898;
        Tue, 01 Apr 2025 07:32:32 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedf925sm88877755ad.69.2025.04.01.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:32:32 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: amadeuszx.slawinski@linux.intel.com,
	ethan@ethancedwards.com,
	jbrunet@baylibre.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] ASoC: Intel: avs: Add NULL check in avs_component_probe()
Date: Tue,  1 Apr 2025 22:32:22 +0800
Message-Id: <20250401143222.30344-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 739c031110da ("ASoC: Intel: avs: Provide support for fallback topology")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
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

