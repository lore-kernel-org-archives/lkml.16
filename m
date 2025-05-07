Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559271D5146
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 04:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746591009; cv=none; b=IQo9z+OE85jO3+2LJOtV83PPC1cHs8cDYBvq+lXyrWqFFp6veqn9gjj6Cgx96syKqJlSqvdP4uJ3IPlJW/ClLlwgzOk9wsNJKLl39K/MWXidMVEfQ4FB6ireW6ypzgjNrLa7n71spK8ShZdQMMvyvpeLnQIr08Lwm/fK5fvKFmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746591009; c=relaxed/simple;
	bh=1K1PUdEaZg8BrgM2Sdx94gCCDJTMoFg9QTbttB0HCNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F7D6YrUvRJGrz6K9IITGW8gmcynNA1em59XAiAWyQjFzgV2NK/C+xgRBvyrUJ8FaXkRgvqcJ+W5ZS52mhhg+z+hSdVK8TrUzq4UHSw5Zd8+7K7FBEdhktUTZN4wK55zz4doUehHmZaD0opSSK+/U/CcFpl+h90PocUTw52o5gjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=LoVqvPim; arc=none smtp.client-ip=114.132.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="LoVqvPim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746590947;
	bh=0UBymo+iMIc663dB1EDx9nPxjNeHkJAjxl2DM+9FhmA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LoVqvPim+VCjow7Tkm2+6OabOztpLuIBTcrkwQSuTk2pE354Z1i/GxWIBe4Z/BgCK
	 vW42U5fmHEummChaENoGMHS3KGjGTKsRS060r+Lntkgn7P3eVNj6xhqMqCxqkhAVY2
	 zihkFc/fr/cKVpVPXmChOoM8IF6pa1GAF2+wyXSI=
X-QQ-mid: zesmtpip4t1746590937t0e9125dd
X-QQ-Originating-IP: CFL0yyIMidvb1K9q1fi7a3G0oTrOrKkYM2TbwA5kxo0=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 May 2025 12:08:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1585881770139576930
EX-QQ-RecipientCnt: 11
From: WangYuli <wangyuli@uniontech.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yuzhao@google.com,
	stevensd@chromium.org,
	kaleshsingh@google.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2] mm: vmscan: Avoid signedness error for GCC 5.4
Date: Wed,  7 May 2025 12:08:27 +0800
Message-ID: <62726950F697595A+20250507040827.1147510-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MyIXMys/8kCtiHRYgmzCZg4Yg61lnJO9jtV35WWd/JK2V1thZpQ3bc1j
	ZNKp+VmeEOuqowEAOHhUeZ1ff1uy+jLR9cPMT5g2ZPvIOyBjb7G8hLwvBtruBDlwtMVIvn2
	6hkIbyKHbhsCa81V6toWeugh+qZei4t5XDATLKGDiLu8I/gVN3nVp6AaSGXxr7exVgQxlIy
	UMlI8yC/gNjNYntVUF09c0G3Xb3ne6SUBr761+o7qfiXRiC7GXc/jcgWZ/VZ6qr9RBMtOrg
	cUsqk6tbZrx1kV8xZ20xb0KfFEn1zovPMkOOb4S+8WoUva2gxbf6ULjLx+mONa7zMN2ONda
	lL8VMlouPMUCN17uGAdOkEW3UvWS/RJkhLctrZSNXZTM0ePS2BjSvoZm35lIsc324hdJqA6
	oEc8icIm72WBokJBDOERu25T70zq37Vit1hZX+cdo1yggxESjCi97g7RGsGmnykd1EJrLBp
	FDnpKgUGQ7xfngnesgx7Y1PkaRkEPiFCX7LpTUexJWqQEfdF/QFROj2M86pNe2S1vmYGXN9
	jjm9QxK2cRIVcFQKJTBgEJFF+unSt3mizY3PQrFFMzb8OI1+t1QXrdrwEZIYmgK1HAEzCAk
	/oajbHTfaCtOM7TiE3fym4Vt9OGJHy0+jznG5A7aWd54+5TJjGHk5pF2DZKIJSj8Z8aDGym
	RZ63+JjyXGWnecs7OUUAvYHuexFlZTNkG/sieGUQsKWXZGLYNdu7e+0Zrualf8qi5I/Rn2g
	AFXDYoXcySXn4qMArA8qWyUI20o0xVN4dz4uRwJmivL+zg6HafDO1SqeOuquy3Wn5uKDQC3
	VqV+MK5JVFuBWh3SsqznRKMxoHLMl8fd6v/1jnxYqIp9t5m4KFBtQwz7N73BA/xF8xyL3Jh
	AC5fr96kOfF6Rzj/licoMtYSSPaBhCGQnJTZmTwGK5ebyUpOdEgueWRaD9Lakfib6aluljC
	Rrc08F5Imu8nFmDtaYNxTHU8CLIl8kpf0JZr/2Pr1sFmacjhn4k6b7PVp2Ku9f29DxyGjGF
	etQrihm60XnhsF9F2WCredFN68YWRewFxc+8EHUQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

To the GCC 5.4 compiler, (MAX_NR_TIERS - 1) (i.e., (4U - 1)) is
unsigned, whereas tier is a signed integer.

Then, the __types_ok check within the __careful_cmp_once macro failed,
triggered BUILD_BUG_ON.

Use min_t instead of min to circumvent this compiler error.

Fix follow error with gcc 5.4:
  mm/vmscan.c: In function ‘read_ctrl_pos’:
  mm/vmscan.c:3166:728: error: call to ‘__compiletime_assert_887’ declared with attribute error: min(tier, 4U - 1) signedness error

Cc: Matthew Wilcox <willy@infradead.org>
Fixes: 37a260870f2c ("mm/mglru: rework type selection")
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2:
    1. Fix commit msg.
    2. Use min_t instead of min.
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 3783e45bfc92..8d9a82621c4f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3163,7 +3163,7 @@ static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier, int gain,
 	pos->gain = gain;
 	pos->refaulted = pos->total = 0;
 
-	for (i = tier % MAX_NR_TIERS; i <= min(tier, MAX_NR_TIERS - 1); i++) {
+	for (i = tier % MAX_NR_TIERS; i <= min_t(int, tier, MAX_NR_TIERS - 1); i++) {
 		pos->refaulted += lrugen->avg_refaulted[type][i] +
 				  atomic_long_read(&lrugen->refaulted[hist][type][i]);
 		pos->total += lrugen->avg_total[type][i] +
-- 
2.49.0

