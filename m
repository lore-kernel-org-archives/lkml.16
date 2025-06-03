Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243B17A318
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 06:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748931095; cv=none; b=t+dn+OPkYEC4DwX4DAiyKW2MA3K8rPcXOFo6DYsnrXnm3ny8EmnMA0KwUuKoJ8rUIOIJG5ttYAA/ejrYYkYM2NXQUASrqww+l+jlKY/5y7bbORjJpkr59NVeH0dGrRB4Yhj4jjBCVfLIQwfY2UGhfUNfViz4fwJByYWxQbs7EJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748931095; c=relaxed/simple;
	bh=rA+4hDYumQCpgtG/1kTSrGvgCkicB+863iNgqJlDOMA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mhYzl+yMlg8OweaSeAv21076L/gOZt4HmB0UvFZDSiRLebg7kM5doncQRxP3K7PM6IiGGDEYSSze+eg9CO2pQL3uQDgAFciduqn+lzJA2MwcwbBwXb9kOTdYX0de7T8t14get5at60POzGoCrZTdFLD0iLLsT+z+elO9tmemzm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAD3atkIkj5oX8_TAg--.18275S2;
	Tue, 03 Jun 2025 14:11:20 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	airlied@redhat.com,
	ttabi@nvidia.com,
	bskeggs@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/nouveau/vfn/r535: Convert comma to semicolon
Date: Tue,  3 Jun 2025 14:10:27 +0800
Message-Id: <20250603061027.1310267-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3atkIkj5oX8_TAg--.18275S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr4rCw4kuw4kuw1xGrW3ZFb_yoWDXFXEkF
	48X3Z3Cr4jkFZFganrAw4UZFyS9a4DZFZ7ZFyIqwnxGFW7JanrWwnIgry0qwnxtF47uF9x
	G3Z5X345G34agjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUS4EiUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace comma between expressions with semicolons.

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it is seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
index 9446049642e1..d294844d9eae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
@@ -42,7 +42,7 @@ r535_vfn_new(const struct nvkm_vfn_func *hw,
 		return -ENOMEM;
 
 	rm->dtor = r535_vfn_dtor;
-	rm->intr = &tu102_vfn_intr,
+	rm->intr = &tu102_vfn_intr;
 	rm->user.addr = 0x030000;
 	rm->user.size = 0x010000;
 	rm->user.base.minver = -1;
-- 
2.25.1

