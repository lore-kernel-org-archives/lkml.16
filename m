Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200542629D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 21:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901461; cv=none; b=G0MBacCJ3NJ5mdUcf71GtnxxSsCxeMy1n+KDWtSt8dEl5k5bTJLrtx8UutJnYqbSZ23Zl6CbCH/gpE4YBb+qoTPwXo0VZ1EWtDrlXCY5hOEe0W0LcVkGyqaZkvUmhOV0XIsqZXOpt6Au2xrRdSXpktKtPjewjtx2D/YipFnXkp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901461; c=relaxed/simple;
	bh=5ONrfrV4v6p5aGon1KG4bYL2RjbY1NYGsVSB2rTgu2w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JYQ8HhS6P2E9W+vwmpRCyKioIhZRWZHXdU5HGIFFiB4aVa7KNDiv167t0/eCrxz9apNVdlwbuGJ0lSV0DI/DFn7cF43taXaAyY0I73ToCgZq9jTpqJQ1zh6oPBzb+yyEiZEsfvb6hOUVnFvTwHhcrKqr2nqtSsxNEt8ZNHK3WBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xv7MitK5; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xv7MitK5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748901457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ONrfrV4v6p5aGon1KG4bYL2RjbY1NYGsVSB2rTgu2w=;
	b=Xv7MitK5l/EfFeD02fXfgnEr2EV8me4qUK+T3O2VddjSXVTmYm2a9Cfd/sqHfVh/3cejPS
	YzoMLNUCZpJT+PMfaIOUnHbPpWGwlVkjKXEHlbdu06tNXMXR+PMwnAZSYoL8lnD5iUDury
	eEPw1TvPBVvEJx8Ed1YcjiBeQxn5egE=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  surenb@google.com,
  hannes@cmpxchg.org,  shakeel.butt@linux.dev,  vlad.wing@gmail.com,
  linux-mm@kvack.org,  kent.overstreet@linux.dev,  cl@gentwo.org,
  rientjes@google.com,  vbabka@suse.cz,  harry.yoo@oracle.com,
  linux-kernel@vger.kernel.org,  kernel-team@meta.com
Subject: Re: [PATCH v3] mm: slub: only warn once when allocating slab obj
 extensions fails
In-Reply-To: <20250523165240.1477006-1-usamaarif642@gmail.com> (Usama Arif's
	message of "Fri, 23 May 2025 17:52:40 +0100")
References: <20250523165240.1477006-1-usamaarif642@gmail.com>
Date: Mon, 02 Jun 2025 21:57:20 +0000
Message-ID: <7ia4ldq9vmbj.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Usama Arif <usamaarif642@gmail.com> writes:

> In memory bound systems, a large number of warnings for failing this
> allocation repeatedly may mask any real issues in the system
> during memory pressure being reported in dmesg. Change this to
> warning only once.
>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Thanks!
