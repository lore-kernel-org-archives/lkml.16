Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089B4501A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864481; cv=none; b=t2NqQkz6360tzaMuTAwW4jJeEHXcSLnY+9r2Aye8n19bQfiIv5MpvP8nqxYFwl8hMuqqzxkCJbTzunw8eJi5Tc11xk3nT4Db4bTInXbhV7nFq8CofBA4Ohq37hDKyFP9dNNjvOWyXIIcnWhfe8YWaXo+jA8EB6d6ZAdbd9dq7wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864481; c=relaxed/simple;
	bh=tSWCU5y49XiL1c3oWIxdBzIvWyn6Jye02tKZZJ8ztdE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wv+XySBYM7UDRBKk12tpftLdh58jnxr9fuILaGKhEh1a7Fe3HHg7kwQ3rlWg6Lm3yeSdaml/bJG6tqBu9BiY1g/YlF2r+EqhK08seO61fgJ6L4jyMaOMeMc9KZAfQ1nV5m1FF348NqhsR1nwpHjabGZlynqQSOgJZrTawHooGmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSvlWe/d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSvlWe/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A67C4CEEA;
	Wed, 25 Jun 2025 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864480;
	bh=tSWCU5y49XiL1c3oWIxdBzIvWyn6Jye02tKZZJ8ztdE=;
	h=From:Subject:Date:To:Cc:From;
	b=aSvlWe/dTnG25YAeE5DLuWI8VfxXVzW3rcVZYqVIzWutKLXOE17Sap4Khh1nm2ku9
	 VUmcI+0WZvFoJe0q7xGyVci3HnHFO8BYdPllQdlJR68RTWZy8UEGB3pB9Bk6wJmqSL
	 UwCSBErucsJJtDKpv1RNieHcWYMBEUNNsT93oohJnFqmQCcA6EW5zQ4TiHnLJ4uIpV
	 f7Xb9XFVkVVKD5Mh7xR/K9n6CCe0KDOIwIh7BGzIfWdQIeHfiuLgO7RZB5ZwYxFE9b
	 SKt6d2ESZnMxEhZL7cABJpxAjuk83Kkoba3NrBdvo9WBBxPxfTpc+9+rtxQe3ImpT+
	 m5UCOjLU7oZpQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/3] drm/tests: edid: Improve our kunit EDIDs
Date: Wed, 25 Jun 2025 17:14:34 +0200
Message-Id: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFoSXGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNT3ZSiXN3SgpTEklTd1JTMFF1TS4NkYwuLpFTz5CQloK6CotS0zAq
 widGxtbUA8Oe4AmEAAAA=
X-Change-ID: 20250625-drm-update-edid-590c388be7cb
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=690; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tSWCU5y49XiL1c3oWIxdBzIvWyn6Jye02tKZZJ8ztdE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkxQjGffpV+2sPWWjNTPC9oMf/llxeZg+O91JgmPOPe5
 bvleVxxx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIZAdjfem1JxsVGSLUT95f
 32LXKdJq6cvZfD0+t4Evcp3zrpNF16dOCz4jmqm99MqzhOsSSyynM9aXzCw9Kb011LLh0ayHeVO
 m5nJzrGTisPu0q9LVup/9yo0LdyYcsfp3fYWUucT5V+slzukCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi, 

Here's a series fixing a few issues I found looking into our kunit EDIDs
some more.

Let me know what you think,
Maxime 

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (3):
      drm/tests: edid: Fix monitor range limits
      drm/tests: edid: Update CTA-861 HDMI Vendor Specific Data Block
      drm/tests: edid: Add edid-decode --check output

 drivers/gpu/drm/tests/drm_kunit_edid.h | 142 ++++++++++++++++++++++-----------
 1 file changed, 94 insertions(+), 48 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250625-drm-update-edid-590c388be7cb

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

