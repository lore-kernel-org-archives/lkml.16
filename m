Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C9035942;
	Tue,  1 Apr 2025 00:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466724; cv=none; b=RxRrpemx9r+50x/XC3ZDKkPotQHypz2xacfICmZY2eVSeH1QaigFVADs0ZuCPyMQ21qlmEv5U/7aGA6yk5Cy094AlvZx+k923re9N+UIWIxY1hWAhNWqAQ4JTXmUW8gt8krQOpkH3dOrqxh+pg8KhpKsz6JSubnvxQTdDhhF2Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466724; c=relaxed/simple;
	bh=TfWZM/ZIrRfPvQAewmmabDh6+08DL6ncmT+rIYPOTfA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U5ZVAXyiSfYR5TjaQW9Eq2Nfl8MTFCZqL9nDqE1Pq3ytAW2sk9nhRZ29s0eeJd7Pe35xvrXLmeDZcXPfCZpKeuCoXYBaBuvZ8YUarX9INPRSWIMzXG921OZOmoZjXhtpd4NpHk+bunquWLB/f6FB0FRZF2eYPliJ51zPHQP9omM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYPda/mq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYPda/mq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A13C4CEE5;
	Tue,  1 Apr 2025 00:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743466724;
	bh=TfWZM/ZIrRfPvQAewmmabDh6+08DL6ncmT+rIYPOTfA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nYPda/mqcHZsP/f6Nmt0uo4CUFe1jD0q59KwphCAlwcNHeoUxw9l03UfsCTjtLi3H
	 fK1vB8f+mdpd1k4p73CTmv1H0EGT4ZpcG0iQEOO4s2iFA1GoyH38ZlKwbPol7ndekN
	 adl9IX0fla5F5tOf71jFiyf+D0/DOT8J1W8RoUsj6svGsPuHNONH7ryGigRAqKGJ/g
	 ZgeodYUL3X3qLEmMAM7csE8IkwZFJZLaIePgIfoJFfRYSx7VT+S2vRxcmIJ6yPthi5
	 Pb1ZwamN6plBwv9zJk2xqsw782eIaPz+R2Cy2b17ya+nMRN9YVCF8VG79CsHTLz0ZK
	 PGZC3ZZx+uYeg==
Date: Mon, 31 Mar 2025 17:18:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wang Liang <wangliang74@huawei.com>
Cc: <davem@davemloft.net>, <dsahern@kernel.org>, <edumazet@google.com>,
 <pabeni@redhat.com>, <horms@kernel.org>, <kuniyu@amazon.com>,
 <yuehaibing@huawei.com>, <zhangchangzhong@huawei.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2] ipv6: sit: fix skb_under_panic with overflowed
 needed_headroom
Message-ID: <20250331171842.06f61e48@kernel.org>
In-Reply-To: <20250328021803.16379-1-wangliang74@huawei.com>
References: <20250328021803.16379-1-wangliang74@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Mar 2025 10:18:03 +0800 Wang Liang wrote:
> When create ipip6 tunnel, if tunnel->parms.link is assigned to the previous
> created tunnel device, the dev->needed_headroom will increase based on the
> previous one.

Does not apply, please rebase on latest net/main and repost.
-- 
pw-bot: cr
