Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0405D1DFCB
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751238351; cv=none; b=oFbjSNp2aR6jtJwHiLIAgJLJnFbJgQuNLbYnQ6VF2GbIKu5NGHYgdQZSIv4rUcdhYJvade7h27DafeqOYMQyfO0FKt4+acwPt97PHArOoC5cM2j0rq+9g28RWJQYK8Isu9PwP2b3uKYoTbuQRKPBWyhZwZBs78ipb4pTGypAS7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751238351; c=relaxed/simple;
	bh=W82owXpwGpTGovuRtiMl4ETQSnevrtiA8edoKdquAuc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UBYCui+Duk3AdxS6JXUus0fv+MJvpOHEwrvnnrxWiNQxV8ynymIpQtbAM+VWkryv/rIOFVJbAe4hBqAsNyf5GGLN5fveGfHTmCgp+YuayiASpKuvkstDzorciLVEfL3KbFi26ZElgY2jM8riZdFXtwG2HxkCLArrqWT5nNByVD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=tF6VIh2N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="tF6VIh2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92564C4CEEB;
	Sun, 29 Jun 2025 23:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751238350;
	bh=W82owXpwGpTGovuRtiMl4ETQSnevrtiA8edoKdquAuc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tF6VIh2NGztTz8j/GldWe58g5f5QqvEyYmFNuGIA72367L4gYrgGcHFfR5sGvT1NN
	 jcOJ7lRGh4r+rmQ5QhfztpZqqdv5uOnaI+jq1hjgCXRmZClbK2H96DHL3hvyD+7g8O
	 8xcy4nIKS0qqfTGgGd3shk0pT49MogJn4ynP4DOI=
Date: Sun, 29 Jun 2025 16:05:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
Message-Id: <20250629160549.da922e78d202c510a1ec68f8@linux-foundation.org>
In-Reply-To: <20250628113435.46678-1-dev.jain@arm.com>
References: <20250628113435.46678-1-dev.jain@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 28 Jun 2025 17:04:31 +0530 Dev Jain <dev.jain@arm.com> wrote:

> This patchset optimizes the mprotect() system call for large folios
> by PTE-batching. No issues were observed with mm-selftests, build
> tested on x86_64.

um what.  Seems to claim that "selftests still compiles after I messed
with stuff", which isn't very impressive ;)  Please clarify?

> We use the following test cases to measure performance, mprotect()'ing
> the mapped memory to read-only then read-write 40 times:
> 
> Test case 1: Mapping 1G of memory, touching it to get PMD-THPs, then
> pte-mapping those THPs
> Test case 2: Mapping 1G of memory with 64K mTHPs
> Test case 3: Mapping 1G of memory with 4K pages
> 
> Average execution time on arm64, Apple M3:
> Before the patchset:
> T1: 7.9 seconds   T2: 7.9 seconds   T3: 4.2 seconds
> 
> After the patchset:
> T1: 2.1 seconds   T2: 2.2 seconds   T3: 4.3 seconds

Well that's tasty.

> Observing T1/T2 and T3 before the patchset, we also remove the regression
> introduced by ptep_get() on a contpte block. And, for large folios we get
> an almost 74% performance improvement, albeit the trade-off being a slight
> degradation in the small folio case.
> 

