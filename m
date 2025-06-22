Received: from out0-197.mail.aliyun.com (out0-197.mail.aliyun.com [140.205.0.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FF41EBA1E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750604137; cv=none; b=lvYPwQsYBtVx+Ut7Ozg1QcZuv2mOWiHOVnax+HAzdn5vPuaRGbmctib4Ug2U4pLghR76t6uPNua9oFc455ilfnEGvT3C5qhJz4paY6zHG0CCTF9U5zU/SbuK+kDzrftZZmEco5StRCMmlO3mp7gnrokUNT4XjZijXhQ2Nihpdp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750604137; c=relaxed/simple;
	bh=0LjntTVcoSokkIVfo24mtnsrg3et4J4Cr681gOvrLv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3bjMu3QoBYM99cKomp8bBlPdclTsAfdJhs0ql/BTXP0srMORZL8sLEyeDtYTYQj/F/Sk9SBuLpl9E3wLkb4UnUzRIoqhY/vsn7WSs791/Zrn5wVSSNwuBClaSbh4U1o2dAIrOOe6dLjiLrY0Izr9H1lNpNjag8pG4C/z/FpL7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=Rni/TKgy; arc=none smtp.client-ip=140.205.0.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="Rni/TKgy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1750604132; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=2bSH+4+OQWZ47euNPmWxb1a/vXaaAs4QG/lmHRpqr0w=;
	b=Rni/TKgy1q+wIRVa3T6Sb77wwangAHT7dqROWyQ1wH2zkdQMnokHIgXgrYNHcyOpIJ0C+RZ6CnlyKPku5f8G9KlrKeeljDy7Fj0FtI1pf2gHv+YuSXl5vLqiNW6uP93vBUVQDhNr3vvwIzofqG9w6jPEs9zc3fwPA2TxgtbKeeM=
Received: from localhost(mailfrom:henry.hj@antgroup.com fp:SMTPD_---.dSuNJhd_1750604129 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 22 Jun 2025 22:55:29 +0800
From: "Henry Huang" <henry.hj@antgroup.com>
To: arighi@nvidia.com
Cc:  <changwoo@igalia.com>,
  "Henry Huang" <henry.hj@antgroup.com>,
  "=?UTF-8?B?6LCI6Ym06ZSL?=" <henry.tjf@antgroup.com>,
   <linux-kernel@vger.kernel.org>,
   <sched-ext@lists.linux.dev>,
   <tj@kernel.org>,
   <void@manifault.com>,
  "=?UTF-8?B?WWFuIFlhbihjYWlsaW5nKQ==?=" <yanyan.yan@antgroup.com>
Subject: Re: [PATCH v1] sched_ext: include SCX_OPS_TRACK_MIGRATION
Date: Sun, 22 Jun 2025 22:55:26 +0800
Message-ID: <20250622145526.21909-1-henry.hj@antgroup.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aFf59XSp_kRexHvU@gpd4>
References: <aFf59XSp_kRexHvU@gpd4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 22 Jun 2025 14:41:25 +0200, Andrea Righi wrote:
> The overall change makes sense to me. I'm wondering if we should set
> DEQUEUE_MIGRATING here when task_on_rq_migrating(p) == true (apparently the
> sched core doesn't set this flag).
> 
> In this way we can use ENQUEUE_MIGRATING and DEQUEUE_MIGRATING to
> distinguish between a migration ops.runnable/quiescent() call vs a
> "regular" one.

Thanks, I'll implement this in patch v2.

-- 
Henry

