Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016851EE7C4
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898746; cv=none; b=a0NQl/n1bG0CkTNrwkOE13nDI8b02yrT4vFvVHpC7ZN6IbpmLd3YWeoxEh3fhhlilOpdzFwGfzuXObOc+9mPoUsl9apaEmBxHUhg+xKquFnkGQz/0ckqGZdvdkZSGRnG7sii4A+Sd7ZCzw5EGsiRvGNPwt1KAjYkI+YU58NYOtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898746; c=relaxed/simple;
	bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=X9b/67b7kxJeEnBH7S83MDjpChzEJGK6kmKes1o8o1944uV7SJ2Bq91j7JiHAaDqlTPPVh+Vr4i61gbAHp9s56dq7CndDJrqoC7KIO8OtI7JTvxfe06ObZP4fx7DAnezhzuNSU7ZFaKmjz4ZKEJcPjgxKkerNn5TLX3nN90/QVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=RLjE/Oaj; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="RLjE/Oaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=cftqaDB8AEPz09qm4a8a9qxUPytrv8Vr6D6ryPJtm4g=; b=RLjE/Oa
	jxYhqUWKTek8rM0ZomWiDFYO6/lRPFEL8Oe56anCUjvvsjdjB0hjJJH6JbWk/p/Y
	5ov3PCoRCcaUNhWdnaVDUDLZPFPz++pJN0yaZ+fLsxBUj509Lm7LIu5nUiWQqRGL
	LGgahZIjHGTFLilV2ceQupgnuuxMOHiemC/U=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD33zYk_sNnh984Bg--.3616S2;
	Sun, 02 Mar 2025 14:43:48 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Java
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD33zYk_sNnh984Bg--.3616S2
Message-Id:<67C3FE24.065271.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5fHDUUUU
Date: Sun, 2 Mar 2025 14:58:57 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifh0EumfD7erXzgAAsn

Hello! Rust is better than Java

