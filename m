Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B4A220F27
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463396; cv=none; b=YrqY7agalpZlDQv269UL93kcJXz7InyDTMwWyUBqWvZDayoOzvD7GdqHwuPLaI3SHV6oaFRdB5wreHdFNxPkVJJWF0g4eKNSXz+gElA9PsTWMl62WMSxxZsjh12hLgZgoe4Yza/6ZhVVbkrvL4DqMvtW9QtkOk5F7e3ZC6Kf/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463396; c=relaxed/simple;
	bh=LZcbrYMWjl7rCmnKTWkpUvLhbC2EmiJSa/uslHoWZhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoLAAtGWyBwNRhc0pRbwud4Si2QqPa/sP9kVuhSv8/fVf/M89SOpE6f4oPdeA+PHFQ/yYlOnQlvahecaxmE3pEgMJAIwK0LwasE8ZzQgPDWqjIVdXA8CNDCgqDKdfSA81svSRlZEuBXo1TRJ6ovIRnQBxmUNvwNYB31AiVAZmRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KWZ2M/Rx; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KWZ2M/Rx"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so238325a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1748463394; x=1749068194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlflE3W2a3akeMQBqgUqFu0YqDFCnqAH8aHLfP8pyks=;
        b=KWZ2M/Rxv3F55ZHGhY6Upr7KI/hDP7AYLHARdFiY0BV/jzvR85UT1SLsfaP4BpPfmv
         BLSjgNJ+QbDzs3u+GQ7u5DvZWiLxTuOLIwb8oyAXTI6rKmdupQsGmEuyKUv8DYSa4daX
         OgqM7+H0RN/aCuNYaACa0AiyINjWiugp3u92WRGMa65vZ3EpDA31jtIGkDjsNhRLGvm/
         RjsB+ylW4z6IHL/mB8Q/n8N+IM6l//1HppVrAF/JqESZDWhfcOhv4o9JcNm4Ni1zFKMM
         iJ3jZX7sEUeqZouhOfsitnNU99JP0dlvEP/h+KUdotbyPD/NHpApF/Fc/s+0UWVfgeOn
         RfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463394; x=1749068194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlflE3W2a3akeMQBqgUqFu0YqDFCnqAH8aHLfP8pyks=;
        b=Gz55m53y24v0IUlqc9JT6s1XHbVioozyeqnofNAS2UBCgSVOA4SySYtt53Bj4g3Y2c
         K0M72r0elTGIzE3SMrFV6lxyjIn2N6xcnjM2ufB+GA+IEDNh2onKwY18aIqpeUPe+XmK
         WiWFercyRtI36xf0FgvN9qb7o9eM/OYPlBGTQspVYjymvkbPza9q2W9rPvoR1j9v6GNy
         3Tv/tzwGLGbSYe6KGrFBPu1vfhTZw6a05/pgjZ8+PjkugRne9gKA+wz30ksgJ51KCVwB
         Mn6JDpb8NQqJ3nHbFPbqTluOtTmKtwhxRyI+8M0uP6HHC1uMN49umt/3DjIrod4fS1me
         6ofg==
X-Forwarded-Encrypted: i=1; AJvYcCWbInmDyu5/Nk2ijzJ7cerMrkSfFssNnFSJBhDvxYiFhK3IZMxokzVrKr89W7Dd5tKGye8xwAdvUHfrSQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFLknCMKuFgCLz0KpP1ikXDHdKfdwsDRcmVmuNPEajGOqrnEOn
	hGjkw/yWFdTAX/86mrDIwqXQ+ebem91uU15V4IRJC82dn6i5oT7xM3SPxka/Qod0/o5IBPSzNsw
	Ohn5YloBjBx7NLcWEYFqKUoI99hFExQhs5F5iKxJJ
X-Gm-Gg: ASbGncuV4hq1vLZouL+DrXWr2nqf2FP2xpUvIQfDOL2D0iJ6MbmXtf+N5T+3IYCkK3U
	OGwZtFgdV7TsGkTHhaZyviaghTrFCpGZc6ynyqrlhwwyHyOQzr9vRbk7m5qIzWaAv9AHYZEpd/l
	gyzkt12J9rDh+dRcLduRl2gucTnGelhO//zw==
X-Google-Smtp-Source: AGHT+IEbzD4dK8cOpUc/SPnSTr0/q9POJtIYt5FZDgdkw1rUB7DCCT7GF+7V1yqq0ARc9GyC7IdW4RGwpUbj5bwumgk=
X-Received: by 2002:a17:90b:2789:b0:311:baa0:89ce with SMTP id
 98e67ed59e1d1-311baa0945amr11939710a91.12.1748463394345; Wed, 28 May 2025
 13:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68351d36.a70a0220.253bc2.009d.GAE@google.com> <df01d028-cf41-49be-8f70-b512f57c5cc6@suse.com>
In-Reply-To: <df01d028-cf41-49be-8f70-b512f57c5cc6@suse.com>
From: Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 28 May 2025 16:16:17 -0400
X-Gm-Features: AX0GCFuOr2egM6jCm14HTPWnC_M2ECP58RsFUbSycoMBuK6T9yYYC7THb-xebpk
Message-ID: <CANsfzsQ7zSS2Usk3apniSvK-zfggRt-sjN-dYoLVr6+2EXtDog@mail.gmail.com>
Subject: Re: [syzbot] [usb?] WARNING in dtv5100_i2c_msg/usb_submit_urb
To: Oliver Neukum <oneukum@suse.com>
Cc: syzbot <syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com>, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 9:02=E2=80=AFAM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
> On 27.05.25 04:02, syzbot wrote:
>
> >
> > ------------[ cut here ]------------
> > usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> > WARNING: CPU: 0 PID: 5833 at drivers/usb/core/urb.c:413 usb_submit_urb+=
0x1112/0x1870 drivers/usb/core/urb.c:411
>
> [..]
> > Call Trace:
> >   <TASK>
> >   usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
> >   usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
> >   usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
> >   dtv5100_i2c_msg+0x250/0x330 drivers/media/usb/dvb-usb/dtv5100.c:60
> >   dtv5100_i2c_xfer+0x1a4/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:86
>
> Hi,
>
> these transfers are done via control transfers to endpoint 0.
> So this is not yet another one of those cases that a driver fails
> to verify that it operates on the intended hardware.
> I'd say that a driver can assume that endpoint 0 exists and is
> a control endpoint.
>
> But I am afraid we never check that. Should we?

That's not the problem here.  The problem is the same as in other USB
I2C drivers, and
Wolfgang Sang has been fixing them up one by one.  Namely, these
devices send I2C
messages as control transfers over ep0, and this doesn't work right
with the client asks
for a 0-length read transfer (since USB doesn't support 0-length read
control transfers,
only 0-length writes).

Alan Stern
