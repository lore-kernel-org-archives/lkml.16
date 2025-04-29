Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1323D2522A5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949262; cv=none; b=lJx6Dh3tDbXcM0hjbH1plZOYcH1gyZ4ulmuB2P/eKdVebZ3xfq2rtqzMKTNN906VMH1NdOg4rV2RXfE2eJ/stmeMfjOypCF15Cj//+qD67nhRaCz41/Tnl/Gp2zWEnGDADNMesDRwM7exCWdB94o1mAaFARuJPUS/Q6zHUk89iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949262; c=relaxed/simple;
	bh=Q04ONcVYPpGrnvBwLfqX3wWoUKQwyZPdV4UZZMvbL9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=phBTelnY1tzaz+kAAIwvwqUGNTRyR/JQTgvYYVxRRdItxAnzc4PV8choBD2PrU3oarqZ84tlKTEwzdcZPBiL64bfqrLIHR7GmOdot43iPfk1fmdjrUTmDQlPYQuLe0witwVWt5B2jwZqwXRAfPiJmS5TihxM4R4IsfDoBCg5Q0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 682B61424;
	Tue, 29 Apr 2025 10:54:13 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E50033F66E;
	Tue, 29 Apr 2025 10:54:18 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: anshuman.khandual@arm.com,
	James Clark <james.clark@linaro.org>,
	Junhao He <hejunhao3@huawei.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxarm@huawei.com,
	jonathan.cameron@huawei.com,
	yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH] coresight: Fixes device's owner field for registered using coresight_init_driver()
Date: Tue, 29 Apr 2025 18:54:05 +0100
Message-ID: <174594908200.12068.4532771871795444474.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240918035327.9710-1-hejunhao3@huawei.com>
References: <20240918035327.9710-1-hejunhao3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 18 Sep 2024 11:53:27 +0800, Junhao He wrote:
> The coresight_init_driver() of the coresight-core module is called from
> the sub coresgiht device (such as tmc/stm/funnle/...) module. It calls
> amba_driver_register() and Platform_driver_register(), which are macro
> functions that use the coresight-core's module to initialize the caller's
> owner field.  Therefore, when the sub coresight device calls
> coresight_init_driver(), an incorrect THIS_MODULE value is captured.
> 
> [...]

Applied, thanks!

[1/1] coresight: Fixes device's owner field for registered using coresight_init_driver()
      https://git.kernel.org/coresight/c/9f52aecc

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
