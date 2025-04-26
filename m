Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE0BC148
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672989; cv=none; b=n58t8gi+AT5TrGS+jVtZeFJuRO/+6yq1uhgG73ikrN3byKS0+RNmLlkUkNcc052lXk+ObcFeaQIZ/Nwns5bxWJwA2HBq9HLJQOgqbSDp0D5fpGOKASt4qeRYhO6R6TRxHwGGoF74jQdQHdnQaw8BGYRpFlaOk/qEyOhhBy9YnGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672989; c=relaxed/simple;
	bh=TrjXobdC90aiaVYJS8Yxpcn8NpZlegdCI/+sCJqaMoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNGN6l2n+rTObQTd6KxCg75I5LTmYrt+FzcnafVE6/K4BTKzQMbNFUOhgYRUiTpwmSgJnOoIlpWmqR3B5KC7VGzFap28Y54+vt+1BOUvJe41WePO+TxjrKtzVh1SMtfJpAAF2jDggP4EC3DuNOCJRW4u/TaFz5m5gaLjZ/vg3c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=G8OYn6RV; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="G8OYn6RV"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af52a624283so2932750a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1745672987; x=1746277787; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TrjXobdC90aiaVYJS8Yxpcn8NpZlegdCI/+sCJqaMoI=;
        b=G8OYn6RVQSDqkXv3ue8YtDBU0Uuw3cA/Qe/FE4rQOs+xOJrrqUQKOeNsgoRaxQ2347
         uY6Ho3K1oMTW23zNkJgQ2+uRT12l0WecniqeepvFp1d3RNi8up2sc4TchllMDs9GkthQ
         qaKGI+ylR7/AbaT2yFSU8i101WuKOWdV7aoZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672987; x=1746277787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrjXobdC90aiaVYJS8Yxpcn8NpZlegdCI/+sCJqaMoI=;
        b=kjYSwL8WFJuF2KItgNJsUA2syfkLlLqK8MbpDrTacSTpH/o3K87ndT7MiZRTN3z5Hd
         QH42QR986Iqb8SE41IBll2Ib7ihOKVzTlkmnV6VOQ8rnSl2mDmxS67tHN70OyGr6h1Ns
         WXPcOiWQxSy/KZ1DgE/9K0t7UR2NvUUjP9HuUY2B+RXu0exNsC7RDI3xgOuTBoWU6MWa
         Xu8Irqt7Mfb0o3evT1VKEVWI8tXZdvpb2o/ZrLeArhIx2yc3oM1fdy5CClF59qxv3k+D
         MggkbhTTt+/Zx6IArOAulRWfqDA1tbgje/hIWH8K0lOTVrINUN0Owp+jJHa9dqtK8IeY
         98Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU2JZZZKtSBPrwqokKY5ja9Bpknp34igZiwqUfvaDMk4iOavljakCgszT1zd0MOfZ3KxYnfhjomx2+o14A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2nu2dgim8PW/UiCCvEWyIjrAHCJcWXtV3gGYiFFiOdBOIFFX5
	UyOZNtwp+ZyNpCzYXeQhtdH7fC/2yb/uI8lpFhsD2d8NmXrjkFCKA15F9vfF3hg/dQ8u1lwbLxp
	h1NowBWXQK3p8aBXxDxGeTn+5SbwDPs8S2co0CA==
X-Gm-Gg: ASbGnct6MdOlL9H2acfgjBfQLhd0OgbP4XxnfaXyhdQa0LsiM1gl9CHXFjLFOAhyqMD
	ASBoUSRWUT3Dm1Ag3l0zdGfMOB1R0HFDllLkFDvnSVJvawK8idy4jx8/cVlhmvbmz9Y6HWTDsj9
	QFRWyDgwdVOv7Cx4OcWPK6EZH4btEH884+QStD7C2bFhgva3swGvfaLjyE
X-Google-Smtp-Source: AGHT+IFJ8jroVMyUx46fuQkn5I3LWI3lMSwo+PJo+v8BlHjbMXEDdo7FPKYRBfs7dbf21CFrjeWTjH3Cwc5FS76f3UA=
X-Received: by 2002:a17:90b:42:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-309ee37b550mr14275518a91.7.1745672986837; Sat, 26 Apr 2025
 06:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426041212.4141152-1-daniel@0x0f.com> <20250426051423.GA8239@1wt.eu>
 <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com> <20250426065613.GA8661@1wt.eu>
In-Reply-To: <20250426065613.GA8661@1wt.eu>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 26 Apr 2025 22:09:36 +0900
X-Gm-Features: ATxdqUF5EkdwYJngK6gRuGlAEq-Y6P1m84eowWORfZZjV9CfX2nsT1VdlVXuheU
Message-ID: <CAFr9PXn8-y9eq9YeOAzAs40WJM6Z93O6LYr_0PwMdT8TqiSnaA@mail.gmail.com>
Subject: Re: [PATCH] tools/nolibc: Add m68k support
To: Willy Tarreau <w@1wt.eu>
Cc: linux@weissschuh.net, linux-m68k@vger.kernel.org, geert@linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Willy,

On Sat, 26 Apr 2025 at 15:56, Willy Tarreau <w@1wt.eu> wrote:
> OK no worries, my point really is that it's important to implement the
> test for the target platform. If it's mmu only that's fine, as it will
> ensure we don't break it in future updates.

I sent a v2 that adds the tests to run on the QEMU virt machine and
seems to pass.
I tried the user mode as well and that passed also.

Thanks,

Daniel
