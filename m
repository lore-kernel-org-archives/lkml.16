Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9873204680;
	Wed, 28 May 2025 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470650; cv=none; b=F8brHBzUseHPUMYxomwBWhAkBwTLGAu5zkn67t62ventEvzIMA+WpttW1gTGOTq3lwh2C70NfZbTQzkQVZmc7u+jS+rS/d7RwI/NKVJ8BhQosp1LU/Fu6SnsKqqW0Xi5A8Mbbp9AU901XUz0t8lt5a+XjhiGUDeJPmezXCxAbaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470650; c=relaxed/simple;
	bh=zNpLWP0iLRo2SdsjN4iDx0HkI1x+t7mIhg4FFPTD5Tk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=okaPMpdMSRR88dHhooLRCpd2Nn5V5K0JD154qSDZ3IblowMfPx/JYuHQCnLkj5VnTf3YpQnZWdP2JDpIJ+TveAdOWd/w4+qQVdLlxbVhWQk6g62ARUQt/ErCrsw7DLej+nBDvZNc2PJE1Dh/zPPglWXjU5rTWJC5izVFQAJmByo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7muyCJc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7muyCJc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368E3C4CEE3;
	Wed, 28 May 2025 22:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748470649;
	bh=zNpLWP0iLRo2SdsjN4iDx0HkI1x+t7mIhg4FFPTD5Tk=;
	h=From:To:Cc:Subject:Date:From;
	b=G7muyCJcjzQJFr92jjgnWBBlpxhlTSkns9tT7dVBsYZ8p066RrwEMoBi52I4Dw0DI
	 eaRLiDhYqbn6faw+B+Y2GJED9hg08bsaHGlfETA9F75ftIxkrXqIi4OsD5QT9YrZYf
	 CsaqSf2zXr1M9TJ7oIMBiqykalOfsuUlS5XATez3+9oY1oYBUkrSTNXzSwCuLDw77P
	 mAIoJS7lnZh5pfi+61KTh5B/5D6Udfk/l7Ahoof46MrGPhVaDAeUDAObZJ7cfpg/mX
	 uxLm3Rt7vPXY3FPlpscg8hjt7CgYs1Zxxy83Afgeh3cmTznC8ByVXp36g6rIFklFa6
	 k/AeUR12dZOyg==
From: sven@kernel.org
To: soc@lists.linux.dev
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS, mailmap: update Sven Peter's email address
Date: Thu, 29 May 2025 00:17:18 +0200
Message-Id: <20250528221718.45204-1-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sven Peter <sven@kernel.org>

Update my mail address to my new @kernel.org one and also add a mailmap
entry to make sure everything gets sent there for easier filtering.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 4f7cd8e23177..7a9cd664183a 100644
--- a/.mailmap
+++ b/.mailmap
@@ -712,6 +712,7 @@ Sven Eckelmann <sven@narfation.org> <sven.eckelmann@gmx.de>
 Sven Eckelmann <sven@narfation.org> <sven.eckelmann@open-mesh.com>
 Sven Eckelmann <sven@narfation.org> <sven.eckelmann@openmesh.com>
 Sven Eckelmann <sven@narfation.org> <sven@open-mesh.com>
+Sven Peter <sven@kernel.org> <sven@svenpeter.dev>
 Takashi YOSHII <takashi.yoshii.zj@renesas.com>
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> <tamizhr@codeaurora.org>
 Taniya Das <quic_tdas@quicinc.com> <tdas@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..b389195fb9cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2251,7 +2251,7 @@ F:	sound/soc/codecs/cs42l84.*
 F:	sound/soc/codecs/ssm3515.c

 ARM/APPLE MACHINE SUPPORT
-M:	Sven Peter <sven@svenpeter.dev>
+M:	Sven Peter <sven@kernel.org>
 M:	Janne Grunau <j@jannau.net>
 R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
 R:	Neal Gompa <neal@gompa.dev>
--
2.34.1

