Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE791C3BF1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215401; cv=none; b=bp2PtWdSmT8aVfW+7YHqIBpir7BWvx2ajrUwnBuLQrVYhIIz/4x84/pI4ffwQ7HToROPM4DOyzhL7z++y98czfFJgw7QbDx+dt0Jlqs1UxZlIkPPbSEpC1UgStRP9w1kGdx2+B3oGPM2IWeXJxJSlLsIhTLwgBkaI1uXTvWEDTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215401; c=relaxed/simple;
	bh=J49qGw0gwHXioMROoNs3oXTulIGgLgyxXhxAZZtqOlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5P9Fx5oF8k/IoGcBwgXRfLVLv8TY5Ghm01W6O7eJOa4+W14FVhHYD9GI9TtLFc7AqwrKCg7NtQ3JE5xLogNxsiRoMB0rf6TBP2PNGZLhHxeJ/1LJ8SBGQK1GmiKg145bB/IRsTfuzNHod2AvsqECwj1vj6mN/GnNb1/fU/JRRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x614Qwqb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x614Qwqb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe808908so77645e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 09:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744215398; x=1744820198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3L1ltYSR85U0StqGRKQz8nVu/NINIstnLoaIZjZFK4s=;
        b=x614Qwqb+A867Gre9CKnB7o/4siHxgS+3lCjp+YzGEHy2RmJigfdQaobIfDlGguefv
         My/xOwMd1MDv78sfHIZac5cBd3u2aYYSDZaH6FDptTYNhnZkbCqpjHKoVQwiX46M5VSN
         mgwF4N7/ZV1NHrBN+GYGvsmhDbxzlhYFhPZO4YvgLx3f0jnSct6pDKkmvXhlrV79dOY+
         pXnWLyZieAw9Ng59gByY/QWtR3jnz1kVYSeFv0oonaaj7ZItE7dZoKvdRA3zW6LcrlME
         mWxe2S6uJEG5c+gIde1xkgovK8J4EapT0dboxWz/BdemJI/bDJIii8FbXya1H/PdIgjw
         CdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744215398; x=1744820198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3L1ltYSR85U0StqGRKQz8nVu/NINIstnLoaIZjZFK4s=;
        b=NbLY81wckR9DxLpp2V6bg+te+5dTXn3d6RdbqZeB2sUhsZjuFDApea+0mX9lzNFzfM
         A1BuoxbbPWww6COnKdpok4cK7btFAdG/I1QMy+9tKRDIRL7a30RO2IF75yZye1ktL4T7
         YyxDyOJMIYeEKbZQEmP5/zV9MsdfdtH8/7W4ahwfvBBgscQtwMD7xHVKSLQV+bel2a0X
         how7+m3dFP/yPRVDYueC8CfFFLwyFv/cl9OhNLi8viFChPR4DZbwiKal5cV/KdPIV5Lf
         rBl8+rchxWHN+dzfeGIRDVDeIJ1IQNVhpdzOGEbiIzifW5+vIlTaBcxiwVFNwWrlMTRo
         OAYw==
X-Forwarded-Encrypted: i=1; AJvYcCVYCkzIS3cEKZdrf9WdWPU8zeD+LT2kTkwhYzpELuUDak2lCXoIxoXis+iRlRBdshQGmjC5UpA3GcxCI64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPf1tuWnPLbmPBdvZi2afBTsggdVZbATV9FCzZn6EQYeVfvwD
	IwWdpijjS/1RzXFeuIUQIHVdu3uL4la4uXXq6QmQFwZuXOngGggS2mpmCahQmBbwryxSrC36waj
	EkGGylFhl5pUpzV8y9XlV8maRATSkYMkYANdy
X-Gm-Gg: ASbGncvpae/wbiOE5hGFkIzZicc0KZaE9lkeLB9wwF9ow9ZDkLCrm2SDq6J3DJy28VD
	d20x+PCyH+T3cPCAnvcsZHSj+Xexp/Qrn+Bw9zLq7CTKb1e2MnmeqHutP5AzgeNYfDsxBnBhW4z
	cvs/UFH9FCB8+gEdgdU3X5VayIiW2uSs1zR3nssU4VkzVZGAtDBo8=
X-Google-Smtp-Source: AGHT+IHMqC+3hbEpXTUylNGizBZgW7Go9O2bdO28jzaoYnTJ9E2paIqyRjDhwrFiiHFpQrgWEMPHpsurxwkdrBAeshM=
X-Received: by 2002:a05:600c:6dc3:b0:439:8f59:2c56 with SMTP id
 5b1f17b1804b1-43f1eb29fd9mr1524875e9.2.1744215397850; Wed, 09 Apr 2025
 09:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115105211.390370-1-ps.report@gmx.net> <20250115105211.390370-3-ps.report@gmx.net>
In-Reply-To: <20250115105211.390370-3-ps.report@gmx.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 9 Apr 2025 09:16:25 -0700
X-Gm-Features: ATxdqUFOEyWL2_pY-dS_AtKEPcpN6sQwFgZKcX64ysayk7PO4yxDx0HeBTOrIfc
Message-ID: <CABdmKX1q8VvDKJR1AZpU1fYK1_0et1Hd6-BRmS6OewCitX7=-Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] selftests: pid_namespace: add missing sys/mount.h
 include in pid_max.c
To: Peter Seiderer <ps.report@gmx.net>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 2:53=E2=80=AFAM Peter Seiderer <ps.report@gmx.net> =
wrote:
>
> Fix compile on openSUSE Tumbleweed (gcc-14.2.1, glibc-2.40):
>   - add missing sys/mount.h include
>
> Fixes:
>
>   pid_max.c: In function =E2=80=98pid_max_cb=E2=80=99:
>   pid_max.c:42:15: error: implicit declaration of function =E2=80=98mount=
=E2=80=99 [-Wimplicit-function-declaration]
>      42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
>         |               ^~~~~
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
