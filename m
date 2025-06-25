Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325E1C84D6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895165; cv=none; b=BrIirNkqBiLvjySs3A2QIgPC16amwvDzrR62QxrJh4/X8N7SvesZ+M6kY8wdQX24gF0elir5J7fmE9+Ln3b3tCUGsRvqRup1Q72hXo1VSePXRVoaaSNuo5wG0Jkisfm0YJG3Of7wC9KJ+9Wx/2Gr9eUSELIoFfDJ5T1iTfOMrSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895165; c=relaxed/simple;
	bh=oS2+qEeE0p/dhi+nuprgW9YttSbFNXmR+OjGJ4tLvLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3LvKpFctomK6AKH5j9zMXlqymutPpJfvyokg4ytTV3GZoDGDr0Q1eWxflXjkUrB6HpJWXXd4Nq7C8uSCdQvhvo5HAUyTlIOprOGY5xoxeLjZUqvNLwmLA5i4+mXgrPl0FMEX57kSmYleASEIq6TL81rwCU4OcKSpvaA9sa+hSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fZgk0MVK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fZgk0MVK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2357c61cda7so30065ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750895163; x=1751499963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxW6eLameOAnRuvuazW/r9gHcMuI7UE9esV+BikOkkQ=;
        b=fZgk0MVKBH/qV4poo1wzlkNtBvgEeOqbcP7BZB4JidCQshcnr0wBY30VxYmOQzF/ge
         nO9FqcTEWxv7pv3ghsroHYLfeUky3YSxVDFSzbb6EyjIoVkximh+r1/7IbkCV0YFvVTR
         eciSP797i/h3aKlQ2E4U5g6ENbC5odGyuyVC5zO46EpLLkhireIWgaJt//us2q4KzpmI
         yd8/lmzelKk7/BrjsWEEbu8uBpmebR0iM5UbkvXeAiLDMQnPNhC8SwHXKPRe3qfppMAf
         ERdirHueFqBN7qiP+NE0bcMS75d3sOeuI2jwwEsgfFJkd3cfD7QOBLkbj9ANbO5RFio4
         lHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750895163; x=1751499963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxW6eLameOAnRuvuazW/r9gHcMuI7UE9esV+BikOkkQ=;
        b=khQI3Mq3h9sv+DGKcGMR9gFNi56Ibhg6Ec719L7k/06MZ2RAaHhQ90mpkfQsrKvdyI
         Yb/4PJ8D6DV+MMlBeXNbZe7FL+YArjymGhs6d6Jew48Cq6uZigKr34ijv3KXD+HZySyi
         fkJgQK+1fAjk2a7dJjWICpT+iCdT+5XROl2clqJK71WyVvHLDiTx0SFrkrm4kgffIUJm
         KzYN+xBMqu/Ny0uZs4AW3bgYJSJW5Bc3QNsdsZVpDyHj9T4Bp+sM0unupEAFzkF0SWjT
         G85hDcXAlPmOpgjm93xdC2uxuhYrDIh36vX/BGo9j4k+Ln64p9oPn9kt/8C3vPNOpAAf
         /YQg==
X-Forwarded-Encrypted: i=1; AJvYcCW5kWsPAfo8k0pWikPF/39iMyVwmOfIuUeBJKHzT4FGF4bYQyofr8caLInIK/nRk0YKZeuLqDet2TSTiAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy836Zg08BOKWN4hLfGS147WdkpVYBaFmzbZwJDW0T3rYbnjUvh
	v2STAEhiuDvtiMy5y3LYFudMKEEehLjfotgMW4scptlb1cO8Td5c6pU9aBxuasFOsE2LxlLb+uZ
	P/Ex6UhiKtGCR+AEcgn15iMJND8gV0b2ZywDxOA9zvTMY4TTjQlL/IrKe0EA=
X-Gm-Gg: ASbGncubqb3euUntqWd/eUZS+o9lelGGSmaKr2IAfT8ymWC4i3PimqNM9HBWh7cp6sr
	b1+XB37D8In0mv21SERm8kvUktLPK7iQ49xnhDWCenz3O+MMVh/mfP42RhY6SZ9qczuBh/4pihU
	T22jwLXNr1Ym3olhb0s23pGvgdKLBN3LuIeAfKoZrzb5kaHSUXBWfmhOzOM/zgmPY8TDmAp1Wl0
	A==
X-Google-Smtp-Source: AGHT+IGYwGdc7VZyHxBpFQo3+2lzQv7lF6WR5ZbRy7zYEYyrFdgvZ22U0tAmCKzl7fZPUnYtijG7OErvXz50cjSIri4=
X-Received: by 2002:a17:903:1988:b0:215:65f3:27ef with SMTP id
 d9443c01a7336-23977c0bc75mr1397605ad.12.1750895162870; Wed, 25 Jun 2025
 16:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619181519.3102426-1-almasrymina@google.com> <175072801301.3355543.12713890018845780288.git-patchwork-notify@kernel.org>
In-Reply-To: <175072801301.3355543.12713890018845780288.git-patchwork-notify@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 25 Jun 2025 16:45:49 -0700
X-Gm-Features: Ac12FXzjltO9e3B85tE8sad7lqP2GbKMu7X5vbHIRSfDkIJObcz8XrCJ3tz_b5o
Message-ID: <CAHS8izMPWjmxLWJr+BSqd5jamsFHDOm71NkG7fmm-78SkLxQTg@mail.gmail.com>
Subject: Re: [PATCH net-next v5] page_pool: import Jesper's page_pool benchmark
To: patchwork-bot+netdevbpf@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, hawk@kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, ilias.apalodimas@linaro.org, toke@toke.dk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 6:19=E2=80=AFPM <patchwork-bot+netdevbpf@kernel.org=
> wrote:
>
> Hello:
>
> This patch was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
>
> On Thu, 19 Jun 2025 18:15:18 +0000 you wrote:
> > From: Jesper Dangaard Brouer <hawk@kernel.org>
> >
> > We frequently consult with Jesper's out-of-tree page_pool benchmark to
> > evaluate page_pool changes.
> >
> > Import the benchmark into the upstream linux kernel tree so that (a)
> > we're all running the same version, (b) pave the way for shared
> > improvements, and (c) maybe one day integrate it with nipa, if possible=
.
> >
> > [...]
>
> Here is the summary with links:
>   - [net-next,v5] page_pool: import Jesper's page_pool benchmark
>     https://git.kernel.org/netdev/net-next/c/cccfe0982208
>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>
>

Thank you for merging this. Kinda of a noob question: does this merge
mean that nipa will run this on new submitted patches already? Or do
I/someone need to do something to enable that? I've been clicking on
the contest for new patches like so:

https://netdev.bots.linux.dev/contest.html?pw-n=3D0&branch=3Dnet-next-2025-=
06-25--21-00

But I don't see this benchmark being run anywhere. I looked for docs
that already cover this but I couldn't find any.

--=20
Thanks,
Mina
