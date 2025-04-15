Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCF72DFA23
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705973; cv=none; b=ndL6b6f8/bhed87osi/ij0NYSq6udckT/TS+SAXPYd9EZ96ZYY/1Y3tM6IujbpNffAzf7ZV5qAjrCl/o7LWX0+VpWfrpXoE3Bt0nJqRa8CUO27X0veouvW4bFIQKyMp2Ow+Sb4sFRuYsAJIDgidCRhUjbJN0qd9qwFrqxpZO21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705973; c=relaxed/simple;
	bh=UMxtwlRz0GAwu6surQiT21cmWeAzM++nsmAFg830Qg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC2ASmQMuT/GoCLUMHZWZkI9sAI/AxgLWCNjdp4uLW9LU9n2mLVeneNAT57VCD8JDE+BWf3SqzXeXbQ4w0lPcJ696i2e+QJ9LgKATO2rgXcC3xHuuuVoJ7o9mcyut97w+LSKhES5nqZT7+VlLhcW447IfJuK+jpGroEQ5cmBZnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99D03339;
	Tue, 15 Apr 2025 01:32:49 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 694AE3F694;
	Tue, 15 Apr 2025 01:32:50 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:32:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory
 region handling
Message-ID: <20250415-cream-jackrabbit-of-psychology-57f038@sudeepholla>
References: <20250411112539.1149863-1-sudeep.holla@arm.com>
 <0e34d68f-c5fb-4fdb-90bf-2ce005c7cf66@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e34d68f-c5fb-4fdb-90bf-2ce005c7cf66@huawei.com>

On Tue, Apr 15, 2025 at 02:26:40PM +0800, lihuisong (C) wrote:
> +Wei who is Hisilicon SoC maintainer.
> 
> 在 2025/4/11 19:25, Sudeep Holla 写道:
> > The PCC driver now handles mapping and unmapping of shared memory
> > areas as part of pcc_mbox_{request,free}_channel(). Without these before,
> > this Kunpeng HCCS driver did handling of those mappings like several
> > other PCC mailbox client drivers.
> > 
> > There were redundant operations, leading to unnecessary code. Maintaining
> > the consistency across these driver was harder due to scattered handling
> > of shmem.
> > 
> > Just use the mapped shmem and remove all redundant operations from this
> > driver.
> > 
> > Cc: Huisong Li <lihuisong@huawei.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Reviewed-by: Huisong Li <lihuisong@huawei.com>

Thanks and sorry for dropping it assuming you will pick it up.
The maintainers file just list you.

Wei,

Let me know if you want me to repost or if you can pick it from [1]

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20250411112539.1149863-1-sudeep.holla@arm.com/
