Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D319D9460
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748682494; cv=none; b=l/NXz6pad41EKvQLSzLeao8+9cd0sTxZIiy4W02I7HpeF2Yddb+LlCSZcnhCBvE9rjghjpCcQSA3qqMh1mPYDmx8xn4ul/3vg7BcLfBTXbSx08OSTxidl9z7270dHaGAg956o9Mri//35e2Epld4vP6blfyRigIxXOcKdidCT/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748682494; c=relaxed/simple;
	bh=K4TOYYT8nHtZXhM1aD4vCE1xpy0XKhOVbDXjLfKl5f4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=M22GRccxxU5me2DWlC/9ZcP6/h6pwUmx8qqXg4yLtSMpZ3MCTDL2cWCSnji+HzN5+ymTauFCTZq/hzs04bxdtn7MDmgtUqz1OKpusxnFeYUU/mJr7i8JmC8xBYMtuv1ZMuFq5TCgRliP+jey7ZiofAT8hFL9S6wSzBwR2ETJVOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=FkiD4rR+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WQ9vZ5Z9; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="FkiD4rR+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WQ9vZ5Z9"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0F7D11140138;
	Sat, 31 May 2025 05:08:12 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 05:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748682492;
	 x=1748768892; bh=wvcVlRsTp9UBvTgpnxSSZSMuazuqeYvLY20AHwA431Y=; b=
	FkiD4rR+Day+l+ahdkODGcXBtozfJGRiKS2vcnCY74JfeuhfdzJ14ODGOz+blDfK
	Sw4Nk4pEqOtvTNDqaac27pPw5PdfpdjwVLgG+LKKOUcoWzTOSnwj8ZHgCJRaPyAL
	gjU2n7kasv+kXWMHv3UYEhEY8Bq7VaE8DjZdKxo+aKkBGpkVDnVrWSlL8YnWt1m7
	sEe3qjDNxsxRiBKomZ2Cd4H8H2ssU0H0ryM1h5CVJQ3O8gN4CdHVXYm1+R1N3HjN
	De/+rP/oaDqeWfursMaM9ICja+Db5mawF7OxNcBklJj9AMxASR3eo3OOhkLxF+mh
	sCe+4RN2MmCtVEiWP8kIXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748682492; x=
	1748768892; bh=wvcVlRsTp9UBvTgpnxSSZSMuazuqeYvLY20AHwA431Y=; b=W
	Q9vZ5Z91lOY0ccUMnYK54tyQoRK6/0zMXS2IjIyd7UMq/qJAEfgUU5DfexGtViQk
	C1FT9hk42j8vcHZOKjvOHiOZOfrpeS58zP/20YHiwnso/M2XEcwZsZw0EJj4dUhh
	q6WU2AJtm0ftEmAGXpSv5JsFiSaWbo+Gby2IGfjKGjixMsmxmIX9sZOj0pi07HOs
	gmpotYuGENKkcMSMIYopNyg5z5K2kJ+ja6HNyfrpzN/BxFzptsLE+BLMA2mUeGYo
	LVcP120R3UlD5peZVLRgTeXkirTd8TQhX85d30T+VtvLh5JRa92I+jG33yaMF/n3
	oWrng7/OnBSbV3lhfJiXw==
X-ME-Sender: <xms:-8Y6aABswAzZWF8zh0LSyneYqhkjfJ9J8_J09_K4x76rPD3mec5n2A>
    <xme:-8Y6aCgY7CYwZkGsf4iTVa5dLFsEF2H0yp9GLwBNxcu7bXqCOglAbJjaHCW-SLzLW
    7B9405LXxwPcIZyfOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudehtdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeefffelleduheeh
    leejtdfhheegtdffhedtffeileehkeetffevtdegheduhfeiudenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprh
    gtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgu
    sheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-8Y6aDmRepwYIrUZHgQn5ULBv4Zh7oOOoK9Qr-dNYqlKzazM_9bFUg>
    <xmx:-8Y6aGx3GFIAYgUJBwVrfw5ilD9emcopHoabArEPVFHHN7rqNI-HuQ>
    <xmx:-8Y6aFSlietPKYPKJmY5ABxCljSgDx1SsqV5TXMGR4BfdpE7iPrXdg>
    <xmx:-8Y6aBZ5e7aTl7SqP5_HyDFT-bdREkxDKjZVck2_PlGFJWqfrCAxmw>
    <xmx:_MY6aAkHL2Y8m_0qQb8nNoNNiekU9mobYsZa0807IIgRSt4U9ilBllsR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AA599700061; Sat, 31 May 2025 05:08:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T97262eb0f1793ba4
Date: Sat, 31 May 2025 11:07:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <d98adabb-a26a-4962-af9d-5707e1cb3715@app.fastmail.com>
In-Reply-To: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject: [GIT PULL 5/5] soc: sophgo devicetree updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.16

for you to fetch changes up to 9bba618694cc905b898661c18e3e40955573ef5e:

  Merge tag 'riscv-sophgo-dt-for-v6.16' of https://github.com/sophgo/linux into soc/late (2025-05-23 23:59:45 +0200)

----------------------------------------------------------------
soc: sophgo devicetree updates for 6.16

The Sophgo SG2044 SoC is their second generation server chip
with 64 cores, following the SG2042.

In addition, there are minor updates for the cv180x SoCs.

----------------------------------------------------------------
Arnd Bergmann (1):
      Merge tag 'riscv-sophgo-dt-for-v6.16' of https://github.com/sophgo/linux into soc/late

Inochi Amaoto (10):
      riscv: dts: sophgo: sg2042: add pinctrl support
      riscv: dts: sophgo: Move all soc specific device into soc dtsi file
      riscv: dts: sophgo: Move riscv cpu definition to a separate file
      riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
      riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt number
      dt-bindings: interrupt-controller: Add Sophgo SG2044 CLINT mswi
      dt-bindings: interrupt-controller: Add Sophgo SG2044 PLIC
      dt-bindings: riscv: sophgo: Add SG2044 compatible string
      riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10
      riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX

Zixian Zeng (1):
      riscv: sophgo: dts: Add spi controller for SG2042

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |    1 +
 .../thead,c900-aclint-mswi.yaml                    |    1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |    4 +
 arch/riscv/boot/dts/sophgo/Makefile                |    1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi            |   39 +-
 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi        |   36 +
 .../boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi}   |   95 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi            |   39 +-
 arch/riscv/boot/dts/sophgo/cv181x.dtsi             |    2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi             |   39 +-
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |   72 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             |   32 +
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 3002 ++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2044-reset.h          |  128 +
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      |   32 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi             |   86 +
 16 files changed, 3502 insertions(+), 107 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
 rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} (75%)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi
