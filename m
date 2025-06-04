Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F6CBA42
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749006451; cv=none; b=gVLxJspTWNgTnQbveC7mrNyuY4qHOdXw3FGLnAYz61SE5SwKcabd4ccDbkE4Bqad/Qf5/MBTpwWK2aelplSe58n16BacEEkZm6hCO9wxzF53C84HcVhIA1KJaN4zt7q0DmILFrUx+nfX9OF529i7t/3B70G3G6d0rGo5KmxryuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749006451; c=relaxed/simple;
	bh=4L02KqkBjtPqz2j+xGRxG5TpnC1OGm39+e357gBUzxM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=FXfDvycVaRBD8GtRoLXbLpt0K+ls5neMeRvuZ+75zxQgCeY2+GjZDFTk/xL+6b6Y8T9o1SbWoUPTaRL9F2FSLjQ3kpDvQ1IFjR5OFJYJomYG0kqMplcVMqCcsI/UtNjaRO5M7kuOjb+pdsAhvp1mHQI6oEaYiOQ+VcVCPG0m1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=rG424Uyp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rG424Uyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9EBC4CEF0;
	Wed,  4 Jun 2025 03:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749006451;
	bh=4L02KqkBjtPqz2j+xGRxG5TpnC1OGm39+e357gBUzxM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rG424UypwnW9ci0sSAea8e7oQ9B3GNjYJpiK2e9ykhPW3p+Tcn2UPk/Yz3XKvVlxp
	 Q0iLBMjS2yIPgH0wT8VCEigaLvdnS0JNyZ4PMuQjEUGFsX8lwngT0hbJ71rKGwe3cX
	 KIw3MqQ8wzuE7YcVFobSRpXCa2/AY1SKbR3VjWoM=
Date: Tue, 3 Jun 2025 20:07:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ritesh Harjani
 <ritesh.list@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Alison
 Schofield <alison.schofield@intel.com>, Yury Norov <yury.norov@gmail.com>,
 Dave Jiang <dave.jiang@intel.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
Message-Id: <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
In-Reply-To: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com> wrote:

> During node device initialization, `memory blocks` are registered under
> each NUMA node. The `memory blocks` to be registered are identified using
> the node’s start and end PFNs, which are obtained from the node's pg_data

It's quite unconventional to omit the [0/N] changelog.  This omission
somewhat messed up my processes so I added a one-liner to this.

>
> ...
>
> Test Results on My system with 32TB RAM
> =======================================
> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
> 
> Without this patch
> ------------------
> Startup finished in 1min 16.528s (kernel)
> 
> With this patch
> ---------------
> Startup finished in 17.236s (kernel) - 78% Improvement

Well someone is in for a nice surprise.

> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
> 
> Without this patch
> ------------------
> Startup finished in 28.320s (kernel)

what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
faster.


