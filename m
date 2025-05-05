Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5827CCEB;
	Mon,  5 May 2025 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483536; cv=none; b=FjA6QOd6ivI+PNZZHJda5uH9oNTIGX6ktlL69tOhQKVIl+Y3RA3a9pgSF3CHwpjV2G06FVXJotv3a+nWOcpxGLoITaSeuszZlclxsvHYaD1sbXMO7x1VkKrXz8GCyrWFxigEjbqdZICEuSI/UGdVno2dthWZsfUxWlWaSVLbrBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483536; c=relaxed/simple;
	bh=Uw3lVs8GWqNrpZrbZbxn1WOiRBE6hyOMkEaWpIFMvHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fjQn6vBSdj4H5B0K+McFGvm4YPywp2ddWbjBsQkFuLkzOxoK3gF5YA9NMUYEGOUiRM+s2KJMX0CkZN3cPvXMO8BnYTMwNcKA6pBfV5lZLa9/kcHRIVdk/qM77R1EAfYozUhlvmSHESa8UXBgaPSOAEe1onAAjpX40NyRtrqvvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chDwHczX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chDwHczX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B299C4CEE4;
	Mon,  5 May 2025 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483535;
	bh=Uw3lVs8GWqNrpZrbZbxn1WOiRBE6hyOMkEaWpIFMvHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=chDwHczX1/BVDRVXRy4pkFciBvYC0saMtBAjXlKtYLVmYis+q9EL05gRw/IvcR4wZ
	 qzinqG1SdB0ELSofnoiqceJYcaQSe856AqCDSxPpp/6ZD0dTnNQCirx6c1jyl8K3rb
	 UmVD8QQS6t/ucW24EoK8xKiivK7iFMDK8+GzoAiNow15MR+G2VSniu0/+7x+wTxIiG
	 Kslbt86bKWKXixXrn4ZlTGaeHWNpOeqj42+wKC11rMP2VLOOsvW6fqe6CAuTqjmo/Q
	 dr6SGp2wYzpLWbJqYTKcmebWIdPgiowf4tZanWSQDR8UyAOc+bThfD1ugAzEmiRb0K
	 FHMK6CZdqNuhQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Flora Cui <flora.cui@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	sunil.khatri@amd.com,
	Hawking.Zhang@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 104/642] drm/amdgpu: release xcp_mgr on exit
Date: Mon,  5 May 2025 18:05:20 -0400
Message-Id: <20250505221419.2672473-104-sashal@kernel.org>
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

From: Flora Cui <flora.cui@amd.com>

[ Upstream commit b5aaa82e2b12feaaa6958f7fa0917ddcc03c24ee ]

Free on driver cleanup.

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Flora Cui <flora.cui@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 6992ab4878360..b3e4201a405c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4778,6 +4778,9 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	kfree(adev->fru_info);
 	adev->fru_info = NULL;
 
+	kfree(adev->xcp_mgr);
+	adev->xcp_mgr = NULL;
+
 	px = amdgpu_device_supports_px(adev_to_drm(adev));
 
 	if (px || (!dev_is_removable(&adev->pdev->dev) &&
-- 
2.39.5

