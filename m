Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDFE1E50E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820791; cv=none; b=fjffyulxiwH9OT3MZfBYb8S9VXmNO+9kmOMB9h5p7Vg76/dEZLzc4yqxWf17niCm5eVX0nxIRcnopthUJc2bMOwj7X5qDpJUNxTZghYsgWumZUTR+P/dElYR6pgkqpNw9mqKDS8HY4Yifc6BksUtuRIbGv6uLOFuAkJIiTbsyHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820791; c=relaxed/simple;
	bh=QL2aWl2xPGVWIPtgmBn1Yjy9CR98m5Xhk0v5CSpRdcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L+zvp9U+VqzJIFiE6X3vD81zrmI9/QXzhbw/aSD3wAPelWIK+igQFAaWaYRHzMVVzioMUNTONn4mEp8OeZwdR+VKIKnQoBvJOS9m2mgyHYk6UGp38kuP1Vo1GOzSkCYb5Wp/7x77QzykPig29NzzRG6Z1VtGGlTdYLHvwNX+X7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCzD0KgY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCzD0KgY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52659C4CEE3;
	Fri, 13 Jun 2025 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749820790;
	bh=QL2aWl2xPGVWIPtgmBn1Yjy9CR98m5Xhk0v5CSpRdcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=LCzD0KgYLwTP5iR/0RIE1JgR1qHs/q9lINdhEffI3GAwMfcuWsVi6NLmMfSWTacfG
	 hkXXvVsq6tze++Pctn5wGOQuYi2AjOn395ZNBy3gFS6fAOx2+FH4ZHbaIRhJzNskOh
	 lwxwOqcSdNksRe/etPrUD4NGrvtxfKAW4qoojdWUzQzrAqYQYc6FemnbYYe/UUGQiJ
	 m0EjEUB80KiFR3zznNaQ4h7OiNYlDUyhGdj+hQBlCrjBV6xjlA+Yt+arN68m82k5Gj
	 v1t1AQ+ka8g0S5rB1VBCQThasqAiJjf42ruCrKRNCFzkllkMldxQlGubS4WdbxkvcW
	 34czo/Cdv4+KQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH] MAINTAINERS: add linux-mm@ list to Kexec Handover
Date: Fri, 13 Jun 2025 15:19:14 +0200
Message-ID: <20250613131917.4488-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

Along with kexec, KHO also has parts dealing with memory management,
like page/folio initialization, memblock, and preserving/unpreserving
memory for next kernel. Copy linux-mm@ to KHO patches so the right set
of eyes can look at changes to those parts.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 99fbde0077927..7a0bc21d906bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13346,6 +13346,7 @@ M:	Alexander Graf <graf@amazon.com>
 M:	Mike Rapoport <rppt@kernel.org>
 M:	Changyuan Lyu <changyuanl@google.com>
 L:	kexec@lists.infradead.org
+L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/admin-guide/mm/kho.rst
 F:	Documentation/core-api/kho/*
-- 
2.47.1

