Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E22DE710
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751599826; cv=none; b=ADcY+UnHQhxXvyBSdjDIHcGDeTFAzcwhZy9YPUIhLSu/X/VP/BKvegTc5dPVc9t/BaxZnUKRGLXC0B4t+PSWinc/Ocflg0np5Dum8970vG/AsIsruzuNe3mX39zBQ7nyyed6+/GdTvRRTVkg1igbyEgCV7XprErAWWpclVp9zpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751599826; c=relaxed/simple;
	bh=E/cu5hc6fvoB3H2h8mHPslJpGH+A+7L3GT/Zsv4qgoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LW1Hs+lDCm5iEEjWL+2Agr0Onvik1naAQQp1sxiSoFIJ/DnIn3J4CApd/Dn6jUezLWPvxqLlE6iZ6Su/iVZetkdF8uwFmO7RVg7wKr5WEUJ/bM8ewWt2RbKOWaIFvf3q73HfNJPqXwDKyrmEjDtu4HLtuYj+dibo/3vQw4Vh45E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 33d6e296588711f0b29709d653e92f7d-20250704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7333f72d-cfa2-40be-95fa-6b5dc0a96f72,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:6493067,CLOUDID:79c5d3fe3c20506a7d79babaa6678826,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33d6e296588711f0b29709d653e92f7d-20250704
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1110516493; Fri, 04 Jul 2025 11:30:16 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 00484E0091AB;
	Fri,  4 Jul 2025 11:30:15 +0800 (CST)
X-ns-mid: postfix-68674AC7-8599861065
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id DA066E0091A7;
	Fri,  4 Jul 2025 11:30:14 +0800 (CST)
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	Yunshui Jiang <jiangyunshui@kylinos.cn>
Subject: [PATCH v2] drm/amdgpu: use kmalloc_array() instead of kmalloc()
Date: Fri,  4 Jul 2025 11:30:11 +0800
Message-ID: <20250704033011.2875239-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use kmalloc_array() instead of kmalloc() with multiplication.
kmalloc_array() is a safer way because of its multiply overflow check.

Signed-off-by: Yunshui Jiang <jiangyunshui@kylinos.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
index de0944947eaf..12f5a1b9ff8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2563,7 +2563,7 @@ static int amdgpu_ras_badpages_read(struct amdgpu_d=
evice *adev,
 		goto out;
 	}
=20
-	*bps =3D kmalloc(sizeof(struct ras_badpage) * data->count, GFP_KERNEL);
+	*bps =3D kmalloc_array(data->count, sizeof(struct ras_badpage), GFP_KER=
NEL);
 	if (!*bps) {
 		ret =3D -ENOMEM;
 		goto out;
@@ -2719,7 +2719,7 @@ static int amdgpu_ras_realloc_eh_data_space(struct =
amdgpu_device *adev,
 	unsigned int old_space =3D data->count + data->space_left;
 	unsigned int new_space =3D old_space + pages;
 	unsigned int align_space =3D ALIGN(new_space, 512);
-	void *bps =3D kmalloc(align_space * sizeof(*data->bps), GFP_KERNEL);
+	void *bps =3D kmalloc_array(align_space, sizeof(*data->bps), GFP_KERNEL=
);
=20
 	if (!bps) {
 		return -ENOMEM;
--=20
2.47.1

