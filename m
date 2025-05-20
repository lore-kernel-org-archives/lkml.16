Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2358AB67A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747702404; cv=none; b=nRJkzvb/YY8i3RpiIbsHpar/UacYm5ih+CxktnuFA/wByMeIUAOfGNqlQT3X+/inoovlrEOb+3NirEdHvHwK7BFYikzHeRJDFl0JdHJiEDnEL6bc8LmwRcl6uX35Q35WlYsfFwL0sAtAz/3sb/jDEgQVt4bcvNj7w0dFTIs4IQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747702404; c=relaxed/simple;
	bh=hZyHJGq+ZsR6itQDKNcoN5Hbjv71slOqZWdkLeQAoiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8bRWguR+zElw2o67DJovyUPHvlQREB7WbdjAD2F+rWDPeJ/nfAztTQtR+w1ZZfVFd99hoShulHp+ur5fYTLDVx7gAr3DQfJPK8rz7LEf9AZwQIgVE5DWDXzEdA9Q5hBeko48h9UzNQj8rExd6QwghdDJi47aJeCuYAZS6rR8jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtlPbaEG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtlPbaEG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231f6c0b692so458315ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747702402; x=1748307202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZyHJGq+ZsR6itQDKNcoN5Hbjv71slOqZWdkLeQAoiU=;
        b=jtlPbaEGGQ5zk3xQJZk2ztuSBTiJ+CD2mDDbhFHj+goSsfMJUqhUxEqzSJmy3gg7+7
         qRdf/rBAoYmkNT7oQM9AqYRn7M6jvCLxlADY7z1wA7Pp+2Z+rcd/+tigPZ607I7k3oCQ
         lHIl1BJHITXPXteasEq1BjXi0vVkriFNRBKXv5jVcfd/bwnTzhzK30gtxDtETrPx+Des
         TIBrO5CPP6e09uR4uNPmcIKkn9wnItm+Sm0u+7WV0Uqwz7KhvDqLl9+10GB+fVjlWIAO
         Ivygpq1xedUVNbkRtnZaglqgcloqSq6KZ+n4YfcmpC8AO0Vb24xGbsN74u4x4fatfXv9
         zCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747702402; x=1748307202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZyHJGq+ZsR6itQDKNcoN5Hbjv71slOqZWdkLeQAoiU=;
        b=gg/rfujc6l+WEQMNMwTCYISppL0vFI9Zd61JT6wh2/l4OwEo0WuHG5eCQFY6ed/H4L
         6CNrEb9M9Ifm9DLtjev72vvs9JD3o3zoYX2/dLtTIsiutAeOdxuEX8V5zj9lg/5yQDoM
         ZraQ0ZKQXBapNjWHRkWUF0jgfXFKuJYM2H46Op4s7ziZ/NWmE7RFBpebNkILl0pzH7cs
         xzyCTJwctF2s7VcTdndJ0YGxIPaeOs3O4KCU+aYW1KBFE2C2ZJVlbZx8ztmwaqIKtMC/
         XDFmbEHaOxe5DKS8AXP7xVAWXJr6IGkmFmeAorJF8GNrtmJN34Aa23u4qhc47ztB9l+Z
         ngGg==
X-Forwarded-Encrypted: i=1; AJvYcCXuWsqNxJ+B4QQbqaY3foPwuizFWxUasxQz9vh6M7Eq+bB+Q83m2Yw57GEe+3y/mPUVex0hu132tZ1UGSA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0p/XaQ7Zzjps47zjGnr9LAhbuI6xnSz14PVJ/Z+/rmdOQTE1
	gtmnSnjYFBGJlG0d8smzYMhKW7sS6Tgxbdpsk/mT+Q0qqV5HiP3W68tn/AEDOhAWmwLQzE9X+Zw
	xcjqNau0vGFFDRMaQWwDfjADpnM3Lng9OScrHh1ZM
X-Gm-Gg: ASbGncuj5JIuaho1kyOkfAgqRqlMeZMMFd+NdiFeyE7w+uEZlVK5LlZb8aC/sJtBMIa
	Yo5bSkrUZtnx3rJnoYOnXiZKxeCw4CynZiuwjwwJJAGpENx3gM9sCFmNuAzNEoRdblaFf3qFXm5
	2/cpgeUFdm75ZqMBD5mpa9ul6eijfIbYeJiQUOblujA15slrd7Wht6fJnl7ptbS+UbmH3lgaKyH
	w==
X-Google-Smtp-Source: AGHT+IFmzSlfu8cPt9331tiaZbhyO0eqK04/KN6sjlHzXYvGQdKoOodIwc07OvPCxK6G8Bhb7mHZTsSYXxM0tDcGuQM=
X-Received: by 2002:a17:903:234b:b0:223:fd7e:84ab with SMTP id
 d9443c01a7336-231ffdd6fdamr6951115ad.24.1747702401932; Mon, 19 May 2025
 17:53:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513083123.3514193-1-dongchenchen2@huawei.com>
 <CAHS8izOio0bnLp3+Vzt44NVgoJpmPTJTACGjWvOXvxVqFKPSwQ@mail.gmail.com>
 <34f06847-f0d8-4ff3-b8a1-0b1484e27ba8@huawei.com> <CAHS8izPh5Z-CAJpQzDjhLVN5ye=5i1zaDqb2xQOU3QP08f+Y0Q@mail.gmail.com>
 <20250519154723.4b2243d2@kernel.org>
In-Reply-To: <20250519154723.4b2243d2@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 May 2025 17:53:08 -0700
X-Gm-Features: AX0GCFsMFm9rnpoVJDWVHpT5tSl4QHUsUid2E9o5Cvl69IZFUu_IpwVRegfE_H8
Message-ID: <CAHS8izMenFPVAv=OT-PiZ-hLw899JwVpB-8xu+XF+_Onh_4KEw@mail.gmail.com>
Subject: Re: [BUG Report] KASAN: slab-use-after-free in page_pool_recycle_in_ring
To: Jakub Kicinski <kuba@kernel.org>
Cc: "dongchenchen (A)" <dongchenchen2@huawei.com>, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhangchangzhong@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 3:47=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 19 May 2025 12:20:59 -0700 Mina Almasry wrote:
> > Clearly this is not working, but I can't tell why.
>
> I think your fix works but for the one line that collects recycling
> stats. If we put recycling stats under the producer lock we should
> be safe.

What are you referring to as recycle stats? Because I don't think
pool->recycle_stats have anything to do with freeing the page_pool.

Or do you mean that we should put all the call sites that increment
and decrement pool->pages_state_release_cnt and
pool->pages_state_hold_cnt under the producer lock?



--
Thanks,
Mina
