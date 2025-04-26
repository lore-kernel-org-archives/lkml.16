Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445C2440C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745681645; cv=none; b=GtUHhtTyNeONOTfTbM2C/aPI+PBf4r1m4zZXq/rmXot5BUZIcLJtUn6M6iP3joe+swvZOr/qUx0QNkxFvhx/6EeFP/nA/CjbnHOP8it+yjqqlD1G7BllW1v69RqpGwg8ZUl1nzmZ0KbhrcIL4Tecqkn7IqWglEu9SZhy4pRzMSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745681645; c=relaxed/simple;
	bh=efeGQbHLDerPawNiWy0UWzTlDAZvY+aauNBsOnalqVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jABe1ZeFFTIcmXxTEtJb5FMIBUlIw1cJYc+ov5xlM1fqv85TjmR8p3MIvKuI9VewCnsCQRZSKMOD7sOfpQtHU/IYEXF7w1sJDT5PxZFKvfEw0jj4SyNKjLuSlCcNK9kRtcQmLW4nY3oWTdlHvx2q918/z0tZuxyZ5G6zDRfMB48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LAHj99m8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LAHj99m8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1914748a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745681640; x=1746286440; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HbfGRFY1ORn8OxsWarlewNbSwUtGm4LLMqrZX4kLbSs=;
        b=LAHj99m8X31Dh0viYrL2kWIqSJpSIklZcc3thedKUdXX4go5NySxB7peLtQ8gmvFVj
         pmOx8YXma98FHQfH6D1WPAwhf/TmJPApGF7Zc4Sz87dH9y0AYpd4SGfTYmgRuYXcY7C5
         lNyOJcYuYJenWO01UXbKhKVDo+jdJRWtGZHDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745681640; x=1746286440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbfGRFY1ORn8OxsWarlewNbSwUtGm4LLMqrZX4kLbSs=;
        b=QEEFLhp8EoVnhil2BRvAg+hiUIkYbKtQfLA8/52fLi6lIycudCReFAw+ZR1g0Pygef
         R0vchrpDpADz6X0HM2owD0SXuPLN0832L3PCPLINuSyXdsDd859s7U6YHHNyNsI5cM7R
         REeloanDxuYnR5mw85V9Pd2AUYwsuph8sq5oo/tQzb5IM7w03tAFFqy6XMHXrXWVF4fh
         UCWXL94MV3FeQKPI6ORx27tuneSE4haSbmn01gFTaepHgMzNqmVTWxg625U34g+spA34
         FiXNzcUUNuOguTl2BFQaDNoiZr8WEXf3cfkIC1Ofk2BJ2Ff97hyxKpC/ThD8/2fia8I/
         7pQA==
X-Forwarded-Encrypted: i=1; AJvYcCWeT9eU46/nkCUlc1e6MhQopqgKdgoYO3KWN1myiMZzctYvv+L2lLC0oh+jsLJ5JkKZmUaobCkHxfxC59g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2CaRFb8+Hgqo5+MPoZPGZjh/+rpPHOOe+hkuPN2/kZIhZmfv
	c4kwYqnbDXp16FFhLr6oxsd3Jp8JRdOtJHtrPaSZaF9fZbJXh6KD2W+4Am1wGMZdhAE2BehTl2b
	DV9s=
X-Gm-Gg: ASbGnctFKL6l2IU5fkY1Kp/VK1T44W10b17nQ8g90PVEf01FzlUbnfC81DIh3l3Sdbn
	zcWVTPt678g/9z0ahXQnyNXbYX6FvA9Ayzfn99jMRMwvq9Lyozwpo5n1ZQ9rWIxx2APdIJulsWE
	Z0SK0JB/NCnwcymhJoxuC7vq0bTczDy+BllMo/Nz4NRRaVSbWpJGVLEFhYqESZefswvHI6UHFQu
	Lwp/B0nDhEAEgSoezTb0LyGx67rCC33mP4my3Hzxk1ZLfq66jREOIYV8DyqfwIEepIAvSLEzFOq
	7qJqBo9hrWRkmItLXcqsOmrC3kuBJsaFk4gyz2xjXymNWjafu2QQkR6aPvAvaQpWm7ND94oRk/V
	KBuWYTJYsacauJPE=
X-Google-Smtp-Source: AGHT+IFVTP5W6Tj8gFDPbZkqK1UKSj1VuL33x11GdakaE8TsOCdG0C+EOS+iYwSITVi7/DaSHUy60w==
X-Received: by 2002:a05:6402:3490:b0:5e5:854d:4d17 with SMTP id 4fb4d7f45d1cf-5f6ef1f7f96mr9010209a12.11.1745681640283;
        Sat, 26 Apr 2025 08:34:00 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035464f1sm2782653a12.62.2025.04.26.08.33.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 08:33:59 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac7bd86f637so840569366b.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:33:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVsFUpYGJvndt12ITM7RO3CSz7WwTfIaZLfrzmlx0FAMFeOYTM2aNRJDHpfgTd8c2y8izIZXXWSwk8JFY=@vger.kernel.org
X-Received: by 2002:a17:906:ef09:b0:aca:c67d:eac0 with SMTP id
 a640c23a62f3a-ace59dfdf18mr954992566b.0.1745681639385; Sat, 26 Apr 2025
 08:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
 <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
 <CAPM=9tx2XsDNFDWkxndpFPNihgf18CK7Ps85vE4ZRvuLBG35UA@mail.gmail.com> <CAPM=9tzh5sdpfDXQgLymXKn2_qf7ccN4EsAEaYTNEY=hWNbGNw@mail.gmail.com>
In-Reply-To: <CAPM=9tzh5sdpfDXQgLymXKn2_qf7ccN4EsAEaYTNEY=hWNbGNw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 08:33:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMccpCwD2q2EADXwOUSzHspuAn-hkvNYKAQLnAcZmeoQ@mail.gmail.com>
X-Gm-Features: ATxdqUFbBNCkGjEM_ki0jdb3CgQwcJU2i7U6M0VeEhqz-zXX5qfY8nimjN_etBA
Message-ID: <CAHk-=whMccpCwD2q2EADXwOUSzHspuAn-hkvNYKAQLnAcZmeoQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc4
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, bentiss@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 23:54, Dave Airlie <airlied@gmail.com> wrote:
>
> It seems to have recovered now, but not sure how stable is it, please
> repull the original PR when you get a chance.

Yup, all good now. Thanks,

               Linus
