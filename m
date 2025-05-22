Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E591F94C;
	Thu, 22 May 2025 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925165; cv=none; b=t6bG4VoCR+RKQ+fBS8XFhXmex7G+WkXPBmaM3jvgEKBl0vbVF9KNOrxWbk8E2xlxD2TJDosJkZKGvmRKM3JLOdWFBHMVit7GWJzZ8or/Wfiuh0R4DDiy13qSlTl8JstgQVWJ22jSTjgrQlhQWwEec7HW+hHb4f5DuYP9Msh6YLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925165; c=relaxed/simple;
	bh=8FR4QAUBBTELVo9pnu4KJI7w5E3w2Hnkds8Cgh6qVD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSdSenkSxUssfvkiWPwkwaJEz0vl77Taf3UAFhxgxNSOt+FfY/Sj1dcOVmP4GQmkoBpzoRABJjalEkufdCnFwYH/4F+fJjZMZ1QKFo5qvSKcj0zDaCajDKjRTMu1a3ESkiUqYt774oNuohnWEah41v96fc4bnDck0db0y/ajsR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6VAFkiA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6VAFkiA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65827C4CEE4;
	Thu, 22 May 2025 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747925165;
	bh=8FR4QAUBBTELVo9pnu4KJI7w5E3w2Hnkds8Cgh6qVD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f6VAFkiAN5GbPXTcxCwhVT2uN5NJcr491Dp4C2e2uMejHBuUtXKpSbJ5sh4J6mXen
	 MxhYj5QIKqk2XTkuyHW0CBKWeuMZ36u7oJJNjUYQ101+RpGou6A/gM6dGSU18jJnPj
	 z6RALLZaUpxwjEku4MVk35i+zRBHI/j2cf5pKepBJGdQNck3Ihjrf546qsuZdihuVn
	 udyGEzyCqI1zrBOiwaZTXDrgIU3hf1Mw7QEAP8waGPb2wBeNbuHMoN483JPSAdMm24
	 fXsSRkSLJ4hrqY7h1s5R88gULab51K4H3VlgjxV8hRhb5eXiXzeCE1sxLDsf07CaFo
	 Q4/+zYiB+x17w==
Date: Thu, 22 May 2025 15:45:59 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.16 merge window
Message-ID: <20250522144559.GB1378991@google.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>

Enjoy!

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-regulator-v6.16-1

for you to fetch changes up to ef7f3631a44b8e0990ab8ffcbed4b2c3a4270883:

  regulator: bcm590xx: Add support for BCM59054 regulators (2025-05-22 10:57:46 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Regulator due for the v6.16 merge window

----------------------------------------------------------------
Artur Weber (8):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
      mfd: bcm590xx: Add PMU ID/revision parsing function
      regulator: bcm590xx: Use dev_err_probe for regulator register error
      regulator: bcm590xx: Store regulator descriptions in table
      regulator: bcm590xx: Rename BCM59056-specific data as such
      regulator: bcm590xx: Add support for BCM59054 regulators

 .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     |   76 ++
 .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
 .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
 drivers/mfd/bcm590xx.c                             |   66 +-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   27 +
 7 files changed, 1325 insertions(+), 279 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml

-- 
Lee Jones [李琼斯]
