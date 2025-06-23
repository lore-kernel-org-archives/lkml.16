Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F281F4604
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672500; cv=none; b=FvcDLE4JGoagnwzz1vJ2Id5dHhekCssHJaM2Nm8/q4kn7xoxcG/mI6GzXz484RkIMYD0OqsqTmdBxhXRxWwyPmihVXR8MdtU+i3ej6dxIPxuS8bM+t4ZkBLyHcHrzBbJICPFuM2umrdUu/3c6LgLGqvpiiJVdXWFLjU/I6gfm7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672500; c=relaxed/simple;
	bh=9oh47QkG21KO16LzRfKjVyEi7rtXSfgkKmHNoMC+VVw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Jm5URnp1/bMD/SxGU9jqNojNMegJHVl8liCahsEEZ6hmAgIRC4HYuLUSf6cdUXRtcdjoNHJmqdtDENFLRdKxi/6mCUt7l3t+5G0zSfiti0koTYv28jikJWYoGoNk90b3PoKKxIK+d/Z5yh7k1pl4LPpCfTZ4QwXFzxsei+7WaTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=M47IxdMV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="M47IxdMV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453442d3a15so1645385e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750672497; x=1751277297; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIpxzH7Ey6NOPuneckkYZHJ6AcvohPz9IFjSsSYVnZQ=;
        b=M47IxdMVfwLlyqvRY63Lysh48p8bvA/DXfkvfrFBieRa963MdMZyrGqAGh3DpsWc29
         IlcPhLY2K50H30h2yDn7m8oLYDBkvA0xOaFJARTaBoQwm4dPA0oKsFuJvBQOa9j3d/H8
         +SlV944lDdx1/v9qxJP9x78ePPy7IMp2ApabDZhFVxumE2Whj67RB45exEXbwy3sQ2hJ
         43XsNAk2JunYwUpwCab/qOWeHTGWD1Bnmiz5PEYBZG1yQR3H/SGbqe9j8Robc+LQpsMX
         z7cwAWmgRXTQ/uW+D+AnaFzbt5XBPm4dCZ79vStbYffPQB108Fa5cbKP7bQA6SuGS11F
         qP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750672497; x=1751277297;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rIpxzH7Ey6NOPuneckkYZHJ6AcvohPz9IFjSsSYVnZQ=;
        b=gCPoG8t0zDqR8jyTOnXV8/4Itg7tZI/MhKAP5tOj1Aaxp+7A7AA314gh6DL7EcBHeG
         IYCtuf/YaF/5iu8IsGJCQVBZLGq+hdvovnyq5LDpp6xtdrsXjGRbxGe7VAwmGRuqrbQu
         Ki24iEuTbLUPDgyxPNiFsucPYFpSlX6NmQcJwzI2W/1BzDJMm6Ngt450997IVa0z0m4V
         Dv9bG4mLkGm3VJeCs3fL/fKVbBQ8AentMv4lLOQEuPzpue3freiHnrxi2cBid9cT4SY0
         8nOwetKatzTOzoMOSRDPCtqPHafF0c/016QuEM3mdCLxNcngzpY8sxHdl8uthUIWXLvj
         BbGg==
X-Forwarded-Encrypted: i=1; AJvYcCWkNeFr6Kcw5D2ilbPoZ0+hUAHNK2Q4WgWF2giMae6mFP5u+vu0LjuYnVACLMy26zfIyCEhRpo82FG2FbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG2Xt4fROz1Bm48G/h+XGMQoiCKwbu978VvAF/IEKb6oCgXcKl
	RwSOIlCM9PvcB83HJFy/VzNScK5Khzml3ou2zu+pIH01wPz1Q9ZHSCBnZSC1UQrFFdM=
X-Gm-Gg: ASbGnct973ZZcOnfRcmZr8pgDbYBbk+xK9cjzhF9Av50EI9R+vlIPR5cdoOIO9rGOkA
	0Ez+C2+L/y7+6xqUKB6FaOuwk0vG90bYekUhiyN/BcIgoXmsWue2kvq3/F6cfgNbZ2s1O/+jbr2
	5PkJslqa0e/tr2BvWEOMQ3AHe/QQ387AyMbZMdzzlGbQwDT1sMoD+Pzq2hR/hxYPaU/5BGjjwNJ
	0w0zt40lLg5bp8iQ/EnK0Kl6KruIFHedlis0WVLvL8StfazWjYgqjzZx0ZXkSl/qpwID5CnOzib
	wqMCakDUwpT4qyKT8rEpCowvKfQBHmY81Ijo6xptV/1PRsYnbJAW2c2mDOsBHenKzow=
X-Google-Smtp-Source: AGHT+IFkDuNZbXec7bV7lPuMQ95q5Ol9D1Ng0Rhf3YsBGcD5BWQyx/AdkT7xTPlkQyoHbl04rNQmfg==
X-Received: by 2002:a05:600c:1d02:b0:450:d4b4:92d0 with SMTP id 5b1f17b1804b1-453653c105emr39996555e9.3.1750672497513;
        Mon, 23 Jun 2025 02:54:57 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8947:973b:de:93b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10502sm9198663f8f.18.2025.06.23.02.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:54:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Jun 2025 11:54:56 +0200
Message-Id: <DATTLU8NTTUV.1L05K3TTMV29X@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Xu Lu"
 <luxu.kernel@bytedance.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
In-Reply-To: <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>

2025-06-23T10:04:45+02:00, Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>:
> On 20/06/2025 14:04, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> And why not delegate the others as well?
>> (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
>>  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)
>
> Currently, OpenSBI does not delegate misaligned exception by default and
> handles misaligned access by itself, this is (partially) why we added
> the FWFT SBI extension to request such delegation. Since some supervisor
> software expect that default, they do not have code to handle misaligned
> accesses emulation. So they should not be delegated by default.

Yeah, I forgot about your patches that conflict with the change, thanks.

(The current KVM exception handler only forwards all the listed
 exceptions, so the only observable difference this change would make is
 that the KVM SBI PMU event is not counted.)
