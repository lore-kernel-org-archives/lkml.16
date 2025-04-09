Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC532B9CD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190114; cv=none; b=JXKNcA/49s3oJ1GUVkDptyH908nv0BwkaCEv18hqXiRv5zexJpX8uZxRLzWt7o5PW+vYlzedyfIUoHO/nzWbM4J1GARWJU0mdS/M7V+bfMSpw0xcXOy1vgLj8Pz63NjtnOGpfeVgBFoYc+lJrrVAI5oFEBkanFqXqOb8W599Uec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190114; c=relaxed/simple;
	bh=ZtSTmmrQf4eBTePGmz/rBiScMQFDVV+Tq3GtHruUWN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tz97SeAwZtPUc6Nr/JFMAmiLR7khXfFBlBPb16GrF9pi2pSxaVpGgI8FLwuzHdwxYJUWVYYtQalLt1s1+DBxcRtbYSjXLyermONzAaUjwE+pofSclp0tPoBQ5cEji0bVnhYxJmtoUFV6q45nkebWhh73koOVxHycbzZIkBC9GbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQjILLio; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQjILLio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D54C4CEE3;
	Wed,  9 Apr 2025 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744190114;
	bh=ZtSTmmrQf4eBTePGmz/rBiScMQFDVV+Tq3GtHruUWN0=;
	h=From:To:Cc:Subject:Date:From;
	b=NQjILLiogdKVo3228BuoAAfAPb8JdtSdAIQgGkjJmQ0xXN6cW19GP4Nqqwzkz4EbW
	 Nm+48PRf+WEzxtvXdcQf6BQNPjewnFQ0hSC9Oua2EQaXzhy8YVBoR4nfntC2LHm5yq
	 JhaFytFD6ymboQI5pD+hrEFrYHc2Ye+b8Hr0WIdIlXWFBB8j422DR8NYjDOIOUyFlw
	 MaWwQVYErAfZiTnhyM+os556ZsWQpZutxRjvZpY56LiHBs0DudnMcndLdaCugjqvSQ
	 B5XzJd5x4/0Z1WbbWe2GUlsvZM0M9W+ESSlWsEFgrCJelBDJw0vGqUD6M04ilXhOY/
	 23MB5L1end5/Q==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/nouveau: Remove forgotten TODO
Date: Wed,  9 Apr 2025 11:14:14 +0200
Message-ID: <20250409091413.94102-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit ebb945a94bba ("drm/nouveau: port all engines to new engine module
format") introduced a TODO to nouveau_chan.h, stating that an
unspecified rework would take place in the "near future".

Almost 13 years have passed since this "near future", so it can be
safely assumed that the TODO is not needed anymore. Besides, its content
is useless anyways since it does not specify *what* should have been
done.

Remove the TODO.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 016f668c0bc1..3b73ec91c4ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -33,7 +33,6 @@ struct nouveau_channel {
 		u64 addr;
 	} push;
 
-	/* TODO: this will be reworked in the near future */
 	bool accel_done;
 	void *fence;
 	struct {
-- 
2.48.1

