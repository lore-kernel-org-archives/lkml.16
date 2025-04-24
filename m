Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E948C11
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453922; cv=none; b=O7hgjyk5OqqXWGVNDP5DW8NLG5YlgtOReoqvaqgKq0CcQT2r6iK4pkQTU/1Ge+KTpnz5+Rm7A+zjgQF9v1uZ5RUoXdOpnW48jWCYzJRuc+auJnTGU9FhpOJUKoDFQOwbfmEUIEfPoOQcD11qL/NZsMCI5zjvw5TbsZ6YnF71vuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453922; c=relaxed/simple;
	bh=DXH1IO1hAdU2AUtjl6a4PRgTHigbz0MdgoHTabtuTrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+75PlGoB/cuHo7xZmu4ROSu2IqH700GN1stDoFMbYWbOJmcLPbOOjHYWn2xLLxQP1ksXAKzwY2owPfx1LVGaNoOYix7qkG++a9VLa1XSpP0PYnZEI9LS2ZcleeOOJSUZvo+AbTS3xwNPkN3uNLG0qBZnJb8iK+jlkBBS50O0Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=d87D02gG; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="d87D02gG"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d5e2606a1bso3909545ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745453919; x=1746058719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=no699vHbUtCiDhtLMFa9ixz998D4Np4s8xMtsBpgtGE=;
        b=d87D02gGa/UZORutiv03V45T81hXnmmU+G3VpRlz9SjGV6rGeWbrPDPntpPLFihWPZ
         M9IfOkMlSenOm+fU53pdMJyWhBHTU7BWD+6UA88n4peLvi2fQDzWtZTuBwDYiRl/ejDQ
         Shp8YKMciKEDOvCiK/uMKf1GLqzt1LOG+yLZUijtwh3m5aBBV//RvPhmrlr0yG8fvbsa
         zmd1Pa+go8j4OIFHJ4pW9rylm+9ZZLERQ0QhxYB3sT1/YEnaonDPVEwuFHaE7u4vorwW
         4+/Tcs17BSq52Au8eSDu1pa098/AQ1IfXTaUUBEAaw36KRoQVoz3C54DBNLyxfczmYKs
         E25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745453919; x=1746058719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=no699vHbUtCiDhtLMFa9ixz998D4Np4s8xMtsBpgtGE=;
        b=cSx8k67PsuOilcMkW0YO1P0tPACLrEX9eGyj6UuHAhsHjTGW2CLXbgB7FM+4A1J7HG
         WzlcH4+1cbnO9SvpT3TelVt9J2wG54+GgQ2awz2MzBB/zODQeTfKUA52t1VMzqC9MpVX
         eASMHnn+yZsltCGhp9UhszQfKdNTNiQOFzPX+ZkBdARS41GTmeN9KO6Kqo3eC5uMsWHQ
         n+ikd2qEfhcwxmXsh8L+Nt47kEHJvEDVUtMPDtgn2dagsdW0XbGNWwuP5dBHUOCiedmn
         0GdNzxByH2kv9PNdyZX0jrKjviSOWo/s/LGW3VJ3eH/BHi+dCzWr005fRAP0uheO5veZ
         +pRw==
X-Forwarded-Encrypted: i=1; AJvYcCWJCJLj8nWUsTftZUrpg4pEhBVS1PLPUFoLR8hXPqk+3/1PsyA86Zhil3jswXkgpP4wo3+AfhVdyyDuG1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDx+HkIAhzCnuMllpKO/cOJWkEOohl40G5AmisT96XGwQKZuQ
	DVUZeJrn/CgwrcEHxHhnOlYcIh8WYxNL0K3bDhftFwzDGh3d02598mpG7oRl20Q=
X-Gm-Gg: ASbGnctNkOdSWggfz2np/9VvtjgoBISXHBgHOvzieU6xQD2LEfhSOl00RHmSLpNzTPX
	qUefRzJpGEPOA5TL2leTDsh9trqZjF8p0FLfFrORtcyzgoXKotbP7V5IQm+eCVMN2PNGkjOuSJu
	yErU4CcVPou7g//fAoaRTizzJKIqazr/dLZRv+9ts8WTT5Rzkcfluxq699gFY7vruvRpwyByrnD
	VVc5rnndCuB0MEAgBa6YuDOdkNzVHnqDslhiMUuxQMCLQtbBZX6OMMc1/khbmf+Fa5ixZS2A3IY
	Fk5l8kzz1diCoJhLmNy1S0lzrSHLdBW6uFhgGg==
X-Google-Smtp-Source: AGHT+IHb+es9H9M9kGSwtETCKJLbMt7YPfw3chQ/Lxuw7WSyGf0XVM1d+FlyYn7Hy8udiuXpl/zxhQ==
X-Received: by 2002:a05:6e02:188f:b0:3d4:3db1:77ae with SMTP id e9e14a558f8ab-3d93041d81cmr7327905ab.18.1745453918771;
        Wed, 23 Apr 2025 17:18:38 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d9314c828bsm410385ab.27.2025.04.23.17.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 17:18:38 -0700 (PDT)
Message-ID: <1c7744df-329f-4b95-9afb-a005a358851b@kernel.dk>
Date: Wed, 23 Apr 2025 18:18:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests: ublk: kublk: build with -Werror
To: Uday Shankar <ushankar@purestorage.com>, Ming Lei <ming.lei@redhat.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250423-ublk_selftests-v1-0-7d060e260e76@purestorage.com>
 <20250423-ublk_selftests-v1-1-7d060e260e76@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250423-ublk_selftests-v1-1-7d060e260e76@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 3:29 PM, Uday Shankar wrote:
> Heeding compiler warnings is generally a good idea, and is easy to do
> for kublk since there is not much source code. Turn warnings into errors
> so that anyone making changes is forced to heed them.

Honestly not a fan of this, it tends to cause random warnings on
different compilers, and then just causing trouble for people
rather than being useful. If you think it's a good idea, make
it follow CONFIG_WERROR at least, don't make it unconditional.

-- 
Jens Axboe

