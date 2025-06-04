Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571C31F4C8C;
	Wed,  4 Jun 2025 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027127; cv=none; b=loFdYzhNqGlLcR4l/3Cq3nmEmUkwPKEF5yKRYSiG1Qe/ViQkM2ddld11ZHxeZfOWFEOwniaoemhkTDe4qEt1BHXGWoZwyZxy6w1Z2GGOIeQxwmIKl28+XO+vK/wSJtgLUFNoaQ62dNq2Nrn2aMF/obQZ4SwQmE3Ks6BdOpzvuDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027127; c=relaxed/simple;
	bh=xYJYPbaoiF9+QAj2dzfC0IGF3ptBh3Tp2dnzcA+LaCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=INKj5aiNL3mWd1LwzVviBjsqmCaI5flFM5AE8tyZP3nRMPT5L3atQ1LW1uSZ6WBhsOO2hkiAYSZd3MvxRAEYU10oRlbEaJhTYgaX9OLgrGNmmMRK+iAOIROH04N/BP59sWuRTZ4Dqc1uLyXxHBHgS7NsNh7qxkko7hsufqP2+Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgBnBpUPCUBot2KaAA--.50197S2;
	Wed, 04 Jun 2025 16:51:29 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v2 0/2] Add driver support for ESWIN eic7700 SoC reset controller
Date: Wed,  4 Jun 2025 16:51:24 +0800
Message-Id: <20250604085124.2098-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgBnBpUPCUBot2KaAA--.50197S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww43tFyrWF45Kr1rZw1UJrb_yoW8Xr1rpF
	4DWFyfKrsYvFWxJayfJa4Fkw1fXFs3tFW5Crs2y3WxJa9xAas0qr45tF1jyFykCw4xJry3
	WF1ag34S9FWjyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbknY7UUUUU==
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Updates:

  dt-bindings: reset: eswin: Documentation for eic7700 SoC
  v1 -> v2:
    1. Clear warnings/errors by using "make dt_binding_check".
    2. Update example, change parent node from sys-crg to reset-controller
       for reset yaml.
    3. Drop the child node and add '#reset-cells' to the parent node.
    4. Drop the description, because sys-crg block is changed to reset-
       controller.
    5. Change hex numbers to decimal numbers going from 0, and drop the
       not needed hardware numbers.

  reset: eswin: Add eic7700 reset driver
  v1 -> v2:
    1. Modify the code according to the suggestions.
    2. Use eswin_reset_assert and eswin_reset_deassert in function
       eswin_reset_reset.
    3. Place RESET_EIC7700 in Kconfig and Makefile in order.
    4. Use dev_err_probe() in probe function.

Xuyang Dong (2):
  dt-bindings: reset: eswin: Documentation for eic7700 SoC
  reset: eswin: Add eic7700 reset driver

 .../bindings/reset/eswin,eic7700-reset.yaml   |  41 +++
 drivers/reset/Kconfig                         |  10 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-eic7700.c                 | 234 ++++++++++++++++++
 .../dt-bindings/reset/eswin,eic7700-reset.h   |  73 ++++++
 5 files changed, 359 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
 create mode 100644 drivers/reset/reset-eic7700.c
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h

--
2.17.1

