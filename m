Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615D22F740;
	Mon, 23 Jun 2025 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668093; cv=none; b=Q18H76dPPpIhxztbe01xKYi3NGzo8JiQIVqdkipldHggfbtlJPPusTFQilHOYN4oGmViIqowDNjbjLIng26GlRAdpNVOp8zjILVilD3LAVWHphtlxCxP2/CSziZa/5qyPW6x7eSsqbJynpzUsfFeaYtEsyXICm4AJHvau/RRdzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668093; c=relaxed/simple;
	bh=AurJu1LvUTnH1dazNNCf8+VuS1q+nbV1xk4e2/VsAUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jqPJoM6DMud9e0AqCTGABqZRt8WTIdSQgld1H/NmV4MB+6u58x/JCZGYJwmulpN/Wb6PCJ2jkKAODEzut6XKYWbda7DS0lSIRmDIQHWzqN505I9c2NBAD46GmVhRJ7Am+FM/Q/I59oz8r4v7R/QDmWQ9ODBdzLzok7iAdm6SZi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGzIrfET; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGzIrfET"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2136218f8f.0;
        Mon, 23 Jun 2025 01:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750668090; x=1751272890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hFKfoFX+b0fWpj1OGuQAhMWHq/Trp5Rsum6TUT3TNh8=;
        b=GGzIrfETEotmfM4+MnXQpLSvkgveLCOR3+ECidmBv3wNIbzqO+4QvtOPBXO8+LDJBb
         0B7mZSeAMZbtffTOX9Ee8AlRf9jrwgCfkCwZnPUjrvOfJa1IxLe8ecNoG0MTWYe8tl+q
         wLQ2XMsTCUru9/2teTxcnwuue9IM+wZQT1Nz+IC5bP9IR5GavpQVO7qPcbEx/RZkp28h
         aZDFhG2DO+2pYv5zpWQD8+CQMxzaOEDDxGbO76S3fbBgdZvRPvRgKewGQ2XuOzSMVPEH
         wRD7Wgy0X98Z76PEF9ssWbSwiSbcqXbl41lBTWjzkOyQHyAm9ji4OIjIzfRU20ZB28DK
         /hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668090; x=1751272890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFKfoFX+b0fWpj1OGuQAhMWHq/Trp5Rsum6TUT3TNh8=;
        b=lYeUVv+UqxJCrzAL30j1AWQ/K45M+wxJN93SzirWgrdOSSQ+XzqMaqq00YQZaMHVX0
         KeeksjHMCmwmqEAwqbalYC0MyvEfRgro6kvRuvgBaUpxDEmyaOOWNVmnISkgJDW6ucv/
         PpowcI+WqoI6rYnKOFHvxJmw1IMLajBI5e6y1gvCQlQTm069AqFqTay0OK0OJfw4FmaW
         d7FgSW2icaVve66JlYmOidwW8o4dEipNxkd0q6xSAHMu5iGXwl7dTDd6QpAkg9V8J8PQ
         mEm+ycpOQptReuxY0G77DZ5n6xRoW7JVgVEOIOTRcj6QyyAel+ZEvlil6e+d7nNDBfEj
         g+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHRFHZS3EVDZRQAoiM20UKKor2H9vPkIgFu1BQ3cH+LSZkRcTpPyXVAy/eVvEon064OCOYeE8lbOIpu/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfp9XBXbJmgwrSwtXre/mBvJsorMmBiQCeM1K98qmPen4kFQ64
	HaFGuzGrb6E6OfxSXK7w7N+uDbQBnyOGDMmUFdK1+wpnmpahwGnLvfW4
X-Gm-Gg: ASbGncvfzrYFRkljG+qKDVVV8eZUonRVOS0cVHF6qXfjjo0iL6d8TJlTL7upEmZY1I4
	uGo3+xjGb/aHOttB/7O3buxKvX58/H+Fbrjp3HCA0Vf+LwLbhbJ2gN4yFKTUTEai/GgQmL6cTN+
	TcHbAZlT3C3I9MGaSJAQkH7lAGFj/YzWwdFRt3GGMk28QqE4phcehHU7PKsN4fAfcB6OfTb4Tx9
	9L3KWA/7ni0T+mycCBwtxmNHWh6EpWNe6cxTv/wYW5j1kwn7VGy8DY8mCLoktECMii8xa8OlONX
	1i7PWMHaB5YIvhcbiZL3i0pKz32iNWIAoKv4AgFY/DrgL9Irndcrzy5sXjRJ
X-Google-Smtp-Source: AGHT+IEg+Vrg4q7OXMVziKAkMdGsGKVcz2ch4jcR2RgQa7iyDmfJ9xV9plJ7R+MCae/mqCNaZWsqGg==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a6d12d5316mr10912719f8f.35.1750668089889;
        Mon, 23 Jun 2025 01:41:29 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453646cb5ecsm105878885e9.8.2025.06.23.01.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:41:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mario Limonciello <mario.limonciello@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd: Fix spelling mistake "correctalbe" -> "correctable"
Date: Mon, 23 Jun 2025 09:41:08 +0100
Message-ID: <20250623084108.29627-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a pr_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 7f8fa69300bf..eaf95ee5148a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2281,7 +2281,7 @@ static void amdgpu_init_debug_options(struct amdgpu_device *adev)
 	}
 
 	if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_RAS_CE_LOG) {
-		pr_info("debug: disable kernel logs of correctalbe errors\n");
+		pr_info("debug: disable kernel logs of correctable errors\n");
 		adev->debug_disable_ce_logs = true;
 	}
 }
-- 
2.50.0

