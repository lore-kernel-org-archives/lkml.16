Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274F043164
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002884; cv=none; b=u2f1L4oZfkDUYGcglYIKvXQJWYtMNOTcC8I1qVNdkfCW7vz/cMxaFb70/U0Rs8nCBZASGgM2G2Y42m8hIfkR0I1fCh1x7ZYpBWlmtz0XuKGKyAu9i49ZJGoHfsvrGayUNSbIXsCpHE6VvHsvfI5bNCAm0/c188muWN3Pvetv+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002884; c=relaxed/simple;
	bh=Z9vBFsm8I/jdoiTfyHX7YHc5KqBEeLkSRsNV19eHBsI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mIEhugL6lamclLACz9uvvJoBZDNryYwuRuhvH6Uxfu5mpd368Ljf7lN4aq4XHEoN7tm9tUhm0HGr6aCLXSPhDfLvCjkzMvj6mY5Cg6aPqTKglYJA4e3JMkw4zwly+cjMS4I0S+TIgpRAnkB5v3HLEmHqYvpET00seGCjQOF7KKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baxO10XP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baxO10XP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39546C4CEE9;
	Fri, 23 May 2025 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748002883;
	bh=Z9vBFsm8I/jdoiTfyHX7YHc5KqBEeLkSRsNV19eHBsI=;
	h=From:To:Cc:Subject:Date:From;
	b=baxO10XP5P5uqFQ8NYATR+rKI1qS/j3jD+4vRJ5uIo9aaGaVkoMjPsIs5bc+Xiz3Z
	 QJpWHMUdmucvcSkkOL15mCGQ4wp2yTGD4qIcPhb8GMLH2UsdsvAFXxtxVgcqtrLTvE
	 maQmzEkBIYQc5Q0lKQM0ymwnW2GGN1dP2MK/rmEs3qDmV9+nngVArFxyl9r/t2nQes
	 A1fi82jrqdOyonnj54Yv+HmN8GCsNruTE7jpySmO+CTcjXt2ZY0D9ReyAQVAhsE6Kp
	 Hh+7ijaCq2fwGwOTXKopl4kuJbUW6hvv/uted8SAAty+qybJSro41EquxzDaRyR97Y
	 6qFgfAfJtaUeA==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] MAINTAINER: Update URL for linux-tpmdd-test
Date: Fri, 23 May 2025 15:21:16 +0300
Message-Id: <20250523122116.22104-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of consolidating my kernel testing to Gitlab (also because keyutils
is maintained there), update to a new Gitlab URL for linux-tpmdd-test.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d48dd6726fe6..8443cd2221c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24633,7 +24633,7 @@ M:	Jarkko Sakkinen <jarkko@kernel.org>
 R:	Jason Gunthorpe <jgg@ziepe.ca>
 L:	linux-integrity@vger.kernel.org
 S:	Maintained
-W:	https://codeberg.org/jarkko/linux-tpmdd-test
+W:	https://gitlab.com/jarkkojs/linux-tpmdd-test
 Q:	https://patchwork.kernel.org/project/linux-integrity/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
 F:	Documentation/devicetree/bindings/tpm/
-- 
2.39.5

