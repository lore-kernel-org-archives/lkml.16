Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA921F3FE3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879145; cv=none; b=c4bNkifhero3QIuW+MgSLaM6nbt8q9LeQs5qC0gMcQqB7MOOAWT27OfBiY7DClyg7OO+dusVXVZZTrODOSdRKRL28ykknM4h10RcpAPkuik0RIl+4xumXaFw6ZuQSVQod0Rqo88O3WTpHFmu8TB25nhHGvD25v23+PZ5Y0OyMk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879145; c=relaxed/simple;
	bh=roVPv8OjVfBI7qZDFvWUBhng+U4m821lTmU3vfQ+cJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IH0jVHOqZYbnJ7HSR804+mFGRkPDr13umCZP2hiM20/9RLlkuY5bE97kgNnkq5teiSyXYKPRuso7oi/JFxMH1jRirTARJwpz/b2USYNAFgOrC51Ti4i9qspOcYi8lF+QywG95bi0LEAeRCe7yzv0v5oFALfocX9tIf5Gq944kUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACHNUIXvgBokIaACQ--.7289S2;
	Thu, 17 Apr 2025 16:38:47 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: agruenba@redhat.com
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] gfs2: Remove unnecessary NULL check before free_percpu()
Date: Thu, 17 Apr 2025 16:38:39 +0800
Message-Id: <20250417083839.937319-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHNUIXvgBokIaACQ--.7289S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY-7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87
	Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x0JUf8nOUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

free_percpu() checks for NULL pointers internally.
Remove unneeded NULL check here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 fs/gfs2/ops_fstype.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index ea5b3c5c6e1c..8f9bb6677db7 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -64,8 +64,7 @@ static void gfs2_tune_init(struct gfs2_tune *gt)
 
 void free_sbd(struct gfs2_sbd *sdp)
 {
-	if (sdp->sd_lkstats)
-		free_percpu(sdp->sd_lkstats);
+	free_percpu(sdp->sd_lkstats);
 	kfree(sdp);
 }
 
-- 
2.25.1

