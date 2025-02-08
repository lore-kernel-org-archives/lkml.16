Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156E26ACB
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002392; cv=none; b=NZog6i+e7grRsPJQIvvjeCqcVwFtFatN3+tN46Itt0fsqGPz5XCY2lDCyNBdYg7jQaciqh9+PpbKT/tjIWd7sHKbIQRT4Bj0jg2AzLrNloiFNRmT4b9FLS5U4kKuEY9IiyVahQt22u7vlWt7rIG+/V/fr7GFnctkDZ7EqVyFPlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002392; c=relaxed/simple;
	bh=80su6zSgTZwaW3mqmeuqS3qq7qbn9KKfLzUTpsaGJVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5Qqq/JSRfv6fmFU3lK60D8HOAmyJFotbmtuPQlh+ZtcO1hoLxfaTcm2To/4WoAPoj5coqBBpMavO9X2VqXoeQQEmZtESj+8lpusn5PxqQ2xGFTp2I4vvAqtdMMu7EfbVJUe70FiSXNM7CDGDJqpE9/4Wuy6ckpqtOlpUPoPMBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeDRMQ/v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeDRMQ/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4215AC4CED6;
	Sat,  8 Feb 2025 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739002391;
	bh=80su6zSgTZwaW3mqmeuqS3qq7qbn9KKfLzUTpsaGJVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LeDRMQ/vp/suwJUlW2+ZSFRBoNWhUwHHrgXjs8P4cNizGJEmjVatxyAX7NAqMZ0du
	 VE7cs6Ot3BDK5fRlDMJteD5PAar1w7vLZgOBdULnQTSbJ39xmG5f90Lp8M1CLqJsum
	 x+DOT4KXwtBTpUYYYWzrpenybN7Ox7k6VQnmtQhB2PVy7XDwwUgbNoyH7mdFuh+EVE
	 s2oxb/fYvVaHloKnbDNO+a5zEughkqpxAykfnBLwIQ7aReAmerb0/8X4BXsd8q6B56
	 KP9nIHjCM3jha09PjMiJ6paCabYgATNeKhc/iyQuSFHY31ClVsNmwXFbZ98ZxetZ/f
	 5ZIiE8lEg30zA==
Date: Fri, 7 Feb 2025 22:13:10 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] sched_ext: Compatible testing of SCX_ENQ_CPU_SELECTED
Message-ID: <Z6cSFmXvNkmI0qKv@slm.duckdns.org>
References: <20250208044332.492494-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208044332.492494-1-changwoo@igalia.com>

On Sat, Feb 08, 2025 at 01:43:28PM +0900, Changwoo Min wrote:
> This patchset is for testing `SCX_ENQ_CPU_SELECTED` in a compatible way.
> More specifically, it handles two cases:
>   1. a BPF scheduler is compiled against vmlinux.h where
>   SCX_ENQ_CPU_SELECTED is defined, but it runs on a kernel that does not
>   have SCX_ENQ_CPU_SELECTED.
>   2. a BPF scheduler is compiling against vmlinux.h where
>   SCX_ENQ_CPU_SELECTED is not defined.
> 
> The patch consists of three parts:
>   1. Add enum_defs.autogen.h, which has macros denoting whether SCX
>   enums are defined in the vmlinux.h or not.
>   2. Implement __COMPAT_is_enq_cpu_selected(), which provide the test of
>   SCX_ENQ_CPU_SELECTED in a compatible way.
>   3. Use  __COMPAT_is_enq_cpu_selected() in scx_qmap.
> 
> Also, this patchset is a sync of the relevant PR [1] in the scx repo.
> 
> [1] https://github.com/sched-ext/scx/pull/1314
> 
> Changwoo Min (4):
>   sched_ext: Add enum_defs.autogen.h
>   sched_ext: Include enum_defs.autogen.h from common/common.bpf.h
>   sched_ext: Add __COMPAT_is_enq_cpu_selected() for BPF compatability
>   sched_ext: Use __COMPAT_is_enq_cpu_selected() in scx_qmap

Can you collapse the four patches into a single patch? I don't think this
needs to be split this granularly.

Thanks.

-- 
tejun
