Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855921E0E13
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448077; cv=none; b=pA4fluRdOhzuuif/FdtmAq0wC4OYzSUZwvM8rB6RUON0t0Ni0eVCvQKW8ICOTqeDz83FTAePUJ9wuME2lroNblYwjMG8DABsyCtUfEDdSpxkcUUlXHlWErUz7Jo5j7LfXb1J7N//NIEN//5zdC8RBcEnC1L04iW+AFR2FKcJvGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448077; c=relaxed/simple;
	bh=FqGkVPBLkWs7duAPOpc+xO9RHLQHVjSaEbcGAhsL48M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEbiDQue+xYXb2002pBKL5Rb3bcxc2GsGV7wgKeVEFwhnnPBacN4AuuqxDGqIcSK4AOuwqYvIN5wMoQc/3Rpbr1lErtVmnTUZlQJm0h2Sy5Ef/uISbYCaCrDvG+VmWgYICWBaZX3ixRfEu1P3Gq00snQPf0kNjjERI542bn4n0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UWPYzrW/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UWPYzrW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/UtZagbG3T/uK5
	TqNzNdEuqBMJsjG+CKy+jLJwbOUaU=; b=UWPYzrW/TKlfbpcAeo26FYIndGtsXb
	IzefAXRRC8INxMwHItZzCa4KcvkBOy8zLLXeQ9h9qYsXFcmCw45Mi9FmPlpDJYTF
	1k9RtnKoz/MyWEYvoSlaCxBqRLYXUAGXQkzONKd6kTWELCL2DDWLxiylCoriGIzi
	uZ2VFH6YMyfiIU7OidruuNBWnK2R5LSe/Bw+tJ6RGQ0FD6T5rmJsnBWlEmbHpPKE
	7miOahJqFQlbucqgGgG3wR5seTMs7tZcFtiuGNnS7kOY3SFhFqCb1D+M1HzscZnp
	W6Sa9Oh4APqImTHY9kl0/MeOd1QBqyNN+k/mVwxfglFYiVpyKLcEe1Jw==
Received: (qmail 1349266 invoked from network); 31 Mar 2025 21:07:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 21:07:43 +0200
X-UD-Smtp-Session: l3s3148p1@3Kl2IqgxROEgAQnoAEJMAK1XZKOIHRkS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH] MAINTAINERS: delete email for Shiraz Hashim
Date: Mon, 31 Mar 2025 21:06:42 +0200
Message-ID: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The email address bounced. I couldn't find a newer one in recent git
history (last activity 9 years ago), so delete this email entry.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9bb1db9979f1..32f15c2ce531 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22627,7 +22627,6 @@ F:	drivers/accessibility/speakup/
 
 SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT
 M:	Viresh Kumar <vireshk@kernel.org>
-M:	Shiraz Hashim <shiraz.linux.kernel@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	soc@lists.linux.dev
 S:	Maintained
-- 
2.47.2

