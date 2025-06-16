Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA052AD00
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750044117; cv=none; b=VBKTa6Iw7rVb3tGjBag7sVYjwNPAT61zAyVDoIUQwpe08kaCGTb3ldlgfzQcJ4pJ5IxpPtvInDR43BfdHUOwkaqOh6zUBzSgxkKfRlC0N/+Yf73VbBkewQyxLNtTq9zFQYPXdsx37MAUJiP7rGvZoEoSwZMBG9/hvfQMllDKWPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750044117; c=relaxed/simple;
	bh=6E/TAwSrDBBg6AWve3hoWIYXQKQekN5nts6/rcdaST4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzF62JKiBAQikOTzDmAP03iSfJXIm9Z9h1pVgu90F3NyrlOMxwYE8aFMXkgZnyERbjlLHpIF9WOSBimoJEve8A4kXE+RGwoJ09ha428tSFNn0dwOt3+jzV0nMbiWdSMCWgSvcrwD7UTSeXMbmZtBa4FS8Se6XQLBROMQDY4lBoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Ega9clBs; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Ega9clBs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I0U5A7FJgi12973WypMGIo03+bwAPexjAJ02BZ8i1PI=; b=Ega9clBsN8p/W9NzQsiJRfmQ68
	Wbse4MO+epmyekIhlzuMoqF4lvHZm0RrMNwgEKCJeBWK8BchxZjARZnH0acG1vq2MoR0C+fbmuQb1
	aM5299ayxrng8Ln526B0faCJ/N1MmVg2S057AEsim6MXPKJxBrxrCPPkcfhlnm/Pw/fdLyHLmZSP2
	1cqKjMCAKyQ6W9OW0KNGRMgabTTraJvBAZpDS8IZzZJaAp35OATxnzFZQkjFxMIYoZz04knSNyZJJ
	qmplvNNioXk0swbV8YyOFFPowsDcCs+UxdT7Z0VEt66P3PzmEiBzr9rDTA7dmAOweVeHrDTx4dZji
	OPg6yjAg==;
Received: from 106-64-96-84.adsl.fetnet.net ([106.64.96.84] helo=[192.168.238.43])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uR0Pf-003wEg-1e; Mon, 16 Jun 2025 05:21:35 +0200
Message-ID: <bd137e8b-aca7-4c5d-a8a0-898a0762ccd1@igalia.com>
Date: Mon, 16 Jun 2025 11:21:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Clean up locking in hugetlb faulting code
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, David Hildenbrand
 <david@redhat.com>, James Houghton <jthoughton@google.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250602141610.173698-1-osalvador@suse.de>
Content-Language: en-US
From: Gavin Guo <gavinguo@igalia.com>
In-Reply-To: <20250602141610.173698-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oscar,

On 6/2/25 22:16, Oscar Salvador wrote:
> Hi all,
> 
> This RFC is the culmination of the discussion that happened in [1].
> TLDR: No one really knew what the locks were protecting us against, and
> whether we needed them at all.
> 
> Some reasearch showed that most of them were introduced in a time were
> truncation was not serialized with the mutex, as it is today, so we were
> relying on the lock for the page to not go away from the pagecache.
> More details can be find in patch#1.
> 
> This is for the locks, but I also started to look at the references
> we take in hugetlb_fault and hugetlb_wp as it seems to me we are taking
> more than actually needed, but that is once we manage to sort this out.
> 
> I ran hugetlb LTP tests and nothing screamed, and I also plan to run selftests
> later on.
> 
> @Galvin. Could you please run your syzkaller with this patchset applied and
> see whether you can trigger something?

Sorry for the late response. My capacity is limited in the last two 
weeks of joining an event and didn't notice the talk. And it seems 
already huge discussions and good progress. Currently, I saw the 
discussion is in another latest thread: 
https://lore.kernel.org/linux-mm/20250612134701.377855-1-osalvador@suse.de/

Please let me know if the testing is still useful.

> 
> Special thanks to David and Peter Xu that were helping out with this mess.
> 
> [1] https://lore.kernel.org/linux-mm/aDeBUXCRLRZobHq0@localhost.localdomain/T/#md02880ebc2c679678b7f326c5e9e93992428e124
> 
> Oscar Salvador (3):
>    mm, hugetlb: Clean up locking in hugetlb_fault and hugetlb_wp
>    mm, hugetlb: Update comments in hugetlb_fault
>    mm, hugetlb: Drop unlikelys from hugetlb_fault
> 
>   include/linux/hugetlb.h |  12 +++++
>   mm/hugetlb.c            | 117 +++++++++++++++++-----------------------
>   2 files changed, 62 insertions(+), 67 deletions(-)


