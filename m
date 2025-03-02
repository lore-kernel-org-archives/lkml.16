Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AD11EB1A9
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898743; cv=none; b=m4V4D+QGx+44ZCsN/ya20n58NJAyHKJeAJPDXJd6SJ7O6yMbEDdo4hcs2agqV4LDba8T8+mJT/m5pe5i+/EMVaxZPzzu9g2AJ9zgWkm8BP7QUcCv4maqrsHYd4mICNd5bglv97ntZaKOCXlY7knI8Mia2vk2v2QOQM318rO+lwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898743; c=relaxed/simple;
	bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=rOxtnYgfh1WtPIRQYZGSSnEEebhTb/5q5XJ2wnyGIDe9GajSy3AzuJZtytB7tb98rZSosrRGdOpM20xz0WXD9Xh7CJ/+xz3SRFd552g+qJSBBiX2oHos7sa7M5syBz0z6zEpaR+lqXYo93Zez78Y8gwaQAzUP5utAL/wCg0wnpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=RNaU5fwh; arc=none smtp.client-ip=117.135.210.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="RNaU5fwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=m3WWx7WaxOLxHF4l3ehA7ZpOfcH46DacagbXvgNtOUU=; b=RNaU5fw
	hRllt4tIkp/YUbufOLED9gcatkF9Gv9LjU2AMh5Xg96z6dfqVCrfhdUC8xU3lL8I
	WC1mqLkjqkAtwYbsYL7IZ/ttns/4A6heNjIlmjNqkMpCS264j+2inTNsnl5cdO6p
	OsT3R2GxkdXiMLwsMICTLIuVmRfRzjFBUBRs=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3d7Ah_sNnxjzeBQ--.11113S2;
	Sun, 02 Mar 2025 14:43:45 +0800 (CST)
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
X-CM-TRANSID:_____wD3d7Ah_sNnxjzeBQ--.11113S2
Message-Id:<67C3FE21.059B36.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU63C7UUUUU
Date: Sun, 2 Mar 2025 14:58:55 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifhsEumfD7erXlgAAs5

Hello! Rust is better than Golang

