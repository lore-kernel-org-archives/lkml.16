Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE625E803
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820190; cv=none; b=Tb9C13jO7dduOCTbfFsGiEjfie4YjlJR8S6swS/LWuLFYZ1gfXlAiT/q9/EGkXj+ROFM86g+5r4Edi7ikaQqM2M2Y9kRBXlMZeA4X9kjuVYJBKJwSov5OmlWbz/cig4ALep9/XSbZz9rQBzo0mN23Msn+nexBLVb655cBDf5+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820190; c=relaxed/simple;
	bh=1rA9pbfysAAOSkTPIe3jUXA8b4w6+NvzgE9EF461Tqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcFWS88boEy3j2HdD1FJSFtbsVizs2mNVjVsOMWEUnviQQ1nKjao/y5C/Xo9pQIirvzPh6NvuRTsTLeYnKFNbyYDBZJKhTgnXNG9NPRjKUlEzDjW15SoJdARrO7a9hHqUfMBkVRT2LZHVJAb6EMd8Y182oR6/seOdwocTaL+j/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uh9YRwvQ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uh9YRwvQ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-326c38c7346so10706721fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746820187; x=1747424987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkthMC5pBUBIR79/LBRxLxQk8eX8NXVvH63MQzRTefg=;
        b=uh9YRwvQevERrpxkl5HjDmM5I3Pm+1+uoE+UY5h86bsrZ6JW1yu5dTMtE7ihXjRsUM
         iO5HgFOuRuF+qEMs/UJyV+sqxOgF6+hrLHXVTya+0hx7VEPVH6JqIa//k0X92Z53uTcZ
         w+vBwftw4tcTPX/U3i05ief208NcZP2fiaoOLZnKwyf6j01e41LWLHLXtHuFrmZ/T8Jk
         G9t3EPXboINBtmQHPGjEqLedwwvcInMHt4c+qnUZwBfa1yLJp6sHB2HeANNRjOQp/dZ6
         zfY4yw/6047AwvHU7b6BW8xVasl6SsTSUwOD17Lx/hTUooIAFCVDvkeb4rYQIXvrgFqQ
         smVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820187; x=1747424987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkthMC5pBUBIR79/LBRxLxQk8eX8NXVvH63MQzRTefg=;
        b=lUIrLBaPquLZyrsqVGZdKKs7nQSYcuDsTNbOY8nW/cD0GQQJm5Ql3fxAFDgZdr1sU/
         xiCf9WtWctQHa01uSFGK9ZP/vZZOuxAb4RdrP98p7wbY6qEVf2fkS12/Nuv7aktvxmtb
         t+VeQVyq7dRjqzWTJcJcRKZdgldyswgaEZ24C1bAR5uNG7UILxqod3wbdU/HD+qARWAM
         lAYE+7Xi6OOljVlr3tVY2F9PEfefq9jarqoW0Wiv7wHPnTMg+LPDVddShNNTdrQmv8sg
         uClxRKMfticrpi9/JwIAHwA0EFcP8Zy8NU86TFTdrWNzthTat2rCpFG8qzk46fg1RpVp
         6JhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+dcRCXKffNn+hddd47SDD8u3ykM14Kmna2X9RfEaJmvDD+nahPawUWAE8R7GpOYeYuSbGfASvHRj3BV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDQiBg0vlBRhjeU4SJZmzf0OLJpPFXW9PQnfEh194TmjjUoEYa
	U2S1CIMxhXAPM9zl1egpC2PlV3MZ14ZktrOYLdY3M1u5MhiCbudDxNTV3DiBdV7GHbk0O61oyuc
	Gd1VrItcFeHTs7o1ai9e3wTkCE1rfrj3gnWM=
X-Gm-Gg: ASbGncs/GkJDyCT5UdlNToIw1eISBXuzWY4laViJl9E1pLuJzqyj2Tg3uZE80M5nqbD
	OXtjtQc4VgpyTZruaYoWazL46dNxIOqZ6Py6AA6gy4j0RKsdRCdE4jCmRrxadgF7EZ2dFaMR71K
	wjjGgRX8HwLbbwFkuH079l/l/A+tqCfIRF9y+uPyx6HnRQ4Ers4nAzkI2PMv4Dpw==
X-Google-Smtp-Source: AGHT+IHPs26+8qFhVtt6rZfT7v/Bj66W+Ybf4tWa/b7HJYYLuKMLmrjqmiqMxjNh9pAHElOQjonw6ASbF4xImhWCv4k=
X-Received: by 2002:a05:651c:a11:b0:30b:efa5:69a8 with SMTP id
 38308e7fff4ca-326c463040cmr20036911fa.36.1746820186572; Fri, 09 May 2025
 12:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4a6f1494-c6fe-4f66-a376-b6389538ef9f@kenogo.org>
 <CANDhNCpQLN0j5KBp9OB4LB-YJGCCexFG+v5Zax2wwBn-3Tv3Tw@mail.gmail.com> <e598eaa0-3b3b-4c16-9d7c-ff35dd150baa@kenogo.org>
In-Reply-To: <e598eaa0-3b3b-4c16-9d7c-ff35dd150baa@kenogo.org>
From: John Stultz <jstultz@google.com>
Date: Fri, 9 May 2025 12:49:33 -0700
X-Gm-Features: ATxdqUFM3jdhUduGCOy3rmkCdz8pD3rptDlYC-bziHAuPHBQNUk1lFo4l4HWQ74
Message-ID: <CANDhNCqZRZPE=s5q+K2-jKJnBycAxXBJH_mUmC1d+jWEvOPGZA@mail.gmail.com>
Subject: Re: ntp: Adjustment of time_maxerror with 500ppm instead of 15ppm
To: Keno Goertz <contact@kenogo.org>
Cc: tglx@linutronix.de, zippel@linux-m68k.org, linux-kernel@vger.kernel.org, 
	Miroslav Lichvar <mlichvar@redhat.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 12:40=E2=80=AFPM Keno Goertz <contact@kenogo.org> wr=
ote:
> On 5/8/25 21:45, John Stultz wrote:
> > Have you tried a patch introducing PHI (likely setting it to 15000 as
> > MAXFREQ is represented as nsec/sec) and using it instead of MAXFREQ in
> > the calculation? Do you see any behavioral change in fixing it, or is
> > this just a reporting  correctness issue?
>
> I haven't tried a patch, but I couldn't find any place in the kernel
> itself that uses time_maxerror.  So I wouldn't expect behavioral changes
> within the kernel.  Of course, user space applications may depend on the
> values returned by the adjtimex system call.

Agreed. Established userspace expectations (of the current behavior)
are what I'm worried about.

> In fact, I only noticed this behavior in the first place because I am
> writing a distributed time-stamping program and the maxerror reported by
> libc's ntp_gettime (which calls adjtimex on Linux) just felt way too larg=
e.
>
> I'm curious to hear what Miroslav might know about other user space
> applications that take an interest in this value.

It might be good to share a kernel patch so that folks can test such a
change as well.

thanks
-john
