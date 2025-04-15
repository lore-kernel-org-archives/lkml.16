Received: from out.smtpout.orange.fr (out-69.smtpout.orange.fr [193.252.22.69])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2E4253357
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753121; cv=none; b=X/BS3bmAkXdMGdm9I/7tu1GHUU4LdQwNhnv14y8JLZbxD0zwkHVwLfF6/sDPFteq3Coe7aTid6r7aN2/Tz/H8RqIJI10qlRviVju6ZSh+TFIXmchcdqhROt07yCuyys3ViUwMl1nwnA9BiEsFw/V70d7pp/96sr6LzynTI+FOl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753121; c=relaxed/simple;
	bh=KEjpH6K4beiX4kzBU0PiyfFgLQaGcqKvhB3JcTndIyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIJD5xhvNfvdY02/K7c1MU5neF+C2tLkGQ9ESPW6PWqaGUvjlUP9bjM4keyJZkL8OD8DtodFHsezjk5HdXIkLla0XV8TiUmc6Q+0zIezLFC2qEd6KYsgclMi3oZ+ww59TmPmWXWocueb8EsHKjqVrC0PN82sDn4vXn8XbSQ7dEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=epyyFUuW; arc=none smtp.client-ip=193.252.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="epyyFUuW"
Received: from [10.40.167.8] ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 4nz7uPdybGpxt4nzBuC1v0; Tue, 15 Apr 2025 23:38:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744753111;
	bh=MuU4j0+RDCwQ9LpPHIrzB3BCLtEN83h9y/gwzJFlLt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=epyyFUuWnqbc3kUsyL4zmzv6mrYSy0hKziynd/50KVAbGX+iSw5WqDWJN7KqSbOYt
	 O+DjjGJZsw+XTXK5lcE2AxD2J2UGNXXXO7cUcO00TBaLO/X+VZ4IeIvfp3Km+MMhVQ
	 JB+sEdx17eRnOb9sf9ZldVbQwBQ8pVtRBmG99GT4AvBQn1EBQpB7mNwaAXfUa5kSg9
	 q0D5aidwQUV1/tUjgMpuGsB0ITEtkTqwI4XFLNyYeeAlRi/ElB+INdF2GqKRP2eE4v
	 wq/iv0zuUMUuMq0SS89e+2WnCNhSymH6YxwLtqO7vAhPHIFhPYgByEcS03H5EzgQpO
	 OzZZHOUDz+sxQ==
X-ME-Helo: [10.40.167.8]
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Tue, 15 Apr 2025 23:38:31 +0200
X-ME-IP: 130.166.192.226
Message-ID: <384d030e-e213-4fb3-83fb-cc0d5cb77cf0@orange.fr>
Date: Tue, 15 Apr 2025 14:38:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] staging: gpib: fixes multiline comments style
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1744438358.git.paul.retourne@orange.fr>
 <2025041546-outlet-timid-bca6@gregkh>
Content-Language: en-US, fr
From: Paul Retourne <paul.retourne@orange.fr>
In-Reply-To: <2025041546-outlet-timid-bca6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/25 07:50, Greg KH wrote:
> On Fri, Apr 11, 2025 at 11:21:52PM -0700, Paul Retourné wrote:
>> Fixes the style of multiline comments to comply with the linux kernel
>> coding style as requested in the gpib TODO file.
>>
>> Paul Retourné (16):
>>    staging: gpib: agilent_82357a: fixes multiline comments style
>>    staging: gpib: cb7210: fixes multiline comments style
>>    staging: gpib: common: fixes multiline comments style
>>    staging: gpib: eastwood: fixes multiline comments style
>>    staging: gpib: fmh_gpib: fixes multiline comments style
>>    staging: gpib: gpio: fixes multiline comments style
>>    staging: gpib: hp_82335: fixes multiline comments style
>>    staging: gpib: hp_82341: fixes multiline comments style
>>    staging: gpib: include: fixes multiline comments style
>>    staging: gpib: ines: fixes multiline comments style
>>    staging: gpib: lpvo_usb_gpib: fixes multiline comments style
>>    staging: gpib: nec7210: fixes multiline comments style
>>    staging: gpib: ni_usb: fixes multiline comments style
>>    staging: gpib: pc2: fixes multiline comments style
>>    staging: gpib: tms9914: fixes multiline comments style
>>    staging: gpib: tnt4882: fixes multiline comments style
> One of these did not apply to my tree, can you rebase and resend the
> remaining one?
>
> thanks,
>
> greg k-h

Will do, thank you for looking at it,

Paul Retourné

