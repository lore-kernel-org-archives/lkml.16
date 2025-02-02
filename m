Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D81E1F19A
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 03:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738467496; cv=none; b=NAqEkP+iKo6bduTRoiNLwnkaA+yUQGV6jwXmVBkKVT4U8rOXgtjs970IOEkYn03cn96sodim54piyXYrWVaiEOk+n6LXuFC6DrZWXceFqO/rQ0HT8VTpoCK0lcoKNHH80mVUcEmVcpMLEKsil7eaubz2mfV0UnWVa/NcAIm+KTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738467496; c=relaxed/simple;
	bh=aP4S/zXXAj2wpoGXN1yF025/pJ1uNZV9l6UTV8zmrn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HI+A45QYZqqGjq9BJ9ZYnL9I3vdpoJu8r2oEN8iGDIxIp0CF0ihPeUUOVB2FSXRv4SWMfuETGVJXY0WlHYY/NTcchfumOHcDHhISv3HW546gj3YgYj7fAX4+Mv0eOfAPLfWsb0wUqX1tnKbs3Hwmk7kM9MQSsOxurQ113aRn4xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ZX+j8Ush; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ZX+j8Ush"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=b1MXno02i/KJT8BZpbYgS5auj92PDQQlbvpuIeHn/6Y=; b=ZX+j8Ush7Cy9m9OrnxVdjZ3Hhk
	EtNS6h7wLRAL0o4h1tDdZirS5q1vOAUnn7gKqb+SfwoZv6Gv5set7KfYUKVfWvq8pC4qNn0HtwG4R
	gmgYf4+LgPC5eXQVIhGMfnkiXYh1I1noK4c+xpmYwTOf/7VTw4K/a3EEA5cJor9D6OKyFnEr7Q7CP
	zV4Bp0OWX0X3dUCerigUxJvtlIKN8Ybzybew9apxbi+IgRdgMrh8wpnZA0QnPGn1QgTGP0eudo44S
	0u6ixzdzwEZoFx7qAvFEMozxEI9M23JYRsV4QePx0r8dbH3F5S1l6q9Y4UsuwSkDTVP44ct0X0uy6
	9WKlUZMg==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1teQnv-002Fgo-9M; Sun, 02 Feb 2025 04:37:57 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH] sched_ext: Fix incorrect time delta calculation in time_delta()
Date: Sun,  2 Feb 2025 12:37:48 +0900
Message-ID: <20250202033748.359169-1-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When (s64)(after - before) > 0, the code returns the result of
(s64)(after - before) > 0 while the intended result should be
(s64)(after - before). That happens because the middle operand of
the ternary operator was omitted incorrectly, returning the result of
(s64)(after - before) > 0. Thus, add the middle operand
-- (s64)(after - before) -- to return the correct time calculation.

Fixes: d07be814fc71 ("sched_ext: Add time helpers for BPF schedulers")
Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 tools/sched_ext/include/scx/common.bpf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
index f254a39b86a5..d72b60a0c582 100644
--- a/tools/sched_ext/include/scx/common.bpf.h
+++ b/tools/sched_ext/include/scx/common.bpf.h
@@ -432,7 +432,7 @@ void bpf_rcu_read_unlock(void) __ksym;
  */
 static inline s64 time_delta(u64 after, u64 before)
 {
-	return (s64)(after - before) > 0 ? : 0;
+	return (s64)(after - before) > 0 ? (s64)(after - before) : 0;
 }
 
 /**
-- 
2.48.1

