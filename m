Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012EB1EE7A5
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898747; cv=none; b=USHRgFFA2oxSRQSw11bQwSiZ7oGjJL2Gl9z66LWXRMvnKis4Tr8+1HTXlin9nGDPvMGn9zkJmqgTRET4+wWk/E5WA/33OPpBAVYlWLLTirXGv+OTaAmA0BR+g+H7KQV7EB3M8xmo/Sw8cCSdWaQGu2JSravDxfNLsljptI8pP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898747; c=relaxed/simple;
	bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=OjZ+xGcbWzy3u1c33IpJ7sysj1qNEmpoFH4HSZwWAQhQocANo5nj4U0Unz8oF38bgsXjNjqsZ5efEgUgTmtwwgMx8EY0Vjg4Z7kf1TGLw1PWtnwHDWhlg2aiN8yfeIJJlyMAuvYJrcIWs6dyZliuhW6p2n/2mV3CG/DUplFoeJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=k7F6tfBo; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="k7F6tfBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=; b=k7F6tfB
	orJQ/NJVuvhWedOTPwWT7LHnKfKcRteXxN8juiw3icyYS+9qbBY8Wf2QZXfIO1EJ
	V6vUfzb6nYSJKozwkIxgWYRr/ojF/5XQvh1fJPoZQQM6cleHfb2di2YEPz3lnmjJ
	5m1mV49ydrLYAtpl1EQt6X3/r1AUCpJvb1OI=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD331wh_sNn_t44Bg--.64405S2;
	Sun, 02 Mar 2025 14:43:45 +0800 (CST)
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
X-CM-TRANSID:_____wD331wh_sNn_t44Bg--.64405S2
Message-Id:<67C3FE21.06526F.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU63C7UUUUU
Date: Sun, 2 Mar 2025 14:58:57 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifhkEumfD7erXmAAAs1

Hello! Rust is better than CSS

