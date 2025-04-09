Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2F4C9D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214343; cv=none; b=RDpNHSIvXMrLlrV+tOIhDB688vQRpKuRPHaQ2bAlvKMEhxW6f93x4ygnQO1kgOBkA/8r/JxMfe7oLinTpvoHK/A0nzCQzucho81imjADdUDQ3eA00Rqb2+jBAxXifbQ26YJ2HQG1nMhVUaJJTmouMfAHvT8CxTXNlCz0eq8a0/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214343; c=relaxed/simple;
	bh=XcH7EcKvFmwxA3XYUg7s8/QJB4ZCktKtGLmASsozrng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQ+bNY2TGivRCJM6uNu1OzTLqobAupBT4lgqXx8URsAVNqFsIojuM/qzUFvD1X2eszpVy9aZpXi2bTQiuFSWIxPehfo1EAFIhIVohcwAGp65x4qw5zrgvwaKwBRw07ddL6xJjn1nQFqWivtO88YAcS4cgRyDspHvZNXLS9AJs9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MZSN/I9Z; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MZSN/I9Z"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4767e969b94so117162321cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744214341; x=1744819141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcH7EcKvFmwxA3XYUg7s8/QJB4ZCktKtGLmASsozrng=;
        b=MZSN/I9ZTBXnXbXn7NAaIKNt4H8XjYjVkO7mYEm5AOFzBwfUi/JDKRXIS73H/jNdrv
         ynKpFqe+xTMm9fRisFud4PyJqId+yKwYi6q/FzZMGzQlvomAehwqpX8pGJY7JEeLTJHh
         Wo3xfVw5qe7nnLk9hdgzglpc/Q5A4KRaKr7swf/RwyI59ticvz5v4SsQAJ/x4jy4tZfd
         7mv6Q7+1CaXPla6RRuo6GfxvrUP/2FaSai8ICB8zpglfBFOFOeN/l6CqxA5Dc5G6+Iqg
         OqGe8/9dbUB/HMQetf8jGPda/10v4LRRBlgnv8R7UsJG3po997isPFL3aZMNIucVXyd0
         qB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744214341; x=1744819141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcH7EcKvFmwxA3XYUg7s8/QJB4ZCktKtGLmASsozrng=;
        b=dQRQr0RD0/MjGwb1aRRi9JvstjkC3KcWZBECE66KkOJ9aNSaMUDN4kIpzqysXs9NwL
         wLhBiMBx8jTrZmpVsUUbPoLsJq5KUHE9QLMdRKerlYiP2FxeaIQBaxpys852v8UAWeCz
         nOIoGi0M4GiQ7VqjdSh/wXLZ7H1e78SzGl/g+oqKZYz44g33Q7WHQnKUyqc67JIqsNH6
         MEASZVdgqoTYnzimoV4WKpjfmCVmMbAcTsVxXXMcTqM09imr0XvVHQx9ksx0Zqao5Oxw
         ezGjqpKlnNZnav1rW2D1Me+wfh5fBTdQmBgf2Sed2hMhG4qW6NM22YiXzyirfMxEpAuO
         UrSA==
X-Forwarded-Encrypted: i=1; AJvYcCVxlBlDxcHDZLcfpsW6YW5o2nvGJgbxYZv44yHCI6qF5dHZS3/frv3CmDpGm2fTGHCNLkHKV7oZWcyBSow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFsOyMGAZkkZhPOgr3Rw0xTgbBUaU2ngOKbuOUDWi5UbVaSCCK
	8llom0g33Hgao7LXseJqusBS9QoMFeLlDKyqx8IqoSfJMSBjrLp1OR0xj9cMAhDJ3SBC3at9T/z
	fyXoi698P5liBE7kqDGs0mVzPxLSdW+w5G/jq
X-Gm-Gg: ASbGncuEbynSchcbpMRPaYDDhAhxcQVugrma3cOW+lWdBV3PXhrhqYWoGn5zOQBSuQn
	dmu4M3I83iPT57ACdh48v5P6KJcs98hy+OJXM0OpvkFPH6v/2n8K+mcLjl8YwRn8dGn1Tc7RYs0
	HKd66eu9C8ubnZuTHbQLFqhA==
X-Google-Smtp-Source: AGHT+IH0RTESPK/NJ5Ou35TXpdrPGyuaN8DXVZD56fO3j6B3neA5pmFlXcOA2CYr67ILMi7s35IIrwWamYsSXF5CmhI=
X-Received: by 2002:a05:622a:1a0c:b0:476:6f90:395e with SMTP id
 d75a77b69052e-479600a8a0emr47831501cf.21.1744214341023; Wed, 09 Apr 2025
 08:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409112614.16153-1-jiayuan.chen@linux.dev>
In-Reply-To: <20250409112614.16153-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 9 Apr 2025 17:58:50 +0200
X-Gm-Features: ATxdqUGuWPO65Q8Izl_HTv6LGfTHz9AyxHrvgZCqKWrBazkw_CnhWTjlj0b-fTk
Message-ID: <CANn89iJi9+qn-QyrghvT5xZOvqi_FQX5iGeW3X0Ty=xRe9i2MA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/2] tcp: add a new TW_PAWS drop reason
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: kuba@kernel.org, mrpre@163.com, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	David Ahern <dsahern@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Antony Antony <antony.antony@secunet.com>, 
	Christian Hopps <chopps@labn.net>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 1:27=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> Devices in the networking path, such as firewalls, NATs, or routers, whic=
h
> can perform SNAT or DNAT, use addresses from their own limited address
> pools to masquerade the source address during forwarding, causing PAWS
> verification to fail more easily under TW status.
>
> Currently, packet loss statistics for PAWS can only be viewed through MIB=
,
> which is a global metric and cannot be precisely obtained through tracing
> to get the specific 4-tuple of the dropped packet. In the past, we had to
> use kprobe ret to retrieve relevant skb information from
> tcp_timewait_state_process().
>
> We add a drop_reason pointer and a new counter.

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks !
