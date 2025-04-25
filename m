Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA113B7A3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745624295; cv=none; b=WSAl8RVwSogawyKfmcN6UykoqcXq08wnMbOzsAd+5qZemmab+CdFCiU0ut7h4wKpqjLRJKEeHYHQbSmPsIjqmspFcG1dZxIDDG7QNm46zGaZ63uc8EvdXDmhKDsoW/P3kiGUQKvPlcrOPRSXEP/7VmRS+vD9TJSm/MES4gV5QcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745624295; c=relaxed/simple;
	bh=bBXE0S+pNXENLTt4NEY1ZrmeTvHC4VQlLdkgbGsAHQw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=cL36ny0R9HkFJtkkPBzph87HqrOtD+9yTe9MmItbGihXWSAEH7+B57qp5l/uawoGzu2np5jjtrjfgv5iF1SRFiSIbte1nDQjkHO0TSrb1bGz09DMopiYPLiMyP0ISraZJ+XmRg4klK35KEh7UwYRIpII26hVnMAXiM0qy19n+oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=votz5VzM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="votz5VzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1087C4CEE4;
	Fri, 25 Apr 2025 23:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745624294;
	bh=bBXE0S+pNXENLTt4NEY1ZrmeTvHC4VQlLdkgbGsAHQw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=votz5VzMXsI/gGUGcBTOD4PPK/SqxvOT6jZ1lIrQE51GryTcYvzs9KfudOJPDFYBj
	 75zQs86G0NaBmP8Hj+6YL90BRsSHcM/ICGNXMs7v711+KwUIL31EcbIizsMkjU/Uql
	 kK2RN9ofdQIhJAtwm6lV9ngyGFdOEhsvR7JqY2BQ=
Date: Fri, 25 Apr 2025 16:38:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 "Sauerwein, David" <dssauerw@amazon.de>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-Id: <20250425163813.58b72a3aa2d3ebbd96d1929e@linux-foundation.org>
In-Reply-To: <e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
References: <20250423133821.789413-1-dwmw2@infradead.org>
	<20250423133821.789413-8-dwmw2@infradead.org>
	<e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Apr 2025 17:11:10 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> Andrew - can we drop this from mm-new? It's breaking it.

I almost did, but David seems to have a fix.

--- a/include/linux/mmzone.h~mm-mm_init-use-for_each_valid_pfn-in-init_unavailable_range-fix
+++ a/include/linux/mmzone.h
@@ -2190,10 +2190,10 @@ static inline unsigned long next_valid_p
 	/*
 	 * Either every PFN within the section (or subsection for VMEMMAP) is
 	 * valid, or none of them are. So there's no point repeating the check
-	 * for every PFN; only call first_valid_pfn() the first time, and when
-	 * crossing a (sub)section boundary (i.e. !(pfn & ~PFN_VALID_MASK)).
+	 * for every PFN; only call first_valid_pfn() again when crossing a
+	 * (sub)section boundary (i.e. !(pfn & ~PAGE_{SUB,}SECTION_MASK)).
 	 */
-	if (pfn & (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
+	if (pfn & ~(IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
 		   PAGE_SUBSECTION_MASK : PAGE_SECTION_MASK))
 		return pfn;
 
_

