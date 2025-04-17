Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06142288C6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877254; cv=none; b=rX2K8DuiPpYW659ThgWhhrbkS2TtzNz/kl7JasLNE5VA3qwZkpM9x8lhIiCCOHVtdHrBUpFpGxIDQuZu+C2sIUlqrTnY8dX1ERcSi9rvShzjC7jbTIDIBTbmnkWbsQzHSDfcH4Oj1jMuPkKAqL4k4zKPBPLXjT4mJuSu0FZuBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877254; c=relaxed/simple;
	bh=x9LMdxHZpAEx4PNf/gdpp8em2fU/lqPJLt3cmhXzTaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym+1S/OnPdB4r6mWoqjto86H8/4n3klMf1f4XN0S0zj9snNjgQ1VYxq1GSUctzVJlKQJTPNiOlSqvMstUeLh51FMtaW3p24xxHnIv9q5m0YNCwcYBSobr1v3HJ21Jxwwv4htQNLhv+8kEYWM5RgvQonk1JY7ViuP5scvcpqrWhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IUo0/6RT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IUo0/6RT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KOu8JOEUA3JnELEMWzclUZ+7+kcbuCwzlYrc2GUSPQ0=; b=IUo0/6RTxXKwJSeMSgv9WT+rrR
	t76M5tHWas9BsL3xbMSsL+n7dVomMiXIVD50ihYBgOeZtkUrMVKeBTn8TVoTzn8gCjdv7kzgWIJNi
	KtKxWACrywe/7zt/2YWLoQ+X8OC5DncRq/OVXYORsA3Mc02GjEN8tAVsjWMTeZsIiF9xuamXcXa7t
	AuYxvZnn9Ja+sWmBl9O/8i1gWL8Ep1UypfBSIqdiswKHAi1COW+qnpzS8P6WiVmAl1z9s0TDIXAsr
	/jFkMm2VSBsIAJ0mG33ggq6Y7cW73PqGboRkLewQPsER730NdOb9rbcXnQqKd/cdrok9TanQi84Nv
	LsQIPV0A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5KHN-0000000AF0J-49G3;
	Thu, 17 Apr 2025 08:07:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 90017300619; Thu, 17 Apr 2025 10:07:25 +0200 (CEST)
Date: Thu, 17 Apr 2025 10:07:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Cc: mingo@kernel.org, ravi.bangoria@amd.com, lucas.demarchi@intel.com,
	linux-kernel@vger.kernel.org, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, james.clark@linaro.org
Subject: Re: [PATCH v3 7/7] perf: Make perf_pmu_unregister() useable
Message-ID: <20250417080725.GH38216@noisy.programming.kicks-ass.net>
References: <20250307193305.486326750@infradead.org>
 <20250307193723.525402029@infradead.org>
 <a0e3eccd-314a-4073-a570-0fe7b27c25c8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0e3eccd-314a-4073-a570-0fe7b27c25c8@linux.intel.com>

On Mon, Apr 14, 2025 at 08:37:07AM +0800, Mi, Dapeng wrote:

> It seems this patch would break the task attached events counting like the
> below command shows.
> 

Right, found another report for that yesterday.

---
Subject: perf: Fix perf-stat / read()
From: Peter Zijlstra <peterz@infradead.org>
Date: Wed Apr 16 20:50:27 CEST 2025

In the zeal to adjust all event->state checks to include the new
REVOKED state, one adjustment was made in error. Notably it resulted
in read() on the perf filedesc to stop working for any state lower
than ERROR, specifically EXIT.

This leads to problems with (among others) perf-stat, which wants to
read the counts after a program has finished execution.

Fixes: da916e96e2de ("perf: Make perf_pmu_unregister() useable")
Reported-by: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
Reported-by: James Clark <james.clark@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/77036114-8723-4af9-a068-1d535f4e2e81@linaro.org
---
 kernel/events/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6023,7 +6023,7 @@ __perf_read(struct perf_event *event, ch
 	 * error state (i.e. because it was pinned but it couldn't be
 	 * scheduled on to the CPU at some point).
 	 */
-	if (event->state <= PERF_EVENT_STATE_ERROR)
+	if (event->state == PERF_EVENT_STATE_ERROR)
 		return 0;
 
 	if (count < event->read_size)
