Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D8EAF9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159095; cv=none; b=T/FL+rI+2Zt7HkItMleASl0rlCbGybNIh5HqlK2Qz8imh/vASVu2/ayQlWTSe8EzgLUwhzIyQQ6XRB11OFjL7CSnkPO+9z+KxmDaAPSFNl8iJXxmPqfL7+dJ7sPILqGGmPrrmm1sqHsTC94ESKCQZaZkKRVf6BmG24Q2F6NNf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159095; c=relaxed/simple;
	bh=0nCoqThfV7JzU/lrvBsrVnQ5K70lAkvyl0zr6QNoIDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+YqUjjZtFI4KIbqzKjjQ8XvCJJHA/fr4LAUJyycAGYAbW4ZaLm3E6KJrplXEQA/PVE7X9bKuAUOim6L3uybKQYZADBEMorsh0HFQ8XcMQnqagmD58ZGBFir2bQ8DZz3WjmFovZAF2joXLsmgwLJFeLxLU8a/i/aEztOBVG1X+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XaMscaj/; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XaMscaj/"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6efe4324f96so32670737b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 19:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1739159093; x=1739763893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBEN6TEYczOjdTLYzUwaTfQZO7NAknquIzu0gPVIg2s=;
        b=XaMscaj/cytOthVkFQdGZc+IccWOX5AXYYP3gRFPldK/2bopp+XT0vBWmKQMQvw8Jz
         xSrvi5aDXg8RInKSeEHTnNmahFjJm5i2+33pBw4/l9YRYW0omifWY6JgaafBC8JEDxgi
         Un+d4EDvvZVv8z5dZehVLHpgqiczg96FRZxla7cYCKfx2QpOBBIvLzmCehvzhIc6TK37
         35HADgO0rv6vr1pjOyouqxBCGWOnXdb6co2vTNhKfixctq7up1TrkZINXFCWsHmKHe0a
         lpkaJf7Y5KSoL49YAqYbyRFV2BEQGk95ZJEtXX/8ZQDlDFjZ3MownHsMDGT6NIjwbIs3
         wSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739159093; x=1739763893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBEN6TEYczOjdTLYzUwaTfQZO7NAknquIzu0gPVIg2s=;
        b=bmrOrsLztHvv1e9qtzIL0G5W7KxTaxyK7d5b25CblR4bbdMjt5bxgZPO7NenALLeKB
         yTq3JLY0E0Pu7Za3YvVWKCQgg3IP3paBZ/fTo7zHufJGSrFaLx+Ac7rO8yxqY6ZkBOCF
         a5tFIGBYH8/SDeGyF3jN6npK3+os30HDNpN/z+/ejPFSAXanbmvQClAD3R6AzKT/9Xp3
         /KxqB9jLASrJZYTxg5A195xLM+SwVLT4Nzn/dOtjlfOgmgnq+3yp/DSnb5ckHSyAXa14
         nylxbmG9SaWY5/ij33SgeMvC+9a8bc4U2PNr0Bi407YfKGi2RKGCkoVwqTGGlGPGgbcS
         kxyg==
X-Forwarded-Encrypted: i=1; AJvYcCVdtt+vJiHCZyE6fpQM3LLh68dy+xGrEod9RyJAkrrQkvanvgWGsIH3+5KZ/9wlZwDcl9UicSrGr9lnvQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjy58o/CBvaTrpf1/gQXPfae7okatvuKZu8jGDm0dKX9ObFp5
	N8DqvqfI5k681RxuY3dhbKPI19NcO+GkGDEF4aVnul5GaJJdwLYXBfDXS3xTqDiEsySQ4JpbR2x
	FZSJ1rGkmDF85Uv5MG6SlnQuQLr4JUrtvNTVM
X-Gm-Gg: ASbGncuJEmRom3EtOz5Uk+P7g7aipkNdTUqqrW1fYHcqgfX1dkQoOh7D9G1eeRXDWtT
	EG8ryPUbjWzhpyZEhlBcSosq1pN9OHj4FRR659mxW0KrxXw3fU5iaNlt5lCrQunyQu4kqZTk=
X-Google-Smtp-Source: AGHT+IHw7/KlrLWysVD7IZKm+l7vRn0CxbcxbPhU2cfiOgWPfmKoH71COSVrEoXC25g5XPkYovcDWs4W1zXF2Hoevbw=
X-Received: by 2002:a05:690c:6ac5:b0:6ef:7370:96ee with SMTP id
 00721157ae682-6f9b28495f5mr104323317b3.12.1739159093380; Sun, 09 Feb 2025
 19:44:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210121813.3e24cdaa@canb.auug.org.au>
In-Reply-To: <20250210121813.3e24cdaa@canb.auug.org.au>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 9 Feb 2025 22:44:42 -0500
X-Gm-Features: AWEUYZl4HiSh_hK-CiCIIkpLMm2BTiW92N6V6GZjo9Pq6Ub6xL5qH8PIBGYKVu4
Message-ID: <CAHC9VhSJceL2PmFw1RiQEd9B3c7wjt6i_KzFxUjVdHV-Zxdyzw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the security tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 8:18=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi all,
>
> After merging the security tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> In file included from include/linux/perf_event.h:62,
>                  from arch/arm/vfp/vfpmodule.c:21:
> include/linux/security.h:2379:12: warning: no previous prototype for 'sec=
urity_uring_allowed' [-Wmissing-prototypes]
>  2379 | extern int security_uring_allowed(void)
>       |            ^~~~~~~~~~~~~~~~~~~~~~

Thanks Stephen, I just pushed a fix to the LSM tree, it should be
fixed on your next pull.

https://lore.kernel.org/linux-security-module/20250210034132.8448-2-paul@pa=
ul-moore.com/

--=20
paul-moore.com
