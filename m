Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494D78F3B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402240; cv=none; b=fIVTiCrw0W63EOkjsn+58Wgti0Gol/GH6ORGppwby23qFvbppzdUU54pb7C7NgfwSILQAKEiZR0BUvCUTsSm/MsPkfUupG+g05WXENObKnf1Lit6ZcQs0OvNlrUQXZcXOzOYK2vF8lNoOzWTC68XhElUPRfEFmyqrFc3yMSV8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402240; c=relaxed/simple;
	bh=LdFAyeQKVhf9an3e5Ej7+PQMaVUuxTdXfDQvB2CxLPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NeGN6QaLJmje6nSZHiVSNiAcjMqlS//AWiAiqFdHigSYZ85NwFrSgMTypAIRYgVNmaliXhxgnLsncEBgGCIoIj3czpyp9/xgGI4c8snFHNsXcRJF3uTmYfu9fcrIPU6fmn6EbaZ8VJL6oSpu63prFbivCASVyQeBOGrT8fJnfL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AUtdmK2x; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AUtdmK2x"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2349068ebc7so134625ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402238; x=1749007038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdFAyeQKVhf9an3e5Ej7+PQMaVUuxTdXfDQvB2CxLPQ=;
        b=AUtdmK2xipN+sZQV7Qo76/sOfDnoWKgEgP2v40hWsmGmrGxbr0cc9D7EiPHGOS0cXm
         Wz7EMFD9xV4B3CEUWPGwsIjks/X3EGkJcQql3y/mdnouEwwiaEh8hbthGBlwH2hF6jCP
         75Xr/+7z67Ad+8aw1BqRB7LxgGX7bcnc399qs4I09LOw+fhcU42bGj2mcluoqmaSv6wD
         +CsOAqPniJcsIMR2WPzdtjvu7sk43omgmglDfG3e/cDRk0YGqqAIGIAWRjNNbmhmNe5c
         P2aJH7/rRCZvSVi61dAQYUsgqd1vtEcPXsWdwMFTir3OclYupZU2USsXwEdmlPKCTjPR
         w2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402238; x=1749007038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdFAyeQKVhf9an3e5Ej7+PQMaVUuxTdXfDQvB2CxLPQ=;
        b=V392gpSPc3ctU3QIHFbDzFIBBdhjTahUAS1PTT92aBSXPt9i+2F5GoS6wxBuaxVpq1
         rMY9UpASHGXQP+5O7SPHTkmFaYS7BXP5sDyp0m2Ju4KAcpdDcuACPtkMKKykTqw7oT88
         1DRNr+wPQczH+HIap3UREGlzqpF4yv9koG9FN8AwSEYMDinH6w59eU81sNLZje+6Ntw/
         G7TGoN3wvvskbzL9mxdq2Wn3Vram7wh39lK4zBFMC9Uwsnz4rwxbVhw8bmj14wQ1c6bx
         HG/lP61J2YMBYxBzlIR8Wx5hT1N8pEZFxBE/jOSIQXvgJOQGfHY3M/qbJbCSiBXbp9/N
         ojfg==
X-Forwarded-Encrypted: i=1; AJvYcCW6jWKMWaLd0dziRs9+Fd/Kv2QoPdtgdEcsXBNQS0PdYRYID2iE7ClvHKSQyoa+cPbdghRlBiZgXx/bhDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnIEjsjNO/pYtmda8ziBgmc4zYeK8MBTcq7E3XTF4G+X+R2vS
	pVcCb1R6VgTiTuv6Yi2S6o5jCEA8GIHaz+5qaSwWkej/Sy0A25hjSOik8H5BOU/5C9NUIuzbMxb
	2pxyN+Kd8pJ35DLv0Fitv28cOSFzyO+XDpozJVPMR
X-Gm-Gg: ASbGncsNTQ8jj8StN5TlS8n5Z80rWWxgERYUY/4+lu/b7ZA7f9bul2JtHUyelG55tsT
	6PdLJSxSv7xwkDo7l26JMXpjPkmutnLLb0HUiLL3J9Mk8QGJakxaMRygEpJx9Scng1U1HT/Stuk
	5gn6GEQAGNbk+KGePa1o/A37sOaSv6NA+vng3rI+nEoOd+m/pk/qgaAcY=
X-Google-Smtp-Source: AGHT+IEnczAUe8aSvzmzngQXQGk0N5lF0CakBmamAAAHOTmJuCP9XYZrHm/qfHgB3Xi0bVS+4KeIoprZZQQkQB9JjsY=
X-Received: by 2002:a17:902:ea0b:b0:234:bcd0:3d6f with SMTP id
 d9443c01a7336-234cbaf560cmr1132885ad.1.1748402237697; Tue, 27 May 2025
 20:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528022911.73453-1-byungchul@sk.com> <20250528022911.73453-6-byungchul@sk.com>
In-Reply-To: <20250528022911.73453-6-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 27 May 2025 20:17:04 -0700
X-Gm-Features: AX0GCFs29uDSGIhRSaJWQiNCOlbuHKz4cCZioyPrXBBoYFAI3Cxm46scEROF8Bo
Message-ID: <CAHS8izOVbJZfS0r+A1Pi_ZxmrJBfUBZR4fApbd=GWj0AFQ8vcw@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] page_pool: use netmem alloc/put APIs in __page_pool_alloc_pages_slow()
To: Byungchul Park <byungchul@sk.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, kuba@kernel.org, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org, 
	akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com, 
	andrew+netdev@lunn.ch, asml.silence@gmail.com, toke@redhat.com, 
	tariqt@nvidia.com, edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com, 
	leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 7:29=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> Use netmem alloc/put APIs instead of page alloc/put APIs in
> __page_pool_alloc_pages_slow().
>
> While at it, improved some comments.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
