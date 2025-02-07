Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6210023C8B4
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738955220; cv=pass; b=O4WcV+SuRn3TqTClPEqcJPkEnoM1cY6lCBf+nv2FZAbEtpAM63dEHo7esa0nAFRypL5l2DRdNJ6zwKe6DPTWVvqgklfHNdAqsaJ+0UJIsuv/zNfzQGOyBwzQutvKMf00EVBQa3rzHBYf+cslA09gTOjz1EObtF4+kxrtMP9VERo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738955220; c=relaxed/simple;
	bh=lO8OUsKRIjUnAPdlIj7AK58m+QTgg+zlZphQ6a3JjVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cawnM6qma+Lo+kcOTNAat4o1mxKJcG4flA8xSStjIoqTsrptNjCNHJ6PEwyVN+r8IfJ/6fTVh7yUzppkc9aypN6IrZcgr122hKkuNCyMcpIGRM9IldfLemyBXIpCRaQi1EB+WCnDQ2chcP1bZ1/5hp4yGsb2+mVOXfO8Lvbu/jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=ZmoBmPJr; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="ZmoBmPJr"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A8A7C1A4B5A;
	Fri,  7 Feb 2025 19:06:57 +0000 (UTC)
Received: from pdx1-sub0-mail-a311.dreamhost.com (100-126-221-226.trex-nlb.outbound.svc.cluster.local [100.126.221.226])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id B1B081A47BD;
	Fri,  7 Feb 2025 19:06:56 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738955217; a=rsa-sha256;
	cv=none;
	b=A5oFwym0jFAjufwIThzNbtzS+inIi7thY853ikaqVdrd6tGGm9Q1hA2z0DOQkuKz3pPfHm
	X7rPHWx1K4FFCgZdqUIV+w74SzFPQ785c0g6nCV/ypu3+Fy3JfetieFSPSEELVxHuK5rmt
	fA8XIaPdYzsNsfDoLYsmJ8o1M8s1pBG8sjs3SQqBx3Iqn9U1KPTxe/mFy0Uco8ObtKuMNp
	sCQ9+3Yvof8kPt/M38xcyF/yqgbg8kRCMUpr3eNmZWDJXYQ/p22NFlnfmhYcI5PaASTzcu
	kajfc7mBcZP1ks/I8CZsL1XvPYH8P/siC7jraUcXOiQ9y7ZjdwFcGQA0upV+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738955217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=y9ZVzTIynyCcvuECIWXnJaYZt7TfAR7IJxQ+MS6iWgs=;
	b=OqrnNmKXebMJRj3YP94DADgc7xkzZomWlQNjTj4NCFZZOls0kWbF1WGnvi+AZm7iQeGqHW
	GWhOY2PQiUIWS/wISdiJJ5cYRNKfAqRQerEnn6ZvK0oL5hd+ND6p6bwJDxRHVfiKH+fPIj
	qLRJFCDAPy74XBiUCCMp+V6VfLmO2EqAvMTh+I/KLwQnBbsW8gipoc+/0UiE/30pNdt3ZX
	58+jKb0ZBrJFagGMOd5pf08ynSbrn+rqR+EHD9kGhypKG7q+eq4p5t/vvBWArRKQ58V7b0
	oqzlub4DaYiGca+k1Ha5qBy6w5RA8y8AcNAzftP3EcxZsDg0W5pYgdP5Nh+pFA==
ARC-Authentication-Results: i=1;
	rspamd-587f8d7697-l5xwh;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Abiding-Thread: 0792cc8c59fd190c_1738955217544_2368620000
X-MC-Loop-Signature: 1738955217544:1337459757
X-MC-Ingress-Time: 1738955217544
Received: from pdx1-sub0-mail-a311.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.126.221.226 (trex/7.0.2);
	Fri, 07 Feb 2025 19:06:57 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a311.dreamhost.com (Postfix) with ESMTPSA id 4YqNkQ1z7Zz3S;
	Fri,  7 Feb 2025 11:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1738955216;
	bh=y9ZVzTIynyCcvuECIWXnJaYZt7TfAR7IJxQ+MS6iWgs=;
	h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	b=ZmoBmPJr6WiGEqM7Ytf0dHTIIIECi4KJcPDCCqy1KJFfMqiLz7kr48IJESUsfQ51l
	 EGncwPjMwwKcx82E6APWX81vCo4qmzT8QJ/ThIJmKTi+Y7XZBLuXOJTkN3kr2mPsns
	 iwkYBQWn/Cov9lPHccIXYAy2PKtPrlkE/Jj72xsogo3SLaOXLpN7KCf+bJtj3WWBSz
	 Fp+Q/H1k8b9rwcToguoL6SdE1zoDZDdcIv2y9FqY88W9NT1cGTJjLgDu3Cdg4xSouP
	 +njISAkRn+eFQXtce1m5CH+fY78toitk5jc1aUUnrHEMCO+Ph99X97IRfLGuaG8z1U
	 VoOLqAZweLuIw==
Date: Fri, 7 Feb 2025 11:06:51 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Raghavendra K T <raghavendra.kt@amd.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, lsf-pc@lists.linux-foundation.org,
	bharata@amd.com, gourry@gourry.net, nehagholkar@meta.com,
	abhishekd@meta.com, nphamcs@gmail.com, hannes@cmpxchg.org,
	feng.tang@intel.com, kbusch@meta.com, Hasan.Maruf@amd.com,
	sj@kernel.org, david@redhat.com, willy@infradead.org,
	k.shutemov@gmail.com, mgorman@techsingularity.net, vbabka@suse.cz,
	hughd@google.com, rientjes@google.com, shy828301@gmail.com,
	liam.howlett@oracle.com, peterz@infradead.org, mingo@redhat.com,
	nadav.amit@gmail.com, shivankg@amd.com, ziy@nvidia.com,
	jhubbard@nvidia.com, AneeshKumar.KizhakeVeetil@arm.com,
	linux-kernel@vger.kernel.org, jon.grimm@amd.com,
	santosh.shukla@amd.com, Michael.Day@amd.com, riel@surriel.com,
	weixugc@google.com, leesuyeon0506@gmail.com, honggyu.kim@sk.com,
	leillc@google.com, kmanaouil.dev@gmail.com, rppt@kernel.org,
	dave.hansen@intel.com, dongjoo.linux.dev@gmail.com
Subject: Re: [LSF/MM/BPF TOPIC] Overhauling hot page detection and promotion
 based on PTE A bit scanning
Message-ID: <20250207190651.hpmkzl4f2zynqiun@offworld>
Mail-Followup-To: "Huang, Ying" <ying.huang@linux.alibaba.com>,
	Raghavendra K T <raghavendra.kt@amd.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, lsf-pc@lists.linux-foundation.org,
	bharata@amd.com, gourry@gourry.net, nehagholkar@meta.com,
	abhishekd@meta.com, nphamcs@gmail.com, hannes@cmpxchg.org,
	feng.tang@intel.com, kbusch@meta.com, Hasan.Maruf@amd.com,
	sj@kernel.org, david@redhat.com, willy@infradead.org,
	k.shutemov@gmail.com, mgorman@techsingularity.net, vbabka@suse.cz,
	hughd@google.com, rientjes@google.com, shy828301@gmail.com,
	liam.howlett@oracle.com, peterz@infradead.org, mingo@redhat.com,
	nadav.amit@gmail.com, shivankg@amd.com, ziy@nvidia.com,
	jhubbard@nvidia.com, AneeshKumar.KizhakeVeetil@arm.com,
	linux-kernel@vger.kernel.org, jon.grimm@amd.com,
	santosh.shukla@amd.com, Michael.Day@amd.com, riel@surriel.com,
	weixugc@google.com, leesuyeon0506@gmail.com, honggyu.kim@sk.com,
	leillc@google.com, kmanaouil.dev@gmail.com, rppt@kernel.org,
	dave.hansen@intel.com, dongjoo.linux.dev@gmail.com
References: <20250123105721.424117-1-raghavendra.kt@amd.com>
 <87o6zub978.fsf@DESKTOP-5N7EMDA>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87o6zub978.fsf@DESKTOP-5N7EMDA>
User-Agent: NeoMutt/20220429

On Sun, 26 Jan 2025, Huang, Ying wrote:

>Hi, Raghavendra,
>
>Raghavendra K T <raghavendra.kt@amd.com> writes:
>
>> Bharata and I would like to propose the following topic for LSFMM.
>>
>> Topic: Overhauling hot page detection and promotion based on PTE A bit s=
canning.
>>
>> In the Linux kernel, hot page information can potentially be obtained fr=
om
>> multiple sources:
>>
>> a. PROT_NONE faults (NUMA balancing)
>> b. PTE Access bit (LRU scanning)
>> c. Hardware provided page hotness info (like AMD IBS)
>>
>> This information is further used to migrate (or promote) pages from slow=
 memory
>> tier to top tier to increase performance.
>>
>> In the current hot page promotion mechanism, all the activities includin=
g the
>> process address space scanning, NUMA hint fault handling and page migrat=
ion are
>> performed in the process context. i.e., scanning overhead is borne by the
>> applications.
>>
>> I had recently posted a patch [1] to improve this in the context of slow=
-tier
>> page promotion. Here, Scanning is done by a global kernel thread which r=
outinely
>> scans all the processes' address spaces and checks for accesses by readi=
ng the
>> PTE A bit. The hot pages thus identified are maintained in list and subs=
equently
>> are promoted to a default top-tier node. Thus, the approach pushes overh=
ead of
>> scanning, NUMA hint faults and migrations off from process context.

It seems that overall having a global view of hot memory is where folks are=
 leaning
towards. In the past we have discussed an external thread to harvest inform=
ation
=66rom different sources and do the corresponding migration. I think your w=
ork is a
step in this direction (and shows promising numbers), but I'm not sure if i=
t should
be doing the scanning part, as opposed to just receive the information and =
migrate
(according to some policy based on a wider system view of what is hot; ie: =
what CHMU
says is hot might not be so hot to the rest of the system, or as is pointed=
 out
below, workload based, as priorities).

>
>This has been discussed before too.  For example, in the following thread
>
>https://lore.kernel.org/all/20200417100633.GU20730@hirez.programming.kicks=
-ass.net/T/
>
>The drawbacks of asynchronous scanning including
>
>- The CPU cycles used are not charged properly
>
>- There may be no idle CPU cycles to use
>
>- The scanning CPU may be not near the workload CPUs enough

One approach we experimented with was doing only the page migration asynchr=
onously,
leaving the scanning to the task context, which also knows the dest numa no=
de.
Results showed that page fault latencies were reduced without affecting ben=
chmark
performance. Of course busy systems are an issue, as the window between ser=
vicing
the fault and actually making it available to the user in fast memory is en=
larged.

>It's better to involve Mel and Peter in the discussion for this.
>
>> The topic was presented in the MM alignment session hosted by David Rien=
tjes [2].
>> The topic also finds a mention in S J Park's LSFMM proposal [3].
>>
>> Here is the list of potential discussion points:
>> 1. Other improvements and enhancements to PTE A bit scanning approach. U=
se of
>> multiple kernel threads, throttling improvements, promotion policies, pe=
r-process
>> opt-in via prctl, virtual vs physical address based scanning, tuning hot=
 page
>> detection algorithm etc.
>
>One drawback of physical address based scanning is that it's hard to
>apply some workload specific policy.  For example, if a low priority
>workload has many relatively hot pages, while a high priority workload
>has many relative warm (not so hot) pages.  We need to promote the warm
>pages in the high priority workload, while physcial address based
>scanning may report the hot pages in the low priority workload.  Right?
>
>> 2. Possibility of maintaining single source of truth for page hotness th=
at would
>> maintain hot page information from multiple sources and let other sub-sy=
stems
>> use that info.
>>
>> 3. Discuss how hardware provided hotness info (like AMD IBS) can further=
 aid
>> promotion. Bharata had posted an RFC [4] on this a while back.
>>
>> 4. Overlap with DAMON and potential reuse.
>>
>> Links:
>>
>> [1] https://lore.kernel.org/all/20241201153818.2633616-1-raghavendra.kt@=
amd.com/
>> [2] https://lore.kernel.org/linux-mm/20241226012833.rmmbkws4wdhzdht6@ed.=
ac.uk/T/
>> [3] https://lore.kernel.org/lkml/Z4XUoWlU-UgRik18@gourry-fedora-PF4VCD3F=
/T/
>> [4] https://lore.kernel.org/lkml/20230208073533.715-2-bharata@amd.com/
>>
>
>---
>Best Regards,
>Huang, Ying
>
