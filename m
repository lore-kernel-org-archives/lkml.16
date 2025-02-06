Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59E1A2567
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864345; cv=none; b=URpkmacomkgJWHYlnNv+wdZGQ8sTd19rnInmLupB/rJ6QudnmkO8FCuiQlBMJLZnsrAo34NS+RAZP8FtLREuVg5Kigf88J/HerW/tR3C6X9uhIsheVsnkKdjYR6RWgSyLhBIB+UMYZxu4g2NpW+C8QhMYoMQ8ffJEPWd+LWaJ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864345; c=relaxed/simple;
	bh=D1s6zIroVyuhXZ+YPuxG90DaqGNyw6mttX2cwZAg+4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOM33Jr6ZI7OKvdx8sqZ34V6b5fvgcVS40yCa2uDTadunE2mgEPLga9JGKP2QZg+vFZTnwXD7hY0TR/X3lebHFY98v1Eh5v0d8wlmTWKGOAc/O3m9dxb3J6xCtNjvpDcE4z7hoFdVstbBIlrsPbmK1IvYjTLPgmSmPGafXgrJIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=CnZJuKUN; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="CnZJuKUN"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6v5hCXzlgTwF;
	Thu,  6 Feb 2025 17:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864337; x=1741456338; bh=bx+gL
	UqA4nVMCQRLYxweyfQh4Acrr7yu3A7GQLUcDqY=; b=CnZJuKUNj4/RjUnbwmEFR
	8IzWCR0116VUHVAlpdigOXg+GwMmkK46+54saK7p+BQgRiPAG4ae8ymnl7zWMbcV
	3Ow814CpIqX9+F5PEIrhti7laI9eSwDPFJ4rM8+wgZaGDfIwts7nLYCbn9EuDFpD
	uNafPNNL+lFbAIIdsdwiwbfiBuYjZvkXX09a45t2FxqvgQA69VVPtcQAuiyqDkMp
	nqf+hmGuFo9mszvBZS00kJeyZoWjuqyCuLnDcaLHpZ/P7ihDaIqM3crS6EE7pexp
	XjRH0hlGWevyFe4qB1MUCo4cJe7u7P0t4U149XOH6bwn5I0YsoOyonXr+LQK9h58
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id keWoEHXqXANp; Thu,  6 Feb 2025 17:52:17 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6l03wRzlgTy5;
	Thu,  6 Feb 2025 17:52:14 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Tao Zhou <tao.zhou1@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH RFC 20/33] drm/amdgpu: Fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:51:01 -0800
Message-ID: <20250206175114.1974171-21-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Do not unlock con->recovery_lock if it has not been locked.

This bug has been detected by the Clang thread-safety checker.

Cc: Tao Zhou <tao.zhou1@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Fixes: a8d133e625ce ("drm/amdgpu: parse legacy RAS bad page mixed with ne=
w data in various NPS modes")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
index f0924aa3f4e4..740889b71a73 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2820,8 +2820,7 @@ int amdgpu_ras_add_bad_pages(struct amdgpu_device *=
adev,
 				sizeof(struct eeprom_table_record), GFP_KERNEL);
 		if (!err_data.err_addr) {
 			dev_warn(adev->dev, "Failed to alloc UMC error address record in mca2=
pa conversion!\n");
-			ret =3D -ENOMEM;
-			goto out;
+			return -ENOMEM;
 		}
=20
 		err_rec =3D err_data.err_addr;
@@ -2927,7 +2926,7 @@ int amdgpu_ras_add_bad_pages(struct amdgpu_device *=
adev,
 free:
 	if (from_rom)
 		kfree(err_data.err_addr);
-out:
+
 	mutex_unlock(&con->recovery_lock);
=20
 	return ret;
