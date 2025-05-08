Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB824B1E79
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722078; cv=none; b=o4oPwhoKQe4UAndqDDuQQ8Ny6vQdynd/ngPv2gGuWM6QFUZWEtEgiMFdpGsjraM2g5IwqQyur6Umjf4RgbOqWty84nioQtjz9VowsS/bJyUM9jIsAobSpd4ZsTMwjU4ZPujK1cJWJnPK/NlMcgOiFptcH/40jiq5EVcZGYacdDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722078; c=relaxed/simple;
	bh=FGc79cATj4BrzaTjBnhbmPMLlfNGPMLNlIrs7yxo53k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoweL5PJpR65eBN97oIo1Vta1jcXE7t4RIKwZKAXs2rM3Et9n4tx6TICYuvHWhr7CFMSoR1/glrsbdoqxuJ1xSsWsJlvBOmwJueUOsMonwKtYKaEiJqNnIUizxZEy8CEv8qlAlHZzIT++d0tsLrvB28xVo5QKmMLvz56qPpV4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DlemoKH3; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DlemoKH3"
Date: Thu, 8 May 2025 12:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746722073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a4hSZ0K6uJrvq6Ti/e+NJ8QJtg5YKHaPqRm48p1ZYLY=;
	b=DlemoKH3T/1Fsf4HHMxoUSKWWwqeUpi4f1L8wOZS3oFWTaeI7XK7rexC2yfq4Hzc47mFdn
	+LE7WFx3IDpH6zmC6EisYyEp0bugsAB/SLxvubobpgkiIlDfgbM5hlC1llLRnZrFD++qbz
	p6jwWfgDAWCIgDnIDMv29PXDVe5gglM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Wang <00107082@163.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
Message-ID: <is4valhxssgmj7cjdlp2gfvyivhdflu75vzzbkjeiyb47wom55@yx5lfwsptamg>
References: <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
 <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
 <nubqzts4e6n3a5e7xljdsql7mxgzkobo7besgkfvnhn4thhxk3@reob3iac3psp>
 <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
 <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
 <1ed4c8f7.3e12.196adf621a2.Coremail.00107082@163.com>
 <52tsrapmkfywv4kkdpravtfmxkhxchyua4wttpugihld4iws3r@atfgtbd5wwhx>
 <e1cc19.5287.196ae733594.Coremail.00107082@163.com>
 <y6d7vzvii5wvfby5446ukpvdmulwd5lzcyki6rpxckh432d6jz@xwtlwnkhztuo>
 <7bf1ee37.b6a4.196b0b6dce1.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bf1ee37.b6a4.196b0b6dce1.Coremail.00107082@163.com>
X-Migadu-Flow: FLOW_OUT

On Fri, May 09, 2025 at 12:24:56AM +0800, David Wang wrote:
> At 2025-05-08 21:33:50, "Kent Overstreet" <kent.overstreet@linux.dev> wrote:
> >The first question is - does it matter? If the optimization is just for
> >/proc/allocinfo, who's reading it at a high enough rate that we care?
> >
> >If it's only being used interactively, it doesn't matter. If it's being
> >read at a high rate by some sort of profiling program, we'd want to skip
> >the text interface entirely and add an ioctl to read the data out in a
> >binary format.
> ...^_^, Actually, I have been running tools parsing /proc/allocinfo every 5 seconds
> ,and feeding data to a prometheus server for a quite long while...
> 5 seconds seems not that frequent, but I also have all other proc files to read, 
> I would like optimization for all the proc files......
> 
> Ioctl or other binary interfaces are indeed more efficient, but most are
> not well documented, while most proc files are self-documented. If proc files
> are efficient enough, I think I would stay with proc files even with a binary
> interface alternate tens of fold faster.

This would be a perfect place for a binary interface, you just want to
return an array of

struct allocated_by_ip {
	u64	ip;
	u64	bytes;
};

Printing it in text form requires symbol table lookup, what you're
optimizing is noise compared to that and vsnprintf().
