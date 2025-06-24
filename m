Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1039FBA49
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 00:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750723835; cv=none; b=JkOniEEOgsR5U22UqewRwR0oH+TzF2mHXr2RK9m3pJIWVdYaFtWBrYt8t88HWYG0eoagywWE7czf1NIrpXL2fbCt3LdGZrAOUnjbT1gkbDLrP7IRVNz//ZgOWeZi5WuYaVyK2w/TSm62/Wm56fpjyO2pyCOP+pecGKQAWIhM0rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750723835; c=relaxed/simple;
	bh=e33mp/d3hsTBbgP/Ny+fGiGsNkFFlYRoee5U98FHGTQ=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=jFteWc84YW17azUFYg2A2cul9K/MUBIge1FtNKAWgoY8RfHH45fahgyVtBSxFmCoFXjZ88piXS1tVwtbAYMpPG06+Sedqilrd5H5PmIdKCLab29VYTyYn5iknoIUUj4klfKwXRPldHiYF7NnYBaKJhcOwT8zzQOUqAmx6NhhcHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=RFFQohGB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="RFFQohGB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23649faf69fso48035515ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750723832; x=1751328632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwIH5Rinmz61XRoMBG+P82QRME1pYQSd4FCtYynYjPE=;
        b=RFFQohGBl0tm6PfFB170v/i66YPoG8MMPf4rz3OlNUH5rAf1MTzCYz+m1ydzvdpQdb
         +9I6bC6d3zdiDbpzd4rSXs5yaWBeCf6TkQ4xQxrstIDJXdQ8Bp7LkFBU3nbzaDpdWTR6
         m6r4ls0vCpv3kQQm4noPd33dMcb8q85QNG7bVUB5FA8rZ9H0Ih2BfgGP/66+EAeKK6Ze
         bIBF7ZfAoO0p9Ev6noUEFPvnZSON2AeD9Wii4Sw1o/tYrLaJBfoWVYZz5C7swwUSM95c
         OWGp/fEruTGH3HUp7VrG6WgdV7BC0E33B5WtygFv3mW6E+vtbbI17/anb9RYmsuOgMxo
         5H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750723832; x=1751328632;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwIH5Rinmz61XRoMBG+P82QRME1pYQSd4FCtYynYjPE=;
        b=SKRb+dtIITtpbzP1UOO7NDNzboVEkCTslT3N1G5V1JVT9Vf021wP1wN8kQJijt6Cza
         FQdvDOZG1s+13k1tMhf1wCblwaD6bXhegE2MomcT44SG5YJyUbWXghS43hJO8zZp0aV5
         uXDkuDymrmueIGIQEL/duN8GNPElikdkq6FZXGY6lUhyP+k+FnCHt0JW6V94Xx4ClZQl
         6gF6F6sriHrjU5nrjll2bvgWIFpJ8v3gdxdcwEuebe1PT5JLh92nOrz0XLaWe+/yug/E
         CjZP9ihLbdGRvHINtQPd9hsWfa4gzzz0y7DVxH+3e+TfRAtwNoeddMl0L65N3uDtRc1g
         jbhw==
X-Forwarded-Encrypted: i=1; AJvYcCWisYAnRcAb9VY6balqWJFQZTKiwmkAIB32j2UUbEfoALaBUqZWkjky+Aqsb+qCTvs2bGVju4cJrexik10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7re2/GT94KI3Odui6xKrJCZ2vFm//yDQINgMx22rxzm/Yz6PI
	65Q9Uo2Jj2k3MTweYO7+/b4p8QjZmxgtSqmcGlCAXI9lyTBcjOqnysPQYATjkHpeiNUhpqPWEU1
	m5b0zAyw=
X-Gm-Gg: ASbGncsoiysVdeM7dKoTjD4v5XSSFBzY8r1CcU7Cd4Q8pZJJL/bqEJaBX8TMW8YVHNS
	VO21MstA10NTmB0sl/tiOO1yg0K/KLdBheJX2NYjhuMjuauAQ/3b49Lg9MTwiuXB83n7KKeJj4c
	0pjM3QGGWMBRnP/qAIIXUCqLVtljDXQffEUtDzgyyLxdpwpBsvojszA5Qm9Ni78HpXzQOXRXyqR
	DS0icsHkvWMk03MLevfkPY51pqVE5KAGgiS903FPPmRdD0jyWHKUCfRApVJvoa7EPJ2UEbv/ACn
	R6J/xG8WcDmYXC/fQAYJ325YwmDT3qkqwYk6ghhPnRYgLHi7DjT8o6mSZHhR
X-Google-Smtp-Source: AGHT+IFViMfol5Wo5W5fiV0qv/Ae4YNuk6o/gwais386gpzEpceWg9uNhGaXi9o2rdz5IpZWZ2IY2Q==
X-Received: by 2002:a17:90b:3f87:b0:313:1a8c:c2d3 with SMTP id 98e67ed59e1d1-3159d8c3e17mr20179355a91.22.1750723832187;
        Mon, 23 Jun 2025 17:10:32 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315cdf8d7aesm229777a91.1.2025.06.23.17.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 17:10:31 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:10:31 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 17:10:29 PDT (-0700)
Subject:     Re: linux-next: manual merge of the mm-unstable tree with the risc-v-fixes tree
In-Reply-To: <20250624100851.40f8b416@canb.auug.org.au>
CC: akpm@linux-foundation.org, Paul Walmsley <paul.walmsley@sifive.com>,
  fustini@kernel.org, duje@dujemihanovic.xyz, linux-kernel@vger.kernel.org,
  linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-B82EDBD2-2149-412D-961D-9B999FB009BC@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 23 Jun 2025 17:08:51 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> On Mon, 23 Jun 2025 10:14:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the mm-unstable tree got a conflict in:
>> 
>>   .mailmap
>> 
>> between commit:
>> 
>>   850f0e2433cd ("MAINTAINERS: Update Drew Fustini's email address")
>> 
>> from the risc-v-fixes tree and commit:
>> 
>>   a5d3f8d805d2 ("mailmap: update Duje Mihanović's email address")
>> 
>> from the mm-unstable tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>> 
>> -- 
>> Cheers,
>> Stephen Rothwell
>> 
>> diff --cc .mailmap
>> index 93e94b0b9376,60165a8144bd..000000000000
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@@ -223,7 -222,7 +223,8 @@@ Dmitry Safonov <0x7f454c46@gmail.com> <
>>   Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
>>   Domen Puncer <domen@coderock.org>
>>   Douglas Gilbert <dougg@torque.net>
>>  +Drew Fustini <fustini@kernel.org> <drew@pdp7.com>
>> + <duje@dujemihanovic.xyz> <duje.mihanovic@skole.hr>
>>   Ed L. Cashin <ecashin@coraid.com>
>>   Elliot Berman <quic_eberman@quicinc.com> <eberman@codeaurora.org>
>>   Enric Balletbo i Serra <eballetbo@kernel.org> <enric.balletbo@collabora.com>
>
> This is now a conflict between the mm-hotifxes tree and the
> risc-v-fixes tree.

Thanks.  I think this one's just OK to call out as a trivial one when 
stuff goes up to Linus.  I'm planning on sending a PR later this week, 
usually Friday mornings.

>
> -- 
> Cheers,
> Stephen Rothwell
