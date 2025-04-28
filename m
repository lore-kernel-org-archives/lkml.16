Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E274413AC1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876219; cv=none; b=O5as9WDoqXbQbtYt61P3pAOc0F7CiluYHSbLCQWeYHGfPhubaB1U1ebzIAMZapu/7et1DlihbbR7nqNK2k5wK/zYd2xUXKDRLDFRiLncusJBMc8dQ6pZQvEZa93SqibedRhE2f9lR0s7S1VLdMhDrZjyFUnUmIIbA0jMQuBngwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876219; c=relaxed/simple;
	bh=iS66TfsH4kQa8SMt92VnsasL6klIJsY2o4JcjpXNDnQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=F2N7tXqlA95sgs0KqfNYB9QXAkuy3liTIslchRiKeZSJStPe0mMv6cCzRf/wb+80LL/N8d/Il/pR7Y1QK5vW5nmdq99OU1vOGWChDdpG9hp7QBKzC36QB9J8Atstg0+uXeSOa/bR9RjdO+bLisX1y8J5DUPea2sAiDdfYPecn5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P8oAn80O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P8oAn80O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3CBC4CEE4;
	Mon, 28 Apr 2025 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745876218;
	bh=iS66TfsH4kQa8SMt92VnsasL6klIJsY2o4JcjpXNDnQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P8oAn80OvyhUgDXiIEdsp8UHQ3hg1l0wNbcH3bj2N98xsOXfWzniuKPiNtbR9HGuX
	 c++SwFWYaS1fjZAsiR1EsJoYk1ejYeL+LJhq1yEjoO9I0TTD2rXqYboZb4zXZNsyFl
	 ra84TnRMhASkbrI4N50vgICtbALx/s3pqnh/it+8=
Date: Mon, 28 Apr 2025 14:36:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandru Ardelean <aardelean@baylibre.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] util_macros.h: Make the header more resilient
Message-Id: <20250428143657.796de78b43f5ba33fffe07bb@linux-foundation.org>
In-Reply-To: <aA9TDp7FF4rcNI6K@smile.fi.intel.com>
References: <20250428072754.3265274-1-andriy.shevchenko@linux.intel.com>
	<20250428023220.7cfab2286bb94f25c6bf7ca9@linux-foundation.org>
	<aA9TDp7FF4rcNI6K@smile.fi.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 13:06:06 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Apr 28, 2025 at 02:32:20AM -0700, Andrew Morton wrote:
> > On Mon, 28 Apr 2025 10:27:54 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > Add missing header inclusions and protect against double inclusion.
> 
> > The patch doesn't "protect against double inclusion"?
> 
> Hmm... Not really. This is a copy'n'paste leftover. Can you remove that part
> when applying or should I send a new version?

No probs, I altered the changelog.
