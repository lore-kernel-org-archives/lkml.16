Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7323C4FF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137649; cv=none; b=TIAI9fRK4SZoRJ4ju9f3/f4OAVd7QBo/Cwujnpn1eKokx8VmsAtDfjIUrc9TAA0fiZZH4w7KMxdEikcu7G99gAR6t+EG9whwKOUt4GHVuwFf7MuFTCSJGflvneZbnFblB10DEuca3WxYuvejn8l3t/QXBJcR9q/3zQ7lzkS/YmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137649; c=relaxed/simple;
	bh=f16KPRljvAN3AtCEKKFiwH06Rq/+1yZb8dTHLXjIbfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WkQ3viZ3ahYeJh3vUby+cjAbOmWYL9OFSS923f6X/oQJ9sQZX4RxIkAKbQi9U4nL1mlT2R2dFWDhDHcd2z6Me6Vkg1VYLsmHURVZKJ1FseIpKR7EeLvMTkAJT5gQDZkDsE31vjLiRMywkx7XT36Kq7vXcMEr8NFZWu+csWruiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eIhvL1GE; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eIhvL1GE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750137636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9K5D5ZXiPRFWbS+nGLMNAKczC+KTnEPotdSACiTay84=;
	b=eIhvL1GEpu/xORoIn+cstk0d64uu/MzhAF1Mo+X5WkPG5YZR9JIdptMwF6Mrrx0U/GXuat
	rpg7umWdLpZ+GMKepJSeU7u39exGDLZK99D7B2KpEJyu6OfqHBTNygHxUHN52aI6pFc5UT
	TVKi8Kr6nh1reyoTEgfo/ctidH4mYqU=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 0/2] Add nokbdwakeup quirk and enable it for MSI Claw
Date: Mon, 16 Jun 2025 22:19:28 -0700
Message-ID: <20250617051930.3376981-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patch series aims to solve an issue on the MSI Claw, a series of
handheld gaming PCs, where their volume buttons will wake the system out
of s2idle because they are registered via an i8042 keyboard device. This
is not expected behavior on a handheld device that lacks an actual
keyboard, as it is very easy to press the volume buttons while handling
the device in its suspended state. 

To solve this, introduce a new quirk based on DMI match that will disable
the wakeup property of an i8042 keyboard device and enable it for current
MSI Claw models.

Matthew Schwartz (2):
  Input: i8042 - Add nokbdwakeup quirk to stop keyboard wakeup from
    s2idle
  Input: i8042 - Disable keyboard wakeup from s2idle on MSI Claw devices

 drivers/input/serio/i8042-acpipnpio.h | 32 +++++++++++++++++++++++++--
 drivers/input/serio/i8042.c           |  8 +++++--
 2 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.49.0

