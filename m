Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF6C283C94
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524007; cv=none; b=OOuFzHLNjC+JjCVPV0rxSQhbJUYLYAXQiyNDBf0ZDFYV0uNodala70QYfNH4Dd3ItHuUN6GxjUbtrz75YKTcW/QsJb4MvsW1t1UQ1A36ZGDDlIL08rAe+NXoKruYLOPr6eCI7yDoAIiS2t4X47dnKJ7Dle84KF+tzAntSLBPYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524007; c=relaxed/simple;
	bh=J2GPyt/7RHXhHaEvUZZL+ARCqo1IMlbSMnn+MEnL0Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z939FBQqXYaU+KgaRAybJW/Ch+w0oprzSLh1gTzxqfwAmFILOghewldaaTPLw53vKZ2RbuHBQzn0ZBGo7dJfyrQId2NOKgRoxLBRxsGQbRb+5PevkpHubG+5pjpm4OAdF+KWOoVze0UKC3gi/giahky5s+Iy+Ixc3lkkEigIcFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=qO3T4FlM; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="qO3T4FlM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J2GPyt/7RHXhHaEvUZZL+ARCqo1IMlbSMnn+MEnL0Bg=; b=qO3T4FlMOv5CElRNSkm8L+43Y6
	vaY8k4ewFpw4zSQrV6+oJFQt63oTSAYoitvutSGo34YH1efDsSKvjHr6HGfhpdoRMs7c7FlKrcE9z
	iIjSHfzegOPbINbTlbngameKBcJmU1Tlt5/3QKcf8A3DO5Qf39QUOsOwm/QijYsFk5U0ugBFevjc5
	LFwqnrvgDXffpfE40/0ohK69opGx9ZLvYzQXi9+T6EQ6s/9wvji7kZ9AvD3kFOzV50m9pxtP6t8HU
	ftDQucSqmMqQWBvmJjUEZbQBQSX1x6UOKGT3Iu0ExLfpZ+ZeKtOM9Y7LIB9uy2KexowWzgalHSb7j
	N6Um23AQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82Wt-00000000ela-1lMk;
	Thu, 24 Apr 2025 19:46:39 +0000
Date: Thu, 24 Apr 2025 20:46:39 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
	ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ocfs2: fix deadlock in ocfs2_get_system_file_inode
Message-ID: <20250424194639.GH2023217@ZenIV>
References: <20250424162911.51413-1-kevinpaul468@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424162911.51413-1-kevinpaul468@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Apr 24, 2025 at 09:59:11PM +0530, Kevin Paul Reddy Janagari wrote:
> This issue can be resolved by making the down_read -> down_read_try
> in the ocfs2_read_virt_blocks.

ITYM "can be papered over by..."; *IF* fill_super() is the only place where
these are taken in such order, this is strictly worse than the current
situation - you are taking a false positive from lockdep (fill_super is
not going to have any other threads accessing the same fs instance) and
adding random failures and syslog spew where none existed.

NAK in that form; it _may_ serve as a stopgap if fill_super is not
the only place where we do it in such order, but even then we need
to deal with the problem properly.
