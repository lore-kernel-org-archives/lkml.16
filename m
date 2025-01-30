Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51728E8
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738263692; cv=none; b=tWv9Dd3Q025+In0C4jMgAWPHiANqQnwjBG4zdR5I27dwYVboS4fg6Xg/+KeRuhJHbvWcijZkG4Zatl64UFqh8ZXsicq/aGJXzuyX8McpDA7cg7JZVOAq0XYCAZ48RYhA99aPczRq2w1/at3O+nRKBfUbPG8SSRMbYSLSj7RwJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738263692; c=relaxed/simple;
	bh=HQ2IsySPaz3WFEoGPt4ysMX/e/JqVXew8+U/Eb3erxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3ygeFooaPbKnuftFPnLhKVVdmyr0W7bZov9bVHoHKDVWF5/PSlJ02DI8SgbyWvWvhtWrtHh1MaZArE4p8i/LNBImlNyitQo26GvdzNsxt1lzKNC16eJMSUS7nZMVNr08sGicHMQj6IQMfi0yQBS5TW0L/G7DbuaIeynhXT9qEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X+8PWTUZ; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X+8PWTUZ"
Date: Thu, 30 Jan 2025 19:01:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738263686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUuu4hqzH6mNtJAivC+Uo5peTqP18ai+56VAExs4m/I=;
	b=X+8PWTUZ0aZvus/WbWXFkTk6ahWsfRC3S7ZzXvYoi/NOkDMaw8sHMi5KGpYWs82IlAjfUJ
	Ce2Awxbju8tTA4eGDj6ny1bxsuYi39HADtnU/dxxT6ZavAANSdXEVQMQ5Tab4ycP2z+yH6
	xnP1tSOirOUv/DJLt2YotHeASptISog=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Song Liu <song@kernel.org>
Cc: Weinan Liu <wnliu@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Indu Bhagat <indu.bhagat@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <Z5vMfxFSIEtPMrMi@google.com>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW4UrhaYKj6pbAC9Cq1ZW+igFrA284nnCFsVdKdOfRpi6w@mail.gmail.com>
 <CAPhsuW7f5--hzr0Y3eb1JNpfNqepJuE92yq3y8dzaL_mQF+U5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW7f5--hzr0Y3eb1JNpfNqepJuE92yq3y8dzaL_mQF+U5w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Jan 30, 2025 at 10:34:09AM -0800, Song Liu wrote:
> On Thu, Jan 30, 2025 at 9:59 AM Song Liu <song@kernel.org> wrote:
> >
> > I missed this set before sending my RFC set. If this set works well, we
> > won't need the other set. I will give this one a try.
> 
> I just realized that llvm doesn't support sframe yet. So we (Meta) still
> need some sframe-less approach before llvm supports sframe.
> 
> IIRC, Google also uses llvm to compile the kernel. Weinan, would
> you mind share your thoughts on how we can adopt this before
> llvm supports sframe? (compile arm64 kernel with gcc?)

Hi Song,

the plan is to start the work on adding sframe support to llvm
in parallel to landing these changes upstream. From the initial
assessment it shouldn't be too hard.

Thanks
