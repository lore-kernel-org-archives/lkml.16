Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528851A3168
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751484168; cv=none; b=kO68ACf48Dh2zxHm3F39DQ2dDhISu50ercmWrxC/g/M9gM7u08oy/xOfejaxBcHW4EGodOgub6LcaufV0h+Szac7OolyU2QZ/s+QFO/1lwMR53P7iVsBzQ1//bWC+HJWB/HAlt7DWUIUw6vyA6Xvn1NUpdU+ttxo2ZWT60dNzIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751484168; c=relaxed/simple;
	bh=HZJTmy8iMO10Pr+vq8YahlcUAGD8UjSWaZ2SUQyXxWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcElzC7mYNCx8eK1T6/Qv3st/AuFtuFQVmGbPzUPGlTL5cDpNtn+UwGKaVk5UvaouAfI7KyjUbyeu2UZjgO3qnCvHID33icF1nHj/R+o15r/QrJDrHjerPAJLxorzpRQIk0Xk/oFyIhPK5ygMjqsuCDV23KC04Jos/5rxtUKFzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eg5TndSs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eg5TndSs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2357c61cda7so1115ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751484165; x=1752088965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZJTmy8iMO10Pr+vq8YahlcUAGD8UjSWaZ2SUQyXxWE=;
        b=eg5TndSsd/8ua+GCAxL4VSws/Xy/v3jrUWwbEI6utsy1J/U3c36JIWEy0N/J8SD+wk
         bpcZy0iWJrWtqqT4ntpG5RKKzsf4AF6Ba+nhCGZl9LagDOl+82EPMNAuuLSiCq4cmV8A
         rNSEfh3KE2VmRcx9daMJW9MuVUfgtBeT0DOmTbyksWJv1Ycj4wvVk+PnUjCMnDhe1T55
         deAboam/+iq35n4D6YJOMqUonDR75ZePL6KF7Y5f62qtOr2F0j12lpcx0EBKqnca2wsp
         1GrRH4tS1/zOObjhh3zJBo/czHED9Xft2CK5ltyJLhQ3nelIQ0AaSqyNh9X5s/kF2Vd2
         Bc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751484165; x=1752088965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZJTmy8iMO10Pr+vq8YahlcUAGD8UjSWaZ2SUQyXxWE=;
        b=OzW+5PIbdtHsAT43kHk9alVe907AmPuaQnTMH/kV0cT6U5/DVE+X1CJ3r9WbyS4tq2
         gmqpn8t7Yq17snw0PLPC0OM8oNgsmZqbn1QXxb7vAouUhvlTCQd7xkOVk/r85H3nwAI6
         2xLj+hGPbfaL7C9WqQXsNB9dCZerDx8dyMu4iEO4zD3v1eTYWKISzhsSVNaNjg1Qt5dR
         FC24XDzjlS/mw/42T7gVxUtPmIkLaJUc4NxN5u9GTEh+xve3eXQU2CaiqpqK5KF2l80t
         nETzNvkDGUqYU4ktFWunJCfFv2LJ5W/25+xozqurScF6Nyz8gKcR/WxN93yO7oDYC8z3
         /7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh7xFCJuC/WHE6efKoe3UoqkCYxPLkTptOTABk7TMStMmbLZBQRljylYTpQ9XI9xN8QzMWJhF3+y6B2Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1MzCArCfXCAl52eX/aGXdZ+VXt+aGCmd9k75258RemVWy5kHo
	C+7BFyubLohpc59eYyPQtIcM1bVjvZi2eCHkdn2EXGgx2NuZMdvNsNzbc5kPHSduYkdd8X036cm
	pO+ChrkLCce/3yel7PpZDLrIhVTUhezT7FTpVuYZR
X-Gm-Gg: ASbGncsrEdA8i5+F2ogqlQse7WNqCUqBBtT/pTq9V0SdNH5nyYpWuOuX9yKEgei6nk/
	fdX/fNibcYyNdanaG1csOpZi2rinrsDPKqw9kj+FY7v0+e68bTbf8Tro8GW52cUKjVj28BtTfGA
	Av5aJzCPTuTzzlWqc0hPooov3rhTHHA9EOsHA6GWe3rHKtZ26STUP+Z/+subE5NS9iQKHZW165i
	U1WQQSwww==
X-Google-Smtp-Source: AGHT+IHQLSfiroyPrvtjIH75/x04Z0wW7cXXEfFpIKcEWvbcst14grCY9C1M69L5O8b1+9jLgicKYNu7hMebt3h6sbs=
X-Received: by 2002:a17:903:15cc:b0:231:d0ef:e8fb with SMTP id
 d9443c01a7336-23c79ada75emr506775ad.10.1751484165285; Wed, 02 Jul 2025
 12:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630080603.36171-1-jiahao.kernel@gmail.com>
 <CAJj2-QGHLRqY4mPyAPg2eT+y+4yNfNb__nON5ndkY8WG0UmKVQ@mail.gmail.com> <f50f8ddd-2ce8-47dc-657e-7b0edf80a508@gmail.com>
In-Reply-To: <f50f8ddd-2ce8-47dc-657e-7b0edf80a508@gmail.com>
From: Yuanchu Xie <yuanchu@google.com>
Date: Wed, 2 Jul 2025 12:22:28 -0700
X-Gm-Features: Ac12FXy1ZNhvLawpJ6OqYRFDRVM6dlFtYPyl7ZfzYq-VH3wH2jHIMoCeLMX6ok0
Message-ID: <CAJj2-QGgHSdzq5DqSi5M+XGeKWRD8aeH_C-OptyCDeV9CEHkBA@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: Stop try_to_inc_min_seq() if the oldest
 generation LRU lists are not empty
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, yuzhao@google.com, 
	kinseyho@google.com, david@redhat.com, mhocko@kernel.org, 
	zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, 
	lorenzo.stoakes@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:45=E2=80=AFPM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> Perhaps another way to explain it is clearer.
>
> It is known that min_seq[type] has not increased, that is, min_seq[type]
> is equal to lrugen->min_seq[type], then the following:
>
> case 1: min_seq[type] has not been reassigned and changed before
> judgment min_seq[type] <=3D lrugen->min_seq[type].
>
> Then the subsequent min_seq[type] <=3D lrugen->min_seq[type] judgment wil=
l
> always be true.
>
>
> case 2: min_seq[type] is reassigned to seq, before judgment
> min_seq[type] <=3D lrugen->min_seq[type].
>
> Then at least the condition of min_seq[type] > seq must be met before
> min_seq[type] will be reassigned to seq.
> That is to say, before the reassignment, lrugen->min_seq[type] > seq is
> met, and then min_seq[type] =3D seq.
>
> Then the following min_seq[type]=EF=BC=88seq=EF=BC=89 <=3D lrugen->min_se=
q[type] judgment
> is always true.

This sounds good to me. Can you change the code to use one bool to
detect any increments in `min_seq[type]`? You don't need `int
seq_inc_flags[ANON_AND_FILE] =3D {0};`

Also update the commit message with what you have here. IMO much more clear=
.

Thanks,
Yuanchu
