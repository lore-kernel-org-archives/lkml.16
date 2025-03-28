Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B281DE2C3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160478; cv=none; b=aVfGgJpc+hQM3+TMyDsc+841qo8ZXi9YtuLo/sb45flxjwaJUjP6ocJyAz7U8a9Abguh09+qmskrd8Q72PruDl/pS5IJt+tQVoPcsRb/D6kF1ndKwSYZvUWzuT++JzHLcK+UEXC+Gl8i2L7AFRttJChjqesJOF760J33AGPCQ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160478; c=relaxed/simple;
	bh=ZMtrLIjKIqdXO1unvqGhz1A+7GZPvMWveUjcnHZL8Xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C/1cKx/+pV8krfugwkasDqvhYq2Edb3jlUWMCV3KQELj4OzH9GEt1PlO971tDTNnLltn2eh06f0p+FfLkbBrJ7Q3OeOmM0eWOSMTWl22dxqeodZqIoSl+wZXohpIOGL3oBpASu/7+XV40G1QWDUxOWJ4+Qr2DmlO/ZV3dU+QsEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=LucI0bkA; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="LucI0bkA"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27FDA4340A;
	Fri, 28 Mar 2025 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1743160466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q9R8yXVcBPFO5aBaLdzLxNF0s6IgeiM9Hy8NfwDTvyY=;
	b=LucI0bkAC1ILDuVQsqzsJzyzSGtizLmPNhYJ3ktHU3WHPhlVacfTZjM9hqjHGC2VAISWM6
	KhVY+z7BQeFB+lobu85Q+uCT6gpkMOva46BXUU/iX5khCFLS6+IEDrYt1LN+zk3Gb6QKyJ
	necVJ3MM+9pojDAnF2fyc18r7YoHxdZiZ1XNrYqcZ6Dh/2galZLAQOkAhvOLBh1lMnxngM
	W94DuhUO6RPmj73bAA6fmThBzR6fNmvjVjiduKqlemQOjWl5dEOJgRrzTIKSxC9LbTpdBM
	SFUgVmg9wd3OnXg9Z/vEQuOTJhiQNFIw2GWcFbyYG3DSic5p3OUE2bh0F0XeYw==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Fri, 28 Mar 2025 12:14:24 +0100
Subject: [PATCH v2] mailmap: add entry for Jean-Michel Hautbois
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-mailmap-v2-v2-1-bdc69d2193ca@yoseli.org>
X-B4-Tracking: v=1; b=H4sIAI+E5mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDYyML3dzEzJzcxALdMiNdAwsLY2PTFDNTC3NDJaCGgqLUtMwKsGHRsbW
 1AHtWCpdcAAAA
X-Change-ID: 20250328-mailmap-v2-088335d65871
To: linux-kernel@vger.kernel.org
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743160465; l=1182;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=ZMtrLIjKIqdXO1unvqGhz1A+7GZPvMWveUjcnHZL8Xo=;
 b=tCkD4eQXlk8oAe75/+goiSeWfyozi9K9UcXTowEK4Pc2YoBjh7eu7sWPY6ikt5j1M9UG/uKJu
 PUnnQ6hY6tkCPf7b7Dhmd7t+2wOIK9nbo1znIlZZkrm5PRRKfZjvPF+
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepgffgteetueetgeeuteegtedvteejveeugeeuvddugfefgeffkedtvedvfedvffehnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmeehfehfvgemfhekledumegtgeeifhemgegtfhdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemheeffhgvmehfkeeludemtgegiehfmeegtghfuddphhgvlhhopeihohhsvghlihdqhihotghtohdrhihoshgvlhhirdhorhhgpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

As recent contributions where made with the @ideasonboard.com email, any
reply would fail. Add the proper address to map this old one.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
v2: Properly specify the mail addresses
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 05a3889ae2d3dadcd9265af6b02e35f9f6095c13..03a725d0f890f8ac7c06a06a386f591116957eea 100644
--- a/.mailmap
+++ b/.mailmap
@@ -315,6 +315,7 @@ Jayachandran C <c.jayachandran@gmail.com> <jchandra@broadcom.com>
 Jayachandran C <c.jayachandran@gmail.com> <jchandra@digeo.com>
 Jayachandran C <c.jayachandran@gmail.com> <jnair@caviumnetworks.com>
 <jean-philippe@linaro.org> <jean-philippe.brucker@arm.com>
+Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> <jeanmichel.hautbois@ideasonboard.com>
 Jean Tourrilhes <jt@hpl.hp.com>
 Jeevan Shriram <quic_jshriram@quicinc.com> <jshriram@codeaurora.org>
 Jeff Garzik <jgarzik@pretzel.yyz.us>

---
base-commit: 6de5ac43b603a7cdf6adea1f53fb24b7d064f1a0
change-id: 20250328-mailmap-v2-088335d65871

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

