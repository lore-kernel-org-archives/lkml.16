Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E82153F4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446755; cv=none; b=t7lZqgbxVfr4RTUPrrV9C7/nRCiupQvXG+0HKoa4rF6MN6sbBbEjE1gHZAIPPbLHssiM2JfDEs7mnwO8VtB0tMDoPp3wALvCHaBEdFoPZf0Axmvq5vn60yjPd4RVg975DrACxGIKQhF9YBmMlYwbfjDbH3DbqNehlY/NhdAx4y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446755; c=relaxed/simple;
	bh=2onu6gsfs4QQaq1W/LZLqhxLgPWY+XNs6PFwdlu07g0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqzBul0g8Ml+gkxuXXFmBWtFgouJcYEUbDeUuDN0hUt+bn6Z/1lw0gHGAYcmTM8++wbmgqG4NFwMLf6uwqL9DOvMN13PVuQLI2J/w7rjXd40GENdtQ4KGUSpiwl5Fl3MSU3IDAoAASiF7jpjyJ/RVdHr/yhdrFTtoCo58kI7jlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=iPz2rnmU; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="iPz2rnmU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47692b9d059so72386391cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746446752; x=1747051552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2onu6gsfs4QQaq1W/LZLqhxLgPWY+XNs6PFwdlu07g0=;
        b=iPz2rnmUJvFiNUG+ajbZXRDVC24D/hTKdNqYMtnseIGNXA134hfaoDbaUamTZQzscc
         +GpP7tjPVGdfRsIbmeyrw2uF6gBb2egZ2oUw30wFtrUfs2ERx4wJutnAApQ0W4ofWuFE
         xSsfRjQM8cV/6hUpzBxT/l5OV/EQUxiB9R+jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446752; x=1747051552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2onu6gsfs4QQaq1W/LZLqhxLgPWY+XNs6PFwdlu07g0=;
        b=qI3ZooKvpkIQEhuG2dwZIam6BATtLR4XPBeA6gyvyFiKsASnmy9jz/yjSKTMcuBY3o
         Oec96KGLfkcKtfTlg8fIv39b1Xg7ZK+JkV/LpUbJJAYNoWpErTBta2bEbHPF4QmSAT1y
         4+DDhpWkOQsdoObUbmgk/TuPjgeQmd9KmDOiXwcoLQOxAWD7n/D7qlYXrEHAGeYI41po
         dml1dnB281FVuNMWrHbOd/s40QjOaNNu1LjWGHRMq71fQRIQEw09qLVp0PU5KJZ9DbmA
         5BG90cZEM63fLZye5VoKQe/hTAS7FJpYA4NsdiqRrsrP6QJv/32+8zrep2DfAJC1sWiS
         1g6g==
X-Forwarded-Encrypted: i=1; AJvYcCXtuPG8PY6ta36iRZ6XQakWg36WJPr4TmHl+QZArgQNXe7A+ztgJMnY2B4tQ+JELUJtnz5wFPItu9Nti0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFILBAyHPALs15JpdUtFhG2FkiatMmGZ7fvLPsZccSDvNkTnI
	ZMdTiFIyLOUougAbktXWaj4Mwl6RJYrKDZaqRL7EIhwE1NdXEe04aQqtCsn0H/68xeV2pncKx0u
	H34ZkQtg1P61Jx8OlT17rc1hSvbaVpkGhBeql3A==
X-Gm-Gg: ASbGncvc58jxf0xPW/sBRQgtXfptxm+fsHThJsmUo2nKW830T1igS8hapW00ChWVgfO
	pMg0aI7yw3VVEFP7JhtrKMr7tllwavp4m837FiluqEOlthWHakSHBiTZLADAN1nRXJFJ5Lq2Wty
	jWBfg650WK9gm1xifTVgMYkLM=
X-Google-Smtp-Source: AGHT+IEHJPcEs1RPW2aEQi55HmhgTwlyBMgYbKyIMlMDf/ENtqQcDSZCaL6MGqGQYray0QIGAgUsBRrcOhi3EX9G95c=
X-Received: by 2002:a05:6214:1d06:b0:6e6:6598:84c1 with SMTP id
 6a1803df08f44-6f528d2695emr139944846d6.42.1746446752343; Mon, 05 May 2025
 05:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503115244.342674-2-thorsten.blum@linux.dev>
In-Reply-To: <20250503115244.342674-2-thorsten.blum@linux.dev>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 5 May 2025 14:05:41 +0200
X-Gm-Features: ATxdqUEgKEFlHq2pyuRofDEm_ZD8YB3C6gp8XZqeTG-k6l1wVJuECpo1CCKNoEs
Message-ID: <CAJfpegt_bqvg9LahDodsjNPTjcFV8a=Kfr1hwvjWPjbwjKdAdg@mail.gmail.com>
Subject: Re: [PATCH v2] ovl: Replace offsetof() with struct_size() in ovl_stack_free()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 May 2025 at 13:53, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> Compared to offsetof(), struct_size() provides additional compile-time
> checks for structs with flexible arrays (e.g., __must_be_array()).
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied, thanks.

Miklos
