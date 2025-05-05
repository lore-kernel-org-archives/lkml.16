Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A114525C713
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458349; cv=none; b=MECsVZ2Vl4LhzIvTHVlO770nUsrlaa65ljVqs7Tk4KrKP3jtONZmPfqdrxQOqAn12W8u3Z0bPq4afiQPl2RqYlkS7MQ+Bci1LOpPhmSVeQ3DftQnlSTs8VZqyKKas+CJ7plvgptVAw5ge1wyBepPNtIv/ytdlBWGgr1k0mI2hhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458349; c=relaxed/simple;
	bh=+C4HEmdITuUGP/+x2wrm5JhWH0ePgc9iJOzWYp5fFb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuBP41KNTrqmt6cZbVRL69op6rdHbRM8tkGNgmIiAuMGuGXNMaJ/aGlMWHclyTPIueWS0p78l/OLhQMxZsJwutGsTOEB0J4KbPUfVqR/6033TrtQNNRGT4f3H8qugxHEg0l3qd710ZTEdAx+Bzcmmn1AiXt1OxrqXVX4NHw2xzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BCKtl2hF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BCKtl2hF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3031354f134so3594035a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746458345; x=1747063145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DM6ekzaJnzk6tVkn2J+PN9IdxXFbL3ggBbP0zm0Nno=;
        b=BCKtl2hFGhbM7C+lP6bgowilS8AIXjWDS8YZnJxBpBAFkIbjGtICwYMx55E/yo/bhv
         jT+dzeMYkk/k3qUVYa1zSpKMJE6lGekG7vDUaQCHES+mEenOiBUdIojCDi2YYaBVOs4V
         GNubk4b1mYDaORSUt9AXg/hngFkw2e0tIJQ2KOGaqpC0oSSS1g9Qfsm75+yW2SxBXBrx
         VLFVry/4t0ugdfrE1vsdr2gpMVMnUN6ZsKeCHzYgpx6vZwriwPhDoPrfw/ueTNK3WNBX
         SqQGxKRkOuLqrkw4zMGvvzYG2BSrg/TmMnJ7wGIglhzCZjTW11cwmd3WWl7G6SIYYXVH
         JaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458345; x=1747063145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DM6ekzaJnzk6tVkn2J+PN9IdxXFbL3ggBbP0zm0Nno=;
        b=AzniJbYp+wQAOvInwNKRqd5AOKJLoPNaRSaAZSCsYpUa2qxff68BfglyZFkRsto2Sq
         XhCkSUiFlqPj1rUfr01kwxQS+MLP97BcQYS2OldGlYHBbGgAS0EPCHceHd+k1qZa8x+Y
         EzvVMj9zZ6by8XOJhVgT0aYcyyO/YMr29uoI8Zt6WlXIxUDqA3baFqZ7YAR8Tk5287S3
         2k5sHciAvgmXMIXdSJxj/Ea5h2tKlm5hcN+36FaocCE9hd6Kr452uUgMu28OUnGfaNnU
         lJXbK4KtQ+cad2ZW4HdYyFXoUyjQWcBNa0dfBzyOCKj8TMDd6uxVZIep5GFl/UGT9kEK
         lQvg==
X-Forwarded-Encrypted: i=1; AJvYcCXNaXs1jhJ5Z+zvuGQCd6jRH7Y30wLz2zASUCUYiUvUBxprpjZ04rW/KMLSQp7qboSDFVhml59fvTUsbQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0KQVXOBKSzKOXL/D9rhK+eCNw9ATU4ahUGCNI0N1HvrWkXD2
	g/nA2wY2YMTc64yLLyI8RZzae9s72/pGg+DqMNXQgRPnrfT5+g2Q8yRxEpVO6AdEIQ+l/JgbkdO
	+6nVTEzOpdShWMRseYTcHF5ArKjDkQ5UqYH8P0Tc76uf37AX5uu9AQVk=
X-Gm-Gg: ASbGncuEiMcVPU4NFPB/PtKnjDlVo5vp4PJSQoylO3CPFMzjhT/r8A91Hhbp5oP7pwj
	LcUpoJO4wzjmu3e/ZKdzZ2HL/+p9FbcFS9D1KRSXNowE9Mdl3ajdhqsWwUogEKX8+ffxo9uDT6Z
	CGbRyb58hvQ0j8m2h1e4qTOA==
X-Google-Smtp-Source: AGHT+IHJxGQcKvp4BGCrIv0PTbLxClo/2TOhs1WdeLcN5/hfK3RPGTJuesrjW+TqYk66KCgQazH5xIgYqsPzXxf8JBQ=
X-Received: by 2002:a17:90b:1d4c:b0:2fc:ec7c:d371 with SMTP id
 98e67ed59e1d1-30a6196ed10mr10316794a91.3.1746458344656; Mon, 05 May 2025
 08:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505141238.4179623-1-aik@amd.com> <20250505141238.4179623-4-aik@amd.com>
In-Reply-To: <20250505141238.4179623-4-aik@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 5 May 2025 08:18:52 -0700
X-Gm-Features: ATxdqUEtUacupSajXmK7sEKu0bpyTAHVhIcu-PRYjFfp6AhuYy9PRcL2B89NPgs
Message-ID: <CAAH4kHbcTeZfeJ=UhzsXxsaT=txiZN8wfbzxKdhXhdmHFGP-LA@mail.gmail.com>
Subject: Re: [PATCH 3/4] x86/sev: Document requirement for linear mapping of
 Guest Request buffers
To: Alexey Kardashevskiy <aik@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 7:14=E2=80=AFAM Alexey Kardashevskiy <aik@amd.com> w=
rote:
>
> The Guest Request supports 3 types of messages now, the largest is
> the extended variant of MSG_REPORT_REQ: sizeof(snp_ext_report_req)=3D=3D1=
12.
> These used to be allocated on stack and then moved to the SNP guest
> platform device (snp_guest_dev) for the reason explained in
>
> commit db10cb9b5746 ("virt: sevguest: Fix passing a stack buffer as
> a scatterlist target"):
>
> aesgcm_encrypt() and aesgcm_decrypt() are used for guest messages and
> might potentially use a crypto accelerator which requires DMA buffers
> to be in the linear mapping.
>
> Add a comment, pr_warn() and return -EINVAL when the buffers are not
> in linear mapping.
>
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>

Reviewed-by: Dionna Glaze <dionnaglaze@google.com>

> ---
> Changes:
> v4:
> * ditched BUG_ON and ifdef
> ---
>  arch/x86/coco/sev/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index 818ae7b1694b..0b714df62445 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -1941,6 +1941,16 @@ int snp_send_guest_request(struct snp_msg_desc *md=
esc, struct snp_guest_req *req
>         u64 seqno;
>         int rc;
>
> +       /*
> +        * enc_payload() calling aesgcm_encrypt() can potentially offload=
 to HW
> +        * which involves DMA so the data to encrypt in the SG list has t=
o be
> +        * in linear mapping.
> +        */

The grammar here is a bit off. Would recommend

+       /*
+        * enc_payload() calls aesgcm_encrypt(), which can potentially
offload to HW.
+        * The offload's DMA SG list of data to encrypt has to be in
linear mapping.
+        */



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
