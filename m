Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA323AD;
	Mon, 16 Jun 2025 02:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750042581; cv=none; b=GLOG8gd6DxJk6SRvW74UgCSqLJjy1gIDYUzi6SGKgFnIfYVB58zSkhyoozmope9OH/1TS2DcUEL4+4wqwZ2wGbADa6aldv1AgEhQYnOxc6MjW1YbwLphv2oRiQ3zs3ReszX3VvsxS12WVBWEJLICNlQBYiXPgK83jChFkv+N9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750042581; c=relaxed/simple;
	bh=1k8I6Mvaw6SEoyTt9FNwQEocLlvWVGRMrN/jfNzC55E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OL824Xwcj4hxmEyjoPyXReLcGtMMZYq9r/XmMqKbi3ElpbSZtapr7tMjNxwLFETpQ9b/nYc7o6dN1SrP5TFoyC0MM5Ps2jCASS9s4uPkkypqcM3r/dXt2c4YwasPCApcwgqsRDS847k4INP2N/+liFl2kqO9wk6BSUN7jGEuhmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 704ac37e4a5d11f0b29709d653e92f7d-20250616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:47b3ed34-d5cf-4305-a2bc-5974acafac27,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:fa38bf22159f6ff5d46939ea87b52e5c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 704ac37e4a5d11f0b29709d653e92f7d-20250616
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 495715793; Mon, 16 Jun 2025 10:56:02 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 49C06E00891C;
	Mon, 16 Jun 2025 10:56:02 +0800 (CST)
X-ns-mid: postfix-684F87C2-25620450
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id 9CBEFE008900;
	Mon, 16 Jun 2025 10:56:01 +0800 (CST)
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: alexander.deucher@amd.com,
	chriistian.koenig@amd.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yunshui Jiang <jiangyunshui@kylinos.cn>
Subject: [PATCH] drm/amdgpu: use kmalloc_array() instead of kmalloc()
Date: Mon, 16 Jun 2025 10:55:59 +0800
Message-ID: <20250616025559.2766331-1-jiangyunshui@kylinos.cn>
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
index de0944947eaf..ab02011842e4 100644
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
+	void *bps =3D kmalloc(align_space, sizeof(*data->bps), GFP_KERNEL);
=20
 	if (!bps) {
 		return -ENOMEM;
--=20
2.47.1

