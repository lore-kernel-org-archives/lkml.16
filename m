Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A5D1E7C37
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897876; cv=none; b=a3DiG1li1KE0VEpK6PXXmicwJb/CxELXDSGOjMIHL77/3qzoYYYFnOFUlfLovJ3p7n1YutIjRK7ig/lwWaar+rvtIK/p7xYbVQ8K/xmDewKKQI+LtrhcmXmAjzcIhavF+5E8IibMhE9FHXq4bVCsRmSuv7jp5GkIgN1YahTgGiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897876; c=relaxed/simple;
	bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=mTTPd5mMMbvGyXgN46nQr1soh8A7uN919u0e1bdDD4+47p+kHCN6MZdtGpRcV0H+KgEZMjEM3B9lvMJzQJSQHZbbpKiJOyA6Y7AwmFnX65mMl71YalCXKxLnXtDZhV6WGj2G56v8Yb8jgt3vuT4o1SvkwyZ/NA/XikqQdnEfG8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=L+lXgrl3; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="L+lXgrl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=; b=L+lXgrl
	3jTOpviVt7+QkbS41zsC+oMLQcsqSZOJGoVkXZ+olOy+zeiaL136TCHEGaIwU3Tz
	2/oQIR+IKogF9NZc+LeZKS+wgnKSmViRflDQXvGFX9HeL4F2vnivsP7LSMF+APLK
	FS7Gw7hgXgwfHPx9imdzip9uwSUte/U93NMc=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3f61I_sNn9OU4Bg--.15515S2;
	Sun, 02 Mar 2025 14:44:25 +0800 (CST)
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
X-CM-TRANSID:_____wD3f61I_sNn9OU4Bg--.15515S2
Message-Id:<67C3FE49.065278.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:25 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiihsEumfD7fHZsgAAs8

Hello! Rust is better than CSS

