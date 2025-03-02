Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E61B1EE00B
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898745; cv=none; b=uw7cQ+FWQxCorpWHCf8hhIjXQ4Ir3nPEEO5TcOoKMOVzXcjl5kYDI25jhWCvo5ktahF25T4PcG7bG/sjyOx8ahO6sQ9a8BCKLc6qpNgZgU+UYPRLdRDgBHl9u0hKJATqV6HNl5dETGcwjGt4jx2wGlgUsuJBaIbiSeRKgd3yPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898745; c=relaxed/simple;
	bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=F381G15gEVy5MABQ5Ic/tRm6gqLRE+iMr3oYdb26lz/w12Dv3uU4yHz91o8BMEZnnm2ey15yfO+lumacgJvth/8q09sctuT1+o2wjybXud6JKDtUw+NinEvvyPVDxjhP3JL0BH/PDiSAmUpPseVDb5hNjW4XhaNigQi+ePU5VkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=LwiYmhf0; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="LwiYmhf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=; b=LwiYmhf
	0wQlkBqNXzUcpiNfxPEjzi+ip3XnTqOAYCIHxYScdcZNpKsHtFE8p4+LP9f30L78
	pJCpH4Cg/rzSioekEtpSsp2c1MIn+wfRY1rbEvFzH0Y3W+r7vkXt6Rs+fzyKaO+7
	+5JOOt6X7IdCZ7q+PhKMKz7OIqp4LeMAHREo=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3_ywe_sNnaTZkBg--.41214S2;
	Sun, 02 Mar 2025 14:43:43 +0800 (CST)
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
X-CM-TRANSID:_____wD3_ywe_sNnaTZkBg--.41214S2
Message-Id:<67C3FE1F.06E74D.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUT5l1DUUUU
Date: Sun, 2 Mar 2025 14:58:52 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiihUEumfD7fHXaQAAsn

Hello! Rust is better than Typescript

