Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110E730748D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789699; cv=none; b=TolJNNBaVnbjhTTgZDAIQICusXs1TyiSe4rSDb2xtvt3+f9Ao6hFaEqzf0zC/rif4cj8KbBqZyck/omsKw3DhLGMXbGzkxZNQunA8Lxostsout6eJopotBGddPlwnunqkcMIy1FBvb9tBEZ2Pc1+kweRgHkwTlADt6GD4sMTu+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789699; c=relaxed/simple;
	bh=HnUP0svPZOmim0pIEMKQbuHVRwS2E19LVH1s+PfR0n8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gejTD6h6OIcDzwFXei5UAe0xWD+WG8NOQi5mA4zwudYTaO5DdJ6gUx9kqWWE4qPtV4nylRW46y4ZeFZBD3m8xRy7EuW7J9p3s5uOp7uO5VJTcPk6imjKNib1TEuo7DOFt2SKZ/bdwjG/Zbiw2orND+bk2QBtPYBOyP8aXkVuXBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QxPWyPbI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QxPWyPbI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363e973db1so1937765ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750789697; x=1751394497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnUP0svPZOmim0pIEMKQbuHVRwS2E19LVH1s+PfR0n8=;
        b=QxPWyPbIKKgJcGVpG9syZ0+qHxDEuK8VolNHvL+koysyi9ezaVb30vm8OA0AG2iuQ4
         7GhdEiL9hb80z7/ZzuerHSAyPlB4g9TetFUl7z+OH1Tt3xRg0vzLSXzeUo2G0Xft9rId
         RQzujuJmMLz/q2ZKvgj1O87A2il8xyvbtytVpaqP7q31NhOeLXB+gJOYroP4v0sJPzPy
         drDvMVwNyAbqv3r/jK060QHrQmI/8b1mqkU71Mw84M3Vle5N05Dqd6wgY90PyPG+xHcz
         i7SIE4D5FCnJ3lhnvd9V9jaDnWhm7Vh5DApA0bzlO5xVKthjc1paZjg6MriMMKAbOS5g
         8azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750789697; x=1751394497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnUP0svPZOmim0pIEMKQbuHVRwS2E19LVH1s+PfR0n8=;
        b=JB9gLPYXgHVA7v8T0lbnJV5+aEg2Xlzl6HpXAyhWVEkMjHxZT773NZ0N40SO0hhIRE
         DM8Y+Q/1OouhrCOpmgP2dTicdKbovhWfMwQ+mBUbJpMT1b0UJFdCYSr8S7Xtr68GYGyM
         mvA+ZpcfAU+sRQd9T2Ezm5UEqdJyeXbCd1rSJKQzlGFkCJ6UtXgQkWFN4gU9MMYvfglg
         /qw64N4C/kJKucrxWjOsNjP4gGsXT3ETyVsOB66OXLhhNHhTUXhGyNTty/SljuvYijOx
         LElXNspDxuF4CPSKH4vTvG4scNRy/5sK2voHwU4PgFwYxwI6Mt4FksKt6BXuNMb4Ntip
         Hr4w==
X-Forwarded-Encrypted: i=1; AJvYcCWeZSeb2CR8dpoX+mKvi/G9axnWuMZElt86tIsAIrilH4efwvecO7WOg3TIunOyKp19vOjSRdR/n0h9fOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8WODy12/WKMDLe5rofGBfyHQ5f0np4d0VCLfk1sPKB+p57et
	BCNyOmfyL0u/BBbzNXJecBZLgM93J8qQNFgHoU14ITwikAl7frRRqywBT96wNy/LVISAsPHeP4t
	cBKy3EoSGSgZTxgtEVjGjZ386IXbIUluKD6DunUfe
X-Gm-Gg: ASbGncsYk9+CxVhAa9pZpZ6mhwZCherZn9kIv4R5BwlxgpxnMvEus0E2zy/ZJ32E3XV
	dJVo5Q9JqQqasHHCCnIaIlH/3QPiZxY541X7ZcCTLijSySuCAEv532UkVLqwkLTLKce0CIpARSv
	MDKWaIcUpSOiygye3kHhHK6XOt6J2b6cJunsDK9+f4shJLZinzHGZ3b/Crb/hj4U/E0kRW3DsPy
	Q==
X-Google-Smtp-Source: AGHT+IHx/alFKK0amYvW7aHW8ZW7iOwbioo3APJPkKeIuGq+r3shmRf1C0otKcAvioNi46YLNF8O+aohdTGK6qBzDgo=
X-Received: by 2002:a17:903:32cc:b0:233:d3e7:6fd6 with SMTP id
 d9443c01a7336-238024b085dmr75142015ad.19.1750789697149; Tue, 24 Jun 2025
 11:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624140015.3929241-1-yuehaibing@huawei.com>
In-Reply-To: <20250624140015.3929241-1-yuehaibing@huawei.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 24 Jun 2025 11:28:05 -0700
X-Gm-Features: AX0GCFvWm2VbQkKo2JfN_Igg6WbcDDUDMo2n3YynUPm5ZWEJa1C6CpeGKmShzJ0
Message-ID: <CAAVpQUD7YsaZRvDzzdnhMJFyfXQHe8jip7r8kNuuw-HpL2JciA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: Remove unnecessary NULL check for lwtunnel_fill_encap()
To: Yue Haibing <yuehaibing@huawei.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 6:42=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:
>
> lwtunnel_fill_encap() has NULL check and return 0, so no need
> to check before call it.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
