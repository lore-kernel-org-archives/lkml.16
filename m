Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84966522F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750111275; cv=none; b=ZxpK58PQhSPnWVI8f3DUt4xQ0C0xyAjDA2SC+APnZp8FWVu/e5bfhNbSLxezPW804xEEcdfaTYXf3TublAb3nkqFQVuMsAJeBomRwtcnKIdSbaVFE0lTh4Rn1CyrIUXZwfrrv1qmreOW/71aH3VsblUHpVPc6ZtyoIFkj24u3EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750111275; c=relaxed/simple;
	bh=q7tD4d0yNr2pbj8cYfhujZP3byO/0ot0K8Igx0jNNuE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gD+uMGJlolD6kZpGREfqs5u6b1IipFGjOwah1LT/FNqqmFzoujsI8TnMQq15MYwXT9TAnP7fMXi+G7TOEXCRgTTIH3WrJvjYhExLZ0DDm9akJciXNJ1FJh49o30nOcj+D8aEvOrXBJ8o0KuN06NnxsGzXCG6BgnZ1+w3wDGuBQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iL+3CM+D; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iL+3CM+D"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4s03yPEhF45+lWh5hyBpMppSw2oqj+GdWmyYq1pWC3U=;
	b=iL+3CM+DtVo4+gmEcNyja3IwWUGWPIvvvUP9mUdkZpBaCIC8Z8NAxdgHcEBFZgeO8YSfJa
	oNioV1esuk2dUqqUWhTtNaQH8m1XvDXAl6NtTGNZf1TOwE849tKso4U0wbTTOG6SBRnFox
	+qb/om8Jl/33MlLXRAD+sz9iVuLAUT0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/9] spi: zynqmp-gqspi: Support multiple buses and add GPIO support
Date: Mon, 16 Jun 2025 18:00:45 -0400
Message-Id: <20250616220054.3968946-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This device really has two SPI buses but they are currently determined
by the slave's CS. Decouple bus selection from CS, and add support for
GPIO chipselects. This allows adding arbitrary devices on either bus.

This version does the bus selction using a spi-buses property in
slaves's node, as opposed to having separate nodes for the upper and
lower buses. This should be backwards compatible with existing bindings,
and could allow supporting "parallel" memories in the future (identical
flashes on both buses controlled in lockstep).

Changes in v2:
- Add spi-buses property
- Update spi-zynqmp-qspi.yaml with new binding style
- Support multi-bus controllers
- Add flag to determine default bus
- Support multiple buses with spi-buses instead of explicit
  upper/lower/merged buses

David Lechner (2):
  dt-bindings: spi: Add spi-buses property
  spi: Support multi-bus controllers

Sean Anderson (7):
  dt-bindings: spi: zynqmp-qspi: Add example dual upper/lower bus
  spi: Add flag to determine default bus
  spi: zynqmp-gqspi: Support multiple buses
  spi: zynqmp-gqspi: Pass speed directly to config_op
  spi: zynqmp-gqspi: Configure SPI mode dynamically
  spi: zynqmp-gqspi: Support GPIO chip selects
  ARM64: xilinx: zynqmp: Add spi-buses property

 .../bindings/spi/spi-peripheral-props.yaml    |  10 ++
 .../bindings/spi/spi-zynqmp-qspi.yaml         |  22 ++-
 .../boot/dts/xilinx/zynqmp-sm-k26-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zc1254-revA.dts    |   1 +
 .../dts/xilinx/zynqmp-zc1751-xm015-dc1.dts    |   1 +
 .../dts/xilinx/zynqmp-zc1751-xm018-dc4.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu104-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu104-revC.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu1275-revA.dts   |   1 +
 drivers/spi/spi-zynqmp-gqspi.c                | 155 ++++++++++++++----
 drivers/spi/spi.c                             |  31 +++-
 include/linux/spi/spi.h                       |  15 ++
 15 files changed, 208 insertions(+), 35 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

