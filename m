Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA901EE7B7;
	Wed, 28 May 2025 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456636; cv=none; b=Gkn8XQfY+IAf1Cl25JBHrO6fx6ZOGLuFQQqTeNpo4oSDFfb8Aon2wGE0+3oTN0jSGp6A88h/yoapG0OmP8AlJ9RLiIIV5GtAWN+pibtXoQ9j+Y+c8S3hDv5j0TEFOVJypkTHg2At63HoOOQa3nFuycJMuyauRJoeLwHgW48Vpp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456636; c=relaxed/simple;
	bh=enDF2O25sGb/ee6lJKY2ZZOjnEtQA80nowgFOkJZplU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ezb6P728vLpnkZrcQXA4SdfQHf7iGhXHdDqegNBRJZfV8hgWILf0qJnJJmesiuKnpThvmbOmPxKG6SwmWODQH8pPjAzzNjMQImI2iTyqymg88ceMcZGGQQqplumR5t8OWdesayCcpE1uYKFgjYP74tfeQwE3/5UAU5oO4rApmEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2BBF1A2D;
	Wed, 28 May 2025 11:23:36 -0700 (PDT)
Received: from usa.arm.com (unknown [10.57.48.131])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 638B93F673;
	Wed, 28 May 2025 11:23:51 -0700 (PDT)
From: Aishwarya <aishwarya.tcv@arm.com>
To: david@redhat.com
Cc: ryan.roberts@arm.com,
	Aishwarya.TCV@arm.com,
	akpm@linux-foundation.org,
	dev.jain@arm.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mingo@redhat.com,
	peterx@redhat.com,
	shuah@kernel.org,
	Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: [PATCH v2] selftests/mm: add simple VM_PFNMAP tests based on mmap'ing /dev/mem
Date: Wed, 28 May 2025 19:23:38 +0100
Message-Id: <20250528182338.30117-1-aishwarya.tcv@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <7df6ecb7-0aa8-4f18-ba8a-ce6d095cbd42@arm.com>
References: <7df6ecb7-0aa8-4f18-ba8a-ce6d095cbd42@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi David,

I applied the patch on next-20250515 and ran the test. The issue is no
longer observed, and the test completed successfully. I can confirm
that the patch resolves the problem.

Tested-by: Aishwarya TCV <aishwarya.tcv@arm.com>

Thanks,
Aishwarya
