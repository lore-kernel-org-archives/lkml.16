Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3AC1A3154
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281722; cv=none; b=OjU0vbF6tl0KsIUzIYUdy8Pmm2xtHZ+PFjlYe0EjEX+ZXmN7pvRDca5Bj82bYT6WBxHRB4ZqfAfwem3Z0ejpo5lV5KoWd5ojMwxgosqru7CHEbO8UYBX7l8qNtc7PUMui9DafSqXt/c/HN9Jz6FBm27woS1S0BQ+oueqkjniymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281722; c=relaxed/simple;
	bh=usIxoY+eKjTyTsGhK6YSE+DyYx4F9ZFB4YxEJuBttco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXvP65yV7ogQB+vDhC8jOXZxMUTg+viWnJ0FYMsjZzdkjYVbmU0z6J0E1pmaDvXcnU7iGxt3Z05bk9h+cq1oPrJmSP6TW2xy9nEYP8JyQroQE/kW2gEo1x0TfboIXtz0eMnkh6cs2gn1J32QFRaw/fLltJ6uln0b/a2wp5qXEpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7C461FCD;
	Mon, 30 Jun 2025 04:08:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25F263F6A8;
	Mon, 30 Jun 2025 04:08:39 -0700 (PDT)
Date: Mon, 30 Jun 2025 12:08:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
Message-ID: <20250630110836.GT794930@e132581.arm.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
 <20250627141745.GS794930@e132581.arm.com>
 <5f2527d2-be55-411b-a79b-f628e9fe7f06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f2527d2-be55-411b-a79b-f628e9fe7f06@quicinc.com>

On Mon, Jun 30, 2025 at 06:40:53PM +0800, Yuanfang Zhang wrote:

[...]

> >>> The current implementation uses a fixed timeout via
> >>> coresight_timeout(), which may be insufficient when multiple
> >>> sources are enabled or under heavy load, leading to TMC
> >>> readiness or flush completion timeout.
> >
> > I would suggest that we first make clear if this is a hardware quirk or
> > a common issue in Arm CoreSight.

> sure, now this issue has been found that not only CPU ETM, but also subsystem ETM.

As the commit log states, "sources are enabled or under heavy load,
leading to TMC readiness or flush completion timeout." I would like to
confirm how this situation can happen.

When disabling a CoreSight path, the driver follows a sequential
order: the source device is disabled first, followed by flushing and
disabling the TMC. We expect that there should be no contention
between source devices and the sink when disabling the path. For a
subsystem ETM, I expect we should also follow this sequence.

Leo
