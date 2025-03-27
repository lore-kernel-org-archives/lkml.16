Received: from mta-65-138.flowmailer.net (mta-65-138.flowmailer.net [185.136.65.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC7733985
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743146902; cv=none; b=Ht13AmvEyx6mH/gJj3iS+RNzrD5e8PJQ/qKTZ8aHLFsqAQZ54WSi69vUlD0+mSW9yqKHp2uxSPeWpBNjsaMG7t/NOhzqGfgBH4ylQPv/Y29O5aoyI88PiEgMLHbXn9fFfPsGIVMLKZyakQ6hy2HF+EKEVtpJDs+dlXADuP7G05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743146902; c=relaxed/simple;
	bh=xS9M60GsLwwabDVlYXg18HsVdahK+BCJQyhYNBMmeZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qwMMWwd14M+IDyqvBoZGYDcB0cLh/yT3lbEs4qwavN0N71UPYICEwdaBZaa66B81y9JiijgJ2IGmvlM/gsuPL7ll3ZeA6KXjJg51UJ0QglYOt+FNZmnFBoPJVeV8uHXGamxm7lt4YFfSJLXQ1WSUFi9GTulGjnxo0MB3kagIFog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com; dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.b=oCSn+EwZ; dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.b=BcQppq/T; arc=none smtp.client-ip=185.136.65.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=errorhandling.siemens-energy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=flowmailer.net header.i=@flowmailer.net header.b="oCSn+EwZ";
	dkim=pass (2048-bit key) header.d=siemens-energy.com header.i=schuster.simon@siemens-energy.com header.b="BcQppq/T"
Received: by mta-65-138.flowmailer.net with ESMTPSA id 2025032713472338dcdd83140019fd15
        for <linux-kernel@vger.kernel.org>;
        Thu, 27 Mar 2025 14:47:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=s1;
 d=flowmailer.net;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:Date:Message-ID:MIME-Version;
 bh=yRjQOtEQw7tKoK5pjP8XWCOwT5Yvp+cdAQiMZYYSISg=;
 b=oCSn+EwZHWqSsrqRev8I5Er22SXzgADN2lQj7EBP/8C8QMhllnPkMj5FroZGLIPTDBkKk5
 kNYE08foKAo9UZwSfMd/W7OfkheSteZSa5zmW8y+fhmzCQwjpyzhKhkWCQwMkUPujgdKr9R3
 ZdIsND7JRKcw8Y7IcuWNXAFcb4KbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm3;
 d=siemens-energy.com; i=schuster.simon@siemens-energy.com;
 h=from:from:sender:to:to:cc:cc:subject:subject:content-type:content-type:content-transfer-encoding:Date:Message-ID:MIME-Version;
 bh=yRjQOtEQw7tKoK5pjP8XWCOwT5Yvp+cdAQiMZYYSISg=;
 b=BcQppq/TSpGmKZlFrnEBSGu1jNMW2th3SsHmXUMyddTOhSODzOnw3f+p1qf54n5zPv2/YJ
 l3+eQzsqtUFVRo1mRmW4smSWqqbAG9k6w8Q3Y1QJk+pCFsdFJAzdsxMoDq02BcTwvc+8w41a
 vR9r2WZ3BJEETeTvi6VUtCMty7RiVD4SiA7wB4vFB2BQv0SNsHbFDpMsHCn4KHoZlKgHUdxK
 jcEGFTisqi75XIVnzKEi2/HJvNgu7sJZaEzQqar4C9IpCwNBdLXZ7TJmnIJe6VCEzXY/BUjE
 EXJPcjf0K3LNrdRAM5YYowjThf/ax2aC/5/ydFfCaVuzsvXq+NT3pzzA==;
Date: Thu, 27 Mar 2025 14:47:21 +0100
From: Simon Schuster <schuster.simon@siemens-energy.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Oetken <andreas.oetken@siemens-energy.com>,
	Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>,
	linux-kernel@vger.kernel.org,
	Simon Schuster <schuster.simon@siemens-energy.com>
Subject: [PATCH 0/2] arch/nios2: Address spurious page faults
Message-ID: 
 <fm-32642-2025032713472338dcdd83140019fd15-kduNDQ@errorhandling.siemens-energy.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On nios2, we have observed instances where a single process can get
stuck in an infinite loop of repeated page faults for a single address.

To invalidate an existing mapping, nios2 replaces the TLB entry for the
virtual address with an invalid dummy (mmu pid 0, physical address 0x0,
all permissions set to invalid).
However, this may conflict with actual, existing mappings for that
virtual address within the address space associated with mmu pid 0,
which will then repeatedly fault until the conflicting entry is
preempted from TLB.

The issue is partially masked by sufficient paging activity in the
system which eventually replaces one of the conflicting entries with a
valid mapping for a different mmu pid. Yet, in the case of low paging
activity (e.g., during early boot), this does not happen reliably,
causing the process to hang.

The commits in this series address this issue in two ways:
- By ensuring that TLB entries are updated from their corresponding
  page-table entry on TLB permission violations as these can be caused
  by an invalidation/dummy entry (PATCH 1/2)

- By not introducing duplicate TLB entries for mmu pid 0. Instead,
  invalidation maintains mmu pid because the pair <mmu pid, virtual
  address> is unique in the current TLB state (PATCH 2/2)

Please see the commit messages in the individual patches for details.

The patches were tested to successfully boot on nios2 hardware on top of
linux-next commit eb4bc4b07f66.

Simon Schuster (2):
  nios2: force update_mmu_cache on spurious tlb-permission--related
    pagefaults
  nios2: do not introduce conflicting mappings when flushing tlb entries

 arch/nios2/include/asm/pgtable.h | 16 ++++++++++++++++
 arch/nios2/mm/tlb.c              | 18 +++++++++++-------
 2 files changed, 27 insertions(+), 7 deletions(-)

-- 
2.39.5

