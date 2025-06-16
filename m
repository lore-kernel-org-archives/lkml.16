Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65AE21CC62;
	Mon, 16 Jun 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086626; cv=none; b=b+s6aOkvjun/KcIzCVUwTFwuP9/qqgnesHMgHdlKUrRoh36Aud4AxntJCcKwnZJDdjQUjwwmfbS1ZR6knyTvU9QGThEoFLSv0uAiE3qk7goC9OQwjxIytNs2iaf50UEuHRop25S8B+n0WDbEfA5OQbqJ9FNXz2UwOopgZT3ABA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086626; c=relaxed/simple;
	bh=RZzvzM4eiYM27hilaciIAXpUAjaPu4+qUEmVbRlxeBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WauK6JGfuaRikXcUYdk6jvMWPIGRnvmWYxjbDtheZHYXE1FBVwkGra1XWMUhmdEJ5ble6n2YDQfAc7RxtqLfRqcMQSQE2mFYTAhKy98QPwbbMIAKbBdL/QVTCROZs0cr8xLhB5rtgns/Gmm+z9iQ6QhWVeO9tKqw1r1/jgW/QLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG62Ss4j; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG62Ss4j"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a4bb155edeso56906321cf.2;
        Mon, 16 Jun 2025 08:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750086624; x=1750691424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuXW45htkba2pIeBftDBnPXWTaUJHA1XfpgAsyJV+Og=;
        b=RG62Ss4jvYGznzBHK9ae9h2eMY8F/LG1i7JwhL9VwnRReKd0Z9TOQ6hECwGP+j55xE
         SCTlUMwfBVHT1nTSPiky4L1t9DwksYrmxFT7poiJZmC5WoPBygtRnn26SAWTFQZsPICA
         ksto4FWUwG3R7QVngq8zqaseGjIPVrmziWXnQGVvmDE2G07YoogjX6gVG8R4UJx4OnwZ
         zCpQX7DEuHkMqfQre0Fxnpy+OjIvIdefmkssrkg+6XiIx2Xjz3u/AtabkgEQmaZxqTob
         2GoHK0UbhWlxtA+VYjhbTWJX5S/OZXawxrY2EMBYX5k+8oQoHLj5Lnnnbgv9O7bKJi+h
         WlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086624; x=1750691424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuXW45htkba2pIeBftDBnPXWTaUJHA1XfpgAsyJV+Og=;
        b=tLybQD0PqtZeot/zVpepFRGVFvKqp2B3iO7TkLC8oE5wPY4yX4BRnvnx1RA3dCvlTU
         SABywizHpSuqppHgG2j2prxd01Rdltk+aaNMeQfFo1IhhNoFY4Pyffqw0qAGBTZ+jF9I
         i7YSfsH6eCpJ9YcNaGdl+PRGVqe/pEW1dWX744s987FzFiWC3udNx03IxWKqEsD+BwW3
         tli3CiALPU2Rv2Ctv395Y0JScc/Sa38rEWWtTfI0yK51HF6xjmf73DvhkfN6O7VrpGOD
         jGCSyfoqJrrd2bBano45pTyo9aBphr5oSu8m1AMzak3q2+9b8qlMbzl7RhFUjpJLLZSC
         EVDA==
X-Forwarded-Encrypted: i=1; AJvYcCUBR1uw/QLdKxippAigxkiA0loRzKPy0/Qsl7DUsP6r8O36pyw0jDci49QT7VIljwceMH/8/eQiN32rV10XM5c=@vger.kernel.org, AJvYcCUKncWVLLZgpvoJgVSkEm4RdpGNd1IJUQqLPgTZB18FQip4O0eUGJb9f4he+nmZakI8G26hIo5bE+1jvkwM@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfRaWWP8SxuqzNMAQXAQA8mZu1esQ3JYGjfmNBgACh0geosmv
	pmQhvCybMC3UAT6T2D3fDJAYkWN/ba/hpkTfVRniVQJwLkZ31nhw9lPP
X-Gm-Gg: ASbGncvETiJJgvq6j4GIcIt0wPYWBno04TTZ6vVxvRcg0oVsnRZFCOK347XcqrwsvYg
	IzA3iXqvGDB/y+kVZEfoxc2vRcwhzkjmdFED4YpZqmtqNjeXmV7UQDhmbKRaiuw8Gr5K1SERxvO
	v0QDyJzLfS0m9CDcBSt1jc5He9Q2DlLOZuFe6W1QpSxvtywu5eNPIOaOKtjDWd/08TpXx/ZdJxo
	tnA41bJK8lnUCAhrDlFO82YaWtJWyjUD9vg0+hh8/VzkE91DXXe63HI7v1gjHs+CJfwuRTLyQQP
	mIVCscEmgnu2LWOpIEpjET7GxWsXSB9gb+Tv26iBZcXBwmrfztJJ2EPKki7CecgrcKZ96AwGp43
	fTZGRdMJ8vaBc2FXV6BjaNbW16nqZOARbjhJrkXtiHYOXvSypA+Lt
X-Google-Smtp-Source: AGHT+IE0PMbp746QELpTEqL0FaZd1BSOkzwAGuLnlMOTgBtFx+zGdrT6NozMIu5+49uagpPGCj1R0g==
X-Received: by 2002:a05:622a:11c1:b0:4a3:96b7:2a73 with SMTP id d75a77b69052e-4a73c533a1cmr149271881cf.16.1750086623760;
        Mon, 16 Jun 2025 08:10:23 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4e7edasm50259891cf.67.2025.06.16.08.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:10:23 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 010BA1200043;
	Mon, 16 Jun 2025 11:10:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 16 Jun 2025 11:10:23 -0400
X-ME-Sender: <xms:3jNQaMam1l4lU6UzCECzFtRoLsQHNlNBa0a_XD1VRz1K2ocmgfFNvg>
    <xme:3jNQaHYCufXQzEkwvfvI4IaWatRf9Hg5hKlMPguPTQiK-1d07ugZxK-W-XZ5ojiLw
    dAA-JGDQl_-xqZRFw>
X-ME-Received: <xmr:3jNQaG9oJGhrap4PSdi0wMB5UWp1IslDdx_6p4OSh7aRH4OSjcCZbUV37Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeeipdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehlsghulhifrghhnhesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepvhhirhgvshhhrdhkuhhmrghrsehlihhnrghrohdrohhrghdprhgt
    phhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhukhgrshdrsghulhifrghhnhesrhgvughhrghtrdgtohhmpd
    hrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:3jNQaGqdi9rhhVp0IVL6p_lzXWCycdqAytkKHkRNllTUlUQQ4GMjIA>
    <xmx:3jNQaHoG28Kq6fdDeDFxPifsejbxxIr6A1IerDjDvsZOUP1EfavT6Q>
    <xmx:3jNQaET6cQSoPOqKDgP11VYkIoY-7Cwd6Uz3ScEMBySFEB5qXaIxUg>
    <xmx:3jNQaHo4rmw52rw9YZ8sivGWK_kvQTLb36FlCil8X5wE2NfBELku5Q>
    <xmx:3jNQaM50FLKxbvAhj899Ro1Ju35ihfZHXhlqjHeqb2kXwkCwlf4OWnCA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 11:10:22 -0400 (EDT)
Date: Mon, 16 Jun 2025 08:10:21 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in CPU HOTPLUG
Message-ID: <aFAz3eKz2gDk9B1N@Mac.home>
References: <20250616140108.39335-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616140108.39335-1-lukas.bulwahn@redhat.com>

On Mon, Jun 16, 2025 at 04:01:08PM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current
> CPU ID") adds the file rust/helpers/cpu.c, and intends to add a file entry
> for that file in the MAINTAINERS section CPU HOTPLUG. However, the added
> file entry is rust/helper/cpu.c; note the subtle difference between the two
> file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
> complains about a broken reference.
> 
> Adjust the file entry to the intended file.
> 
> Fixes: c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current CPU ID")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec49e1973425..c23665ac3b3d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6263,7 +6263,7 @@ F:	include/linux/cpuhotplug.h
>  F:	include/linux/smpboot.h
>  F:	kernel/cpu.c
>  F:	kernel/smpboot.*
> -F:	rust/helper/cpu.c
> +F:	rust/helpers/cpu.c
>  F:	rust/kernel/cpu.rs
>  
>  CPU IDLE TIME MANAGEMENT FRAMEWORK
> -- 
> 2.49.0
> 
