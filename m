Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EF42D78A;
	Fri, 25 Apr 2025 19:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609150; cv=none; b=h7WlocSQaIWFiuRvg72tbFPqLYmapbtN5VScMHodvSdWit60KgrTVSlbEEadOHsr0lB6JtaT0bEGKopl0V4gwQWE2VoITd7JXkfiTpLUokMgZemqF6U5PiVSVrSyFSkvQEsUc6+h6pb/QYcfwBhFnwFOeo4eygL/B5b1wQFE4Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609150; c=relaxed/simple;
	bh=neGbJ6Lymfsq8nEeLfmyJwBxDlpuW4G5Q1AEGS8l+uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqb+nnto+5zGYMdPlua623PTvM2cveStP0dlI414vPS91kN7rTpCC/qq8XN8PJBVTrhMiBrBNUZFtSom03jzDR52RdAuE5psKXJAmN8rcIJHKeVXbUYu7zwlYJkVJMRRZT8QZQ0Vm+uS3pUcgfoN1xPjkPgYfOwbJdP44DQ0bJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nvTKPqNd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nvTKPqNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745609141;
	bh=neGbJ6Lymfsq8nEeLfmyJwBxDlpuW4G5Q1AEGS8l+uw=;
	h=From:To:Cc:Subject:Date:From;
	b=nvTKPqNdOBzSU+7+8MLXFwCszgzruXwUSY1c3l4gHmVVNDGWQmfvse4+ekF5hnyJe
	 a+S1r65YH1bt6wnHHTnPcV9gqm3QJcijRuyEOFVZCgKE3STFQDxxgVioqWF36HUIyx
	 grzXMhPOkih3z5tEvbBJkQDrm+ShsjNHYIQlELB3gNNLBGBaF0jX2G2OOlyvtoGwkg
	 p9T/VT72boveO3A2dStmpUqPQpxvYyuzjovouDtf5EeoUtVlTWyYbbomKBjGYNF5xP
	 ijJ03P/wQMfx0q/GnLkbLWCF4lp0P1ye+too+xfQLh1WT1SzML4lnXi148oFb48ThO
	 TEsWLvjevCmIw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DCFA417E0987;
	Fri, 25 Apr 2025 21:25:39 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH] media: verisilicon: Free post processor buffers on error
Date: Fri, 25 Apr 2025 15:24:47 -0400
Message-ID: <20250425192447.227063-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initializing the post processor, it allocates the same number of
buffers as the buf queue.
As the init function is called in streamon(), if an allocation fails,
streamon will return an error and streamoff() will not be called, keeping
all post processor buffers allocated.

To avoid that, all post proc buffers are freed in case of an allocation
error.

Fixes: 26711491a807 ("media: verisilicon: Refactor postprocessor to store more buffers")
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_postproc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index c435a393e0cb7..9f559a13d409b 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -250,8 +250,10 @@ int hantro_postproc_init(struct hantro_ctx *ctx)
 
 	for (i = 0; i < num_buffers; i++) {
 		ret = hantro_postproc_alloc(ctx, i);
-		if (ret)
+		if (ret) {
+			hantro_postproc_free(ctx);
 			return ret;
+		}
 	}
 
 	return 0;
-- 
2.49.0

