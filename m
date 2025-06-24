Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net [129.150.39.64])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072E91F7580;
	Tue, 24 Jun 2025 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.150.39.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761167; cv=none; b=kshPV9AaR4wpT/QTbawQMAlrxdZzUGtn4rd9dxtclVXTE/m7FTwRKJD0qQOELFMhjeAl4205FLpE9WYGGa07VyIrE6kETbcpWmg26CZaaj0LxaTwP0i5YNQf0Gok0tXl2oKdqBrlJmnnxYCz5d2OmWMrbY3Y8shpeHZ7jZ/hbcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761167; c=relaxed/simple;
	bh=XDBfBT0G8ICHz1wGxAz8l/WkiP++vKmA+8ZcMiejvcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YAeJggvFZrl6bZToeY/Edo338mkaxEnZ1q/WeNXNVrAgnRbGee2cJI0CGfviMrMDi/Tx/T7+qxB87t0rTQWwJyGDIcfsZwxXVgjus5+XSdFHQNpWbpevcIgzJh1L2ZiE7ZzrP8vxk+Lkb7bPW0e5/cKLsmcRUIVBH174NNlN5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=129.150.39.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgDn_Q61flpoP7KkAA--.57336S2;
	Tue, 24 Jun 2025 18:32:23 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v3 0/2] Add driver support for ESWIN eic700 SoC clock controller
Date: Tue, 24 Jun 2025 18:32:12 +0800
Message-Id: <20250624103212.287-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDn_Q61flpoP7KkAA--.57336S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4fCr43tw4rCr1kKw1xXwb_yoW8CFW7pF
	4DGryFyr1qvFyxZayxta4rKryrZ3Z7JFWjkrWxZ3WUZasIya48tF4fJa4DAF97Aw1xAw13
	JF1q9ayrCF4UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmjgxUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Updates:

  dt-bindings: clock: eswin: Documentation for eic7700 SoC
  v2 -> v3:
    1. Update example, drop child node and add '#clock-cells' to the
       parent node.
    2. Change parent node from sys-crg to clock-controller for this yaml.
    3. Drop "syscon", "simple-mfd" to clear warnings/errors by using
       "make dt_binding_check". And these are not necessary.

  v1 -> v2: Update example, drop child node.
            Clear warnings/errors for using "make dt_binding_check".
            Change to the correct format.

  clock: eswin: Add eic7700 clock driver
  v2 -> v3:
    1. Add "cpu-default-frequency" definition in yaml for "undocumented
       ABI".
    2. Drop Reviewed-by, this is misunderstanding. We have not received
       such an email.

  v1 -> v2: Drop some non-stanard code.
            Use dev_err_probe() in probe functions.

Xuyang Dong (2):
  dt-bindings: clock: eswin: Documentation for eic7700 SoC
  clock: eswin: Add eic7700 clock driver

 .../bindings/clock/eswin,eic7700-clock.yaml   |   46 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/eswin/Kconfig                     |   10 +
 drivers/clk/eswin/Makefile                    |    8 +
 drivers/clk/eswin/clk-eic7700.c               | 3809 +++++++++++++++++
 drivers/clk/eswin/clk-eic7700.h               |  194 +
 drivers/clk/eswin/clk.c                       |  972 +++++
 drivers/clk/eswin/clk.h                       |  213 +
 .../dt-bindings/clock/eswin,eic7700-clock.h   |  588 +++
 10 files changed, 5842 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
 create mode 100644 drivers/clk/eswin/Kconfig
 create mode 100644 drivers/clk/eswin/Makefile
 create mode 100644 drivers/clk/eswin/clk-eic7700.c
 create mode 100644 drivers/clk/eswin/clk-eic7700.h
 create mode 100644 drivers/clk/eswin/clk.c
 create mode 100644 drivers/clk/eswin/clk.h
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h

--
2.17.1

