Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713B224FD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746653168; cv=none; b=mBp9uZz/4rSHlc5cJ12va4WPYFGxtbs31SNwSJO3ql00nWqcWOUFPtZf1gyB/BpEQhdrO71aTjv9l/NvzsiEziKKLuB1k9PQgxEBi1diP27LDteUld5bizZs3Bxql/VsMHwaFWrXUq1pjADRUCYoMpGnnTEaqlmvTWGhd/fs9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746653168; c=relaxed/simple;
	bh=jNrTl3ev6sNjWyhFMH9smFCi7OoG4J0ad8AFvnYMofE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9RPr9EDZe6+o2PZ/K2NCHq3ryz1R17R/wx8vSVo/fyDd8aLuw4k6Hz1LXGj1DzYM5/DsUiORLch3PWd/4mHBbH4D19HE7BkOFnRZk1yx37NNacXGx1zG6/YzSTPkwjxV01gDW9pRt6eMLRquUkBf9kLutmN0Zqxf1+m9xbnYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=GHupnsPL; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="GHupnsPL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jNrTl3ev6sNjWyhFMH9smFCi7OoG4J0ad8AFvnYMofE=; b=GHupnsPLfsFmlCr3C0pAiiXifY
	u8nIE9IXrz1zcMw48/QjBTEZAV0k14ARdWcnTIkrw084K3+ek7couigf/Cdv33D1Qdofnrd9LAQ/9
	7i7c6fsx99jgOt760a2ScqtA2CIuMQo7UlLOlJg9d+oBkYvbbGsbqfRa+tl3Oi/j6zrpxIau6J00B
	ej/6gS4AduYjOeTqwCTQgdQjeJrVnUWRA6V1neJl5XzM1+/e4l3WxN2qWg6fNYzfR6LMeo4PEC8oF
	GC8OWFuPckFEW+WDVC8+dgQJgU5AG9Zb5faojoVqFJsypqHzhaJkTeOs97cwFTqGpjkUopSHh7tcb
	17B0O77w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmHA-00000001fAp-2aK5;
	Wed, 07 May 2025 21:26:00 +0000
Date: Wed, 7 May 2025 22:26:00 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Joel Savitz <jsavitz@redhat.com>
Cc: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH] kernel/nsproxy: guard all put_*_ns() calls
Message-ID: <20250507212600.GZ2023217@ZenIV>
References: <20250507161328.156909-1-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507161328.156909-1-jsavitz@redhat.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, May 07, 2025 at 12:13:28PM -0400, Joel Savitz wrote:
> In free_nsproxy() and the error path of create_new_namespaces() all
> calls to put_*_ns() are guarded by a null pointer check except for
> put_cgroup_ns() and put_net(). When CONFIG_NET_NS or CONFIG_GROUP is
> unset, either of these functions may be called with a NULL argument.
> This may or may not be handled correctly, but at the very least it is
> certainly quicker to just perform the null check in all cases.

Why not simply make put_net(NULL) et.al. no-op instead?
