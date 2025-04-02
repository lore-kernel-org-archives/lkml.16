Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967A521C193
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599346; cv=none; b=ZnWYweeaRU1lZOfrqaqTJL8phpV2xcDWHflM++3GNFc30ksBcQ6+igWvEoVxk+2AQWHY2u0SU1NL/JB6WVnJ/n3DSgYgsy5fU5C6TAcF1TBFVE2P6jJbGyhskOqeCHh3/6tKShQXnYa/F73vQTUhfzOpfyt+9H3GNDNBvviPyRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599346; c=relaxed/simple;
	bh=9MP3T/ZO60PZOlnjbmqIxPJWCT2w9HJNeG3iVkpSaiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bhXg2jcuLIlF7ybxonlc+Ac73unAxcAhHqTa+qZ/jHEfZ1wrCKpqSO3Z3U/fEHXbu3RayUVLkBpsbjIGwrH9u4F+ywJqKcNVAfbLVQby9g2YooQzcTIGotBwXHbGGnXVVuiWWmgZmIHUOjA3yMC+GePOlrDDhixG6AgE2hoYAGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ytsUxYcM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ytsUxYcM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so49202945e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743599343; x=1744204143; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UEtL/9X5WUxOZobblyxpCLeFiHwHXNogLMCYC6gE4I=;
        b=ytsUxYcM14zio8HbTiKs2ZI5JdFFEq20fVeEiV65PhQqx9oqFQQlO5MMXyntAASDvi
         TEPoeyOayXw86uaHjzEPO7dYvZ7o7fmBFS9Mr77P4vnf4LYMdTqXv/cpkCXHQOdt33bT
         Av1mLHPoC4/61FId30jb4gaPoxa/LDRq3jlCwUC8gskC9Iy4wl8VmKoJrRS3mjjvqsoM
         /LYaC54T+CRroxJ/YZ86aSv9lHRQyQd7xpMlH3SnpuTodyk8Pgv0/BDN/fMP5/bw3NNV
         rLMEac/2NOKRvO0S+njh9rkXzkWyue7YWDH3p+NzGUosD4HNvVKwRG81xeVDc+P/VbTN
         ueBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743599343; x=1744204143;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UEtL/9X5WUxOZobblyxpCLeFiHwHXNogLMCYC6gE4I=;
        b=PH8Ci42ohVX47ubBGr8GgohTtQJD+xkKxy8QRrg9vjdvlX5XDSlEqkb7ApHMGwbZRb
         UiPU5+GL6lLCmqzY9GGqJ99LjjjUsSSs625y0gj217hE43+5GN/U/VIUWUZKEjviB3N3
         Op6btsHQVY0YuZs7kicY9XGxKXFZUQ/Sx30oTohKN9Ex2kdS3736UoSgDmaCbmnt+gZ7
         8KzmjC1LcmQ4gfJ2ypV1Jb8MYpo5RdR00idTZHbAIU/SvRCTchSP9QU49g+PWoovQNKd
         RPsD3FutAiwlv4H5l5v9ipxOg1IlUZ3+/PbOmRSyRJBsHqu3uhTvJvpJCjtJhwqk5WjT
         TUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCULu8GKQwKYo058RF70P07eIMeueMCvWD1NzlSe5k1JKF8H9lPvZ9VKjHFPAJmmFGEiWjJ+4UHtvHyyw74=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDKX5qJVFqD4XZtLRla3WM1EfVXSER7OAWHwRgEcOBldWjggtJ
	QCa9Zv9m6enE3FXGQNysIPx4BMaXFq2qtM4fpMDUezDUmoitFm5htXZgG1CQQdE=
X-Gm-Gg: ASbGncvH62LZC9harMLXn++ldXqBmFk6sNPhyHrzTpiu8QvQaZ6BoabsoyF5ZfdbDYk
	Sp1hARoXvFmaxgqmhFIU7IF+ACBRNCTn9EZ0EjQOoWYfCaLMppKBcjtKXf4cqJ+4S1YxHzPJetv
	IUkZZtrOaypIBbNwQqPVcXPiQd1SIWL3fD2CQUgeVDw47MinihptfPStHqpdEsej1lQKVjC6hhF
	MYRo1HzGvUhEm3NvrKZfNsrAVHzz7giS95/pcily4goqThopObwO2V/2TdQudQ/kWpGfMKkDrSe
	OEKSqoR0N3or8JT08xn0IIPphgo7vwZB7ypTtZMWenSh6d0A
X-Google-Smtp-Source: AGHT+IHiEvQ0MheT+mvxQ1vOO/oYCbfeKX2KE7QMawCDoqtMESLqbeGooQ94FI0LJV+49shSO9078Q==
X-Received: by 2002:a05:600c:138d:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43db61ff68bmr169118785e9.14.1743599342849;
        Wed, 02 Apr 2025 06:09:02 -0700 (PDT)
Received: from [169.254.8.88] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc67a8sm20741125e9.5.2025.04.02.06.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:09:02 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 02 Apr 2025 14:07:59 +0100
Subject: [PATCH] coresight: Break to error handler if connection can't be
 made
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-james-cs-ret-break-fix-v1-1-83907d9f6b38@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK427WcC/x2M0QqDMAwAf0XyvEBbrch+Zewh2lTjWDeSIQPx3
 y0+3sHdDsYqbHBvdlDexORTKvhbA9NCZWaUVBmCC9F1LuBKbzacDJV/OCrTC7P8kVI7eNdSjrm
 HGn+Vq77Gj+dxnHm8CEdoAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Suzuki.Poulose@arm.com, dan.carpenter@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0

Change the return to a break so that the of_node_put()s in the error
handler are hit on failure.

Fixes: 3d4ff657e454 ("coresight: Dynamically add connections")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-arm-kernel/3b026b3f-2cb2-49ef-aa20-8b14220f5324@stanley.mountain/
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 8192ba3279f0..39851a13ff89 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -267,7 +267,8 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		new_conn = coresight_add_out_conn(dev, pdata, &conn);
 		if (IS_ERR_VALUE(new_conn)) {
 			fwnode_handle_put(conn.dest_fwnode);
-			return PTR_ERR(new_conn);
+			ret = PTR_ERR(new_conn);
+			break;
 		}
 		/* Connection record updated */
 	} while (0);

---
base-commit: 5442d22da7dbff3ba8c6720fc6f23ea4934d402d
change-id: 20250402-james-cs-ret-break-fix-ad38103af5f6

Best regards,
-- 
James Clark <james.clark@linaro.org>

