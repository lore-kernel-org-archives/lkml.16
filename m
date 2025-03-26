Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C00926463F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743026152; cv=none; b=aY1DGjt2gjjzB3ymNvYDAJHW3gTQNIPu0vSOrIoE/vyNAM23kLIbbiDz0iHZ2Rat6jZQdcOI6bRGoO2rJ3is++WrfgcZ0Jpa281mwByWUrTBH3vzAGNPVgMr2KG4rNIoVp9wv94pRpF7rpIT7yqqg385pTDb2kPtae3lCc4wDKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743026152; c=relaxed/simple;
	bh=SzziP89tCGEHyDtzJTLHLnqVoT+w7Ty3PtYb2M84ylA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYb5xEcmMumn1PK+Moj56ox75TDZ3FeIhFyjreyB6RN2YWnFpv/9Yo68ZN7AvQ8b9EyclHkYUhRp3IPmEN4eB3T0gY9ouzrL0W6H9Y7AGFbl4U23kp2TzqGOChQw7d2+tOHIjncYYxgtG4Y9Yt+RlF2dtaOyUbN4HhmpBeZnKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4wLbf5i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4wLbf5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BCAC4CEE5;
	Wed, 26 Mar 2025 21:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743026152;
	bh=SzziP89tCGEHyDtzJTLHLnqVoT+w7Ty3PtYb2M84ylA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n4wLbf5iZU4ePYVuhJfkJrpFxfOLXKrxt+w6zupjVSfDJBbFnV8aBNXnsb2XdmYkd
	 XaGMt6n9tzvtbdvI8iRl8DJTxHE8zeSu7bYnL83wou3nQYBLuUjwQpgZkQSwSyIhwn
	 uRJocJTk4B2Ep4WLnPKkm01vlkS7h6QLk2l6eZ6HCL+04g6YQqmSg8UtK6Jz3nZCj/
	 ODA8/wa+vH3momlu5vZC+IEdUcK9NH7B7Al+YDTSlF2SoAoQ0NLAe3trqKGGDNfPdk
	 xOpDMQnxBlFJ4bebWv5xjbNj4n9bTlITgtGcMLC1ZP0R80Chj+CSuGNlqV9wM/M7Xu
	 NAs6vvYTtZTfQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] MAINTAINERS: mm: add entry for execmem
Date: Wed, 26 Mar 2025 23:55:39 +0200
Message-ID: <20250326215541.1809379-3-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326215541.1809379-1-rppt@kernel.org>
References: <20250326215541.1809379-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c05b46732fe2..baff55807a65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15200,6 +15200,14 @@ F:	tools/mm/
 F:	tools/testing/selftests/mm/
 N:	include/linux/page[-_]*
 
+MEMORY MANAGEMENT - EXECMEM
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Mike Rapoport <rppt@kernel.org>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/execmem.h
+F:	mm/execmem.c
+
 MEMORY MANAGEMENT - USERFAULTFD
 M:	Andrew Morton <akpm@linux-foundation.org>
 R:	Peter Xu <peterx@redhat.com>
-- 
2.47.2

