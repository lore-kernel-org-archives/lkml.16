Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807B11E5B9C;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863109; cv=none; b=d3LZilRjGB6v/fJ1Rcu25F0Fbc7j1EYp3nLr8jiMhKRCaFGSiW4tpJMIfh6gAt08sopeFiko5wup91q46XSdJLJvciAt13FGfLNiTFA/ghycGppdqk/jFrhOmJfhsHss1w/tP3DAmqTKOku5U+BkeahJYL7wUE81l0Y3J5HVIxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863109; c=relaxed/simple;
	bh=CUo/MimrCW1xHj5d7fHDtNMddbwaaGdTDWDyY+tLI84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FE3O6fAqJNuMl/ZUusmHgOH/rMh2XX94LanYhCTljAu3AF6nCx5nrE7jYj+aht2ho0zr0v9S2v3S35Hcn34auuv841OiNYbXScWQCoTyRY28rkNyofqX9nKd/CcNTYcTBfDdNXewdKpwcWlo3ACA6T7MRJrfu64u+D7ZK+qw8uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYy0kgX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYy0kgX5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4BB3C4CEE2;
	Sat, 10 May 2025 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=CUo/MimrCW1xHj5d7fHDtNMddbwaaGdTDWDyY+tLI84=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YYy0kgX5lVaXFTKrYRGliD8DTCl5jxlh4Nayz0Wb+66AFxLc20MuO/3+CziqiiX/x
	 qk24j8sGwyjrh8CeEdEkoEefu9qPheo8X7iuxHUITn2Vw7hwyZ+FFBH4eIeiI+d+pP
	 9tqajp4y7JgSFrn3BB89zd9YjsYRu4G2Uhm50EOTDRbBSlq8Egg0krIFauzT9XwQyn
	 7Z5FKogs/CrHxr8MQX9+rKkvBq8v7xlbNMEQA+5CxoAfvuzhz8ttoZLNwjf0PYyaWG
	 ij7O7LjRz0CU1n0K1u1LIqBqhPtE7yrqndTXcscYbZYEoFOjP4NyT5nNPFNRJQBFQr
	 HfCNhkezxwIGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2891C3ABC3;
	Sat, 10 May 2025 07:45:08 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Subject: [PATCH 0/7] Support exposing bits of any byte as NVMEM cells
Date: Sat, 10 May 2025 07:44:40 +0000
Message-Id: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOgDH2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwML3byy3NRc3ZQS3ZRUw0RDCxOjVAsLYyWg8oKi1LTMCrBR0bG1tQD
 ysA7VWgAAAA==
X-Change-ID: 20250508-nvmem-dt-de1a1842e883
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sven Peter <sven@svenpeter.dev>, R <rqou@berkeley.edu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=CUo/MimrCW1xHj5d7fHDtNMddbwaaGdTDWDyY+tLI84=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y886+JhUwn/3XVWSgdXLxSLkhOtF73koo070H5hzV9l
 sqLejk7SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABMpF2b4K/xC+RXPE+Plrf6O
 8U5L98/5yRi1snSb6Ukhv1e+M3wP+DMyzC4UmveQ9UfFm/Qf//fd1WmRubpx9tnEs/vKKqM4DW5
 v4QMA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

Hi,

I'm preparing USB3 support for Apple Silicon Macs for upstreaming right
now and this series is the first dependency. The Type-C PHY requires
configuration values encoded in fuses for which we already have a
driver.
Unfortunately, the fuses on these machines are only accessibly as 32bit
words but the Type-C PHY configuration values are individual bits which
are sometimes spread across multiple fuses.
Right now this is not supported by the nvmem core which only allows a
subset of bits within the first byte to be exposed as a nvmem cell. This
small series adds support for exposing arbitrary bits as nvmem cells.

The second part of the series then adds the nvmem cells required for the
Type-C PHY to our device trees. While it's technically independent I've
included those changes in this series for context.

Best,

Sven

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
Janne Grunau (2):
      Revert "nvmem: core: Print error on wrong bits DT property"
      arm64: dts: apple: t8112: Add eFuses node

R (1):
      arm64: dts: apple: t600x: Add eFuses node

Sven Peter (4):
      nvmem: core: allow bit offset > 8
      nvmem: core: round up to word_size
      dt-bindings: nvmem: apple: Add T8112 compatible
      arm64: dts: apple: t8103: Add eFuses node

 .../devicetree/bindings/nvmem/apple,efuses.yaml    |   1 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          | 187 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi               | 102 +++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  97 +++++++++++
 drivers/nvmem/core.c                               |  24 +--
 5 files changed, 401 insertions(+), 10 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250508-nvmem-dt-de1a1842e883

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>


