Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403202836A3
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944257; cv=pass; b=d1wbmI3RR22n5QKK/HRVUCHQxoTWOl/Y/v1oNHSDxMg3c6dgvgqo8wUXRoni2jLWyok05Z5nhPjx15bLFhuHW+kdDKxwq2Zt9TeV11OqZsV3gT8VoXlD9mlEXH8XhhlkQZrESNR5WtMUH7cPoY6izmWtcLTVP/gWrcXFbnZw76A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944257; c=relaxed/simple;
	bh=zF+mHbkf60rfCs234g+xiMYHEJ8nGENSxTcjHa0RIyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axtvGz7YSwveiWA6nfOKCHpcshTz8gbB1ncBpqh4gvCg8BTHTj5t27ptBeybt/+1yuUBeYuZMt+pjwtCzbgK5ggPnfQkHzr5CUcr2MCNwCP1DqfibJkkUScgHZ0rFYiCPbXcvMaNaFTgv0Vwr2TGFALmF/lV8G/+XB4DIZa++W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b=WfK+i35M; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="WfK+i35M"
ARC-Seal: i=1; a=rsa-sha256; t=1748944243; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LnVT/iqQPyVRmIsHZHGR50rsKV32zw5V7CEjuhv0X8H2coCBX/Ycxi4j/6IdFwZ2V+AjJpa7hEQT4CVfeurEKxAyEcyRuRTz8x2Izm8hTjYt18uVzzF4L1nspJ01ceIaefiMU6PjeSEtcxyV0uEd5stNbsjvHyfMwUI4BRhDybQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748944243; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bylw4shBB29ahZ+zqubDHkYiBdt8upnwLyVdwCXCX3k=; 
	b=NQ8qCKWPoZ1X1dXSq3CSMplmOiU4WHvsxsVf9lreNEX68U3utDYbPUCy/s8QTM+fRVL0Vyl7J7BUOHAFc/zi+0B4MtFlSWIlGJXvJMQ9R9uB7fgcUEfyb0n8qhMeD2Ol7JAYccwI99Oj6pTfi5uPn475GxPTlGGFWxV3N2sYG08=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
	dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748944242;
	s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bylw4shBB29ahZ+zqubDHkYiBdt8upnwLyVdwCXCX3k=;
	b=WfK+i35MbcSGe9Pwe/DSZGVjUtIwS3SJGa+ArIWVLsjsspIHNulqRUz+sIroljDp
	YstWblhEGlVBJCszNmt25vsna7wYasAHxJfQ20W+hh2zh6dUK2Sga2QF8rl9AEzKiqd
	JvkzG0Q52bdm2yvUjniQwZP/ikwgo3I8zVuFBtNM=
Received: by mx.zohomail.com with SMTPS id 174894424081440.5342879966239;
	Tue, 3 Jun 2025 02:50:40 -0700 (PDT)
From: Ashley Smith <ashley.smith@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
	Ashley Smith <ashley.smith@collabora.com>,
	dri-devel@lists.freedesktop.org (open list:ARM MALI PANTHOR DRM DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 0/2] drm/panthor: Scheduler fixes for termination failure and timeouts
Date: Tue,  3 Jun 2025 10:49:30 +0100
Message-ID: <20250603094952.4188093-1-ashley.smith@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This patch series includes previously attempted patches to fix panthor
scheduler issues with spurious timeouts and issues when a termination
failed which would lead to a race condition.

---
Changes in v5:
 - Swiched to a patch series to make sure the patch which addresses the
   bug is added as a requirement on the scheduler patch.
Changes in v4:
 - Moved code related to a timeout bug to a separate patch as this
   was not relevant to this change.
Changes in v3:
 - Moved to a patch series to make sure this bug fix happens before the
   changes to the scheduler
Changes in v2:
 - Fixed syntax error

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
---
Ashley Smith (2):
  drm/panthor: Reset queue slots if termination fails
  drm/panthor: Make the timeout per-queue instead of per-job

 drivers/gpu/drm/panthor/panthor_sched.c | 244 +++++++++++++++++-------
 1 file changed, 177 insertions(+), 67 deletions(-)


base-commit: 9528e54198f29548b18b0a5b343a31724e83c68b
-- 
2.43.0

