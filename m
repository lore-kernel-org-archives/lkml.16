Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21CF4438B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643956; cv=none; b=G7u47MoEFWBduhyjteHBO5m6BzdFkYoXBcRqtHRenJ8pChfc7wbjzMtGCjDAk4kvjvrG9r4EFSIB6qOJgRdJCOooSwRXzx6qU9FdJ/Pl6W9AOkdzyVxvEc5EIHx0v3OXIsMQ4iIYyVqF2Fje3Mwy5vplNSGXo9OUbasyjCb7lQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643956; c=relaxed/simple;
	bh=p8h5KkB+GURRTJzeWUMeXBkjHv3dd9xsMdCzuGRKP10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AsrWlrctjXbleX1rS5G3mB8plLUi2KGmAcpaEQKUrbiPwxkKfMNqZl0/sg+ZmJgiQOeSogwOxcRwAryDWTniR7g2YUQtf2jMkOhJYdtc0P/1L0oJL1FuYuZELqNFa7M3Zds/rzPCdiZIxhriwoOGO36rpx3zgBjTCp7dPNGdU5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FttrDqki; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FttrDqki"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f09f2b3959so14756a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744643953; x=1745248753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqGkP7AzdyRb+ubyQ7gizWBenRx1QoIqZMI8aSglq0E=;
        b=FttrDqkiJmGrsU7FuPK0BVQIJv0i+hEwHQgDbVBnyrozQEUk2fCfvytrUXdIx7GFCe
         VQI90q/53UnKjJEhDdSI5XOz8K+wpmARJLSJ1ojTbrlGacopu5VFuP9YfG21RHBT0/+i
         5CBMKOhyN/JAqeSp5y3xOFUl9x/jJnEtVuEVUFxWXsDzVfFYXxyJpG/tzTZPgmuK0PkD
         09odWlwZ1gbCvWDrRN0pqaKHBPqvjMIlGZG38QUzdZXoC5jGCVYu8rWbcYjJayeuuCQT
         NiTaWIgl4qS7ak6vTr9Pcl47yZeqkKN8CBlH9rkQ+4Ybe8XMQdbb9tRu1M4XPKuh5gI3
         Rq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643953; x=1745248753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqGkP7AzdyRb+ubyQ7gizWBenRx1QoIqZMI8aSglq0E=;
        b=tU+ykzZI5d+dqH0HTX6HT3Dwczc4A6d7uldmSdg/KprhpR5IIeweyLUhfYsKWieI7s
         J9lxS49Z0mAHnPzqbFNdqHKsa5I0s0vtvqNXXo4RY8l3Po9SzzZPRwuSwgxtRlozLtsl
         ssgpi+Fx1J4mL6kam1YPq3TvcvD6p5YAnrGvco6vvdjBH/13Cnd5v6w8w4tE9KEs2Ggo
         LKLQpouQoY8tklR/HafPIa7ikM9Fi4TRYAKAATFV3x2IXHf0Xd+cL6mjkj0aM1A3OMPy
         Qyddo4WJvgTtaB9wl3YIDVcdvIFXfIGJdiVY4/+V94Hhju69RirUvbcul4AkXDnDuIx7
         qspQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtswdxlJDu6n2quUYcBRcMIKCzB06c9Cxlo9WnlwwYvLGgAM8RuUinpwxWvkZbVp76wWnbTtn1mHdNUsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTafbF0Q+DCBP4RVBzjqaKuESIAxulzSRVtj/XwV1KNvJfow2
	vJeqhg4o1mq9pu0ydoz+R38fHhDnTTPbItgJygKxOf58F/8zVMh8mRBblCud0xPNb/Tq8AAbTN7
	r2giqSnmoNanJZ3NiFuzbrct8kBjrNpnEa29MOPRVZKhLmUYx3nT9
X-Gm-Gg: ASbGncu7yg5ATt+1bBU8gJYGezUwU+39K5TgqeJtmcGhYevoVrMIFvxVSi/Xfzfx7CK
	bd3hp9jhI8uo/IjEMV+0+0WWpUwkxdq7cXmJY7VCksIRMQ7apMRMdBPilPNkow9iakiJ37zmvoN
	+fyWKtrMSjX7LlN3ddU66oMJgeJ0BoqA==
X-Google-Smtp-Source: AGHT+IF2tbwdkcZoHBAlrPM/vjguNGPuQVp07BhndSI42K9ZzEGR8BkolfUA2D15wvLc1267hCzg4MFq260Gt1lETYU=
X-Received: by 2002:aa7:c9c6:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5f3d9d1f008mr154150a12.4.1744643952361; Mon, 14 Apr 2025
 08:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504140435.2OoLcwfS-lkp@intel.com>
In-Reply-To: <202504140435.2OoLcwfS-lkp@intel.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Apr 2025 08:18:34 -0700
X-Gm-Features: ATxdqUFdptLiRTgyyXD7-SwfiHHuh0sV_sAfKPkOoh58utSVLahQ5ujaA2TnepI
Message-ID: <CABCJKucXUGB6iUh2HTZKcYQGjgMtW1L=vWm_tTwZ+Kjas+iO9Q@mail.gmail.com>
Subject: Re: <stdin>:4:15: error: use of undeclared identifier 'csum_partial'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 1:48=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   8ffd015db85fea3e15a77027fda6c02ced4d2444
> commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfksym=
s as an alternative to genksyms
> date:   3 months ago
> config: um-randconfig-r073-20250414 (https://download.01.org/0day-ci/arch=
ive/20250414/202504140435.2OoLcwfS-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250414/202504140435.2OoLcwfS-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504140435.2OoLcwfS-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> <stdin>:4:15: error: use of undeclared identifier 'csum_partial'
>        4 | EXPORT_SYMBOL(csum_partial);
>          |               ^
> >> <stdin>:5:15: error: use of undeclared identifier 'csum_partial_copy_g=
eneric'
>        5 | EXPORT_SYMBOL(csum_partial_copy_generic);
>          |               ^
>    2 errors generated.

This patch should fix these errors too:

https://lore.kernel.org/lkml/20250326190500.847236-2-samitolvanen@google.co=
m/

Sami
