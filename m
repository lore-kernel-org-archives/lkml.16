Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5549A1078F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711146; cv=none; b=P7vWPiNEPResIQ791pi2QAgZPKOZAV9vc6bMFyLxSqZJ57tdri31L3iHCjv4QmNQt1Jf3jK14xxKzJ5QHcEfiiQhIedpZYgtQbNiMUlHASXdvjwXKatMqQAQAlOlcmVxLySflf3YINM8Q9QsXQRoMHWrz0fH5yGCRuRkamlz9LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711146; c=relaxed/simple;
	bh=N0XPhPFXZ91uzxjvkdbQokEnb5PmHIj2rHwGW1TsCvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OyUHYkz7KvdvVgRhqpwANBt80gnanQ0voxmSKxWdtLKv5C+jG5Lfbaml+RC8lJlkaWqgbayDXLuMbnfzIYkbxHMUQEhD/ti4Oy2X+1u3isaZ4xK078pNb9yeZOCmjwnWquafB2mfO/hywxxxHhvAntkERp2Phnt4fq+l7/Wix2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29B321E2F;
	Thu,  8 May 2025 06:32:14 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 86CA53F58B;
	Thu,  8 May 2025 06:32:23 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct fwnode_handle forward declaration
Date: Thu,  8 May 2025 14:32:10 +0100
Message-ID: <174671111334.402161.8417024228915220581.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Mar 2025 10:14:53 +0300, Andy Shevchenko wrote:
> The fwnode.h is not supposed to be used by the drivers as it
> has the definitions for the core parts for different device
> property provider implementations. Drop it.
> 
> Since the code wants to use the pointer to the struct fwnode_handle
> the forward declaration is provided.
> 
> [...]

Applied, thanks!

[1/1] coresight: cti: Replace inclusion by struct fwnode_handle forward declaration
      https://git.kernel.org/coresight/c/aad548a9

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
