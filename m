Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51F3987D;
	Mon, 12 May 2025 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057179; cv=none; b=DEmQhJvbbouiDxTpgd2MRzuhf3nbeubsiOKwjBQ3m5iId31zYzW8xljos4TKRfocs6g1KoKFFZHJSzWkoU2Oy07o7B9a0A3kocQkQq72uD7rvSQ+UgSoQsXoUD5RubaYkZIxk9p5NdNcnu/8az5aA+PL/9wL8RxiqNivb2LIWl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057179; c=relaxed/simple;
	bh=AYku5jN+0OmBk98j9JNh57LME0Csb8yr4YA+DR9zGzA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=VsrRSrRsF5DMRDgyozqH+K13Y1fmbC3WHNWcXI6j4sQBWpUcv4LZE6p5Wlkwztz8e37uiys+j75noFfx92zTjR8Tu4dV7GMfKG+pihu/iqDBFYUxb/SYOXQ2m03XudwHwJJkClXjsLSRkHMkcQ9KZE6bWoZJhJMVkZsZdN6S35U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=rpYck2It; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="rpYck2It"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1747056871;
	bh=XiZXeriwtNmD0C5rumTsjv/pcxn0w65lxRr71QDYu34=;
	h=From:To:Cc:Subject:Date;
	b=rpYck2ItuM2aaeT+l5e1nfYIloPaQgPtPojYQJskHlQ07uO8tHSsVZRwnBoMAfWz5
	 JklF771y3pWxlA4BMZK03xUnImuMxjjhrpun+kIUbQdKqbbvoLZhg4HsLDTlgDY6+i
	 snZfcVmt5GgtWoR4k2hpoyBrClRqpO4W0SexsAew=
Received: from localhost.localdomain ([182.245.65.132])
	by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
	id 531AAC00; Mon, 12 May 2025 21:20:49 +0800
X-QQ-mid: xmsmtpt1747056049th6ukru0a
Message-ID: <tencent_D5C17F39C684CD6491505763B23BACCE5106@qq.com>
X-QQ-XMAILINFO: OAkMgjsCL21CLWoSijloNZ8D3K/VcR2BT8UYQcTgS3cymMCmEi2kyqjEkcmjST
	 JFCA1Y75FOEsVBqYs2d1+9hsWzPfSU5S7izWMysBdY4aD+JKY6KJMkw3o9nOmKh9UjiYC8Nm+Qv5
	 xwSll3Qhj3cihal+Y0T14XFVYc8vGmHg/YZsqA3ERRzPx2hP0GSKxtUp/HpHQF6fh8IfLgK5lDhg
	 IdSFha+jrlZT7BBUaOycXevaiukcxrGqAkoqyqPRGyyDiZBgidUQQsp/GD0AlkfWLDIiqLH9r1Cs
	 URGtD8YoG3RmCdBkS39q8zV2sBqG4HTl+Jw3jK9KNd7ucq2WlCdFqFeN/I8ktIx/9x7xaD8FM/6w
	 wwCw+8ZmEIdQXo+Cs2mSU6hymk2rSZz9qNZRF6hA0VgoE8thW2ZoGUdmpmooEVucNxM92pIsDx4v
	 aThk+IPYX4kz1Ba97zU3elCSRVCFAwZtvnU36izN7a9XyN2f8JJSZYKUbMaBnp1we6in1iC8bGnh
	 tfYBfA7ImSEEIgWNDc8hnUFpQLDDMqcFvToUIropz7GrjmMkKEViVGf4NGNjihjG+J1JX8p2rZUv
	 D+DuVKI/v6XTiJEKwozTlr6RzFw+6mPqgGUTCWiOZSJbmsPVra5GgmfVgO2s059NYgFdSjZv2Tj4
	 wyR9e15gfxgjylpHeYJ3svRrfMs2HVzhIIPYn0p95yvtav93UUxbnqWO3fv8iC7oq6Ue/dLXFDSp
	 L/DGurahKuGVHokwDtbQq0QLVDFK1x5tUXnc6Q7DjZ9vtJ1V58A6bZsnkpZfv8hR/2ezjPTmrOYb
	 2nZ6SCtk+8BEvJD2ycLtUoYlWNAoS0YDAmFbDg7/WnIxfumbxXTqE5bR2U7hE6zG3StUZ8n2tHXT
	 fS/pkADXaj+sgwZtIp+cC1EPexEWQeYhrq+gaXX3iFt44CyuCHLexwuz/SyvsM+ILrNJv2XEzVpW
	 rgiSDy3gzF1AvXxL/+hzV38lEJn7f7njRAEzKGim8UxuzECD0d74BoYMQN0wD/nVYebWY36ZJEVa
	 k+FENO5HDNArgOIdaNUqQ9yHnLxx+i/wcJzwLSeuHdZUlLZFy/rl/Bg1ag/8LLR9VM8fKpBw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: chainsx@foxmail.com
To: robh@kernel.org
Cc: chainsx@foxmail.com,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 12 May 2025 21:20:48 +0800
X-OQ-MSGID: <20250512132048.312772-1-chainsx@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hsun Lai <chainsx@foxmail.com>

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 911 ++++++++++++++++++
 3 files changed, 917 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1

