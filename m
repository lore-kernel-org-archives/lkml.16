Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BBB22FE06
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803228; cv=none; b=fdqhaZbpmn2Pau2YItoqUMUGV0SgcE+GnQJMyqJO4YnP6ZcWHVTx2JJhGc9B0CO6VNY2uh4kZU9lu9l4ITY0L2uRdB0lkyyA8QZfvCIoAdc2cqLXjTyEtwKbbwmHvYqV4CTpzIpfpd4LhPzHgPREhPrB36qHMiOMBn2DWidGKeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803228; c=relaxed/simple;
	bh=9c/9l7Gx6pO3uJ6uw/xSQ8RpmhZ+3ORIT5sR3A/UcG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnQdnJJW9Ayqcvi/LMGHhCWfMh5+UUMhPiwdkjGAYsRgWVEunDwUx15Y+JfDPRfNRLWRB0Y2M1K4VS9qHo/iPq53codZNC2QvAmrbfPfJzklL232FUj6YjQ4hG8+t6nCbK+3mSCGgYTHaaQAJt89kPKJbmTuwCF9lcvFULTmvfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bs9F0h32; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bs9F0h32"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85b41281b50so191759339f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744803225; x=1745408025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUKLRPozuEL+beG7gwcwBgRjJD70PGCGuYuOaYbRFSU=;
        b=bs9F0h32CMSmh3SFyyBUr/5h2uuGG76tIN3nQbNemp8RAI0B3IcaSedzMp+/PVLAvB
         qwNmbd1mQnvG1eKB+ywt/2mNtZrZQMh4wgYy+B8fn13qE6DunD+d8C0fKQdj+uHsDjBc
         zfXfl6T85ELyAD044CBesSv7HH1fDetX12eIrVdwWVCvqXuYS/DdzQ/mAiybPww9LYS+
         nN2dybVYuEa4Zz0FFrQmtcMO201tw6gKvm1MBk3S2LWYxLXbGpF4GAI7G7uIQMeaP+GV
         XFVpz7TdpsQ71LWdZGzxinIg5NE8D3oZ6vPbMlgMWFX0S4bHqA+Crdvtd74PJuZ6Mg9U
         aGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803225; x=1745408025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUKLRPozuEL+beG7gwcwBgRjJD70PGCGuYuOaYbRFSU=;
        b=cK8O7xUQtvoUeg/ejgMkpvxXyRx/Xn6JL7EOGJIUZH/92oLPR0p5zbtMbRwUdZ51Wr
         pWIDn7dI/7v30ORVFQCy2obi+qATQJiPjvn0Cnh4F48HMG/45uMmwFVPKh5bpVQEVUat
         xD0/5eoXfSa/5NMOYlS+ZBX8oOPWq2+KyV+0FALt522ni3Ymu/8fGplYkdVH7EgtujuL
         2ju0qDvBSIId1PfXCL2GZyn4I3xKsG4FxEnLwgY3w+cxPBqMy+uXxStCh22FvxeBa8yq
         CS/aiQ2DoYrvGWSt3XNbTHPzWhdj+jYvglkIvscptVeQamk58iH5KsZtJXAnHHrCzygQ
         XIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgZret6IKyaO2m/+1dYE/7PATDFLMBR0x6fyjH6ECfnClbJGQLHx79Jlw3PMJLEfs2wU3GIHk/6jAWZbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPkBXAbTlW2vKXveqVUGX7FaVxkvwVuCPJTZ91l7/EiOFJ+mpl
	c5E93T+88ODHz34D4uJgtUVTi6Y/dFgX8ey3Ou7D9H8SqCxeFh7B/LWkjYpmEA8=
X-Gm-Gg: ASbGncug3CIsP6DMusOtkgO23+QADiICcDqnr9Rh3btXavfoHakLd9PGqbOguJNyr/n
	VXMhpAZcfz50Vv17RqblcmA82vpV4dd7Xg4Co5pOQDcWB6E4Wsnm1PKjQLVYXGFODE3CVu84y/e
	9SUbdlO3Jybe3ThKGxND0WB8qKXFsJbKoSbQw8e7SNOKcyt9AlaN+bcNS/7CMQFcJ7BLzGgZ29k
	jqKQ/DhQTP8k01Cw5ctB3g2ixAKvxrleyjNxz1jf1CUNE870ufHh/E3A6dxeyRWck31BMO4EtG7
	0I61O44mB9po0ZHBP95STQzTiYUNdY8a+NSb56C0fgGW7OwfBljoD9QBxNvke/bemngeILyPSjL
	Gzyvx
X-Google-Smtp-Source: AGHT+IGUlzNooKv6H53Lv+4jj0Zw67S54d15RSAIPzhmPstWQkhOlgh0PpMBph3Z+r1w+yJha2JiPw==
X-Received: by 2002:a05:6e02:1fe4:b0:3d6:ca61:5f67 with SMTP id e9e14a558f8ab-3d815b5e5bcmr11964315ab.14.1744803224840;
        Wed, 16 Apr 2025 04:33:44 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e02105sm3566624173.90.2025.04.16.04.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 04:33:44 -0700 (PDT)
Message-ID: <3dfc300f-081c-4824-97c3-842f72d2a7d3@riscstar.com>
Date: Wed, 16 Apr 2025 06:33:42 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property
 resets
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Yixun Lan <dlan@gentoo.org>
Cc: Guodong Xu <guodong@riscstar.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, drew@pdp7.com,
 inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org,
 tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com>
 <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
 <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
 <20250415101249-GYA30674@gentoo>
 <0bbd2842-72bc-47a7-832a-fc8833163e32@riscstar.com>
 <20250415122807-GYA30943@gentoo>
 <hogqotzzpzcow2xjrwh34qcuiu7ooc2qnvlhuvexzvqkrcsfop@mhz26t5vu35p>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <hogqotzzpzcow2xjrwh34qcuiu7ooc2qnvlhuvexzvqkrcsfop@mhz26t5vu35p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/16/25 12:18 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 15, 2025 at 12:28:07PM +0000, Yixun Lan wrote:
>> maybe there are cases that users don't want to issue a reset..
>> so, want to make it optional.. I can think one example that,
>> display controller is up and working from bootloader to linux,
>> reset it will got a flicker picture..
> 
> Agreed. You can just deassert the reset at probe time. That shouldn't
> interfere with a PWM that is already producing an output.

I think you're saying reset can be a required property, to be
harmlessly deasserted at probe time?  Yixun was suggesting it
should not be required, because it might already be deasserted.

Anyway, I don't feel strongly either way.  Maybe the DTS
maintainers can recommend what to do.

					-Alex

> 
>> GPG Key ID AABEFD55
> 
> If you advertise your OpenPGP certificate, I recommend using the long
> id. See for example https://keys.openpgp.org/search?q=AABEFD55.

