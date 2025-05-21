Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47990199EAF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816745; cv=none; b=R0FnGpcT6zdAI1zUiBHNSGU4P82rBK4KYAtFJvOAhWX47iFALGwopDGd44tfH0OK/TMHtd6Y2opBbruJWDGCPhsoUcBv+21wuE3NTsPQTHTrJQy4COR73qttknUduoHaUjYDz9Kn+uo7TCUGSX1m+Ft2jATm+S/F3DyN2O/EkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816745; c=relaxed/simple;
	bh=ZrHnJ8tLnjK5oeQd5nHc+q9YJwBlpF7SD3M/7pIX/7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4ZGYuHotmSIwURu5OT0n471oXVOBxJSrD9A/So8vGuoyIUiArjS+dxAY/tMhfWr2I92oGgDSbTtNH6vl7JWbhyW2kRX9tsGrkvNB2gExRfw/LVU5e9i7NH+G8OBDRGRihCGFWtic8XH3x31sDNvz7a2/qJ7b4owCCTbUU+Kda4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6+zkbI1; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6+zkbI1"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7086dcab64bso60939637b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747816743; x=1748421543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlxLaOezJ54RMifNGPJT90Ch1a3hAKhBD04YGfXVM6I=;
        b=F6+zkbI1W1lzvf/5n29Wq9oM16ByxdkcQYGuyYgEHvnyopL36zZCNnwn7E//FNLvCA
         yHXYXfAyHb3M2V+Gw+djxVDluqnPCtt4oSqKpQ+Ge9xpzigx3w3FgyoEow7NOgW5vPiM
         CyClDXJNPqgM6uEFhSi9/ugxGBE04FhS+5A3nFpf8vqbuUKrQPDysgEjCfs/FZ82yrzr
         hkSjqXmWRbw/9X9caOL8ORrRSScbEFrlbdYTHiXkbRlPGK++EwPdFr50eZXxeJ54moGp
         ob4kUh3kKdaSPw7mZfBSCdXkSHGeY75bCBFK+mkQFXB5STGD+Xd9dXtbkNtuTrt3jwOj
         twxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816743; x=1748421543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlxLaOezJ54RMifNGPJT90Ch1a3hAKhBD04YGfXVM6I=;
        b=fbQtLfO0ttmD9hwUWw0i+d7ZwtVoPfRyvC48F2W098rPkGlzyCKRVgj9JMPUvI4b3Q
         7gaJSiH9T4rMrKNN7qj1dUTLGlnOJhkeM7nzJX3yEZpFhz1dZADSnPSNsWWGrS9W/QEQ
         eRTe0faugSPxc4KjKhW84Ft8VRTG5vepqpYPGvQvC42wImmpAyBBySf5Mabxt27voEeY
         wNTsDf1WTYY9rvYjv5E5BYU6bienDV7QwPz7VyHTBe9n/GuYFTEuKXOa5doePecpuhuV
         Bnzb0GgC052WF/OpyMxlO36IDgTm998+ZMv6r8FuGpSPZc3wP420YXv/Ont6LM708lKd
         4iSA==
X-Forwarded-Encrypted: i=1; AJvYcCU25ZEdVdmudJVYg7pge1Xv6Lj1ZcdgWGL1LG3ETpgJ41QTyQrU8LGELqx5oJNtEnBc7odGJ2TotQBm9L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XvXyd3RU5JQu1+bcgvyPvBSKQeXeJD5YREn5TKwU9rx2Yn5z
	B02NylGsdAnrx0/NGzu2zCcPp0t6eukftlFKKqc8jgICzae04yNFFNuCEk+QhCVZLzVRji9SggB
	b0Tri4OphOG2+4bGQl4jMwJTfN/0ophg=
X-Gm-Gg: ASbGncvQmnTxqBb22fy7JEjsLFs0Zr0imFfUyo3Q0asoEw62Ka1AniHcUWgyfZJZD4b
	q2pNEcGluisCzxnC157+FbfBIudLc/FogoQlJY7LSPlntmUrQOvcbWFV4/QGwyDBpL3pxi09M7W
	jnFIYDcM7GtkN8yuIug3N7A6Y8P8A2NT7zOs+SPRp6xnVO5yf+c5FfMdpK+LkKr/ovYA==
X-Google-Smtp-Source: AGHT+IGn1ic8/qU3MsjWAq3GBfIPqaxt/z4IAGrqjkiBpwB9quqh6qpru5pVvB2n0NZEUTIDlvgIJbb6/9KsnN95NN4=
X-Received: by 2002:a05:690c:3610:b0:70d:fd2a:1457 with SMTP id
 00721157ae682-70dfd2a14dbmr3227307b3.1.1747816743190; Wed, 21 May 2025
 01:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aC2ILNV6xgt11KuN@brak3r-Ubuntu> <2025052142-maturing-earthworm-cb31@gregkh>
In-Reply-To: <2025052142-maturing-earthworm-cb31@gregkh>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 14:08:52 +0530
X-Gm-Features: AX0GCFt73yT51gJAn-US9CzR9fBeYpCj9Uj81PJZLSTvmlHCr2-bT7uYTz3V5X0
Message-ID: <CAG+54DZWjN3ii-JCOME8XdA1B+5yCmRSo0-wqTv+zt5w6UcEVA@mail.gmail.com>
Subject: Re: [PATCH RESEND] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 09:06:00AM +0200, Greg KH wrote:
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>
> A: No.
> Q: Should I include quotations after my reply?
>
>
> http://daringfireball.net/2007/07/on_top
>
> On Wed, May 21, 2025 at 11:11:26AM +0530, rujra wrote:
> > Hi greg,
> >
> > why is this a RESEND ?:
> >
> > >> I had sent the same patch 4 days ago and didn't get any reply , henc=
e tried to resend the same patch for the same,
> > here is earlier mail :
> > https://mail.google.com/mail/u/1/?ik=3Df63b03515e&view=3Dom&permmsgid=
=3Dmsg-a:s:12290863930259651721
>
> That is a link to _your_ account, not a public record of your email :(
>
> > ,
> >
> > line does not match this:
> > >> sorry , i could not get it what it is exactly ?, if possible can you=
 share some insights or example so that from in future i would get it right=
.
>
> Your "From:" line in your email does not match with the signed-off-by
> line.

This has been addressed successfully, Kindly preview it.

is this the way correct about the reply email ? , kindly let me know as I
have tried to get more and more answers and solved issues, and thank you
so much for your guidance and will be keep in mind about the process and wi=
ll
not fail next time onwards.

thank you,
regards,
Rujra Bhatt

On Wed, May 21, 2025 at 2:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, May 21, 2025 at 01:30:44PM +0530, Rujra Bhatt wrote:
>
> <snip>
>
> For some reason you sent this only to me, which is a bit rude to
> everyone else on the mailing list.  I'll be glad to respond if you
> resend it to everyone.
>
> thanks,
>
> greg k-h
