Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFEA19CCEA;
	Thu, 24 Apr 2025 07:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480923; cv=none; b=W46mGUgm0QOBhxH1nmbB7FrSOLkhO5XrAWwqo77XpaeD/a5P5mR9kj27JfI9RnQuC6uNznBSOD6kI3wGOYj9Gjz7EEZr7aIxDdgs73k6V415H1tRVtqzWbVQQNTdDePmUP+7Bo2vk3ypjnnUxoW+JqtYbFt0c8Gqr8vVZLljwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480923; c=relaxed/simple;
	bh=O1rnIa2Nc0xLuYwJRBgZaxKvxjoAvMbb1IroWhNhceQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rTw9BVMdkHGoytnkoDSKrAtddaO4QdBTlcmfbAAQAiIhRZ0KFDdodIqvaapce5uDL7do/PNAykEX78/qRf6BF+otPAo5e3r9lJjIZGUPfAWt2qU7SkPByZNsfKiWwy1cyeuyvAqXl6gbk0thCpAeummw5M3rOWK2Go2bTlw4LoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AEB1A343024;
	Thu, 24 Apr 2025 07:48:37 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Add clocks to pinctrl and
 UART
Date: Thu, 24 Apr 2025 15:48:07 +0800
Message-Id: <20250424-05-dts-clock-v2-0-17d83a705c4c@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjsCWgC/3XMywrCMBCF4Vcps3YkCUapK99DushlmgalI0kIS
 sm7G7t3+R843waZUqQM12GDRDXmyGsPdRjALWYNhNH3BiWUFic5otDoS0b3ZPdAoc52duaiSVv
 ol1eiOb537j71XmIunD67XuVv/QNViQKlc6S9Ho016hZoLcxHTgGm1toXELm3XqkAAAA=
X-Change-ID: 20250419-05-dts-clock-026bfca75e5b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=O1rnIa2Nc0xLuYwJRBgZaxKvxjoAvMbb1IroWhNhceQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCezL/JF4+9LLHuxULoCqqywrxzAnkPGTKoztZ
 wjTAktDuWCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAnsy18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XYqD/0YfD4VZu3OE5NtGS
 WolLvLeH74lP8+RcmRqFHX7NyY5R2HuPOfG5YQYFUmg6X5qGwQ98b3B9ua1aJ3GpyMyJDjZo/L4
 m4n40AcasoHdCiQ7h5Z2LvcjnTizqEKjulLcnt4uGD+OJyOMVhvdrUNTbbknEtNFJs3MWsLy8b5
 kiP3FeS2UCuaVcqNLfYYXa48gzs1HjT2SUmvPiBVM1/ikpgZHAbpiNw2p3c5wb3ulCuUqcIdLrL
 TsOMZRlzTyncEkIT8C9Ex6rty8GedfaIw5RVk9iuToysnW7SeuCp9zjAGkIqrm/eTzq2CpgidOo
 tM5WWqluuC6CEk0Mp7O/Wzo+6q3ePUTEthaNLAf4kUEghUlesaAT4XTsiCz78G69Om3bAyPfXvW
 4FywuWenRSSW8d4/B9CWZJIkQ0yk3GGMbDVhSLNif9yWiYxf8MPtCjcQ1MKGpZH6ebCnXB6Rgtx
 jIz+U7wYz62vRv1/5HRajKrDyuvFUe7AZPtRFl+vCMg7RE8CCOU+jyw+/EvKfiYnI16WNrcQ+C6
 VF6mbpRNDkeWYSDs+XhenAHW1zafAFCMfFaWDSBdsAMOiatFyjiBS/nuN4u0yyr0i177ZZQyCI4
 dJHOZ0w8BEUPCdSp69Qsq3ZxatGHYW4rlU3DSqjKNfOo4zP3m/kew6osbDaFbBYy6HfQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Populate clock property for pinctrl and UART controller.

The pinctrl's clock dt-binding patch is still waiting to be merged[1].

The UART's dt-binding and driver code has already been accepted[2],
so we now are only sending the DT part patch.

These two patches are abased on SpacemiT SoC tree's for-next branch[3]

Link: https://lore.kernel.org/r/20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/log/?h=tty-next [2]
Link: https://github.com/spacemit-com/linux/tree/for-next [3]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- collect review tags
- order DT properties
- improve commit message
- Link to v1: https://lore.kernel.org/r/20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org

---
Yixun Lan (2):
      riscv: dts: spacemit: Acquire clocks for pinctrl
      riscv: dts: spacemit: Acquire clocks for UART

 arch/riscv/boot/dts/spacemit/k1.dtsi | 39 +++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)
---
base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
change-id: 20250419-05-dts-clock-026bfca75e5b

Best regards,
-- 
Yixun Lan

