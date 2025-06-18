Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F91B0437
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750214909; cv=none; b=bb3mthFYbIQoA+pIPASSDbHw4L3WkptXR5Q4KLfJVmZwHGy7rgnZm8F4Euxh3EBAnmFuNILKm6KVDbP6DneslaBadiO6YrcvsH3HddMIvHu+O9obs48/Ai78QCRWDsPGute4ClsK3gNRYqgkiGhBhl6UttxRey6adVVy2DuTdms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750214909; c=relaxed/simple;
	bh=X4pc9lwwDRAl0z3l3Y3+JuQCViO5dg/Mml3TyWvpUrk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D+/+kwViry3v9VploRdKO45w0G0ef1gQOYOJL+k2wDdBXjDOUsFyMYwgGnILMxco6GCLB4eExi5rP3XHC/w5OrV5lr782CW9BD/ZydzyaTFAlieyVrLayGC9tkUN0e/7cJn60lgNoFeThzDpv6BhVnNXY4TvvPwLeQdcUO/m5ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oLlNUOaB; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oLlNUOaB"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750214905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rou2dwqmWEng6cwfOcR2iZ0nOUT0XunMcLVdhNJgvDk=;
	b=oLlNUOaB3fknleHlPYrTEMUO54lBR8fZFBGk8Ddd2VizzuiBC9TeE/HDAURGWS4+8DsbzL
	JkBfcnn+Jjli1gen8uDP9n5EshMj/c7XR6YBTAr38RqzLBXyKEPBjMURLpv6cK5seI/r+r
	AaxmOReXIG+Ir8LJ1t9lVKfF9Aw0iHo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] MAINTAINERS: Update maintainers for HugeTLB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250617185910.471406-1-osalvador@suse.de>
Date: Wed, 18 Jun 2025 10:47:48 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <5275EF3C-2759-4575-86E2-84CEFF6C6CFF@linux.dev>
References: <20250617185910.471406-1-osalvador@suse.de>
To: Oscar Salvador <osalvador@suse.de>
X-Migadu-Flow: FLOW_OUT



> On Jun 18, 2025, at 02:59, Oscar Salvador <osalvador@suse.de> wrote:
> 
> Change my role to Maintainer as I am quite involved in HugeTLB development,
> and will be more so with the upcoming HugetLB-pagewalk unification, so I
> would like to help Munchun take care of the code.
> Besides, having two people will help in offloading some pressure.
> 
> Also add David as a Reviewer since he has quite some knowledge in the field
> and has already provided valuable feedback.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Acked-by: Muchun Song <muchun.song@linux.dev>

Thanks

