Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4FC23B614
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335774; cv=none; b=lP/1czYgNOFbEF4YewaRwPePs4hjlYJ4erTnTc15oqI9Pt5LHpSvaq2k+uOkQtN3yS3Awbojq16AuS5Twpc4RDcwVG2plwvrgZ2cVd93hHO/M+Kej42Rjt1QJj1cFYO6bwp5PDRhgKyywCXVZUyusAr8bWm/kHo98ACbTeBVsJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335774; c=relaxed/simple;
	bh=rSiZy2NDpY193CMFNPDC4yIdR7YFOYJC+i4UlEnc5sA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oa1UEgYAeOUN4jt5d7UJVBMa6mVhcy2rZadRZ3vS9oIoZZTPbBGRodBg9GIMLZtg90erFd4Z3YEu8GE2vrwmoE01KX1tCgDl+lyXokjmvi31dn/QTzE4nZ6/4ug1/KrzFdak5ANAbW7Abf6lLSAbbBR6o6HgvXSsIxECeQlopFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfdTFrbL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfdTFrbL"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73972a54919so535838b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335772; x=1750940572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2osMFaTXEoQKV6XeTZU/cqIVMzN2KvnQjbjxFGVH8Ts=;
        b=QfdTFrbL5PE4Ulyf5DmHzA3w1rfmZ8a4UQ5hH8KuP4LBjVhYK4dLKPr+lDNwiZLCQY
         mhK/+yji2ul329CaFIvohygjfWRm07mjhrZiS+JhhJ6PWbKKkTNj0GJKPGAtRtLQG6Mr
         xrolzoJUvJXcGZTfC4dbKz5Ko5ZbqPq64dQRSaS8iYWPV4lCbTV6UD+quQR7ywKSnWox
         NGO/Ls4/h/RslLM2t2xluenZIqQ9wtbbdt354GskYgq/j6Y56VsTyijuRLXnycnkyhvo
         qHpCkB0Nu0Sjp0QW/um15lrSgQopasMiC46rNSJLrWha2+VcUHEytTFVO/ToEY8k32Oi
         08bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335772; x=1750940572;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2osMFaTXEoQKV6XeTZU/cqIVMzN2KvnQjbjxFGVH8Ts=;
        b=GX7SVpEXM290m4z/NCX0BEhIsJUFL+Vq01oMOndOr2Em4uYcsbcQ3T7JX9V9rCpff/
         rjLDyoNonuxnJwuKVDrriY02NxyLrZk+4STELQ0Gagqcv+Zdk6ZuZyU1xdH261AAxlkU
         56/hehSl7/1DSY5FRO86g0I3uTjEmMt020Qv0d1WAmH4gGggmtnEg9SdCvIlqO4A+jOI
         M2PWwjpY9XVPVKkgenaeQTenKvHRsnLLVzqq+u8ntfjHxLAY5ppYWa/3md5ULYSh6QAo
         eoWMgDg7yHcrKIgsgZp3CqTyHo+o2MISDuBxljyCAGvtYthe5f95LujIlryvS180y3Kg
         kehg==
X-Forwarded-Encrypted: i=1; AJvYcCUVTPCSkxjf2sxjVaGsgbNFIXsGWJQ5f6ZjUxDtjXoswxqsjSNPAboaJrdmHtRofmVcZceNpUZKRbGW95Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWNwKxX9TuSREWBpxQ8zS6A+T6jKskHKUbBoFgt6o6uYNhtyC5
	Reyb2MLCtRL4gm+xNps71aRhRfvYIU+I3KgkpswEFimAuPYUeOG9xmeA
X-Gm-Gg: ASbGncsG9ar8Jnpof09ma3BmBVkzvst5cirHeOsayR6ScLtNoHSCeLvgzUFJkN1uDut
	oYJoCvn35D2pI5xY3o/uFpctMHaSMZIEDaQCJ711fQVxsCxPGgWj3SU1TMKHU5nre/kCAef/9BZ
	Z7TT1iXkQJ/EF0uyVkmbe23OJegub49VXc0mqCFLoE/OT2AQYft1ZdHhzLjWTAcAfu7IB22lSsA
	Jr+F2yr2Eh1OSM8cGetAmEnitiBxxqB34mU3jLFlRiWEW0MOJ4scjFtKvChD3ExFz6al6cLDjJ1
	DDUTU9s/n0MJrnKpo47aAdYp8oJ9iyH3VE9ArMIdXzJBN4Cpda26PLy0eKCKfACNVtfyo4YQWw7
	6yrWK6CPD/iF/vsyavJ5iSe2SrQ//eCgSJlFbW/RJNQlqNmSjeC+qSntUiW8=
X-Google-Smtp-Source: AGHT+IHZXFvkQQikWG9tX46V8AE6d5t+fw6ZH4UqiieeOGsznRlxIpsWhj4URdfIoZ5nSPjiRW7/GA==
X-Received: by 2002:a05:6a00:9454:b0:748:e8c7:5a38 with SMTP id d2e1a72fcca58-748e8c75d0bmr8642598b3a.23.1750335771864;
        Thu, 19 Jun 2025 05:22:51 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748f0c77b3fsm2947264b3a.19.2025.06.19.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:22:51 -0700 (PDT)
Date: Thu, 19 Jun 2025 21:22:48 +0900
Message-ID: <m28qln6huv.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: benjamin@sipsolutions.net
Cc: linux-um@lists.infradead.org,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 07/13] um: nommu: configure fs register on host syscall invocation
In-Reply-To: <412c514334ac14a992cab3e7b86170b96d60be1c.camel@sipsolutions.net>
References: <cover.1750294482.git.thehajime@gmail.com>
	<2863dab9b3f9d6536b73623398a3f39e4ae70957.1750294482.git.thehajime@gmail.com>
	<412c514334ac14a992cab3e7b86170b96d60be1c.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/26.3 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


On Thu, 19 Jun 2025 19:40:49 +0900,
Benjamin Berg wrote:
>=20
> On Thu, 2025-06-19 at 10:04 +0900, Hajime Tazaki wrote:
> > As userspace on UML/!MMU also need to configure %fs register when it is
> > running to correctly access thread structure, host syscalls implemented
> > in os-Linux drivers may be puzzled when they are called.=C2=A0 Thus it =
has to
> > configure %fs register via arch_prctl(SET_FS) on every host syscalls.
>=20
> Really, I still think that we should "just" get rid of libc entirely
> inside UML. That would avoid so many weird/potential issues =E2=80=A6

I'm not sure if I understand your point.

Q1) what do you mean by 'get rid of libc entirely' here ?
    do you mean the following code block adds the dependency ?
+ int os_arch_prctl(int pid, int option, unsigned long *arg2)
+ {
+ 	return syscall(SYS_arch_prctl, option, arg2);
+ }

I guess this can be replaced with inline assembly instead of using
libc's one.  but this is the code under os-Linux, which I thought we're
allowed to use the host code ?

Q2) "That would avoid so many weird/potential issues =E2=80=A6"
I'm new to this;  I'm wondering what kind of issues did you see ?

> Doesn't change the fact that FS/GS needs to be restored when doing
> thread switches and such. Though one might be able to do it entirely
> within arch_switch_to then.

I believe this is already done in arch_switch_to.  This particular
patch does the control to the host context.

-- Hajime
