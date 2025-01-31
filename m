Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636661E5701
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339605; cv=none; b=lwT06eLrsois5v2fhx9t28sd+DewPWrHTUd7J+nWSS/ZdFcCireIe1qCCauli+Yea4ZGMBNMQy0UqGaZoscvT2KgOiVRPDk+eum0F/9lRkchl8rEUOKCnmC6KRG4X9DqaocA9A3aCRyp2AKtJ4wQpCaUja28vDeUgk2yEgKp8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339605; c=relaxed/simple;
	bh=hRIVp+cL4XxW29ZAqFMnln2+nVpYtoyLwER1QQhq2is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbPACGstTpYc0KFV/pr7iLSf+XKTBdMbXuxhWkrscv2bNpvR2UWW7T9waoFRGzdhbdRU3syrE9mXbQYPsedZNRqSKbSu6ltDB35LImAsWAOMPxKJwp54KmJ0mmu9O79osGyXuuonyzffUm9sJAR35EcTs6y8Rd8r4JAIgaG032I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xq4GmroH; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq4GmroH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dc149e14fcso3914153a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738339602; x=1738944402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YgyzgrEYtRzCWvWQhTVXumGCprp707y7h1uWIUD4EY=;
        b=Xq4GmroHENxJnsel2wI3PjO0dm7oZkWKPyqqPR7Fks5vctFDXL8btJ3xsK478C5X3w
         WgYRL1PQAZz+d+avAjGUMQILTx/MfAuC2nwRKu1Qatkk3/uBFBMR+mEbGPDMPLg5ABq7
         TG/2oNgwsZ/GZInOdhGTAZ9Fon0B7s2QSWMmcSTZxQn3W0+VFoEshlNF9ytFhW2cGDdF
         8xiRU0WBarkcCNj3zOK/4igwoowPFi7xD9W5sl+S20CJB2CmL3ilK/cBJrNbWg0nFPkj
         jL0s7tD0Gz/HyTlvn/CTUMQfZdRhJrOLOle/4L+BbZYXjLur81GGmH7VpYpX/vnCz5Rl
         k0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738339602; x=1738944402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YgyzgrEYtRzCWvWQhTVXumGCprp707y7h1uWIUD4EY=;
        b=U9Q8JcOj2Q+SMOCSNKZKYx+uCmy5h7tZuHdv1icyoaAi07Qb8P8rY73MAiMb5+2F4Q
         Z1camJlZDVdQ8b8etmEENAeiIn+f3mrZHQILd5vDGdVOn1BaEubeQY5a1Lcb6xB0xz78
         GR8Zozu0NbqGGJrZx7DgclgEUY3qaMDgL9AafZACRVjJ1nJJxfQxv8jDwCTPF5I6biiq
         XukFUCbHW+a+QDATDEwORdEwZ0o8BPCvorTa9xyULC5eNUFcZ4nSHrBApkNGzDR/8EdH
         u0nOB/5i4AcZ5K0PjEF+7N85uTVnK4cYLNP3CkLWVO5vtkZRCjURWwe4wbZbsooDCGIS
         eL5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWGy4fx8bbe3jrX5tVBpn2dtRunXrrmQI89pBjdZ76W386LkWIM4ttSQnj4I48+oaXmKKRUFTdposKNtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwDBVWZdBjDNfk1nwOms1Kn+cusMdv0w3KIQ9pnCh5Sy0BV5dm
	9uBkElC1aHl2dwNn3Q3SzCH19I/u9d+wb2nH5YqFpiuvr7Er0eaf
X-Gm-Gg: ASbGncva1uWUHNkxRkxez3FeVpD+DHntktlwCaQGC9dLQLlfqVJdTQ0dEK0clfAsAZO
	XP4PG1ThQkwLHuuo+luEnAYIfHwqac7X7S4NulPsFFjWFZtxtkAuCxekuqwwk/X4hpUjCvAo3PE
	nUZedv+kGMUtJtau4Ns33z6IrxYlAYgoK01hBUpgC7gDPTFYyHxlwo5JxHjSuYDa5hPJ3X0CkmV
	eitsG3qs4bTiUP0+uZUUxi4mqEAF3xRTZU81bGXDuEWLjuiuqbH8D8TwGcuCZjd6yhDMW8tMhVK
	jlxQJqhc7Qkx5Y8RX7SHzkcoG+lUe1/tSttq0Lk11AhJLNpx
X-Google-Smtp-Source: AGHT+IEIpvwUl+CGjLcC8gL1VCnuxjD8zNu+Qqw+nzfZmMYLVsKhbKVmI5H1Me1LZHabUDWILgXn5Q==
X-Received: by 2002:a17:907:7b89:b0:ab6:c4e0:2d18 with SMTP id a640c23a62f3a-ab6cfcc9f9amr1161848266b.16.1738339600869;
        Fri, 31 Jan 2025 08:06:40 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:7071])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47f205bsm317611366b.86.2025.01.31.08.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:06:40 -0800 (PST)
Message-ID: <94e650e0-fad7-4929-877a-560700cd12ce@gmail.com>
Date: Fri, 31 Jan 2025 16:06:55 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] lib/iov_iter: fix import_iovec_ubuf iovec management
To: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Andrew Morton <akpm@linux-foundation.org>
References: <378ae26923ffc20fd5e41b4360d673bf47b1775b.1738332461.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <378ae26923ffc20fd5e41b4360d673bf47b1775b.1738332461.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/25 14:13, Pavel Begunkov wrote:
> import_iovec() says that it should always be fine to kfree the iovec
> returned in @iovp regardless of the error code. __import_iovec_ubuf()
> never reallocates it and thus should clear the pointer even in cases
> when copy_iovec_*() fail.

To be fair, all callers I checked don't look at the returned iovec
if import_iovec*() fails, but I didn't track down all of them.

-- 
Pavel Begunkov

