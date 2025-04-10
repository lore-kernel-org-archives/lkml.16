Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7EC1D5CE8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302281; cv=none; b=dJiPGwXaOVrFEK+3ePjdgqjN1h3GwgnM+m+BjUvUjs8VxPB0+pRoI/VVMLqP3HJ5yIfihhgqSyKUtJKHIFA2/hWYlcULEjT8BsdyPEg157h2Xo0gPROHfqYKCSqYVP7dyFYv5Jlr4tGtfsPMAisoaxsV4a3tMAEElpB1VkVoRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302281; c=relaxed/simple;
	bh=6v4nFtyz0M2gdeLy2tyI20AHjBf1pIklC2ygDx7e3SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vd5hEDlFkUrPnbfUV+OPZs+2cbPKuMvk3waMlZRXVCu5TavX5u8LjVNj57PiQujQTMY7fqAjSkLpC7XtJYLQHSseJaB9TRHnBK5fSr7jzD6cFxKGcO8Or27FoldgQAvBfi96dAj0fzG33Z/ttHpvSbiROlbDf9ALuhHqc3HmrjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mKj9ahqO; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mKj9ahqO"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47686580529so10612671cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744302279; x=1744907079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6v4nFtyz0M2gdeLy2tyI20AHjBf1pIklC2ygDx7e3SU=;
        b=mKj9ahqOwM7Wd3EoRd0YMrfHo7E7Y9z3BUFM9QdcBKeUAxWwKT/sVRcpTwhKiPVaeR
         Cq4Rns/OHdf0vQdztpPo0ss4wo7M3NhkKvq+zrMfnz6ShoqDaNzLB5362oH68r3WwWUQ
         hmIhdeArCma+E7kFA9VkPYUGgg55UtI46SZ45o0UVfNnsri5TA+R8vgOArwS5xAs7RCm
         x/L1rG/ZufCoupkB3jd0wBo3KQw7WwS2osKnBi+82j+3aORZgGyxgPf7SujnW56insrY
         tzOJJY5ON2RvwVsFb6gObLn6rqim77fecGcUmZoCzdFpOHsjWiSR/8WZ8U8kSgDk4aqX
         p1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302279; x=1744907079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6v4nFtyz0M2gdeLy2tyI20AHjBf1pIklC2ygDx7e3SU=;
        b=h/oducFyam29UGDUAZ1bDQdsMnd3RX3ffMSENK6RvNnuH1Sj6V8w5jHoEk0tgueKiX
         uPNQElf9B8Wkk9xI1MVw9I9p5nfrOKoV1mKdZJdcLyI1xhwQmxShJLmU2ni/baqbi3we
         Z/+ta5g/QWTFPlR02IzY9I5yOaX9i6L6SGDVD1VsCc89Q+lZcENyIyv/zRB8OhKxbm6n
         BQvQ6S4n350ERBXDH49NYm5W6RW+jhyx9byTwBoSalpD18emW476XJ8IgEl6hyeazQhW
         gzcngIhM+6jsk/ewlL4zJ453C8LzDdp6A6Y/OuFbsfNWNeBNsmwiz4xB6SHBb1FdOn6P
         zZaw==
X-Forwarded-Encrypted: i=1; AJvYcCV+2zb55cdL+qhBrEVDsgtuz6fuvqshwx7p0SCv+ZqTfV4sYZKdlOPs8RADb3dLnkeqhlVUDuMW4YibjEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0W9qm2mnlCZFSMk2O8N4CnlSe4AdinBlcfeSEhW+w6IaFzfkR
	dJ1heg064T4H5urwb9SwiMemmjItN1DfkAtsxBxV63INP+LEbNKDRezkqCReHU8qQqAQYwVvcR9
	+7AuAzTXUjBEDPvjMCLOCheGDSXTwyOz+cIbF
X-Gm-Gg: ASbGnctb4U4jmRyyf4ht0BHp18vO49NW/jv33NPDCepbcmIhXgMVzblz5i2vqwnEBs1
	Z078QGWTHvodQlehhugzf5EYOEgyAFUYhvhs2D2bJo3pzI49LUKo06KPISYKDDwMpRQG8Nn5QSN
	3mC3Xd62g7cZBJAIwRguwv5zA=
X-Google-Smtp-Source: AGHT+IHlJ6gh7u/Utj15awFQ2ygVGE04gXu6kHE36bW0/saInVnGO/KvFIdhEhUEwzFys4KxIRiV+jlvLu2uaF2UkWI=
X-Received: by 2002:a05:622a:178f:b0:476:9e90:101d with SMTP id
 d75a77b69052e-4796e362cafmr49091321cf.38.1744302278282; Thu, 10 Apr 2025
 09:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410161619.3581785-1-sdf@fomichev.me>
In-Reply-To: <20250410161619.3581785-1-sdf@fomichev.me>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 10 Apr 2025 18:24:27 +0200
X-Gm-Features: ATxdqUGgn3yioNYaYTD9zcVd-LskD61diZl4-BAdgTEt9MIzCHOJfqUIc_ybq_w
Message-ID: <CANn89iJ_CYgP2YQVtL6iQ845GUTkt9Sc6CWgjPB=bJwDPOZr1g@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: drop tcp_v{4,6}_restore_cb
To: Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, ncardwell@google.com, kuniyu@amazon.com, horms@kernel.org, 
	dsahern@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 6:16=E2=80=AFPM Stanislav Fomichev <sdf@fomichev.me=
> wrote:
>
> Instead of moving and restoring IP[6]CB, reorder tcp_skb_cb
> to alias with inet[6]_skb_parm. Add static asserts to make
> sure tcp_skb_cb fits into skb.cb and that inet[6]_skb_parm is
> at the proper offset.

May I ask : why ?

I think you are simply reverting 971f10eca18 ("tcp: better TCP_SKB_CB
layout to reduce cache line misses")
without any performance measurements.
