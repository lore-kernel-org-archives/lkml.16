Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3965C156677
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292689; cv=none; b=P8hksXjHmhGnhpV++jApTPkPIbFcYM7KEzTjA3NmT+vhX8uOH3K5YeM6hc6d9BpFDc/J4f1Bk4wMc9Y9lxDZ+MdK04P6ep2MPqVM9ujuklVVdPNGdfuDExNVyE/FW4bGv9Wt37K+6R3SVjeoB10fL5XrBQrDcOLfOGAgLACqpRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292689; c=relaxed/simple;
	bh=0o32D+mJgEwqn7CLnCXF76Z69iTOivOpf3nyI9ee4LU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PJZyv130m71JRtGrdSmk4JIIXFuNUSu0HiUHvrOvaPp/mA7qdl8Xl75yahcL5KHdSe/hYS8EsVTu/Whuy9VEbZQvT2xd5fFA/mY+1pQbDHXL1SXv07bpZMN7lHjCaC7QYO9/NKvE9qoKwtGpERFi2yEtQyEFUfrLfAKDNFW6awI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=6LaYvP1i; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=2hgdRPvs; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="6LaYvP1i";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="2hgdRPvs"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id CE4C120A0179;
	Thu, 10 Apr 2025 22:44:42 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1744292683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7bpeTNNt9TO4DEeF8FNsRjjxlVf0cuSk9NjS8Ny8n8s=;
	b=6LaYvP1iKdIM6h/7cu80lTKzoWsvsgG0wsfHGpxrtFv8AbdIRoJ6WG9IVZZHejenhhl2HM
	euwDGzhCEzu5Qyiu7e0hLalSHpeCkFk4szR1R9YjLTe49A8ptJU0Q+YiLu7ABjUb9SRV6B
	RKI1ZEsN8g4F26Ym/77w96DiXw/b6wMC4ORhYJWSjpwKrPM+O8Ef2VC9CuRKhpvR63CzGX
	x0OyXEPOuMG3Py3NkrJCrTnlasMMz4t1JmNzGZMIulexdo6NEKT5DOPSMmkU6WnVguCRJC
	LaADuM5GeMSOrnhCLafp0XgeCac4abpV3PcrUKi8QILevWq9QLwcU33tPP0/Mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1744292683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7bpeTNNt9TO4DEeF8FNsRjjxlVf0cuSk9NjS8Ny8n8s=;
	b=2hgdRPvssMzswKC3qI6ss6Hrb1k03ofA9Lw5l0oV+iJ3KMO7/YV4EvkLXQTKipAmgs/hBa
	Vvk0KdtRijtU7aBA==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 53ADifKf568463
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 22:44:42 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 53ADif4b1480534
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 22:44:41 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 53ADifuw1480533;
	Thu, 10 Apr 2025 22:44:41 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: zhoumin <teczm@foxmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fat: Optimized FAT bad char check
In-Reply-To: <tencent_4E3BCCDC793A514260932AA16BC5910F400A@qq.com>
References: <87ecy16ub9.fsf@mail.parknet.co.jp>
	<tencent_4E3BCCDC793A514260932AA16BC5910F400A@qq.com>
Date: Thu, 10 Apr 2025 22:44:41 +0900
Message-ID: <874iyw6shi.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp

zhoumin <teczm@foxmail.com> writes:

> Hi Hirofumi
>
>> Why do you need this change?
>
> I encountered an issue while working on our own bootloader. The problem
> occurs when short file names start with `0`. In this case, our bootloader
> mistakenly interprets it as the end of the directory entry, causing all
> subsequent files in the directory to become invisible.

It is normal behavior of Windows.

> While comparing our bootloader with the kernel, I found this bad char check
> function. Treating the `0x05` deleted flag as a bad character may
> potentially disrupt the parsing chain for subsequent files.
>
> In my opinion, adding this judgment aligns with the spec and should not
> introduce any negative side effects, even though I haven’t encountered this
> situation in practice.

What specific case are you saying?  This path is checking the user
input, isn't it? Why do you allow to create that filename includes 0 or 5?

Looks like you are overlooking something.

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
