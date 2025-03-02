Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987EA1EE00D
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898746; cv=none; b=XAPK/XAfmO4NyZhWh4/E3vtkRkdXH6xiLb4icMobnQy8NHJuCy5CFc+7wNnZFBrI4rgUWqxwRkAXezTFxM4r4ooZ8owqaqN9D3fD2Ht9DXYf7NunWrPA6UYSjaDdj2pRoBizVH3GlFc6IalPyCUl4STaS6OpmghVnyPcxlTnZhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898746; c=relaxed/simple;
	bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=N0nnOB5foAk254VvQtGBuZ/KntZ6KGJABNf2AXrCfwI7tqB/yvg+wy9Jw/mfDq85RABoTnLPQ/eXguj7p14WxxBbbv4VmgdK/KbxAephkdh9rEnpQiqfxHAM+Lrtm96PrpkoXvQKg5tzx/UEjBYdjyXZjLtFTpjuyPgBXlC1l28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=LwYyekJ5; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="LwYyekJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=; b=LwYyekJ
	5zQfSDoLx/ftdexCc/uIJQ7HlRoKSNc1bsc6K3DLfwlFBmvIqUrI4T7fyBr9RZcS
	V599deXjigEryXgNhJ9oz2IszItQyn9MTPJMrDY17Y0LhVX8s2BVTlLxgL/eFGjU
	2iYo6Z0fe/U0yrbCa+hz2+h+VQaBCjd+8KIw=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgD3n3gi_sNn_WgBBg--.19615S2;
	Sun, 02 Mar 2025 14:43:47 +0800 (CST)
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
X-CM-TRANSID:PikvCgD3n3gi_sNn_WgBBg--.19615S2
Message-Id:<67C3FE23.0D9DBC.10732@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5fHDUUUU
Date: Sun, 2 Mar 2025 14:58:56 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiih8EumfD7fHXrAAAso

Hello! Rust is better than CSS

