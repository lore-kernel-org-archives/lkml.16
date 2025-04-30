Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277C125DD0A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028106; cv=none; b=MCtGK0RasCknWsxY1ge8caX0ea71CmMFQ1IB2c95YaVnH+k0t3h5uivizNBIXrKopF8DhPdHTMmCDVNKML8rXxM+l0fZ7aJBLJBJJ/TEOz73+F57nNGRGjWvUhhXQ5bCGrzdwLhUmx4pTsqXcxY+ih3SqZvRbkEkqJsSYiC13qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028106; c=relaxed/simple;
	bh=Al4ck2ArHd3tJW/ig/tHE2D09hj/Hq28Bq1uNYgGVQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAR53rfPzI2FV4lDSNBpw6kjtR7TBOECjSY8jJvd/tQRsWi8BrdzkwwLl+rHj+Ro5TpoXUrXRKDPBniiMjv8mCVXi+Ew7EwY3Ueu0PWYyR50bH4MfciwZVdOfb1jeKuG4fj2m0DyxGmsCDWOK+LhnkIYMwHmDcKsirQcwZ8h2rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38DB01063;
	Wed, 30 Apr 2025 08:48:17 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C61703F5A1;
	Wed, 30 Apr 2025 08:48:22 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Suzuki.Poulose@arm.com,
	leo.yan@arm.com,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [PATCH v4 0/7] coresight: Clear self hosted claim tag on probe
Date: Wed, 30 Apr 2025 16:48:14 +0100
Message-ID: <174602806438.102450.17012321873232714214.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
References: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Mar 2025 11:58:45 +0000, James Clark wrote:
> I've gotten stuck a few times with unusable Coresight after a warm boot
> due to lingering claim tags, especially when testing the Coresight
> panic patchsets.
> 
> This change does some tidy ups, adds some debug messages and clears the
> self hosted claim tag on probe. The last two commits are unrelated
> tidyups but they touch some of the same functions so to avoid extra
> conflicts I'm including them here.
> 
> [...]

Applied, thanks!

[1/7] coresight: Convert tag clear function to take a struct csdev_access
      https://git.kernel.org/coresight/c/fc7fed6f
[2/7] coresight: Only check bottom two claim bits
      https://git.kernel.org/coresight/c/a4e65842
[3/7] coresight: Add claim tag warnings and debug messages
      https://git.kernel.org/coresight/c/a244a18c
[4/7] coresight: etm3x: Convert raw base pointer to struct coresight access
      https://git.kernel.org/coresight/c/a1b0e77c
[5/7] coresight: Clear self hosted claim tag on probe
      https://git.kernel.org/coresight/c/7cd63686
[6/7] coresight: Remove inlines from static function definitions
      https://git.kernel.org/coresight/c/48a5126b
[7/7] coresight: Remove extern from function declarations
      https://git.kernel.org/coresight/c/e6e6b692

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
