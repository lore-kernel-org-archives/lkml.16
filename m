Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A851CEEA9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751315243; cv=none; b=lp8+IeSJHj/IP/oQizFZx7YGnkmFYYUG2MGZvf7cdLaKBrsVJKmHchyf5KlIO8m9YUGBjRjAjlxh515SWLYFTfw23JNACErJaqj9kG/l1/JKw0TmLPl9mPJ+nWb47YjyoVDCHyKNvjotemivfRw8ZMXHunzUAXWJ+qPPhoLnSpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751315243; c=relaxed/simple;
	bh=ME+P8r2niyrerF3qtAkywlQCA21DrP2PFf6RzkdryIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xgs3Bv+5+KsjRMFWbHjt+4JQOHslLmaHZkeKZkCQBr1cY0a/nVIw9OX96tUxgBq2IZaWtUjyFzZsjlmwKUIvFVinax103Q9zDL+JL98gmR7XYOpV6UVAIMA4m/4SSPIxtAguv3u1roFNd9IoA6kBSntGKgtFUAnD3sI0TjqTY8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=g5vZVkP3; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="g5vZVkP3"
Received: from fedora.intra.ispras.ru (unknown [10.10.165.24])
	by mail.ispras.ru (Postfix) with ESMTPSA id 149D94076195;
	Mon, 30 Jun 2025 20:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 149D94076195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1751315236;
	bh=8/w97TsGErtMuAVzt/xfSxnTo0YaKKnyUWealjkgpms=;
	h=From:To:Cc:Subject:Date:From;
	b=g5vZVkP3QGXxVFY9GsScNZBUBHNhUn8gXek47RRjj/ajOg8KTNiUe7GyGrp5jChEt
	 xw20gE7DebnPMYbCXzl2iscruypEzs+ACKz9hRoGb0dyYuK4VKWZJ/oG0ixJbBWtc5
	 G3ggtRACy1o/q1jqDKWWvRklhlMzFs1HEVrgUsBY=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Kenneth Feng <kenneth.feng@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rex Zhu <Rex.Zhu@amd.com>,
	Jammy Zhou <Jammy.Zhou@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] drm/amd/pm/powerplay/hwmgr/smu_helper: fix order of mask and value
Date: Mon, 30 Jun 2025 23:26:17 +0300
Message-ID: <20250630202618.1537569-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a small typo in phm_wait_on_indirect_register().

Swap mask and value arguments provided to phm_wait_on_register() so that
they satisfy the function signature and actual usage scheme.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: 3bace3591493 ("drm/amd/powerplay: add hardware manager sub-component")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
index 79a566f3564a..c305ea4ec17d 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
@@ -149,7 +149,7 @@ int phm_wait_on_indirect_register(struct pp_hwmgr *hwmgr,
 	}
 
 	cgs_write_register(hwmgr->device, indirect_port, index);
-	return phm_wait_on_register(hwmgr, indirect_port + 1, mask, value);
+	return phm_wait_on_register(hwmgr, indirect_port + 1, value, mask);
 }
 
 int phm_wait_for_register_unequal(struct pp_hwmgr *hwmgr,
-- 
2.50.0

