Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B5D2AE6D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752172; cv=none; b=UfhDoNpUXZ7pvKodC6emeYyTrLhkR+2DpwQ61/tWIR7PbKW0TVyrfSgFG+fG+8EwU+ppwnZZoc+upKDLqjrUf499fH7ePrEOuVut1zCE63pvWnZq9/x20LiYdznz4BU4k6vaNphBxJNO74SFpv1xDUzmMaitEDajSwGeqf0oyak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752172; c=relaxed/simple;
	bh=SuCp+98tjEXnZPAsCudNCkSoTy52bjSKvaaAlYjS54Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMq31A13ZZZ/DQ4DWIYbUxPUfS/rcOW5amG66HBFrNCJVrR4PC8zH0BUyN0bX234Vtd8nnGgVwtKKbNizIcW0dWruOCOpQzG8pWQ95DAIj57WC5YMGClmFCj0eR0UQSMPYZ4XY9C8ezg/WodX4Oxwev424q2KGynhXfOezGYNpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZP6g+W6C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZP6g+W6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C22C4CEEA;
	Thu, 12 Jun 2025 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749752172;
	bh=SuCp+98tjEXnZPAsCudNCkSoTy52bjSKvaaAlYjS54Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZP6g+W6C+9F5DCCTQ2sDbJ+Y5iifa4ZqWJjVOBz+QauQhhw2/TpPtM7T6jslQIwH3
	 tzEE32W2kXM4Ph1ksaKZjzcmYlqt5ghZjd1XKcgIyG4dl9br+5LWoxIQCvMXQ7VRL8
	 Q0ZbS8sFbztMJn3WitoC/3u8IXOzE6fXFQKx9Mn8WRx0Xk+VzV5YFipKgwb4nsRlRP
	 1CtNZAQ9+dor4FP+Qxf9pvqcXzzhvlETVbQ4qWJqHmeVjf2CJ0ttZFEelCyc0olUfW
	 p6mblSJo7q7j0MCNf1vnvems6YePjq/yjNbU+dRmo9bZR2sej3bLNaO0zj2EJe4iJx
	 1KcViRIMWJ6FA==
Date: Thu, 12 Jun 2025 08:16:10 -1000
From: Tejun Heo <tj@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Luigi De Matteis <ldematteis123@gmail.com>
Subject: Re: [PATCH v2 03/10] sched/ext: Add a DL server for sched_ext tasks
Message-ID: <aEsZapCT1ObL5pU0@slm.duckdns.org>
References: <20250602180110.816225-1-joelagnelf@nvidia.com>
 <20250602180110.816225-4-joelagnelf@nvidia.com>
 <aD5Ai3xJdnV5SxG0@slm.duckdns.org>
 <e68f33de-fdec-4448-840b-79f0d987b2a5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e68f33de-fdec-4448-840b-79f0d987b2a5@nvidia.com>

On Thu, Jun 12, 2025 at 12:54:44PM -0400, Joel Fernandes wrote:
> >  https://lore.kernel.org/all/20250520094538.086709102@infradead.org/
> 
> Right. If it is Ok with you, we can do that after this patchset can be merged,
> that way we can use the 'dl_server_idle' addition to 'sched_dl_entity', from
> that patch as well.

Oh yeah, any ordering is fine by me. Peter, how should we route these
patches?

Thanks.

-- 
tejun
