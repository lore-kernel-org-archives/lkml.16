Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD3322E3E1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591335; cv=none; b=StOtzToUO1JKayxDzJywkVwW1el47i4HX/b0dPLzGiKo+P9L0es9GV11pFraeSb3XZZYDm/pDSq44VKhIzV+R8dOlrWozovloQrwaF+Q1HnzITe0uD3kvRjmVPLzGKsydziXCQfju4e9Kct89urEC5OKEtgxTvT1uPQy5NXMu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591335; c=relaxed/simple;
	bh=0IZ1Z5kXbWNbw+/eh5Jjbjxv2FVYLBId14o5vdtEp90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emtjCu93Z3X9lL8ayA6J8cTFGP6lKLMdC1f/y3Le+QN43pFqvo6FjnS+Y5yLqKR0RnD92glCRXPfKXKZk/LCJ+emqlHvybYZU9+4RGCCdgTYcAKmf/n1p71lEISiAYLV0pWj0zSG2LCWJ8xLY+mIRWmvg8eO0SZ3NeqnteC/p8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfEjLZmC; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfEjLZmC"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e461015fbd4so2126247276.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745591333; x=1746196133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IZ1Z5kXbWNbw+/eh5Jjbjxv2FVYLBId14o5vdtEp90=;
        b=WfEjLZmCGUkN9c1SSxN4OWtp7Ax6G2eAX0T04tWly56ONQIQWOsPOWdAy6ChosMlmj
         TXMEfl7PL5QimkHprruyU5VkoPre5ZmgOwygm4b3ccOzS/32QJbL29PkIqmOmzxe2QK8
         q0QwKxSLX6QkyFE6TUhZzabVs3EN05P7XD4vtqG83Gn/ydVV1PzNoYx+b9OVSOtuS6p0
         NIGEp6OxAxMhMLxe1Q4K2ltH+Dhg+deMydZBg29L2TguAtRvw3UFamZDgrd03a+4cNEg
         YqbHk5rGz9ParfGI6SxJmRrviKpZXKOM1ckPBJdR4zDWk10zDAhejIrTitaPy9YKEbd0
         Jo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591333; x=1746196133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IZ1Z5kXbWNbw+/eh5Jjbjxv2FVYLBId14o5vdtEp90=;
        b=bc53jX63Kr8Mh9XLbSJPP2SvYPLL+eSAY5IuxicvzFg8iT1vqv/MInOr0Mx1plKZzF
         4GORF1KsYeCmSepgwk0qOLY107oO46/jcUcKiZPeqpJcJZmKD//avi0ivOdBW21DQDjT
         MbSIZZEcUcyLloMHKZCT2jpX11YfDi/wkUQDPkQFHnvSqBwfSdh4YC9JSPHF3575tCyI
         3aQWR29xvscRRFipFCggCxoUHKxZ5eGqBPdVoTXsMIGEy+zq+3hvAEb9+yGsE/nM91Mi
         dMK6L/+shuXI5UMiUilmAP26BKu9+qmUrVHC3nHkWGg9l677Zgo2ojCPdkwF1ewJftME
         jH1g==
X-Forwarded-Encrypted: i=1; AJvYcCUYbF/bKhdLzvyFZnRtFehyJ8VWJu3FU93WiT+ux2rTJAWLACsw29A6qnABeUJzaSySOTwTenPANObki7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf64C17/4Ey4giXWtluF2wk28AVEaNqasZpbvmMm4AyAJRs7dH
	RAknwXnIPSSMx01J3zCVjhCHF88DZcQOBF+8W4L6QfR0dilVzxPEJ00M0nGJnAwWvPQfjNr4GN7
	TdLp3H4kB8HGFpAqSWjNkjf3LNj/eRb2XI9Q=
X-Gm-Gg: ASbGncvWVl7wnT4V2W2hL3MZesPlZAQ7YgmLYkUPqW79WIKKs41CVQY2yyNnZDSTWk6
	oYAV35Q5NlCpQVZHLcJ/lgoqlrw1Hp+YrelW/9+xarD6JNvRiJxPvrbk4FUJ6ltBRxjC5yRAmQM
	el/3mLn9oXGPjSLP26sQLBZRBUuUw=
X-Google-Smtp-Source: AGHT+IEkV/RgXiDW1D8bFaCv+KKAgjpHm568eaTLfIKUTtEBWXzInj8ZP8S4Inyj5ExQY+g0lXgDbTw947IrRNQtLjo=
X-Received: by 2002:a05:6902:2b83:b0:e73:126c:fdfa with SMTP id
 3f1490d57ef6-e7316829eaamr3328647276.29.1745591332754; Fri, 25 Apr 2025
 07:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424153815.4003-1-haowenchao22@gmail.com> <20250424194200.GD840@cmpxchg.org>
In-Reply-To: <20250424194200.GD840@cmpxchg.org>
From: Wenchao Hao <haowenchao22@gmail.com>
Date: Fri, 25 Apr 2025 22:28:42 +0800
X-Gm-Features: ATxdqUGPWMKahfXsbho5V4QfMOQWdI9zAo2KvWvl_MBadhn3O8BUxSa77qltUjM
Message-ID: <CAOptpSPoc76ZSzbKJSnnfxtcDubJHC8a1zU7b=C=wdF6_wC3ww@mail.gmail.com>
Subject: Re: [PATCH] mm/compaction: do not break pages whose order is larger
 than target order
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 3:42=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org=
> wrote:
>
> On Thu, Apr 24, 2025 at 11:38:15PM +0800, Wenchao Hao wrote:
> > When scanning free pages for memory compaction, if the compaction targe=
t
> > order is explicitly specified, do not split pages in buddy whose order
> > are larger than compaction target order.
>
> Have you observed this to be an issue in practice?
>
> compact_finished() would have bailed if such a page had existed.
>

Yes, when proactive memory compaction is enabled, there may be situations
where the order of isolated free pages is greater than the compaction
requested order, and compact_finished() will return continue.


> compaction_capture() would steal such a page upon production.
>
> It could help with blocks freed by chance from somewhere else, where
> you'd preserve it to grab it later from the allocation retry. But if
> that's the target, it might be better to indeed isolate the page, and
> then capture it inside compaction_alloc()?
