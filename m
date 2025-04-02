Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F02A4C92
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743605682; cv=none; b=rqAdbYa3fVhfaZqhWXkSYsILYoSA9a8dc1aROlke6UEs/nnNeYpk1ZJu8kAzPkwp7TLvE4HxZoPZnbZxWtupHlhyQHtYD0gITNjG0FLqhpnX3I9VwR0j6IjsscevfuS7IL8638dHoR7KVfKsz7ivwriSEP4eO8R0s3+rsfIL3dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743605682; c=relaxed/simple;
	bh=b+TRDotz0rC6p1aYvj4S7EV7hecj+F0/UKBfxXMs/2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkq/AoFB5CRUmmHEA5vy3snz3NytSSQptcGR9qeoBPHLwS3Y89ERu8z1p/wUfdJok//GQlzSyc9B+uIQwRYubrE8jeeyolbbv0oI2pVqR0qXqILEHTCfi13T2QJVYhUYQ9fHhG3VahzxawCGLQzEUXerPmWul9ltYYZ1OS7hoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB179106F;
	Wed,  2 Apr 2025 07:54:42 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51AA73F694;
	Wed,  2 Apr 2025 07:54:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:54:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	dan.carpenter@linaro.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: Break to error handler if connection can't be
 made
Message-ID: <20250402145434.GN115840@e132581.arm.com>
References: <20250402-james-cs-ret-break-fix-v1-1-83907d9f6b38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-james-cs-ret-break-fix-v1-1-83907d9f6b38@linaro.org>

On Wed, Apr 02, 2025 at 02:07:59PM +0100, James Clark wrote:
> Change the return to a break so that the of_node_put()s in the error
> handler are hit on failure.
> 
> Fixes: 3d4ff657e454 ("coresight: Dynamically add connections")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-arm-kernel/3b026b3f-2cb2-49ef-aa20-8b14220f5324@stanley.mountain/
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>
