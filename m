Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CAD285406
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749593161; cv=none; b=BGd88akdPDaERXq00qsGzKvWd/60Qk2PYyD0wVZsoSyO05dU2Yo2hCqWURX8eRZ7YcyPe19IEH4VqMa4QkWY2lnilNI5EhNYd3VMeyT5jbZCv6qhtW/MDpAAr5R6o0EyGPDAyR3rV6xKCB2XiF2oub6sWYuhOlaSuYk5dzkkoU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749593161; c=relaxed/simple;
	bh=sOHGjtlBSSivUwJ9y42B0KUdi/GHMLZsTPcNzS2pquc=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=CWUKofViBBsbd4bxA6K5jpUKEMDm8bGEqYVOsnGAJMXjZFBvqK9L0oYzhSoj/omtP8NhJxSEMMOIqKi0CctIRJ27P609BmW/atOA12b99FPdvz9RmFYmydPV0R2aebcyKajbOfNtQ/YyGfJ8OoqzTx/2ZsaIgjp9DM1AaglTFNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=iEts/3p5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="iEts/3p5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2350fc2591dso2802085ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749593159; x=1750197959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHqcA3zVz9S368+hvL9R5MdY9BW6tTYhYF+8x4BDYC8=;
        b=iEts/3p5ipgqqSIoJKYPRK4u6JhseN3Rx46rLLZoaMP11gMGteYKtIA7rnl7XFsEV5
         Cf01EeI/ireaUp38DG94sSxSfYQ1TgA6//gPbwtNXNxaFpi+FZ6CAq9/cPOCfTlz04a5
         bsywqCnWTV9/3pg/1lpnsbb7SkzCwo3YLqK738WWtf/VPCIQSyPLqYWe7lPScz9vkiFF
         ipKPt51IhA2zpZ3dw2+46uDlrmfE2KH9bkCkONqhsqo2nhFLGgMoZP8f8mG4TteYlPML
         V3PBXN4cukM+oOd0a4b8ePY5PmW27Zb3biovYaHQIKyPUtNqaRTnCeI8LXGATjkaNKq0
         tTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593159; x=1750197959;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHqcA3zVz9S368+hvL9R5MdY9BW6tTYhYF+8x4BDYC8=;
        b=ZkwxXcPU1HFkkqjncp4EBsQ1uLtg1O+Rcmg1LzRtx8jhRfGtOAelmhY3bSFVu0BbA9
         dLhLEHn/alYzu9dSOEOW8xkOBOpCHI2aMp6iHPFA0pTj90y2potnPbFOMQOjcL9iFbxT
         XDy9Dv0CsmkNvGJq1XuypP+2kv4h4cKOeyKm1eEh49pS37CfIo22bl1fkZTSvVWxTq3S
         kaZQO3x5OvvgsnNNE3p9cXWXV1xFC5VJLmg9TTRfWeWw9J26zqX3wK8yHkMQRLlKOJbZ
         XGiOx9V2gbugAxGsd0s83iz6UntIhC/qNEqoJK3esrJaXoUdlxxdD/Jwx9Pjs2hnPZEW
         ouFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvqeDVWppNSyoHdlSNVrNQegiN8qGiwbGYe6SV3iOTtOOwiAPLWfKl9GV3FEL7E5Oe5mEVlGWbs78Ek9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX1GruaBDetyFmaoaRQTOF5+or+bPhSAWUb+1HrVgbBfJIJp1f
	YbNVucy57+SCOhUF43VncIC7ro1o9FnfObFkFwOM9aSCh72xJAzeP9o6aGZUEBjCcTc=
X-Gm-Gg: ASbGncuwzw6Udj8UI+F9aYMPraNpzE4aXIfrkbKvSKEXztiwT/f15AhAf/iovjmf+KL
	VrscIPVzIfLlVxONjvuGAXe+O2LYJ7emnNCKd/X1iA/gMsZ2l/3ZcMdKo3Vw8VK87aWI+WmOlnS
	zRxBKCDY7rX+h1T8o+9sBVSnWBmu8G2yUccpY3coSxJdmmcSjr1E1V7Oam6JCsJBPwQRoRtoX/V
	stt3MpX/C+kqplHydjcEEoeHZoVEOC1wPll13wb9UH8nIOSkVqSTnTnyfoCrx8YQvyPCYrMTAmv
	TriDS8HOS6AksVzDs/bplbHcfndxfGjL5tp6eIEF0NjbR3y/F1keXGvM2FDu
X-Google-Smtp-Source: AGHT+IFDADkuWil1bWnN6dI1d8MxdEDW3cXaZee41rfaousESkYjlPck3T795KMl0sR8ywtHR+O3Jw==
X-Received: by 2002:a17:902:f60d:b0:215:a303:24e9 with SMTP id d9443c01a7336-2364169f4aamr11793605ad.3.1749593158758;
        Tue, 10 Jun 2025 15:05:58 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2360340fbffsm75592285ad.197.2025.06.10.15.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:05:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:05:58 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 15:05:50 PDT (-0700)
Subject:     Re: [PATCH] riscv: vector: fix xtheadvector save/restore
In-Reply-To: <CAAT7Ki8Z5O61j8bS3OkdYMbcnfJBY18zxJe=qZeJWCpYTibReg@mail.gmail.com>
CC: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Charlie Jenkins <charlie@rivosinc.com>,
  jesse@rivosinc.com, andybnac@gmail.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rabenda.cn@gmail.com
Message-ID: <mhng-08D1FAC4-22A7-424E-A1C8-89B71D89BF01@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 23 May 2025 02:46:50 PDT (-0700), rabenda.cn@gmail.com wrote:
> I will release v2 later to add explanation and add fix tag

Sorry if I missed it, but I don't see a v2 (I'm scrubbing through stuff 
post merge window).

>
> Thanks,
>
> Han
>
> On Fri, May 23, 2025 at 4:54 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> Hi Han,
>>
>> On 5/22/25 19:27, Han Gao wrote:
>> > Fix [1] save/restore vector register error
>> >
>> > Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]
>>
>>
>> Would you mind rephrasing the log? It should explain what was wrong and
>> how you fixed it.
>>
>> Thanks,
>>
>> Alex
>>
>>
>> >
>> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
>> > ---
>> >   arch/riscv/include/asm/vector.h | 12 ++++++------
>> >   1 file changed, 6 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
>> > index e8a83f55be2b..7df6355023a3 100644
>> > --- a/arch/riscv/include/asm/vector.h
>> > +++ b/arch/riscv/include/asm/vector.h
>> > @@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
>> >                       THEAD_VSETVLI_T4X0E8M8D1
>> >                       THEAD_VSB_V_V0T0
>> >                       "add            t0, t0, t4\n\t"
>> > -                     THEAD_VSB_V_V0T0
>> > +                     THEAD_VSB_V_V8T0
>> >                       "add            t0, t0, t4\n\t"
>> > -                     THEAD_VSB_V_V0T0
>> > +                     THEAD_VSB_V_V16T0
>> >                       "add            t0, t0, t4\n\t"
>> > -                     THEAD_VSB_V_V0T0
>> > +                     THEAD_VSB_V_V24T0
>> >                       : : "r" (datap) : "memory", "t0", "t4");
>> >       } else {
>> >               asm volatile (
>> > @@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
>> >                       THEAD_VSETVLI_T4X0E8M8D1
>> >                       THEAD_VLB_V_V0T0
>> >                       "add            t0, t0, t4\n\t"
>> > -                     THEAD_VLB_V_V0T0
>> > +                     THEAD_VLB_V_V8T0
>> >                       "add            t0, t0, t4\n\t"
>> > -                     THEAD_VLB_V_V0T0
>> > +                     THEAD_VLB_V_V16T0
>> >                       "add            t0, t0, t4\n\t"
>> > -                     THEAD_VLB_V_V0T0
>> > +                     THEAD_VLB_V_V24T0
>> >                       : : "r" (datap) : "memory", "t0", "t4");
>> >       } else {
>> >               asm volatile (
