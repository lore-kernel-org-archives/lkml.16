Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61462951A0;
	Mon,  5 May 2025 22:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484688; cv=none; b=YsrWmWjxcWYeFleubr4jvbym8H8Ak5y5uqe+agrOR4Iza8XA24tRjCfm6sLRMZTpx92i48kiqGNWCva5rwnov+vvSqZzNKMSS60jfcMYZWNPxThw37ehzChexECTEC4k2Fg4b9yDPLsiETrkZVRPmAjedIiVmJsKa1WaeBEqkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484688; c=relaxed/simple;
	bh=kXI5jkJUPqCaxZy4WgIV1PgR7u+voknpLFajGD8+aeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cMt0GpMidFLx4vYai7Heni1lPiHueIodl9SpKVsdLhfv+azhOMnJCWRkHX/hjKgLaBQQv/7e/FK225OJ18WfLmGbFAj2k9IiCgIlzkSV97ZpFqGt+H6iw8oKY2mWPgW5RF6WWs70dtXve3d2mnSL28pMix3lx5bJuaDSYMhxHIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VeFMp/2C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VeFMp/2C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B42C4CEEF;
	Mon,  5 May 2025 22:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484688;
	bh=kXI5jkJUPqCaxZy4WgIV1PgR7u+voknpLFajGD8+aeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VeFMp/2Cn+OzRikXEDnqSmdQ2oLKf2gJIF4bkI6d6lYPSWNsAVT4lnmcXhcmXK2PR
	 PFL1YY2RyZvHq7wFkK2pvkx60BOxLHyF4RdCxPtUmL/i3hFSygsjkq7OsCphMYmjxm
	 A6Bdv4be75BU8xrkzBGjgSjvYhbZKF42MbyNEitUfMk3dpfaF9y/K1axBUY9EeyyC2
	 UP8qcCIQpje9yB6bW7VvPx+YS8C7IecnACDwX7QlT62kstEpJmykaLJNzOvycyj+F5
	 v9OFvlM/IY7H9Qa4a4qqtXz9uoH/ok5EebT6xPkhvhYcUpbIDSssewBNtr4ljEylGM
	 W8ZbM+EnyiRZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 607/642] drm/xe: Do not attempt to bootstrap VF in execlists mode
Date: Mon,  5 May 2025 18:13:43 -0400
Message-Id: <20250505221419.2672473-607-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Maarten Lankhorst <dev@lankhorst.se>

[ Upstream commit f3b59457808f61d88178b0afa67cbd017d7ce79e ]

It was mentioned in a review that there is a possibility of choosing
to load the module with VF in execlists mode.

Of course this doesn't work, just bomb out as hard as possible.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241210083111.230484-12-dev@lankhorst.se
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 1c764f200b2a5..a439261bf4d72 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -236,6 +236,9 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt)
 {
 	int err;
 
+	if (!xe_device_uc_enabled(gt_to_xe(gt)))
+		return -ENODEV;
+
 	err = vf_reset_guc_state(gt);
 	if (unlikely(err))
 		return err;
-- 
2.39.5

