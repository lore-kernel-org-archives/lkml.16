Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B182728D8FA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770168; cv=none; b=mccpPzFmEDad90BKet3G6icr2v7/ib8UnjgYbyvZ2NYSO0eMHuPtvPSQKyaR+ZoJQAuP88BRwyqB2Rt2DEvJOjbnqQ5A8nPziI7pwYmojscp74pcJewCWndWfeOg6GZ9V4LzhOOweDzvnJOwPp1XDg15oJtp0J8Fnu4/J73xRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770168; c=relaxed/simple;
	bh=YScB1qGUb1s4JNacOnfksIVyZLWZQl8zMvrV5X/KOSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvRCi4If2sG7St1rCVY9psvc8051zoju3BsMJ3srRy86ZW6k6ejykHp/0U6vYucFXvWtMaGWWZeUx61lGGszWoyU7Jwo0tBr+fSTpSkuej4b3qzhdNijrbqA1VdRmEUcQ3E/zQQtyNxLl8U8R2I1APeLR4r0PajVZTFfbri8zFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1361113E;
	Tue, 24 Jun 2025 06:02:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D7A43F58B;
	Tue, 24 Jun 2025 06:02:42 -0700 (PDT)
Date: Tue, 24 Jun 2025 14:02:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Keita Morisaki <keyz@google.com>, suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	ericchancf@google.com, linux-kernel@vger.kernel.org,
	mike.leach@linaro.org, yimingtseng@google.com
Subject: Re: [BUG] CoreSight: WARN_ON in coresight_disclaim_device_unlocked
 due to register reset on CPU power-cycle
Message-ID: <20250624130240.GN794930@e132581.arm.com>
References: <20250620101906.3762866-1-keyz@google.com>
 <20250623085937.894003-1-keyz@google.com>
 <5428619b-db7c-4b5b-964d-1466e516c245@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5428619b-db7c-4b5b-964d-1466e516c245@linaro.org>

On Mon, Jun 23, 2025 at 01:05:13PM +0100, James Clark wrote:

[...]

> Hi Keita,
> 
> Thanks for the report. We discussed internally and decided that it would be
> better for the driver to always save the context by default, because this
> mistake is easy to make. Saving when it doesn't need to be saved doesn't do
> any harm, but not saving when it should be causes quite bad bugs.
> 
> So "arm,coresight-loses-context-with-cpu" will be ignored in the future and
> we'll add a new flag like "arm,coresight-save-context" if anyone wants the
> optimization of not saving.

I'm a bit concerned that we might provide information that has not yet
been finalized.

Before landing any changes in the mainline kernel, at this stage, I'd
recommend using the option "coresight_etm4x.pm_save_enable=2" in the
Linux kernel command line. This provides a reliable configuration for
production environment, as it ensures consistency between the current
mainline kernel and any future versions.

Setting coresight_etm4x.pm_save_enable=2 overrides any setting in the
device tree binding and always enables context save and restore for
the ETM / ETE.

If coresight_etm4x.pm_save_enable is set to 1, the ETM driver will
never perform context save and restore. Setting it to 0 (the default
value) allows the device tree or ACPI to determine whether context
save and restore should be performed.

If you are trying to upstream the DT binding for ETE, you need to omit
the property "arm,coresight-loses-context-with-cpu" since it is not
defined in the ETE device tree YAML schema now. As James mentioned, we
need to consolidate this part.

Thanks,
Leo
