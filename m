Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1567E264F89
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749598698; cv=none; b=eTFUAsd6xDjOX1XF4ctiIjDDhYcY1IKzM4LHKVWkhrselQnnS/imfo76UIxItTICytFzCXGcPk47eKphsGdrw3PvD22qnxvZBarRbLmpC3ja43p0a1O2jnrsQ0llgQ3KGnbSu5H0wwuMG3QQGwAxhU2LD3j8/0sZOgW2bln9Bho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749598698; c=relaxed/simple;
	bh=pgbKmPHrWgCcv8kF2j7OWtS1gZM5ZDz3nXA9o5uRuM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpdeK3Al+8l+sU2rjgvd0OY86Fjz5W8LlKtJQZYi77iGxCE4ireM/yIs0Ky4yJDWOww/3T1XhEBEdzNNFSghwbYG1WwaFh1Is+hkkqGQq13pbySh08MnxKkFEliacFZoqiuBPlFdkMJjp4OEhFZrZ0eQgAMvHgSBbzymuy7z+ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OEcY+yGi; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OEcY+yGi"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3122a63201bso4986796a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749598694; x=1750203494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiGLH/pU/piZfQOirrWyYrCH57huKV6y+4CiDqtk8kw=;
        b=OEcY+yGijc2ek4kBKsObaj0RnJ3URZyzTAlyzcvJb+/zl3Zyo5Kf7N93GJKd9n7Sp9
         jaDbCLGvlPE7h+w35sQcMxv7ns+laisAlPo4upyaqWi7nH1NegazpYNSHW/R9jTgkXBa
         cNI9qaNi5VWEFpz5lHD8ZH1V7R/yqE4o1jE2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749598694; x=1750203494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiGLH/pU/piZfQOirrWyYrCH57huKV6y+4CiDqtk8kw=;
        b=LLoyORuuzO9UZoo5qdjyAfbkCXU1aTrqYgAVT3riv7MBe5UDF34Msk0WBTsUijqEx0
         9r0ho6NvbwRtOQxBu12UvPS7Q226d+i+6lyv1edEJKFkUqBYGrKVcEuOC2mu5WL2XjJF
         1Qsxbe4BWjFgOopetrWIoIh8Axa0OIjKBddB3cXp5ilTrt9LNs3tbdHMN/+T1L8U9ena
         dp0YY4+UB2s5u/0D1Yg44D5LBE1+GPYCiw8dmp/3ufpDHzPGTzhZdXeaU0rqFwjQRKuZ
         KhkLrUg2N69Br2BvCmhJdKLWeqTbfT08Bony++hmzZsc0zWiw2VdslmeTOKgbcCNFQ2b
         InrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuuQjDwFoILiwEft5PuDnbXRkKIeMus6aZ9jJMWqtA9dfIvVmPjVcQ3Lksn+O/73YDn6xP+EYMGrwAbJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtSozDnp2BJ/QLZTRyPAZHzMqiB8NVKDgzu68Z5LpgvFOSjuEW
	Ykz6eqKYay+arYmvH/bcJXh4/OwhvUYVnmnT5c3ImIl9Ec2P8ac75b1qMeeOWcDbaI5X1QRAgP+
	MA0c=
X-Gm-Gg: ASbGncsEKbJPQ3yp1MyMQjuhIQMMba9sEEFhh/TyxAhlfYDXbEq+/EmJmlqkrW0kY+j
	PU2xZKn7s/VtkNRkHnSKoO6r7yhqjBohUp1BE2aY5PV5beDOEBqbfwNEYmIO8zSm2rfCi9yx06/
	IlkN4xTUDg9dK0a7NiZBZqR+giYpRzJGWAs3lpXRDfjkgNwtYaohN/EIc9/gcFtAwvyCjSRU5as
	54N5pHSpomqCrki4WxDo23ucklQ1pFJo4IKDpoysgWTgvXIR1Ik+PKwChbIY2vg85ywFstgUUXt
	MitHAHpzABb7VZvD7QiLgcsVHfxgwlLYDJp+/99G4PuoBEiJRRahViFPl6BPZ8/bLk60ABuuNa0
	YV5p+q9T7v8HMNpXgynTN3L9/xw==
X-Google-Smtp-Source: AGHT+IFmgv8SODne883c9y59RFlW1BoxiZdSd9LAg20dLNUXy18GWA8mDMTNGN5wRtVI7niPRGuQLA==
X-Received: by 2002:a17:90b:2643:b0:312:29e:9ec9 with SMTP id 98e67ed59e1d1-313af1dd043mr2096853a91.24.1749598693738;
        Tue, 10 Jun 2025 16:38:13 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b20112d4sm171293a91.20.2025.06.10.16.38.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 16:38:10 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5198446a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:38:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXy9s+jkwt+6JDrNmBkSSczvwva0tQMstJbEyYKthaSpPhMSwpeoPcEzaYpjGjk6AmhzBC2Wlj3/gdLW+k=@vger.kernel.org
X-Received: by 2002:a17:90b:1647:b0:311:df4b:4b82 with SMTP id
 98e67ed59e1d1-313b214a8f5mr622260a91.4.1749598689503; Tue, 10 Jun 2025
 16:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507104337.201695-1-colin.i.king@gmail.com>
In-Reply-To: <20250507104337.201695-1-colin.i.king@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jun 2025 16:37:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XjZwN9dga2OXYY1dBAe=B5QkeZQhEygA_wxXvLatY3rw@mail.gmail.com>
X-Gm-Features: AX0GCFtZvEBl-EmIFHzeWRfTaVmPsBdOiaZhoqVl1uW5_aP2qYsrjz41aGR7LCY
Message-ID: <CAD=FV=XjZwN9dga2OXYY1dBAe=B5QkeZQhEygA_wxXvLatY3rw@mail.gmail.com>
Subject: Re: [PATCH][next] kdb: remove redundant check for scancode 0xe0
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>, 
	kgdb-bugreport@lists.sourceforge.net, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 7, 2025 at 3:44=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> The check for scancode 0xe0 is always false because earlier on
> the scan code is masked with 0x7f so there are never going to
> be values greater than 0x7f. Remove the redundant check.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  kernel/debug/kdb/kdb_keyboard.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/kernel/debug/kdb/kdb_keyboard.c b/kernel/debug/kdb/kdb_keybo=
ard.c
> index 3a74604fdb8a..386d30e530b7 100644
> --- a/kernel/debug/kdb/kdb_keyboard.c
> +++ b/kernel/debug/kdb/kdb_keyboard.c
> @@ -145,9 +145,6 @@ int kdb_get_kbd_char(void)
>                 return CTRL('F');
>         }
>
> -       if (scancode =3D=3D 0xe0)
> -               return -1;
> -

What a glorious bit of undocumented code. I agree that this is dead
code and should be safe to remove.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
