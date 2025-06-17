Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B382116E9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148362; cv=none; b=XD/LVmqfJTdYnwfUR+2DU+qHM5QIBrlsvHjBmg72B3dXa8NoqG58hypPSGhQDSjUYCSXJ4VptWQhj9wAwujU/k6XzafzH9ZKWw6UBZ66MeUTEHCyyAMQuDe3h1nFHcPus+/4zmE3CPBkWrlIO0wfWKUkPlSAVE77hJebUKZol2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148362; c=relaxed/simple;
	bh=zBRP4wob/MdQCdrMyAuRoiAZ142n6H59KQkCbWlV8EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpmIewgcLluWEfiyrq9UCfDN4bxv8F6DrNhgxJLra4W1aAUpxJ0sfGyxzY3rzmH0HgE1lztXcGyb7p/RSaKjKRtmSgO0GOIOMNORSSQYkkm5zLCWk31MbkTJ5UUnFqdVvqO50Ghmbv64QbDgTudQYxkK08IxDfDDL9u/7LKyeUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ACEUFgiK; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ACEUFgiK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G81JPc7Pxd70u2E5S536IHkdmuK5zD+fZXmV+GL3ujk=; b=ACEUFgiKvcxGO3RcTVSiQKUOgL
	7DOSWSK2W8hR6pV9Pd7RVG4/NQH12KNUsAcIhA+qYH7St0bNNmsbkNxRWrryWMXuuanxgJ71blgbg
	Puvv951aeGlht4gwZA5BQsTxb4uh09wZDALBnr75kSKr5GHOEFNS4ePBCwQ+eyys9QoKeD4/BnPsm
	L6Z3xgRP5BlaUlHLKz30aWBNZqwC9xlClArPWcyvuVwC14Zb9mBl2DjTETYji0njT4+mb64TOx3Y4
	aZIPugts0OQMWwKBQsMZj3e468Uw9T7OuA7Goo3coWPKsk7hmV9pRwQHYfKwX6iUTXrew/vlF+KBX
	IrVoOqsQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRXB-00000003k3p-1lLS;
	Tue, 17 Jun 2025 08:19:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0CE3F308523; Tue, 17 Jun 2025 10:19:04 +0200 (CEST)
Date: Tue, 17 Jun 2025 10:19:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 08/12] perf/x86: Add APX in extended regs
Message-ID: <20250617081904.GJ1613376@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-9-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134943.3186517-9-kan.liang@linux.intel.com>

On Fri, Jun 13, 2025 at 06:49:39AM -0700, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> Support APX as the extended registers. It can be configured in the
> sample_ext_regs_intr/user.
> 
> Only the PMU with PERF_PMU_CAP_EXTENDED_REGS2 supports the feature.
> The value can be retrieved via the XSAVES.
> 
> Define several macros to simplify the code.
> 
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>

Yuck.

How about reclaiming the current horrible XMM register space when the
new sample_simd_reg_words != 0 ?

