Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A128EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190917; cv=none; b=e5NV9Mm4+iEjjZMAjGfl8jtxYhhxiZvjFySoDALicq0zE9XI79NHbL//QY5C+raWfH7X12L+JRskRcV0VV074qw+7FkisIAtzlOpsRSzrUthnEraoFxftilqg36r7w0wz+z+aPpsVR7opX2C+/yOcB0DLXsnDucy/V+NjLU9s9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190917; c=relaxed/simple;
	bh=FMVVSY7+wJfivB7Sad0PE8l1LVsxH91JaEb5hHiAAR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZ5coyNqfndp0cY70IgRoYim3kdOTy7CxGIHg9zZhTe5IKuLkQgIRABtaY3XTTbuwk6GHjJrSVVQ/ioRVloJD4PvdBnXi/l/W8bAqf8hYyh4nz+6xFzblEC9FUrUBev26KEXkFv02ahzpxfVfXtPEEyM2k6IJf/eGMfisS6Po7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V90RGxd+; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V90RGxd+"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b24f986674fso432534a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747190915; x=1747795715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PGEJyak/6rSZ/dLnCIV5A3FjwD/zBWauW+KoIJs0utk=;
        b=V90RGxd+hLfSPTe4e3naq/5YENgQYXHEvpDYblmnBNWmI7Jdo61xJUbHflzZHFIOoN
         /XiDOPsDoknPv1eTvDC5DnYrGGd2kBkKkifH5M4H/EPdW9r2rZVG6952r9x67fWO5SqV
         JZIKKiRTDdYlxrPuKpCSC9IHE4mymYUqdKZ3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747190915; x=1747795715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGEJyak/6rSZ/dLnCIV5A3FjwD/zBWauW+KoIJs0utk=;
        b=Kvn1cSwFVzdbjmePO4oaISfyrK0lDq3r39BiFAXgTb/HLgSJCdWk62u5ZM6A5y/cHw
         G8Akm2bCpnL4g73BwmpgT4KqHGn05jxGs4iRLlXMTRuO7NTyy4X6Tzn5a4B9DlmHlwVM
         j15qdJIZHULTCzvOHVtebmLD5tGB5KN9lJji+d4Z6llEycheiH8hxJCX1YBzW6KKkt65
         XHypaxdRViT189qhr+gKBe5RqTIXLK/nZksuBPIPpYFfgDFk60NXMJZWn7lKPfDaKD5K
         SU9QSiw1gQNxOJdyW4xS4R+Ofak4WF4nHLepJoH52892gmHq+tYD5JeeqA5mXqcdNpRf
         f1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXjhunzsi0B39KXYgXmrP132p61q8eGeFqrfifoYIkpRmgM46LFFAUn/aeuVgGwfbzG24omK4uE351ZDds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+pItx7B5Sad6d9r4NYDKoWjwqxgBezcTxNMw4f61IuuBjBv3e
	egLdrcqq1M/NPOioR/Xt9n4H1VQVEU5clJBIuMpGfClNemU3Y327QO8M8IMaHA==
X-Gm-Gg: ASbGncv6oxD7jOukvypFjQjTTw+v3Ehas7dTSNaCgKBLj5BY6Pwg1c/+JqG5FzolghH
	gGO6SXBAuSS9VAMcfhSTD0fsNYEBHFOqkVaZ1lNEPVMC6xBaLyBxwGsSVjTwUrMtDPjpNbHfBwY
	D1msjm8boS7Jrinzyfh5GlW3dx1M9pNOl9ichnMhm0vBhdGDXzIu1WZ9JThUMvMrQc5y8Y3Rd1U
	PVd4ewOijQ5EkM7pGF1dzqNRvjNjBOaOCUafQJkKNNXukqhxK5y8sum2Vz7htNKuIN2pT2zJy5J
	9w2JF3dPJ8dDxnkN9fixLIpKsfNVfpV4uMT74g0Wdm0Kg7/fczrF/UZ1gbRb0JVIEtN1MkfnYEc
	JRw==
X-Google-Smtp-Source: AGHT+IHORp3li3afAsMEEJ+JkzNaeTKt3nAWn8o6HfT4vtxA3OVL69n4nWJvzER05C7441IUPMK0JA==
X-Received: by 2002:a17:903:178f:b0:21f:1348:10e6 with SMTP id d9443c01a7336-23197f4aa64mr28004805ad.13.1747190914988;
        Tue, 13 May 2025 19:48:34 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:d415:5e1d:3550:1855])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75494cesm88759135ad.1.2025.05.13.19.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 19:48:34 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Zaslonko Mikhail <zaslonko@linux.ibm.com>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 0/2] zram: support algorithm-specific parameters
Date: Wed, 14 May 2025 11:47:49 +0900
Message-ID: <20250514024825.1745489-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds support for algorithm-specific parameters.
For now, only deflate-specific winbits can be configured, which
fixes deflate support on some s390 setups.

Sergey Senozhatsky (2):
  zram: rename ZCOMP_PARAM_NO_LEVEL
  zram: support deflate-specific params

 drivers/block/zram/backend_deflate.c | 12 +++++++-----
 drivers/block/zram/backend_lz4.c     |  2 +-
 drivers/block/zram/backend_lz4hc.c   |  2 +-
 drivers/block/zram/backend_zstd.c    |  2 +-
 drivers/block/zram/zcomp.h           |  9 ++++++++-
 drivers/block/zram/zram_drv.c        | 21 +++++++++++++++++----
 6 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.49.0.1045.g170613ef41-goog

