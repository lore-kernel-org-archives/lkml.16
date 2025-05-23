Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C30C1494DF
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990069; cv=none; b=kRddkz5FQkTz4tQT7nKgdns7AVpn3+C6fuFKKw9eoIMLH46LAJzKVkvWA/J8k4VrEKcW91kBLF3RE6Wx4g90MhEIlH0aFQujfCaBodujnzMtT8jjlOFyFrfKKL0cg0ks02l/YZqqxSXRGWkokWkECFz+WKUBj+4dM9wG+TmqZi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990069; c=relaxed/simple;
	bh=5cHjh0c/Fu4y8h4TOWZBwsw1Yha8wtyyfu8NzJg4mtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBMxDXFJU2M7oFC5dcBNq4YLa/XwAoqjlNhqYu2bDfXZQq3m4IMIHKgChFBDdip3rLAD/wcyhAMmXW+5uaCbTvAqzAzZbt+wzOuR32G6yn8LoXBrnSs4+5b0LR6FuR//EvMQK+5N8i6vIWNu+z180YZ0a8AQcrj3rlTTy5EUH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MApWt5wi; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MApWt5wi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Eg
	FS/rW230blmPCo/88Tvv809uo+RDzoEKY/8wGd39o=; b=MApWt5wimIOZAalquO
	Dvc9tko7f2gt/7W6H+iKpXpcWCMovx44TS3hvs5hQmKZ3P1tUFVFeQ8Gr9owTlwu
	J7EboKS6Mo1ZXeBGuxGM/6/6L/0zlLa47mASt3/Gs4+DlmoJl9Un4PAvdvfais07
	+uhUAV50RXuBCfyzOcDJ/1SWM=
Received: from evb20.domain.sensetime.com (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wB34EgFNjBoK31rDQ--.40531S2;
	Fri, 23 May 2025 16:47:03 +0800 (CST)
From: junan <junan76@163.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	junan76@163.com
Subject: [PATCH] DRM: Fix rbtree search issue of find_hole_addr
Date: Fri, 23 May 2025 16:39:10 +0800
Message-ID: <20250523083909.84517-2-junan76@163.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB34EgFNjBoK31rDQ--.40531S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtryDtF4rur43ZFyxAr1DJrb_yoW8JryUpF
	47G3s0krZ5Ka1rWw1IyFs7uFy3A3W5GFWxt3yDuwsa9F1v9rs2ga4Fyr13KFyUJrZ3Gr43
	WwsYgFyUCF4jyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE6pBsUUUUU=
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/1tbizQNWsWgwMtVWOAAAs4

I'm not sure if it is a bug or just for some special purposes in the function
"find_hole_addr", the original implementation is as follows:

static struct drm_mm_node *find_hole_addr(struct drm_mm *mm, u64 addr, u64 size)
{
	struct rb_node *rb = mm->holes_addr.rb_node;
	struct drm_mm_node *node = NULL;

	while (rb) {
		u64 hole_start;

		if (!usable_hole_addr(rb, size))
			break;

		node = rb_hole_addr_to_node(rb);
		hole_start = __drm_mm_hole_node_start(node);

		if (addr < hole_start)
			rb = node->rb_hole_addr.rb_left;
		else if (addr > hole_start + node->hole_size)
			rb = node->rb_hole_addr.rb_right;
		else
			break;

	}

	return node;
}

I think that the "node" should be set to NULL if it is not the one we want,
please tell me if I am wrong.

Signed-off-by: junan <junan76@163.com>
---
 drivers/gpu/drm/drm_mm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index ca254611b382..9417911198b5 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -347,6 +347,8 @@ static struct drm_mm_node *find_hole_addr(struct drm_mm *mm, u64 addr, u64 size)
 			rb = node->rb_hole_addr.rb_right;
 		else
 			break;
+
+		node = NULL;
 	}
 
 	return node;
-- 
2.43.5

