Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A411C28E;
	Fri, 25 Apr 2025 03:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745550023; cv=none; b=pxq/zIBIm5KNlB+4ZMueRFDRZrnnyLj/AV896LfZDOHDIlHN/8nzFXce5mvXLLJYpofahUgRNPurY9RpxJaq3o7v3Ctmx0CVB6cFX7rn6neNDmPhp4K4A5118I55dtqyLOSuN+nqhRZ2Cpl6eEJfpK1WWHYyZ6aEQjp1WC9onWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745550023; c=relaxed/simple;
	bh=LVmXxPc0GsxJCoufkyTtR1wIh6N17gyPoDGVcYXM0fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tg9yWv3KgFeD6X4JlcqUTFnyPxKAaTmhZ9IMRwPi4a39uXDGzx+Ie9wIqdrwDregxV0Ag7n5iqKUFhrfUUIR2HGU5AtPC3dVryzCEBikSFq5qWrijktOvsO0+3+XqeIZ94jnukbIfnBfiVmqxDNl4zqGmxv+vSm8m12V56HjRIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.214.249])
	by smtp.qiye.163.com (Hmail) with ESMTP id 131194130;
	Fri, 25 Apr 2025 11:00:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: amadeus@jmu.edu.cn,
	andre.przywara@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for Radxa Cubie A5E
Date: Fri, 25 Apr 2025 11:00:06 +0800
Message-Id: <20250425030006.45169-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425023527-GYA50272@gentoo>
References: <20250425023527-GYA50272@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQkNJVk1OSEpPHktPTB5IGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VJT0JZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-HM-Tid: 0a966ae36a7503a2kunm131194130
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRw6FAw*GTIBSj83AzhNIlEK
	FBIaCypVSlVKTE9OTk5LS0pJSklPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUlPQllXWQgBWUFKS0NLNwY+

Hi,

> It seems I'm a little bit late for this, but while we are here,
> Can we also append 'cubie' to dts file name?
> e.g. - sun55i-a527-radxa-cubie-a5e.dts

Usually we use the device name (without the vendor name),
maybe sun55i-a527-cubie-a5e.dts would be better?

Thanks,
Chukun

--
2.25.1

