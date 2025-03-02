Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944A01E7C27
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897876; cv=none; b=M/rWfhUuD+c999OSCQ+4S6RnSlc6xhF3IDi5WxgO2rqhRBlIPek8tgHQ4NqAMJn2TGuJmIqetGs+C/+dDfKtticdOQjsrzlxkOvqBtPyVWf52Z5gNYkdO27JheKCMtruAXPLZJS3P0KFDbmgvuYLD2DNSNWzwLs5BqGYp/AmXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897876; c=relaxed/simple;
	bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=l7ILHgI68TBNoK8HRcnLAtoUbwpPVbhxq+iXbC+630RGZr+/rafQKJr2ExDDqpQbwDH6mfwuMNyB38X4OQJPe5XK5lHUE5Zcj4w7t/kIy1H6uJVDUnLBkrLUlMEDk9PrjuIk/41tmEcvUgYOxgcTv2Bv0xRbFB+xtApzNGtXmaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=JBsWkrUH; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="JBsWkrUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=UyPD+95nIFiG/gFr2rAqnNWXPHGkDBUZBe3GQzk2iCE=; b=JBsWkrU
	HiFJ/5l216c7lNXCSpPqfIA8afk5sI5Eh2NOEL0jwkrZX6wJwPCuQ6L+Ypz8NxJI
	h3R9Y6+oNmM4nLCSbCmGvgPc2G4ey/jYlhxCLQTa4Fdm4zeBcXX53aVyhIRrQR1H
	EoYd8H+l60QcL7X0LyWJN35CAQyx5K5imZmc=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD31ytI_sNnPhsYBw--.35155S2;
	Sun, 02 Mar 2025 14:44:24 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C++
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD31ytI_sNnPhsYBw--.35155S2
Message-Id:<67C3FE48.06FBDC.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:24 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiigYEumfD7fHZogAAsx

Hello! Rust is better than C++

