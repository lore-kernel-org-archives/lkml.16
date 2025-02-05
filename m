Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3177922A1E2
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743445; cv=none; b=Xcu8MUj+W/fTWgjRKfcuL2piBThxJ7HLubos0RIFLVEkhlmnDKO5Qje6FEd+nmunMvEVvv4DzfABBgNTpZbkrZPkvUNBN5fzOTV86NbgdogaDJsyn2U+t+bTVejMB1P8Je/zeLaxOdOS3p0GlrDkwkZuVrj2qCSWP5Vs6F/SKio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743445; c=relaxed/simple;
	bh=IuOxI/ygHiJ4+esRB4KPb824pwCYUZ+ubtGSSeOB49g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjx4l6g1VvCzkLbY5AVAfjTgXJd8b2Cqq7NmoghoQJlYRxSyk2mH4cXxnBgWCVqVrOzMhoQuCyr18srgaGyODoDs1ud3nRaTQ7kqToAv/4+rqIS/7kxHFKpe6+Ofvpk1M6zbDNf+3BMTZ0Y2v2GnqeSd1wVIpV37EWphuYS1bHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b690HBL0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b690HBL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738743441;
	bh=IuOxI/ygHiJ4+esRB4KPb824pwCYUZ+ubtGSSeOB49g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b690HBL0Y58AYX8OZ+w0KvHB0iE9/an3YndS61YkZzLOv/X4sEo2LrpscRhGTNDfV
	 9he71z23AT3JRlSGt1M/aWOBjpD/zMq0sMn+Le1+MqrldNXxLT4iEFaTYGvNlsXZt5
	 iwQw/dF6BrrlPyfia6xF19nVROkMP+hQCpcuB3FxhEkB9teOw1GljVdURD+aEVKW6f
	 KOkx97qug9ZYvZ/NcWD60zIDxu2FqNNEJRWFbEq4WRV9GYqyzP2JKn/xvyJwDjFlWk
	 LteKtmZmrEjpRI6JHnnm9aY1gqdxkvplahnTjn5ETPRO441ug4VAKae/JPDuXVqoqL
	 ZSL3N0F6ydZMg==
Received: from localhost.localdomain (unknown [171.76.83.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0750C17E0DD8;
	Wed,  5 Feb 2025 09:17:18 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	jani.nikula@linux.intel.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/ci: update expectation files
Date: Wed,  5 Feb 2025 13:46:48 +0530
Message-ID: <20250205081652.1928927-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205081652.1928927-1-vignesh.raman@collabora.com>
References: <20250205081652.1928927-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update expectation files for the mesa uprev.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - New commit in v2.

---
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 85647eca4e55..6ebcc7d89fbd 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -13,6 +13,8 @@ kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-suspend,Fail
+kms_flip@flip-vs-suspend-interruptible,Fail
 kms_lease@lease-uevent,Fail
 kms_writeback@writeback-check-output,Fail
 kms_writeback@writeback-check-output-XRGB2101010,Fail
-- 
2.43.0

