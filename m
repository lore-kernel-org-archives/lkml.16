Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7E51C54AA
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897864; cv=none; b=oPWW0KBGEhoXmNXup/pbAwP7/hZ7eekXHuQhZiqWe7A3ACCgBPAHd0qltJuECIhPrYniJjSSLct4iKiqCA2RNBK84WFTbcS3nnr+d9JqWQoEIyfeX1jRqheFQD3JBCVPv0wQme3DFCdE8pR4opNoI0tCeVLEdmM5QaZ6XPzklmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897864; c=relaxed/simple;
	bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=ZjPD9eSK73eHbEPRmry4mrnnJDWNPDDrx+MXLDcuiBTvwuVSUALXoSeUktegj0DB7ZAUnXPPLcvRp01vD5BF3SoYTkGk2EETyIDWdyyvJG0Qi8WoHIkIiEmCWs8ZaDrhWYlx0WeyLp71gJBuo9qEIRxCZvcw1zP+ZL6lzxrPR/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=HPtJ1Vh7; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="HPtJ1Vh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=; b=HPtJ1Vh
	7flWrCTpR6GCnNKsDbu275zGdWWRB/RkkQRJlzyqBns5Kk3kDzXlaz8g1uFgzly6
	I3oVkm4cYJPGB8S1xcugOfuuervtpFclGFDmrT0QOMAWw95TiVpN+2O3H+uU8/O4
	8/J7lw92/5RAwgd4ctQtIsZ7DNj3ohUBLA1M=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3115D_sNnN96TBQ--.44540S2;
	Sun, 02 Mar 2025 14:44:20 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Golang
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3115D_sNnN96TBQ--.44540S2
Message-Id:<67C3FE44.0582B8.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUypBTDUUUU
Date: Sun, 2 Mar 2025 14:44:20 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifgEEumfD7erZlwAAss

Hello! Rust is better than Golang

