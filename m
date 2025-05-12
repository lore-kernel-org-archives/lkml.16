Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59041256C82
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051818; cv=none; b=tMOKyvNBgl2izq0wOkyRknq60CTLFm2C0AqajKMmZLkZ5mJA88/YXc1p2tixp84/E3qUCpUNihbxKsm6sz9T6/bT0YefAGsB8vJUUUudKj+iKjLCyGeUDhCPPxFA+4Vafq5njIHfO35SjUanPnjJ8nFcMd8pR7gJ3CfgxgAfxbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051818; c=relaxed/simple;
	bh=5+sRuUOndWQTxHpJp2OMZ7JfOUoH6ishomRZ1ikfcCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KxaTn5dy1zag2p7x5ICvjsB8YBTyrVmrFhAFnj0CwytOnED5stHoFElEi+tszMjK2ufqdZoGYZ5B8m7uKwGVT4DBp5Xkb9DxLZkEQAGJBOFwj0RHASonyNBcY19OhEvLRtgbwmzDEMJL/zzvtVvb2AhLAx+H7i4wGdj4cqSAg9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oy8D1/22; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oy8D1/22"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so4388707e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747051814; x=1747656614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIck6w/SQcMp6NBvZ4p8uUe4Mbt0UjWOnha54tKWvJ8=;
        b=Oy8D1/22qHsIt3Ui2lX+NALyii1SYCYO1+Qt5gmCRQ7AzE6dJ3QfeshC8afc49yiKo
         dtLm0KvbMS5DZ7wg/f4lPCmpRV2/9noOt2xxrUGfjTn6x6ZPFm2tYoWEV6nWLDsdtOg7
         lU+Ue7Qn/5h8qzuBOAjfEChw0uXYn5IwqlNgMe8ORpVhMakJdwS6hUJVgPuSGhyiZSmR
         /qNjKqOBqJTAM6Ztw1p+mYiFEw3oYcNzMwTj3shNDES1WdYokUDCyszLzq8HIouaAth/
         VTDKkagGNaejtTCvsS/fnhJkNgLtfAJsJLiaves+NPNJNXCdbi0bNAW9+whgdD7amIoR
         8cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051814; x=1747656614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIck6w/SQcMp6NBvZ4p8uUe4Mbt0UjWOnha54tKWvJ8=;
        b=Hyr10ZyPBjmLesboVv1P62wLAtf59TBE/L/6+rriSmvjjkNLqiNrHf/x7kTskOwgMJ
         pveiqQw/L5x8sKY2um3GgvKAsnK1sjJC1333B9W/vxaVh3D3GB3v7/EBkfkhZ/GBWg7i
         3jk6/RqbVPBcLyjLze56cgxbMMvKlwjN6m1wCG+McD5Dr1zPx9nxvwvpZQjGnJxlAe3u
         b8WVJH+Cnx3KY1PUqokrFGzldkD5usoPeKMevCiJtVeHCEycg2SHQc5yC11DoiwnAnO7
         k9R8ujz5D/jhpI+DnoaqE1r3yGN5IpbCRHFokEeJtRQFtNTFk2yrQQX9JtDLdYhJRx4Y
         lW6w==
X-Forwarded-Encrypted: i=1; AJvYcCXkBu8O0oauB9h8taohxltIx85BrpaokykYjPAonC3pMV0xAwh6Bu1Chh11Ab5NVKUSfklBiQVJJ+j1ovo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpzfgrL5sFsovxUw4tUwmQT1fuQX4lq8PttmeoI+FNlDSfHEn
	mZEvgP/kwgwa7cxSYUxJt5/2UjE7dCYwg8Ix6rn6xvusCI0IWZ0OtnlfkQscNsIKR/VRGIDE2Do
	2sxdRzq5ZZl0g4kFnNwBB7xoB9Q==
X-Gm-Gg: ASbGncvi5Jra90RQed5g7cCFQAeT2CsA2VYOD58dA0O3w5IbYrq/yBDwqtHXBlMbBF2
	Uoj+6XV7W3K4VGcBTZoNu7G72EPe4TbzMkKqe5E0HqetdbdBi4whjuHUabgOpJJTzbrz4O00QcH
	Xu2IKS67Nl/lpXQBAOql3IN8+WysCTY1bzwL4jM3ebhAsN6JI=
X-Google-Smtp-Source: AGHT+IF8G7oFBg31h5jCts7XIgAlODcS4luBIOQVuH/IDjNjsiFi00Yb134A5wUkhl4vvlreGdGUypfDko72bBWOs7s=
X-Received: by 2002:a05:6512:4408:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54fc67ad8bemr4587151e87.12.1747051814065; Mon, 12 May 2025
 05:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512064353.1535984-1-xin@zytor.com> <20250512064353.1535984-2-xin@zytor.com>
 <20250512093033.GO4439@noisy.programming.kicks-ass.net>
In-Reply-To: <20250512093033.GO4439@noisy.programming.kicks-ass.net>
From: Brian Gerst <brgerst@gmail.com>
Date: Mon, 12 May 2025 08:10:02 -0400
X-Gm-Features: AX0GCFv5SFfslEnc_8LF-H7gFfEYQHs37hBNAHrGT6hBY1szsJZOZl9ofHlCNSE
Message-ID: <CAMzpN2j1zk854JnoFSP4uh+xJQpz3qfwE6T21J+ic7YrKJJ8yQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/fred: Allow variable-sized event frame
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org, luto@kernel.org, 
	tglx@linutronix.de, mingo@kernel.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 5:30=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Sun, May 11, 2025 at 11:43:52PM -0700, Xin Li (Intel) wrote:
>
>
> > -#define INIT_THREAD_INFO(tsk)                        \
> > -{                                            \
> > -     .flags          =3D 0,                    \
> > +extern unsigned long __top_init_kernel_stack[];
> > +
> > +#define INIT_THREAD_INFO(tsk)                                         =
       \
> > +{                                                                    \
> > +     .flags          =3D 0,                                           =
 \
> > +     .user_pt_regs   =3D (struct pt_regs *)__top_init_kernel_stack,   =
 \
>
> Should that not have a -1 on or something?

No, that symbol already accounts for subtracting the size of pt_regs.


Brian Gerst
