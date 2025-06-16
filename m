Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895EE3595A;
	Mon, 16 Jun 2025 05:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750053574; cv=none; b=PFfqLkdHEqf0Ng/pP+xjhbHzT80+JwZjc8h7/PlyOup+K9BYn4w1UwkowiFaerTst0f2fJPOuTKodtemwubkudsQUY3wRuw2qgrqVBtDyOte3DsDqKj/vU3r5JFddYxjQWlT4iscD/euV2EsEcBCuicOszV+qfMVeriigqCSJIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750053574; c=relaxed/simple;
	bh=zn33IrUM/tWWATil1wT/NEpCJynAT8CXNBbJ4+jat7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzMMxLdR6P3uVQQ3pAHQj+0Wd+Yu183em1F3N+HCK+nQEgDOawwHPBvCADGoOvqWmC4SD8ONewiebeg4+rV2bkdxT996AHvrk7i5KE6PNaA4Z1yXATq/vsIKbBqMUxdFGRF30e5pXrpPjnCe1jmufi/OVFJbTk9qVT8c2vd+NFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2GIYQmq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2GIYQmq"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54b10594812so4044784e87.1;
        Sun, 15 Jun 2025 22:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750053571; x=1750658371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYf/04Z2fZon29q7D3EZDuPp6iEeGkTJPrSyCprQpdA=;
        b=A2GIYQmqXkH1dKq4z2fVr0awYYvj7h41mab5gCUwGTs8nKu9EhoEdsx2hsnukDnwOJ
         NTtuQ3757lH6aNp/e2gyMtVfHAnSiwuKaT954aFd2Lf950vOd13w/eFSUFFapxKGCP93
         3jhntX2gknRk5mVK5c9RZsq7Bfg7BnBCo5eGONryWzdy8pG/odEVuyEqv8l/wMIcxrOR
         17iOtn7qu7Tc19XYUKxrjmzn2bM6R+fB8nMX+wyC4uVPSYcAmI+I3Te92mDSCI99zbgO
         aogxS82IkIAxc1Vnu/hkZDY4QjuGZBhl5DBI2CEN5MtzB/Q2d+LRsr8KcI9Act78dD9o
         5uoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750053571; x=1750658371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rYf/04Z2fZon29q7D3EZDuPp6iEeGkTJPrSyCprQpdA=;
        b=WCeqXGjrN4/dNg2/34zJL5rvDcd+l10ejovrEd7Iersz2w164EWhcz0K93QWsIwdH/
         1q+y45EQuSW/euc/uuzluQqdVp+ngzpb2P9lGyf5Ekiuxh72+k/PbtM7cLkKU1C0MDqA
         u6+pf2SfydwAk3wei2MoIqh0hOYCUJK89YBnYZSop9if8KpBSMdlek2FAO0h1tDPXz8s
         ZjSpE/oTzSOy0ofGz9RZ42nmGR0bB4MdAKbOiDHRNQ15ce+RycVgLJjA3LrinZL4gHmU
         C5SOmF33cApING9RuruHKBrc71U9tQAZsgpXlrzD4JNJHx5K/K8AFADLKB0VYLz6BM0k
         MrFg==
X-Forwarded-Encrypted: i=1; AJvYcCU4lcNepZwx2CDjJ8xfodacnXwsAYSOn7f8QnHdYAPF+KHzVTKS9zvEJrit8zR5OJczgZSAMn2rGFw9ATxlHyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywovkbjo8kxxAUkvtyJv/FmllIIushQvtj8hiYZus41IDxwLyb5
	59PWO9o+ProL9jP8Ybanlvm7YQo1sGLqA5MVJo03ENJP3zF7fRAau3+3
X-Gm-Gg: ASbGnctqTs/XpxujidnEq9SnyWgotBhHGfMyWhmP7otGILfbS2Z5JONMGi5OQ8w7yDC
	4FOMiKZKt1Q1qOt1tBf9mgSS3Q515vuEXAM6Uc4+wAwf/Qm8ZVOZeew5E9eKO8uPaIaeGXkXKms
	mgJHAk5EgNM0gmPs/aV6kL+Attf1O8RIMyYmDnWK8RrUpf27jwA2DOjTb7RplQ1r+mrV+hMpWO3
	W/RYzEdRxWmsiZKgWNJcy+1SmlDTEcRbw2IwI1yO7SEMPg1lE/zBJ5bqf1T1cYMHgnrQ6MzBFZ+
	zyg51BmSbvnhq2CP6qJZcirlDBiwd0B900v67X9u6QoCnP4yhXZEWr31L5qUpPGZE+sljSaCXM6
	HHuCSDxwKnzhTxtWHxzR2NuiTjRF584Zt2APILPWL/tWf7qUkIuVFQg==
X-Google-Smtp-Source: AGHT+IE1qKV3L3K0JNorK/++Ay+d386HItnzNzUgJ7RO7B7L6SuyolmRUKaru4aVa/mIovuAkIdExQ==
X-Received: by 2002:a05:6512:3d24:b0:550:e3de:63bc with SMTP id 2adb3069b0e04-553b6e8da9dmr2127132e87.25.1750053570418;
        Sun, 15 Jun 2025 22:59:30 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f793bsm1415202e87.228.2025.06.15.22.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 22:59:29 -0700 (PDT)
Message-ID: <5ff51253-d7fd-46c7-9cb9-b0af54120230@gmail.com>
Date: Mon, 16 Jun 2025 08:59:29 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: rohm-bd71828: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <d56bac346e94ac91df16a775c59092d1b60efabd.1750005148.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <d56bac346e94ac91df16a775c59092d1b60efabd.1750005148.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/06/2025 19:32, Christophe JAILLET wrote:
> Several structures are not modified in this driver. Constifying them moves
> some data to a read-only section, so increases overall security, especially
> when the structure holds some function pointers. This is the case for
> 'gpio_keys_platform_data' and 'mfd_cell'.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>    18161	  14112	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>    22897	   9376	    192	  32465	   7ed1	drivers/mfd/rohm-bd71828.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

