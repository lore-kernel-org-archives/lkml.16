Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B701D934D
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 18:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739126784; cv=none; b=li2ONoe9QFycaSH9imkdfu8PhJ1i8gY9tE2Qr6vCDuU8YxNme7VG6rijecFSNH7+uH9zSIN5V9KAoUqqns/Q13FUqVBrIGVD/ZUYsqjoYAAlRn5eAZABKrp0h6f9cOh4OIH1KWlYXjOXxJzWH9QNDxVsV0mQI+0GqGGxXyfhBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739126784; c=relaxed/simple;
	bh=Z0exPwYpyB309Go0LJdY5JTDAMje5GwGG3TVn8LyKTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drlzQxJPzdjtW/+ZoFLGwP5xV+V4j5ETTurcTC33xVtkx+IvnUEEw2PsdeGDxixFvHmewz5Tp9FyKU6DwIaqMUSEZ5rY2WrBhcIOGABkPs6JbeY2pZHdb7Ctbr0/Rz6QknnmuN0Ljaf7f0fObEvM/tx0p4CwWfZSY1CjGI/UrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=c45SxwBR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="c45SxwBR"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa68b513abcso700079466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739126781; x=1739731581; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=299OX1xBTdJBPWgTGDe6mblBfhAuT0bmyryb6qbXkF0=;
        b=c45SxwBRlxbUxEzSqWlcn0vcqS9BB2XZtcgBA8G9XJqfkOu1ZMqz34LQuzFlvpBJGJ
         SpdbcS+AwaoizCSGiD1w6QQpQS01o5LGs+UUwUWX1AMl/rRbtiAXuj5lpycvG+n6gdnU
         xoq1jzwGy081zLVGqj8yHxIInW+yNBBkz339Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739126781; x=1739731581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=299OX1xBTdJBPWgTGDe6mblBfhAuT0bmyryb6qbXkF0=;
        b=jBoiSvrK+eIPOhblhvtiSHy4ICo47/GXdh46MM8hBFXKUwpyuPomXC+ES3cnr66L7C
         7RfPH8x4fa2RTP5c0RqaAckOlRbeibU1uGp5tWr8PCGpaHqC4wB72HmYl/ScwMaK8xVQ
         EPx0aFlO6HUv9c+rLJFmYTWL9svA0FQELFB6P9DYS5fnssLVtu6J/y/3S8lCT4irtrma
         tqrOFPlm5J6yiPjnzsR7I6BgBIXIDQxlI+Sd1flvtCWraFd1wDnvlMlxhZxI6g4hoZux
         DdAIdnx/7OPdQL14XsVpczAhrJjINIPvk1yXOeBmOdi9lodurUxBpgfwVTUzsKpNR2Ye
         C4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB3d98f6Fo8Ta8ZOBkgdJ+5p1ANU78/cpe5a8A21terGkojjdTvMqZvh81P47YE2vEH3ya2Yp+1Cc8MBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84BLLRmEgUWoQHDQbpeYZ3yO1x2q42WlK9fxGaknNnPnRKJve
	hFd4I87/YDEOAMda10bHjUf5RoryuvH003LvtthmczBgoOEBpbv15YISTCqregGQQPJrb3ItY6I
	LP/g=
X-Gm-Gg: ASbGnctZZTjkEkGmwu4cjDcXaae3QMOHyl8WsCqeYmengBKq8wnphAstd74eR8i0faN
	RUBGAFYThZhfQKjSJ8S2OQitP3DDz0OzmIOwQHHOZiYH098w3sXOCW0uvTX+SB4ZPUTCKGdjJ4c
	BNyJKC4A39rV52QOnnNJJBHtdv+o/hAVY2T6L6KYHtF8dBKhMjG82NYEeARcf8wP2V/6x0APdkt
	zNE108NVp3ifTdZirskhb92jIhMrMOA7+Kp9cKsd75tWeHDzoUGXBR8PwsXSotBEsHeJizsnZTl
	LlydbrxHOdJtS+jML/DSe+a84pVj+PkrwUfdTSBKIXo5iX8vby1ICf59T8b1UYq0uA==
X-Google-Smtp-Source: AGHT+IH8c18EQsta2qVVi29rwU9dKfMMtPKzT4jLUP+LWZQl6TFcgT9NFEEhHoCFVjl6qOh/Y6H1/g==
X-Received: by 2002:a17:907:6d1e:b0:aa6:a7ef:7f1f with SMTP id a640c23a62f3a-ab789aed651mr1349220066b.11.1739126780791;
        Sun, 09 Feb 2025 10:46:20 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f843b4sm709395966b.42.2025.02.09.10.46.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 10:46:20 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaec111762bso897311166b.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 10:46:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV95B9qbzcTEfL9vU16yNocNg+HfDPtMWDcqabfYNhLgde1Yz/lWs0DibNoCNsgfGUMK20JtfCdHIDYfAQ=@vger.kernel.org
X-Received: by 2002:a17:907:9726:b0:ab7:5b58:f467 with SMTP id
 a640c23a62f3a-ab789c629ffmr1156201866b.40.1739126779662; Sun, 09 Feb 2025
 10:46:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209105600.3388-1-david.laight.linux@gmail.com>
 <20250209105600.3388-2-david.laight.linux@gmail.com> <CAHk-=wgu0B+9ZSmXaL6EyYQyDsWRGZv48jRGKJMphpO4bNiu_A@mail.gmail.com>
 <20250209183437.340dcee6@pumpkin> <CAHk-=wgkEDmf7V+F5jP6On3=pEewRYGbZyvs1E3K-3n3HYr4=Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgkEDmf7V+F5jP6On3=pEewRYGbZyvs1E3K-3n3HYr4=Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 10:46:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjv5x4ee-nKLfwoYwgJ9OqBkd+wqGn-dgWpHdpA2oZqqw@mail.gmail.com>
X-Gm-Features: AWEUYZmY_webv9q8a6uZQUIkEL63ugKdCcPkMcgteGn1w1zExAU2n4DAjnsukHg
Message-ID: <CAHk-=wjv5x4ee-nKLfwoYwgJ9OqBkd+wqGn-dgWpHdpA2oZqqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] uaccess: Simplify code pattern for masked user copies
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 10:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It's *really* easy to miss the "oh, that changes X" when the only
> little tiny sign of it is that "&" character inside the argument list,
> and then the *normal* mental model is that arguments are arguments
> *to* the function, not returns *from* the function.

While I'm ranting, this is just another case of "C++ really got this
very very wrong".

C++ made pass-by-reference really easy, and removed the need for even
that tiny marker in the caller.

So then you really can't even visually see that "oh, that call changes
its argument", and have to just know.

              Linus
