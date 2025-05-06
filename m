Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A70252282
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746552900; cv=none; b=jGHvJOR1TjN9D91YqxAuZcJGJ3ZP7PiFhK8tm1tW/kx6Rk8jXYH5gUaA4HAFVIx2zhb4BiFitpX4TszAAh7MeZKME7CNE4EXBxPFRu4ru7S+0b/FlbVQRSRJMB5nyVp33Bskqevsyb3twXkPw00Gcdzz9rkTFdj4kwSClZGEDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746552900; c=relaxed/simple;
	bh=cPOoBd0pByolj9VOBVqEdixwbpjtZCL/W9IxmU1eVOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrBJPvR0RAQ5PxJldfv6UkKzbGMXgvZCxDZdldcEJVQM6glFLcimjuszHIxmWpHZ1vSRW4VvZ1phNQobCIsc/yGD2X6WKjLzki/VXqdIe2IKtCbwR1GDga1NaPKPjqNTqKlWUKVW0gR9eK/N9yVJ6wuNhpvrX22gCnh96duS1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bl0CJoab; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bl0CJoab"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549967c72bcso7275745e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746552886; x=1747157686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW/RFipIDDDA2IOVhwNsjzZgUtj+I9IKWcWxXFBsNF8=;
        b=bl0CJoab88BZ4TtxAXP3ZC3kWydU1YegSCjyONo6g2Nhs4Ua2p0+py5MoIahekWuLs
         /CBoCuTXW7zZAGj8SM0F0z5V83pJEpAVnrTwvwdnLSq8AxJ9u/aax+Ip8pj09sXbsPNV
         huhPHQklDO5FlcLjbNnpxsRqMcG6dj0t2GHE7IfFNxKg8TNsqM2/ALxdH1HEoazQgKAA
         m+xn9dFvNdTaaa8yBha7+XukC7U803X09JLplbWFFlvPUnhc7U1xhx92z4takhe53cwU
         SeHNVPFdNbxfFPdoPgCfp0pvZR5PdhbPFZmSC+ChHrFIR9fWvR9/ddqYaAqhPCJ8pHT3
         WVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552887; x=1747157687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hW/RFipIDDDA2IOVhwNsjzZgUtj+I9IKWcWxXFBsNF8=;
        b=KNG7f7joAi5y44bnMkj6+EOr276xgnFjIIBTHIwumkdS/gR34RCVaPymh5C+vCbwjd
         n/UANWrg1gEHnyClNHM+lNdFEKJSI8eS0Bq93ZsFH47KyriwqSO4eAw+TovY7QEa8vPc
         GiImNigLbXzAdEClGL/m+zapZfT8nffeLRHxvNshsDtObdb5yscNXQhPzsPQJ9EijvWF
         GIEzrLTojAsOnVtT4Ngs9fFd03gpPVMHY6ViusM1XWR6K38PFlHa87UgvpkeLZJhRgHC
         qMp1Rqr0Z14klfctpHfFvRmEzURd3FpvSnxAVhbqzU3h/LUCdfKFuxf945JOGUJTfzcI
         CEQw==
X-Forwarded-Encrypted: i=1; AJvYcCWUMgsZO0UElVNFOyXMH2VpYGXzGpKbVAvoTHQ9DoPRL19L3VA3SqFSFGW9GMdg3iSQgjveireRIYXLk1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhTZadtHtgaFgO/y+bbqXfHSijoawrq0aOoTRWlPXqCQR73XA/
	SgPhznUC5NTnWSV84hlaJMKVY7kHiCKr9GwrcAp/4pQql9T7xzWROcL2V4FlB5sMZcDYvCaLEEz
	BEYQKdT+DAM1JYnq0ZwsBUNPgrU0=
X-Gm-Gg: ASbGncuaWWOVdRjdKDgOQ6AWwmnny82kDVohZUVXHwJee1AYo28PBPDJhOo/vYysHU9
	oRxDo5LUltAMabQNtB7/zOMzoW1OaAQjAsCiAmG6V7HI5pn11X6UKVn8E6lUHAZgS981JvTWhJ5
	7cpUKO+Q4c4AxF3qUp0WDMaw==
X-Google-Smtp-Source: AGHT+IF5jwWmr/G+KssqBDw5ITzh5J028FAK9zWOajJDXse3RrKxoo+Q3RE/m1ONSbRcbAyqWgTTaowMG48P53jh3/Q=
X-Received: by 2002:a05:6512:39c1:b0:54a:cc25:d55d with SMTP id
 2adb3069b0e04-54fb93b0fe6mr154792e87.43.1746552886359; Tue, 06 May 2025
 10:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506165227.158932-1-ubizjak@gmail.com> <20250506165227.158932-3-ubizjak@gmail.com>
In-Reply-To: <20250506165227.158932-3-ubizjak@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 6 May 2025 19:34:34 +0200
X-Gm-Features: ATxdqUHnTTSqzX-hOPjfzE4pFAXP-iZSa6VDpFSBHu7PJbjr7aGB19c5OWmuhHY
Message-ID: <CAFULd4Z6Np=_zUUFH+Jys1VxyCAp6omgnMH9OL7iCKM1Si4q0A@mail.gmail.com>
Subject: Re: [PATCH -tip 3/3] x86/asm/32: Modernize _memcpy()
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:52=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> Use inout "+" constraint modifier where appropriate, declare
> temporary variables as unsigned long and rewrite parts of assembly
> in plain C. The memcpy() function shrinks by 10 bytes, from:
>
> 00e778d0 <memcpy>:
>   e778d0:       55                      push   %ebp
>   e778d1:       89 e5                   mov    %esp,%ebp
>   e778d3:       83 ec 0c                sub    $0xc,%esp
>   e778d6:       89 5d f4                mov    %ebx,-0xc(%ebp)
>   e778d9:       89 c3                   mov    %eax,%ebx
>   e778db:       89 c8                   mov    %ecx,%eax
>   e778dd:       89 75 f8                mov    %esi,-0x8(%ebp)
>   e778e0:       c1 e9 02                shr    $0x2,%ecx
>   e778e3:       89 d6                   mov    %edx,%esi
>   e778e5:       89 7d fc                mov    %edi,-0x4(%ebp)
>   e778e8:       89 df                   mov    %ebx,%edi
>   e778ea:       f3 a5                   rep movsl %ds:(%esi),%es:(%edi)
>   e778ec:       89 c1                   mov    %eax,%ecx
>   e778ee:       83 e1 03                and    $0x3,%ecx
>   e778f1:       74 02                   je     e778f5 <memcpy+0x25>
>   e778f3:       f3 a4                   rep movsb %ds:(%esi),%es:(%edi)
>   e778f5:       8b 75 f8                mov    -0x8(%ebp),%esi
>   e778f8:       89 d8                   mov    %ebx,%eax
>   e778fa:       8b 5d f4                mov    -0xc(%ebp),%ebx
>   e778fd:       8b 7d fc                mov    -0x4(%ebp),%edi
>   e77900:       89 ec                   mov    %ebp,%esp
>   e77902:       5d                      pop    %ebp
>   e77903:       c3                      ret
>
> to:
>
> 00e778b0 <memcpy>:
>   e778b0:       55                      push   %ebp
>   e778b1:       89 e5                   mov    %esp,%ebp
>   e778b3:       83 ec 08                sub    $0x8,%esp
>   e778b6:       89 75 f8                mov    %esi,-0x8(%ebp)
>   e778b9:       89 d6                   mov    %edx,%esi
>   e778bb:       89 ca                   mov    %ecx,%edx
>   e778bd:       89 7d fc                mov    %edi,-0x4(%ebp)
>   e778c0:       c1 e9 02                shr    $0x2,%ecx
>   e778c3:       89 c7                   mov    %eax,%edi
>   e778c5:       f3 a5                   rep movsl %ds:(%esi),%es:(%edi)
>   e778c7:       83 e2 03                and    $0x3,%edx
>   e778ca:       74 04                   je     e778d0 <memcpy+0x20>
>   e778cc:       89 d1                   mov    %edx,%ecx
>   e778ce:       f3 a4                   rep movsb %ds:(%esi),%es:(%edi)
>   e778d0:       8b 75 f8                mov    -0x8(%ebp),%esi
>   e778d3:       8b 7d fc                mov    -0x4(%ebp),%edi
>   e778d6:       89 ec                   mov    %ebp,%esp
>   e778d8:       5d                      pop    %ebp
>   e778d9:       c3                      ret
>
> due to a better register allocation, avoiding the call-saved

Oops, this should have been written as "... avoiding the callee-saved ..."

> %ebx register.

Uros.
