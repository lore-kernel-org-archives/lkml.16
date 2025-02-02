Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF8C1F8F11
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738506025; cv=none; b=F7cBOh4R7qNF0PsF/IeyokuHEsgktyk750Ci8n9kqGEyICOUq20xodHPx9g5C+JStMHE9b0MJLlp/pXtnAeZMaghfDAuRMAM9EDtX90i6MTsDIUm3wW4X2lf4N8qsXR4ioF5AuZ2H0DRbV2wDIwrzlrLn9NLLVRtoZryGZ1Lt8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738506025; c=relaxed/simple;
	bh=RbPhGJwF4Wwp0v+AfTksRjJ9Zp8pwdmy39xWhzS1nDw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=K4Lrsf1PK7WJhVxgoZr9klprSHm0XHbeMM7rAWwHnVXYPQuPsHhh5j1y78kvLLriF8nBUtoQ12ltE4UuebvurWaSmvsjFt0zH9YtcUyOcnyhhB22HG6ay9j4HGPa/kxvdeDV2ZKE3J7ejGDhtf+abARXqHcjjMyVIS+AZBy2uFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=XJc3gy0x; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="XJc3gy0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738506016; x=1739110816; i=markus.elfring@web.de;
	bh=RbPhGJwF4Wwp0v+AfTksRjJ9Zp8pwdmy39xWhzS1nDw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XJc3gy0x1oHz7xgkOPrcixE1/DjP+DBSL3v6MpeeAUrNCgZddpBvufSiZoZ2XesI
	 oaTAa7yAWM3Y3JJ2FmsGm9IMpC2jeGBrpCsv/iE4XNoh9zfAV18TtpGqTWKmZHJ7u
	 xBde3U3rW8Fqh+uHDtrEG9fJsScCJar9Q9hORbBbJ9HgQrEcoiUwFiqLb+p1IDscR
	 ymhdeDx9SJIuncX6yVcA5fYN5LhHhjnuYZPeNLjglXMPJ2eHcFFMMcVdeN+3ouo9A
	 fhMcTGW5xtploLg4kqBIurlAJTEjHraFYvh725vkZj85ctYW1ia6TURxAJJu4Ycmw
	 kQrKKdnIw8M9BzcZ2w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.26]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOQy-1towig0MKg-00PzWo; Sun, 02
 Feb 2025 15:20:16 +0100
Message-ID: <882d065c-f225-4cab-87e5-3b31e26430da@web.de>
Date: Sun, 2 Feb 2025 15:20:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kohei Enju <enjuk@amazon.com>, linux-f2fs-devel@lists.sourceforge.net,
 Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Kohei Enju <kohei.enju@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <20250202043253.64389-1-enjuk@amazon.com>
Subject: Re: [PATCH] f2fs: remove unnecessary null checking
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250202043253.64389-1-enjuk@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FzmkixICOcVvhFg4/ubSrQK7qkxW/j3w039Ad0hBoGosCJ1WBhj
 LG+BtswMBtPcWHd16jbk0s2gcccj7hLmin5Nbc2c4EcOemvLptDufATgMyVVk7FCRbjMkn4
 AXXpk0NTj5PUJD1nFYAZ+O91Ow9+1gUlbh5sSnkd3ON9nVuYztUinOQzaLnmH6qXkDzVrd1
 Qw+Ti6Epa7m0Xo+oKjfcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L5zLA/ikus8=;rzUB+AM7NwFxRy/JXF04ufXYdhC
 VA9jLQb344SQcaCdTLW5IoShouyxYSeXGf+09ywauzhTIS08xeG7pmEYiMM7BM+L9uhXUXz1s
 yeILzVwWZiP9/zBxcPm6vDP/5f6AsMJWbkZK3Dnv3Yj3hRS+VxSlBbWuSRqWj8uWNjj05AcIL
 mw0Tj4QbXUP28Qa0Vh0h6HUVH+B4QWjRNaE+mQXjl98ILyFf3v6M4JuoEV1GtzhUvsuiJrWzb
 VJDOQ4IMvcBIZLJOqrnmuCW0gzeQtTCs9ELVr8BO8/2iFCoq6Qch9wnQk6Tj7/DMuqu6HFTMb
 9UAjkBnwQJ9GLWbL9vd9/zUX6Tlw2AJPb8vFsH9EsjoPsint/WzKgqyL98+PLm4suHZMU3z3j
 ZkVlJlCc1bZyoD0d1gHYTikp5apq1X1m2bkcYbyyHS/4vFDM7nXcDVoAMjFHp+JlrzEM+jq8J
 o6PGsBNAQMP7dWBMDxZk/v+2KL4fMI8l3CWFMjTrIJfp8UouPbDlrzBPqeAnRDGhXjqrKtwzg
 VK8lUxxysMhVnpnVWjChE8IHEZ/82c/a5whp+8YCkcYif0MN4ruv7PGiHIDz3lq8QkSe6rcUJ
 rK+PZw7LAMCNIm4s8GmfgJfZOxJwzoLyRJp2kw18PvCxWy+cUbJe1ecRvNd4Dz+ufdFtSOSRB
 kImEKYc8y2vj/AvxzSrBIfYouGEIwFq++ws36XliVK6bGeI0ySNys/YB83MNbY0i2XhZJ3joE
 wy+2bE2Lgy9MK91AdORj6jszdrTOxxk/Uh8Il3OREYcGsx71lri5lOde+Mhd6vvLUuZieZQ+H
 A3cVE2npTdxgA7cPiWjjgxFq3ELKy0AZvyLLaWAD2YATXQf1nrEyMOqaMmDIlYSDxhx9xWcXl
 7me/LRcvl1Hyn/Ea3xfYX1qfXkxQ7SS4+dueGlhr5OuZlWtroaKSY3JPlKa9g9ZVJRPVySj1k
 iuMv5goOMCgIaDwv44bIopDEhBVvXiyIg6Yl002nQWwD432dMlPxZ3hnufvleGYriTd4EELZX
 ZPbMPFkidi4xwD1VZtP+wyxwOpY8rbU9m88CVrep6p/0m49p1IoTawZOaC/quluue+MOt9jGx
 luhdP+iatA0P/1Eaop2iJ+Z2gn10742BP771V30QTJuAXIvq1UQk/3B/ymafhLgDIvQ9pyeXw
 cREevGKveYq/kKa+1rFed/2wPrL6gLNrT8JxgkCbD8YKx8O4qswtNBBzQ/enEMswxK5bHP3zM
 jVGPlQ/Un94kI+p4WxdwSYdyqTCHEyElpYa2HW/sgn0CLTGxPVo/X3TYPEqVOWFocPc7eY1ku
 1/q+bzFRHsNociGGY0Ym8JRO662cGZKScrEr1tDXZYZPZL20ZHEzhn3aJzs/9GWn3MC

=E2=80=A6
> f2fs_bio_alloc() with bio_alloc_bioset(), but null checking after
> bio_alloc_bioset() was still left.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.13#n94

Regards,
Markus
