Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7F1B4141;
	Thu, 24 Apr 2025 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514129; cv=none; b=e/8WA9Y4+R3LtrKGKOLVBjU+GX/GouKGQUnyG6SQig20FBvCBSVzT5kL1KCvRb+/C9XrciKRy9FcjLcExPvSJQqgPUgp5sb4SOEt5c5jlLElmfwWp8DSklhbU/Lc/XgXo1ayar8HHj6YYnZkOZZdp9CLCwxaSLgh5aJqMdd/DXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514129; c=relaxed/simple;
	bh=O5SYM23Cn+WkamdI56DnAUG/Sci0EsW29F0Z42ReZmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPzpnLTx82ckmulPH/VcPEsGHAVHTPe5imbEsQlqUMN9tDMHxygTzViXYs+/7c1K0GoUqA6qc7N/Y0v10seG9Tr8FS2MHxd9YXerqKny2cCbM4LGU+pUQk80PsH//yhCDZ2DlOGPQSkDWaXy3kW2biMMSYju8t1dWgSm78bDI4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2dA6saE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2dA6saE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2240d930f13so2644205ad.3;
        Thu, 24 Apr 2025 10:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745514127; x=1746118927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5SYM23Cn+WkamdI56DnAUG/Sci0EsW29F0Z42ReZmw=;
        b=P2dA6saES4PqTgMfg2DYrITYwukYILWQ+QXbTuwQ0ltq5W47YOd6T1+47IADEJRPDJ
         N9+EqeEsfubpxP8793C6kizuHwTd/6b7zxkqPMIzgd0hdgNsYwRnWRYTavX9hI+A2/wq
         75YirjtlpglK62hZRdoYxc5Iy7Js4uGycjvqqItBqySTq5r2dOO4g6KenHcGJEDbKrlH
         kr6Qb+A9hSvU/L1rqvopx2eK//dUtrcWznC15T8GybOoFSc7Yboo9lT9IOXXy2FeWrOJ
         XHkP1UiWpjBqyTLdpq1oETLsPHt64laaHQHovd/3iWDADiR0GJCUjPAnu6627i11gLxL
         UXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514127; x=1746118927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5SYM23Cn+WkamdI56DnAUG/Sci0EsW29F0Z42ReZmw=;
        b=HRSgQVqH6cckUW5kGnWqhA9ZLko6Pvg5E68MT2Se2VWib/3ad7aOFWC0ZwBPkpzOSQ
         nR4Oq0Pxs1Sc0S2uOyS8g2rx0JXMkmzycwO2LvGks8bqOzQw+VnNHgIlTzVyglf0vQqI
         2aXI2XxlUDWQfIuuBNLsFYHMWVFXy+iMi5XyvBFAcZbC/eYHTwKFsDUKmCGoUSdGhK90
         uduyeZdLjiHJM5xnkF7AGE5txP8sB3wa832USdqnEQg+vijAOmNygO/NwInL3bJr5+zI
         zjqnKyIor+fx6sTMuhJhMch5QlunK0/Y3b+ugMr7w6CTd/7WxrQrVLKlVP7ZXmcI7mNt
         IEig==
X-Forwarded-Encrypted: i=1; AJvYcCWAKuv2APzBztqcfHTygomN5eA25PrG4PyE+1XgRSqZ/PkK8IMMrKiSG4MHNmN1JH7VF9Pj/baIY9x9luOPLfY=@vger.kernel.org, AJvYcCWzAPpk0T49InTD2tq8Cu6GIpF4zu6mpLd9nplTOISbU/Cq3146S8wrTA5G2yAuAAtlvKtZyBSPDRgbTiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzia+9vEMwwtwumfc8n1O5NqeI3BFa0wgxkfwtMImtDFItyTXZk
	vtbf8DDECfb/Oss0O7VQXuqtYiKD5tssSdz3Crtjp8uxds/BB3kDnCYX0NQrkAe44Wte1G1/g8D
	6u7VP5baMy+NVoaOeJ6AYjxMLBA8=
X-Gm-Gg: ASbGncskjk9IEyr0P2HXfLu+eCriQZNzHzhZsnLVA/uCqBAOOwB+EYDbwGRJ1rqnomM
	EUdXn9PzEhG9bHgdOp0QJ3hHM/zAxoTjCwuKNgwPiSygQ8X7MPIv3miourzTp9aYNWQ4WzfX8k1
	slkYKUSB5zLUj781v/2Slp9w==
X-Google-Smtp-Source: AGHT+IF3ZtuHsNs56LObEEPE7jjBcXkiaFFKRHI+tLFB6UFWdm0HdP5xd9Zsthx/pq9U8NQvWfTre7qfqozwBswyhxE=
X-Received: by 2002:a17:902:d481:b0:223:49ce:67a2 with SMTP id
 d9443c01a7336-22db3d7af28mr15685205ad.9.1745514126756; Thu, 24 Apr 2025
 10:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org> <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
 <aAKrq2InExQk7f_k@dell-precision-5540> <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
 <aAo_F_UP1Gd4jHlZ@dell-precision-5540>
In-Reply-To: <aAo_F_UP1Gd4jHlZ@dell-precision-5540>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Apr 2025 19:01:54 +0200
X-Gm-Features: ATxdqUEts6lho2tNYy_qoenKS98bA8dTzs4eIhsUcBZzMfNVYnhaeESzWLd5fBg
Message-ID: <CANiq72mPZ-ik8k+04BarAu26A1=rV_y7GYZHkFnCezW4jpXq+g@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, arnd@arndb.de, 
	dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org, Nick Clifton <nickc@redhat.com>, 
	Richard Earnshaw <richard.earnshaw@arm.com>, Ramana Radhakrishnan <ramanara@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 3:39=E2=80=AFPM Ben Wolsieffer
<ben.wolsieffer@hefring.com> wrote:
>
> -mno-fdpic disables a GCC feature that we don't want for kernel builds.
> clang does not support this feature, so it always behaves as though
> -mno-fdpic is passed. Therefore, it should be fine to mix the two, at
> least as far as FDPIC is concerned.

Great, thanks a lot for confirming it should be all good, very much appreci=
ated!

Naresh: would you like to send the diff as a formal patch since you
already tested it etc.?

Cheers,
Miguel
