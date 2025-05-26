Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DEA8F5B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748219125; cv=none; b=Xq+umXmbhuuWPm0+BELjvJafwsDmPAQ+ASisnSpTnKUG/qifPcsTsu88byx27aQGy1czQSEeFlQPUh9zXXZm15ct8gmEJO/h0pSmnaU/c7fsIw8ChP/WMeBik7wt5NaDRu+abFPGzh1ds9wsPcJGltrS0emNZT91D8iDkthDe6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748219125; c=relaxed/simple;
	bh=JbsgzA0mF7MIhJ5uDuL0SXbblTy18HUbnHauy8y/0MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyKl0upRk2KxmKy/0l0RPlM22xcnSHuyZJiUjLqHoS+zLYGj8+ku23579ivETb4XPo3yvHWzEbHA7k7/zm5nMAHKQI9bRZu7n4vA28ptsnNmYRwqL9TM69gmT9YE5X+ovWoDo0NTmRjE4K6ABHvKedrITZ3c0dBWPlAkzCoNmzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=fvvWWnrw; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="fvvWWnrw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+iP7/iJjT25riAxBsT5c3KL/4Zvg4E6+Yr0Wy89xJus=; b=fvvWWnrwq37LhAEJB8pwmkDwk6
	Yd2j45bI5zr7GhRT3o2w1jrHNr+yrZOcdkfZA4zJ625jTdZowZVcdV1CQ8DaoALvCDgmRsEND71G5
	vl2twHRy6Yj0jfHhCOQwHl8FrfZGGxIgoFQQl/BNvDZczS/NN+dz6IATqOnOLl7XNXMTCSCVsVLxj
	XN2a1C1NlJiwy+y68NB4OX5IN6LXRJs8uzZKMmT9JpJdqev215ccnKRgy8IvHo60y1HGiNl+z0Emy
	JQOwfBR7lAMhwSJwoJfeSygokA8YENoshN4FUMb5E26gw7MrLaWpC6ppT1/2K3fglGz928/3m19Q0
	GYIAxDSQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJLeZ-00000001Yg3-3x6r;
	Mon, 26 May 2025 00:25:20 +0000
Date: Mon, 26 May 2025 01:25:19 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Collin Funk <collin.funk1@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] groups: Use bsearch instead of hand rolled implementation
Message-ID: <20250526002519.GX2023217@ZenIV>
References: <ab5708c1e35e1b2a54a1d83fafda1b3f8fa01103.1748218528.git.collin.funk1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab5708c1e35e1b2a54a1d83fafda1b3f8fa01103.1748218528.git.collin.funk1@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, May 25, 2025 at 05:17:46PM -0700, Collin Funk wrote:
> This code predates <linux/bsearch.h>. Now that the bsearch function
> exists there we can use it to reduce code duplication.

Careful - that really needs profiling with setups where processes have
a bunch of supplementary groups.

It *is* on hot paths, and while the current version will be inlined,
yours will do a bunch of indirect calls.  These days that can be
costly.

Reducing code duplication is a good thing, but not when it creates
measurable regressions...
