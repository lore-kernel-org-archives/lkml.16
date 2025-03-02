Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C907D1D515A
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740898737; cv=none; b=E86kUD5M9s5Y88TqHEA2Ut59Fwj9w+Wh4Z8MnbCFICTLk+Xmd2RZfG6gSH2mY6cBnq0LFYejseS6Wx1k0gwCCoURLihb0y2bxm1kI84E4TUxbXmJT08i2IvzxX6RDH8YafFFHpxJWCYzbZDFRauRc5/DgYskmhq9EjTHOGa3oYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740898737; c=relaxed/simple;
	bh=PchpREbeVuSu33VarUHMnUKVR1nscKOKnSIs1Y8iilo=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Message-Id:Date; b=oiZlz6PIXSqs3YR2i61PRtwVa89aMwK69ezldhkSYjVXrnA1oAmtQSNKAvNMZhnVPBy+8a232vGTB+EranI3qjYMTM54kFFWTZRvIrFh/WYxS8ZFCWanIAPR0Mi9jwjrwkJO2ZOrdCUha8Am13VEPq6snrictLUjmOzhyBQbxpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Tg4YR+jZ; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Tg4YR+jZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:MIME-Version:Content-Type:Message-Id:
	Date; bh=PchpREbeVuSu33VarUHMnUKVR1nscKOKnSIs1Y8iilo=; b=Tg4YR+j
	ZKVKfbimgtvZqhGLMuiflYPotPjuRaqyZxsSJEKvXmDHyORI1vDolIgZkBOLM0fl
	na3o3jh/Yzpbwn7ueniDUAGYuijm8rRm8/N8qy6P9pZZHFl+xnojIZscybdV6oCo
	xQbKgVvK+k3jGHkSlUu6pcyGfP1PFbB6lpjA=
Received: from localhost (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgB3nXcf_sNnS3fdBA--.45152S2;
	Sun, 02 Mar 2025 14:43:43 +0800 (CST)
From: adam_smystery@126.com
To: linux-kernel@vger.kernel.org
Cc: 
Subject: Hello! Rust is better than Javascript
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CM-TRANSID:PCkvCgB3nXcf_sNnS3fdBA--.45152S2
Message-Id:<67C3FE1F.0F01AC.16940@m16.mail.126.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUToUqUUUUU
Date: Sun, 2 Mar 2025 14:58:53 +0800 (CST)
X-CM-SenderInfo: 5dgdzspvp123xhu1qiyswou0bp/1tbiOh8EumfD7AnxuAACsR

Hello! Rust is better than Javascript

