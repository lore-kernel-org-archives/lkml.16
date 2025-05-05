Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732861C84B3;
	Mon,  5 May 2025 07:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430910; cv=none; b=clkPcK7IGPbnZrVd2WzSfE02lBQ09VutdprKEA/CaMrjDfvIVc3P6iA9yH+ewJnwl7HIgh3GvZyEywWzaZGUTIsnG9+pvVW1+RiFL7UW7i8/mdSfklbPcN1vJ5qVAdjg03fvSC1VoMDe9Y/oodKDRvbksMsLLb5T2tUxNZtQpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430910; c=relaxed/simple;
	bh=JC/jgU3UR5/9534jhBIn+HQTy0KPk/toGTRlvD+/9tE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XCqaCc70eWQV0/FkGqx1wsypbfIMGl9k/vz/D3DBDhw62YY8DKbUltDV5znTCmGgAEGELIhgghAxEk2To8Epv82WPWYvn1vUywfMTjpFLQHW8Lqei+GeFuxbixo5wHzRcpMNgiV5jbbp4WmX3qwPnV6HRKCV6fP5h5PHjlLcaxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8ctucPY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8ctucPY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2260c91576aso35398105ad.3;
        Mon, 05 May 2025 00:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746430909; x=1747035709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oC+vJ+HSAMSlR0731A5m2XXqOUV43UDZ3yJDtyU2qCE=;
        b=T8ctucPYDJS+DOGDrIsOOr9TSz+a1OxhttrxfVcyuudWz93DiSLgpACHK5fJXJ21Vu
         CvGFuFhs3P7/LwQi1b+7PgmEzwyrs5zvp2XPgYec+DkDiC+M60qClYzkRICzy+nB9ofi
         yj+r0eGG3mq+51jISQDHPWkrkVHICsroyi3BGYmyw3EQaCfycR1ErjRSXgxcYrocaCzc
         wnz0Klq1ohButOkRgpJMea7r4W/4+ouwW4hKGXsDfcFDqvjjE1k2ZFQn22YonqV4HQ/q
         uZGF9I89ANVdQpgGtSGyTVan8BDKSmdiYF+XSzE2BEXVfPpgeYMOyiWI+1NMjmEPNbtO
         LqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746430909; x=1747035709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC+vJ+HSAMSlR0731A5m2XXqOUV43UDZ3yJDtyU2qCE=;
        b=BDdMjvTdAm7WK46F+FydTneZw3k6znqmv64WXi8VbdiGJXzlphTgopy0p/MrRaXH/e
         EUDnT6jnZFeeaao/ym2kDOV8S+LpkL+aSNReGD1JQ06v6iZhgj9u3qc9SKjnHvFx22u5
         89LXsHUCCbS0JAQbDBsNWBpfQtqfJIPI4atvwOWdGcIJGogxL4BlSWt3YG9AL/AmyMAb
         rLeYXZbwmlPUYVz9XoUpFTgq9Iji7m8OiYn4bbspcePUcPJiZIOjx/M7IUB6hWTT7vdo
         korETSH/OTkQS4foL+bo+ZMORfNXQxZDQspbgEsW57beqOb5cFs2EG7+FJ+FDCg32S21
         cvPA==
X-Forwarded-Encrypted: i=1; AJvYcCUGX05OzW5DGe8AzT1V8AARdJ1hYRg3Dd8ocZv7wNizHXd0NQJxKmlZTC772r0xL8tTEl8xtSv084aZHD8=@vger.kernel.org, AJvYcCUiq55X4J/+oKY2hVqLI3zmF0H2dkXCH9C3XR3bFn6a7e/OXKCkuPgaJjD9FIE01qLEa83mnARF0z8fLOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YynRoL23ooZdr9JcIlWtV8svTf9VpINVCd2ZtmWPo4sRCSvVE/I
	tTNa3g08TPAhhz+VPvI7Gi4G973DD3imka68YVDsDToKU+rFC+dT
X-Gm-Gg: ASbGncsakJp2E8SFhBR2dUd/gLj2pO3cKRuFUu8CH5QjBle5lLw2aV0mY3HwQYt63zi
	3DVraKl0ws7IWEnB/uWcWbJPC6QLdmFjY5tgw6YRkhIu7n1tbR/lXulcXawwV9oBFg2XOcbdUzt
	nVTPYW9PUvhGv9jUj/5PIjFB7SnWVJePnwQ0eGGANqJW4LGJeuC/Jb7nENFgolb8nUtjXRFUQxj
	SLYPZiq51+P5M6BVUcjADU9vypP0HpF3gYwOi9e5LhoZGz7+DtPElHjtndXXGU53Faf6kiujJHo
	GcMwFCnWa8a9PCZlb3mC1jne8Fefi/FvyCSlMzw2qANWGWWKosZLBWbnxad+Rm58zLbi/8vpbrd
	+lgmORg==
X-Google-Smtp-Source: AGHT+IHSmGeVChQLM11qyGqhTzHbQsAmzuk7FMyhEFMHFQ76pdZoPfZwg0VbusiuWCKtBO5VmEngLQ==
X-Received: by 2002:a17:902:db02:b0:223:60ce:2451 with SMTP id d9443c01a7336-22e1ea5aa04mr90724095ad.15.1746430908504;
        Mon, 05 May 2025 00:41:48 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:9aa5:83db:32d2:9858])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e22c73e92sm24061725ad.15.2025.05.05.00.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:41:47 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	Vijendar.Mukunda@amd.com,
	peter.ujfalusi@linux.intel.com,
	peterz@infradead.org,
	christophe.jaillet@wanadoo.fr,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] ASoC: intel/sdw_utils: Assign initial value in asoc_sdw_rt_amp_spk_rtd_init()
Date: Mon,  5 May 2025 15:41:42 +0800
Message-ID: <20250505074142.615408-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If strstr() for codec_dai->component->name_prefix doesn't find "-1" nor
"-2", the value of ret will remain uninitialized. Initialized it with
"-EINVAL" representing the component name prefix inside "rtd" is
invalid.

If "->name_prefix" is guaranteed to have either "-1" or "-2", we can
remove the second strstr() because we know if "-1" is not in
"->name_prefix", then "-2" is in there. It'll be a waste to do one more
strstr() in that case.

Link: https://scan5.scan.coverity.com/#/project-view/36179/10063?selectedIssue=1627120
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
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

