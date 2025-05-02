Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E480B25484E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188941; cv=none; b=T0W0CESl1FYnLtmxz0W9JoOZYlQzM8Ts4Vf0alOtYvEdIlZzp1dsIMbcagGgxpudWXnK7R/ZEpwwJn4ma1bP2JujcKAe2cEm4hqVpC6xyE1qn4HodL1aNZMB3ktvFp2JAtO9t5JxYz5Xm9fk8jkVql9wbJaAghIVX8M5TJ/bHyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188941; c=relaxed/simple;
	bh=LZ5FaQiluJjVti4wLSM0wjS0i57hJKuyzn8GkILRL/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEwNkhOEi+db6eHooDkixGz2flwNQkz6KGsy6NmBQwEmkGWWPraCPaMdJz7NRTqDO4jr1nayDVua7ALGuCkTwKqubTM/cEQzY5ukBWwD/74DBjqO+CVSlwt5fbep2dlJG/34llZXY/i18OkteID5TQI303Vm7QEb/tI9WrVoo9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FYL+obIt; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FYL+obIt"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso6946a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746188938; x=1746793738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ5FaQiluJjVti4wLSM0wjS0i57hJKuyzn8GkILRL/k=;
        b=FYL+obItbfMfYPmMc/gZS6rn9M807hsIZHlWZEwRhYqVnxAN/1ITaJj/D89A9nAaWw
         80ELlkq42fUyM8UvPxtbfSFQ6IpCIE8EXHXDMjCnAiWOixQCWOD/QwnmF446DAHCr6+D
         ltGdSHru6y2I4AE4WLTixKWmd1gT0+wzcCRpcA1owxh2Rf+P0rnPUJKH4JNWJTdNaa36
         rIYbx3mxZtKXuqI2OtYfDmJxmZUcmu7Ooqnns9uqRZ+qY0TjrObRCpamVYwvleAeDyyp
         oXCTWMlLeIUsKjtMKP0Y51S15EhiECctZK+tFtNSf/f/yCrBCIEpTBwlI/V3VkquWI2x
         8FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188938; x=1746793738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZ5FaQiluJjVti4wLSM0wjS0i57hJKuyzn8GkILRL/k=;
        b=Ru8u/50P196posj58Xnm9hla2EcjpvWf0LfsjPBLaloXJW+zBtSgGqFtc5U8YEiaD4
         5weJ6yuQRUwZ8H/4O6uObvLfB5stCZ7QthMARqPUjBEcA1/vq+YN0ismFD031xtFvAJM
         Wycwv6EEOu6Xa08RybsA+HV99sblQGEkVMx2iFnI3C8/sam2Vi9G5ulD+CqIyRQSk1MR
         Wb7u8leXZoaosH75rDWvxYJxAeQQjR4yVL0gw7Jc1Hfu3dL6tfErx5itGciIslAe1bew
         cOLCbXLq/5m90E25zCLHFtI9vbtsAPdbA0OCiYEMpf1BrkW8joGV7YX7bQHzlcxwFbqL
         S8jg==
X-Forwarded-Encrypted: i=1; AJvYcCXA5jHxUIIB5iA/YVjso7F6SHkKsyEcNFTXmSLxHqx0iKzRxo26+dvFjhPR0uuutrgA553ngKInUTQqRfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEoXMsSTZGlvsdKSvXhsJI3xHuyaxIfQWgyHtqc+u+JRn/VmTF
	nBYTSFK2GDa3DOTmZP+9iUj+XQCdeWZmhyZTKLNuLX3V3t4ekfZlevw+Rp1zrCxJXKkq3d2Dtbv
	DMK6WMS/FSB2NWNlbJJMBdurKlohDRrc4kf/0
X-Gm-Gg: ASbGncuiAGa1VxIKtLALjD+SCUaxUMWSloBUpNFK2t2wU0+P8ed6NYBe2q0LFTxpySK
	NOL/DRfO3A8NPf1vtlhaZTd6vSlo8EgK6v9eU9FLi58uM4HdnhQb1rP2q23UayT/+7kxkdFFo3W
	UJBujTxA47ffSuAojyrG0zuHaFqmrQP+sjFIREqT5d6nJ/iC6JYA==
X-Google-Smtp-Source: AGHT+IGNygGO9znp1dKmEYz6swuBx/QLlclRDdgG8tFuaCByAEaPQ6EozLi+aH6xuzZRKvwAbTyrzrlgJgAQz50dGjs=
X-Received: by 2002:aa7:cc12:0:b0:5e4:9ee2:afe1 with SMTP id
 4fb4d7f45d1cf-5f9132eb267mr189885a12.2.1746188937859; Fri, 02 May 2025
 05:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-tee-sizecheck-v1-1-5c3c25a2fa79@google.com> <20250501210158.5b2c86a7@pumpkin>
In-Reply-To: <20250501210158.5b2c86a7@pumpkin>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 May 2025 14:28:21 +0200
X-Gm-Features: ATxdqUGwos--eWIWeWH3S7H7Il3ChdLC4SH-nUgaQGqhNN79bE9tpFWmae02MWQ
Message-ID: <CAG48ez1DPWhT2dhd1iptFawWjteh_=pZ4M6Yq5KKCq2DTArnqw@mail.gmail.com>
Subject: Re: [PATCH] tee: Prevent size calculation wraparound on 32-bit kernels
To: David Laight <david.laight.linux@gmail.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@kernel.org>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 10:02=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Mon, 28 Apr 2025 15:06:43 +0200
> Jann Horn <jannh@google.com> wrote:
>
> > The current code around TEE_IOCTL_PARAM_SIZE() is a bit wrong on
> > 32-bit kernels: Multiplying a user-provided 32-bit value with the
> > size of a structure can wrap around on such platforms.
> >
> > Fix it by using saturating arithmetic for the size calculation.
>
> Why not just add a sanity check on 'num_params' after it is read.
> Max is 31 (1024-32)/32), but any sane limit will do because of
> the buf.buf_len test.

That would work, too. I don't know which way looks nicer.
