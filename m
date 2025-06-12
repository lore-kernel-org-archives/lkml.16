Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6C231848
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754655; cv=none; b=OnL39xYbkrGr3TTu6KknR8aatisJF0deR/9Z55HxQM7yK3eNUgbeFhdN+v8e8wotLqwEC1TevdVzxHT+PfHQ10t7/epuYlHN9PGflfCkMMcHPY95r/EwVlxcXMgVLGTeKF9S7u7LixtNUmecE56XIkhoaPJ6r1I3bt3Eo7plJGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754655; c=relaxed/simple;
	bh=9eDZKkMKnknr9qWRRa5DzD/Ls7bNDjR407jRhY4X0SA=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=sXrpaxt4iy8JgASQdt+Vejq/sjyn9YmTeTu6RIeCTrv8qLM9FLvfOgakKPoc0u3Q0Og6a9zhAw9eGM/bxVaWVChX87L8HH+47Mzu093nWjSecs9m+0VJgTc2/ef8K8UU8A/89VOhXoSvXpMZQTsqG67cLUDnoulI4D81LHeRCNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=mnNSqGF2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="mnNSqGF2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234d3261631so9891465ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749754653; x=1750359453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRriOQjwYrLCtkslAVC8UMCVhN/d3luvPuUoipDEo9Y=;
        b=mnNSqGF2cW7YwJEm0cQVNkI3Zi6tjPgvdZD3dZVxTu728BoKaN5oNP3+rPyHRIWH1u
         2dtNOJiUfBJRybozyFmANR/nxyGj4fEG7eCM+0E5zdvoNP+gdh76C8Z54MOQCvzN0ACJ
         Y/lx/hYZCUvULlEWsn8q912FMl3P3NnkT89gSrNAb6SwXPMnqpDdHMaH1LwcuJdkrrnk
         ZhRDukoZs0kda9nfUUVGIGaLsVuPhXBpu9jC6QHIQGdcDamNw2wpV0K9OcqXlfxTQHH+
         A0yjYWwyw7UzE5CETl4K9Jio9DVCkIO63YEESpkNptwavoattegvoHVRCS8cxSHD1CCp
         RJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754653; x=1750359453;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRriOQjwYrLCtkslAVC8UMCVhN/d3luvPuUoipDEo9Y=;
        b=LXHPUuRnuWiIOYCbvlRcKupZWt19vvFeLq5BgkzZI+i2//llbKtw16OtuVgc+cVNgH
         kOfHoRvKMJvVolDBibJzNNRIMAdFEgAtxDjfKxDKarKj2G/S+P7koFCO1LRygat8cr/A
         YUh7LVK4sKBWxornWivqYll9ROjtvUk4Sx8IiHRzDhHLqA0Q2urG9wyH4Fecm4EOebT0
         sV1Vkf9LZGYPNAwy+1t+VtttM6hLuGyaHfIRYf3W4QC94sRSpcQoC/KmcX7w4jo0QHSc
         249uNMzeqF6XO4jX7dTicbjqFoL1c2Vbtu7zsOGSywQ/GNb4D1ghX7y/qRIzg+Zsykwb
         gohQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJhRpG/++fGtMBxLeqUz8DrgtzhfUXwtmGN6wRM0jghIXPNEpZg2WscW0ndbzwlp+ueU3ywppNFsiHZj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOF/lYgOYKJFwLZuUdi7I8iXerjVMPUmk0t/B1FSwjGHWyztq
	sKX0goMraAjSidCz2jkCLBm7mgGIxqpUD4I981NMR2owpY7xYx1+utUFnyZ4xfppBqU=
X-Gm-Gg: ASbGncsEhKGu/8nbq2e3R3NedxttKxgWvxj/MXkcrqG9glzMZ6u/R0QG3gaJS+deMIl
	wF9ruJDXRKK6IfjjfUii+amrYZyzpRz7Ov5bh2iW0LbJbaK68aVHbjuSvGq+9HGAAaO7wWoVTc/
	kjsnDGXPj1QSfo5+R24rqPYNX9GrfM+M9pG1KO340Unok66M9RbImhvYfmFllt9QG/Sz4j1hpvi
	P/Ec8dR0ktGLtDSd7GX0Ji+LUy5ADvb2498hfCaRBWhbIGJLb0vpGuUuePNlAzqfVEhV3pdseAg
	c9I1NGb7c6tKBINtInry/Y0D4PNiNX5GzMaygHn+/RmLD41Qh4TDrhNLCxGz
X-Google-Smtp-Source: AGHT+IHb1WoqMR2DTGzMl28JEVGljgw7Pu+7yw8Q/cYEW3M+CVBNmCMmaIsDvjDf9/pnPWIpZxZksQ==
X-Received: by 2002:a17:903:2305:b0:235:e1d6:4e45 with SMTP id d9443c01a7336-2365da06422mr2349555ad.25.1749754653208;
        Thu, 12 Jun 2025 11:57:33 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a4278sm625105ad.78.2025.06.12.11.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:57:32 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:57:32 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 11:56:53 PDT (-0700)
Subject:     Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
In-Reply-To: <221b0b7c-1879-4944-b9c4-cfb9fad9ae91@ghiti.fr>
CC: dlan@gentoo.org, Conor Dooley <conor@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, guodong@riscstar.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Message-ID: <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 12 Jun 2025 06:12:09 PDT (-0700), Alexandre Ghiti wrote:
> On 6/12/25 11:32, Yixun Lan wrote:
>> Hi Alexandre,
>>
>> On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
>>> Hi Yixun,
>>>
>>> On 6/11/25 16:56, Yixun Lan wrote:
>>>> Changes to defconfig should be always updated via 'make
>>>> savedefconfig', run this command to make it aligned again.
>>>>
>>>> This will ease the effort of reviewing changes of defconfig
>>>> in the future.
>>>>
>>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>>> ---
>>>> Update PDMA config bring in unnecessary changes[1], let's fix
>>>> it by run savedefconfig first.
>>>
>>> It would be easier if this patch was part of the PDMA series since the
>>> last patch will depend on it: @Guodong can you integrate this patch to
>>> your next revision of your patchset?
>>>
>> I'd rather make this patch independent, as nothing strongly ralated with PDMA,
>> and it probably would take several rounds for PDMA patch to be settled down..

Ya, I agree.

>> Besides, there is no problem for PDMA patch to depend on this patch if
>> needed (easy to use b4 to handle this..)

Yep, something like "b4 shazam -lts --merge --merge-base 958097bdf88"
should do it on the merge side -- and maybe you don't even need the 
merge base, if all the b4 send side stuff picks it up right.

>> The idea here is to get this patch merged as early as possible, as it's
>> quite straightforward, and other people may have similar problem instead
>> of PDMA here
>
>
> Ok makes sense, so let's Guodong deal with that then.

(for some reason this isn't showing up in patchwork)

I'm going to merge it as a single patch into for-next.  It'll loop 
through the tester, but things look in good shape so it shouldn't take 
too long.  This way there's a stable hash people can base stuff off, 
rather than waiting for some other patch set.

>
> Thanks,
>
> Alex
>
>
>>
>>> Thanks,
>>>
>>> Alex
>>>
