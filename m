Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F4228D8D7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747136142; cv=none; b=ihXtQlkzLlkgSwbaCyM6DMVhgR1yklJdxpuoPPZ67w5dIGBcw3qZLAykPMLtuqzPcgMPE2QPl5rXSIU5EZW31YscPQtPV+8aAdsJdnzameosn6h7JuJDWbFSIU8hjpmYpt6/EAhCUFYIUFEUtH4EB5yFN/bid456IJQsKwuNVII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747136142; c=relaxed/simple;
	bh=qdqMHeXnEw1hwPK/CNFq9Bieu80j0aqXtJoit3+EJqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9XkIDJQTcQUCzOOTf4gutfQ9++MiEVkc1LkI5s7rumR0P1tPw12jx2Z7uwuXpXeD13ymN91YlZ3+L33mA6DfWuwhdpfdDAhD2odqcbQ6IAnRtWqAP9+zHYhM1cv1i3hjzi3SnQ5jLNO5DdNDkk+u8s3KQOa11zP7V7+n58BJvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SROnTvkk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SROnTvkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5AEC4CEEB;
	Tue, 13 May 2025 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747136142;
	bh=qdqMHeXnEw1hwPK/CNFq9Bieu80j0aqXtJoit3+EJqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SROnTvkkVMpPwIjpc57Ejxd/F+LCXRdP2KFDO0uxr/kPkEZNs7r65WO2qw1BIitZI
	 3bLaa4r9N0sHNHsqXIdzrMRgClrMAB8Pe8GRWl1Bl79OMsmIJikyeSmJX3aC7df2CB
	 UCIGIIlR/CpY9QH3sOcv6b6EEkciyJhZxC2WoZoLgBdurETsZTqrjV8iOfvbpBauev
	 UzH3H0JeQodOiLvR3iXeFfB+1vJp5WQH6qGL7VuEhzQ6LDhdPO7Q8SWYdJbpqg7FWB
	 8gMTCW2aGfWLBNQTEMMlmmpag7mre9xnWDEuJynkxXByvqYmHbPnU0COMOOXKeKw4T
	 dwZElarLn8iug==
Date: Tue, 13 May 2025 01:35:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chengming Zhou <zhouchengming@bytedance.com>,
	linux-kernel@vger.kernel.org, Chen Ridong <chenridong@huawei.com>
Subject: Re: [PATCH] kernfs: Relax constraint in draining guard
Message-ID: <aCMujId1_BMRtJFn@slm.duckdns.org>
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

Yes, I think so.

Thanks.

-- 
tejun
