Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1854618BC2F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743026148; cv=none; b=sH7ujzZSVOCQu6ApO5fBTGWQsRdBZo3hKp8/WZqb+tiZYVL0NetozVuloBW5io5Hsx9G1f47k1zHcMkxQ6KRhUrXlP3tQiCiqUX+l6jhvgHteZTZbe3QjPZuEmXBPWskyey7LDwQjEvePq6CNvQApWeLvNrRnCpcOH9F5UGHZ7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743026148; c=relaxed/simple;
	bh=F0w2CXWVoXuUp+5B6WgMQ7rT/dv3HeRDWXE4VOVA0Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4buzH3jtb7kWw2/pFW7xqqfoAtJhMm2Q2AXg/tK8a2SkvI54AlPMA6LYGrQT/nfPPAGieH59CzCbxQ6T1cvceZM85QdUhq+mHFmhiJJgW3I9CcG/2WisaNMfRjyUNGm1im1V4K76Ay/7oVaswQgbvIltBTWkMpSYe2yXo1sWCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCC+0IKG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCC+0IKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FA9C4CEED;
	Wed, 26 Mar 2025 21:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743026147;
	bh=F0w2CXWVoXuUp+5B6WgMQ7rT/dv3HeRDWXE4VOVA0Nk=;
	h=From:To:Cc:Subject:Date:From;
	b=oCC+0IKGZ7wLefnqsUaMQgpFQC9mZocbOpjwCK40kazAiKTKDKS0DoPXe+LVJkUgS
	 RsVn9q8lE6w9VRVu8BVIafaC+eEwVtGpbDldCTpdACOreqjS+ERRKnsOtA/VzwbDQH
	 Y4tJR0ONsvekysVc8nXM8Ap3w/JnSujFBvDmehPb1NTyJv5dM5Efa9qnxXeOqWa9NW
	 eDREjsWJrwx7OBbty7B2JLFkcA+ReHjhwRef04ofq4lzt1mDZAqUSsQyEYvdxLl8EH
	 oFXpr6jbuoBvmbgpYtqrmoXUbcUezsXswbwlMthJLL3qZqoYvy3FYshXnH2Q80cSCQ
	 Oj3eJIqdLVnrQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] MAINTAINERS: add my isub-entries to MM part.
Date: Wed, 26 Mar 2025 23:55:37 +0200
Message-ID: <20250326215541.1809379-1-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

Following discussion at LSF/MM/BPF I'm adding execmem, secretmem and
numa memblocks sub-entries for MEMORY MANAGEMENT in MAINTAINERS.

The changes for USERFAULTFD entry are fixups that can be folded into the
original patch if Peter does not mind.

Mike Rapoport (Microsoft) (4):
  MAINTAINERS: fixup USERFAULTFD entry
  MAINTAINERS: mm: add entry for execmem
  MAINTAINERS: mm: add entry for numa memblocks and numa emulation
  MAINTAINERS: mm: add entry for secretmem

 MAINTAINERS | 50 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 11 deletions(-)


base-commit: 87f556baedc9cca2edb318efe9d8cf009d916c4d
-- 
2.47.2

