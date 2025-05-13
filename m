Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5861A3A8D;
	Tue, 13 May 2025 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150384; cv=none; b=cgeCzti+QYw2W005ZSxpJr5g/4KUj7GTerIk26EOIMBgr71BZhevLaRcYi7ykT53niHsKQ6iw1dpMQVEDATb+pbE+8ZHv0AKJYneKsZ8H+Nia7t+smgHSsKapy/G6P3r4VcBTH1cFnSJ5NsHurltkKfeimVmb4T8NWigfkkVFXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150384; c=relaxed/simple;
	bh=XOXkP6Gw/j5JbMmqTBoPNv6yZm7BILIvtG0HRJvrEpY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SybDFzifpWVFPYnVQIT01yR5aSURTU7Wm5+uHdTH4DUXpK6+CNRX3np9GfoZE3mBKJ8Spe+ltqlicOQp3a/st/EoUS78PeU8u4sjGk6MObzRYnbzU8CT+vBpLjU1cHrNa6rBJ3OhUrWchuqNq90nMkEXs0MLFIAsWzv0z0v1LFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=none smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz3t1747150248t8216324d
X-QQ-Originating-IP: lSEZ7Grbum6TmFnvdprfvc3lPQ1BgxRoZkabXqDxsuc=
Received: from chainsx-ubuntu-server.lan ( [116.249.112.25])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 23:30:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4369311442671780654
EX-QQ-RecipientCnt: 11
From: Hsun Lai <i@chainsx.cn>
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <i@chainsx.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Tue, 13 May 2025 23:30:42 +0800
Message-Id: <20250513153044.167187-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N3aam2OlSmByrcbKktTbSJKgp+3ek0y4nA+VjmdTSxVFe8th5D7biTjo
	ScrD+Y5EfdGMzYM+UpsfRo43W/oA3MehCkWtu8VrGE7xSNz6zHK3GWEhODOI1pqqntUGn6x
	3YqcbQ4rw4ZjhE+oJKx9me9HQ7xeqUs9k2L7hssk/vSi+FqTKJUohIYfQpkjBdrPg2XQVXb
	4VcctbzibPceM2TIMjSQ6ItfFCpWuDNRUa0clSwy+CuahoNoH3H481b2LfWUZamH2TPHh38
	LBy2TjE+t71Kddq8iI0x1YhXvgZjYl4v4opWtLyXBxltWSWvV6FkzpOmdbIv27Xs8X8bmCk
	+lskDbxM4SW1fV8LzRdIZAXazJeFbU713qVrcujOUG2QW8Youv+DshG0npbJGttFXx1rjOQ
	fvUMHPdrLp9mIsgAdh932ubv+htqmqADrEb69PQXO0IC5uTu6oxlxdBRL0w4fM5IWINbh9E
	5TWYFmSHP96sbQ5hbZpmUvJG+0vvp7rvU4cT0mCO8TKZnTCn1Z4WOWEYsF2QqdLFs2QuIUX
	nYr1yR4GutZe/TlE/EHxCSVK3Tjl/+wl3n8Zd+oPSiXqzfif01g2YXFZ8Nxb397BMzoHpdM
	kAr600Sauysjhc+x0cZ/qzwgVhKm6PWLebeTy+1+InCAplZ/hmaJ8FNK3HBM+vjZKSYnesn
	CwsJJoYdCigWQAyS6jd3bw5sKG7Ei23k30YsEWsZecBgl7cx/MgfYFCZ8M6ogE8iUzILeI6
	QNFcL4rYtA2rjinBiJxJtLxko4OzM3xUMhp46/EbfDziIjmLNnkO8rN3G6IvB3lw3U9V59X
	r3v0Ox+a+n4AvhSeD4eJH8oFLLM5Pw5pAA4FR0nZ6rUtI1GPD3pg+UmjAClTfewhKrP51M3
	34p4V9eMPuDlMkigk0Gx1T5l9CI0o2Lu8RblcMLpS95/YON32LqYxVC037olz/5/+WlyPKE
	gG+a9sRCvlwTPzbGR6mLnguy8N/u58QqYLaAu3IxWOEtkEzlrmGqet3VQNr2F9sHE0W8yIm
	1KGzYJ+iFu+YhRj/ZW3lLR8+VP3E4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v2:
- Add support for Firefly ROC-RK3588S-PC
- Fix rgmii delays

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 910 ++++++++++++++++++
 3 files changed, 916 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1

