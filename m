Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38FD21E0B7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 22:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750371591; cv=none; b=qbw0kSR2W1Z4P4yB3Cc6uofsFdqeD1ganEkrYlCQMJlv19k9k02VjAx99qbEF3Jx2+qqhX2w0qq5yJu/Sgh0UNtnrEZ27MXWCHnKCb9OcdhAsUC+8JoFLwvd2fwwLfnVDpzmpE7kM5jnMjstdcOSM7dZ2ifP8F1xgNGNNfqj/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750371591; c=relaxed/simple;
	bh=jzE7STPASTWXr5d4DzsQEgZiCI9HTUGx9Hsc5oeFyWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HV7StC1KG5UZarQEmWKImt/2eqd443zZhB24Ozx6LizWD+c+GpxB5QwTUqjx4my7NYlByWPPyV1zGSEqWe0N8Jxym5cHfbe7YjKR6Mlp90iXo7G8cwQZpb1DRGH2t8ojG8gkXJQJICU5QTYdF+8XmVnpiHP+zFmR/lERqvlVBCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DxsjNcKl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DxsjNcKl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2357c61cda7so165995ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750371589; x=1750976389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzE7STPASTWXr5d4DzsQEgZiCI9HTUGx9Hsc5oeFyWk=;
        b=DxsjNcKl51AXRSRLfvtYmNUjfUAYw/9VBR7r+MshkTMmzuQphgo7pzLeU8cLmcEUac
         obPM1ecWgPitNNkAbskbX7ouXh+ct4VvOH57K+fMv+R9sR8s980nlkYI6LVcPld23S0J
         Po55ByiAQ/qFQHSioTFiaqs8HB2JtwzLbfCQH8+NroDx91Cm3MwpbWlnfHqbhR59gjvY
         staNRyNhkm98LQpdkJ6kJ784K94aNva7GEGFxYOSYX0AueAUmJmfiB+iHFt9M0SJsBOM
         uozh5NGafx+aWvw/BHxWt5MVV18PXy45GDptDXgnFw8IHi4s2oy2HzSe7WpQJCteftCe
         HGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750371589; x=1750976389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzE7STPASTWXr5d4DzsQEgZiCI9HTUGx9Hsc5oeFyWk=;
        b=IIU/VxiP2srqGqP3FzoeD1CCnGiRIg9e2IhaDfGe23vb4N/Bnf67Gi6t4cTEOho7jY
         rh8KrGSZfhh+FNTzivMHUNw+FkmBCoDAEBvntWc/6ixA5iXStWdCtkevXdK6lemUFHls
         0p5ovTheBEkeYw0Dtikj4kTaQx2UmoGfUHsJHibDYzbtcziAJNMrijgs/RZmeuvfL50+
         lEYT4xJ1TxfkXLtwpj8VHprmp005RfULu144NNulMwxPx/xXtN3mmrcad3XvTN4piypD
         Yu9X68xIMI6qV1sA+Cc4s8GkS2bfZiMWOJHr0lKCnxqTtgGC8bblXw0Qvj9o2xaMVrZx
         lcLg==
X-Forwarded-Encrypted: i=1; AJvYcCWkESMX013O+xigsJaq4bDBOQ42R8sJ8zmLNweLxYsr5aFyzalEVPmCdSsuQ1p6I8q3OrpzkApC5w7H2Pk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2Q2llslaA9lt401wqax7KA6XRiAnSYbwTXYMY+ZFmpwHbi/Q
	uujL7wfeutYVt04oeErjGpnOehpqU9gw7MfruzefSSTLESJvL4XHE8i9EVpbMvmXpECwrbnXnV/
	ggrGsoyGoEa23Mj4sigG4NOvOKjraAN+OhkkoiSGs
X-Gm-Gg: ASbGncuZ9N6owRhlQlgE1oX7mA/SIsHUADCKkX5D7yvn0Dx9SriBDNnbq+0FoNtuxko
	y4uPTC3tOv12Y4iK2JjJ0GtCmYcTDsT2A+h5JJVn296juM1NDgKbyZE7qNdA+PvA8kysjCSXGkE
	9l2M+GR/vzk/fFiox6njOh/OB2/2Nz0y337QNxk4VU0jPm
X-Google-Smtp-Source: AGHT+IEIuigoQw9BiLSxf1qtBH8TQCN6oIl0OunjJBmsKS0D6b25SrS5tvIo5+EfAZz5fwtG0XZyMihlM2iaVGUlOzY=
X-Received: by 2002:a17:903:19cf:b0:234:9f02:e937 with SMTP id
 d9443c01a7336-237ce047dccmr3307715ad.25.1750371588876; Thu, 19 Jun 2025
 15:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616141441.1243044-1-mbloch@nvidia.com> <20250616141441.1243044-13-mbloch@nvidia.com>
 <aFM6r9kFHeTdj-25@mini-arch> <q7ed7rgg4uakhcc3wjxz3y6qzrvc3mhrdcpljlwfsa2a7u3sgn@6f2ronq35nee>
 <CAHS8izM-9vystQMRZrcCmjnT6N6KyqTU0QkFMJGU7GGLKKq87g@mail.gmail.com> <xguqgmau25gnejtfrgx3szhneacyg2cjj6vlsi5g7fouyn2s43@nemy5ewelqrh>
In-Reply-To: <xguqgmau25gnejtfrgx3szhneacyg2cjj6vlsi5g7fouyn2s43@nemy5ewelqrh>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 19 Jun 2025 15:19:35 -0700
X-Gm-Features: AX0GCFvxm9EEgLCdwq7qt68RwaSnO_IWyvBob_0iL-n-QjvMmTutgFl2WipSVW8
Message-ID: <CAHS8izNQ+eRH3L-npJXDO7cCYo82jPL0jROBnYXu2U7Kko65Kg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 12/12] net/mlx5e: Add TX support for netmems
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Stanislav Fomichev <stfomichev@gmail.com>, Mark Bloch <mbloch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Simon Horman <horms@kernel.org>, saeedm@nvidia.com, gal@nvidia.com, leonro@nvidia.com, 
	tariqt@nvidia.com, Leon Romanovsky <leon@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:07=E2=80=AFAM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
> > You have to test ncdevmem tx on a platform with iommu enabled. Only in
> > this case the netmem_dma_unmap_page_attrs() may cause a problem, and
> > even then it's not a sure thing. It depends on the type of iommu and
> > type of dmabuf i think.
> >
> Is it worth adding a WARN_ON_ONCE(netmem_is_net_iov())
> in netmem_dma_unmap_page_attrs() after addr check to catch these kinds
> of misuse?
>

I would say it's worth it, but it's the same challenge you point to in
your reply: netmem_dma_unmap_page_attrs currently doesn't take in a
netmem, and it may be a big refactor not worth it if it's callers also
don't have a reference to the netmem readily available to pass it.

--=20
Thanks,
Mina
