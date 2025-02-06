Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7312417EF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 23:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738884884; cv=none; b=mtp9UiQDEzEW6ER47+lWssdNq4ZsDrD2fKcOfRnXgUpqDXY/b9b850sZ/E/nFwnYUK8907ZlQpNMV47QMo2+rBdb5L0cbzE8bCAQYQ8270Rn2hmPJqwfIzvySSYpuxgjkqqskrgxwEyD1G0tkiQKBewv65rtj+gVM1b6Qjky/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738884884; c=relaxed/simple;
	bh=EbUMdgvorR9Y45d60hw9epGvThiZVxuTTNZF+zAxDtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bikYDuTm77Vsqwm7ldkXITKfv1weHiIq2TMWcXBhTh7JvY1jo4muUrXX7jvDN9FokFdiKMpNPEhYVH6gIKlV7SxtHn8+f0WeHJ8MtVCTpaNU94MJBSVCo8Gak73/t9HZiwKf0UjMiOJ9qi8vXdAnmjHXHOCjEio3gB8IESAwIKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=0+/5b3HU; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="0+/5b3HU"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yptjt2VtXzlgTwF;
	Thu,  6 Feb 2025 23:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738884877; x=1741476878; bh=gDqcRbajBXNUhJzKy+MhQg52
	hU63NIMtdNn4A+JKJPQ=; b=0+/5b3HURKt+DxUFZY7rMGZ7RZr70G1HZWUI9jVr
	FLad07ft6+IXJdefrq4/zVfZdnXknAh7gZ8l0Y+SnYMyg3SgtAHkEbxGuJ3UVetn
	CouhBRu4rpHquUMn9geRVDKc3k96fKQHVhqX1gr/wuLX/eCOP1UQEa4JZsjPKXif
	LP6ENXK3ANVT6Ko/o26Bkgb3EwnkeRpNoc4egsCKLm6YrNT726aEqmjJD7IFBpVB
	L2B6f/clNSKuheGNfJg+31hCAYEoRHdXwg05NSOU/SfeWsguT6Rsp7LDSXU3abSY
	5RjcOqeQ0DKMYRAz+KMF34lcOz20Y2ZyzPmGwLSlfZZ4OA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id WjaCIt_rKOxI; Thu,  6 Feb 2025 23:34:37 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yptjh0jD3zlgTw4;
	Thu,  6 Feb 2025 23:34:31 +0000 (UTC)
Message-ID: <7304c187-d80c-44dd-bbaf-4de1555a8278@acm.org>
Date: Thu, 6 Feb 2025 15:34:29 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 29/33] hwmon: (it87) Check the it87_lock() return
 value
To: Guenter Roeck <linux@roeck-us.net>, Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Frank Crawford <frank@crawford.emu.id.au>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-30-bvanassche@acm.org>
 <9f0cdbde-957c-44a6-a7ce-d3d412ecfbb4@roeck-us.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <9f0cdbde-957c-44a6-a7ce-d3d412ecfbb4@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2/6/25 2:51 PM, Guenter Roeck wrote:
> On 2/6/25 09:51, Bart Van Assche wrote:
>> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
>> index e233aafa8856..8e3935089fca 100644
>> --- a/drivers/hwmon/it87.c
>> +++ b/drivers/hwmon/it87.c
>> @@ -3593,7 +3593,9 @@ static int it87_resume(struct device *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it87_resume_sio(pdev);
>> -=C2=A0=C2=A0=C2=A0 it87_lock(data);
>> +=C2=A0=C2=A0=C2=A0 int err =3D it87_lock(data);
>=20
> I am not going to accept patches with inline variable declarations
> if the patch is fixing an earlier problem, sorry. This only results
> in unnecessary backport failures.

Hi Guenter,

Is this perhaps how you want me to format this patch?

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8856..5cfb98a0512f 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3590,10 +3590,13 @@ static int it87_resume(struct device *dev)
  {
         struct platform_device *pdev =3D to_platform_device(dev);
         struct it87_data *data =3D dev_get_drvdata(dev);
+       int err;

         it87_resume_sio(pdev);

-       it87_lock(data);
+       err =3D it87_lock(data);
+       if (err)
+               return err;

         it87_check_pwm(dev);
         it87_check_limit_regs(data);

Thanks,

Bart.
