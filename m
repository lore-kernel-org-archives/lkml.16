Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C5C9476
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745362913; cv=none; b=J8HxqHkYhSqEiR7zQKiOH3Amb+fazJBhvgTs4IzTqICeDQ9DClKlEVe2o2yl4hPSPsu7NxW022HtqPjnfJs1OZqJh3JgsKjXlstFmQm7KVTSpXdRIg0/+pB+zNhxGttZ6FWhwZpSfUCy++UyOTZP7W7ksRbLIph/o201wUnwG74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745362913; c=relaxed/simple;
	bh=Fvl5lVP4QlVyhGhgay/xKGLuJydTxA8wrwxFBPh9N7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbrcivuqqEjbp0IgCA4ab3KXAEH7I1U+fKmMsNXw4YsziztHnEzqzbb6+LYOXcFWvdlei/g72BQvvykMgcvivBzBRDtWV10qByMZkr/4oIY6lSwqhRrSKFLhGhaI5HvJexvKCZIeXIWRt/L2zr/KqUC85iCL71nkQVHXENULG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbRvRdZz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbRvRdZz"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abec8b750ebso845398266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745362909; x=1745967709; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eN0DDQIJwQQISfJ6x0plPSxpzD5walcrGVfFEvpJ5nQ=;
        b=nbRvRdZzRE7DzWteyxpYdsCVSthCXdP/WF3s8tNqajWxys3WOnpFeT0Ut+Wb7zkG+Q
         rqAswIGcgH3/B/prt1wzYpmRpGSC0+X4GNEGai9ErBakmcobzZ5QxJ+VQPpDQYWRoz+s
         NU/RiOJNQ46MEM915laVXtlJCKs16PGDSR+/PGZmaAFkxkT4nZO4ibUp5HtAfUAjj7Xg
         +/oDuSEXUEKU/2sM6TJWTun1Wk40OrydXoPwwqUHDmNymk41szaY5bBOXBw0xhx3hhNZ
         21Bt1349sKh2rm8w0rc4vyu9uqyIpFc3VyTa7jnxcvzRvg4K2hIkERLeM+43V354XOcA
         FsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362909; x=1745967709;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eN0DDQIJwQQISfJ6x0plPSxpzD5walcrGVfFEvpJ5nQ=;
        b=MAmKZEfypb7SmeTmgRkXw37ies40wZDmSq085CSJlWrKalp7/l2UpLqUZzDPpwtNYk
         0xibRPg4RpOYrdAfLbRZ5IjOScU4tmcDdpJkae5Iv+NGSsr/YV2+lmOkgfODh9+tn9io
         j/Xpw3dKmijFAhZ60cngH2HFWUkcxxblDgugXvEoJ7pTyeiPxCAoDQ3qVKo8aE8kujT4
         JB40BZ5lJImn5Se3s46vX1d4UKHpOyIHq5nsoqDg8DI9avUpl6pNnQoD48j6L6ngwe+x
         y3js+CycCU14ROtrcPmChmC+7dgpysaoN5yX76h6jJZRalMUNPmWRHTKDLatxxQpJRHz
         zbPQ==
X-Gm-Message-State: AOJu0Yypw5R00Uq+dlO9Q8zFQKtmxrX7BHI9Nl1B9I9JFW5ebPs4T/5m
	nsJtAHZamgnN3wht5+S+2mXGDhL96HIgg1hO9CaRTblxF1yC/n86Zu+qX53mdt6d/WAQLxo7VxA
	whQhLiz5N6z2r/GrnLphVgrU/02U=
X-Gm-Gg: ASbGncsmFLPAlE0EgDoH0EfyuWQRvQrref90hZSRsqp+/WoCbgtYKJJcbcSy0mVE2sp
	r+oZKk7nZ2CSKz4n4+nFY4MQ8nM24Sj7lEOq0+QSgCBuTHJ/t/0ibZSurYUlYkwyZ7RRQYO92Eb
	SJF4cv0UfPV4Oa4M5DshSI
X-Google-Smtp-Source: AGHT+IErhHg+S8bBoi4ME1OGXZC5s1xiki+mUiEKaajGVldY/f1eWPq0zoAM2Z4H8LpFsD1aEnhnnJn0RZ54fJZJvJI=
X-Received: by 2002:a17:906:c108:b0:ac1:f003:be08 with SMTP id
 a640c23a62f3a-acb74af287emr1235765366b.12.1745362909442; Tue, 22 Apr 2025
 16:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
In-Reply-To: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 23 Apr 2025 09:01:37 +1000
X-Gm-Features: ATxdqUGS1UtKNzDwVJjTyiMB3Y9wHoejoAAR19z7N4jUwXK5cKktPNhacD9EklE
Message-ID: <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
Subject: Re: Linux 6.15-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>, ast@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Alexei Starovoitov (2):
>       locking/local_lock, mm: replace localtry_ helpers with
> local_trylock_t type

This seems to have upset some phoronix nginx workload
https://www.phoronix.com/review/linux-615-nginx-regression/2

Dave.
