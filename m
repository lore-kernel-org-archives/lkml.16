Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5C134CB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751562697; cv=none; b=QOPqWZWG28AMVulGDCeJmYkOGCntmf28Rl5uwLeSxffbT26qlOVv6IvRSPMnvN8OwlG76jrvGzmX2aJfn8r7VOf4h6jbiU9/wG3IvOkvnj6nzZNRM2AJoI8l+DiwIRd7NdjiXpzzTl2T//tYrnGVZSgGMxwGmK+c/IfJ9A2lYO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751562697; c=relaxed/simple;
	bh=Z4QbIweEJlx3aDw1A7YnK+QxLMV983fgVz0Xqf5xbXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSwkBDL49JyLhpRbKVB1sWB3yqvrvRvFfFWNyzJBSD0NAhekIkdkaZzajNYDaqUrwDpnVSnSEAWP1Pn3AhCFoouXWv4H+G1KLhJDkuNkqxzKUuydBceak8rUsrcBcThjD7qPSkc8WoN2s3Iw4rEdBHtjYv/dzIOEXpcKPOmKg08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CfR2cjY9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CfR2cjY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751562693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hMcBI0Anwzvu7fPyDZWuajt8mR27da4n7DNG0pz860=;
	b=CfR2cjY9jCD8x9ucDeQePH9psODNDdspAwPAqCpdZOtPwDbnRbe+vKorJwGD2sFKEOaw07
	4L1eaATvTGA6VwF85hEzmivDnbPafF3ynbFzjr/vFm2xPptIV/8W8etoCGIe3Dj3NT102k
	Ezx+y9RYCZeIx7y3p822pGNrEnzTTOQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-SdG9r84BOsa63x31_lw-oA-1; Thu,
 03 Jul 2025 13:11:28 -0400
X-MC-Unique: SdG9r84BOsa63x31_lw-oA-1
X-Mimecast-MFC-AGG-ID: SdG9r84BOsa63x31_lw-oA_1751562687
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EACB9180034E;
	Thu,  3 Jul 2025 17:11:26 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.80.203])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B2F619560A7;
	Thu,  3 Jul 2025 17:11:23 +0000 (UTC)
Date: Thu, 3 Jul 2025 13:11:21 -0400
From: Phil Auld <pauld@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, clm@meta.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/12] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250703171121.GE245663@pauld.westford.csb>
References: <20250702114924.091581796@infradead.org>
 <20250702121159.652969404@infradead.org>
 <20250703160027.GC245663@pauld.westford.csb>
 <20250703164708.GZ1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703164708.GZ1613200@noisy.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Thu, Jul 03, 2025 at 06:47:08PM +0200 Peter Zijlstra wrote:
> On Thu, Jul 03, 2025 at 12:00:27PM -0400, Phil Auld wrote:
> 
> > > +	if (ttwu_do_migrate(rq, p, cpu))
> > > +
> > 
> > This doesn't compile because ttwu_do_migrate() doesn't take a *rq.
> > 
> > It's easy enough to fix up and I'll try to have our perf team try these
> > out. 
> 
> I'm confused, isn't that what patch 7 does?
>

Heh,  I seem to have not had patch 7 (psi did not make it through my
stupid gmail filters).  I did look through all the ones I had but did
not look at the numbers and see I was missing one... 

Nevermind.


Cheers,
Phil

> Also, I updated the git tree today, fixing a silly mistake. But I don't
> remember build failures here.
> 

-- 

