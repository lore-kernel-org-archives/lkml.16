Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C31A2393
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864342; cv=none; b=fCym0R3itlduXGialo9KD4lZL9EAAJ3RXYZl4iHkj++rjLAlkENALrpYz/BxmYmD+IBkDGwIq9VlnyPt/3XkaxyrvMlwIbe1WS+dobrh9TTqBa3zQj3VaEFRi57L2VGUtPVtqlnOuWglspogxMuodwsOoEzQdbRiF2q7Tn68FVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864342; c=relaxed/simple;
	bh=KwLia4Gck5DwZzqPB9B+JkSil8Txx3IWqpZMhqiKKs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5Q0R5jOF5GFmqcIEyKUxAoLuPsdNOnHAsHQGhNaJmQeNs888C8YCBmIsGUJwl6zXEDx1SV/mJxw7kDc1Bwj7HobxLCrHymrYeBDWVCDv8/AWMUDjmugauS3GRlPR/0qaEN+G2ThKGD+tcy4xDVf7V84ZRLsXH4Pi+QjqY8P0nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=2lr+6HCF; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="2lr+6HCF"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6s0kSSzlgTtt;
	Thu,  6 Feb 2025 17:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864334; x=1741456335; bh=mw3iX
	vKWs6mZ2oRT7U139PljHiChkcfQtdX/j6Z6+TU=; b=2lr+6HCFkG83bkAIyHOH5
	hiUaIB/GyVJDN2XsHu8hLQQQtjzf2ol6+WvpuhIGysFJqd+T4l8nFlJhjViOWnCY
	s2e8ZzlwLKdE3wBKjCM9247oYejTEcXP2hZcUCnSIHZr1OnBzJFHZAcGvtIlRrjd
	P3sj1x19og536u0S+Aju9LnpC20yHijrFVKRJm8yv/jvHDURZmq01qPsRwy8ZH6C
	CTmqtKjZDvFR+qGUcvASYr3PYAXtziuQMra2E8FPhwyLGuDXaclsWPiULKJXb1X8
	66zcZOoGmMYkbmlW4ZSjMyjqxnHpqySAlSGgsEa4UMe3mu2kGOminJVsupgH81mA
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Pw1jULBuNDYo; Thu,  6 Feb 2025 17:52:14 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6g6gh3zlgTtf;
	Thu,  6 Feb 2025 17:52:11 +0000 (UTC)
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
	Yang Wang <kevinyang.wang@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH RFC 19/33] drm/amdgpu: Unlock a mutex before destroying it
Date: Thu,  6 Feb 2025 09:51:00 -0800
Message-ID: <20250206175114.1974171-20-bvanassche@acm.org>
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

Mutexes must be unlocked before these are destroyed. This has been detect=
ed
by the Clang thread-safety analyzer.

Cc: Yang Wang <kevinyang.wang@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Fixes: f5e4cc8461c4 ("drm/amdgpu: implement RAS ACA driver framework")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_aca.c
index 9d6345146495..069b004f941e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -572,6 +572,7 @@ static void aca_error_fini(struct aca_error *aerr)
 		aca_bank_error_remove(aerr, bank_error);
=20
 out_unlock:
+	mutex_unlock(&aerr->lock);
 	mutex_destroy(&aerr->lock);
 }
=20
