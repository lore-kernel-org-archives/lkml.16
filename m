Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D3189913
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299405; cv=none; b=Oy08wFshCHCcN4sU5rS2Uh9ZWvrVVshtyaexo2cc13hYhlaSuShpZxfN1yKrQyBnv8ZsYK7neuFqAqaVIo5yrxQGXpYPJ3ls2QZks8BAUjoMEm2ICJ+oiS6/H7qO/RDCeba6at0wmeDi0vuFIlyRoKOCRH5kCknQdPmNGL3PpZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299405; c=relaxed/simple;
	bh=FmX3aoH1aBtX5KhUCEOGKZyMyiYbfK3Hi1ItVvkoEzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVcruFt27nWpBIHe4sNUSWMbvcgEZgkn1+VpQMl1INKpC9Dmk/Gd/aj9IGG8rN+8IWPToQNs/2w8kHj0kWyMkkDO08NTLKtX5pcmm6SGMan2wplRh+d/1CB+7sLt1PqeJY8DmOvFnLbMFUjTYEcQi7g/c54TAgU1wuCy61xy5N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ThYxVLV1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ThYxVLV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744299400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+uixq6iFVjeynAJZ/kgd5IdlPdxMY+eI4356Zi/haI=;
	b=ThYxVLV1LSHdHw5JsqtOd3339+Yn4yjoe5lhHDQvNaGX21eA+edQW2qKx7pI1iYkPgTtCp
	dLJtxo/E9rif86fCr90dn89PbIBek/KX4pVBXrrMBpqI6bwkDgLKG0ugQr3ZokoPfj7lz/
	R6U3M646nfeoYvEa799Gszakii90AxM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-C36E4JomPRmk_PreMGqmxA-1; Thu, 10 Apr 2025 11:36:39 -0400
X-MC-Unique: C36E4JomPRmk_PreMGqmxA-1
X-Mimecast-MFC-AGG-ID: C36E4JomPRmk_PreMGqmxA_1744299398
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac79e4764e5so102109766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744299398; x=1744904198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+uixq6iFVjeynAJZ/kgd5IdlPdxMY+eI4356Zi/haI=;
        b=iBbfKVdQBjvj7xxglVKNLujuszxiYs2aK69HBge1saAldAGxK07Pgc43m5zCChNYTT
         L/rz3UJZcZKnUjK6I8jP9r0EI6bAqDlpaq5bhQTvanLAZB3sI4QjvUbcSwK2gz826lhn
         4h/+RoraC1e4aHYVm6LqOezJM3TTLoOjX+RtYxg5DJJ7/EKlcHPFbiUe81lFR+/+H+ik
         +L+3vpOc4b7JJRz+JPm3VisAXF1KZ0OaoYau091v0bkbgk0/OI0iVNZsKqXBp5K0eOSN
         wnFmFrKvJm1vIZMFfft+K6OLI6AWnG5yFHPBmcTe+OiAWTFA0ghgs2G5cQvSbEnTfnQO
         neyg==
X-Gm-Message-State: AOJu0YwjWoVkjSLlonkMXQQib11yVz8u550/XyZokb4g249IXpTX1VuF
	7gowz/hsZLo0k4zcx+BIMr7eNePxw1sGWIfCiG84GmR6pnpJ0PqGCAKsOuEY5a32EhJT8H+MuBn
	cdMf2aLWe4LQP0zmP5EznaUF2iH9NIyKPEQBp0fST+r2CKTbZwk1NDjwV0A8dfTTE7qp6GW7STw
	Y1WlL6BV/Zu1BoiV4iuxK+dPPmY1N/p+NXIwr5
X-Gm-Gg: ASbGnctOB/gyu1HKyO4sNqE6h+z2De3L0PubefyWcpQ10tUkLKG9uGuZRDbRchklNfs
	VcqseUMba7NgTjC6iquvUOu79Ai8/p2UFzlyr5E0sQxfpHCjRiBHVBkpXuQV+XNQFvCRW
X-Received: by 2002:a17:907:2d87:b0:ac2:7f28:684e with SMTP id a640c23a62f3a-acabd126b90mr273866266b.6.1744299398276;
        Thu, 10 Apr 2025 08:36:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+XC/M6wH9xagKDAi9bhg9vzgdhpHdMgqtWeDFPDrWeCmSsw/+nm+DFGhupT4ZrKArw6KRhIOnbJXaUYZxK1E=
X-Received: by 2002:a17:907:2d87:b0:ac2:7f28:684e with SMTP id
 a640c23a62f3a-acabd126b90mr273864766b.6.1744299397942; Thu, 10 Apr 2025
 08:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328183858.1417835-1-bmasney@redhat.com> <20250331212337.3e9e4a5c50f5d3f16a95b120@kernel.org>
In-Reply-To: <20250331212337.3e9e4a5c50f5d3f16a95b120@kernel.org>
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Apr 2025 11:36:26 -0400
X-Gm-Features: ATxdqUFWXGDODT6yTtCf6BC2LWlH7sonW_FuG54wwjQcn0T593Jielx3o6yMKTs
Message-ID: <CABx5tqKFzi2-_eTmQ1K+NvW+TSZOMUz83+Z0NHb7C2FEut23UA@mail.gmail.com>
Subject: Re: [PATCH 0/2] tools/bootconfig: allow overriding CFLAGS and LDFLAGS
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	aruiz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masami,

On Mon, Mar 31, 2025 at 8:23=E2=80=AFAM Masami Hiramatsu <mhiramat@kernel.o=
rg> wrote:
> On Fri, 28 Mar 2025 14:38:56 -0400
> Brian Masney <bmasney@redhat.com> wrote:
>
> > Allow the user to override the CFLAGS and LDFLAGS similar to what's
> > currently done on other kernel tools. These changes allows bootconfig t=
o
> > be compiled with the hardened compiler and linker flags.
> >
> > Brian Masney (2):
> >   tools/bootconfig: allow overriding CFLAGS assignment
> >   tools/bootconfig: specify LDFLAGS as an argument to CC
> >
>
> Both looks good to me. Let me pick those up.

Should these show up in linux-next by now? I see them in your tree at:

https://web.git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/l=
og/?h=3Dbootconfig/tools

But not in the for-next branch.

Thanks,
Brian

