Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79272F3E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002271; cv=none; b=ZcohjBn4TtqIyEWlKapcET1dwv8rjtr0G6Gx2Vkr3OAZI4kzhyDhRgMQ/qWEMrWdcWX/WywpdgYGMt+Gi8wIEDKyVvlzVtqCMnhrhc880dOG8RsB4i7pjaykquJpmsqvFIbQx1dEiGcnKl8eZtO6sO4WPfuC2yF9elM9dnaB4OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002271; c=relaxed/simple;
	bh=MWq2jUupu1eW3wWnaqHmgYFNZpvntz2L5ox+Fkj5joU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k+hDz0rh9ciF1yScApxU3DNDyRQZQTXdaWj9/14j2KKJFLyYS/tAM2/1pLIqtzWDmNTpK02Ur3bgoszAhdlAm0XJucCO5Z4xeQ/Hhzd/GctPcErReepUYNXGqTdoew6EnK4Tpxiib6lYIv2C2Qxded43ayhvxF+5NCBlBM9Db4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9ECgh5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9ECgh5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE948C4CEF0;
	Fri, 23 May 2025 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748002271;
	bh=MWq2jUupu1eW3wWnaqHmgYFNZpvntz2L5ox+Fkj5joU=;
	h=From:To:Cc:Subject:Date:From;
	b=R9ECgh5dyv7ajVnmxvERuJidcZW/O+Kw8IUPeN0qE1dYNM12aWpJGKvEprSBezJ4l
	 408u53wM7gAiPeoO9x8/4vH6Hj+2LhCLL7e5To+wyAZQA/HlEIAWrOYaw9rRxWdqtY
	 QmMJBs0v10+wOyfJshyFKiAyJg6H0m7dZmP42gkoAfGzC1RQ7v4tTQNqhJ+zna5Aqh
	 7e55b5hiVG9ZWMwld+WqtSzHPaQeYtQxnUeF6j9SoM42cJWlI/hSzSRzqyyEemFPcd
	 0M+t3ysOkg6dNo5ITok0j5Hlm5+2nSptjO0s+yuzR+hys44mhj0H6o++aLGhj7W/Ld
	 QJPDDK5tOXC8A==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Antonio Quartulli <antonio@openvpn.net>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PATCH] mailmap: Add employer email address.
Date: Fri, 23 May 2025 15:11:04 +0300
Message-Id: <20250523121105.15850-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the current employer email address to mailmap.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 9531546fcac9..a885e2eefc69 100644
--- a/.mailmap
+++ b/.mailmap
@@ -313,6 +313,7 @@ Jan Glauber <jan.glauber@gmail.com> <jglauber@cavium.com>
 Jan Kuliga <jtkuliga.kdev@gmail.com> <jankul@alatek.krakow.pl>
 Jarkko Sakkinen <jarkko@kernel.org> <jarkko.sakkinen@linux.intel.com>
 Jarkko Sakkinen <jarkko@kernel.org> <jarkko@profian.com>
+Jarkko Sakkinen <jarkko@kernel.org> <jarkko.sakkinen@opinsys.com>
 Jason Gunthorpe <jgg@ziepe.ca> <jgg@mellanox.com>
 Jason Gunthorpe <jgg@ziepe.ca> <jgg@nvidia.com>
 Jason Gunthorpe <jgg@ziepe.ca> <jgunthorpe@obsidianresearch.com>
-- 
2.39.5

