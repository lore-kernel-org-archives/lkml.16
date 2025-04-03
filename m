Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAFF2512CD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697344; cv=none; b=nlaw15JhXaGcOIaX6QJ4r4eMPOo0eFFUkuL/4BxAPzyr8iElBp/ha+KKscnG7h9yHgsgUFt0Dg7o2Cp00GLqIba+7g3E1mj4vAJmqahH0V08mAuNSEcoofeIA+jJ/kYhmXwrPlgD+CorprIMGdwUAZGCpzV2I0Ftr2UwcF2fwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697344; c=relaxed/simple;
	bh=GyQ8uYRIGMH1Vrej6aG6DaJbjgDDARm2DUt2mtJuKAY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LVjzZ9YHCkZDde8UbeQ6DrY/m9whFBGfJfE7e/p1s09f72/MvcqiLhRsxB8bBWulN/bEhccm0s3BY4Are8PZQV/t10z/K7q3C0lcDCPaG+T6Bnsrj/IeCKHgYLaZJ3PIZ7+X69JAHqIIEXrvpkocSw6p8JNQG73ZlokXiU0XC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4ZT6T13PPMz1r4pQ;
	Thu,  3 Apr 2025 18:22:13 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4ZT6T131KYz1qqlS;
	Thu,  3 Apr 2025 18:22:13 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id N82m0NHgvFGx; Thu,  3 Apr 2025 18:22:04 +0200 (CEST)
X-Auth-Info: SeZKiRxMTJuM4zhgdDaQi9nX5qHokru4xgHgdPYsc/EstArBurARwS9Ut1eYZYIH
Received: from igel.home (aftr-82-135-83-202.dynamic.mnet-online.de [82.135.83.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu,  3 Apr 2025 18:22:04 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 610C22C19C8; Thu,  3 Apr 2025 18:22:04 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
Cc: geert@linux-m68k.org,  linux-m68k@lists.linux-m68k.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m64k/kernel: replace strncpy() with strscpy()
In-Reply-To: <20250403001628.29920-1-m.mahdianbaraki@gmail.com> (Mohammad
	Mahdi Anbaraki's message of "Thu, 3 Apr 2025 03:46:27 +0330")
References: <20250403001628.29920-1-m.mahdianbaraki@gmail.com>
Date: Thu, 03 Apr 2025 18:22:04 +0200
Message-ID: <87plht43mb.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

s/m64k/m68k/

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
