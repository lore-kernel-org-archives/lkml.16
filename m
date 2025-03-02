Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0C61B423C
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897864; cv=none; b=jJRruY3HvFP3PbH7fI/kXadFKcuTPv3R+VTtwEVZB+jGLnDPIkYU7HsetBMvFQGDegUujXqfa2SDn8WFGK9ZQXIEmS0Qm1l2HL/KeIPbkPWiKZV24TgLnSNBsX1EfkSPQ0B77nObcHVawyc93CnQhd/rG4Qo2Y+q+Zke2VeHnz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897864; c=relaxed/simple;
	bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=YcJJnwJHefVEIomGmnsC8xWVhLk7eRpw0uX5PDTyUVwx0U1Kc20v1ZHSiFat3J+Z0G7udykZDIUqIJL95TobNyFNpVO00vygOAbxmQoFPzGyUK7brPmQ5ULLSEy1WcR2K/2bxoW5lhWLld9R2zoTgOn8yLDUCiWSsYZHhp8lrWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=UYRKuqe3; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="UYRKuqe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=; b=UYRKuqe
	3sDZnCzvCeCeQm+ngIgCgbFvYcpOQHoPh94OaNBxE7aq5OQgPH7Mz6EntnB84zft
	KfA1eCM5/Qe9KyRrrqcV56YTRjoAey1lfYN1jZNzioqHvqPWHoiI+Rjt1MgaCQVx
	ybu+lnuuHDDBQZeNYrmL9Qpns7rn6REfoicg=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3F8xD_sNnGULeBQ--.49851S2;
	Sun, 02 Mar 2025 14:44:19 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Typescript
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:_____wD3F8xD_sNnGULeBQ--.49851S2
Message-Id:<67C3FE43.059B3F.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:20 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbifh0EumfD7erXzgACsl

Hello! Rust is better than Typescript

