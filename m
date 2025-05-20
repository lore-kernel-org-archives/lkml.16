Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F2B2517AC;
	Tue, 20 May 2025 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754326; cv=none; b=Lwe0SDurUPj6YxIqAotWkpAMDzvKaQK8WqJNnIoBFBacOP0iwRU8xtjmXRS6dm5wlauSjUDqneYBaThvM5W0y/RkfA8II5YImwCkg9LUpSYOhiFmKi3TbqfM8pwZA/rMQSfteXMuMtaPNeTycRHZd+1uP4r4MPIo1/nqjv72bYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754326; c=relaxed/simple;
	bh=mklZJMtczF/1cTQTLPSTUCQ7tAy+D/rWEQd/aPffxIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sH+VUj0sry9DaIZS9OFUYwY6sSVGNJFuHDOVBwCNQH+Xl5p9kMDXaptdTzymA7lrCSoebikEjOvYueabflEiLoiPgOc38Kz8eYq/j8vxknqhZjue8BqjOUL2l7tGN/ddhC0tUsFcwhBkxeDzduazGnFYsJxU+IHvZx/LagbK6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D3DA1516;
	Tue, 20 May 2025 08:18:29 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D4F63F6A8;
	Tue, 20 May 2025 08:18:41 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: Re: [PATCH v2] coresight: tmc: fix failure to disable/enable ETF after reading
Date: Tue, 20 May 2025 16:18:29 +0100
Message-ID: <174775429686.297706.16091978841139084085.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507063716.1945213-1-quic_jinlmao@quicinc.com>
References: <20250507063716.1945213-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 May 2025 23:37:16 -0700, Mao Jinlong wrote:
> ETF may fail to re-enable after reading, and driver->reading will
> not be set to false, this will cause failure to enable/disable to ETF.
> This change set driver->reading to false even if re-enabling fail.
> 
> 

Applied, thanks!

[1/1] coresight: tmc: fix failure to disable/enable ETF after reading
      https://git.kernel.org/coresight/c/d23bc38e

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
