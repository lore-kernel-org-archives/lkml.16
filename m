Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735AF1D5CCD
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897867; cv=none; b=ceFrLiKmWI4S3Qqb3hEJZVDCK+I8CUwGo19jgYyUwEDRYwSk7FloiCfxFFQulanVBEm3cgeh5fKRczs8/qVlbmw8b/C18Tm5aq/KEOMiWHnGZ1oiD7J0Pan9kPmjDfatDvRPaksXMlp5il20odf7fyHp+mKnIJW5rrzrtTWMcF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897867; c=relaxed/simple;
	bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=fJtJX+PuvDM6/VetqaVOiKJVU9xhjYxZ8Wxxbb4W/d/3H5GtvNFC0w6mkaSoZjSLXgP09nk5fLzoYuOo9SOGUd6zbp3yzh15KCNOvTRuzpzUChf6u3adbdhdPCJFllbrh4NXHsdu0cjH6tKIhJvpis5TD9bMOonnCXeVi8zX/xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=KAIEiC0I; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="KAIEiC0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=JRXhdhnZz8FXfPKKFhJq2JGkB4LIysZOAiXNUdUmjM0=; b=KAIEiC0
	IPrYOKI5QAgvYRAUE6desTNmIGp3QuHtYedbSEleoi7Y3nmupaw3XFJQj3aA3ZK9
	yBWhPhcrp6sZKbayKHxG7OpdhzBmzxJyg1LrrxxDnF/bf0aR4QKpX1Sl49ZCoYw5
	gpamOFE70CmmqYeJPJ8KyNY9aThWYacSSmW0=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgD3f2tF_sNnJCQJBg--.62102S2;
	Sun, 02 Mar 2025 14:44:22 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PykvCgD3f2tF_sNnJCQJBg--.62102S2
Message-Id:<67C3FE46.0D9056.12474@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUgjNKUUUUU
Date: Sun, 2 Mar 2025 14:44:22 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiig4EumfD7fHZgwAAsY

Hello! Rust is better than C

