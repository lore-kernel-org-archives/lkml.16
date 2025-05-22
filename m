Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A22C15990C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747886144; cv=none; b=PuWInuvz9YMLWC/aRCFiU6bB+DBLlYRSsJdRRtly7lXllfuoUPBXmOVWemEmZiBeunDJjJ81zDXdj8PJEeEOf8bMZlsBYXkqPK5BOi9gsEy22CI0hbo1/HSkzlMbHCYBXikqyf1VHyl8x0z5wsbmhxZBjv37QyBNlZv/Uhegp+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747886144; c=relaxed/simple;
	bh=KhsbTEKnJ1OpTEoFmXQHtLsFqvdmqMO6yOrdhrvTxfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEXTThAnKNwNpsREtsskEeXX2otkoK53kcnNdtK+7zFbRJDl83Ip83ufi61zN4nl1RNeMQFZdUFaUu4FQPX+1xIivbrL0EArVD4qbJqSp6NVFZ/ghks1v5OLUURsw7ASqsk6OsG/7J/lBYTDHwUAdAZMzzMRtkY3Fn05xzCZjzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WoTRMLQg; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WoTRMLQg"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8b9c6b453so67929066d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747886140; x=1748490940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mI7jaAjlm03MguLMu7hq8pN/hBV1jXhl7kdKFnO2NU=;
        b=WoTRMLQgQ1C/ugBDgrFR3OJLu49KVrHLhgB2AHWPfjjAZ9FVt573f6F7e2jFntOP+P
         R+RDgIM8l2NjNlUdSpaJ/Q18s7YyzPYD2p9O7ISY58QDqVqkRfu70jvSvOlJM2LEiRAt
         Vaa3PmVuKyjJwQ2xSAJomWQU6pR2YBRu1UaJro8opj2e8OJWDcvr3n1PpE3AIrzHRp2m
         DbYSPYHur1STUwWH1fUpnZcxG4oEMLdbRoBHQHfCoq5AIHke/9E9fSWYyJn/zdDGTzGz
         ij5pl4B+x3sXyGZ93ZKR2wraR9dNkyOOWJm0MPdLTCYsXOxJ/ClAKTTy8487UdzkDIWz
         NHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747886140; x=1748490940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mI7jaAjlm03MguLMu7hq8pN/hBV1jXhl7kdKFnO2NU=;
        b=hDTYI9cUZUUieRoHZ/KCMRZf6l+k1vbi8M6nc/+Kw93Zlj0ZlTQ4Xhg4bfpHu1Dsm/
         784wD2pKispbgbJAbYuUPEeXA1UhBfd4sIJdTpGCZzHhFZj4qcVp0Zgy3h1E9BncWzq7
         zI4YjBi5wVgCYdVtrVaKUdpS8zIThPasxDhkVJ5RrsxfVnEUgRC6y3tocelOxCrNtzfU
         NrtWGi4oZZJGxaH7X0Cvb4jqXTGlnzDxzv7JwuuInoCDzx+NDhgD4+Cli8R/XzUR7qY4
         /VFkliqRPsgD3zYTbebTvxDv4xWWu+qHaKYsb5eGR8cpGEMH7R6fHnEPuzWJEnsycQ7L
         0EnA==
X-Gm-Message-State: AOJu0YyXJeKuYZbnwFEUc1KWUD17TpjUevbadG0sYQmpB6gAD+cnPpWz
	4Uj6lE51xu4/WfCGeaLqEH8r51SSnhRLHp4E/q8EQQUH+9LP0kpBZuowpJIjwX7yWDY=
X-Gm-Gg: ASbGncvoUdlDGsynXQIRfno1GavYAoXAFG3fJz5fKQzfhtuBubvzUtXG0B9sKnxiM2+
	y3oEwlf075BUz3VqvaG17YSFSrZJyMMrFrxEY9HOuIdDWzQ8HOfz/WqnBi61MAZv+UD+IckXAIF
	FJxdsrK0FPm054hwAp2Hu+TZ3qtVlSaeOpe5Z0NJiFg2li9KGUHNHZ4o+GvHtTAUcIsMvv3W8PS
	UbXycGd2hrWI8IVYhAddDlofRuWO+AYZ1IsPvWxcPohwUNb1MNd92Th6ejCYddW4VqA0awJmedh
	WBMkBVZeZ/hpIjsB4WFfB66Xw0ZmcSb8ejRS6cp0u8VuTaAG9eeEs9O5nqCccoWEwajC2s52kmx
	pQ7Yxs2HnWWJxlAsgklTwyFaCWsQPHqU=
X-Google-Smtp-Source: AGHT+IEkGOQ0bhcpLcDDZnMJqAwfKHli7a9vrCasjbfW7FnwVFK8djJGrK0PUUshL0piefB+qZQAMA==
X-Received: by 2002:a05:6214:194c:b0:6e8:9535:b00 with SMTP id 6a1803df08f44-6f8b2cf260dmr325198096d6.12.1747886139886;
        Wed, 21 May 2025 20:55:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08beb6asm94042586d6.55.2025.05.21.20.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:55:39 -0700 (PDT)
Date: Wed, 21 May 2025 23:55:36 -0400
From: Gregory Price <gourry@gourry.net>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
	hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
	peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
	rientjes@google.com, sj@kernel.org, weixugc@google.com,
	willy@infradead.org, ying.huang@linux.alibaba.com, ziy@nvidia.com,
	dave@stgolabs.net, nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@redhat.com
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Message-ID: <aC6gOFBrO0mduHrl@gourry-fedora-PF4VCD3F>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521080238.209678-3-bharata@amd.com>

On Wed, May 21, 2025 at 01:32:38PM +0530, Bharata B Rao wrote:
>  
> +static void task_check_pending_migrations(struct task_struct *curr)
> +{
> +	struct callback_head *work = &curr->numa_mig_work;
> +
> +	if (work->next != work)
> +		return;
> +
> +	if (time_after(jiffies, curr->numa_mig_interval) ||
> +	    (curr->migrate_count > NUMAB_BATCH_MIGRATION_THRESHOLD)) {
> +		curr->numa_mig_interval = jiffies + HZ;
> +		task_work_add(curr, work, TWA_RESUME);
> +	}
> +}
> +
>  /*
>   * Drive the periodic memory faults..
>   */
> @@ -3610,6 +3672,8 @@ static void task_tick_numa(struct rq *rq, struct task_struct *curr)
>  	if (!curr->mm || (curr->flags & (PF_EXITING | PF_KTHREAD)) || work->next != work)
>  		return;
>  
> +	task_check_pending_migrations(curr);
> +

So I know this was discussed in the cover leter a bit and alluded to in
the patch, but I want to add my 2cents from work on the unmapped page
cache set.

In that set, I chose to always schedule the task work on the next return
to user-space, rather than defer to a tick like the current numa-balance
code.  This was for two concerns:

1) I didn't want to leave a potentially large number of isolated folios
   on a list that may not be reaped for an unknown period of time.

   I don't know the real limitations on the number of isolated folios,
   but given what we have here I think we can represent a mathematical
   worst case on the nubmer of stranded folios.

   If (N=1,000,000, and M=511) then we could have ~1.8TB of pages
   stranded on these lists - never to be migrated because it never hits
   the threshhold.  In practice this won't happen to that extreme, but
   in practice it absolutely will happen for some chunk of tasks.

   So I chose to never leave kernel space with isolated folios on the
   task numa_mig_list.

   This discussion changes if the numa_mig_list is not on the
   task_struct and instead some per-cpu list routinely reaped by a
   kthread (kpromoted or whatever).
 

2) I was not confident I could measure the performance implications of
   the migrations directly when it was deferred.  When would I even know
   it happened?  The actual goal is to *not* know it happened, right?

   But now it might happen during a page fault, or any random syscall.

   This concerned me - so i just didn't defer.  That was largely out of
   lack of confidence in my own understanding of the task_work system.


So i think this, as presented, is a half-measure - and I don't think
it's a good half-measure.  I think we might need to go all the way to a
set of per-cpu migration lists that a kernel work can pluck the head of
on some interval.  That would bound the number of isolated folios to the
number of CPUs rather than the number of tasks.

~Gregory
