Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8C8205AD7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592852; cv=none; b=n6pG5lElqS2KlwmjsCoXYlvWVWR8OPzkpFbXDF8oJ+55KM5L9eXXBJHGKqvvZwOC+6ZrxKjqULHhKWRa7bqL0yVL46BZT/NRNMdBR1QUEv23r1WaUQdVmqEFiWxnF3HKFIX0/vnSyv4xImUU5hsPhBr+7mwcFHeuxMo3BbBfCgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592852; c=relaxed/simple;
	bh=XqrqN8nPpf+6rXqYVdfm+eKeYixj/LZaQPS9VpMMYhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuMdtfE5aGhkOHQEI9WCVA+0gt0Kdw67CEtkgj66qpAMJ8PPlmpCH7tqyWGEZtvJUrnlVV4XVYVFOCl8XKB6LPzo3AId4FUJCZxvMi5ayNJe29d2hcDqnOjeQp1dK41q8hrvPaEJjHMVjzCujbcCLGKEDw1kCdY9Wbf/JgWq4tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1WZxfi6; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1WZxfi6"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4774193fdffso102170181cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743592850; x=1744197650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJfI3KQNmYoBOgkvBWNQRM8I+8oVOhYb3y1OZGqHTSU=;
        b=N1WZxfi6yhxV8PDB1INe/Lj/0g+i3WeqmIYSlRgfSWVflsX+wrzLIuIlxc5l/jlX4+
         aaefAjmT6pIOJ1SDFnyOII4avnS44DjfDcET3AJ7i0A8SkzlnLTCLQw4mW+NUxHjhhoa
         HD992UzCya4zoGf4xDFtnbeSoIF8ACE7zlQ9UfcYEQCg6i6SosjHY7ao265CmO6Y0LOE
         hHqZBQmnQgboAbLQNzBlDtVFQKIrS0OQpSE+P4uJ3waJLIgC9WnwJl1RzDhbITLtag9k
         o2PPFVctJKKPonMW628JtyKkP1CXXMFVCkXSPcPp0883Z+86aqI+nfN76eFo27opaNdP
         hNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743592850; x=1744197650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJfI3KQNmYoBOgkvBWNQRM8I+8oVOhYb3y1OZGqHTSU=;
        b=t8YklnJ9USD6EtObcgD4KEGz1g3KMNWalYOSr+UBbXiKg2h5tA5BnwPAIsQImEAlbZ
         0JUnVgksXuwCXc1Vay2TUJXRDRqpvQc1dYfsjxx7VlkwrNm7WrWYVyD5FnBIvKPie5/Z
         E7vI+DNC1cAkL1SFYow6p3spVgRj5HStswgtjtATZjy3s+cSvvLbzCbnJ0TYOVknlz0J
         HukY6n3b569zePYPDu5RCCDjjI9fdowyHV/wpm9/KRLNeNECxBLkvZpYCf89ONfXZdC6
         FJnpY1MnaSzRJo2tEz8odEibPwK8b7XYBGLfTxyn5dM0Cs5yirTheSJwNLWWspEsN6ta
         qMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpVRVV8WmWH/Z/8cp8foIVZESK21SNnzUk0mUjvZM3AwwIobIYs26CQF2LedAfBZqMdEWHx/A5CK9fwsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLExKTlK5u8Y1K/2Nf0RL82FujqN5pThu7RIxDJuvl+nl0YqO
	aTSlUgfXn/A/FArwnHoIxeZg7y9YXyBZ+91IuE/M1yw1/okOGpNSYeEqBDiYns1s15QvmqOC1E9
	xb+D/JrRIY7xtz3kKG9YpULXwheM=
X-Gm-Gg: ASbGnctzgq0lIAV0JqznOceT4v8vIF/sWEmWg6INiITi8F5ph0IHKl3qEbLVgSPCuEs
	Xq+pg4Ex6JQwGSw/UDxpmW8wcf0ruw2T8ilnsiKycUnXxmJS0p3jZSaxSEYPa5y/qn14tbjJNml
	8gDxcY7IBh72pZr9OdyLDl7m1tyOC9os2R5rNMXRge2SAL1CYqHPmnWWbX
X-Google-Smtp-Source: AGHT+IEzgm5Sgg9rIS64YHPqyl2jwV0x2z9yc9P3o00P3nftXrs78z0AVxZhQ/agGkbhCI//FQWotOu233LqJ5pTtlU=
X-Received: by 2002:a05:622a:1882:b0:476:a03b:96e7 with SMTP id
 d75a77b69052e-477ed75eaebmr176911361cf.51.1743592850414; Wed, 02 Apr 2025
 04:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67eccb67.050a0220.dd435.b100@mx.google.com> <2025040207-unrelated-aflame-bf70@gregkh>
In-Reply-To: <2025040207-unrelated-aflame-bf70@gregkh>
From: Gabriel <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 07:20:39 -0400
X-Gm-Features: AQ5f1Jol1T8yZOWCn4FoGfuVLOh9GAvg71gMDfnVIX1f95n1Rnier_SWBdArHw0
Message-ID: <CAKUZ0zJ5pMYNxsM+h8MY9gxsnW=rFjBCBjEoK8k+cUdV+5rs_g@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	eamanu@riseup.net, linux-kernel@vger.kernel.org, 
	kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 2:15=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Apr 01, 2025 at 10:30:15PM -0700, gshahrouzi@gmail.com wrote:
> > >>From 3ffe31ac00fdfb94ffc521d8ab0fa60196e69c7a Mon Sep 17 00:00:00 200=
1
> > From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > Date: Wed, 2 Apr 2025 01:22:59 -0400
> > Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace
>
> Why is this here in the body of the email?  Please just use 'git
> send-email' to send the patch out.
I used git-format to generate the patch but then used a wacky method
(a python script that tried to do what git send does but worse) to
send the email instead of git send which attached the email header to
the email body. I'll switch to using git send-email.
>
> thanks,
>
> greg k-h
