Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545FF1C5D77
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743542742; cv=none; b=ItSm1HTAamuyVJhir8BarJ9jN7LwAdCvBNIh03ou78J69hTgzsiZkix9477wRW+Eggqtyuw1r4M0u2iZGzC22h3WiME01Pr8eFxWEWqoK/B6Dmy3fukd0gPIVi17fp+ajFq6crTyxK7ecDt0lz2lwIK/5JYcfHW++uMJb3HvkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743542742; c=relaxed/simple;
	bh=54QxVgX0vDgvicMblfreJzIuov/RdbPVNpgnc9nMHSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bV9FqN5eGmhDjLQLMfB5Bq6OCKdfPXA4zGauS0DdVBtLgaspTvwg88veC12GGxsWas5Vx1rRnD5OYyH3udr3+jyen/aclhnaeBonDbk8S4tv4E89AJbtpU1L380YeBiEEqhU5KdBxVl6UKkyg7YDBVTpPiyRKdTKRWvbR8hr8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ9rhkQj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ9rhkQj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE845C4CEE4;
	Tue,  1 Apr 2025 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743542741;
	bh=54QxVgX0vDgvicMblfreJzIuov/RdbPVNpgnc9nMHSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kJ9rhkQjgwJy0Dry2MVrr4QfT7FfqvpyEf0tbrkkSgLZH1G9ckBp0PbsRTk9pgz1A
	 5oXxfDkwigT1IltLDjnpEax5Vpei3gqcmaC6/3S+jexySZ7u9WjxUrtjdihpVcxn3F
	 bTxMtrBTz/yVsIuBG+SH+6eh8pCN9w5qvEaRtzvAx7nQ2uPmEdv8XCC8reVEGeS2iz
	 w980o91j5s5fvEiT/EQXfEt9AZ16j2k5Ff9qcHcuFAON7e7ZjF+eKDdC4XPFNcIaGO
	 grlDVRRfCvern+cx57xbv0xqpxlMv5ZOncFKv5mJH1h5uvPsiZAeQcA57ps4QMTQhx
	 V47XETGvzUsdw==
From: SeongJae Park <sj@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 6/9] mm/memory: split non-tlb flushing part from zap_page_range_single()
Date: Tue,  1 Apr 2025 14:25:38 -0700
Message-Id: <20250401212538.81728-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <bybnnqb4fyr4odgwa5qcgcysgjqjsilptreljgamt7ocb5ue7k@s3lvdf52csbk>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 1 Apr 2025 10:03:17 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> * SeongJae Park <sj@kernel.org> [250331 22:48]:
> > On Mon, 31 Mar 2025 21:45:40 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:
> > 
> > > * SeongJae Park <sj@kernel.org> [250310 13:24]:
[...] 
> Thanks.  I don't really mind if you have anything else to name it, as
> long as it reduces the confusion.

Fully agreed and thanks again for the nice name suggestion.

[...]
> > That makes sense.  In the next revision, I will add the kernel-doc comment
> > here, but not as a valid kernel-doc comment (maybe wtarts with /* instead of
> > /**) since this function is a static function as of this patch.  On the next
> > patch that makes this non-static, I will make the comment a valid kernel-doc
> > comment with a minimum change.
> > 
> > I prefer not having a valid kernel-doc comment for static function, but that's
> > just a personal preferrence and I have no strong reason to object other way.
> > Please feel free to let me know if you prefer making it valid kernel doc
> > comment starting from this patch.
> > 
> 
> Yes, that was what I was thinking as well.

Thanks for kindly clarifying, Liam :)


Thanks,
SJ

[...]
