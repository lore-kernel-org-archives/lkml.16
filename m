Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1617D1FC10E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745440076; cv=none; b=D+1LX6gXqof7qCyS61ahn3nnS57D0WsRK5T5VkPriIhWFsHH3bIRvZqYe+RQ2/YUQQUg4UKTjRWT0fp/1NgAh2HomyilPjQbkw4bNBtHpqiR/v9jxplEiEkJfbWilUzhyhjjsqA84tw3lGrH/wphrs0nEpTkXAkkjuvUGOJG18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745440076; c=relaxed/simple;
	bh=guGqrLyF/UfkIOG7hzSkbW1E0cva2VFPvrXecL0SQt8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PWOsyfk+T8yg4RmO5tcWYpTBT4KujWyWdI/2uUhryTOP0qm8e3Xmo72p+jR83xdW/UsScJcjiH5g+NY8mrPyKNiBoXJt8/1v82NS/Le3YCbkojNCuTRXm40PCVHjfnprthpmI5DowAkZa4GBxFosqXqd+984DrTzfKQzlmch8Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=y6cC8Mwn; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=picldoR9; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="y6cC8Mwn";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="picldoR9"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id A6D19209655C;
	Thu, 24 Apr 2025 05:20:20 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1745439620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HV8lXwcdIJI2t6jVsYzsmLu181G/eR1BqpBO9hmuwFg=;
	b=y6cC8MwnLEMlYxKn2xb1//B1skbOcjfCUcizUY8Mm103UimeTQwfnIIbvTkv3H8g5mkjW8
	92ZxY5OYKuVlVCVuyfzoGDmg3StQy72SPSIlQb71/l3zWO5q1iTxSOrE0KP6Vt0a8pMMu7
	q+6NXZWcDMIB/pEwI7/0pNGatdyw2YyogLYch2XxkBXWmgsQrb1DDOhZat1b5x4sbZVIVI
	RHzy7YfbQX2Wy568r/xWpm6CDImu9UBjv7v9Ox3HjsWASDSWzYKve8qGKsZmuE7u+17P2P
	7XKcQKqodqNt0HGAfIpHI0l1XH3mGxYDIV+8ncKsSM7X3StNH0qTtzjLag93dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1745439620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HV8lXwcdIJI2t6jVsYzsmLu181G/eR1BqpBO9hmuwFg=;
	b=picldoR9oqAr/UqMgs28TfAybJnkNFe9k+hoin+j6DqspqtpwXy2Ztagnsf4/0ASrKgRtw
	Mq9AaFPxpHIRtTCg==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 53NKKJFj149017
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 05:20:20 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 53NKKJsl347945
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 05:20:19 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 53NKKJLD347944;
	Thu, 24 Apr 2025 05:20:19 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: "now4yreal" <now4yreal@foxmail.com>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>
Subject: Re: [Bug Report] warning in FAT filesystem
In-Reply-To: <tencent_C03A9DA8102E348E06CBA9C15201F369BB06@qq.com>
References: <tencent_C03A9DA8102E348E06CBA9C15201F369BB06@qq.com>
Date: Thu, 24 Apr 2025 05:20:19 +0900
Message-ID: <87y0vqhbp8.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp

"now4yreal" <now4yreal@foxmail.com> writes:

> Although I understand that errors caused by maliciously crafted file
> systems may not be within your scope of consideration, please consider
> whether such validation might indeed lead to any other chain
> reactions? Please feel free to reach out if you need any clarification
> or would like additional information.
>
> I’ve attached the POC (written in C) for your convenience ― it can be
> compiled directly with `gcc`.

Yes, corrupted image can be the cause of fatal error. Can you real
reproducible program instead of stress test?  If it can be prevented
easily, we would be able to add the check.

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
