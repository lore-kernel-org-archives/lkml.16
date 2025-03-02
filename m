Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F8A1EE039
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898746; cv=none; b=fIe9zXJgx6e3jIj7OeYgbRbcNn66XbAPQY9/jinA81+pJ6Jwimx2d0vQRDarFPRfdCa7pVBwZPwoQ3J2PNbEweIL+maEdQW89HSWdTgoxfTIXCN6Rbqe2Fi1vDiYQk4fKFBgzvyNQfWrhkHTaj/4wCDY+TuyQNgHJNSa44irm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898746; c=relaxed/simple;
	bh=kuanHuw9J0++yX2NZUc3mDyVR4V4BIDbLbg7VpSpL+4=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=HoY9EN2EImJkI1ByjvVv374IGf/tGOh63kjBSG+gFvkl4nR8fW324/ItcTYF2NlvPqxH5XVSSqgOm6Kz1FVpbbO4Y6W5ytwwFQIRSlr2fekaP27Zwet8gf0TfaUG3X/hD0hlddQmYDXzn9LOFls4hl3deRb8fnk0q/By4IE4Mk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=XXYWv+0W; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="XXYWv+0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=kuanHuw9J0++yX2NZUc3mDyVR4V4BIDbLbg7VpSpL+4=; b=XXYWv+0
	WSg1ESX1qypvIR7SIY6MHTHEhOpKjkBv0+ilGekaQBiIc6jp2jpy9NHCbhkkhRzp
	MuQ9UUNodz9GZVHCphUk3NF9ZmbFUr38/VQ22t0XJBrN8JfnlJED9NvsxqHX80sZ
	U/oBhFeQK7G/5A5NT5pLiFrtqXs6G2m74Fac=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD331wf_sNnsN44Bg--.64403S2;
	Sun, 02 Mar 2025 14:43:43 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Cuda
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD331wf_sNnsN44Bg--.64403S2
Message-Id:<67C3FE1F.06526D.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUToUqUUUUU
Date: Sun, 2 Mar 2025 14:58:57 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifgsEumfD7erXdQAAsK

Hello! Rust is better than Cuda

