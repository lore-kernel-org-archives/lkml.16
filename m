Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392D26C390;
	Tue, 20 May 2025 18:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767044; cv=pass; b=VkDaIMlbZKsDu3AM3x30VJ/JxXIEznE5p2l8DGoWirIbV79XPWBGDcy9iaIU4MDejcAw+OFg5Z71eRI4P1wdo66cm36IiGqmErgsTMBNinLzd8hOocVBBpU+sNfHpwy+Hud0PAFPYUhoiTeZFswMyjYJSENwHMkZ9E2EpvcuM3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767044; c=relaxed/simple;
	bh=KQXWX7fm4qp4WFDvVNw6sksu5NgiaHTZhcXk+f0JzCE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lS/CZbjND+NIOjy1TaQOteYvPAMsb5jVtqSpvSkDfzTfe08bF1WmBAJBWpMr9RvmUfs0iii3LdkZDEmWR1o/btobPQZnqznXdHo3IB2Ac4JyIXm1zCfpNcKr/rW0iB6H+KaY/nkwirtL7D6HfxZGgMzZfcuBpOS6+k6+IdhHxKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Whd973Ac; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Whd973Ac"
ARC-Seal: i=1; a=rsa-sha256; t=1747767026; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eHu2J4PaPD2w25JBiwNwKEsKhYsJ45o9UOB4EqCKIpibP7MjyFSMpL7rb9LZnkyEubGWTt9Yx2XLEanBgMiUQFPuAMCpxyiYzsqAvkLlO8hhvrVGWfeokPvFuMCVMsxno6fHem+OFuyansOaZMmEoI2TpU3vDH7hRoubERTEJLg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747767026; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xt+rrywOZe1K7faJK05oG26s0MPfO6rH8IpO8iFtn9g=; 
	b=cfsYRfGkYGoHMKQ5HIjBIElExks1RplnPi++uiZv1r/k88Gr5G4NmhA6erXkUzCCuODCE6W2MjWC99BAzptY4sSVnQBiLz+oF0Fh7I+UKF20gBYzymz73MoeUFeY2AiFKPVQ3cMqTSTAyZqLM2xu0rIje4F842cOc8h832PhRrU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747767026;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=Xt+rrywOZe1K7faJK05oG26s0MPfO6rH8IpO8iFtn9g=;
	b=Whd973AcSD5HhW7fN2N1pe54wwBxWwpNoNezVwaMoIUUI8OWW7xfzZLboiykFygN
	R0WNhzXtr+cj2v3zbhSE4Yijk7MnLn5YSr5vpjz2LfYWjdQ+3mRqkhbM7KtSzSW4bF+
	4ZfMlvIVwRrNrK0hg4m+xz/VFojsRGqllF2AgQXI=
Received: by mx.zohomail.com with SMTPS id 1747767025843367.77627410500713;
	Tue, 20 May 2025 11:50:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 0/4] Add RADXA ROCK 5T support
Date: Tue, 20 May 2025 20:50:07 +0200
Message-Id: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN/OLGgC/22OQQ6CMBBFr0Jm7Zi2WgiuvIdhUdqpNALVthIM4
 e5W2Lp8k7z3Z4FIwVGES7FAoMlF58cM4lCA7tR4J3QmMwgmJJOsRmUMBq8fMqE1JGtRGTqVLWT
 hGci6eYvdmp0Dvd65mfYjtCoSaj8MLl2KkeaEe5eX8BM6F5MPn+2ZiW/Gv92JI0NtLTdUnUmTu
 Wrf96r1QR1zHJp1Xb8HWI6M2QAAAA==
X-Change-ID: 20250509-add-rock5t-fde5927de36b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The ROCK 5T is quite similar to the ROCK 5B+ and the ROCK 5B, so to
share as much DT boilerplate between them as we can, this series
reorganises things a bit and then adds the ROCK 5T .dts.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- Split up "reorganise common rock5* nodes" into two patches, where the
  first simply renamed the file and changes the includes, and the second
  moves B/+ nodes out of the shared include into a common B/+ include,
  to address Sebastian Reichel's review.
- Rebase onto next-20250516
- Drop anything relating to the USB-C patch that wasn't picked
- Link to v1: https://lore.kernel.org/r/20250509-add-rock5t-v1-0-cff1de74eced@collabora.com

---
Nicolas Frattaroli (4):
      dt-bindings: arm: rockchip: add RADXA ROCK 5T
      arm64: dts: rockchip: rename rk3588-rock-5b.dtsi
      arm64: dts: rockchip: move common ROCK 5B/+ nodes into own tree
      arm64: dts: rockchip: add ROCK 5T device tree

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 878 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 875 +-------------------
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 105 +++
 5 files changed, 997 insertions(+), 867 deletions(-)
---
base-commit: 8e7386987569f6c99e6dc86d939476350049b9fd
change-id: 20250509-add-rock5t-fde5927de36b

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

