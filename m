Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8441CAA7F
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740897864; cv=none; b=SWvsqK6JfnTUQQbbDWOe+EHtqErg0F4MCpzItpy4HJdoRmVsE2wrytVoMKxKrEtsGN5/ctXzLkYjkbd5W2xZk2ZaQUFWm6wdoGsOgo6s87EZe4cf/x1gPoziArXJx7MFemP6uZWWFMxTmqcVbPK5DivLWneWbqE5kpxEC1Vpo4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740897864; c=relaxed/simple;
	bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=LwgUJUwlxJgAsveojfTfO/SInyJDY97TyCQVcmba0zozgTI+8QAcYDtYl8SLAQ3PVVzm/O8Lqz5JKkIfd1L67wKtU1Obmk7fLmlu1CztFhDNK2zBEhNQrUNy7OG+sNkjhJ6SsbJ3v6/0S4E4QkF7UFJyWlMhiMVyU8OX++S/gGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=EBJyF006; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="EBJyF006"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=ImIq5E+yzSMuk5VQu4015FnEeU4ZkIfZhZtOrHrX2Ew=; b=EBJyF00
	6iIdGFrRp0kxSb3mxfOmSFXUy4QNFYGr9TfjCu0bF8XNWTV+ycbvW8VTnHdNmJaJ
	yZ1vzSYZ9sJPdSWg28MAZj9omj+z9M5VPnpNWbaljaRGZxfW8DcsmGAQVh8Ob/bb
	YpGAO6+lKWMaA9PB94IXkv/59X/Mwbjrn56U=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgBnNxVD_sNnP3zdBA--.5475S2;
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
X-CM-TRANSID:PCkvCgBnNxVD_sNnP3zdBA--.5475S2
Message-Id:<67C3FE44.0F01B7.16940@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUq5x6UUUUU
Date: Sun, 2 Mar 2025 14:44:20 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOgQEumfD7AnzwgAAsw

Hello! Rust is better than Typescript

