Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268F1E8342
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229986; cv=none; b=D3d0yD4qY7gLVZ6sICFE7WXCl2LoaEzTLlyfwpMm5XiLK+SLLhb1iAD3Fnc0zFklC6zNRk8CRT65Bp0qLvAoC5N+4A4vXZjAAYwyWDlmqG39NMhN5EYWDaZBOZyLa+TDorPyzp6yDnul4mRSfehRfOJ/BHk1eAK2EGipAgdEYv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229986; c=relaxed/simple;
	bh=vFYL2A2m4BVqGIUPwG+SJe8Wi/rBo/+xMXvF158DHXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4CVVjzFgrPPTOsfRsAvgx0h856QGNpV0m/Mcjw7kS3s5XkmyoChZqr86pN1rFxXEQw/1aghzZtBaHwTTmCjRmx0fMzrPCG9WFBpo4Segsqu4cOXfh/s+K7EHXeXTDooUXp5VUFouyGK0JE7w5YRc+XrGBjnko0y8+n5AO3TzRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Wn+nA0JZ; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Wn+nA0JZ"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e6e1cd3f1c5so78970276.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744229982; x=1744834782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsHh17W+bDIV1e4xVUO/JwjeRPH7cOalB9Js2vjnhrU=;
        b=Wn+nA0JZQAGWXBbLIKOsOUEp6QNQFXHFfl8D9NHSUQH82ABaXlAr50iV+7HSk/LZ5q
         qx83eELju83YbCI2XWoyLlB3SZVZaRWjw7YEbQZvdLPyWG9MCMlD6X6v+VCg+pKiPCte
         kUtBSXZZ2Qo+odi9Y5zgSmAy3ErlpXgwOmQ9U3Q5ixc9brwQnG+lulMQO98V0WBFWMsJ
         +fGiXrx641WxrozoR1GTYX+VQbUBJPGqYtgyHbMIDVOcR/PIYFLtUkmWwz/UvLzO1AA7
         WV+ouudBXgaa3eo00UmsD2TVEcyoT8t+QffxgHPg06ODRAFr2u/5dz69btPw7PUcr7gY
         Q3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744229982; x=1744834782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsHh17W+bDIV1e4xVUO/JwjeRPH7cOalB9Js2vjnhrU=;
        b=NJdxb8vrT1O/fY5xvyHll/ymEsEi93qD6201+Gj4tPqKbaj2IZ0E26oeUfmdYOtaIt
         w9X83MXlLSaH4V4/JyI00BhurHjx9aF9Cq3xk16N4HUA8F8JtBpXU4xh78c08PQh6RLU
         UbGH/3gsYyQ1mrpbj2PnitHe6m/d1mLziXYZbkQvkBVe4hAQ8/H0FNkaH/1AxNLJXUEw
         WuTHQu078i6dmIonwMVBjrvnqRC4hTqFEzPwefxYuehd0jfavhk/2PvnUTXkCLmsEsF2
         w9VxenHVU/AA2yZifGhtqqWFe6FESFsD6laLo/GENcGZi2EjIni533rF3WnKzW5qIYma
         zV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDYziiqXJXJdojrRSGDXl43G4kj5mHJb538jT+KzhAWvL24UqXwSyxfd0DrSNhdg9mZ78YLcPMZySCRBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNeQjf/ZAE9x4IPlxkOlgXpJm9Z3ycbVRJJax4H3AFmhakb+dR
	puUbvFDVV3DIBjUmz4ocZ9QksvyGnk3EQFoEgormHCncOejIGiZFfN/e4Bqf46O4tpQN8w2GE6b
	A+SxM2pDBxpLeiYQmExr5z36Y0qAgCfXDJP/4
X-Gm-Gg: ASbGncvAd5KWEJ7qWrcD2Y+75rXOYSigU7iBNYAKR5gAiEWcI6NoVEj2AFAsOvUN1rz
	7PDJVXPLRzXXPDKJ+LRKf6nEBqbB6AbnlR3WWlkC2zNb2CpJ8jmUs8wdB1fsMWdudBhQjeS4Kqg
	rlkpn9NE5D9WZlZIcmkjo1zQ==
X-Google-Smtp-Source: AGHT+IEGCJR9IA5jDMT2Of/TaTFQ6Kl+jhMbbHqtWzPYG+QuFj2lKMDW1yD44Tl3NdNB6jTiuM59Ql0Ux2XWfYO9+PU=
X-Received: by 2002:a05:6902:1b90:b0:e6d:f3ca:3e15 with SMTP id
 3f1490d57ef6-e703e0ecf38mr658467276.3.1744229981817; Wed, 09 Apr 2025
 13:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408112402.181574-1-shivankg@amd.com> <20250408112402.181574-4-shivankg@amd.com>
In-Reply-To: <20250408112402.181574-4-shivankg@amd.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 9 Apr 2025 16:19:31 -0400
X-Gm-Features: ATxdqUEUOdbJE1FR-JWrcEMUFKxoL7rqK5e8WWf2cXUgc2Yd72xDgueuEkSahFw
Message-ID: <CAHC9VhRFBOC=cZB+Dm00cshwBSBaK6amv+=XFLPF0Bub0gHN+Q@mail.gmail.com>
Subject: Re: [PATCH RFC v7 3/8] security: Export security_inode_init_security_anon
 for KVM guest_memfd
To: Shivank Garg <shivankg@amd.com>
Cc: seanjc@google.com, david@redhat.com, vbabka@suse.cz, willy@infradead.org, 
	akpm@linux-foundation.org, shuah@kernel.org, pbonzini@redhat.com, 
	ackerleytng@google.com, jmorris@namei.org, serge@hallyn.com, pvorel@suse.cz, 
	bfoster@redhat.com, tabba@google.com, vannapurve@google.com, 
	chao.gao@intel.com, bharata@amd.com, nikunj@amd.com, michael.day@amd.com, 
	yan.y.zhao@intel.com, Neeraj.Upadhyay@amd.com, thomas.lendacky@amd.com, 
	michael.roth@amd.com, aik@amd.com, jgg@nvidia.com, kalyazin@amazon.com, 
	peterx@redhat.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 7:25=E2=80=AFAM Shivank Garg <shivankg@amd.com> wrot=
e:
>
> KVM guest_memfd is implementing its own inodes to store metadata for
> backing memory using a custom filesystem. This requires the ability to
> initialize anonymous inode using security_inode_init_security_anon().
>
> As guest_memfd currently resides in the KVM module, we need to export thi=
s
> symbol for use outside the core kernel. In the future, guest_memfd might =
be
> moved to core-mm, at which point the symbols no longer would have to be
> exported. When/if that happens is still unclear.

Can you help me understand the timing just a bit more ... do you
expect the move to the core MM code to happen during the lifetime of
this patchset, or is it just some hand-wavy "future date"?  No worries
either way, just trying to understand things a bit better.

> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>  security/security.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/security/security.c b/security/security.c
> index fb57e8fddd91..097283bb06a5 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -1877,6 +1877,7 @@ int security_inode_init_security_anon(struct inode =
*inode,
>         return call_int_hook(inode_init_security_anon, inode, name,
>                              context_inode);
>  }
> +EXPORT_SYMBOL(security_inode_init_security_anon);
>
>  #ifdef CONFIG_SECURITY_PATH
>  /**
> --
> 2.34.1

--=20
paul-moore.com
