Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145811E4110
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747171558; cv=none; b=XU/TEl8ibj+Ur3XC0ewn+pCUXniFPPHE2zBKnabXypiqi+CCY9O+VGeTzeeb8dPBqyg9tnD8PN9JPxOstwD2hnG42DhwQ8hC693NAKzHNPmaJOZThIQk5+G/SvHg1EafjEREUDWmZmxW0KVZWgs6virDusQE6v0186xxGxDKwvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747171558; c=relaxed/simple;
	bh=PONCw9RTCNN6nn6z1Uu6GiS7int2V5KAYeMXT763Scc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1OJr77okn+SSMQGPhPJiKcCBMrQ8YEaew2SQRvwGemSKXvx2oIZ67DYoUnSpVeIVsDY/iFQs2/KrL4npSUfvr9yOuoEJK7+V8L8gt6Cg3yIk051xSdbIbJZ7D0I6I4T9wEKuMzHtN9WgWINuW1K0JtKIMwvzFk6XWXgrwbntoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VLachtPy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VLachtPy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22fb7659866so66911845ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747171556; x=1747776356; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3RlUrB9vsvdRLDB/WErlx/ApSJjbQf0jOu6HOFeS/w=;
        b=VLachtPysKzCwAR7oT7ircwJnkpLJJ5i+i1J3jDabhxeMC1rgEBrWOsZkUQ7tkSHsg
         uR2q2Upi1g33VweXCEj6H0RUFuuumikb/aJVleNWKy4m6CrgklQw9ZE3BSK6kvn1+CwS
         FD/25z24M8awQv5Ruz6RWh/EGQlm90d7D8fEYkF3pG59YRmM0iIuaPJKHiCbqMpSTZ+n
         JPw/tZ5arieOqIti4F08b3TsmEtcVH4Z++yBVSuVvUhAZ1wRxOTLHaKfsVfjzkB9g5cg
         Y+aChwu43BACop23gKZ76+ZJV6BtRcQ5nZE9kXbFRit4pkpxLBPswwC+ojmFnyHMA2gP
         uZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747171556; x=1747776356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3RlUrB9vsvdRLDB/WErlx/ApSJjbQf0jOu6HOFeS/w=;
        b=FTCTNhzlmxz1QunCuGX+K6v1r7msv52+t5OQnaE3FqhF/+cwTMjF/alUCfIZIkEQlL
         x7U90+0iEul9pXWkuP+CNncUE3R8NRJIvFvkTBfa+zhG5kiWSVy+5iGCzD0ioDHaurcO
         hZ6GxFco3DAtsHykynHwfPVib9MRDipaIwD12L3JCLJY4RZpQTL2fHi8g0czUWFtxLw8
         Csrv24tgOj6ohd04yLrLgCTE66e/TJT3+zfDUtcNq/041Z440mrimabUXlmLAvVFqhbU
         666gIJIZtp7EfJTqXmcYw1mFZKJRNJ5+cz1IB26mf7t6An/lre8HhP5zcCXsOYVCBIUB
         w+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWT2i0qU5QiV/ZoCsuhrF0XW91h02yd0mfwYqSoXJyQez0QhxPZgGfEJDQpQgJOJuUuM1POOSBrRpM4k5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YycNtSoMB/3QWUMDeSYNMYKZvFCWX2NXu1U2mZThVuf+kLKEpeH
	4qqyd2nPC8ylTIyPIA5BgnqlrTX3c39hRYtAygD40dOoK1jB282LoAmO6qWKfpM=
X-Gm-Gg: ASbGncth5DhGJi8Dx20dw4y+f9KYk1YXQ7z24zqLHERb8vqWwbQqpDUjjGqn3QrcynM
	StJ7+kVJDh+N7RZrPTdurqeIOpRkji+G/QpgajuO5GGezu7L3xPDh3yKIgSWW2jYk2H9vBAGxK7
	SzJLSRns9CAqpqQuCaTwzJd3jBBz2Z1W9KZZjJhCZeo7KvDmpshcqxIMU5c+jgA7a0r7/qbf2Sa
	zT++g0LVbREUrF8xnfyeXT8MQZr0QuzZw0SIFG9Pz0ahkShW7ib5+Xf+sU+JNfsO2FNIFbkcrVT
	mNmdTYxfaSDXN65jUxEnEP2iYWfRlZo5FvKQB+040Q==
X-Google-Smtp-Source: AGHT+IFocb82Pc+xAg+z3CR+mX8T9Fb3IZ3K1KpdH6BlWRo7TmjZ95U0igx6DKwvn349WA6Uo5EwQA==
X-Received: by 2002:a17:903:2f8d:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-23198116712mr13397695ad.1.1747171556281;
        Tue, 13 May 2025 14:25:56 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a1965sm85249085ad.231.2025.05.13.14.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:25:55 -0700 (PDT)
Date: Tue, 13 May 2025 14:25:53 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
Message-ID: <aCO44SAoS2kIP61r@ghost>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9zCYZ7u+nmQgSkgWgv+QSVb=miLRtcNQRfJFcd8JgcJg@mail.gmail.com>
 <MA0P287MB2262FF6EFEC6D01796683DE6FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-vamEx2f+nTJbd=WeB815ZheJV=mm7ohzBoZrsoaQV+g@mail.gmail.com>
 <MA0P287MB22629B5A1F6238FBBF9E3609FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB22629B5A1F6238FBBF9E3609FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, May 13, 2025 at 06:05:20PM +0800, Chen Wang wrote:
> Adding Charlie.
> 
> Hi, Charlie,
> 
> Can you please help confirm this? Is there something wrong with my
> understanding? Copied here below for your quick reference:
> 
> > One more question is about writing value of "thead,vlenb". See bindings
> > description in Documentation/devicetree/bindings/riscv/cpus.yaml:
> > 
> > ```
> > 
> >    thead,vlenb:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> >        VLEN/8, the vector register length in bytes. This property is
> > required on
> >        thead systems where the vector register length is not identical
> > on all harts, or
> >        the vlenb CSR is not available.
> > 
> > ```
> > 
> > What I am not sure about is whether we should write 128 or 128/8=16?
> > Assuming VLEN of C910 is 128bit.
> 
> 
> Thanks, Chen
> 
> On 2025/5/13 17:13, Han Gao wrote:
> > > Assuming VLEN of C910 is 128bit.
> > I refer to the value of c906 because c906 and c910/c920v1 have the same value.
> > 
> > Link: https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-3-236c22791ef9@rivosinc.com/
> > [1]
> > 
> > On Tue, May 13, 2025 at 4:06 PM Chen Wang <unicorn_wang@outlook.com> wrote:
> > > 
> > > On 2025/5/13 14:45, Han Gao wrote:
> > > > You can use xxd to convert it.
> > > > 
> > > > cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb | xxd
> > > > 00000000: 0000 0080                                ....
> > > > 
> > > > Regards,
> > > > Han
> > > I can read this after disable ERRATA_THEAD_GHOSTWRITE.

You can also pass "mitigations=off" as a kernel arg.

> > > 
> > > I recommend adding some explanation notes in the commit message. For
> > > example, when we need to enable xtheadvector, the prerequisite is to
> > > turn off "ERRATA_THEAD_GHOSTWRITE".
> > > I found the relevant patch is
> > > https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com/,
> > > also hope adding this will help later people quickly understand and
> > > avoid my mistakes.
> > > 
> > > One more question is about writing value of "thead,vlenb". See bindings
> > > description in Documentation/devicetree/bindings/riscv/cpus.yaml:
> > > 
> > > ```
> > > 
> > >     thead,vlenb:
> > >       $ref: /schemas/types.yaml#/definitions/uint32
> > >       description:
> > >         VLEN/8, the vector register length in bytes. This property is
> > > required on
> > >         thead systems where the vector register length is not identical
> > > on all harts, or
> > >         the vlenb CSR is not available.
> > > 
> > > ```
> > > 
> > > What I am not sure about is whether we should write 128 or 128/8=16?
> > > Assuming VLEN of C910 is 128bit.

That's a bug. It should 16, but I had put it as 128 for the D1
devicetree.

- Charlie

> > > 
> > > Thanks,
> > > 
> > > Chen
> > > 
