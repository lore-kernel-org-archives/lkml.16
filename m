Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A2021D581
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691219; cv=none; b=UV7QbzgkIYYNBSYtBFfB748I7Ch9aIItyCeOkDn6RWSf7RFB6ravcODOS7vrbDk+nAVnKKTvwljHETvZ2EUAK9HmDRFI8wO7V0SfYC7Q7taxa6NrFZbbakVZTdlzwN7jafLWa8NgJSt+FT3ixVqWBwsVmw/gEzymwoaezLC/IRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691219; c=relaxed/simple;
	bh=QCKGn0yE2HXxgN9btrXX8tuuTH0V89V0zGAMHGJi0+M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lQX0U1jQ2z61n6GP84JBV9CX2T7Ntlu8GeWnxmyR6GS8jJ0A8wy2VwR6RTFoGP/v5ROdsOKPdjwkmKhe7H0niJCf6AJC9MoIES6S3/CRohsjwKNB1hexAxmlnl0uyja/otoNpj+lqkedZdCUhE3UUmyp6CCosbAzAIgJQC3RTfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=1JKyz1Aj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1JKyz1Aj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED8DC4CEED;
	Mon, 19 May 2025 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747691218;
	bh=QCKGn0yE2HXxgN9btrXX8tuuTH0V89V0zGAMHGJi0+M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=1JKyz1AjUAtgA5Ez0Oej1HtvmIOaSnMsnJaSxyxH1ubLNyQZqQB3UAAb/QTYraIWO
	 YaxpSL4Wm6gRdmkcJWfzFIgozVsNasRNVgWu4xi0U3mVgUL7/j/CgoF6BZg0cJ5qdY
	 Xm9tXTar9brjNx3EKGPrjkZPmxBh+rTDuqG1p66Y=
Date: Mon, 19 May 2025 14:46:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <yang.yang29@zte.com.cn>
Cc: <jiang.kun2@zte.com.cn>, <wang.yaxin@zte.com.cn>, <xu.xin16@zte.com.cn>,
 <bbonev@devuan.org>, <linux-kernel@vger.kernel.org>,
 <bsingharora@gmail.com>
Subject: Re: [PATCH linux next v2] taskstats: adjust indentation of 
 xxx_delay_max/min
Message-Id: <20250519144657.1e626fd36208b0cfff4252e0@linux-foundation.org>
In-Reply-To: <20250519223244317Gbg_lRkV5N9i15dnPMo63@zte.com.cn>
References: <202505192131489882NSciXV4EGd8zzjLuwoOK@zte.com.cn>
	<20250519223244317Gbg_lRkV5N9i15dnPMo63@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 May 2025 22:32:44 +0800 (CST) <yang.yang29@zte.com.cn> wrote:

> > adjust indentation of xxx_delay_max/min in struct taskstats.
> I think fixing indentation alone isn't worth a separate patch. There
> are still a lot work to do, for example: reduce redundant assignment
> and calculation code in delayacct_add_tsk(). So should we fix the
> indentation as part of the next patch.

Ordinarily I'd agree.  But
taskstats-fix-struct-taskstats-breaks-backward-compatibility-since-version-15.patch
is presently in mm.git in quilt form, in the "mm-nonmm-unstable"
branch.  So I can add Jiang's fix and later fold it into the base patch
before moving it all into the non-rebasing "mm-stable" branch.

This is one of the reasons why I use this hybrid quilt/git scheme - so
patches and changelogs can easily be updated during their stabilization
phase.

