Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4909A218EA7;
	Tue, 10 Jun 2025 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577800; cv=none; b=E8kvPDtxbOA8qWONsN2IZrfmCyg8yL/pUBid49nQkU0GU/8edqHdMOkOT/4qNcQmd8JmtpoXvYUM3NgVilqs1ESql0QiUVeJEfrq27W1OMkYS/Eb0aciBZ0WV75s3rzua1W4scrdf0Rsu3G5ImLy0dc89UrFeSSpy7k6JlLbyMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577800; c=relaxed/simple;
	bh=pU2TVlS9NicsYGkGcp7LE0teQgsE61GXl4hYMMJ+Hso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pW57sQtVknO4IK++Hqnc7dsgd5tQRc9irwOVnzhxFUhtBKWD0/ARu0IB3GemmlFApqfZIL5H4Nwvb6AVBrpp5evXBJd7zzrzr9i0nhF2SpHnlhM8xMHWmRFKbezwRNdhJIpG8lqqyrXT2Ydf0pPK3LnPTnj5rX3Yx5riqFxGy50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AkXZAxeS; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AkXZAxeS"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 92749C0000D0;
	Tue, 10 Jun 2025 10:49:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 92749C0000D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749577798;
	bh=pU2TVlS9NicsYGkGcp7LE0teQgsE61GXl4hYMMJ+Hso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AkXZAxeSTF7vkZR2y2qGfiH1/j1xhYv3XH6G6PCpaiOwgXhtvDdLNNarmnqkvPYcP
	 5R4IvqyCX/R0/DS/36bP4NMWzORddlzJQxxSWVeQDyGXkF5wfh818a09O1OkI75v/6
	 kBXBqw7waXQTwL5EPZyrN+BHjYldOFEOsPatHggw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 6DA2018000A5F;
	Tue, 10 Jun 2025 10:49:58 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: broadcom: northstar2: Drop GIC V2M "interrupt-parent"
Date: Tue, 10 Jun 2025 10:49:57 -0700
Message-ID: <20250610174958.3482215-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609203705.2852500-1-robh@kernel.org>
References: <20250609203705.2852500-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon,  9 Jun 2025 15:37:04 -0500, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> The default interrupt parent is a parent node containing
> "#interrupt-cells", so an explicit "interrupt-parent" is not necessary.
> 
> Fixes these dtschema warnings:
> 
> (arm,gic-400): v2m@70000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@60000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@50000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@40000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@30000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@20000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@10000: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> (arm,gic-400): v2m@0: 'interrupt-parent' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian
