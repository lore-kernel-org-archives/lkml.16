Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C8E2206BA;
	Thu, 24 Apr 2025 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487793; cv=none; b=R7JLlDZduMRP4hmcvi5Olfx14h288fosLXAcGGwXKLFgZClhtCAXpATXbnaCrSz8LAkWDT9FrHiq6eJ0U5mX/IT5jzB1ggqmJX+TyfcdCatBbsgldQI+KGcQFr/83CIN0RKdWvDJXlUj/Avu01cpvUuk/6wVaTI7rCL/AgVgBgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487793; c=relaxed/simple;
	bh=SJJQwM0K4kTMy8/vKsRwyupQH1GD+wcoY4KddBW37Xc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rv4+0bVIZC8f3uq3QrMyQeGb5YBoQhqKSIhIznR7JiOkoaWT/yHbBtiW2Cho3PicgstcsE0oRmIrl5fbOaDPGegc9ism4rpcsaB9nJBbyPuExJlDOJTRwAu1rG8nVsP7QyNgxG1Clne7nAHhMII12fBZdLI2C/sEk39hvjNykb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E0FC1063;
	Thu, 24 Apr 2025 02:43:06 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FE193F66E;
	Thu, 24 Apr 2025 02:43:08 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 0/7] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Date: Thu, 24 Apr 2025 10:43:01 +0100
Message-Id: <174548766597.774610.5988184547101192085.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 08 Apr 2025 16:44:24 +0800, Peng Fan (OSS) wrote:
> i.MX95 System Manager(SM) implements Logical Machine Management(LMM) and
> CPU protocol to manage Logical Machine(LM) and CPUs(eg, M7).
>
> To manage M7 in a separate LM or in same LM as Linux itself. LMM APIs
> and CPU APIs are needed.
>
> When M7 is in LM 'lm-m7', and this LM is managable by 'linux-lm',
> linux could use LMM_BOOT, LMM_SHUTDOWN and etc to manage 'lm-m7'.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/7] firmware: arm_scmi: imx: Add LMM and CPU documentation
      https://git.kernel.org/sudeep.holla/c/15ec0e776935
[2/7] dt-bindings: firmware: Add i.MX95 SCMI LMM and CPU protocol
      https://git.kernel.org/sudeep.holla/c/73b7a51b7445
[3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
      https://git.kernel.org/sudeep.holla/c/34180863e000
[4/7] firmware: arm_scmi: imx: Add i.MX95 CPU Protocol
      https://git.kernel.org/sudeep.holla/c/e68c305bc2f3
[5/7] firmware: imx: Add i.MX95 SCMI LMM driver
      https://git.kernel.org/sudeep.holla/c/7242bbf418f0
[6/7] firmware: imx: Add i.MX95 SCMI CPU driver
      https://git.kernel.org/sudeep.holla/c/1055faa5d660
[7/7] MAINTAINERS: add entry for i.MX SCMI extensions
      https://git.kernel.org/sudeep.holla/c/b0a1c9d4893a
--
Regards,
Sudeep

