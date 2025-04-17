Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF1519066D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850820; cv=none; b=Hla6MSgkFmFhH0gMoEpd1K5QOuBPoBJfQ4TMibIFMCAPeeebsW+Rv1Wj9Y4EGkbeIiceQJL42upvPyLd9NTwzgU+o2f5oq1H7BgYJNTdAjkkAy+TAYXncaGVGTUgr37Q2UaoCkMiCXHEzdTDk4jq79GR7zxO8rH6Y7NgeH/9uHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850820; c=relaxed/simple;
	bh=XUmtoRl/zTq3N2IStVuDPBJnGirD2P1EZxJPZLsxgHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBfy4OuDOb1FrcOdqoy00JkBuPcL+R25D22uHCgZMRHoxC3BrfT72GdkDKO280BoPKk+Ct7Xx3/6Ho1etKuhAb8kZhp9DUjVlTAeQuN3AUoJ0VyzUt9tQ/5ujn/PTjCUSBZlwsLq+xxW0vLukG/EM6GhH7fwSAbwjSOoA8M6FI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Ls1F2Ggw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Ls1F2Ggw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so2293615e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744850816; x=1745455616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdUpoo83PnisgTtpWjy4DIw3N3dpKRphaHPr3f4GvEw=;
        b=Ls1F2GgwJpyKERE0KoTUFpHHuPo2WVOuAWw7xXDiUzDIRkRH7QE5ZWw24RDWDKxJcn
         2iJ8W6eJSzLrqJo9PyzalA7JSatVJMR3NJBExXpt8SSeacUnQgRkRVCn1MFqtQNccYxL
         Tqp/pfbSiw7mv47mWX9ePfKKDIDeAgOs29AE9jvrN6YGGOgWNhpn0mFVom7Zkyp+E26U
         jw+WGWHLl9rlbDU1QNxWvPqtTDyCuguqsvbO/wATe97Lym1bpWEmC7WzXAELYWp5ZCJy
         Y+TKTBkk8y5MwJqyoYLReQGCpSx0LX8YigYD0ZAhCWjYO1G2g8Sxygv9jSR2vn9lwLpU
         2ncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850816; x=1745455616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdUpoo83PnisgTtpWjy4DIw3N3dpKRphaHPr3f4GvEw=;
        b=lN+v9RdyKvjuUbDDeN+MCuBh4UCzVh2phDDNXTp9HX8IeAL+BSgTXPkRoFXcSja0jL
         YC8hkWBNeTb/pywgsxlmTyPooEaI2SwcDJPfRzCVhebOq4QwkjIfu0CoTURsv0k8IhpC
         YkvubRRIOWPC7JC7yXN4UuTe8Ek+/2X+m2S1bdM5WdOdPHpBCVwh+1P1bajfQu49pl+Q
         t+TWJr5DpLTNvIecP05J1feFscx2GBIJdaOM3oUq4qclBGAOKUEcsGs55H2RAPbeZ/S0
         t8Qhm4f/YHFBCcyiBSJwgvuaUQ/UjypUlHkwyIdBJTLRwb+gWjhl2RRh/rWAo6ahFuvV
         5oTw==
X-Forwarded-Encrypted: i=1; AJvYcCU3CaNsRu7hSXBv99CoigAVtqwPUfIp38JgRNIP/jXYdMxCBptUIqgD6T00QxNwnzySdVzJI16xIIWufEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWXsmBl2NV0YMwSbKzYCNzCHZSuQtQ2VAd69F9FBCscc6wt2u
	nt0AlxOhebghIx7EG8wTwJ9YSjULnojKVgswXp29dCmj5K1ODshcgKpX7B+btM5K2DxSxTEJJe2
	tcv9nZbyTIZn/X7InaUHKExRsbkVsTbDG7Rw3Xg==
X-Gm-Gg: ASbGncsTk4JpntYXjnXiUcxuGUkfXd5N1/ZKtw3W0CwaGLnEqe6GD7Fu4xDjw7VsUiV
	Ll8ZD/azctRsppiEkfHZOwhFTccgldshE7YGTQCk2VvsEi93zD/1jdX87jw+irjW5PFobMMd8vc
	J482HkGJFvMJ1W5th80+c8heXoDWU7Ngaihg==
X-Google-Smtp-Source: AGHT+IFXOHl/7JXPbobdQ7qD8MWdBoGYOnaUH6HNs45B4ZXG9TK6FBTyG0XoTm8t8gs8sdEV4TzCUWKs5HK+V85zhgs=
X-Received: by 2002:a05:600c:1d9e:b0:43d:fa59:bced with SMTP id
 5b1f17b1804b1-4405d6cc4e5mr40574635e9.32.1744850816515; Wed, 16 Apr 2025
 17:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org> <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com> <738a41ca-3e4a-48df-9424-2950e6efc082@grimberg.me>
 <4cd2cbb4-95ff-4f3b-b33b-9c066147d12b@flourine.local> <4c334216-74d7-4a30-add1-67b6e023d8d2@grimberg.me>
 <CAPpK+O0tmewK7pH458TOxjtimjO9on=4YDRFbS=FPTgM+KFTzQ@mail.gmail.com>
 <8ac6cc96-8877-4ddc-b57a-2a096f446a4c@grimberg.me> <CAPpK+O2SBm6-zqbiDbUB0yubVTvTrXWn1R+GAPne_+LGvVXp6g@mail.gmail.com>
 <945f4ee5-3d9b-4c4c-8d45-ec493a9dcb4c@grimberg.me>
In-Reply-To: <945f4ee5-3d9b-4c4c-8d45-ec493a9dcb4c@grimberg.me>
From: Randy Jennings <randyj@purestorage.com>
Date: Wed, 16 Apr 2025 17:47:07 -0700
X-Gm-Features: ATxdqUH1xwKOsh542pxYrVRq4ZpcISOHDqSJ1ufyC0_cIpqfJJyYlNd3i_cUs1Q
Message-ID: <CAPpK+O2a8uWa7M-7Kk=2xdhjDjWtBisz7o0yGPpah=iWrQTnNw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Daniel Wagner <dwagner@suse.de>, Mohamed Khalfella <mkhalfella@purestorage.com>, 
	Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, 
	Hannes Reinecke <hare@suse.de>, John Meneghini <jmeneghi@redhat.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 3:15=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
>
>
> >> CQT comes from the controller, and if it is high, it effectively means
> >> that the
> >> controller cannot handle faster failover reliably. So I think we shoul=
d
> >> leave it
> >> as is. It is the vendor problem.
> > Okay, that is one way to approach it.  However, because of the hung
> > task issue, we would be allowing the vendor to panic the initiator
> > with a hung task.  Until CCR, and without implementing other checks
> > (for events which might not happen), this hung task would happen on
> > every messy disconnect with that vendor/array.
>
> Its kind of pick your poison situation I guess.
> We can log an error for controllers that expose overly long CQT...
That sounds like a good idea.

> Not sure we'll see a hung task here tho, its not like there is a kthread
> blocking
> on this, its a delayed work so I think the watchdog won't complain about
> it...
That is probably true with this patch set.

I believe controller reset (for instance, requested through sysfs) is
not supposed to finish until all the requests are no longer being
processed (at least if it should have the semantics of a controller
level reset from the spec).  This patch set may not tie the two
together on a disconnected controller, but I think it should.  Also,
if reconnection in error recovery is tied to this delay, as it is in
the patches Mohamed posted (https://lkml.org/lkml/2025/3/24/1136),
there were other things waiting on error recovery finishing.  Delaying
reconnection in error recovery until the requests are dead makes a lot
of sense to me.

Sincerely,
Randy Jennings
