Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D7272E41
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369381; cv=none; b=sKeIOChSEHssyT79PkGKKFY/euowC4qe2+eScZy5wH9V9b+Xbj6HO3Kr59Ym3OmAHLohF89YIypwJioPJVZ7l7YPjjl1FdrT/gzL0e+aq23oDWpOqXYmVvEijkeVvicgsvM/8G8/FgvlmP7qtE3Gz7ZzDTPlwUBAg2WySH/q66U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369381; c=relaxed/simple;
	bh=/uQArIpWv6jgks+MQz2FdbcZCHRD3fHAxYqX6fLBpUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwP4s5m8sI9MzXGfH8VJwpl40fNnSV/8v2IQ+ENLtSS01l9S2r8rIxIHiECmquPmEnqA1fkUJEgq2stU4PYj8z8+vbE98SnR4aCcwGtBkT3yj9V524s441WRpDYKcZoNwb9O5KHqdIv0DY6So2Zwg+YrJKbd9FUX37OZugVstdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzE35v1Q; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzE35v1Q"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b49ac6431so48471201fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751369375; x=1751974175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dICzWEcWfyURmGG1tAzlz5bT3KCvUrBKE1a6Eh/dqu0=;
        b=DzE35v1QsYJEIW9QCUXFvsce2FZE4SCnc0p79zqgqqlbVFpJvPT+ArPTpIFkxDTAb/
         YHkn5HwbCJEYn/eLQRY3hFU2Gs15HCqxuRiTeqEcQg7sJ+8bpEMZjO53/pWzjt3SEJwx
         niDss/saXiWO2culJXgextipNyA+UOK65ipSdEeoItUPA1O8k0TFDvXzxZ5KpCHRL3r9
         Kl9ixenAh702QekjXH9b2/SMtL0/Si10XCNQfx1cX/pUDeDHaZVWy4j5wiJWjnPNwKNd
         WU3hPz5dZ4K3adKcdtiQSzgf/tx3IHMSaWwtAD6/pmL/F6pSfiilqRWWsn828RrO0nHm
         duWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751369375; x=1751974175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dICzWEcWfyURmGG1tAzlz5bT3KCvUrBKE1a6Eh/dqu0=;
        b=mwT3YmX951MsJcah/8YBEdB/vb1ttKLu4IUUojGD8CPtrNjrKtRneSyrLOPWPHaB4T
         JgWMSQhuGeNO5iD9lPrqPpUvQFKFOFKHsIh7mwQ6me73ktha8veYAI/8Ph9wn5Gk/3e/
         bVbPRraiqvdiI5lDFEFJFOJpmBZt//D8w6v74BVoA6jo/e1CfaXpLfSihNpFzm11hDVr
         vCbCQYpiLFoVw3c6Vjm+RAG7zMMDsggZXyP20EY9T9YVrPYPg85PWeuGLeMaLsSWLf1X
         GTU/TsHF0A96UAAhy3YV2UQqVDpHvBvcFFY9ewsimnf001Lel2MM6/Y7tIw4DT8r2FW+
         oVTg==
X-Gm-Message-State: AOJu0YyAUjQxV5al7Anp+h8VZkl53tN5olTHE3H490ITS3wPs+fhwjHE
	XvPzVrlzEZIfg7K5zz0wiryoWaybhFxfaI7M+n//ZWdZtv3Y2Nwz5WtV3rAuU7a+eLSZkvuKByR
	nayCrJ8//ZIczyhRXzdaV87EBdyANe3WhbwBicWV2F7/7
X-Gm-Gg: ASbGncsChXFmsgiVIjHicEydcPpLXwrFd5etZ8Cdt22UsWxPrg103glvzeRik+z2jUe
	adCeky3ZxCizAExS53ATX3I6YKlnVoIG2a3Dsw/cuCs0ma3JmEO0fJoR4xzfOMYxsHJ4qKJKSqk
	HATwzrTD1mtRHpRTteJpzToqOp57c9weZS0AGTDF9bDteF/bigTmPkBzgETlo/pdv+Z9nzCz4Tb
	0TH
X-Google-Smtp-Source: AGHT+IFa6Y8dSDucSupqIAEE6/ssEZJPz40XEHljLpWrs5EbvtMthy+CRzrw4f9yRN6r2pcDsQDOR8NJ03CQvmy3BsY=
X-Received: by 2002:a05:651c:154b:b0:32c:bc69:e938 with SMTP id
 38308e7fff4ca-32df9e2d9f7mr5219611fa.20.1751369374735; Tue, 01 Jul 2025
 04:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613134449.7459-1-pranav.tyagi03@gmail.com> <2025070154-cringe-tidings-20f5@gregkh>
In-Reply-To: <2025070154-cringe-tidings-20f5@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 1 Jul 2025 16:59:23 +0530
X-Gm-Features: Ac12FXw89JSuAZTTqiDy7yiGTbpPr2ZNQEeLQSSY7id7dMW7zkv0bXRX-3tSChY
Message-ID: <CAH4c4jLAQghiQXMVB3-pYhoE0HiFPHdN3d7LT0rVCmJ-o6SP=A@mail.gmail.com>
Subject: Re: [PATCH] firmware/memmap: use scnprintf() in show funcs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, chentao@kylinos.cn, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 3:57=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Jun 13, 2025 at 07:14:49PM +0530, Pranav Tyagi wrote:
> > Replace all snprintf() instances with scnprintf(). snprintf() returns
> > the number of bytes that would have been written had there been enough
> > space. For sysfs attributes, snprintf() should not be used for the
> > show() method. Instead use scnprintf() which returns the number of byte=
s
> > actually written.
>
> for sysfs attributes, sysfs_emit() should be used instead.  Why not do
> that here?
>
> But what is wrong with the current code?  Is it not working properly?
>
> thanks,
>
> greg k-h'

I had sent this patch earlier along with a few others of similar
nature. The code in question was working correctly. However, the
intent was to perform cleanups based on documentation guidance.

Specifically, for sysfs attributes, the documentation discourages
using snprintf() in the show() method since it returns the
number of bytes that would have been written, not the number
actually written. This can potentially lead to buffer overflows.

You had previously pointed out that either sysfs_emit() should
be used or the code should be left unchanged if it is working
correctly. To avoid unnecessary churn, I decided to drop those
( including this one ) patches entirely.

Regards
Pranav Tyagi
