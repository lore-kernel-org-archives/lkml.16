Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F5A1CF96;
	Sat, 19 Apr 2025 03:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745033573; cv=none; b=gq1jNmk82sJwSKoQp+A8L2rWSG0/Cf1GwaX61LsBChrOUaJtT/DI9jsKxeJSU8VVLgKoUtGqqdSs18X/5gKgkAt3XiSI/xP36H9WWi5mMS9r1ANTrbWdFVVXsdoTD1A4DJA9lCejr82Sy5fb+hKYDTy8G285tOLo9QNuKSkKMaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745033573; c=relaxed/simple;
	bh=BRF5fK7Un10wZTyZfTXIVd9zabiIA3JZA0TuwSgl7v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TdR6ypL3Upg7IikXbME2zGGMFo37szkKpcdZPTfvzrimMxKaRT58eJMMC6Fiyt8SalVB5f3eHUm3O5xObWeLAnM7Fksg8MaaGswF43YyKhYCFHwn7PSEZKC1m6R6o6C9p5owBoZoFn8SWZ1E3DmTOe/4T/tjqRMDAhenQX5DArU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6FD19342FFE;
	Sat, 19 Apr 2025 03:32:46 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: dts: spacemit: Add clocks to pinctrl and UART
Date: Sat, 19 Apr 2025 11:32:29 +0800
Message-Id: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4ZA2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NLXQNT3ZSSYt3knPzkbF0DI7OktOREc9NU0yQloJaCotS0zAqwcdG
 xtbUA00Pqnl4AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=BRF5fK7Un10wZTyZfTXIVd9zabiIA3JZA0TuwSgl7v0=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoAxlURMkpdvlUF29l1uf4AJYDU30V5PsV4KVww
 i6zxWd3AIOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAMZVF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277a63D/0boFdPgWrGpZ98JT
 qL0/qzJXF0bNOXh5MepNrUxH9zyciee8/3B78OZDmfuL+JKsRIpjCMjqrnzWarj8cKoppu+Q++q
 TEwoBavC0+8CfIKKLcU7NC70gwg3fEBXJot188WdhWlORBsj+zOkXuDBWRTtK0pO65vCjbLND2F
 oxmEiUE+sjSK9N7sIOu27fclOzRvMnTzDGLG3QcHW9UruGkuyydnp+e0bR/av+1ePIjEu9ENsFO
 LltyeMvyKhbTdOU2Cu8Iy62JAunsEAP5tEeWM3Oiq2yV09dNj2YJKGcFsoftJMd+0F/8SZGUWvp
 rMdWT01MfmWRJzdMQCQUaJmvUtXH/mlF3EGItJUL7XXdnodi1n8brmuA9qD53Tee+qvt48PvlbI
 F/WBLReiKyDZ2+qi8Ma0KkH7dueJIgVz4cXRRVzF1UUMi/9unytB4EKjjUoSjyMkU/IAfZ9tbw4
 LmGL32qrRFx48LD2vDBV6KDLfkB/0rdeiX2B6YoLZyZtXW5gSGwhBC1REv1ofXWiUTYN6wQrU/t
 Qm02SVjzZTXoSywutIBOPwb5IEWI0DpvckPfdmsBxmUL8KwHQ15KGt70V5Mne7Rew7OQiotBBxy
 EyWr0CCUKBv6wr7W0j5J7UfQJIMkb7k10jF3VbkZFxw5mJF67XUwGtzHFnvrO9C4Q99Q==
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

