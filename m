Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3FD2DFF3C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252906; cv=none; b=eyQRTsOSwn0LknsvenJVfjA/Ld+C/WoB05Dq+mL4j0hPwDkGOToDl0LyVrb1pFuz71oR1kq1f25/1CDWKoa/kEJylSC3OCrAII/BhbQuoLT3sJ5EaDydvFWVSzALE9j72QN92LxfDz5Vnw2xzV1+pTip3GJ9ugCgN42OPx7dcyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252906; c=relaxed/simple;
	bh=LJOl3iVxdLqWTnYrqhGFjB6SUJ0Pn6WjK3KpdQZOJyc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BbSOZEqqBu5pcPyM4IqyKmRp62ECrES+iHLK31u+zK8hNXRQyOGI9U11houwTm9iRuyXu9V02dEc18Fl+8hHr6R7OsR/0M7StJmE+aBsv331sr35c/UZpOkHFCfhLfqkbeDoCTx+OwNo/cetz3aQ/7gRiMgnKNjgUewyWtJrqv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co; spf=pass smtp.mailfrom=rbox.co; dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b=IbgubzVf; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rbox.co header.i=@rbox.co header.b="IbgubzVf"
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1uRrzq-00CJdb-IV; Wed, 18 Jun 2025 14:34:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector2; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From; bh=ihyBf5E+gzJ5kBv9T40XlfDhBl6X2+hvJwoX0tSQLr4=
	; b=IbgubzVf8XhgT+sxWhHIoah/74KWgJuJNYwuM0mpFf0YPd17h51NwO8YUaWBnwaw3CTzUyCkw
	cRrT7Zp+1KgVxyRj5Se5xYiK6sSKcD7TgZ3opaztdoYJJ8ypJ9DTdLhsoaiXiJLDpNCNhauWcyCjv
	lkYBrIz0+zcFS1yQzWOWMsbD2b2hUSKfj4ZAG+XvfdcETEN+RCb7HD41xETAxnGoXyIKMpjq3zMC6
	/5AR0ZHUpTX579YrYby+N8Ubh+FDvgaOPtrQVDciz8rkfyR/o2l1b03h3pHSzcO0QS/Eg+kQedpMe
	1s86jzK2n4arb175Hj6clqGXGh0AddF826hSpg==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1uRrzp-0001Wj-FF; Wed, 18 Jun 2025 14:34:29 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1uRrzo-00DbRZ-7G; Wed, 18 Jun 2025 14:34:28 +0200
From: Michal Luczaj <mhal@rbox.co>
Subject: [PATCH net 0/3] vsock: Fix transport_{h2g,g2h,dgram,local} TOCTOU
 issues
Date: Wed, 18 Jun 2025 14:33:59 +0200
Message-Id: <20250618-vsock-transports-toctou-v1-0-dd2d2ede9052@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADeyUmgC/x3MwQrCMAyA4VcZORuo1eL0VWSH2kUXhGYk2RiMv
 bvF43f4/x2MlMng0e2gtLKx1IbzqYMy5foh5LEZYogppHjB1aR80TVXm0Xd0KW4LHh93dJ4LzH
 3IUGrZ6U3b//zEyo5DMfxA1tHnrluAAAA
X-Change-ID: 20250523-vsock-transports-toctou-4b75d9c2a805
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michal Luczaj <mhal@rbox.co>
X-Mailer: b4 0.14.2

transport_{h2g,g2h,dgram,local} may become NULL on vsock_core_unregister().
Make sure a poorly timed `rmmod transport` won't lead to a NULL/stale
pointer dereference.

Note that these oopses are pretty unlikely to happen in the wild. Splats
were collected after sprinkling kernel with mdelay()s.

Signed-off-by: Michal Luczaj <mhal@rbox.co>
---
Michal Luczaj (3):
      vsock: Fix transport_{h2g,g2h} TOCTOU
      vsock: Fix transport_g2h TOCTOU
      vsock: Fix transport_* TOCTOU

 net/vmw_vsock/af_vsock.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)
---
base-commit: d0fa59897e049e84432600e86df82aab3dce7aa5
change-id: 20250523-vsock-transports-toctou-4b75d9c2a805

Best regards,
-- 
Michal Luczaj <mhal@rbox.co>

