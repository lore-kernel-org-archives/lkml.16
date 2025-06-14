Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0F95680
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749861728; cv=none; b=P5dfH1ldmrGjzSOmZXngeXKXE+ylYEmvo9quE+3P8PuiTt0qKaJBabpGzn9fY+9H+MFLwsyLQSTyfhAOeU0Pv0lGtxkq8OnlBXpN+ra3Z97mQerIjqFb3plKSrC4w7480gc1ZHv8oMHcQ52AjLG6HLAgmrFTVuPv1DalpYBC4Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749861728; c=relaxed/simple;
	bh=C25r54mdoeC47auFyRArbQZmrPDewXc+4TTnsZ6zpqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4CO+fx9XuQodF8gKHmCMxqS7HCb3ypLn7iyExRnt2JJ3Z7o6ZvHFSyfTcxMt5VyLrWHn5GeMB5zJDZTVvhDYp1nJo67p/vocILUGaNQsgezz72qxSOaevYk9ktWku8Z47YLHe5kJDHv5UGELumJEgzZNGYdSOnTgyd8MApgriw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laF+nhaX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laF+nhaX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8932C4CEE3;
	Sat, 14 Jun 2025 00:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749861728;
	bh=C25r54mdoeC47auFyRArbQZmrPDewXc+4TTnsZ6zpqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=laF+nhaXb9NzUg+5fg7167xHurk4OLn4mSRU16pQFdvlfvGTSLRUXboQO24zSNIvP
	 nL/WcwkVL5strjJbpv19mvLZmrV75yQ2G8yYdczGMhj5Xpd8onG21Sf3c3eiJXn3lo
	 /Tmu3iXiVvmwbB0O8wOonxitahrPN+cXOM7IQcL8TymtusQ78+3VQLZ13rTrnRkkV0
	 c+NUvegw2taVuUGv4RIExaNVOUSCBbHskDOtS19HzZfSPMum9VwJQDdFx1YxwFL85s
	 0DvcB8XCxM9j+VmjdDtUC+9odXWPlu/1mRwoc5DCDVdp1j8wo2zTIIJ+375k9jSWvu
	 +aDRUdNcJ2NNQ==
Date: Fri, 13 Jun 2025 14:42:06 -1000
From: Tejun Heo <tj@kernel.org>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>
Cc: linux-kernel@vger.kernel.org, void@manifault.com, arighi@nvidia.com,
	changwoo@igalia.com, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 0/4] sched_ext: Standardize preprocessor comment markers
Message-ID: <aEzFXql93thUWWR3@slm.duckdns.org>
References: <20250611135404.13851-1-yphbchou0911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611135404.13851-1-yphbchou0911@gmail.com>

On Wed, Jun 11, 2025 at 09:54:00PM +0800, Cheng-Yang Chou wrote:
> Cheng-Yang Chou (4):
>   sched_ext: Clean up and standardize #if/#else/#endif markers in
>     sched/ext.c
>   sched_ext: Clean up and standardize #if/#else/#endif markers in
>     sched/ext.h
>   sched_ext: Clean up and standardize #if/#else/#endif markers in
>     sched/ext_idle.c
>   sched_ext: Clean up and standardize #if/#else/#endif markers in
>     sched/ext_idle.h

Applied with subject line update. Patch 3 left a stray #else block causing a
build failure. Will post the updated patch as a reply to the patch. For this
sort of changes, please at least do build testing.

Thanks.

-- 
tejun
