Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D06A2C179F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936771; cv=none; b=Od2vycsKRs1MP6hbI9Dl1CniCeXmwgnUu7+YYd3uQZGPzVgUlpoyMHUB87L7X3erYjkXvVosQ5X6yxFYzW58ODiuHnSyZoXLgPcPN4GeB8h4g2K2TyQIb7wHN9oR7kQvftJLS5fUiUURyHhYR4SWJR04VXIxwJs1rdJFpULmXA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936771; c=relaxed/simple;
	bh=FV9zsPW+AHUsqrVyH1X01rs3cKB0bQsJYt5QiL09+Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuNDa/suktiwbNgCh2R7m8N5hnqx9mWWfu84OgySh4lqdiEFgwXHqfjBawqqOuwhy6LfAbV4cPnkUOe/SmPBEEvRWzy2EFVlXSuUfKTTa7wrezR4MKizYIWak1uLss4YzjyMIkzp9uZN8YUGcT7NCklQ91s8BSXmmYaCULfalkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF8AB1515;
	Tue, 29 Apr 2025 07:26:01 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97E263F66E;
	Tue, 29 Apr 2025 07:26:04 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:25:54 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: James Morse <james.morse@arm.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	shameerali.kolothum.thodi@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com, lcherian@marvell.com,
	bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
	dfustini@baylibre.com, amitsinght@marvell.com,
	David Hildenbrand <david@redhat.com>,
	Rex Nie <rex.nie@jaguarmicro.com>, Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
Subject: Re: [PATCH v9 27/27] MAINTAINERS: Add reviewers for fs/resctrl
Message-ID: <aBDhcnqKabZCLhf4@e133380.arm.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-28-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425173809.5529-28-james.morse@arm.com>

Hi,

On Fri, Apr 25, 2025 at 05:38:09PM +0000, James Morse wrote:
> resctrl has existed for quite a while as a filesystem interface private to
> arch/x86. To allow other architectures to support the same user interface
> for similar hardware features, it has been moved to /fs/.
> 
> Add those with a vested interest in the common code as reviewers.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46f7365bb9ac..3a878ca99a78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20338,6 +20338,8 @@ F:	tools/testing/selftests/net/rds/
>  RDT - RESOURCE ALLOCATION
>  M:	Tony Luck <tony.luck@intel.com>
>  M:	Reinette Chatre <reinette.chatre@intel.com>
> +R:	Dave Martin <Dave.Martin@arm.com>

I'm happy to do this, though my conributions may continue to be a bit
intermittent.

Acked-by: Dave Martin <Dave.Martin@arm.com>

> +R:	James Morse <james.morse@arm.com>
>  L:	linux-kernel@vger.kernel.org
>  S:	Supported
>  F:	Documentation/filesystems/resctrl.rst

[...]

Cheers
---Dave
> 
> 
