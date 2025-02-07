Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE012E1CD
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738900299; cv=none; b=D6Gzwl8aHGFfoln5MoszB5o2HsQ+r/J3U82I6n3InErHxv5xTmf+MFlJ/zAVHu+3yg9xBqvBA/ljuGP+uozVV0C7ygTWcVQ3Xf3v1RYckgHltopbtpAQ9nNq931PItJD9tpEsIONZoOavtI6yL51r07tcu5zlJrRw7kwT8mVaJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738900299; c=relaxed/simple;
	bh=Ubctx4rdTcuiQsf+hg8nbuiRAWygJG1sfX7ZT1Tcmuc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sONzqdIB5/u0AQgz2thcYkmSJKIGu1BZwFKxGqFt5+O0DCsUKDdW2b9jnr6o0apT16ufk8JBtpPC/ZL4i8GzRucAcPpEQqfapWnDeAioZoITrG9iU48QT7BbHc2PjoUXt4abk6Hhbqa39u1/mAwwjwt+BqtXIzwZQx5+jlD8vKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L/yjsi1b; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L/yjsi1b"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5173pE5e2855441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 21:51:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738900274;
	bh=7KyZCs8qd3314ZlqPy/AmtZCpaiNemEYjj2AFav3eno=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L/yjsi1bFWzokw220ffjHZa5zgitVMKp3w2YJQgnDnKRTIusfFEPN79Y6sBKNvsSB
	 S1JzeQxbfZxAQX6NUBOoTAC+VLwgqzKFM3d4DqVxbUlI2vwznmZP5CyxiWITRHO6h1
	 mfjKTxOiXd/ugcxQ74YDVGKskZVt4K17pYPg4YgY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5173pE9c084941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 21:51:14 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 21:51:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 21:51:13 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5173pDYf011862;
	Thu, 6 Feb 2025 21:51:13 -0600
From: Nishanth Menon <nm@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <vigneshr@ti.com>, Vaishnav Achath
	<vaishnav.a@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <nfrayer@baylibre.com>,
        <glaroque@baylibre.com>, <tglx@linutronix.de>, <u-kumar1@ti.com>,
        <geert@linux-m68k.org>, <d-gole@ti.com>
Subject: Re: [PATCH v3] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
Date: Thu, 6 Feb 2025 21:51:06 -0600
Message-ID: <173890018688.4924.16249045892209116945.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250205062229.3869081-1-vaishnav.a@ti.com>
References: <20250205062229.3869081-1-vaishnav.a@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On Wed, 05 Feb 2025 11:52:29 +0530, Vaishnav Achath wrote:
> Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
> These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
> for core functionality like DMA, GPIO Interrupts which is necessary
> during boot, thus make them built-in.
> 
> bloat-o-meter summary on vmlinux:
> 	add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
> 	...
> 	Total: Before=31615984, After=31778459, chg +0.51%
> 
> [...]

Applied, thanks!

[1/1] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
      commit: c7691aec5e991cec9c5c5fdab08c24856a1fc56f

Best regards,
-- 
Nishanth Menon <nm@ti.com>
