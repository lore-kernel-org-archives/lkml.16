Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6094C7DA84
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738440622; cv=none; b=nq7X7UmJglHUJx9JRlshZpPK2RCVHxCSw6uMiByKLGnrsmzP0+uZCr+0EFgOiJ0PV52jD9D1otPopB43NygnyV3bK7C+EALIlAqrMJ1sxsgPgU0xU841riTMLfC7NaK4rVsf4Ni0pDxnMsw56AWsOmbEPQbxhcMpYAJLWfkNzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738440622; c=relaxed/simple;
	bh=dwKZ9e6C8H5YVBM0MWljIbNoLbFovSt/j2W45tqojAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MaD7CUnAbpyG/1PkAkjH3GZ5AzB07Hoq7moZwshJuJQrqT8FJYASeMoyMalBd44qWfJ9bYoVbWDdq6K7Hv/QnMzL2Bl2Np7ScB2rSLXmJlgnQfWY2PWJ14menbVJYyZ9u2CBleEw8YoRwzwxfkhUI97GyZCv2KPzVU9ktJ6acE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eJeqYeMB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eJeqYeMB"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso649365666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 12:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738440618; x=1739045418; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m7/IZGOLu+lbC+EOSNvACW6MUOzlKWZfo7umiRgi7s4=;
        b=eJeqYeMB14Z7Wm4KMdi76qshfnQAciRQ8pLyBry5mXobsg4YhIhYqihLWAG/7MAR+v
         z8G1iz8aEp/sKF4Bx4Nhy1VR4xGlkQZaSdjWXrIhIysQlt1cokKsa949yAa12y7TxySM
         4MTfPu//iBwEHTt4RA2LsM8Vi2p4lODoWpw60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738440618; x=1739045418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7/IZGOLu+lbC+EOSNvACW6MUOzlKWZfo7umiRgi7s4=;
        b=QESQZRuywL0EgS9XvM13iP1J97ifMywjVu8/NHP+GfS1zMcok2pHSpdWU0xzcySnhP
         d6qnzaRCGcVNLoMIvqVWGpzTRSDuIQgMvh+SQimbk8qpA7oIyLLHYfqaLGSPqtzrzs3t
         Dyr85nqGWJmmQRcasZJix9nQDtDwu6f5UrckfTHI+QsI4f6F3qbCcXyrgOJgDKYD7GCq
         SEW4E1uklJ3ED6DusxNhBPcN3zKFBXeNgovlFO8QxHs66t01QlMmjb7xWpCtS7T76DYK
         SITWfi4+giXdzdmXPYY79J6Wq+70GlP63Dja8fUVKdnKGJH/raBkCk6q+TUll5wJO4cv
         QSDA==
X-Forwarded-Encrypted: i=1; AJvYcCVB2wj9dUkjnVVylvpO90f+AgmU+eG+8W246quZV+Y03qXdQr1x8C9d/4Z9vXQzrY/Svzz4aKTgla0QKUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjaeIQtjuxSvv0hvXLrKosHTiBttMF6cJh7qx22VJVCJ8XqcXY
	za+Xz4htVCVSLQh/0/939USTYN/49yHXDRvMGjiV+AqSuJQDmlSpgWAVc/EVIrQV2mjVFl/cJR4
	vgrE=
X-Gm-Gg: ASbGncvJBHwWuHO6Fb9qHEpqHkCEUd6UaHlM3PUo/FD74HvO4BNFCaZEsPaDE1nGv66
	sVHtKi7w1FCI/u7RVn/3znFVOUc1wbyoZoWoLfdO1iG6eGl2dUsx1yu3h99H0xpPdALxe3SyQmW
	CVfhIFsroTnHN+rIsM9Il6OTS9qm+mwK7CGx/O2KL+Le+gVlWrOc0hdXFJzqaxbmnti9OUcDCiW
	2cn2SVJRA0nSF4sr8WQ0Z3vkcAXwmxpF5RQXtsdRnaEMQIjm5b6mgoTb05PJ1RsPfjKSOpYQl8p
	C6EvGRyLqMUqJVN2kYklgIafyaAQRqZ2qq6cjCDjTFTj1q0XKq1h+aYce2SUdiPo1g==
X-Google-Smtp-Source: AGHT+IGHPKPH001b7Yu3cYgvUXshoqG364QXOqUD722bW2p0gXPuh1cWq2iacCOr1A9laNyIyb3vyw==
X-Received: by 2002:a17:907:940f:b0:ab7:b7d:62b with SMTP id a640c23a62f3a-ab70b7d06b9mr459815166b.6.1738440618405;
        Sat, 01 Feb 2025 12:10:18 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e45ccd6dsm478407966b.0.2025.02.01.12.10.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 12:10:17 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dc149e14fcso5774495a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 12:10:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2aPqXuhAqxXhV5DkeuI1YCPt5lid+r4X7bjm/E1JQduuLP9afUPRt0PyIXiggMQ0VnbVW3TJOz91SU5c=@vger.kernel.org
X-Received: by 2002:a05:6402:270a:b0:5db:d9ac:b302 with SMTP id
 4fb4d7f45d1cf-5dc5effb6c9mr16000184a12.32.1738440616999; Sat, 01 Feb 2025
 12:10:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201185143.1745708-1-masahiroy@kernel.org>
In-Reply-To: <20250201185143.1745708-1-masahiroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Feb 2025 12:10:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiWTPjGk5BDUu-49LeTAr21qurcv9BnjmrYi=ZqbFfufg@mail.gmail.com>
X-Gm-Features: AWEUYZlBdDHAj8QtpERwR2LQThxWjeLDU2DywKdmKDGbnm9LYxABBIuPfrICgqA
Message-ID: <CAHk-=wiWTPjGk5BDUu-49LeTAr21qurcv9BnjmrYi=ZqbFfufg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: keep symbols for symbol_get() even with CONFIG_TRIM_UNUSED_KSYMS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Gomez <da.gomez@samsung.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Feb 2025 at 10:51, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This commit addresses the issue by leveraging modpost. Symbol names
> passed to symbol_get() are recorded in the special .no_trim_symbol
> section, which is then parsed by modpost to forcibly keep such symbols.
> The .no_trim_symbol section is discarded by the linker scripts, so there
> is no impact on the size of the final vmlinux or modules.

LGTM. And I still assume that I'll just get it in some future kbuild fixes pull.

          Linus
