Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A18DDCD
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 15:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748704470; cv=none; b=qjLh/UGgqIzO79LFeDW5v8YvPuy/PCL7Zh/XitXBvogar8uNiPUucP1yznEZWwKPv9AlJGv/6XTAjUwaT7yZml5z701IPKj2C5689hh99s103MehSt+CVVC0laIKtAztIpbuTueabeitkSyFBrXho+euGthPios4AYpt6NI9hhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748704470; c=relaxed/simple;
	bh=T1nOel4UvVfsq0pDQKlA8OugRmHexP8T6OeA7iXIDdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5XdNngdTzeSSrt4cTTdsBLx16fzu9HStca6P9aZBlUsu0JMkW4VIRLXs+KxZi+Ka2DcjBhggkOdA8rdsKH2XzyYOFxLUpu9RdW4rnmo6BFYFX/ws5sEsshdwyWNFcc3ucCUfkfWATDh9KVtvvtayIKrT8oaSYkSkpL7eLoJWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RJ3aU8yr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RJ3aU8yr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso567169666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748704466; x=1749309266; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lSSawh4TJNRt/0sWPEPpqG3dCXsETs6+b32NUQaU2jQ=;
        b=RJ3aU8yrGpjNYmv9AHpESofl+dBvgfx62FPcETkNiy3+OsgaLfC0G7DXa604GO40Z2
         TdhczAjue2BLGrVc4LwSNDbUPQFNEjD4v4DlpaYsM5E6Gytmq/gahLM+r8v/4tqcpLQ7
         aqgjlPkeSfj7sym6CsNWwnGN3+vsbg3XdpG+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748704466; x=1749309266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSSawh4TJNRt/0sWPEPpqG3dCXsETs6+b32NUQaU2jQ=;
        b=MJBnzECpKSaTjRSCvWp0ri9+N9/5m2qhfB4kTvPEUYuwBuHRRA3dR6OVlWfQlcppc6
         w+l37p+IOAKRC37Ie242t2NWd5rgso1A0OwrVm9QunJOSDFVbSCzaLHDoUJUWRwxYK/q
         DrwYtBOnOiQDDrC7JxhpySg9B1DG4eoDOUmKYw0J77PdK9PDUIbUaou+j7p1hHunQH77
         dMu+nJViM/0tAjaCeRNMYE+sOAYuMWBOg8z+FyOsJye+9WQeGWBmsW4Pw984J3hB0d7z
         38ik09Oax1xRyPWqNOjPuiASdA7gJSxoTCF8vmkhu4zaJ1BZxwoWmJRJAKUvzmrtDrpl
         bjeA==
X-Forwarded-Encrypted: i=1; AJvYcCUyst9n86KQveacbQx66fE9i1YG9EID7jafw5vrlvKV3VMf3LyAK94fc2N2zJKlhpcwM3cCYCnHonJWjKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyra/fiibR5dZLxDososydI0SzzU6hMDlA6ewKpXbTq4l23reXc
	Rm2a+ZByopXs3ribnXKpy8Nbb3Am5TdNbIQkQRbBF7CRa7tYx4kkfDgoqc88uPj5P/rycufWUyV
	fwX6ImfU=
X-Gm-Gg: ASbGncu3vCwWI9Yj0OiSWoxEXb5ydiyaeLlTXiJ39d8dr4f2cv3utjzV1Lq3to815tG
	j8wtaM/fEye0UWgTnvlXNTrbn1aR6KERy9LSCKaltuTc0lKicXnAGQqXR1oy+fkKNjq+PSgkKjx
	5Oz7iidPIVue/RcUnsz6rO3TU/8xg4vawcvQiDjY5az88IEnk/UT2DzXOeURJwC9xKci7NOFCVH
	P8OUGPSdCHC+ugLBZbnLmtMQRQWIK9q6zk5Hau7QgpuxBcjl3G4ZDQ+0Uq6YmJyV6XwjkVxIog9
	gN0/t+F6mchkEf9pLz8O7bESCLsKt0c6J2MVI8UY3YFMlv+J9hs1VKSUIKVGnyjEFvpKg7GJh8V
	4FQeEjJRh3OsB+OnmqIftE7vDhQ==
X-Google-Smtp-Source: AGHT+IH9vckQUJER7cQpyOzte7YD49iPuuICHtwcmk0ahSJRi5tUurwhV/4RhJX0OPmzOt5ZRv9Fyg==
X-Received: by 2002:a17:907:d8b:b0:ad2:48f4:5968 with SMTP id a640c23a62f3a-adb4940d70fmr198544766b.25.1748704466168;
        Sat, 31 May 2025 08:14:26 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39f08sm513991066b.144.2025.05.31.08.14.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 08:14:24 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-604e2a2f200so5601205a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 08:14:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1TRpR3ZF+Db7iSUpjyKJQz8U2Uc6s2IwnY7ewW6lFHIamiH+mBun0+usByMu6N+bwwJLlilkeJmTFsuw=@vger.kernel.org
X-Received: by 2002:a05:6402:42cb:b0:601:dc49:a99f with SMTP id
 4fb4d7f45d1cf-605b7748f23mr2083379a12.18.1748704464453; Sat, 31 May 2025
 08:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
In-Reply-To: <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 May 2025 08:14:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
X-Gm-Features: AX0GCFuT43-u4qtV8M_qs-fcu_pSqgRGcd6qMnD3Ro4tTsTKzf_cc8MjRwFbJzA
Message-ID: <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
Subject: Re: [GIT PULL 4/5] soc: devicetree updates for 6.16
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 May 2025 at 02:07, Arnd Bergmann <arnd@arndb.de> wrote:
>
> There are 11 newly supported SoCs [...]

.. and then you go on to list ten of them. Or 12 if you count Amlogic
S6/S7/S7D individually.

Just checking that I'm awake?

           Linus
