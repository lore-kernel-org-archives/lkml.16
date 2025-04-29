Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC7A224222
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745954945; cv=none; b=X90wmz9CGQDv/u4xwJI5DFs5MJg7PoTpoDLgG5BCfFgizzdMaaCF5bGATJ9OM5qRkIYvvwkbgqX2JtkM9fTcFBv8QMIFvfCJ0fxlu/xrNU3bGU2QSq5i3kNvczOqQpEKMhuUVF/C7Fjic7bnK2+M1PbrxLnuIPtAYeaclIJS8qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745954945; c=relaxed/simple;
	bh=1aF+f6v+aQuKxWlA0Cd06ifc6V9V2SOLgGmWF81iqUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGy8KsMHO6p2LvhZFcAbbwk3c2RzPiP3jhdpxDzWYIrRlGX5coSuC4u9pp8CzferiQi55XDzr/d1znkUg1Ehlo38JCRcjqf6WKoi9cL253XB7swkMlgzfLX1VG7xL6HQtlhbPkO780SHl7ZEnUsr135NPOSP7oqsCvkJtnIMSy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=BDrRs6yc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="BDrRs6yc"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1275491166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745954941; x=1746559741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aF+f6v+aQuKxWlA0Cd06ifc6V9V2SOLgGmWF81iqUI=;
        b=BDrRs6ycPKuNG23KgIOc9tDSB8djF0oVqwpucNk2ex4OJM2ALc7pXyvqrgNj4G2xOx
         KVY4XmVao0t7gz6S/is2O0rImKmvrGphnMAiZRWLjQ2mxKBe0JDmPM+L3Eh9CMQqAW/Y
         lDl4ZsrnAA+V85rFDtiLHkq8XI6CZFXZ4aSzgnbHPQYpiMGRBZIyxavK4Ng/rU5F/Fzg
         GIj8hvmuRC64I8m07q4NIw1sKact15AJxJbH540BlS6Dq2lyHeFcnEbvtue0Yh1m6wwF
         ccM/iU0E23Wl5Dw908YordAvqU+v9o4XhcSe+9FGEiTkRNGbvzPp7jb72dCalHo0sczx
         VOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745954941; x=1746559741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aF+f6v+aQuKxWlA0Cd06ifc6V9V2SOLgGmWF81iqUI=;
        b=ukcoZrMAyDk0jiHD2of44BpQFSLKEzAtFQ/U+aLtooJU+B5iRTqb8DaVp8QURoLeHm
         UuNqMVM98VkCY5+ApFHi9jB5h/E0PmYpquEvPMrcZ+eLFvP0fTys0IV0B3N9O70VFydk
         uvbtUJ0caW5UcBAkdjizXtTalxGlzZ2UbaO2f1hYYLVcC7H12tvoWU+QzpAxYayVy2Pi
         Yu4C+9Aga5dElYQDFF3Jllw5H/VbaIjWdp9Gc5lzahp56I998v9cRGpmb0GT8jGl5PIC
         DwPCa4xaabHUFxtdfXC7UEJpCuPoDFkteubaDzrGBx03ood3ZADaywfaF+ZqUgxfNKgU
         Q5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXiN2Yl35Oqlbb3atNMYxcIa5ucbHq2Lv2498xHwWgv+89pQ4SPJ0Rm0Qse/iA7iZESAg57qh8hOPnwOtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyildFIYWWfoG/DS6qp1hQaZk5sw8hSo6GvMnftoaZl2lt2l+kt
	LWp9QnJLUzaku9MV1q+aLCI27EcSg4yl492FzlsXlh6tzT9/u+rVVn5BB4fFoG1jhYZ9EJ/8mXW
	7KkFlDVC6gvk769oEPNPHjjWHQv3LLFXwuIkDtcbn3jjL01WbEkY=
X-Gm-Gg: ASbGnctWkOIdP2Xklbz3V/YRxK42ziH1MABAQsGiW1aoDMY5tIedIQf8HzOUp3GDrYH
	8Dja7myF8zhXmQBp6n4bngX4/6WyFDIFP/kAIRJgHYx8d4HCyr1ZwR0kvYcDpwIdgBjFmzox5gL
	n4kJ9kdo3L8FFtgdT2iI5jhdiSXrbDT8D9wo4GeUGlU1sMY2Z5xaU=
X-Google-Smtp-Source: AGHT+IFSpr31KDSEP1Eo9r2vBjmWH6MIOXDWyuBNwRJ0R5Of2C/YeUZlB2zLOFtZv7OnDvtjjhTYoGleJQqBcZyYPFU=
X-Received: by 2002:a17:906:6a16:b0:ac2:49b1:166f with SMTP id
 a640c23a62f3a-acedc767b0amr55454966b.52.1745954941461; Tue, 29 Apr 2025
 12:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429153419.94723-1-jdamato@fastly.com>
In-Reply-To: <20250429153419.94723-1-jdamato@fastly.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 29 Apr 2025 21:28:50 +0200
X-Gm-Features: ATxdqUF0Un6CsTVEnxmSZSEZC15AFRtpeccjLpwY4y6WttEn7mafiLiqTlJKDqs
Message-ID: <CAKPOu+980gvzd-uXUARnYQ4V++08spfBVj26nZapExVF80ryYg@mail.gmail.com>
Subject: Re: [PATCH vfs.fixes] eventpoll: Prevent hang in epoll_wait
To: Joe Damato <jdamato@fastly.com>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Mike Pagano <mpagano@gentoo.org>, Carlos Llamas <cmllamas@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 9:22=E2=80=AFPM Joe Damato <jdamato@fastly.com> wro=
te:
> In commit 0a65bc27bd64 ("eventpoll: Set epoll timeout if it's in the
> future"), a bug was introduced causing the loop in ep_poll to hang under
> certain circumstances.
>
> When the timeout is non-NULL and ep_schedule_timeout returns false, the
> flag timed_out was not set to true. This causes a hang.
>
> Adjust the logic and set timed_out, if needed, fixing the original code.

Hi Joe,

we have been working on the fix at the same time, this is my fix:

 https://lore.kernel.org/linux-fsdevel/20250429185827.3564438-1-max.kellerm=
ann@ionos.com/T/#u

I think mine is better because it checks "eavail" before setting
"timed_out", preserving the old behavior (before commit 0a65bc27bd64).
Your version may set "timed_out" and thus does an unnecessary
list_empty() call in the following block. (And maybe it can reset
"evail" to false?)

Max
