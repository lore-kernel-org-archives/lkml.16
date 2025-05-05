Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCAE19CC22;
	Mon,  5 May 2025 19:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746473809; cv=none; b=XY70pSWntk82n5XKd/H2c69zmzz0yyz0IPkt2mx7l25QvQ+RN/jc4D6aMWjA44caK6KrdBfO4xkFZbNlytWg3/MilbAF2KS2JLQsbMT+d6VpG58zi+24J5pTSQcFxsPYyXwaRBjboigv0tnnI7Hu4IoX5VLiMRdZyGqfrq1cfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746473809; c=relaxed/simple;
	bh=RO2rvPFwsU9Xpc/pkZSTBrPrQgVR/uHxXBggVsYUGa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYhMWuMwooKk4xy53FjaMPXhPSTg0SLTQgn9OS4FbJYJG4liKXXEHpRMYJ1p+wTz+OasCmV6mSgmdP7a2VIUUzkL+Pp0Gcy77Dp97SU1Gj+5DZfy5XoRSo5zhs/4FRB+3iv3TrOI09h9JJWQfZAiVk2+DAC4dPzKI+gFPImFWro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BgDFCPzs; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BgDFCPzs"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 11C45C0000E0;
	Mon,  5 May 2025 12:30:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 11C45C0000E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746473409;
	bh=RO2rvPFwsU9Xpc/pkZSTBrPrQgVR/uHxXBggVsYUGa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgDFCPzsvn9+Ee0fecqz78TJfQAONznFdsMayIslHOJy+73pDTEFjqvVUww1BZx6e
	 qQxrGekZSB+HXdVPgqzKRQq70mTaEsXHXwB4p6MI7n0ZaJdcaVpgI+4Tj0JdcL1soQ
	 v9cuBfK2bchqVoicRcI6WJcA1RCXuLGirIezGZQc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id D022918000847;
	Mon,  5 May 2025 12:30:08 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: broadcom: MAINTAINERS: Cover bcm2712 files
Date: Mon,  5 May 2025 12:30:08 -0700
Message-ID: <20250505193008.1951252-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505191255.304500-2-krzysztof.kozlowski@linaro.org>
References: <20250505191255.304500-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon,  5 May 2025 21:12:56 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> Add bcm2712 files to existing BCM2711/BCM2835 entry, so the files will
> not feel abandoned.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/CAL_JsqJi+8-WdYEyrGjb=cQXPEb07Lkcj90a32d38ChvYJAA-Q@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/maintainers/next, thanks!
--
Florian
