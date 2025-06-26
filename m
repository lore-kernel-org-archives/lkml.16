Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8D44A33
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750902761; cv=none; b=QoSysx8MLGzturSxvwKprfuboDdZ1LEi+ObGsSnzykv9L0EQrbnMQlEhHPFjNrDfjvRizfqYuBD+tuQA0F1Ze1q+WiG3DtSaE8fVMD3DnIOaq0Raunls00E6j2XjFhf0MMtXUJKIxqthTB3Q/5ElwoagDvLxQgb4jFP6o+xN4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750902761; c=relaxed/simple;
	bh=DK/40bCabHXs2I84Wr6OZyYn8141pAMFIO448i66QLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ON4zGN7fKEQuJj+r+mmWNHRV8kFNLV/kRfYlgCZzD5TkJUvwqzzEpa8TcZo5K/RC22muFcHnM6Nxoj8XW1wAufazlHBvrkbAFeDV/nmIpfIcn8/2ryE0+LCPnwsVhGjmvOnn7PW7vJhhHnaQcBdVoSXgCfhzHz5SUmTWHsShKIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwO0Z58S; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwO0Z58S"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87edd8f4e9fso139048241.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750902758; x=1751507558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmZGy30yttm+82gl6o86G0X0Vv/KuB1NPu4aLHsi0GI=;
        b=JwO0Z58SAVf5B2xi3Ns1FpnhBJdG+6cEXdeA+34CV+m+/D/ugHAXR5DASCHAmaV2/B
         I8BN9kpcMphn9zyna6lgdlkowXHXs2/UW6I48G01KVMWPLIPTibtQ8ZjIWEd+vjGFKpG
         VzFiVpE6++UbSTe4hKl4AfwkaTxnRjo/919XCYgGYTqnRrKAvXgghegMPvPXw0xZuJW9
         2crUKBs998zoGCW9cODw1eOmd2ciZ91kM31mO9LV5RQPhKWN/VNhpWcUZmSIacK4IpVX
         iBxxBXHSQNElekZMp1MqM+5on5WDXkemdJEcJNUZkD/NEN+kRh3ZQUd6iPumpC9gzUaE
         56tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750902758; x=1751507558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmZGy30yttm+82gl6o86G0X0Vv/KuB1NPu4aLHsi0GI=;
        b=PbXtU2epBvXYaicyfd5FiubbL/Af6bl/EU9aWpAy1doiAln1Q45dIc//SLn7MYW/6I
         eOz+fzDW0GZFuBHhyuVPeHb57Sj78z5W6tQzQLLX55ZKhw+ZXPnyyLIJkIJAEK5xJQpU
         eVtrk2S6505kK4rMF14BQ5qsPOc3vAcbuvyE4gJ4SoseKsHu38hJAnAq/meuCTQ/QyAQ
         FwQPqo4klknPbNVV99L9C3jKpHE/HUwRiT1pDplFCkFjXI5JvFn57BgrAOr0mJY5uz7n
         V7u9aioK5IJiRYhk/PvtgmoF/pCA4+OJGzi3oLbGPATalNKSr7ukQmAY5gYEUCILLzx8
         QjgA==
X-Forwarded-Encrypted: i=1; AJvYcCVcwd4JLlBNxtzHvmUMahmtZpazakgPRhZoiuz/syu77zw9yr8pcKn1n0zbEcmbswGkt7L19sorsqG6fRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlqtHtKs7t3BWTSHedSWdpVKvgaw7dr3/kRgUYrMK9a+Sb27G5
	tTWzkK85jPPVmLXcjC+hqTaNd2ruU89G0aT8N1sWGYcX0pG2CL0UZ6mZowE6+FQxF/cyWwY9XMK
	QdsKZVZMRznBIYm7N22QQoC6P8cai1Ug=
X-Gm-Gg: ASbGncsmmkEVPCB+hZyFps3LVkD0vs//G1c9eVXivl39WPVvygpW4vB9Xsgu8cqrjHb
	Ws1ThyASaVtpGdK0Tuq6Mooe4xhF4BsFy4AqSp6kFR04crNzNPAUjbb/h2+IwIh4gICwd0kWXf4
	QTAe8khargKgxWw42QmX7BmUsA9aI/h2WD1MA/ecjsn+s=
X-Google-Smtp-Source: AGHT+IHin6avqSFx/xLdpJP6F6J39jPWGki2780uHuWGO//x6dIZiYY7vmgIzTTWF/GP/G5q+zws2XZGe370+FO96Xs=
X-Received: by 2002:a05:6122:1e03:b0:531:1904:203a with SMTP id
 71dfb90a1353d-532ef436f69mr4001388e0c.0.1750902757788; Wed, 25 Jun 2025
 18:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 26 Jun 2025 13:52:26 +1200
X-Gm-Features: Ac12FXw83U6kzxH7ipKIb-3Hzq_WTXVVwht84qjR0OcUXn5MiWb31MjCxOdAZD4
Message-ID: <CAGsJ_4zfPV2p7GSPdE=2+dyiEPFxQJKpbjmVro2VnJ4YXNoyMA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as THP co-maintainer
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 9:52=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> I am doing a great deal of review and getting ever more involved in THP
> with intent to do more so in future also, so add myself as co-maintainer =
to
> help David with workload.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Barry Song <baohua@kernel.org>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b9a4fa905e1..a8a963e530a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15945,9 +15945,9 @@ F:      mm/swapfile.c
>  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>  M:     Andrew Morton <akpm@linux-foundation.org>
>  M:     David Hildenbrand <david@redhat.com>
> +M:     Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>  R:     Zi Yan <ziy@nvidia.com>
>  R:     Baolin Wang <baolin.wang@linux.alibaba.com>
> -R:     Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>  R:     Liam R. Howlett <Liam.Howlett@oracle.com>
>  R:     Nico Pache <npache@redhat.com>
>  R:     Ryan Roberts <ryan.roberts@arm.com>
> --
> 2.50.0

Thanks
Barry
