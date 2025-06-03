Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29424C92
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748978292; cv=none; b=iUn1RNarRq4RymGWRV6fAR3GGCzXQ+TbkO4nBoKtF2BLOg3MAXrXsDPX4W0PdstxXJ8rkwDrw0aIYE857kAw9/3WnRWeLmwnGokwD11PS6E50LHffAdkoYZwq3jhDtnPxTBShmUVFu+sE4YsgZE2Ol+SfNh3OprAV8DuHMUS9BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748978292; c=relaxed/simple;
	bh=aNxd03nb6SkuJhnY+rmxieeeapzvb+Bb8CJ2jTv3uCM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFgPedmC3R3qBCzbQVIyBZzaqpq2Zi03rd8UOiddvdU95wfn00tpyDPDZESbM5Fe+fo7fbqXzDKuNCSd4t96y9ATxwWIIQdHEFRGMnsN0HK/5Bmg0Gr0QuGOCj2zsClBBnk1MaQ02iTaMcS5Tnmafm8j0mSS+N+DUXIyw7lfJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573C7C4CEED;
	Tue,  3 Jun 2025 19:18:10 +0000 (UTC)
Date: Tue, 3 Jun 2025 15:19:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: <linux-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Shiyang Ruan <ruansy.fnst@fujitsu.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Ross Zwisler <zwisler@kernel.org>,
 "Alison Schofield" <alison.schofield@intel.com>
Subject: Re: [for-linus][PATCH 5/5] fsdax: Remove unused trace events for
 dax insert mapping
Message-ID: <20250603151924.532b4003@gandalf.local.home>
In-Reply-To: <683f3b668697f_1626e10057@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250603171149.582996770@goodmis.org>
	<20250603171229.109414670@goodmis.org>
	<683f3b668697f_1626e10057@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Jun 2025 11:13:58 -0700
Dan Williams <dan.j.williams@intel.com> wrote:

> Steven Rostedt wrote:
> > From: Steven Rostedt <rostedt@goodmis.org>
> > 
> > When the dax_fault_actor() helper was factored out, it removed the calls
> > to the dax_pmd_insert_mapping and dax_insert_mapping events but never
> > removed the events themselves. As each event created takes up memory
> > (roughly 5K each), this is a waste as it is never used.
> > 
> > Remove the unused dax_pmd_insert_mapping and dax_insert_mapping trace
> > events.
> > 
> > Link: https://lore.kernel.org/all/20250529130138.544ffec4@gandalf.local.home/
> > 
> > Cc: Dan Williams <dan.j.williams@intel.com>  
> 
> Acked-by: Dan Williams <dan.j.williams@intel.com>

Thanks!

-- Steve
