Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0232367DC;
	Fri,  2 May 2025 23:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746229946; cv=none; b=M3bB5cClvzh5fbqm5rHnbWm4aVGeyI7X2MrFmwewdm1sWMhUINrjla9ac8ABGuOZK5Q4sHY2YJXQjdck/EJCqcryKhHQiNZK6QvDndgg1Qz+M7QkTZFtj0yx6tTziFcvNYVorv6361HXtzzXGILqb0YLLXWp1cV98NXeZNomtPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746229946; c=relaxed/simple;
	bh=WDRNOCYo2jJlSRVkWUeczKWPdChCLb1xesEuGZJfdDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fvAHL8MeihwSYSWmfru8J3MK9Hdgdf/DWoZ5QoT9F5fyf99esvrj8i7ITuzBBU2shYUCrnmmtHyY98Pus8fXjrpn624W7iiV+gYNsB80AgXcYalkf7xitBi2DStIFHaPCpJ4IW1kM0NrT4waeVwyShvmx6BMMvBhb+sYSs40AIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HxX3d9/P; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HxX3d9/P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=uFtmLkJAfyba1DIaEeZdfcvwwLxleLFpxAegkPpfQOU=; b=HxX3d9/PkcOEjGWr
	AVGvGWNAQe65VVz/BFg3f6M9K6slB53pWSUXkDN0NP4LcRj4R46lBd/c/eupfIV81oqGxOrgdpWS+
	sWa6FPTlXYEu4EzWX11ocyZg8N3LGiRuPXGdF4Xt4hwWqcPS/f+hT39jSo+VHXPZBCUiA68cy69HF
	fU6xPeg6FUhUFFlAr7f89y6psmeIG/r+h0fbJsQ5ZTu0zzuM3oO68VuD8vA0ZlaOvhmIiNpFsNPIa
	6WfX8ySfwXTWhju8Cb3JFTbszploGeZQa1rHNg1cG2eN/dOiQinBI4HXYHPH9h2MWymrIf9AIFc2k
	0oEp1YchwTQ73Ycsuw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uB0B3-001BML-2d;
	Fri, 02 May 2025 23:52:21 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/5] ALSA: seq: Remove unused snd_seq_queue_client_leave_cells
Date: Sat,  3 May 2025 00:52:17 +0100
Message-ID: <20250502235219.1000429-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502235219.1000429-1-linux@treblig.org>
References: <20250502235219.1000429-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of snd_seq_queue_client_leave_cells() was removed in 2018
by
commit 85d59b57be59 ("ALSA: seq: Remove superfluous
snd_seq_queue_client_leave_cells() call")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/core/seq/seq_queue.c | 16 ----------------
 sound/core/seq/seq_queue.h |  1 -
 2 files changed, 17 deletions(-)

diff --git a/sound/core/seq/seq_queue.c b/sound/core/seq/seq_queue.c
index 5df26788dda4..10add922323d 100644
--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -564,22 +564,6 @@ void snd_seq_queue_client_leave(int client)
 
 /*----------------------------------------------------------------*/
 
-/* remove cells from all queues */
-void snd_seq_queue_client_leave_cells(int client)
-{
-	int i;
-	struct snd_seq_queue *q;
-
-	for (i = 0; i < SNDRV_SEQ_MAX_QUEUES; i++) {
-		q = queueptr(i);
-		if (!q)
-			continue;
-		snd_seq_prioq_leave(q->tickq, client, 0);
-		snd_seq_prioq_leave(q->timeq, client, 0);
-		queuefree(q);
-	}
-}
-
 /* remove cells based on flush criteria */
 void snd_seq_queue_remove_cells(int client, struct snd_seq_remove_events *info)
 {
diff --git a/sound/core/seq/seq_queue.h b/sound/core/seq/seq_queue.h
index 74cc31aacdac..b81379c9af43 100644
--- a/sound/core/seq/seq_queue.h
+++ b/sound/core/seq/seq_queue.h
@@ -66,7 +66,6 @@ void snd_seq_queue_client_leave(int client);
 int snd_seq_enqueue_event(struct snd_seq_event_cell *cell, int atomic, int hop);
 
 /* Remove events */
-void snd_seq_queue_client_leave_cells(int client);
 void snd_seq_queue_remove_cells(int client, struct snd_seq_remove_events *info);
 
 /* return pointer to queue structure for specified id */
-- 
2.49.0

