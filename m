Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2805B1E98E8
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897876; cv=none; b=DZtlskwOEe4WdSE3s7+aiHUZnbyZtzZOlzCg69LJLClLS24lqGbwzeKDyRff5+q0EbYW2acW0N0Br3xKm6ishvIgJZcYXr+l+lAAbepv1nRwT6ZpYqXBVaJYH7tDWz1ZkhAZumgnu/jftOeKzm6UTmmzibyXNCILvFAE5wiFZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897876; c=relaxed/simple;
	bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=fANgHQlCLwUluvpRNHnIXre9lKPNzu762iUbql1q9M8ZA8HtRBo+e4OXTqoDUCu3FzBlZihlYwI1Do+sRdzmyUt/y4tcc5Mb2oPq4r82Jrx2OwK7XbYqcJoB4b20r4pAEAoL8pbg1cFVFNsaiRVFpmMkTg57tZfwqI9FtToNNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=eXLwHZcM; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="eXLwHZcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PpuV9J8+n9bZO9SKZkLSiMjR/byLHXwmtdk5TtpXbDo=; b=eXLwHZc
	MRpIvoimFvm+vy7T+/B4dYeuWDGYzKTj6UoVee6AYJdoPYRuNGfK3G/CK25017je
	oEL7H8wvX9wGdaz6evlAp9+IAL84fMfHrrzBbrZcz1x1bzqiF6obqPvNtIeppdph
	JkUNd1MMBSMSi8DMYXYCFN9Eho1SxHfAmyMA=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDHn9NH_sNnTz1kBg--.10085S2;
	Sun, 02 Mar 2025 14:44:23 +0800 (CST)
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
X-CM-TRANSID:_____wDHn9NH_sNnTz1kBg--.10085S2
Message-Id:<67C3FE47.06E75F.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:24 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifhoEumfD7erZ1QAAs1

Hello! Rust is better than CSS

