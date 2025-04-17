Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895791B6D08
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864541; cv=none; b=TJLp9ogHDkS8AAzFJ5iXs75xsg2oqcq3/lAWHkYPEe1OMKMlwewoT4FTWsTW2cM8ruXVx211ORmiuI9cu+Sjk+1Vo6BagpuTVrmtRwz73nxHOR5B/vNhGYd66O+TVhtspd8DqUzt7wpPBa82Nc3NS5vp20HmdHK4PEWI4+vqnCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864541; c=relaxed/simple;
	bh=hAM7je+z6OhJoZDOw541Lcf6flKOl4JvfWLznaipbmE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K64z7NChvWwHjHwFjM1vyWhNfzB9CwT8yOnH7L6u4tqRGfoH6pVD3fzOnlB4Tb5PHNZmePbpl1z04jmNJmCubcfeLv3et+uR6vQrnD/TZCXtE3yJpiR2zfZ6yMA+shWixEB8SV2nFd5KLo+m/x3ByHath7TbXxtkdPaIwGp35t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 53H4ZO8I073778;
	Thu, 17 Apr 2025 12:35:24 +0800 (+08)
	(envelope-from Xuewen.Yan@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4ZdQ5W6r0Pz2K25JB;
	Thu, 17 Apr 2025 12:34:07 +0800 (CST)
Received: from BJ10918NBW01.spreadtrum.com (10.0.73.73) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 17 Apr 2025 12:35:21 +0800
From: Xuewen Yan <xuewen.yan@unisoc.com>
To: <vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
        <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>
CC: <rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
        <vschneid@redhat.com>, <hongyan.xia2@arm.com>,
        <linux-kernel@vger.kernel.org>, <ke.wang@unisoc.com>,
        <di.shen@unisoc.com>, <xuewen.yan94@gmail.com>,
        <kprateek.nayak@amd.com>, <kuyo.chang@mediatek.com>,
        <juju.sung@mediatek.com>, <qyousef@layalina.io>
Subject: [PATCH V3 0/2] sched: Align uclamp and util_est
Date: Thu, 17 Apr 2025 12:34:55 +0800
Message-ID: <20250417043457.10632-1-xuewen.yan@unisoc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL:SHSQR01.spreadtrum.com 53H4ZO8I073778

Now, both uclamp and util_est have been adapted for DELAYED_DEQUEUE,
and the double enqueue/dequeue issue no longer exists.
However, there is still room for optimization in both uclamp and util_est.
Previous discussions as following:
https://lore.kernel.org/all/CAB8ipk8pEvOtCm-d0o1rsekwxPWUHk9iBGtt9TLTWW-iWTQKiA@mail.gmail.com/
https://lore.kernel.org/all/84441660bef0a5e67fd09dc3787178d0276dad31.1740664400.git.hongyan.xia2@arm.com/T/#u
https://lore.kernel.org/all/CAB8ipk9LpbiUDnbcV6+59+Sa=Ai7tFzO===mpLD3obNdV4=J-A@mail.gmail.com/T/#u
https://lore.kernel.org/all/aa8baf67-a8ec-4ad8-a6a8-afdcd7036771@arm.com/
https://lore.kernel.org/all/20250325014733.18405-1-xuewen.yan@unisoc.com/

patch[1]: Simply the condition for util_est_dequeue/enqueue; 
patch[2] aligns uclamp and util_est and call before freq update to improve
the performance and power.

Xuewen Yan (2):
  sched/util_est: Simply the condition for util_est_dequeue/enqueue
  sched/uclamp: Align uclamp and util_est and call before freq update

 kernel/sched/core.c | 17 ++++++++++-------
 kernel/sched/fair.c |  4 ++--
 2 files changed, 12 insertions(+), 9 deletions(-)

---
v3:
- split previous patch in 2 patches.
 
v2:
- simply the util-est's en/dequeue check;
---
-- 
2.25.1

