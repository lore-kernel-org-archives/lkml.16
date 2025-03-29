Received: from out187-23.us.a.mail.aliyun.com (out187-23.us.a.mail.aliyun.com [47.90.187.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98E17A2EB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.187.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743257218; cv=none; b=XmNCm1c2g0ObIQvESljFDWojBwtSVpKh/6nvaum6U2Xg6d/HbOEekwZ4L7YfxiuyIiSC1gVHoQRcEOhxLey8oi/UCYEgE2xrObd65kwT95WbjpxFwuvh3RHX17mkf6S1W2QDSdhP8jOfLxuy8H6Px36KEpkZQ27+vklUz8Lzy94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743257218; c=relaxed/simple;
	bh=DcCYikwdGv3WT+ATjYijHflCMkUsAUDXDm7XgjFVZlk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z2QtNsVxXI+PCfS3L60046QrKwJilTB/ioFn0SyELMaanlamvhINBe9i2AGmXUI5flj8dbRHDBq/jiYQvFBGxvG7+Rioz77OlmwRZX55DOMFLjmayCb4yNzJiCQK1xs5gjtCe2WC+AaNNM8Pv2hwFqUdRYg/csQ8XeyaM+p6sq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=MHc6JyiJ; arc=none smtp.client-ip=47.90.187.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="MHc6JyiJ"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1743257201; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5i/P4pBTn+YtuDGrHnFNIJANipnBlcQuFyXCKi3FGgw=;
	b=MHc6JyiJ/TX9+56BoHyJtwNYspILYsu0iKvy0i9xHQpD8Ls2TdX5MNCVgvai1zUHvfXeMxKos8DHU6ouEjipdpcuUl9lzhvKXFAfvJyNVxYOqOVzJ9yi+cMs8SLGLA8XOQwE5cRm2n4Ph5MS+9C72hT9mLFZm/NWKdA/+qfwCLE=
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com fp:SMTPD_---.c6kOeaI_1743253532 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 29 Mar 2025 21:05:33 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: linux-kernel@vger.kernel.org
Cc: "Hou Wenlong" <houwenlong.hwl@antgroup.com>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
  "Andy Lutomirski" <luto@kernel.org>,
  "Peter Zijlstra" <peterz@infradead.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Borislav Petkov" <bp@alien8.de>,
   <x86@kernel.org>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "Rik van Riel" <riel@surriel.com>
Subject: [PATCH 0/3] Fix some ASID range size calculation issues in global ASID allocation
Date: Sat, 29 Mar 2025 21:05:23 +0800
Message-Id: <cover.1743250122.git.houwenlong.hwl@antgroup.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the code review of the global ASID allocation, I found some ASID
range size calculation issues and I'm not sure if I missread.

Firstly, as described in the comments, the range for global ASIDs is
[TLB_NR_DYN_SIZE,MAX_ASID_AVAILABLE-1], which is a close interval. So
the size of range is '(MAX_ASID_AVAILABLE-1)- TLB_NR_DYN_SIZE + 1'.
However, 'global_asid_available' is set as 'MAX_ASID_AVAILABLE -
TLB_NR_DYN_ASIDS - 1', which means one ASID is missed.

The macro 'MAX_ASID_AVAILABLE', as I understand it, is used to represent
the maximum valid ASID. Thus the available ASID range described in the
comments is [0,MAX_ASID_AVAILABLE], which is a close interval too. So
the acutal size of the range is 'MAX_ASID_AVAILABLE + 1'. But it is
incorrectly used as the size of the bitmap in global ASID allocation,
leading to the maximum ASID number being excluded from global ASID
allocation.

Hou Wenlong (3):
  x86/mm: Correct the actual count of available global ASIDs
  mm/tlb: Fix wrong judgement in allocate_global_asid()
  x86/mm: Fix wrong usage of 'MAX_ASID_AVAILABLE' in global ASID
    allocation

 arch/x86/mm/tlb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

--
2.31.1

