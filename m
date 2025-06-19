Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC9821C9E3;
	Thu, 19 Jun 2025 07:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319939; cv=none; b=hjTSKz/caLPBtHCdJ4m+PUNcBPBQH/jMj51zZ0Af/KmQhN1E82ikw+PuLW/AgiJJbJlGDl1J7ehE9Yc+wa1DKzUl9reegqRPhbM6p9eLN6tpnsOY0eia3Z3tPgztL8dIcdYZItK5zH4a+sVLOoQ9pdG8ykNhTpJ5fa8TzRblnbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319939; c=relaxed/simple;
	bh=udWOnZrRgI2y+PCIemO3YH5qb5fdd89TfRNdT3smMAI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MeaiWW8jnEiWNoPMWZeqKgy9DIRZ17+RUlMHqq40LRs3lAKlaq9l/GrYJeo3E6SnaYnIYl3q19VLmatwQ0ytfoTGCAUk59YERC3J7piWqpdmituXHhb1NXLDNo6UJieAOmpOjoqlkESx7h86pe3xe+25c1J5gVLHZXAU2dH4BOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgAHp5Umw1NoNs+hAA--.11977S2;
	Thu, 19 Jun 2025 15:58:32 +0800 (CST)
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
Subject: [PATCH v3 0/2] Add driver support for ESWIN eic7700 SoC reset controller
Date: Thu, 19 Jun 2025 15:58:11 +0800
Message-Id: <20250619075811.1230-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgAHp5Umw1NoNs+hAA--.11977S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4DGryftF1kWrW8uw43Awb_yoW8tF47pF
	s8GFy7KrsYyrWxXayfJ3WFyFyfXan3tF4UCrW0qw47Aa9xJFy8tr15tF1UAFyDCrs7Xry3
	WF13C34S9Fyqy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

There are some register offsets in reset dt-bindings. It could be used.
Therefore, we want to keep these bindings. I don't known if it meets
the requirements.

PIPE_RST_CTRL, TBU_RST_CTRL and TEST_RST_CTRL are not used in this
driver. Therefore, these are left out.

Updates:

  dt-bindings: reset: eswin: Documentation for eic7700 SoC
  v2 -> v3:
    1. Drop syscon and simple-mfd from yaml and code, because these are
       not necessary.
    2. Update description to introduce reset controller.
    3. Add reset control indices for dt-bindings.
    4. Keep the register offsets in dt-bindings.

  v1 -> v2:
    1. Clear warnings/errors for using "make dt_binding_check".
    2. Update example, change parent node from sys-crg to reset-controller
       for reset yaml.
    3. Drop the child node and add '#reset-cells' to the parent node.
    4. Drop the description, because sys-crg block is changed to reset-
       controller.
    5. Change hex numbers to decimal numbers going from 0, and drop the
       not needed hardware numbers.

  reset: eswin: Add eic7700 reset driver
  v2 -> v3:
    1. Change syscon_node_to_regmap() to MMIO regmap functions, because
       droped syscon.
    2. Add BIT() in function eswin_reset_set() to shift the reset
       control indices.
    3. Remove forced type conversions from function eswin_reset_of_
       xlate_lookup_id().

  v1 -> v2:
    1. Modify the code according to the suggestions.
    2. Use eswin_reset_assert() and eswin_reset_deassert in function
       eswin_reset_reset().
    3. Place RESET_EIC7700 in Kconfig and Makefile in order.
    4. Use dev_err_probe() in probe function.

Xuyang Dong (2):
  dt-bindings: reset: eswin: Documentation for eic7700 SoC
  reset: eswin: Add eic7700 reset driver

 .../bindings/reset/eswin,eic7700-reset.yaml   |  42 ++
 drivers/reset/Kconfig                         |  10 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-eic7700.c                 | 243 +++++++++
 .../dt-bindings/reset/eswin,eic7700-reset.h   | 460 ++++++++++++++++++
 5 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
 create mode 100644 drivers/reset/reset-eic7700.c
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h

--
2.17.1

