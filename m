Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0288B1C5F30
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748405359; cv=none; b=kbAa85UFIZatC5IAC+mmGsVphJ/apBGl0ZUiRgz26a5CFpVcW2m2Vle/EO4Iy5FFK3fs9PnC0EXuq6wk6YZ3eE+zOdAu/DT23NFPsmehrbJyO/qv0pKR18FUOVZuOfH32DIcrsdsjRgJpPN2mNA4c9OrY5H1qPviVQLzGDyDnb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748405359; c=relaxed/simple;
	bh=hlkY2UnwS2X9PoR6gQ2SIXXXnrL2PXxoo85bg6yIUbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhWmDmOF0l1Co7ic8wBLQN6UCQA99DBLaqztid30YF228/t0yzfwpyF958LmEtUw9CxsyM76mouzej18FsipUHql9QkdMqf3rRH273AQBTPeqvzMW2TocFkvVQT388yx8Io0bUJtINj/mG8+iqMWtytQQXTSTmZwxUjfvvXfJlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chenxiaosong.com; spf=pass smtp.mailfrom=chenxiaosong.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chenxiaosong.com
X-QQ-mid: esmtpsz19t1748405343t0434c731
X-QQ-Originating-IP: NwjThKqgRnNipc/Nq5ZYdlUS87D/gsFjAfql9alCxk0=
Received: from [192.168.3.231] ( [116.128.244.171])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 May 2025 12:09:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12572820072714361507
Message-ID: <01BDDAE323133ED0+e7d23f35-c6d8-48a3-8fe6-c23e3a9c64dc@chenxiaosong.com>
Date: Wed, 28 May 2025 12:09:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb/client: use sock_create_kern() in
 generic_ip_connect()
To: Steve French <smfrench@gmail.com>, Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: pc@manguebit.com, ronniesahlberg@gmail.com, sprasad@microsoft.com,
 tom@talpey.com, bharathsm@microsoft.com, linux-cifs@vger.kernel.org,
 linux-kernel@vger.kernel.org, ChenXiaoSong <chenxiaosong@kylinos.cn>,
 David Laight <david.laight.linux@gmail.com>,
 Wang Zhaolong <wangzhaolong1@huawei.com>, Enzo Matsumiya <ematsumiya@suse.de>
References: <20250528031531.171356-1-chenxiaosong@chenxiaosong.com>
 <CAH2r5mtAYV925FbL-5GPGvk3wMG5u0027_icNtUw6uZ9yOBqyw@mail.gmail.com>
From: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
In-Reply-To: <CAH2r5mtAYV925FbL-5GPGvk3wMG5u0027_icNtUw6uZ9yOBqyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chenxiaosong.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MprdIpiwXvQIxjQnEQPCDYWZX+Vl58IqfBnwyubUw/SEHUdGliI0RIwg
	QaKPv6zKwaQHfaYs79BwwmCHWzLOUB8ZWb1FfanDifxZxJ0CH+8xFfRKL+4IgV3xVt60i+0
	qKEA7299SCh2JMyfmYXpu72Pc4eq0nbgXyQNtO7pL5kxVCF1ME+goWS2XJ4cUXQ3yTXQOEf
	pOV4S0o90SYnZCLehZGclus+Q7I5Khea6XXOi4ETujwwzssNbsTMWbkxuSiOvx1+CR8Swmo
	gPsqTDiqn8b06ehROCpYaHGk1VeBoTzDMKI+AnZ+ZUiGIDChh95LG0j9hPE98+DNUyu7u6A
	pccxc8aarIDO9E2LMJ2SOh2Q6iGJuODBF3kk2c5o8EtTKtjC5hMVQ357vCbO7/XuA0I4ou2
	MAHWohXe9fMjs4L8/HR6A7+H+L17G1FvhKH78rdtyUij8xQ0LXt9qprGHlEFvwAr/GeWN7u
	doUSo/2PPdyiOUz0BY7q9YWi/DnI9pSVawesYIXys6eRLQ9SMGKNzZ7VUwOvmDXUlsG6M8f
	ixKwALhYtMEDK+Q+4pNxm0P1hOHlfKECqbujI7gBK5zH4AOwhDqbsQtIQiQ6eas95kkSBVK
	eQ8Ur/8HLsAsPDMPP63wVPpyMt7gavOd2CCJx7zfVhnwIZtPNwcHPOb9wsh7iJk7axlgVV8
	2ISOX/1X3jXfO/QQhwv1IUPMzioKBgektQbWLm2x66X8CML54ep9oCbeWSERvXlPIXVIBSK
	ZNLgDQNKjI1g3q27TH+1uMglMZ5aBoJhp9I0pX8zA541RrrYj1963X0W0H7yZdxZVyskuI8
	y6iPVI1tiXGEYHCGqtMza7ulOaf7xsfrZNlLtSD6qgjvMG+z8qSV6mmRTLehn+MaEHy+emO
	jCEiKtJpU5Lh+lU27ofCKQkA6sk82wf/dCjIo65b0Nkb9/tsKVL07uhYmwOf1arsZNTMoyy
	9Nx3IG2AJDG8ZJnWdwBTgHuQZ4V/mIfen/7xHIvYjLBOoCLBOZBcAOjvaSUz0KM1Yj3M=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

This patch is simply a cleanup that wraps the original code for 
explicitness, the last argument of __sock_create(..., 1) specifies that 
the socket is created in kernel space.

在 2025/5/28 11:39, Steve French 写道:
> Weren't there issues brought up earlier with using sock_create_kern
> due to network namespaces and refcounts?
> 
> On Tue, May 27, 2025 at 10:18 PM <chenxiaosong@chenxiaosong.com> wrote:
>>
>> From: ChenXiaoSong <chenxiaosong@kylinos.cn>
>>
>> Change __sock_create() to sock_create_kern() for explicitness.
>>
>> Signed-off-by: ChenXiaoSong <chenxiaosong@kylinos.cn>
>> ---
>>   fs/smb/client/connect.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
>> index 6bf04d9a5491..3275f2ff84cb 100644
>> --- a/fs/smb/client/connect.c
>> +++ b/fs/smb/client/connect.c
>> @@ -3350,8 +3350,7 @@ generic_ip_connect(struct TCP_Server_Info *server)
>>                  struct net *net = cifs_net_ns(server);
>>                  struct sock *sk;
>>
>> -               rc = __sock_create(net, sfamily, SOCK_STREAM,
>> -                                  IPPROTO_TCP, &server->ssocket, 1);
>> +               rc = sock_create_kern(net, sfamily, SOCK_STREAM, IPPROTO_TCP, &server->ssocket);
>>                  if (rc < 0) {
>>                          cifs_server_dbg(VFS, "Error %d creating socket\n", rc);
>>                          return rc;
>> --
>> 2.34.1
>>
>>
> 
> 


