Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF12B27A44B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530350; cv=none; b=iwr+JMV7DRoCGzGXndSleRhL0/0pUexCNt4UswPtgtI8Qq3s450aRUrkFDNyeUAqlzoy5IOdljOo1YoSP/mAekUlnI/jVCEQ0rRQExF6n0x69U5vgYSJxYVXLDLSiTNSgXh4SObP6QnWKtxzBIwnNp/7u98cSQE5wsDdazYst6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530350; c=relaxed/simple;
	bh=zSxNeVn7RsqeO5F0gf3v+RacF/UCcWTnCI8g4heswO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Urr5mjxsQMe4UL8qZulYHXA09l6WEIr2GgaBJCtYU0lGNBzxtQ8R+r9X8Mo+4C9YxarOu7dMjM8qlOayjhm3NxiVigNALfrmxsdACRp74OHctY3R71VrFgUK55ab9D7/aJzFfdtRxA7PtprPmATggbSbly+XFVi9O3lIBB2rJBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7739C113E;
	Tue,  6 May 2025 04:18:57 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D87313F58B;
	Tue,  6 May 2025 04:19:05 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: Disable MMIO logging for coresight stm driver
Date: Tue,  6 May 2025 12:18:55 +0100
Message-ID: <174653027594.249274.16868070141391682997.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506075743.1398257-1-quic_jinlmao@quicinc.com>
References: <20250506075743.1398257-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 May 2025 00:57:43 -0700, Mao Jinlong wrote:
> With MMIO logging enabled, the MMIO access are traced and could be
> sent to an STM device. Thus, an STM driver MMIO access could create
> circular call chain with MMIO logging. Disable it for STM driver.
> 
> [] stm_source_write[stm_core]+0xc4
> [] stm_ftrace_write[stm_ftrace]+0x40
> [] trace_event_buffer_commit+0x238
> [] trace_event_raw_event_rwmmio_rw_template+0x8c
> [] log_post_write_mmio+0xb4
> [] writel_relaxed[coresight_stm]+0x80
> [] stm_generic_packet[coresight_stm]+0x1a8
> [] stm_data_write[stm_core]+0x78
> [] stm_source_write[stm_core]+0x7c
> [] stm_ftrace_write[stm_ftrace]+0x40
> [] trace_event_buffer_commit+0x238
> [] trace_event_raw_event_rwmmio_read+0x84
> [] log_read_mmio+0xac
> [] readl_relaxed[coresight_tmc]+0x50
> 
> [...]

Applied, thanks!

[1/1] coresight: Disable MMIO logging for coresight stm driver
      https://git.kernel.org/coresight/c/6264f1df

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
