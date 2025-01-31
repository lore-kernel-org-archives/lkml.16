Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16131CAA92
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738333324; cv=none; b=JbIQ5GaMMLLfQ90uKdz+5RCzMVN9rUUi/V9/Vpr2FGVjz/Kwlj+gLClm1VLn1SRhMsS+3SBAMLlcJV1AGv4SSiG59PgHM0wS3+xHxv/XZtTbrt+0lpJZZEzxZe1MQCeZQHlYDyXRol/s81p4xvmYM/N1Ur5aCmI7jA4X6B57uno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738333324; c=relaxed/simple;
	bh=bzzeJyc1McWtYgPd3tXvrw7qizKSI2Hhp91PJMNNx44=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=GQDIa1Q+iIxN69sZ4VXJco+fAtjZ7LppT73ouezFpLliA6c0e/D0+ohJ2fj+bAaodp2AojdrqbCL02N8zot0ghd762xBf1AfXk2A7+ZPijCvCsWoAjKkutneNCQXjdghfWxQnWppj2nrE5L7yK8rfazV6+oYGrWlMnZ5ov425LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=FTYccVfa; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="FTYccVfa"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 2964B240101
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:22:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738333321; bh=bzzeJyc1McWtYgPd3tXvrw7qizKSI2Hhp91PJMNNx44=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:From;
	b=FTYccVfaDBPPlOmRadK/Zy2gXv/XO1Pn+qO+Q48nkamajXXrRIKRUtbdlGdg13PSt
	 Xd5JCWm1mL9S+zFDDKEXZldHdM1H6iKd6fqSlVJeKjKyFdp25fQyvNUJ+4ebmnVA6/
	 9zMzh/EfXw6PyzAacdzgKSUhwkKv3K1ZjvLgiu0JkjKjPmoaZHQBFgHbrOOPEttC61
	 EI2KvIJPGwAQ5eGW2L+yufHb2YxRxgW3Umi1DakHTLViPDK2UUi/p+BS5UvPCEX6ey
	 sw5UhBmMpSUGSF9px3It3IMeWTj9o7rYJvD8EDfYdm3B3x1L+4vOWElxXuNKXdnRjD
	 fSxuT110z1BOQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ykykw0TPRz9rxD;
	Fri, 31 Jan 2025 15:22:00 +0100 (CET)
Message-ID: <0eb8db5a-5ec1-49fe-9fc8-6c1e296473a6@posteo.net>
Date: Fri, 31 Jan 2025 14:21:59 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marian Flor <marian.flor@posteo.net>
Subject: [PATCH 0/1] GPIO Keys, fix to emit EV_ABS event also on axis release
Content-Language: en-US
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi

I noticed when using the gpio-keys module that an axis button is stuck
upon release of the axis. However, the docs at "linux,input-value:" 
in devicetree/bindings/input/gpio-keys.yaml notes that it should
create an event of 0 when released, but it does not as I found out.
This patch aligns the implementation with the documentation.

kr,
Marian

Marian Flor (1):
  gpio_keys.c: Send also event when EV_ABS axis button is released.

 drivers/input/keyboard/gpio_keys.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
2.39.5

