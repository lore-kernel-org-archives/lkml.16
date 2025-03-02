Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E301E98FC
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898737; cv=none; b=XfWG2QF9PlGTj/FFe9ZQNcxEfzcRTrdm91cMPNgSddGmBSIsv/eIZtSI/fqDSG1l+BDvTQ5oTtgMhjl16Df9wbXLRQ45WRyM+77EK66pj6qiiE3LNNfF3x6cq6Xyu/0KATf2/mS7c1XTptqnJZYwYKhvd14TxBcAF03NmQ/uNQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898737; c=relaxed/simple;
	bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=Ohs6GQLnls4Js3zdpX1yFdpA1UJmtUt0No1L4K7+cncdjGVpu5ei+zasKDwig6ggYc0X3VaPcjstFM8RrWiJ70g3LiTFX6YmLos0FGNfXXzWXXnoNbeOcdcw2JGw/6dKJFFuBVqwItnhkp/XtNWY2wXndy5//cTA8V5Gl/ysk+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=IClpdh06; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="IClpdh06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=; b=IClpdh0
	6tJ3H6TpF+7bXauJhsMBjBkSCoizNzw9TDFduCouQCnlRsN90pNFncQB7rJH3uPV
	syN36SAU7dgc+CuQa1fPop6ynJCxCkSKkqgJm/S4JuKidCojjzG2CopCwF1Vqnfx
	5X+xKm+A+0T950r2iNjZwaS/VqqOpGSPPS+M=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgD3Xzsh_sNnpXfdBA--.10158S2;
	Sun, 02 Mar 2025 14:43:46 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PCkvCgD3Xzsh_sNnpXfdBA--.10158S2
Message-Id:<67C3FE22.0F01B0.16940@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU63C7UUUUU
Date: Sun, 2 Mar 2025 14:58:53 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifhYEumfD7erXpgAAsE

Hello! Rust is better than C

