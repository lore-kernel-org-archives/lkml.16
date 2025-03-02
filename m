Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD64E1D5166
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897866; cv=none; b=BqoQq5a5gBtoXPI7/2JJAdIK1beYvs93jrvnENNqqKy/5/XOd8a47MVnqXx0qDGam6gcFaJuK3JZtANTvh8hZ+DC3ZcvXWnQu/gA/K63yGSK667k7MYB3yzukc85udwji83evhvPvp518hv3kFJPRw+esv1Rr4o4e3k2m5dre+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897866; c=relaxed/simple;
	bh=PfixNPQ/uTp/hFvZCGY1TVY84A7zL5WAfQIAbeeaQe8=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=jN02TNicNT7WAR8qHMzQTWKiQ+t2C5DX5kajaS1zxwJNzsQvIPhNd3u4KS0KwP4ebvyWA7SvVtmC1sXCLaWW3f78ifcb2FxaXh3lqN6kh4oTtoYe/RuXo4Cj4XkzICTxW3kGWYZbnvkkIxOOlMVJub3i0sWYVnEgnEqt+cuDCss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=TPwmy0lr; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="TPwmy0lr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PfixNPQ/uTp/hFvZCGY1TVY84A7zL5WAfQIAbeeaQe8=; b=TPwmy0l
	rOVE4PEXXDeWMheLWw7XajZtuQdu1d4ZGA4Vv3Tj4Nxxya5tC76LpIEhSJKfM/eA
	3IXbvJcFDikhQ4EVHQ9l2F1YcWdCfrSGxaUv8bllv/a3K3aLmiHzTQ+ylu+TT8Fc
	+ZF+qouURqO+dVZ9F4mzkeJoAmVOzEG4QzYU=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgD3Hz9E_sNnanzdBA--.10772S2;
	Sun, 02 Mar 2025 14:44:21 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Python
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PCkvCgD3Hz9E_sNnanzdBA--.10772S2
Message-Id:<67C3FE45.0F01B9.16940@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:21 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiihcEumfD7fHZcAACsw

Hello! Rust is better than Python

