Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3CD1D5174
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897866; cv=none; b=UQSa6QG6lYTNbogbYlwk31AoqjoHUgC2nCCXC9hhEYz/w4l3VwH4X9OnNjFd4+qd3klwrt9+738haKEzUI3kEzgxFheu+IA0umFL+oTn4fs9vO4841ktVzKmPpluORGKVYf3uiwT3L/ZoM2dygIcQRF8WrFfsAbNEk2W0gM61/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897866; c=relaxed/simple;
	bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=OvesKcwUSnxZDkQV0dHV9efSLsRyM/84kXFHoGp9VvtOmQA8RWY52jkZH/VWRo6rlak240DOiUa2AXyH2+2t7h3kcN2hYdibirctg3nuypV5OljQjaT0zK0JF6WzHBjAfnKoCFEZ63sQB6YSnSAXpx5qtOqs0MpM/MsWWIf3Lo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=CklMqdB+; arc=none smtp.client-ip=220.197.31.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="CklMqdB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=; b=CklMqdB
	+7GmxeVZhMdDILQWRyjsj+soo4FtY2umHc9zzZB8aQ4o83UJ/b8GP+eHzhj/QCKt
	FTQRdQPnlNHL3xJzSpvn4rN50M9vtRh5/K6SoBkN3RX0yGYdgYP2TMUHLloAtGqm
	QOnNLlUJN0288sQIb24UY9MMAfYCBoFO+tp8=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3L5xE_sNnTuU4Bg--.48016S2;
	Sun, 02 Mar 2025 14:44:20 +0800 (CST)
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
X-CM-TRANSID:_____wD3L5xE_sNnTuU4Bg--.48016S2
Message-Id:<67C3FE44.065275.00001@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:21 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiihcEumfD7fHZcAABsz

Hello! Rust is better than Typescript

