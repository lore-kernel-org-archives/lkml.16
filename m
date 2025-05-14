Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC5022B8A2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213480; cv=none; b=VrYPHjWmVeSx8N63udLMDI1uj3sAKOyhcdPkEwNRzPmBwmsDSE97fYyW2pelikjJUBcnlTitN3UWnAJfXoVPHnZThTxTLYxtRzPhNTyek2oDMSMABoOvB37zCjGFEhLcSYxuX9gXKMfmvhEolotCAyIiDal2Gmr694KL8ixoJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213480; c=relaxed/simple;
	bh=bPkh4v05q3iDJCa8E4B6EhDSDgs3Hv+NFYG5HDhkbHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzOfY17k3ah99PmB+DNr6YoQOAdQn4M14XaIEL70zSaRU3UxsLeT0Dqz19upw3CmZ3C+PajCqLtV1o9krg5qesimM5dWKeYrSarIiNlkd63myohTdNp8Kt76W1lQ1Ry5e9iS80fI3HPC00k4x3HftFw/Doq9m+vtACkgyVaRVes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O77Q0Uxg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O77Q0Uxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DF4C19423;
	Wed, 14 May 2025 09:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747213479;
	bh=bPkh4v05q3iDJCa8E4B6EhDSDgs3Hv+NFYG5HDhkbHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O77Q0UxgVQqoYf2JdmWH2PenMnB/3co36rJjNog+Lc362cvWiFWNzBC9z3WGNskOn
	 15gR8ilVo4ANPWQvpWGAmEHvQrYF8oOBUZvuFqH90pM3i6zvpPl+H9nMgf6/9XJr3J
	 PicBjNC9sW7P++6tLHE8BA1qpUNrprXM4vuFwAOI=
Date: Wed, 14 May 2025 11:02:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Chengming Zhou <zhouchengming@bytedance.com>,
	linux-kernel@vger.kernel.org, Chen Ridong <chenridong@huawei.com>
Subject: Re: [PATCH] kernfs: Relax constraint in draining guard
Message-ID: <2025051439-domain-basis-218e@gregkh>
References: <20250505121201.879823-1-mkoutny@suse.com>
 <aBlJlqfAlayxfMc7@slm.duckdns.org>
 <yxzbobrza26uiezc3fpcvtsv64wnn5hkk3urmqhdox4ae2d6zs@lkznubanccwj>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yxzbobrza26uiezc3fpcvtsv64wnn5hkk3urmqhdox4ae2d6zs@lkznubanccwj>

On Tue, May 13, 2025 at 11:06:40AM +0200, Michal Koutný wrote:
> On Mon, May 05, 2025 at 01:28:22PM -1000, Tejun Heo <tj@kernel.org> wrote:
> ...
> > Acked-by: Tejun Heo <tj@kernel.org>
> 
> Is it correct to expect Greg picking it through his repo?

Yes, I will take this when I catch up with pending patches, thanks.

greg k-h
