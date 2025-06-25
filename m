Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F13A1BA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856710; cv=none; b=GhIjM6Dv4kioyuLxiUWicDCBD45TIvecYxNrkUh/EWN6YAjY2Mwf7voADLDIb0oMh1gYiE53Ry3/HmIfpDZvvUkkr1b4BI0TQfPp4rmVr72aLvUS3qmFsC1Z5pyRCJeylYpWTj+T7WrU+UPlkz9uHXB4i7eIs0hzy7jPP2tN99s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856710; c=relaxed/simple;
	bh=cQChFIpemYCEU2to3qepypyGDWAJy+q5e4OEX2BidPc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qlff6qiV1srrnbxgo+fR8BSjPO7yqs/NOBqzdehVNsKS0MGsRx1L7oCpfBUcRCdunr89vYcZtslHuJcYklfsE/DoaMk5IRFMUHunG7OvhHBQQ1jK/ICbm/fwVyZmU7dMIxsCdVornSL5I/zgq0LJ9DR1MT25erQPE/QEirhpiCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=UHhwSQDE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="UHhwSQDE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0c571f137so121104866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750856707; x=1751461507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NSJW3n5WDshYJ48Euz3P/Df3ZQsxS6XzFo5zNuEInuk=;
        b=UHhwSQDENZ4o5z4XYx7BFX0va9MYcdJi9msZYls4fl0Fq7ACICy1kZjjpsOpq4W5+q
         TJXuCi7EbJzN/cTQy2BbDe3QnI32hbxcpjMkH70nJiUpivynibREbqUex84BnHygiUGg
         X2NCn0kgImsK1PAfpWbIK0fk92UMKobsCVJBW3bQhSXa3wVvZEBvWDMzwn/7Mgf5zb/T
         E6wGugN4gYJgt9Ayziq63Vv3Tv1vSMMLO03vjPbYqEs+NtRD1EZnJfzOJy/TvkVKG7w5
         zgn+4vufCywKEElVxPWcpM9N073jlieXzXanRfIagLHzU9OesnzakB1tvO2b0x+Flcot
         RYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856707; x=1751461507;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSJW3n5WDshYJ48Euz3P/Df3ZQsxS6XzFo5zNuEInuk=;
        b=sREEk1IcOniHDuIWiL2ytIKSK9s1cvnKx+ZMR5IvAZYJPun+d8mgiH9aoAcB37s+Ng
         DzbWtMoTNFO0rx7vdwxZ3TRDw6kUd3onYQYFkzUl6nopMoLbetG7AUKQ1m25x8dBBUMT
         wYtfZ3svaD6jB2QQbu50XLU+XFf2MfVgnnKF8y4Mo9v0Dteooj83F/vNqOYha7tK1AzP
         PCxqmNnrdlwEvXVJ/6EcIMO7qYKP6tBITREILVv+B87KzcDugPbfSwGEHxFzxd2C7vwl
         CloLDIhE1goQlz3fw90WFqY6/z4wxbvvujYVKXfRK6lOQnCxcCGRbVBsb6csEFjvM1B+
         +P6w==
X-Forwarded-Encrypted: i=1; AJvYcCWP8ZfB2rJlRQ1M4MDnlT7D/GqyQxhly0pWy7vyQN6yAoTXCE/Q5IvYoBHLQKx52YUbcJ1qenp06KI33IE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxinspC8h0BVmXGcK4YBlg6JNznzapyojDXwTsvbAJvCunSIZHe
	tZDiftBLXFWThWmq2mrb00YRKYHcYNGXYkp63k0ySqYRw+2u5j9j6ou/gxG9swvr0Q==
X-Gm-Gg: ASbGnctwL0WpLBsj0WOhkVWEBcgI/B7bQ+Q5XjOCKxPgm6jV0V15tvmpVyvqeDcp8j/
	7zyHdvomGopta6VHRUvkiytRe1k79EyW1VHtP9cjAhkslvrNzh5OIs5QVXkI6uaxtMKQ6//G6um
	zyUDWKS+L2XERv+4QvdOEHyhScvxrUiyRZAophCXI34tEKJuq54Sg/fKA1cj7sf5deYOJyyrNC1
	/vOvzgnmww548DG6f/E/dxpRYCfEYtDYKqFKQfyopiSG2SfX1CEP3FowDqT4GI5zZfospoc6LXe
	XAGWA0+5/JRIaW68raaDd6tuh6hDVuYejzSUFbdp/3c+BVdFiTPlSckBkEIU1TjB
X-Google-Smtp-Source: AGHT+IEC2nKPUdk50WFpUghJX26BtPFp6JEJuxNyGydhjELLPNt5ycVNb0kOu3HHnkCcdxhTWPz2uQ==
X-Received: by 2002:a17:907:fd01:b0:ad8:a04e:dbd9 with SMTP id a640c23a62f3a-ae0bf154a67mr288967966b.31.1750856706457;
        Wed, 25 Jun 2025 06:05:06 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0c0a824a0sm127853766b.36.2025.06.25.06.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 06:05:03 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <613026c7-319c-480f-83da-ffc85faaf42b@jacekk.info>
Date: Wed, 25 Jun 2025 15:05:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] e1000e: ignore factory-default checksum value on
 TGP platform
To: Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vlad URSU <vlad@ursu.me>
References: <91030e0c-f55b-4b50-8265-2341dd515198@jacekk.info>
 <5c75ef9b-12f5-4923-aef8-01d6c998f0af@jacekk.info>
 <20250624194237.GI1562@horms.kernel.org>
 <0407b67d-e63f-4a85-b3b4-1563335607dc@jacekk.info>
 <20250625094411.GM1562@horms.kernel.org>
Content-Language: en-US
In-Reply-To: <20250625094411.GM1562@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>>> +#define NVM_CHECKSUM_FACTORY_DEFAULT 0xFFFF
>>>
>>> Perhaps it is too long, but I liked Vlad's suggestion of naming this
>>> NVM_CHECKSUM_WORD_FACTORY_DEFAULT.

So the proposals are:

1. NVM_CHECKSUM_WORD_FACTORY_DEFAULT
2. NVM_CHECKSUM_FACTORY_DEFAULT
3. NVM_CHECKSUM_INVALID
4. NVM_CHECKSUM_MISSING
5. NVM_CHECKSUM_EMPTY
6. NVM_NO_CHECKSUM

Any other contenders?

-- 
Best regards,
  Jacek Kowalski

