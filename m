Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D4310E0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577474; cv=none; b=CsH3chl+EYZ7L8IAH/CqxU5V9hA3QYWk4hZZQZGr2XUI5UiyoeGW4D8qopAkoR4a9k7JqoChp63Jg+ZQ6Z0tpf14MC0UunWH2RqpPeNBoiF1Qq3RQFGgqxV9eCl2yStWuYAyXrIOassS0AfM4J4U+A1WBsKWARXJ8Xp6H47VPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577474; c=relaxed/simple;
	bh=blzdDaQWF+zD5GRD2+ibB8jF0RCm0czDsbvus3l4bII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hJFIte4WlADuUMFiE6sGqNajFcDM0Bc6x6NqmCdCg8YK82cVu/p9mDWbzRcmAv/D8tCXFXT0O8amg/xjZSJT5aA2epUTHiFDwlT0wKSrQbjeHW3eaV+IUmqynGsNYUgJuiDY1ikKfufruufQGWwCqsQvBs2PE08rZsQm4ndjkpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=oVFXbNiB; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="oVFXbNiB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=ZOe7yRBHh062ZypLLoU8+MZY4/JHvFw722+CD1Smm0w=; b=oVFXbNiBMV81lw9Q
	/YpMdpnZ7ML5jXaQh8DardEFZ9GLJQxwRo99iyKhWSQ96fEuQ32VxSzmPnwOPJbt41xud/0rnDPpO
	BqmHnLBjpYBLaK5g17pM5UZKrAfOhZr2PZb/Kgw3yaiYDwbRvY8BhHukj6slpkM1TFxylW+qo58Pt
	FUP06nPiAHFChWBs2VWaI6el/1We8lG1vgt+MfJ3jeRAnMVlTlwadC6fnHeRk5boG9JXzFDcFi2Rk
	0mpxDeUAuBERq/aBNyr7UYjrnJSFHfGh7ny0Wigq4gGRTxkqgbWIUT/Z33ICm5Z+q98L/T36dJkd9
	o7mxtp2jQ3kGs8vv8Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uCSaH-0021Kc-2D;
	Wed, 07 May 2025 00:24:25 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	kenneth.feng@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] AMD gpu deadcoding (S)
Date: Wed,  7 May 2025 01:24:22 +0100
Message-ID: <20250507002425.93421-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  A bunch more deadcode around the AMD GPUs.
(I've not done smu_v14 which all looks rather new
to me, so perhaps you're still intending to use
some of the unused functions).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  drm/amd/pm/smu7: Remove unused smu7_copy_bytes_from_smc
  drm/amd/pm/smu11: Remove unused smu_v11_0_get_dpm_level_range
  drm/amd/pm/smu13: Remove unused smu_v3 functions

 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.c |  36 -------
 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.h |   2 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v11_0.h  |   5 -
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  12 ---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  39 -------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 101 ------------------
 6 files changed, 195 deletions(-)

-- 
2.49.0

