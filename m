Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70B230BD0
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635405; cv=none; b=nRyu9KBHDFPkTXYQVCTuf2sIpnKdNQRJN66NgQt2IJolbBw+fcge2c99xeTqgm1zSdO9UoGfs1hcZRw2joy9jJn3kspH9LhzKOpPCd7Uf/V1MUhIPfTEEXAm4tjdKGozZ3b47wGK/hO/tKAAHG7rQ38oTYaS0VPzgHLF3ii7DcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635405; c=relaxed/simple;
	bh=bNUPz70hUdTY/+4NoZbAa1PY+jtSHeygov0tPSZlKSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKAOH/aMJwA5jlSu9DUOqCeWHtWQ2+NDLW2TRxx0Gg2WHF+NJ0DLzF1Ds5LLXPgQmSVvdHUH2MsnBZHct/odPqp2eZ1FUuSk0SC7z9PfBwg/AbpyyoEfTgHHEeP4CE6vHTCmg2+9TnGrbp+cIw3fkliFcl/wgtt3YMxx63/kA1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XoxBXffC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoxBXffC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748635403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ji8vBXxmUlH3SByGHyn62HMLhQDFaED7+XduPIJj2Yw=;
	b=XoxBXffCSAOoJhnLjddR5pWuR/ysqMbtTnBRsOCwpoi7LPRnTGigP9l/L3qSF9TLMxDqw5
	WyYKgRElFL91Z20fDVEheqZcVenYz7VxDvtImn6vxt6idrSdggl3kMtxCf0fkTC34GjyTt
	y/U67jYF1Rbucwav0UVjmW07oRcyzbE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-9c4XJIs3Pkmj00gu8Gl0Sw-1; Fri,
 30 May 2025 16:03:21 -0400
X-MC-Unique: 9c4XJIs3Pkmj00gu8Gl0Sw-1
X-Mimecast-MFC-AGG-ID: 9c4XJIs3Pkmj00gu8Gl0Sw_1748635400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D821195608A;
	Fri, 30 May 2025 20:03:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.162])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C50171954191;
	Fri, 30 May 2025 20:03:18 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 1/3] kernel/nsproxy: remove unnecessary guard in validate_nsset()
Date: Fri, 30 May 2025 16:03:04 -0400
Message-ID: <20250530200305.85319-3-jsavitz@redhat.com>
In-Reply-To: <20250530200305.85319-2-jsavitz@redhat.com>
References: <20250530200305.85319-2-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

By the same logic as commit 5caa2d89b7f1 ("kernel/nsproxy: remove
unnecessary guards"), remove the guard around put_pid_ns() in
validate_nsset() as put_pid_ns() already performs the NULL check.

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 kernel/nsproxy.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 5f31fdff8a38..be89e006e6aa 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -481,8 +481,7 @@ static int validate_nsset(struct nsset *nsset, struct pid *pid)
 #endif
 
 out:
-	if (pid_ns)
-		put_pid_ns(pid_ns);
+	put_pid_ns(pid_ns);
 	if (nsp)
 		put_nsproxy(nsp);
 	put_user_ns(user_ns);
-- 
2.45.2

