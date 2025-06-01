Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2281537C8
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748770281; cv=none; b=FEQ7o3XOIXVMFS6Hb3o5vOkAbc2krhS4/RpWHQumK9WhuHdiWosuSCwRvy5pYl+SqA0A5EGUFFpmstGL3nelJpTj3t2zIhhwj+FRrVIfw5QYAuF609MLvAjp6OZENmnlZcMG5btvMUJUaL6q+xYSg5w+w0ykOrf2VDGowzjOLmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748770281; c=relaxed/simple;
	bh=cia7b5/pwiJRcIfZ5Pzs0Ic6wr5bXLhP5y8DFKuUFoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ps4lPlQu7UwcLXpXpSVZbSgdFKrkhKbthHFcw9RCOBZi0KjLnRnqvLrJKEWQZGgz/fcPfkCp5vkLldk7/7Q7QRoZMXPJfk0uypBEZ8//KJTBH4cJaPB7QNdMpoReJOSLgU48N/978eivvSQDGXOReASIUnH2GfitklXvnPknz+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XB7dCwHn; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB7dCwHn"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ff4faf858cso23422197b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748770279; x=1749375079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2XnIZlfqbuB02O2JRcDHPIrk01jX+E1tx8F/ogvGZA=;
        b=XB7dCwHnzRj1dX24CNuNm+Y179qZNbuLkTG8FnZ879At0OVg9TWFjbwifs1mpjMq7I
         oKIsjGbzZZaC1TlKcEbuUFuD/Xq3+VVnEsCP466y8USjARTeiQrAsxNFeQXVr1zJtcKJ
         vxlZeOxDzsbaBpZlJJKSVdrDDfWqiAV33nH/2FxRCquE7E4cBiue5ixwHy++N9vxyUBm
         /AQi359eF2C+U8BllKD+vm9Ke3rs0nP9aTw3aOuPjzPiN32qvTsCJLIp4c7zkM0RhV9r
         KHl+BkLzlbHB0Clk8lW2f4ONQI22gXvehhPjb6O/jXIhENn6Y7SOvR/65VOC/CVn8ftG
         3TNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748770279; x=1749375079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2XnIZlfqbuB02O2JRcDHPIrk01jX+E1tx8F/ogvGZA=;
        b=BIC7fZTx7m7lFEXMGoCI40bIwgby2y/X1aqLhqnXM1oxmzr2s2hOAF7O+hAPgbbi2z
         ViRKmIw9Reqvt6tZMrGZur3l1RYZrxbOh1v1gTBl5F8LEXA6J2LFzPC1jlKY2wsQ/Uqp
         nQb5nzZQCCVEiBQ+apkErfy6//EZpHH3xkSno+QXaUT1Mm5TFOdzGlGftZSNJoQRSlqA
         E79qq+oWOjC6TzqCivqDladoyN6cHO769vTxm8q2qmVgSu6w9BdLbpERXxuQ1BTXLS0A
         vHJPgY/eI8HUHde6lt0p2hPtzmJZISpMnGXeKd0HpLt4buwkowk8qZXajbWYLYq5e8CF
         XaOg==
X-Forwarded-Encrypted: i=1; AJvYcCW0uj0pw9g/O9iYjzaIv9hFzSAsd+1S5YGvvZVoojyWeBkcmMiMqL+vuKAGubnJNWcnS4SiAAh1keyw0S4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4GJUmjlJteVzP/AB2IHMI9tVvedHrz7U+//RW802xPpMuwdF
	TP7J4oppIuQGM1IdLYzf95A7ms09WSjNh53akHHtP9qRRvwCA2iJgs/NS8vvb/Yigxl95s6IxUJ
	BqkGPytU4YTQttj6HC0NZKcZJeeGt0TI=
X-Gm-Gg: ASbGnctWwR8yMXTQNWT4aPdfJYALldm3Qwx6Wnm4U3Gb9Y3GRhlyu6pdk/eYUpVexX3
	ciQc7bLoy2u5l+thXa+yJxu349zAn/S6ooHTGazE8dNHNb+Y4TM1MYFTpr39fRe7LcSnXEEPdkP
	ZfHRYRNztxwP9e5m2sIuP9qMGl1JpUKRvoX90bmkXbi/in4okYuEdLw8ggrBY9ihxPvg==
X-Google-Smtp-Source: AGHT+IEAVxxVpc52dXYXmYpF2W2KyGQQojuQC/tNyL+Jz/nubv7tptBH4Ky3KnPNhkTPSeL9J6BGRhHiNSfj1DyScu4=
X-Received: by 2002:a05:690c:884:b0:70e:2d77:3cfe with SMTP id
 00721157ae682-71097c34bb1mr62644577b3.2.1748770278556; Sun, 01 Jun 2025
 02:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
 <aDAvnmtgnssj7K5l@stanley.mountain>
In-Reply-To: <aDAvnmtgnssj7K5l@stanley.mountain>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Sun, 1 Jun 2025 15:01:07 +0530
X-Gm-Features: AX0GCFvrKlBcZktxRYZfmtgwWx5h5VXrJDETBQWkyQDAgoH4Jt5t3xNUgvl3A9M
Message-ID: <CAG+54DZC9ATaTme_WknauN5LVQRKut-ZJs8SAaZv8FbcQMCf7Q@mail.gmail.com>
Subject: Re: [PATCH] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,



On Fri, May 23, 2025 at 1:49=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Sat, May 17, 2025 at 09:11:30AM +0530, rujra wrote:
> > To ensuring that the firmware_tag is properly null-terminated. When
> > copying firmware tag strings to prevent buffer overflows and ensure
> > data integrity.
> >
> > The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE =3D 10 bytes, and=
 it
> > may or may not be NULL-terminated.
> > included in "greybus_firmware.h"
> >
> > changes has been made at 3 positions:
> > 1: update firmware tag
> > 2: backend update firmware tag
> > 3: backend update firmware tag with unipro
> >
> > Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>
> From doesn't match Signed-off-by line.
>
> The patch is corrupted and doesn't apply.  Read the two paragraphs of
> Documentation/process/email-clients.rst.
>
> This is a usespace program so I don't think it has a strscpy()
> function.  How did you compile this?

I mistakenly submitted the patch with a mismatched From: and
Signed-off-by: line. I=E2=80=99ll correct the author information from now
onwards patches by following the guidance in
Documentation/process/email-clients.rst.

Also, regarding the use of strscpy():
You're absolutely correct. It's a kernel-space function and not
available in user space. That call shouldn=E2=80=99t have been there. I=E2=
=80=99ll
replace it with a suitable userspace alternative, such as strncpy(),
as earlier it was.

Also I am not able to compile it properly. Will learn it the proper
way, as I have tried to compile it via turning ON the kernel
menuconfig for greybus support and
--- [*]"Greybus Firmware Download Class driver" then compiled it using
make and installed it, Also have not tested via "gcc -o firmware
firmware.c".
If you have any suggestions on how to compile or test this more
effectively, I would really appreciate your guidance.

Thank you so much for the feedback and review. Also sorry for my
delayed response.

regards,
Rujra Bhatt
