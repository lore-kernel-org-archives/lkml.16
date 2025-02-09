Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203D1DF25E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739137121; cv=none; b=MQUesdUxJOTn1FPdek79/3RtUPTMbV450QCu5P/QpMZW6SyXia8KSivslxtcT6XhygMLf7q4obuqAbyEr3YYNSXNDXu0rZzhDuUsBtp02lUSxj84RLPn63Mwag3ITg2JcXoBYo4OCJHwBa5eCyqPliZg4TPhyeAjgciBJNYo9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739137121; c=relaxed/simple;
	bh=6S1lUOrlLJQJSB6iy6z/54XwDRpdbSSEfGlk7fXrxlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNyKRbraQcV0QeAnB4gruwi1m0a7iMfBvT4wSLXGBu/SaKwQF1turExmjiwE9jjpMj9qSul3y1F5hoRKXNPTJPpJcY8C1ObCDP5MXhQ8JBnd8XkWaBtLoYY0ZeipZ1Hy23SIlo1XQHS8oHAyy8/NtXe7GdtnYuO0A4xWOvIuw+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IF3I8ERT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IF3I8ERT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab795ebaa02so353970666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 13:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739137118; x=1739741918; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=apWyvTC5cYpMp+QgVKPxMdVerUEMamXyfh1oLcq+CqU=;
        b=IF3I8ERTxE5F6yczKnGxjN6i+68og5CRu7lsb+Wt48+7fX7msjqNa6wU3do3O86H0q
         tGVfg2KeFjAmwRXFNy1K1I1+V+OmxtdjZXrDyaDunBYbB5yt9wUmvL9DvOSPHAszIDF7
         6LqWF9NObxOBUoj+qp8X8lQTUPAprQ51qAUrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739137118; x=1739741918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apWyvTC5cYpMp+QgVKPxMdVerUEMamXyfh1oLcq+CqU=;
        b=vjeZ48e5c1aekEm1JXJkKJRt3+m7H0Y6UV9q8oh6jUlSW2oKJ0wGhY0uxPxGrPp8Fe
         FKS2+06SMPZJsZmI8KYtKLxK5ozMPforIjD4JNK8yaPPJxn9IS0kBgu/SYi8DKNk1t5V
         jTvKraEnqvbXdBTyI44CFdOkrJdiuUwQMVD4FGY+74xm22JDkmfIHNYjX2Mipf5RGfI0
         wl8EqxOHezoSKj1vs+JZOx5tfWk3E2Z3R5IL3BlqonYqjRfmw6PzXQS6rdSkx2oCPeDt
         XbcsBdc+hkA9GVMFrTx19hAicRFI0Kv0bzOLKAs4Xn5Z0uqmqbnU/qiDE5SfzoKGi7h7
         mhCw==
X-Forwarded-Encrypted: i=1; AJvYcCWWiQrtLOA0/oX29e/i6ggkE5hC8DO8Rf0veiSFCETJ0qQoGXOGM5QKUzteX0qLW1/1v4W1mMjprXgKExU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcZk1sp1Dk5qgvysYCqXF9cBtTFdN0p2pxHbJk8CWpwNRzuoeJ
	VCw5asNacwVr+UbeirapOMz8dtLZGW0ryftYwb68ipHk3pqT5IjF5LReXuy0sN6lG4ajbGW9A29
	43b4=
X-Gm-Gg: ASbGncslyRGxNu4xQKaaECxCUDk/APZebFXXmtHTS/BFAkCv71XPwFs/dX7dWDTQZ1S
	RIYU402vdiHrwNs2xkukN349jxRpOfuVL2Euhw3gE+90s97pdYtWQGcb6WXYbC4vsRgixYoR7N2
	Npv2f6z2LHLrHorJE/vPr/ZNtTxHKc370BotQ4w1vyorW4p0hPdwG7HgfCjL3YSD2E4v9q3OU5d
	QVDZ3wh9tQ5WabEYTIsEstJ2hZE8sG7aDdUdCC3Yc78Ya4Fv6djWCpS+dVVRhc2DhQA0x2zCFs8
	e+vQwclefIh3ZcNo/BTCxXn99y89FC2CGmyirm2k/8X6+9nXw/hoP4eKeTees3Cnlw==
X-Google-Smtp-Source: AGHT+IG3C5lJrB6pPZgcDNl9C8tVwm++xgdYxcSK0B1C2bHcpofZgNzM6sfXab1BTzB191fHPAVByA==
X-Received: by 2002:a17:907:3e11:b0:aaf:117c:e929 with SMTP id a640c23a62f3a-ab789c7f273mr1105806866b.57.1739137117694;
        Sun, 09 Feb 2025 13:38:37 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f893e9sm748670466b.65.2025.02.09.13.38.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 13:38:37 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de64873d18so1850320a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 13:38:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViAjY1epcbfmGIWpkfmGBfxDW7r5w4B2fd5UVyrdZ0QbGJd7AVOSkFxLCQBKTHfgjlksI8DCi3ZELxrOc=@vger.kernel.org
X-Received: by 2002:a05:6402:2084:b0:5dc:7fbe:730a with SMTP id
 4fb4d7f45d1cf-5de44e5fdb7mr12452558a12.0.1739137116607; Sun, 09 Feb 2025
 13:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209105600.3388-1-david.laight.linux@gmail.com>
 <20250209105600.3388-2-david.laight.linux@gmail.com> <CAHk-=wgu0B+9ZSmXaL6EyYQyDsWRGZv48jRGKJMphpO4bNiu_A@mail.gmail.com>
 <20250209194756.4cd45e12@pumpkin> <CAHk-=wisZo7+-xmC_o8GQJ-G0qFp4u29t_FkjgPvgq7FXaTyDg@mail.gmail.com>
 <20250209211805.5fc2e9e4@pumpkin>
In-Reply-To: <20250209211805.5fc2e9e4@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 13:38:20 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjGYtJOrgrjXF6zceePOp5G_F7VTfikjdGOsJ3eqsyfJg@mail.gmail.com>
X-Gm-Features: AWEUYZnNAzSZJAGV2yu2h4_mOX5H8DgW7QZAQnW2C_BR_FTN8wyLPiijB4-v5YI
Message-ID: <CAHk-=wjGYtJOrgrjXF6zceePOp5G_F7VTfikjdGOsJ3eqsyfJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] uaccess: Simplify code pattern for masked user copies
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 13:18, David Laight <david.laight.linux@gmail.com> wrote:
>
> Except for the ppc? case which needs the size to open a bounded window.

It passes the size down, but I didn't actually see it *use* the size
anywhere outside of the actual range check.

So it has code like

  static __always_inline void allow_user_access(void __user *to, const
void __user *from,
                                              u32 size, unsigned long dir)
  {
        BUILD_BUG_ON(!__builtin_constant_p(dir));

        if (!(dir & KUAP_WRITE))
                return;

        current->thread.kuap = (__force u32)to;
        uaccess_begin_32s((__force u32)to);
  }

but notice how the size is basically not an issue. Same for the 8xx case:

  static __always_inline void allow_user_access(void __user *to, const
void __user *from,
                                              unsigned long size,
unsigned long dir)
  {
        uaccess_begin_8xx(MD_APG_INIT);
  }

or the booke case:

  static __always_inline void allow_user_access(void __user *to, const
void __user *from,
                                              unsigned long size,
unsigned long dir)
  {
        uaccess_begin_booke(current->thread.pid);
  }

but admittedly this is all a maze of small helper functions calling
each other, so I might have missed some path.

             Linus
