Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F99528A1EA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637313; cv=none; b=hO+xOSMPO8OuD5VGqGotNXTOSmzVHzgaJwVg20TnsRJN22vEeXn04crSQGnXwnKlZ4sltCIvAn57/ItUkILQMtwVQIRUFcpS2Yo3hI6Lm4XHoPE5kjOQSvQuvL9YKREwvSEn/G5Is4KoFZg7KjUSU1+CMtmeRLhIQmMWT1m5C5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637313; c=relaxed/simple;
	bh=9bWNxWnLfc2mzOVLIrjaL1gONjyfguUWRQ4raXz6YHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z+UWKGHEEUBEJPEAn3hTiEHc1RI6W/wR18yiI9Ovd9h9a6iExmRdTjLgYnfj6Hi0BO1pzRb4DL92fNKY5GYXT0xieZdOIdQ+t+BZYdPxQYT5/qPuqM1t+6xLYeZxzJxxuGRSMYwE98Yd/Aj+LEI2I5sriT0yw2oYxyGhUn7CYrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HxLHpG/B; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HxLHpG/B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=tv/2C9kUFFhHmEsxaXVMRgJCCX3yR9ZaEvaUp7YMgy4=; b=HxLHpG/BEFH0fRxN
	Y8S5kO07JOHJFj8IGSF/Zhv6Utf7x5Vy5jTplODz8KX6ynXlXWRHKoggTt63gMBIpt7PC3SDw6MP8
	SQcSwdWR1Vb8PnouPSTZ58XtFQzavVY7dBLI6FmB/PyZ4CnfjUe05lm8o33HdrgHKVPxdfTMxMjNS
	YsOumqCgsE1nVTtQforqRMMwBLEJ6D+vZZNevTp9rMQu1IxHpHyO2O/swMQEctZ+kl2bH2t7McHDG
	7mCGid/rV7efGXLMEK1HWVdSqfopzzLWtt9B1AR0Mc/5QtraUAkzR7RrseGlOQ5cyPuTzRayIsEl2
	q4aEyx8dlsXwzFPsPg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uCi9S-002EIU-0H;
	Wed, 07 May 2025 17:01:46 +0000
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
Subject: [PATCH 0/3] AMD gpu deadcoding (S more)
Date: Wed,  7 May 2025 18:01:42 +0100
Message-ID: <20250507170145.102508-1-linux@treblig.org>
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
  A few more AMD deadcoding patches spinning out of the
questions I asked, and Kenneth answered.

See:
  https://lore.kernel.org/all/DM4PR12MB5165D85BD85BC8FC8BF7A3B48E88A@DM4PR12MB5165.namprd12.prod.outlook.com/

Dave

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  drm/amd/pm/smu13: Remove unused smu_v13_0_init_display_count
  drm/amd/pm: Remove unused smu_mode2_reset_is_support
  drm/amd/pm: Remove remainder of mode2_reset_is_support

 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c           | 13 -------------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h       |  5 -----
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h        |  2 --
 .../gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c |  6 ------
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c  |  6 ------
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c      | 12 ------------
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c    |  6 ------
 7 files changed, 50 deletions(-)

-- 
2.49.0

