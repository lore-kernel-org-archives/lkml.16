Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C935968
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871738; cv=none; b=eREnATOmKtXFqtmTPJ9FjcwptrZGD7tA62K6k7LTpnzuFYvZgoyXYs2mIMBflT741JZOTVyqXlUxMKT+jCDyoTMNBKrXU77TF6B3cmQ1r94m/nOBdLksjLJQgjO4iqvnRq4BdGYh/KP/LhiWQC8gMFOoVC+Ry+KyQEsqtIjtqtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871738; c=relaxed/simple;
	bh=jkYyX5QrYNlPQg4LO+RDwsQSbIqgIsVYqXblJxyQ2+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCTOi0hXtVgPZdJ6SxJTN9hhGbjazUDpDyDVirdOzzRPGvaJN2oF8CKq1qcUCm/3kKY20WlC/8RFfdWR6ACBhbacwAxb1qIfIztxQcuXdvQkefNY9ANZcSRgQja8KfsSC1rZ7ziOjWgqtCc9Zb4TbVEZYiKk+Rme1Cl/Idf5HqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKy5TlQt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKy5TlQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC62EC4CEF0;
	Mon,  2 Jun 2025 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748871734;
	bh=jkYyX5QrYNlPQg4LO+RDwsQSbIqgIsVYqXblJxyQ2+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKy5TlQtkXufd3uJ/05+eDCZ0R5k8Ou7xsC+/Pz653VI2YlS/tRp29CGnD80+w5hL
	 wzYMXkmbBVRu2L1+ikUuYQcXWXjVr83HbEYUHW8N/wMVjOoffiFtRkKfGFFDnoQVZp
	 3xWex2RIq5wqTP0mqMMkYyiyASfp9lzNE4XVLh/cRkOD7gbT1AAGYESmR5JvzexZTS
	 4WRTel7zlNyaBJmPgDhh6i7CWkbVrXJ/6jl7L/Lf8r6TyQdbzQZj0QmZHvhmy+zmNz
	 iNjctu1VWxaNkDHzoAS7ulFokO0JRu/qv8pV0VJrSyp8trW6o1fl/FSEfA3BCPS2WR
	 9heaNnj8/j3eQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Barry Song <baohua@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry remains valid
Date: Mon,  2 Jun 2025 14:42:04 +0100
Message-Id: <174886573625.2942690.14376639867334964612.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2025 16:23:47 +0100, Ryan Roberts wrote:
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
> 
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64/mm: Close theoretical race where stale TLB entry remains valid
      https://git.kernel.org/arm64/c/4b634918384c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
