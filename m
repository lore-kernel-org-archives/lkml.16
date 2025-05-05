Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3642DCB60;
	Mon,  5 May 2025 23:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486083; cv=none; b=IaL7ECN7tX0Yqfym0yAtV0gxTKq4dAFi816My9lvODi/D2Z2Ondw/ddfmioqvGsw44xVovr24qg4rwBar6ZPp+CByGzKydHOg2BRyzb+HaCGE9ZW8rQ6WYsXA+/+kV1vQZsk6htbiJ04PwFJPGVuFv4sXjly5psUpNSHmzxDeQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486083; c=relaxed/simple;
	bh=81Zkuae21aluFsGgJBAjlb3jwePP5w3W/o7+Fv9hDH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dcsE7kUILrFV9NynVcbm6OR2kALy/O5U7h1okA+wESY1VHVtGp0uLaglJFyRevagSIKZTh58KeGdi1N/fGlJdAYz3jMqsxApvDqBzZ/CQMfsYiq67fsu/UfGfM0Noajtzc6wizzn7GhLH72smnlI0vn/9zT3ZsUC683Zr5Rp+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHTA1e/q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHTA1e/q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EB9C4CEE4;
	Mon,  5 May 2025 23:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486082;
	bh=81Zkuae21aluFsGgJBAjlb3jwePP5w3W/o7+Fv9hDH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BHTA1e/qFoYq+9LM+Etd+FZFptzewArTt31meDVXvTQDBBaJuj0ifY4MjkiPaTaGl
	 N3l5FUbMLV8/x84dh03dkqRBnkaHHQ33AqHJdIW5uiRyJ+R3Fg77oWM0hElmu8uNRx
	 XqLbXTXIihZYDm5C+QfS0gs5J0Zmlv6IwppUNNEnqibxCmLOT08qMp18CufBIcRmQD
	 cXT+YdHL8CkWOBldDjC7DxmEflaz7LEgFFDJF9niFbmrxi9u6QooN1eosrEdw4ES+q
	 ErkxsuCb0pbs0f/eBSjakUpfhgK/a8tY+9joWC1E1HCiAO24bLn2SRB4hmZEmkRSxu
	 uTz5+MWugNwYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philip Yang <Philip.Yang@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	Felix.Kuehling@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 146/294] drm/amdkfd: KFD release_work possible circular locking
Date: Mon,  5 May 2025 18:54:06 -0400
Message-Id: <20250505225634.2688578-146-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 1b9366c601039d60546794c63fbb83ce8e53b978 ]

If waiting for gpu reset done in KFD release_work, thers is WARNING:
possible circular locking dependency detected

  #2  kfd_create_process
        kfd_process_mutex
          flush kfd release work

  #1  kfd release work
        wait for amdgpu reset work

  #0  amdgpu_device_gpu_reset
        kgd2kfd_pre_reset
          kfd_process_mutex

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock((work_completion)(&p->release_work));
                  lock((wq_completion)kfd_process_wq);
                  lock((work_completion)(&p->release_work));
   lock((wq_completion)amdgpu-reset-dev);

To fix this, KFD create process move flush release work outside
kfd_process_mutex.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index a6d08dee74f6e..93740b8fc3f44 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -812,6 +812,14 @@ struct kfd_process *kfd_create_process(struct task_struct *thread)
 		return ERR_PTR(-EINVAL);
 	}
 
+	/* If the process just called exec(3), it is possible that the
+	 * cleanup of the kfd_process (following the release of the mm
+	 * of the old process image) is still in the cleanup work queue.
+	 * Make sure to drain any job before trying to recreate any
+	 * resource for this process.
+	 */
+	flush_workqueue(kfd_process_wq);
+
 	/*
 	 * take kfd processes mutex before starting of process creation
 	 * so there won't be a case where two threads of the same process
@@ -830,14 +838,6 @@ struct kfd_process *kfd_create_process(struct task_struct *thread)
 	if (process) {
 		pr_debug("Process already found\n");
 	} else {
-		/* If the process just called exec(3), it is possible that the
-		 * cleanup of the kfd_process (following the release of the mm
-		 * of the old process image) is still in the cleanup work queue.
-		 * Make sure to drain any job before trying to recreate any
-		 * resource for this process.
-		 */
-		flush_workqueue(kfd_process_wq);
-
 		process = create_process(thread);
 		if (IS_ERR(process))
 			goto out;
-- 
2.39.5

