Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375C130E84D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424551; cv=none; b=PMjX8CBKwA4aqdN6HMjofAwezI5bgmGCfoMHd2ZgTFsHjbSxXa6rQNVcGQxJlZ69PB1k6BSuuTUzGuVzrx4SINBa/I02OYBXxd0SwOTSqgi5dMh9isuX2xfChcs84EatmwrYgKzsaOMTBKYxBi/e1jj5zyBfj5KwgjielUNWUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424551; c=relaxed/simple;
	bh=+i9CDQP6n8E/ducjtDiDPCYXDGSXpqP+2tp0/1XCQ2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gY2K+1525qPe2bBm9q1XUIv94RGl3zeYO0WpLdOAOwv/+OWDFoKpr3JN6aA6t2FaVKMqDKKc0t191wiA7johxEnF0ZD2I1FWddHBCJhb7l52Dd7XA8Y7lQ8pCdiwYppT/80pnpd4cT3A9tCIpFBZXbE/sVx24l7SRB/6JM755Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi+EBKYd; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi+EBKYd"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2eeada3df1so78263a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750424549; x=1751029349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku2lfCRgbeEeQyv76fdpFPbrXssOkC7jN0SIcPzFmHU=;
        b=Mi+EBKYdxtstVfqtIZ3hVwqdx+OvVPzWZFArOrlXtEFdxELIGKbeUnIHe71Fyocu6L
         J2XgQ8u/oYB4FvrOclwz481FSq1ZguAr0DXUb/kIVx/Cc0njHAs4/jc2qfA8cHiMT0UK
         trNKvQbFKmQnHGT2iLHK8EfB0XYR1XH+ElHkynQy2y6+mkF72xgxJzrJCQS323XFWF/N
         S9EUhCdMBVuft1TjP2GPvqHUhx1VlU2MLnBb0485VpcZSp4EgT5NssSrgcAP3lF2D54S
         MtNv3jJx6locu0axeZT4Glk5J9TL+dIj8PIIyEIhUxiPDI/4z/B86iHwdV1PUCRPraKz
         gUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424549; x=1751029349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku2lfCRgbeEeQyv76fdpFPbrXssOkC7jN0SIcPzFmHU=;
        b=H40cXRyu8deMvThAkeIFfEGQtsXxcqFMO43ubkjr3AO0NlI+Fv4g7iHH8kuIb0Vwnu
         4UZCCyd+G/tVqJ2WDCkiGDQapwIO7ECm9jSop2Fz49DO2EPt3tMLWagWXTpqj8gKDRWG
         oVJWVBY5RdKDod05JWPMkCihsPR2ax86gqJAvWCHt9ca2N6SLqlLZuzvD2ahhDNPcZct
         3uFYMsYIWVPRHzDqlTQWLhXspgDbW6ZQ1EFcx2GZagI8LHLomyI/uH09Fh2XV8S3Rvul
         VOI0Jo4EQdEkDLRaQKI///ixvhq+Sjn0UxLO/bDhv1ICxqlPn2dZEpYkCTNzRGcbu2Me
         IZRg==
X-Forwarded-Encrypted: i=1; AJvYcCW1gyqtD4k1OB3HlC5sXNHCAZN2Bfg4sTvuxzJAdwd5xTiPzmsFMXevfBxf+9d1vr8vGcdNWyTXJ0NWUwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8RZ/w7m+M0ff75En3Up0hD6HsBvDUlbI1GC3mm1GmRYVT7S+t
	tir2Y1Joc++7CMVzEtiiEb/7A0wHuxDEPSGu9WEraXoTRWHd3eaYraO8JzTlofmD3EmaR0bMvac
	AxYKfyuLyvx//cK8V2aclPuUfrZuJRZY=
X-Gm-Gg: ASbGncukmf669BVlZKGUSXrrqaG9VAHDvI9T7cwsPq0C0ancPTPSJ1ljpyNHK1Z1vn4
	SpPYcgPp38dZC1cmqZYI0RFa2n/SfQzeDCuor+lVCvogYe7KK77FHn1r+jDlk5iWWc9QAAdWcmq
	UZtLX25OlQ0A6OPnj2QHgAGZwgoqQGonGtLJM9g+sRnUE=
X-Google-Smtp-Source: AGHT+IE8+NT28jJ3PDlhzDgK6jrsUDzmmjw277/KOn1Wu4vcAf7wijjDZ/chmH3fOdcVRrI5P8Ws46tamOa5k66F32k=
X-Received: by 2002:a17:90a:d64f:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-3159d577d0cmr1554310a91.0.1750424549428; Fri, 20 Jun 2025
 06:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620111406.3365763-1-arnd@kernel.org> <CANiq72mYSPA_S6hT4B2U8Sgt2QTJekuVEKqjJDgQxGVmMX64jA@mail.gmail.com>
In-Reply-To: <CANiq72mYSPA_S6hT4B2U8Sgt2QTJekuVEKqjJDgQxGVmMX64jA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jun 2025 15:02:16 +0200
X-Gm-Features: AX0GCFsaglna8IdmCTzw96MKy8HtUl8_UV1WmceqB6-05WHmIviXXgc-IkSlcZg
Message-ID: <CANiq72kfUWYdssvxOS52D9W3fLN0xQRHNwYGGduSGHrSGu+YEQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: change __retain macro for gcc-11
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:00=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Is something else going on?

Ah, I see -- it does error on arm and arm64, but not x86:

    https://godbolt.org/z/G4Pbd9Gar

So it is architecture dependent.

Cheers,
Miguel
