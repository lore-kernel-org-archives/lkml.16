Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13C920E6F6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615028; cv=none; b=JHH67fc1g1jw28Xify1pquSzL3/Qj0WKt3r6/6Ay9/ImunUTiziPt3WY47uoBPm8PAph7LylERMTFhNeSwN7I81BRpi32wBuqAxtzuEhdNbeKWgxxtOLboByxn1fDaRIXlh/8WbbMhgGt11e1fR9tJC2QvIuZG3tq/RA2OsVyHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615028; c=relaxed/simple;
	bh=WWotbqxj0Y80LrPCw1qgh1L9hnsVzMY8E+CueG8+oSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTTHEaX0WpHXeOc8zGk7c23JsrAx6RkSH0iirkfGaJLdVbNoB/1+1t2oPjYXOwA5CVNZ5uqG8RBvL6Dg8mXmpxFKflgL0gDM8YVRGPNeqyWrjg1nPvIY7Ux6CW/5t9RxJW1GAFnZP0PtyY1rFBHaXFIFIM95aNe9fylqO2of5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sXQmKBAv; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sXQmKBAv"
Date: Mon, 3 Feb 2025 12:36:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738615017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1gaHygG/Wj5xg8tFGLChtaLS9Fm/l2fZZilX9j+aHII=;
	b=sXQmKBAv40AY3g25v0e4Xa0tTIQ7TvW9ppxUa9EYaBLlIDUdJn4E2KoOZQH0V8aLqbV18s
	eD8eQjvSW+WoyOajMKCRYDmGrvJ1gKSmVrvpz25+bgoxCraQS08dj2LSoUQXCdEoYlhOpE
	gJFiedZ7WmDaU+NWr1g+sVuHo13LXzU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, vbabka@suse.cz, 
	rostedt@goodmis.org, peterz@infradead.org, yuzhao@google.com, minchan@google.com, 
	souravpanda@google.com, pasha.tatashin@soleen.com, 00107082@163.com, 
	quic_zhenhuah@quicinc.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm: avoid extra mem_alloc_profiling_enabled()
 checks
Message-ID: <vn7bns35qfeibasfgpinsrot4tipupcg5cjawrhobb4g2ibwor@6moxbtmo5l7m>
References: <20250201231803.2661189-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201231803.2661189-1-surenb@google.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Feb 01, 2025 at 03:18:00PM -0800, Suren Baghdasaryan wrote:
> Refactor code to avoid extra mem_alloc_profiling_enabled() checks inside
> pgalloc_tag_get() function which is often called after that check was
> already done.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
