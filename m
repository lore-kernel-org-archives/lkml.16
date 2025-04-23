Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20241799F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427863; cv=none; b=IXIAIcB62Urz22h+ehglrilILyfbZ5zbpEH3d6QoDu7VxD/L1oq2phKBQ2VUs8i0m6xZy+YxfKWROs8XWAVgR8J6YF4e9psrIT6QGJeTpZzNZ7Vxym0DrTYgjFgCPUDmJo7dwHSxXQWo/nFJ5c5/bDQTSZx9UIxP8HN2m0wr6fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427863; c=relaxed/simple;
	bh=4T78alXt/iIwXp78tg/kPkO/5eMQaCbSQmkPu/StvNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5hU0XTvRwUsl2KDAI3J3A3X+xA9CNdcLUBRK5BuPob4PjG3elk4Kv8hSttDGJ1gIVyI/ysB7ooLDBqyqvav82w/4vGMK/wPveMIkxcRhfh9AvMhXEMxTvydS8C1Gwd9RKDChoC5dhCYcRSc9/1zd12kd4XU3jtxtd4fdikJxDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A2MxVz5h; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A2MxVz5h"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47681dba807so8951cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745427860; x=1746032660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4T78alXt/iIwXp78tg/kPkO/5eMQaCbSQmkPu/StvNk=;
        b=A2MxVz5he6OvZH4d9MGmckCmLiIk0jKKv9reHuFBuF/hfG39Rvg1miohRgm6/sfMbE
         59Egz6U1W5jcOgV7VCYjc9op9MZI9bSoeAdAIir0SXgElB4/art/yIrEpyv63oXqTT3h
         RkIWwP5hoDdiQKiF7VHrESbzNzLIKvBnajhFCug/s2fVs0gbt7FDvWAwJtHtIpqCcQpQ
         X1B1ZKAHr0Ajum0iPFNTJbhUPFo09JRI766AbDGTHldoWU+QGKPk0iHUlC2II9+PBB+b
         HwMqBEVi5W6d/CL1/ELaJU5dhvl0dEQaNyNoQXiK+FfGgS3pTHnHMSI7vJ/bN6jxQ2E6
         FGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745427860; x=1746032660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4T78alXt/iIwXp78tg/kPkO/5eMQaCbSQmkPu/StvNk=;
        b=Mryih7FcwWvZlVLI6l1tWOGSFqdCo/euJXxXmlZo8CdWINVfNh/VMSxii2V6A0C5nJ
         EO0dsBxSXvQ3M5eahalDnvgjvJITkum3ORKACdZYXDaNzQmPxj/oZJjhgkho/OfsAIE9
         MPgvDVN3B9/3kTpN/pWihkoSd7TDBf1jyUcTepG61pOC3cTg5Jcz4Y2kH+cOLbDWdwq0
         ogx72HgJINuEK70esY1tmX9VPGlaW0cKYc+/B0yYFN89EnePBZOiLB1Ei8c3GmiNgeD2
         DWAUE18tWzhVhKHvC1yn8iIEl9/X4ZJ6H1wqHx0i64JrD18itocs/I/v73OZCDU1DkuD
         kylw==
X-Forwarded-Encrypted: i=1; AJvYcCVPI7QE+SHpT8ktIsQ7zbdH3OV/Ok988UdMSipAP0lomdUoNujfyPVolFwWsjGsJDlvkDCKPzr0wEbwDHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8dTHkOprWacIH8hpNeSo6FaymPkmIyV6IaTlu7wL40PYHdnC2
	kKkdW76vtJkwPQ9SsVORm2OF4rVCjPb+bzX6j92V7hA1k7Ak78t3zaJYDfyPVX5bHQgTgacY6ZK
	3FmdPws9N7MHcVyC1hRwX/Ic3rNjafMkbFWCE
X-Gm-Gg: ASbGnct/YHLAqEqE5qggFL69E4UXbsr1ioqRmKXonH3+ukkFLrVJU68z/mDDfGzOxrq
	zqlocs5A7CJP7D3cXfqY7FAcIARThMZtfc02guR8DpbMhdMAMyHnMHpMkgmo8cQSJwvhlN2DM1f
	4YD7KzfdjfpLvabyldsTIHZF8Xgez8Uovw1DRfYz4eYthTnU1gdIIb
X-Google-Smtp-Source: AGHT+IHfwTdYoSufLjSJ58LqZBhkAkdFx/ssz56U94sPn0nQbStE/Va0flBY27HFgzAD7B7hO4D1JmbA5Qx0DPk6l+I=
X-Received: by 2002:a05:622a:5a85:b0:479:1958:d81a with SMTP id
 d75a77b69052e-47d11cdfed8mr5784911cf.6.1745427860136; Wed, 23 Apr 2025
 10:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bcfb90b2cecf43d7a0760ebaddde10d8@honor.com> <20250422170209.a8beaa8a3610d2e92421476f@linux-foundation.org>
 <CAJuCfpF4SbPWMgECD89e=QDcrCTNqnchYZ=dpod-cdRxfsCtjA@mail.gmail.com> <aAkDRg0Ajl3ByXMq@slm.duckdns.org>
In-Reply-To: <aAkDRg0Ajl3ByXMq@slm.duckdns.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Apr 2025 10:04:09 -0700
X-Gm-Features: ATxdqUHJ30i9OLvtE2fA9LHY6wYiUe30eXJDWxJRdsQ2iAe3qRdieefkGhz3J4A
Message-ID: <CAJuCfpHSYz6-VtR2Q_44eEeCYb=rXcVApKiCZckQwU2X3eEa-A@mail.gmail.com>
Subject: Re: mm: percpu: increase PERCPU_MODULE_RESERVE to avoid allocation failure
To: Tejun Heo <tj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, gaoxu <gaoxu2@honor.com>, 
	Dennis Zhou <dennis@kernel.org>, Christoph Lameter <cl@linux.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yipengxiang <yipengxiang@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 8:12=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> On Tue, Apr 22, 2025 at 05:19:31PM -0700, Suren Baghdasaryan wrote:
> ...
> > Allocating this reserved area dynamically would be ideal. OTOH this
> > change increases the area size from 64kb to 128kb. Don't know how much
> > effort we should put into it.
>
> The easiest solution would be switching the modules to use alloc_percpu()
> instead of declaring per-cpu variables statically. I couldn't think of a
> better way to support static percpu variables in modules and still can't,
> but there aren't noticeable downsides to using dynamically allocated perc=
pu
> variables, so if you have several bytes here and there, sure, declare the=
m
> statically, but for anything chunky, please use dynamic allocations.

In case of allocation tags, we are trying to minimize performance
overhead as much as possible and allocating their per-cpu counters at
compile time is in line with that goal. I'll check how much overhead
dynamic allocation would add but it won't be zero.

>
> Thanks.
>
> --
> tejun
