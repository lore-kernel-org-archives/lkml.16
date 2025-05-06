Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8791C195811
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526571; cv=none; b=Fa8laIfzdaP60npQ4vrZ8p1vBS4MTnk/ytaDBMgDZw+k53YXm13n+EmkGRCiD0Xv/zNWs0Bq/j3fpASMfEIzxkg7j0OOvMrfkRGG3BiEcUYx754E5HcJwf3njqhW/JOqWjb6D0yLxWIfbGB3dMn3faKVHfix/vl+VZr/oe5Ea9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526571; c=relaxed/simple;
	bh=IyZEhMVWVT852h6Gywv+LtuvUch45I4VEFK0rvlW7nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+u/CqeHc4OwG6tslFOwC8JtWHM1W788TgXoCNFC4fjrUnGNBgGM7vVwfo4pDfM2xLzIR3oyNDK6ravXiepGHLwFEGTnOXFBVfHNmwbA1lc+7IRlCpJFqP7gGx0ZadMYQ/i9ZdiFq0jJOd3p7lPQqOZrVN6f+iDRbHVcJOteR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 353BF113E;
	Tue,  6 May 2025 03:16:00 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B1003F5A1;
	Tue,  6 May 2025 03:16:09 -0700 (PDT)
Date: Tue, 6 May 2025 11:16:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 9/9] coresight: Refactor runtime PM
Message-ID: <20250506101604.GD177796@e132581.arm.com>
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-10-leo.yan@arm.com>
 <0ebbc509-9e17-4b93-9a72-b9e7cc03637e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ebbc509-9e17-4b93-9a72-b9e7cc03637e@arm.com>

On Fri, May 02, 2025 at 02:15:49PM +0530, Anshuman Khandual wrote:
> 
> On 4/23/25 20:47, Leo Yan wrote:
> > The validation for driver data pointers and clock pointers are redundant
> > in the runtime PM callbacks.  After a driver's probing, its driver data
> > and clocks have been initialized successfully, this ensures it is safe
> > to access driver data and clocks in the runtime PM callbacks.  A corner
> > case is a clock pointer is NULL, in this case, the clock core layer can
> > handle it properly.  So remove these redundant checking.
> > 
> > In runtime resume, respect values returned from clock function and add
> > error handling.
> 
> Although not checking drvdata and drvdata->apb_clk does make sense, but
> why change the semantics on the resume paths as well, which now returns
> stored error value from clk_prepare_enable().

Let us assume if a clock fails to enable during the resume flow, with
current code, we miss a chance to detect issues in the first place.

I understand the clock enabling failures are rare, but propagating an
error in the resume callbacks would help identify potential issues.

It seems to me that this patch does not change the semantics of the
resume paths.  It enhances the resume flow for early error reporting.

Thanks,
Leo
