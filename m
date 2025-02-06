Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA751A9B58
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864356; cv=none; b=BqGpU4nKbg+CpTi40e3O0yG90E1EQkS8X2eTrM2rB2/fJRpW7YjDrtQi+oKf7Lfffz+QbO014NJ1gOu6jB8JONdChQA5v3p7Gy9Srz8HkWLlQ0SENk0qbXX1OxUzLYpFGA+JTvN6zflaF58HCWmEJvsJoohJwZQPy3C+9TbCrWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864356; c=relaxed/simple;
	bh=X3PlgX1yhKWIGV9xSdmzqvAcuP9HYUcLj0zeHJXqWTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbGrVFDQmEc4C/alxxbnzedr5vL79YqdFNKntaH8r4e+t+8Xy4e7s5OkMR2/fdQm1Tw4S5G22SLvPgAyNIW+GR1D/CoXnMR27nXIa3AqXkvhnTsvxluzoJ9f/LUAMKa6ZL3Y8idTuQdpUj9jMX5+NanLAeIDoRvCyapjwW5uFMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=1eSk//BV; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="1eSk//BV"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl761y0gzlgTv0;
	Thu,  6 Feb 2025 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864349; x=1741456350; bh=5zMoU
	NTxpBgVXmePaZw+7Qp6Z4XsLeU81MF8a5Spoo4=; b=1eSk//BVs3veS8aPqwAoP
	m8KOeTpzD3FDtssrPKs94nILk/y29fejr+jtSX0HS0z43Iww81A2/HlSL0oSQxg8
	WxPUtPKPcAEB5/Uy8ssUfff9spy8CsCAAQj/Q1mwYvzCfWpQTZPcxzqOpIre+fcj
	48cv09OOYT03eoQnHNqZm5ZWzXipsmSf4nzrTV3O5FHFgmZZdaauaRhviUa6gE7A
	F0Y7pGQVWtSUp6MYyOTDyQAjj/cfyj32WUtGGgP7ku41+ArcOjwucCk77rT4EllI
	0Vt+2ft3jk2v22kQlQ1pbafH1LeG+aECGAvDS7Vh9eOntknlvOJgwW+xJ01ek0v2
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id BW0B7O4JKL3T; Thu,  6 Feb 2025 17:52:29 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6y5BLFzlgTy5;
	Thu,  6 Feb 2025 17:52:26 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH RFC 24/33] drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()
Date: Thu,  6 Feb 2025 09:51:05 -0800
Message-ID: <20250206175114.1974171-25-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of attempting the same mutex twice, lock and unlock it.

This bug has been detected by the Clang thread-safety analyzer.

Cc: Sean Anderson <sean.anderson@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for complianc=
e testing")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynq=
mp_dp.c
index 979f6d3239ba..189a08cdc73c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2295,7 +2295,7 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64=
 val)
=20
 	mutex_lock(&dp->lock);
 	dp->ignore_hpd =3D val;
-	mutex_lock(&dp->lock);
+	mutex_unlock(&dp->lock);
 	return 0;
 }
=20
