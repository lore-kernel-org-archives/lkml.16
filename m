Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3746F54670
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743046097; cv=none; b=QuK66L9irxJGgUVCodTvNmu+qkLLbSim1bJkTT5HMBsy74c7xy1m/50wragdvez4H+kTm0iIPSOI2pU7FhfzBmJv5hV+I2oxgnV6XxDCEmOlo4mF75Tu06Yvvo0jS6TmgXH5MkkGDWdYFJhsEQ5uwrn1sHMHdb+P+ukwl+LW0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743046097; c=relaxed/simple;
	bh=KOVnteOSYGMuX/fuEdTCskNxSepC6g2ivttGd3p/tAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4b6ryOQjLsbwzvVp0kLTB/TTCVafGQyDupgBf1qFklgImYQ3h1NogUCEogAcX1QbUcy1MP09aIOtZr4B96RfkqleYkaofCMCi0UgOvckcqcGTxGbvJTRA9+ctpxa3x98Nwo3zt86s8W+htwi3GsTcROBfZ3giskCeaBFiM3De8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cg/I/Jy5; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cg/I/Jy5"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5498c5728aeso4201e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 20:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743046093; x=1743650893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOVnteOSYGMuX/fuEdTCskNxSepC6g2ivttGd3p/tAw=;
        b=Cg/I/Jy5pK5twBUNtl1PT4ZWHCKzzkxNiR3kiri1KS38V1jdvmYgHqwwY3HKWuECfZ
         mdrW0FQ/7aWNh0rQ5Keno8mx59A6cLsGErm6TAuQ1h1Iu+tVXvEGZkZAuWgrER2+qlTh
         2gWqDuVbFX+T0ZFsppTX6WDuqIzSgPBaDc2HIcisIzWBAHF6ETzhv1O1936RpeMbD6vF
         2LmAt4/4QgUWyZy/Av0ij8slMPSM6hj8Tv1aJQfeLRwcCang6Wbhql17J+W+NmYSJM3u
         sa4cWArWfl+vKdl5kzUdSOI1/Bx8VRyjIRgPVz7wgNoQYK1wVYAh7Dv5XNOvBB1poDQ8
         D3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743046093; x=1743650893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOVnteOSYGMuX/fuEdTCskNxSepC6g2ivttGd3p/tAw=;
        b=mzfvaCQOs4rBl2n/5GK897n6HFmhv1TwJxLVbHM9oDnlEiZHh0XBNseY7HaFljOh/q
         h/3KRLqQA5tAXC9B88kNE/uSVkCK5qUq9Oh22+U1FZGYotPVdQtcriJJ/lawVQ1c1BN+
         uZztp3hOj6QM3coZhr18CQyVZVt2WUhV7BMrBMoi+j0h/o7hLPHdF4HIu/tsWYC3uod7
         ptQOVNpS2ThzPfVj9g2pFy47c9/sleyk4Fb4yqFNznnnxLlkXicaBYJDs3HNYM0Ru5sf
         wy6YNRZQaLnWObR3Zha9B1+WxpLPqy0474FVwPR/WFFcDA7CZp4dvW63zOUynM3/lMgz
         xgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJWiM91aaDxxraPqPDKbxtA9qXEFu7JVDt1CXZae65vUvJqKuYNl8sS4V8027yytqyQP6zsEWtCVYG0u8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqgkJ8u36OUPBeENz++8uBPe4Pz+GscVDKchZ5odajKnI12Nef
	T2pcCEPzwqp6OTppPg6aITC1DasmyRjTDWpnNKnPd7wSix8WI9SPQRwX2mokziKxv3/yOgT3hPC
	beDcb2Q3E9NZ8dgxEIrMer+LvOOiD53SXI1T7
X-Gm-Gg: ASbGncsB03zGNsS5Zbhp55m1lJDJcAvoyV/Mt2o5InCXIb0cr9j+YaFMhEJ1x8fe7wO
	Dh2cebkwu+gwGRjaTdiE/vTBMZgr/p+YvNLi7hTRMtus+A1WlY3xtZTw0FTvLoSxVL+BXrvsBNq
	fq28jHTmQKmoW2JdBukiYkYOVn2A==
X-Google-Smtp-Source: AGHT+IHYYFlkLGcHWQC0DZtFRzC5jMavP2eA8uXYZeFMCn/56q0uV8KxVI27nSwI2Vfa/40Osf6iwX3o7rurFC2Hu5o=
X-Received: by 2002:ac2:41d6:0:b0:543:e3c3:5a5e with SMTP id
 2adb3069b0e04-54b02ce7e5dmr108762e87.4.1743046093026; Wed, 26 Mar 2025
 20:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0ade43454dee9c00689f03e8d9bd32a@paul-moore.com>
 <CAHk-=wjbahY4JjLCXNT4o3xVq2cejqBG69z+MNfHsN9FQBnbOw@mail.gmail.com>
 <CAHC9VhRExVqdhHqs0njs7NY6bFg0BfcE-gMpS30HW9O7MSDfWQ@mail.gmail.com>
 <CAHk-=wi9m8-_3cywQCohJQEQtuQ+teS4gOtBkWZrhFWzNy-5_A@mail.gmail.com>
 <CAHC9VhT3D7X=4SpO5xbYm=JUwJqTa7tn=J6QMDBV96c7VBUw4g@mail.gmail.com>
 <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com>
 <CAHC9VhT5G6W7g9pB3VM6W7wCEJjWfYSUWNgWF+rRiQ4ZQbGMEQ@mail.gmail.com>
 <CAHk-=whwQhJtafHN4B1w-z2Gno__xLHS4NouKKHrYNTYa8kz3g@mail.gmail.com>
 <CA+zpnLeK2Ecj1mBod2rFe4ymd9eXiJkbyYwFh4Yrmck3DVB2SA@mail.gmail.com> <CAHk-=wiBH8FBL+pnXui8O-FSdyoG-yX81mUF9bsZcC6rR5ZtgQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiBH8FBL+pnXui8O-FSdyoG-yX81mUF9bsZcC6rR5ZtgQ@mail.gmail.com>
From: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date: Thu, 27 Mar 2025 14:27:55 +1100
X-Gm-Features: AQ5f1JrSrI1sSPE5BcoiSUfwnk9rwhlC2MDfagzcey65ot5pl-LSswhH_GbvS50
Message-ID: <CA+zpnLe_AOpS_F1UBNOvN3YRswUSy_3=0jjUAy4GPxEHYumD0g@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20250323
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Paul Moore <paul@paul-moore.com>, "Cameron K. Williams" <ckwilliams.work@gmail.com>, 
	"Kipp N. Davis" <kippndavis.work@gmx.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Kralevich <nnk@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 12:21=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> [...]
> the firmware loading is done by random processes.

That is not quite right. If you look at commit 581dd6983034 [1], when
a firmware is about to be loaded, the kernel credentials are used. It
is therefore possible to grant this permission to the corresponding
security context (in our policy that would be the "kernel" domain).

To be honest, I don't think this particular distinction applies to
Android, but I can imagine IoT devices with smaller/stricter policies
wishing to enforce this (e.g., device boot without a policy, loads its
drivers and firmware, loads a policy that enforces no more firmware
loading).

Thanks

[1] https://lore.kernel.org/all/20220502004952.3970800-1-tweek@google.com/
