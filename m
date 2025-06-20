Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C11DD543
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750436232; cv=none; b=BKaHwKdNzAaO2QgFihNCHzQ3jXnXZ9jMPvtw7AieEfQSVvTFNnAGdUeALJRwtPszwkmeMRMADpqH+dTNv+FZ554Opp2IuGn2hcImu4Vhspc4x/olgHwOC8aBuXpV3vQQslbRhT0tdMsP+lgIFeHj92qwYjIyfUFh4gCrMW9GfmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750436232; c=relaxed/simple;
	bh=sHOHb/kdSli3XrfPYzOTC5BVSj7i87pNZyL9RXYb4zY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UGGyO3bus1m7Gq6GchknlD6+Z8kc2RL0jDsCkr04dJ4Cf+OnSndFMCIYqXFnDS6L7GQjSNX7W8lA+AzRCosWTF8JUM3IBLKvhHPMmZlX9H7N7cjD/XYm9Cy2g9yk7cGQbWbTA1ddT7UOjxxUFXKusbddtm+7/1cW+OEsVmqPRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNk38V/e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNk38V/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DE1C4CEE3;
	Fri, 20 Jun 2025 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750436232;
	bh=sHOHb/kdSli3XrfPYzOTC5BVSj7i87pNZyL9RXYb4zY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WNk38V/eUpny13KTvQg4Yv2OaZJNYm9hDA3zdwabhEwIrReuLjnSL1ATt5lX0q5fW
	 hTbjQ5b++WWm05DuXC2ZWUfKyw7RLNwUb/6biBjyMeNzvau9Qw1vYKTvaxN9BUn+tN
	 fuRklBj8qxpezeIOz4KsUb85dtPom/S6whkDcLrBAXar1VRozEcezb/6g3VT/WSi/j
	 H5f8x8HYU9tKMq+8kcizCV8x03KiN5c7UxIRATgRAXaESMD2+qnz5HpN+Xi0V+ebGO
	 Dk2KlRJe13T1vo5DxG2t+NPk3Z9gEEbmNg/4MbHaFSFLm7M87h/QnBnVTTi3wdYJtU
	 nm5sPsrE+62qA==
Date: Fri, 20 Jun 2025 11:17:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 03/27] PCI: Protect against concurrent change of
 housekeeping cpumask
Message-ID: <20250620161710.GA1296438@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620152308.27492-4-frederic@kernel.org>

On Fri, Jun 20, 2025 at 05:22:44PM +0200, Frederic Weisbecker wrote:
> HK_TYPE_DOMAIN will soon integrate cpuset isolated partitions and
> therefore be made modifyable at runtime. Synchronize against the cpumask
> update using appropriate locking.

s/modifyable/modifiable/

> Queue and wait for the PCI call to complete while holding the
> housekeeping rwsem. This way the housekeeping update side doesn't need
> to propagate its changes to PCI.

What PCI call are we waiting for?  I see housekeeping_lock(), but I
assume that's doing some housekeeping-related mutual exclusion, not
waiting for PCI work.

I don't know how to use housekeeping_lock() or when it's needed.  Can
you add some guidance here and at the housekeeping_lock() definition?

> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  drivers/pci/pci-driver.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index 67db34fd10ee..459d211a408b 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -362,7 +362,7 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>  	dev->is_probed = 1;
>  
>  	cpu_hotplug_disable();
> -
> +	housekeeping_lock();
>  	/*
>  	 * Prevent nesting work_on_cpu() for the case where a Virtual Function
>  	 * device is probed from work_on_cpu() of the Physical device.
> @@ -392,6 +392,7 @@ static int pci_call_probe(struct pci_driver *drv, struct pci_dev *dev,
>  		error = local_pci_probe(&ddi);
>  out:
>  	dev->is_probed = 0;
> +	housekeeping_unlock();
>  	cpu_hotplug_enable();
>  	return error;
>  }
> -- 
> 2.48.1
> 
