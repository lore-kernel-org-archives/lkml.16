Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605678F3B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558443; cv=none; b=eJZgmtpPvWiyN9j3sdPr8rxhQ4T31s5eUOrNS65Kn2pTrux/1YKU5vqEha5++hsJuVmTsr8MTeqiN4+JgXJpsuDEfR7VSwl/YuY0Fkzg3bOv2plxZl66oqcGvqm1Y9pmD2XR7LeVIzdm7lZVhYMkAqGnzu8V15K8aDmP3k5CH7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558443; c=relaxed/simple;
	bh=KuO5TpIn5aESsXHpG8Wzc3LAUnAMFnQ2x+/zq7gTMvM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cneo/PZT59PA3DlSZn09j8qG8S36mNmTuAb4bVvOEyiBMZgct7qyDJEPe5jsBguz1S+xn9BXj0UEYWNGWPb44HBZtk2SZgr3o1iqdozQvVgXWo08nrrA0tLvw2IC83xiLbKeSEcHrHa7OkoE58O7GH0ccSQI8DBnOpULuCXynw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C6X5IksM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C6X5IksM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751558440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipBKtUh/5lyabwlCkNqCTaCdfAblYBEAaDScDgBsz2U=;
	b=C6X5IksMPDNyxzcxOcYYzvsgSoMxtqICvTei00bYFG5ZJo6IeVqYH/WUNB9fvIlXzBL9Hu
	ie0zEekw1Va5iMh4hAvxUmo/i/CyZqZQGOS9GTno/aqFqEwUAfqVJ3TRaUnMbqXbTtVChu
	kkJnaz+wU5hNktdjOqYrC24xTU7rlmg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-_n0bbV3wOhC8dIRAo7ydcA-1; Thu, 03 Jul 2025 12:00:38 -0400
X-MC-Unique: _n0bbV3wOhC8dIRAo7ydcA-1
X-Mimecast-MFC-AGG-ID: _n0bbV3wOhC8dIRAo7ydcA_1751558437
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso5627883f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 09:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751558437; x=1752163237;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipBKtUh/5lyabwlCkNqCTaCdfAblYBEAaDScDgBsz2U=;
        b=SjcBIrXNwuKZELR/TJymYEZJsYdDpmCZJkMmUEPgxM0747Ko07h2HLlzT26XgSvhfH
         NiSLaMMt6AqghKpEiqv038DcawLmxqJHCbJlPVJAJcWr+H3Ux9ZUEFVAH7mSR06arrCs
         Qyz63K0TCwaGmcKPWXE7OQXkmt4m76MpJCGMIxjZ60aSyg9ikMjjHYLrAaaQ3rdy4jsc
         RHnfMPS+TPyY1JLL6ld7lzirKrlhI7+Y2Ym7Dz03C01iQ7ulHXLjB5jCJdf5gjk8j+yl
         NZAzDCWCoP/bQ7HIU1mOeOkBFV0VrmmGg4NnrTjOXsawZqrwXz9Wfo8e8HMabM0izDuD
         sPCg==
X-Forwarded-Encrypted: i=1; AJvYcCXu0g6PJwBbhG+heyLgmXc2v7YFN3KaPR5UGmiJdrvmcAGHZ0E5Cl/AMeTsUmejHcwhnlUrSF9ZiqjdbWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YybcLEtNPtYf50n7v5+aehNw/xhNIu0lQeMPIyRggzCPd8TH7bq
	tbUmcUQtHyqtZJdAEnfHwvLBsi+YIhJj4TMDPct/sjEz7GIAaot2XHxJquIK5SVH72OR7npC66I
	Hok38M8DdnDV9ZEhfki90buqs9Aaem5zgNHz6DgpUw0XmkzKJWsJbC4cb1ei9y7+TWw==
X-Gm-Gg: ASbGncvkTF6uwbWc+hRnDqfXtxFH3//e/ze52h2Wx0pNMpaEMRbW/+G+fm95n/qsNz5
	qN6/mJCDrFg2Hx4WN5Ajtip3MmnMACgmRvHtrKEs2sSfLG6wJ3ndsWNkJUpQDpFycMZSxdu9yiT
	Znak6mCFZxM2nWmDqQvtWHqtGuy4DQeNPe8eFihTruMVEO+dxJCfRFL5V2nWygxwcV7kWujqgDA
	MSQYAXY/hTdEQlyuj+5YIDEhcUCIJ6bALnWDDuUjLR+H7w0inWwzYbgH0xTJBV38d3VKS/z/W0B
	I95r6Qw4Ts1xXf3v0T8Kln2PIq4OVDQcYyVZAHWwyAZ5geqZZ/dyfz1H+Wdqw1dk4+7bWLJLl3J
	hCdXp4P4=
X-Received: by 2002:a05:6000:2582:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3b1fd74c462mr6185337f8f.8.1751558436045;
        Thu, 03 Jul 2025 09:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2LU2RcUhosdB00l3h03sLVhK9qYqEPok6ww6zp6Yq+E7+03m/8+BTrDcqaq6Oo+iVxZei6Q==
X-Received: by 2002:a05:6000:2582:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3b1fd74c462mr6185221f8f.8.1751558434875;
        Thu, 03 Jul 2025 09:00:34 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm161573f8f.11.2025.07.03.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:00:33 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Leon
 Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org
Cc: Steve Wahl <steve.wahl@hpe.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Madadi Vineeth
 Reddy <vineethr@linux.ibm.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v2] sched/fair: Use sched_domain_span() for
 topology_span_sane()
In-Reply-To: <20250630061059.1547-1-kprateek.nayak@amd.com>
References: <20250630061059.1547-1-kprateek.nayak@amd.com>
Date: Thu, 03 Jul 2025 18:00:31 +0200
Message-ID: <xhsmho6u1p8m8.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 30/06/25 06:10, K Prateek Nayak wrote:
> Leon noted a topology_span_sane() warning in their guest deployment
> starting from v6.16-rc1 [1]. Debug that followed pointed to the
> tl->mask() for the NODE domain being incorrectly resolved to that of the
> highest NUMA domain.
>
> tl->mask() for NODE is set to the sd_numa_mask() which depends on the
> global "sched_domains_curr_level" hack. "sched_domains_curr_level" is
> set to the "tl->numa_level" during tl traversal in build_sched_domains()
> calling sd_init() but was not reset before topology_span_sane().
>
> Since "tl->numa_level" still reflected the old value from
> build_sched_domains(), topology_span_sane() for the NODE domain trips
> when the span of the last NUMA domain overlaps.
>
> Instead of replicating the "sched_domains_curr_level" hack, Valentin
> suggested using the spans from the sched_domain objects constructed
> during build_sched_domains() which can also catch overlaps when the
> domain spans are fixed up by build_sched_domain().
>
> The original warning was reproducble on the follwoing NUMA topology
> reported by Leon:
>
>     $ sudo numactl -H
>     available: 5 nodes (0-4)
>     node 0 cpus: 0 1
>     node 0 size: 2927 MB
>     node 0 free: 1603 MB
>     node 1 cpus: 2 3
>     node 1 size: 3023 MB
>     node 1 free: 3008 MB
>     node 2 cpus: 4 5
>     node 2 size: 3023 MB
>     node 2 free: 3007 MB
>     node 3 cpus: 6 7
>     node 3 size: 3023 MB
>     node 3 free: 3002 MB
>     node 4 cpus: 8 9
>     node 4 size: 3022 MB
>     node 4 free: 2718 MB
>     node distances:
>     node   0   1   2   3   4
>       0:  10  39  38  37  36
>       1:  39  10  38  37  36
>       2:  38  38  10  37  36
>       3:  37  37  37  10  36
>       4:  36  36  36  36  10
>
> The above topology can be mimicked using the following QEMU cmd that was
> used to reproduce the warning and test the fix:
>
>      sudo qemu-system-x86_64 -enable-kvm -cpu host \
>      -m 20G -smp cpus=10,sockets=10 -machine q35 \
>      -object memory-backend-ram,size=4G,id=m0 \
>      -object memory-backend-ram,size=4G,id=m1 \
>      -object memory-backend-ram,size=4G,id=m2 \
>      -object memory-backend-ram,size=4G,id=m3 \
>      -object memory-backend-ram,size=4G,id=m4 \
>      -numa node,cpus=0-1,memdev=m0,nodeid=0 \
>      -numa node,cpus=2-3,memdev=m1,nodeid=1 \
>      -numa node,cpus=4-5,memdev=m2,nodeid=2 \
>      -numa node,cpus=6-7,memdev=m3,nodeid=3 \
>      -numa node,cpus=8-9,memdev=m4,nodeid=4 \
>      -numa dist,src=0,dst=1,val=39 \
>      -numa dist,src=0,dst=2,val=38 \
>      -numa dist,src=0,dst=3,val=37 \
>      -numa dist,src=0,dst=4,val=36 \
>      -numa dist,src=1,dst=0,val=39 \
>      -numa dist,src=1,dst=2,val=38 \
>      -numa dist,src=1,dst=3,val=37 \
>      -numa dist,src=1,dst=4,val=36 \
>      -numa dist,src=2,dst=0,val=38 \
>      -numa dist,src=2,dst=1,val=38 \
>      -numa dist,src=2,dst=3,val=37 \
>      -numa dist,src=2,dst=4,val=36 \
>      -numa dist,src=3,dst=0,val=37 \
>      -numa dist,src=3,dst=1,val=37 \
>      -numa dist,src=3,dst=2,val=37 \
>      -numa dist,src=3,dst=4,val=36 \
>      -numa dist,src=4,dst=0,val=36 \
>      -numa dist,src=4,dst=1,val=36 \
>      -numa dist,src=4,dst=2,val=36 \
>      -numa dist,src=4,dst=3,val=36 \
>      ...
>
> Cc: Steve Wahl <steve.wahl@hpe.com>
> Suggested-by: Valentin Schneider <vschneid@redhat.com>
> Reported-by: Leon Romanovsky <leon@kernel.org>
> Closes: https://lore.kernel.org/lkml/20250610110701.GA256154@unreal/ [1]
> Fixes: ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't (partially) overlap") # ce29a7da84cd, f55dac1dafb3
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> v1..v2:
>
> o Use sched_domain_span() instead of replicating the
>   "sched_domains_curr_level" hack (Valentin)
>
> o Included the QEMU cmd in the commit message for the record (Valentin)
>
> v1: https://lore.kernel.org/lkml/20250624041235.1589-1-kprateek.nayak@amd.com/
>
> Changes are based on tip:sched/urgent at commit 914873bc7df9 ("Merge tag
> 'x86-build-2025-05-25' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")

Thanks!

Tested-by: Valentin Schneider <vschneid@redhat.com>
Reviewed-by: Valentin Schneider <vschneid@redhat.com>

