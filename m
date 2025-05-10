Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B251E7C03;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863109; cv=none; b=iO1YoSZ1xNo56sr/bOFvVHcpDs5foqxrJFzGHd9zDj2/kgwEF7aSIF+PUCokqVd15mh4X99kDwx5avwxm00JzL20bROisrfu7+Rq0h0PaV9zaMfouFDEdXkFVIxMSedNiP7Adx1CXKBMH7cDCIp6Q4HCLTJGe0ApZLHfkWZLhko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863109; c=relaxed/simple;
	bh=ftCcW7WIxYGQk7HA8lp62RbBZM06Z5asH0bujmE6CcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFJZ0QY7PEbFJIC2Vr7UAHvFf2CmmmL5sY/tt9XoONg9AveAQo73nDqtX630k006aZk+Qy/BAZP8mdVlOTOd/ocB1U+j84kKCc1+6iuHkJx9EsT3+Sv/9IWJnQVqbLkhs6eTgM+UWb89dQAztyNc/noBDjm6/tBOZBoH8+decXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgWXpeTG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgWXpeTG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19001C4CEF1;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=ftCcW7WIxYGQk7HA8lp62RbBZM06Z5asH0bujmE6CcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sgWXpeTGyvrpyEns61D6Dw84JcJcSkdgmOleT3NYM578DuoduMD3suLSzEdrNe9xi
	 72B7rEgoFfJz5ZfiIlCrTs+B2g3HL+/Dwv+KUuEMOOTPDh0M2DYOTEgZT0IJpo1ahs
	 zwlNLz6rV7CGHHrownc/QC1cIsjiGDGNxZ7D/mODDxXPY+cnQXlzM/YlDzWCTeEJGa
	 t5WkSb6wAsM/eCXOJM2/7iyx7HP8Mk9UeJSS0vE0quES/7SvReVsrutUhT2RC9vGxY
	 LlIjq9dypB+Sd0k79sGpPhvawKL/pf+GEBma5XFUB3S2g7VOPu+v413VbQ3o7j3ce/
	 vs5AK5uWDMT+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E07AC3ABCC;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 10 May 2025 07:44:43 +0000
Subject: [PATCH 3/7] Revert "nvmem: core: Print error on wrong bits DT
 property"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-nvmem-dt-v1-3-eccfa6e33f6a@svenpeter.dev>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=hpPWBCehpQX+TRroEYSLZmoZuXPmZL8t0ylnYC5nM1Q=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y883++/u3l1adVWlJs9YLZTxQcu8fofWhL8YmaEy5cU
 +Rf17d0lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACZiUMnw3+vR7e2GDusU50ks
 z3jCtm3S2wPbI/5ufdvw/NekJt4HDHmMDL/uGzoqHLjJfEXi5U1z2z+BCZ7ui/VnX7ox4Ye1mqx
 FARMA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Janne Grunau <j@jannau.net>

This reverts commit def3173d4f17b37cecbd74d7c269a080b0b01598.

Now that the core supports accessing bits even beyond the first byte
this additional error check is no longer required.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/nvmem/core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 02081c93fa467e5448bd78a4920072d437365fb9..ef1f59b34d262a533fb601d87fec123061cfff81 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -837,11 +837,6 @@ static int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_nod
 		if (addr && len == (2 * sizeof(u32))) {
 			info.bit_offset = be32_to_cpup(addr++);
 			info.nbits = be32_to_cpup(addr);
-			if (info.bit_offset >= BITS_PER_BYTE || info.nbits < 1) {
-				dev_err(dev, "nvmem: invalid bits on %pOF\n", child);
-				of_node_put(child);
-				return -EINVAL;
-			}
 		}
 
 		info.np = of_node_get(child);

-- 
2.34.1


