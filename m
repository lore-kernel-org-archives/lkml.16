Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A573B19A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099845; cv=none; b=YTwBWmSIjpahpeBeqd93I29TSRhWrJ1KT/POsgkDCC62KcLV0cVs3naEn0cSjvzmfRkEQ1k4dJ7opQCJMi5/MdU4KDi38GlYyHbM3GWVerdZkKPOBjnh2X0bGsG5ZLra5QV1gv+OIG8mOnmTurv49wMzl3OWqk9pqOgD2ULX2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099845; c=relaxed/simple;
	bh=234vfinzMuTwGo1WRa4S1Yb5VGa87edI+QIe4qBYNTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IzO/yK/jj/R5WwXOPqnWB7H0hn24WwrhLe0uT7EEFO0lTtvnz+gjXAqHHYFoWqfaPSiIGzy6HSg0X0SggmxuQ6FDnDV5Li9x9IypZLVmpYi+e6m/EzUJQ8J6hXLKmaRfced5teHRMSQD2D1YMSAazyCxMNQIKfqcf6JtZhtE4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75F4F106F;
	Thu,  1 May 2025 04:43:55 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E710A3F5A1;
	Thu,  1 May 2025 04:44:01 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] coresight: Add a KUnit test for coresight_find_default_sink()
Date: Thu,  1 May 2025 12:43:48 +0100
Message-ID: <174609979621.109219.15114241709800994823.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312-james-cs-kunit-test-v4-1-ae3dd718a26a@linaro.org>
References: <20250312-james-cs-kunit-test-v4-1-ae3dd718a26a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Mar 2025 10:31:57 +0000, James Clark wrote:
> Add a test to confirm that default sink selection skips over an ETF
> and returns an ETR even if it's further away.
> 
> This also makes it easier to add new unit tests in the future.
> 
> 

Applied, thanks!

[1/1] coresight: Add a KUnit test for coresight_find_default_sink()
      https://git.kernel.org/coresight/c/b104a941

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
