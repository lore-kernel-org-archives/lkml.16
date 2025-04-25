Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E0019D8A7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577597; cv=none; b=Ec98ZC+sgjoP57K4M5iz1ZXdVe6Ntfmlr5UBhrkQ+qmDxkFTLzy6U825XDUZDrp5l6H3tuys3GXB6CLzbSmFq2dWfFgY1M052DloMVyn+7V6DG2mMsRNd8TXaV0qXJ/OYsAUwLv3swn+VT6iW9mYmEQ72Krr3/oL1rAcFpCA8AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577597; c=relaxed/simple;
	bh=Wn2IFrbXdFPmEpzGY18CoT4rKXVhilgdLjMaQcdkPAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNbDVPlllkHzFEHmvpO0VY5GAo/qsyl1tlkNgAkJh1ezLJ9OLXkWNN5ALcX/oSvZWDsrJnthHHS0V1e/5PTraemNbFgvra4SE1d7PZBXzjVOhGkaCDtyLMjhZv/o3DXDk4atQOEF0VO/xKEiKmZIX4trHrR21l4ikcQCoef6ko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TDU2QVKi; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TDU2QVKi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wFgyGoe57F6uPaGc/OoKHjDR32N+rhdNNm/Oo8lcYDQ=; b=TDU2QVKiwb3RRppyElAZvCLneG
	OEl+y7zYuafHRmIBYHsH8H+V42VKiRuW7Htl/3O9lRFR2ep18foEWvZwNl+d/sjWsFlt8JLeW/Uzw
	P2RrlaQ5XMg/+BDiEec5Vn2mXU7v3Kc430pamBO1gtyYGDl6qzHMuiMNB2Lj5kcNxhUf8z/UISTyr
	PwSDEqRpZcFlm+uZeMRZXd5IAQh0nea/AjeMLthAgxX5CryKDmv/71mv6cKGjcT+2NXvluk4Bnxpx
	jDiO12Fn+mvdqeCGJuFmduvSHuryPOJqos663GSBQ9syxqpESHKUbQK7U89DVigHExEIpSjBGEdRM
	mk7TLJzw==;
Received: from 114-44-196-209.dynamic-ip.hinet.net ([114.44.196.209] helo=gavin-HP-Z840-Workstation..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u8GSx-008HIu-Oe; Fri, 25 Apr 2025 12:39:32 +0200
From: Gavin Guo <gavinguo@igalia.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: gshan@redhat.com,
	david@redhat.com,
	willy@infradead.org,
	ziy@nvidia.com,
	linmiaohe@huawei.com,
	hughd@google.com,
	revest@google.com,
	kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Clean up split_huge_pmd_locked() and remove unnecessary folio pointers
Date: Fri, 25 Apr 2025 18:38:57 +0800
Message-ID: <20250425103859.825879-1-gavinguo@igalia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series enhance the folio verification by leveraging the
existing page_vma_mapped_walk() mechanism and removing redundant
folio pointers passing.

Link: https://lore.kernel.org/all/98d1d195-7821-4627-b518-83103ade56c0@redhat.com/
Link: https://lore.kernel.org/all/91599a3c-e69e-4d79-bac5-5013c96203d7@redhat.com/

Gavin Guo (2):
  mm/huge_memory: Adjust try_to_migrate_one() and
    split_huge_pmd_locked()
  mm/huge_memory: Remove useless folio pointers passing

 include/linux/huge_mm.h | 15 +++++++--------
 mm/huge_memory.c        | 37 ++++++++++---------------------------
 mm/memory.c             |  4 ++--
 mm/mprotect.c           |  2 +-
 mm/rmap.c               | 20 ++++++++++----------
 5 files changed, 30 insertions(+), 48 deletions(-)

V1 -> V2:
  1). Separate the logic into
    - Adjust try_to_migrate_one() and split_huge_pmd_locked
    - Remove useless folio pointers passing

  2). Remove the unnecessary comments and brances around if condition. 

base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
prerequisite-patch-id: 9c9c975b11ad0f73acd863049b4f1732caa04e53
-- 
2.43.0

