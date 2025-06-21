Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B3721CA1E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521608; cv=none; b=QivyV/CpdJRenNxpwi58HW3Lg/CYxFdNXJbQ9FbIrhhlvrTcVyhyXI0oUiuln7dO8DSFkcHNjOUBS4oNeSgFu5A7PiN3u9r4LJEldR+WcbfWlpalC8TCTWsUfOhPsaw+WAtjLUcqUEycGGV1H4r3bjIgHqFq3QbBfuGYjrDmSbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521608; c=relaxed/simple;
	bh=vA0QSK1KeicyQxIShk/QMcmQaXolIC30xQmvfQrKtMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlE60EELaBOlNf8LlfvvIrmIDrp1WbWp9xka6/9Vb9C5C/aY88Drb6xy85Bnhs0CkccyHArFBQDLdPdNyg/XNj6/ImN41SYSEmr3VJQ0PYf6jIBQHuFl7Y/rGryo7Bwb5d1mtm7CwpmOGLOSuhwkeLApBA3X8oLJ2Pq0sDmmUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bj5S5erv; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bj5S5erv"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adfb562266cso505417266b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750521604; x=1751126404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xz/8ZAV86533sQxzbWjhJtY7mloy1FEbrlqlVhWPNLQ=;
        b=bj5S5ervBzOeiXw8XT86QGYVyZH3O0i8nNyvu+wBX/ylF3UJ1A4nP34cICNV9nT5VM
         HhYCWygwtQT0hmENrizDAAIGvfENLWjSQQHqeMSRS8gD+owm7+jrH/2KN8nguu45eL4p
         hVDrm10ycEzd04aQgGXBF8Tx9DwIEZRIenTBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750521604; x=1751126404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xz/8ZAV86533sQxzbWjhJtY7mloy1FEbrlqlVhWPNLQ=;
        b=g4YYoxT7UnHq0pAdpyCDhGoem7aAnNNSUvqyMx+xk20mVmTPKnVJtpWx+PtbHg1ikJ
         v/LcyWW1XCRqW0Z1plh2eXI2LX+T4tWoES5KlCrY8Z0VWRoBlkSnRkR6N+gBF1NDb4fa
         gImmklvZI3b0jgQCAk27uB3R7ds28X7LUSK1WiF4OBcYWsvpNIDL6TeOJHXvo9CmsljN
         sr1RRtCZZQ8FDFJKvtXUOKy0xhNJk/SkpNEUW9KS8wJUndiqvP+cmGvsGXh+J2N+KvYZ
         cCVI6utJsG5ERNzQ0Azl8vSj2lyVI/osRYfIxqpx/PiKerrMDT/d7N2W3gHiAflGvO/c
         8EWw==
X-Forwarded-Encrypted: i=1; AJvYcCXFCFLUdvD4nYTFcJ2auUz/IezsU8eYWzPyeiPkad/36aLnbwxFcq/HzvQLwj9NZ4Uy+DGc3IRvMUzPkmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUPGdIk27MSNprtspKb54Qi+CIfiAlkQdfhB1UHJnOCscsdU/u
	GO0iUW800S5Si4mxvetr08bvfaHUB+8u0FdwLZa4+ep6Kzig7yQV6C1vZoIfqNi2PL9s45r8/t6
	c8XoMKlM=
X-Gm-Gg: ASbGnctWFQyXg0TPsGfnlNa/OaAwpdv0iZnCVoUlDg4FsCtUhXEp52s3WwQ6FonF5v/
	koj7xAv0isXN9D4UndEqHo/efifOkXi/ngzKd+nIbWArBMf4SB5A6B+Kd2SsPFvMHJsIkqrLod8
	wYeqAwcxGjOLADdFnvvszINM6+ZDLN4exiAgDb3grxlRh3epiX/kUugkk34Di/hj1ofiQd1boX5
	DsoZTVjv2l08pBwQeRWu8++rS9zFjpFWyrv6AfI6LBU2kYHhxRD4o7GCVyuYAN9DtYrUE0Ydsd9
	mkGalrcrcF2z21B+cgLger7eNxzJK7geIHAckOLImXLVUgI5S8hW73jnlCsHWwVoIwTBJJmzM3R
	DLYntGC5ZdR7jzmeD0NTW1ZV+yy4FcA7wgzCULFbS38+g5w4=
X-Google-Smtp-Source: AGHT+IGfBXFH2IihWIJaLnb83eE6eX2RUaJd0fTxs9cUtzLSLtCzfGczixUeMoHnv1yffZ8ArbwXtA==
X-Received: by 2002:a17:907:86a2:b0:ad8:9a3b:b26e with SMTP id a640c23a62f3a-ae057c8d395mr642365366b.56.1750521604530;
        Sat, 21 Jun 2025 09:00:04 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cbcc93sm3298194a12.65.2025.06.21.09.00.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 09:00:03 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so4223808a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:00:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKOuwVMtuZoukKEJg8IwCVqDw5g1eWgjYfbF7IsUs2P0zWVhDDHr2HXeYtcHNov7Jugfk/4Tc/6Mkrtpo=@vger.kernel.org
X-Received: by 2002:a17:907:7e83:b0:ad8:9b5d:2c16 with SMTP id
 a640c23a62f3a-ae05792920amr653605166b.11.1750521602901; Sat, 21 Jun 2025
 09:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
 <241b0829-5fec-4d88-866a-ba59e2ca748e@roeck-us.net> <CAHk-=whDM950+cCgmNH2edB2edCaktdpvBLGjFESAZfYZ3ZpRQ@mail.gmail.com>
 <mafs08qlluuvj.fsf@kernel.org>
In-Reply-To: <mafs08qlluuvj.fsf@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 21 Jun 2025 08:59:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjYB7tvFoqsL3aED9YZ2eusi9dMc=ckPzF-dnrRsERBUA@mail.gmail.com>
X-Gm-Features: AX0GCFtqZPL6sV-pjr-AoLVeC0UOlaCNnYfAb1q1LdYNt2lsDAMr6Kl6332N8Hg
Message-ID: <CAHk-=wjYB7tvFoqsL3aED9YZ2eusi9dMc=ckPzF-dnrRsERBUA@mail.gmail.com>
Subject: Re: Linux 6.16-rc1
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Jun 2025 at 05:44, Pratyush Yadav <pratyush@kernel.org> wrote:
>
> I don't have much idea of how people use qemu for testing, but since you
> say this is important for testing workloads, I can take a deeper dive
> next week and have an answer by -rc4.

Thanks. I'm not sure *how* important this is, but if it affects
Guenter's test coverage, I assume it affects others too.

But it's not entirely clear how much it *does* affect Guenter. He says
five failed tests, but those are all accounted for by the master
device thing.

Guenter, maybe you can clarify?

             Linus
