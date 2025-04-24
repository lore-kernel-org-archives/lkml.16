Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282DE2820B2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504734; cv=none; b=SFJQihPgesYSQ5gBTnedcQisPQ2Hdw00i8Mzd2nL2qVsCWaQmOHpTgL0lr5jsAHe2GL/UaeFjKWBwAr4ZWoV27TtfdnJwdwTTyLrZoBfoAULhEuDMVu1SgT62fiscaYv7oPs3KrlW4NgCDm7Qc17MdDkLlfBAT+Hu0N3DuykMps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504734; c=relaxed/simple;
	bh=HAka5rOzVpCS8q7vpplGKyTDTODjckTdLRGRpQ+SCiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0yVw98O2BDGksnolU3Fv4XXD9bqeNeoW5pLsMXY0Jyl5hsEwMa81JfvMiLRUaxP9TB+ze21OmL/KvjNJmGO/eSCRUF4kxcHFYDjtnarntNRy7i/LcL4wa5x2NMxG0UpZBGM+gqtdvP1n51effuCu5yBavebDmttZ4Q6cPRchnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AKLdDUuZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AKLdDUuZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YhUGVMn+gYsuzVe+LwY4qcf+SYACtR+3fDwRizcgA/o=; b=AKLdDUuZG6TBELeEKPWIFXak++
	PyZrlnU0fiJkDjONXVS65x9eFsQ3/wvwmiqnERU4dBE+EhMGH6ixbgBmoTaFopdby76uRvUJwXFRG
	kw8R3Hy7aSrPKsknc7Nb407QL7XWQhCoK5T3qMB47P+wA/lPILsODb3EfluGMeIJmnfObEgidbQbJ
	OBR6NgA221wg00r6o8eMPNwAq86zvW+ZXdnTWtjJjBbofHrF603yswYR7tAmYyju8r7OMmkAOzqJS
	TvWnC0YgY4/w8/x5pzkRywu4HI/kon044aYVhMZ9qre37hV6iLtySiNH5loAWLZvDHVZMzaKp+PR8
	GiT1k4Jw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xW5-0000000CeHg-1ZdH;
	Thu, 24 Apr 2025 14:25:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E0FB0300642; Thu, 24 Apr 2025 16:25:28 +0200 (CEST)
Date: Thu, 24 Apr 2025 16:25:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/5] Several fixes for group flag and
 counters-snapshotting
Message-ID: <20250424142528.GD1166@noisy.programming.kicks-ass.net>
References: <20250424134718.311934-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424134718.311934-1-kan.liang@linux.intel.com>

On Thu, Apr 24, 2025 at 06:47:13AM -0700, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> The patch series includes several fixes for the new Intel features.
> 
> The first 4 patches are to fix the group flag issue which impacts the
> branch counters, PEBS counters-snapshotting and ACR.
> The V1 can be found at
> https://lore.kernel.org/lkml/20250423221015.268949-1-kan.liang@linux.intel.com/
> 
> The last patch is to fix an issue of counters-snapshotting.
> The V1 can be found at
> https://lore.kernel.org/lkml/20250204210514.4089680-1-kan.liang@linux.intel.com/
> 
> Kan Liang (5):
>   perf/x86/intel: Only check the group flag for X86 leader
>   perf/x86/intel: Check the X86 leader for pebs_counter_event_group
>   perf/x86/intel: Check the X86 leader for ACR group
>   perf/x86: Optimize the is_x86_event
>   perf/x86/intel/ds: Fix counter backwards of non-precise events
>     counters-snapshotting

It didn't apply cleanly, but I stomped on it and pushed out new
perf/urgent and perf/core branches that contain these patches. Hopefully
I didn't mess it up ;-)
