Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D72DE1E2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164625; cv=none; b=gLnWd8aeD8YRAL3nXOy9Io/bAfxYKTOPccY9BY0Ol4susX+nmEwSSHgnBRmovjEKTurSd2FfWGhNJZ1DfkZ8ns41em+Fb1sOZiR0H59Uyht/eP6pkbl6c8t7M+LUfoRvp15x33AbahWqrosff1BPud7/CeI74zplQtja6T3GKUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164625; c=relaxed/simple;
	bh=D2pX+T/9Z4AhwOQrFVvq4pwh1k+kQ/6T961Ac0+jWOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZiQ83m7ACLq1wzeJPPf5sHbEQ8f2FGjG7pGJfq5ptTRPPxveOuruJKoCK/wEYHIkq282AcExQ7davnGee/Jruqvx87fD/X3O8m0c6cFHvmELslTe1bHqe16uawkhVUYxYCy22bybgn7ifa8GJpPx/d9BjiOW46s/vEw0BUiAGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lcwt4GNH; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lcwt4GNH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yrfDzOT2kIl7hEsjyNVf8qR8CQoShiARpH5JLckqStg=; b=lcwt4GNHHejK7Yucp1nwlPtmO3
	/SnV2hmq66V2+D3YE6T7zCdhrmH0mUfx/0SE4//A82ZdqXmiKrouvypINmRZV9ZTcfsJMLzfJWvSg
	227qsOh1Z/JqUS7K1i+mMIx0VqUGqY72/8FIpWGhZTrPI1LgCtiAeXik8RytUYmgSNrJufgMf2NWw
	/CLxsJaxuhNRhpnMS/NK10TimdUqISWeHxR42QEa1bUepFs3xX0QZKWlUDl4BXN8oPONtrZtqECPZ
	0L/GX4sSUSspbcxb5ilAHJQABXi964+Sfvcig3bL/zPNw6LB2l+eTAX7ccjStNzjGUGRP5GBM1W8z
	KSEIqD8g==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uRVlM-004ans-Mu; Tue, 17 Jun 2025 14:50:05 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	siqueira@igalia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	"Raag Jadav" <raag.jadav@intel.com>,
	rodrigo.vivi@intel.com,
	jani.nikula@linux.intel.com,
	Xaver Hugl <xaver.hugl@gmail.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v9 1/6] drm: amdgpu: Allow NULL pointers at amdgpu_vm_put_task_info()
Date: Tue, 17 Jun 2025 09:49:44 -0300
Message-ID: <20250617124949.2151549-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617124949.2151549-1-andrealmeid@igalia.com>
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow NULL pointers at amdgpu_vm_put_task_info() as it common practice
for "put" or "free" functions. This avoid an extra check for NULL for
callers.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v9: use if (task) instead of if (ZERO_OR_NULL_PTR(task))
v8: New patch
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3911c78f8282..de914a39e3f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2447,7 +2447,8 @@ amdgpu_vm_get_vm_from_pasid(struct amdgpu_device *adev, u32 pasid)
  */
 void amdgpu_vm_put_task_info(struct amdgpu_task_info *task_info)
 {
-	kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
+	if (task_info)
+		kref_put(&task_info->refcount, amdgpu_vm_destroy_task_info);
 }
 
 /**
-- 
2.49.0

