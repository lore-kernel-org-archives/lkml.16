Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E804221261
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488571; cv=none; b=mJKJNG0IG9A7jyHf2sGWubNn30vieci+ib4H+wNYBSxRPjghU2/FbqqBaI85VlR1rrX1dwgDgFs7NT9FcqeJftlcwwKnsxxslqjYLgnNeRlEiMJRiXfoJTZkULVUfZ+GyC3iUF9fRjUroXInQ48NIN72cOidzqmaRit+V5FKGps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488571; c=relaxed/simple;
	bh=KwTxUWB8eoY1enwOmL1Rz7TnjVwHUrW7NjL5EDBhkRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rswld3AA6q6FbpwyTwmp58aoMHOv0hDnucxQbWliSCUTUhtp6YAG3YEaHKApMMz++pH0G+guz9KER1pleD40Qy759XCrjzVSdh9boCgc6H18cAA3Uf7Et+oA3x5Jx9C642TZciFe/vzEqqk20PSKtrFd7VwVmwCHupyeNEkBYUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEqN75eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEqN75eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A239EC4CEEB;
	Thu, 24 Apr 2025 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745488571;
	bh=KwTxUWB8eoY1enwOmL1Rz7TnjVwHUrW7NjL5EDBhkRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KEqN75eqyoVVKaygRATIKVaTzIYqoNMjVzyvM+liC+gY5iTMuVg9bK6KI/4CLxIxL
	 1XQiTOUQocxaJLcGFUZIa9c7PfQJXaB4brw2ZXtH62uKWsiMTXrSs/a6RhRgrZVrTL
	 OVdtXZABxPyNw4QCqjTHnTkTztBNk7VobZAjIvGeBLTDclf8nywqFCyP58FC87RnPy
	 HXOt/+FL/ukQUKD6T4JTD4oqA2h/E31zqN+az/YBYmbLGJdm9ZUfra3+KA7Cjh+HCH
	 MMmx6c9PnIdm1FF8LLmHAYfZiKfaGkJWJIxOs2uA4DkWHhRDFZbOKBLj5jAeo25SBp
	 vW3wInHd7NWgA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] drm/sched: Warn if pending list is not empty
Date: Thu, 24 Apr 2025 11:55:33 +0200
Message-ID: <20250424095535.26119-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424095535.26119-2-phasta@kernel.org>
References: <20250424095535.26119-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drm_sched_fini() can leak jobs under certain circumstances.

Warn if that happens.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c2ad6c70bfb6..0c56b85c574f 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1457,6 +1457,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+
+	if (!list_empty(&sched->pending_list))
+		dev_err(sched->dev, "Tearing down scheduler while jobs are pending!\n");
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
-- 
2.48.1

