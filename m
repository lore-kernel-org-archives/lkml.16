Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC8288C90
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516251; cv=none; b=d3d3KJSfdNqVIMSBr9z+7Vk5IKgxXHuq9b/laNY027ooVJqtNyrj/4RiErQB9GpyB6QlisDfhAzhP9r+u+uisDRWSgAcVb97UCWNGizjyxDUtzB0Hvd9wDWo4+NlXn3p8OCOgIy6RjNhcnIpEm6bHC79ydpAI1fh3yJ1pUQtcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516251; c=relaxed/simple;
	bh=WDDzFTRQ2a9peAnCJMQ7oGJV9u2qobu+eUoLBf9Dgt0=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=d5tbrF7T7mKTjOXy7ajJpc+qubRJNEm+iw7keluJelK1QK0+e4yVpc/hlBBGRSr/LNyzRiXr85asonXFmeL9cLgMTE4bHyGanUcJDdon1qjm1tyNOQIO8cNeDUn72rHw7tFKDBz1uU1mAG9hriT8OoFV3J4GmC6WcAKY6mXyIlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=Ftone3HW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="Ftone3HW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso2179008a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1745516247; x=1746121047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x6A+BmOhRjEKa2A7bNFOh7TDTW4+s5FQeNV+pD9zutA=;
        b=Ftone3HWk0WXHe5TQr8XytExFaSR0ltLqEXgLqmWA5WfTiMwVQJufOrMHp2U4faFUT
         g3krpso0hUZ3tlJ8AU+BVkoQLrXMAexEVKoUYZH+uDdFRMIGwBkSbNW5zPAosLhXugk6
         HFRUZ2uolAhvHvNFk1OskPg+0CT9bP8f0gFpMtS0z2TcfLZk+0mrT2+cZz+f/fYSKoZc
         H0FEDMoh8hxHr8HeH8JWqm6wvyzhPjx6jFB/reVgffkv+WDTqZvRxBc1H8oOnzHq/Y5W
         QElYbw+t1HpQadk6lweu8YUuOK+BBdG8/AMTq2AhXVJ+/DKDouxWEEIFjW913T0aXS0I
         4L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516247; x=1746121047;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6A+BmOhRjEKa2A7bNFOh7TDTW4+s5FQeNV+pD9zutA=;
        b=L60FlOrDQ/48K2xzqAEkaL4ujO6BvPs+wVlezAXnnJ3Hgwjj7ZlwXRgPBiLJWWEqGM
         cc24Zkpno61GuG6dNJ/oEkdblgsPgTiguEu3To280XNuiTSpObnj9F5HUJQVL3JdyIqq
         Z85vSC7Z5zG6gcLrRgi4D+3iBZeSddjDf2AuvGsNkY5NN/N8d4vLiTcpOVzlskO54IF/
         Sv1NsnRhWR2nuTjzHNt442rP85gPZA5WU5JVJx36niEvgMk9jEpNNqWisTa4Rz6l9cz5
         bYJHRbLKKa8r2R53FC0YCzn8SlOYnaZlaed9f137Qe06E11tqX6BM1wvgqfKDW5EImgK
         wBgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8k2nv9hwTUn8vlpYaWBsgbc6ngVa/Em1fpWVefH8r9fdezoBo4+HRO9IgXpPGdghcrzQIci2u4tbHc+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEucFDpoKww1ZavPpw9OMJ2RmWnF3NwAhHU77TQ1BzVf6qeuql
	tb0TLFOw5vrJl+cHlqqoZ46OBBZYTfMY3GQKcHuxw6bp6HTKyTQoJSwPULgjEg==
X-Gm-Gg: ASbGncvAVTHwL2ux5af1PUNPKB/e740We3//9cj/Cruv/wIJLgKOwhyAshdVUL2W8v2
	6+C45yMc39K/ZQLEyEUfwq+Mal9zqMkyMwjEi7kENtUmhJTlcyn2xMUxUlxOXLwJ7p+HasFKGBm
	KY4N15hIXrmGB0UqyCK8hvz2y3cRus0uYSQaup2N/NhMSgw4b0Gnjcy+5qI2Ncb7E6hnVpMppGY
	ClxKePaWkbzHrBMIIrc3vEAAuqXE1M2WOloneNthLAldiGHujIEFPyg4W1k913zRKFd6DHDzOxj
	GZBw33EOuVKDdbgknfCGbdYTuTN57R6IY7JmFMg=
X-Google-Smtp-Source: AGHT+IHKWpWhhsKR32jfktbVGjn1ALPFr2s2NdvrcRHWijC5IHeb2inGJwixc+7kSpHIfT0i6voQ+Q==
X-Received: by 2002:a17:907:3e82:b0:acb:39bb:f880 with SMTP id a640c23a62f3a-ace5751c70bmr387066366b.54.1745516247597;
        Thu, 24 Apr 2025 10:37:27 -0700 (PDT)
Received: from [10.2.1.132] ([194.53.194.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace598f7275sm139203066b.78.2025.04.24.10.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:37:27 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <2a80cde6-27d4-46f2-8ad0-b7feefd4764c@jacekk.info>
Date: Thu, 24 Apr 2025 19:37:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] e1000e: disregard NVM checksum on tgp when valid checksum
 mask is not set
To: Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5555d3bd-44f6-45c1-9413-c29fe28e79eb@jacekk.info>
 <20250424162444.GH3042781@horms.kernel.org>
 <dc357533-f7e3-49fc-9a27-4554eb46fd43@jacekk.info>
 <20250424171856.GK3042781@horms.kernel.org>
Content-Language: en-US
In-Reply-To: <20250424171856.GK3042781@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Although I do wonder if commit 4051f68318ca9 is backported,
> will this patch (once accepted) end up being backported far enough?

Stable 5.10 (and newer) already has 4051f68318ca9 and ffd24fa2fcc7:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000e/ich8lan.c?h=linux-5.10.y#n4139
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/net/ethernet/intel/e1000e/ich8lan.c?h=linux-5.10.y&id=8f1e3ad9456935f538c4ba06d2c04f2581ec385f
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/net/ethernet/intel/e1000e/ich8lan.c?h=linux-5.10.y&id=eb5e444fe37d467e54d2945c1293f311ce782f67

In my opinion my patch should be backported as well.

-- 
Best regards,
   Jacek Kowalski

