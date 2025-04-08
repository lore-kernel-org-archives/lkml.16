Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7E433CA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102728; cv=none; b=i0KOxqmKBagVJKCih3eWDmCNwMqydsdmChDsvFU8JZX3+j8JxgibESINLcaHe5+U7n+t77tizKtG7hMZICNFK5oLvppXTdE7o+Jhi5iASV7BwP50p8gOcnOx/sAMNat2KiadbqAuv0PVIDfi8be0D2dQXL48eQB8rPonHZrbQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102728; c=relaxed/simple;
	bh=QQchV6tftmElWy9vNuoo4VticIKPQZz1gTi9GVBKl4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kxTfq41UMJGVz5Afi5izBzIvXFpaKMfCLN0HDE3Pn9qs6gL6dtQC9IwQrrP90WSPBngxhiVLgarp7icpWaJ69ySnAvphXL83txm8eXjNj61/2r1btLJxUv/nqZGwrPQOMT+PJSNhttXDQ+MioD6X130T+hRmhpvu/YlBwHa1xTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XGx0bMi8; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XGx0bMi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WhIgU
	GZ18lv7Q+v1IdlT15kszuimW64kU/hMIic1axA=; b=XGx0bMi8BRMsBbpatoekw
	rd3HhaG2HW/IYN27+oL11bxCaafPMsV7nKloeC7fiXawZOOG96hnHuwBuEZXngIc
	VA8wlur7pi9hIM7A/N2ZXNMsIXQk57c1pnuuAhbkrbT38Wu6TSHdki7hsVRbiDPj
	/YBj/Ao4DvL4osj+qzzIoA=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3Qksj5fRn4D73Ew--.59429S2;
	Tue, 08 Apr 2025 16:58:11 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: dev.jain@arm.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	ioworker0@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	xavier_qy@163.com
Subject: [PATCH v2 0/1] mm/contpte: Optimize loop to reduce redundant operations
Date: Tue,  8 Apr 2025 16:58:08 +0800
Message-Id: <20250408085809.2217618-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Qksj5fRn4D73Ew--.59429S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4iiiSPUUUUU
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTgkoEGfz+RI1igADs8

Hi Dev,

Thanks for your valuable feedback earlier. I have optimized the patch again,
 eliminating additional boolean variables check and allowing the loop to break
 immediately once both dirty and young flags are set. This approach should
 theoretically be more efficient than the original code. Thank you for taking
 the time to review this work, I'm happy to make further adjustments based on
 your suggestions!

Xavier (1):
  mm/contpte: Optimize loop to reduce redundant operations

 arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.34.1

