Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A691E521
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746021329; cv=none; b=ZwllJM+H/YgmS9+v2vHDxGImKSPdclUwSKvbhiTLed55T/+d5jp3+THAPc1jBKqKjLi26QJMUAjzeSxH7uyKQj+Y0/rRCj982A9y7vF8j4JNHaK16Lt7Aiqm78uwwFcvRmwIXugWD1dcrd7BcD4AvjCTx5Wv+ba6MBODC5KGB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746021329; c=relaxed/simple;
	bh=5XXmqhRaQi3hsCNmeeReWo7KN3BC5B2OKkgxs1lFehU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGWHehzkpWE7X8ykFUYjdaUGW1sziUe7bu5n7fo8ad8SdEUnH9oJy9+yK0odelqL4ykdqchuSdaFCgewdtTrVLG7oBtsDU3qXR5CtrdOf8OVSnRIJukph/YMTPNk1tYDqxLJ5LMybmy/wOuRCpnW0DZljFKjnAmOibrJJztFeNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F390106F;
	Wed, 30 Apr 2025 06:55:20 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D7CD3F673;
	Wed, 30 Apr 2025 06:55:26 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
Date: Wed, 30 Apr 2025 14:55:12 +0100
Message-ID: <174602129798.56812.10570639925939232972.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429231301.1952246-1-yabinc@google.com>
References: <20250429231301.1952246-1-yabinc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Apr 2025 16:12:58 -0700, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously. This patchset
> is to fix race conditions when enabling/disabling a CATU device.
> 
> Changes since v4:
>  - Collect Review-by tags.
>  - return -EINVAL for unknown types in coresight_enable_path.
> 
> [...]

Applied, thanks!

[1/2] coresight: catu: Introduce refcount and spinlock for enabling/disabling
      https://git.kernel.org/coresight/c/a03a0a08
[2/2] coresight: core: Disable helpers for devices that fail to enable
      https://git.kernel.org/coresight/c/f6028eee

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
