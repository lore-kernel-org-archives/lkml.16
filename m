Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052791D54C0
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897867; cv=none; b=gfGk1uztr+yTS/uJrdLjM4G0iomvEzjx8JGnv8whJKcpReoR9IjXaJwhRildIVHmHGHIDerSeNWXjWw9fdYaqnm8tousHT8Hvc5kDqcRPBB/j6AeKpytzqQhC0EQ/Igt9Bp4IoRdzqFRJcnYBZatw1l6uGMyiCKbCNthPRauBP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897867; c=relaxed/simple;
	bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=bY9RXUBrWd3HO0Jo7YxHYr3SDmsELTmYAuvP32C31q2FbUPl7U2gPdQKhVrTUfkpoMLJ3vRshp97LoiVCnhgcETea9KGIlNkgCvCwaGxQph0PcXpBveM//Mh67oTT3G6b9pj1xQ69hXbHTidQi4LRZ2r1w/YEriN4J0OxFH9u/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=mdO1dQ8E; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="mdO1dQ8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=; b=mdO1dQ8
	Eo63trzicL7A3gT9lhc/+67JTWYZXioVcznuzLe4jzIm2qTDbb5vW6phx/Cvhs7/
	mzJtxTmYsmaaJiol509D1ubrxCF18WnWm+VmYCVn7SzzidU9LcOWwLIZhn4NlWjQ
	ehJulMeJNEDXfB7JiBIKLfVjfGeQMFgTVwQQ=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgD39yJF_sNnfXzdBA--.7367S2;
	Sun, 02 Mar 2025 14:44:21 +0800 (CST)
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
X-CM-TRANSID:PCkvCgD39yJF_sNnfXzdBA--.7367S2
Message-Id:<67C3FE45.0F01BA.16940@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:21 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOhIEumfD7Anz2gAAs+

Hello! Rust is better than Typescript

