Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C57BDF59
	for <linux-kernel@vger.kernel.org>; Tue, 25 Feb 2025 20:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517186; cv=none; b=AoA82x6LcOZdzMNWpEeMYPsZkxiA1YYKEyx7lCbSUVWwH1pmDkilmTJQitew7zGvgrN3vET/AUcgQTK3R3uWmuYRGzGN4dSlhYlb3g9rKONgU/hnypUZU4mH944lWsUx5aMsQ53rsWSISDMIy9KdI9iddfhR4bA/cdb4blTSF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517186; c=relaxed/simple;
	bh=mpotAvN+8QmnfMmvA9YyOYpF+A86KLb2kPrzuWPea7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8kcBqBKWcSR+LnLy4yKveqQAgeQxkt+kRh2UbpgGrpK77DYufMM+Pv/KhDz7kQjB4DnOP/Axn7srWJEyoPGXPcsBvkzZR+Y+omicvExOOj7Gan0S67vQuzL2tqaWQyh6AqbE6RRshwaZsU2mpfiJlTYab1o/wwAqVdeoFwjyvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=ii6ZIPNV; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="ii6ZIPNV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u31NfJD55AVVK4+0db0BcIJJ5EPaSvI/YtTe1UXeDAo=; b=ii6ZIPNV4/FFWGhIbd5JqgWISY
	ykMfJtuxbn2j3CR+m5hk4Bkn0MNd8G1DKpElCQOzG2kkF7NKzHYMvou/aTdg5fSUWWq1sbgR4/FDu
	h0I07CpWBAmaVX1j6PZnFrMoJGSJ5PwICx8fSw6V0NinFJJ1N62uk/dELx7GJTl+5JxfaDJ6N79WM
	GSg6z+Xt7L7WYri8CylIwOlV0BgkY/pD9No3we88l6pzf9soDm72WdgtEvvY0E7kRtG6/yij94Tq7
	hsheFCAY+c5NoaaItVxtoXEuJDVC3+f7PKLBDq48XEwj2GXMyn6Fdcr+ZoWrBJ/zL4siBUMalHyZU
	b3kmWBZw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tn21l-00000008VJW-2VXU;
	Tue, 25 Feb 2025 20:59:41 +0000
Date: Tue, 25 Feb 2025 20:59:41 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Pranjal Prasad <prasadpranjal213@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Improved hfsplus in the kernel
Message-ID: <20250225205941.GA2023217@ZenIV>
References: <378405f0-f3ff-47b0-9596-a6ff56fb7c91@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <378405f0-f3ff-47b0-9596-a6ff56fb7c91@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Feb 26, 2025 at 02:00:36AM +0530, Pranjal Prasad wrote:
> Hi,
> 
> Please find attached the patch to improve the HFS+ filesystem support in the
> kernel. I have not done much work, but as I require HFS, HFS+, and APFS in
> Linux, I decided to maintain it. Please allow me to be the maintainer of HFS
> and HFS+ in the kernel.

Umm...  "Improved" is not a description - it's marketdroidese.
And comments are supposed to help understanding why we are doing
something, not retelling what's being done in every line.
Being more verbose is no virtue - not when it adds no information.

What's more worrying, though...  are there actual changes in
that pile of added comments?  Your "improved and added comments"
would seem to imply that these had been two distinct things,
so it sounds like there are actual modifications involved.

In such case you really should separate those rather than
burying them.

And this "every line must come with a comment, no matter how useful it is"
is a habit best unlearnt.  I realize that a bunch of places teach that,
but it's a really, really bad idea.
