Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F00815E8B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044663; cv=none; b=MLpf2fZYdHr9fMYU41ZB2mbIYmglDwm4AeyMHqkzQOWrUmjGsX4XWjb7ArNzSyFiAuOOuFzMPQ/cJGHos+FvC9wkG63WG+/FkFiOEfiVqiiwOd6aK7Lu2Nczly1l8HnP1kwapzyFfAjcG3oeuPa6UMTulZlrY+ARpxm5572YZEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044663; c=relaxed/simple;
	bh=qUinN15IMsxbK39i5o49kWhvMWNUmK9KMe9/xl6gKcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XRtYXOFdwv+zCP0M+cjF+rqOA1Uiki+HxFRSP6KpQWqrJNdJSVBpTUoP30dlHon1MuQlH06qP7MlN4GF8ytOCGQdlNipf99cqLB7NhiUFXRWjVldQg7UQaAsSpvKHR1uEoAuhTNaMEmCD/9zHgP/fXMBuT2t6L01pAjvsKGeMLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jLVm7BIb; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jLVm7BIb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jS4+JcM9xMlmOe8OfoNb9sR7u7eSGRLjH/mwR8XRVGw=; b=jLVm7BIbyHn86V7UU9kS7BmVIo
	gKIpcTGaNm6kMCRW/aJrA/EDVraoR6TMBCBHJLb/r7J5UWWh5CJIKWd4Db4F3LZo47W6Z0LJz4GmX
	SKLLfU+fSPiXtsf7OarfedAhVM4yXq6TI2S1jhTW2w4QxSpGZUuGjVQqDk4LbAjSlhWNT59R4R578
	eNQxnXXrDEJrKxawApf6ZzMEsgtInldVnUU3Ak/G/Y6yD+qYMwrHwOUb08D6bImCrHYIMM7e/FxMD
	qGI8Sy1PKOOZRRvpouCMUd/jTqt+UjU7m5jz94jor6wYnjVtYcsFy0cySk1voFwO38pN1JMsvTcjT
	2VDm5IbA==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uVCha-009UVF-8H; Fri, 27 Jun 2025 19:17:26 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com, simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v3 2/3] drm: Add missing struct drm_wedge_task_info kernel doc
Date: Fri, 27 Jun 2025 14:17:14 -0300
Message-ID: <20250627171715.438304-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627171715.438304-1-andrealmeid@igalia.com>
References: <20250627171715.438304-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following kernel doc warning:

include/drm/drm_device.h:40: warning: Function parameter or struct member 'pid' not described in 'drm_wedge_task_info'
include/drm/drm_device.h:40: warning: Function parameter or struct member 'comm' not described in 'drm_wedge_task_info'

Fixes: 183bccafa176 ("drm: Create a task info option for wedge events")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v3: Make it consistent with drm_device member description
v2: Add Reported-by tag
---
 include/drm/drm_device.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 08b3b2467c4c..73dd3c5470a4 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -35,7 +35,9 @@ struct pci_controller;
  * struct drm_wedge_task_info - information about the guilty task of a wedge dev
  */
 struct drm_wedge_task_info {
+ 	/** @pid: the pid of the task */
 	pid_t pid;
+ 	/** @comm: the command name of the task */
 	char comm[TASK_COMM_LEN];
 };
 
-- 
2.49.0

