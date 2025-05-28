Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F3A288C3E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441754; cv=none; b=WnzWDp66xn9RPc2oxOh4wK4nUnioss/Q7Av89+AitXlqbkFgy9Vh/pGnYK1vZ51z3sjukBbbDHL1nV9kIJ8HwaiXXgutFi4qw9lHclx98F8EoaBoaxRZ81IEts4wnao0GQ29ZqiWojv7S9mpYRscmHnigJnk9PYuULIb0dPXgfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441754; c=relaxed/simple;
	bh=DBQy4jo6CMhz0+laP75ph4Nt2uY9aLQkxx8p/xzxpBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lHrrW9zV5vmL4nvNIOtpS1KTQu4bCaCdokaIqCzwwuBLU1mIkfExhciubpLuUHe3gLbnV83BC9N575ZRmQeqSEwzwKwf0KYPC7h5Iy9RKBT2iIt8w7VwpjAHZ5dhbnsD+DmovviO3sIzBcqFVk73a5prkHmCIWX3DHT9uxdOPJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Snu4wPcE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Snu4wPcE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74E9EC4CEE3;
	Wed, 28 May 2025 14:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748441753;
	bh=DBQy4jo6CMhz0+laP75ph4Nt2uY9aLQkxx8p/xzxpBc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Snu4wPcEKodZc/fM5KOXDiBSAUe/HfStv/yW0409crV2xy9qPk2jJ9pGd4m01Aa7C
	 DBaEEGO5ZGs72J4i+k21zjdt00G3h7hwqTErJH04OBUiQpqRVZPc9FHkB6axLUhqkk
	 xsvqqrLSxG05UDBxjVVqopN/ywXv/4JmUABEnhJyiEYw95UvYJaWJ7M5d/DesCdEFZ
	 gmoRrfauKkHg/MrtuTtXMYDAPT/BhQAwWxvlrToZHp6dCAVirJYAw5rh2LVG2FDokT
	 nY8TnIyqTD5KwOPvewccTZZYzTm+QHZdiJK2URX+srRN2Lgf2itGt08eZyg7n5KPJ7
	 5Mqi5yrHnuK/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CE4C5AD49;
	Wed, 28 May 2025 14:15:53 +0000 (UTC)
From: Lorenzo Stoakes via B4 Relay <devnull+lorenzo.stoakes.oracle.com@kernel.org>
Date: Wed, 28 May 2025 15:15:39 +0100
Subject: [PATCH] tools/testing/vma: add missing function stub
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-fix-vma-test-v1-1-c8a5f533b38f@oracle.com>
X-B4-Tracking: v=1; b=H4sIAIoaN2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyML3bTMCt2y3ETdktTiEl1T8yRDY4s0I4s0EzMloJaColSgPNi46Nj
 aWgBi0eRgXgAAAA==
X-Change-ID: 20250528-fix-vma-test-57b138f28f46
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=lorenzo.stoakes@oracle.com; h=from:subject:message-id;
 bh=/hWcNyu2zzVdPtWKaUfZnsHVgBszi7eCqsh7pAsYZzg=;
 b=owGbwMvMwCUmzHegU0pdXZrxtFoSQ4a51Iwc4TXuqSqOcrbiiccWGMd4nwi7cCZ+zctrbQE/v
 ldHFU/sKGVhEONikBVTZDlcaRzdE7ii7ojXo0yYOaxMIEMYuDgFYCLbNzEyrLyw98zFvw9i+V4G
 vqiOOf/6x7RIl2cvmMVWS8k0nG179IGR4Z/AucNunizR/YtdqrsjOWUl3s0703VzacOL3RIxQnb
 z+QE=
X-Developer-Key: i=lorenzo.stoakes@oracle.com; a=openpgp;
 fpr=5BEF5562908102FB56727B7CC52D7AFE85F25509
X-Endpoint-Received: by B4 Relay for lorenzo.stoakes@oracle.com/default
 with auth_id=414
X-Original-From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reply-To: lorenzo.stoakes@oracle.com

From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

The hugetlb fix introduced in commit ee40c9920ac2 ("mm: fix copy_vma()
error handling for hugetlb mappings") mistakenly did not provide a stub for
the VMA userland testing, which results in a compile error when trying to
build this.

Provide this stub to resolve the issue.

---
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/vma/vma_internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index f6e45e62da3a6ee007b7431573f27ef5c2533865..441feb21aa5a92b7edddb07258c7f368171de15b 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -1461,4 +1461,9 @@ static inline int __call_mmap_prepare(struct file *file,
 	return file->f_op->mmap_prepare(desc);
 }
 
+static inline void fixup_hugetlb_reservations(struct vm_area_struct *vma)
+{
+	(void)vma;
+}
+
 #endif	/* __MM_VMA_INTERNAL_H */

---
base-commit: 1637eadc7fdf2fa4069a149b1e836656a3b64150
change-id: 20250528-fix-vma-test-57b138f28f46

Best regards,
-- 
Lorenzo Stoakes <lorenzo.stoakes@oracle.com>


