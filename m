Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06BC264FA0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113519; cv=none; b=c4Iq//hg5x2EMUod44Z274AoXOBCFrxD/F2ZB6FLGguhjBzvFlFFdiB/6AVv5JCCDXYj9E3j34INqNhp2okVj1ne+89FR7Z5Zi/FxJwgcLPj6OcoKLwOpi807bR/R50MlmiTLp+IhIV+AUbvXcjV6buGn2GQ7sjSwAgRife/Fv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113519; c=relaxed/simple;
	bh=f6OoNKVv9TyXDe47B1Z1BsUp/mVa+6MG255CEPyvQb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SibXNHQiyQKXpR6LTK4+pkkZDH7NLx4EmBCRiozxUMY+4CEje0PqWd0V5UkW1+8Bd/Jf4z6HOzZHi91rwLrmwUR7GhAV/PpNK/xfqMN3sbX17SCYUmP2/9H05t5T29MajW3PkoW4FMD755HbqfHOhVdsmTDZF+fUN1ZDmawEAA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8FCBB298566;
	Tue,  8 Apr 2025 13:58:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id liuurCCdGSTC; Tue,  8 Apr 2025 13:58:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3C51E29858E;
	Tue,  8 Apr 2025 13:58:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DJPaWBNLH8jq; Tue,  8 Apr 2025 13:58:34 +0200 (CEST)
Received: from anvil.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id E8F0C298566;
	Tue,  8 Apr 2025 13:58:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux@weissschuh.net,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] Docs/ABI: Fix sysfs-kernel-address_bits path
Date: Tue,  8 Apr 2025 13:58:21 +0200
Message-ID: <20250408115823.1358597-1-richard@nod.at>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It's address_bits, not address_bit.

Fixes: 00142bfd5a91 ("kernels/ksysfs.c: export kernel address bits")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 Documentation/ABI/testing/sysfs-kernel-address_bits | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-address_bits b/Docume=
ntation/ABI/testing/sysfs-kernel-address_bits
index 5d09ff84d4d6..3b72e48086aa 100644
--- a/Documentation/ABI/testing/sysfs-kernel-address_bits
+++ b/Documentation/ABI/testing/sysfs-kernel-address_bits
@@ -1,4 +1,4 @@
-What:		/sys/kernel/address_bit
+What:		/sys/kernel/address_bits
 Date:		May 2023
 KernelVersion:	6.3
 Contact:	Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
--=20
2.48.1

