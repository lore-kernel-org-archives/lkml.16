Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A1A1EB5FD
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898740; cv=none; b=l6ak9XzLAMygi2CJREWUketpTmU9qz0/dPFatDTnI4aEpMGB+5Rap2HcIwpIBF4cAEidC9SSy71L9I5cmyXXGNHSRaupvuNOrybe+bXYnnGmy+JkNWvVpxGNZ0iOXzNPSx17o8reEM6jCgpkrlG397MzyEsf1I+9hlkm9RNcNrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898740; c=relaxed/simple;
	bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=t5rd3eIDwjISNKIqTN1yRvkFB1USiHoB7hLg6TQkwzd5mskcPfrWSYnAizaqJbOfoj0vYS7YNi9wE0CRCM0thFK1/lcGPfzZVEeBDqopcCyLcbvGrDslqGtOOKJRPzVZj9nHJApXe/n/qU8jR1QXN/p91ymsQNUiMk8LCae0X+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Si/pLaiN; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Si/pLaiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=; b=Si/pLai
	NlP2wdP9jSZ6LVAfr4URAQy3DQZx9NtFDEa3hQJHY2pftuZrctwuJFNKp6S+fNK1
	70QiYiHaBE8TVE27z3nCyZuwDfY611uen2Vyq/os3Djlos8g+XMOipDCiK/dg67B
	UWfBuuZupv5uj44hALhuTTTHLPHAlncQbpWU=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3X9Ug_sNnpzzeBQ--.46985S2;
	Sun, 02 Mar 2025 14:43:44 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than CSS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3X9Ug_sNnpzzeBQ--.46985S2
Message-Id:<67C3FE20.059B35.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU6fOzDUUUU
Date: Sun, 2 Mar 2025 14:58:55 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOgkEumfD7Anx1AAAsp

Hello! Rust is better than CSS

