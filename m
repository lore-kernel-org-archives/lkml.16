Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4625E28ECDC
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746786129; cv=none; b=CylHVhMaE1Uari6PRtFX42LImeMLFMb9hba1yljoYMrJ+Us6dKkYndsIGplZ1foIB99Z871Fv7yhH/1z+XKGr2fucavLWM27sHQba43Baya8W1E0++NexRE/7FWI40/6sjTc0w8AinWBoibmqXGhD8JWT2jCmypMLzO68ImJrgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746786129; c=relaxed/simple;
	bh=/bYJJlUc/RGCIZMAaFct55Db27XvE2N75N9404EUSA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWcF6sQFxL9fC6i+AVgjv9mcO4KNiMLIf4qXyo5LtncqN/0oYacEk/AVNL7V4EhpjhlwbVmCkltBtTZ7h/y4mrnHjZoxc2LQABy7BfNXzTAYRpsBOuDS03uhlUQtWldRv6uJxz1nEzLec6qj+o0++KYM04Pr4SMD/vLnDD1ZH4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W+H3IKFf; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W+H3IKFf"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso16746491fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746786125; x=1747390925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
        b=W+H3IKFfcf3XN4S/V83lrXaGIOOEcljpl8xLztNm9ZDzuiHt0LqoNRxI72xsVIfMrW
         /57B3SmwGeXYclQZMzhvb1YCbJ3TZ7K2XyPDP5TNeD7C4FOXqRcoZbuw+EQkjeGQxmTZ
         IY71fwmuQti3n85hwBEG1ZSu5Qeq+rbMTSwv/F7o09QtgpAaImxSvzGzDjFiMR/gV8e1
         JRz1SEaQ60FJW/3Lwv7I3N7DarfFv8kl/KDF1tKVOdwLR2uqiAlbZAQrX5JtiXogJDqc
         wJyDSZWiMi5J861sfKhsFDg7I6s8Tj77kexZrvEumVRaZ710pxyF3nm/q5M3UHd5nx33
         xX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746786125; x=1747390925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
        b=aVaTpZ0jESrbAnBRH/a8Bk8T1T7UaOPF9tfeBs9bLPhO/kRoPnburT9fijKX1WiXa2
         V5k3WuLwEQTxi9pwH4PPGuzPepgiNDg0CMHwSjjBQYwTlYmoTN0ki4yBQKXpjR+ObFvo
         j+vaYmIYrLLyfRIJ5FOT0rIJPgVCqU2Yat3HaYSab/w5LD0qVMzwxh+a5zcCRJk5FyjE
         ky/GGaIuk36o4PucdiJ6zDpx/FE9+hqIVkrVIhwYHx/O4zDQ48lublHVdcMED0YvAmb0
         MfYUe8KkPbnn+lm4diK/HWTJdiikcqpAwMSyNVjBoLUiKNG2+65kF/qL9qK1snsTPSzo
         u26w==
X-Gm-Message-State: AOJu0YwJxULnmJpFyaRatQV8xptuVISw2E6PebR46SmoofoBpXHqkfBU
	EtPZPj+HxfDIsu318PyS+H2QqmPwENjlZLoFCbBwsaGcU8B7FTvfdLfbLB7OM+nJcF3L9PmGBu2
	8n8nW2gT7yBB1Qq/6evZmNY8lj954R9PKVTEtqg==
X-Gm-Gg: ASbGncv2aPpxvrFpcYB5AyJnqBK/95/CmV+qA4QoRbXu5ElNiyyM6TeBPeysm0R3n0A
	ebdXc6erZVSGJxTw3pTJyIPcqYijw66anYa3rpOn+K5Bi5KVUD0NjCWOiF4XIn2chy+7av+A1my
	Lx8c6EFtb2RINpvV6VxMs7Q647WM6mnuYX0cH09zqETvorUVlN36FWaA==
X-Google-Smtp-Source: AGHT+IFFnckVfV38yiKm/0tyz56i3avYrl46Y9age8QQDJkz0vCUqheVLftkCKucDo9t25Jxqs4Ykbmgz1ik3/urSi8=
X-Received: by 2002:a05:651c:2211:b0:30c:15b:1268 with SMTP id
 38308e7fff4ca-326c457e7cbmr11457661fa.15.1746786125175; Fri, 09 May 2025
 03:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508130612.82270-1-markus.burri@mt.com>
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 12:21:53 +0200
X-Gm-Features: AX0GCFvERxh0VC7uLRRore07epYkHtQUe6fy6V21pIoKxIz0HhJctMM3W0tAElY
Message-ID: <CAMRc=MczDhGpxwbGCUoUxGm19dqNH2FzXVrbXewy7yMP=SEieA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Fix potential out-of-bounds error in some drivers
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Nuno Sa <nuno.sa@analog.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 3:06=E2=80=AFPM Markus Burri <markus.burri@mt.com> w=
rote:
>
> Several drivers are using debugfs and follow the same pattern.
>
> A buffer is created on the stack with a limited size to copy the given da=
ta
> from user space. The copy is performed using simple_write_to_buffer.
> This function limits the input according to the specified buffer size, bu=
t
> it does not write a string terminator if the buffer is truncated.
> Therefore, the driver adds this zero terminator afterward.
> Unfortunately, the original buffer size is used as an index, which can le=
ad
> to an out-of-bounds error.
>
> This patch set fixes this issue in all the drivers I have detected so far=
.
> The fix is to return an error in case of an unexpectedly long buffer bein=
g
> received and to use the effective written size for the zero terminator fo=
r
> consistency.
>
> Changes in V4:
> * Revert the decrement of accepted size by one character
> * Added patches for drivers with the same pattern
>
> Changes in V3:
> * Decrement accepted size by one character according to feedback
>
> Changes in V2:
> * Use effective written size as index instead of original size
>
> ---
> [V3] https://lore.kernel.org/lkml/20250505203830.5117-1-markus.burri@mt.c=
om/
> [V2] https://lore.kernel.org/lkml/20250505045346.29647-1-markus.burri@mt.=
com/
> [V1] https://lore.kernel.org/lkml/20250501063240.25295-1-markus.burri@mt.=
com/
>
> Markus Burri (6):
>   iio: backend: fix out-of-bound write
>   accel/ivpu: Use effective buffer size for zero terminator
>   iio: fix potential out-of-bound write
>   gpio: fix potential out-of-bound write
>   powerpc/eeh: fix potential OoB
>   powerpc/eeh-powernv: fix potential OoB
>

Please, don't send this as a series, it makes absolutely no sense.
These patches - other than fixing similar issues - are completely
unrelated.

Bartosz
