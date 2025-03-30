Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D39820E6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743373201; cv=none; b=nySiTk8PTrB4WQCPuquY6qGlyIQwMRiG3S+bQ5lSrPpdxMnuwQuiCFI0APFOX3YiLQ7z2zrFOHzVsaxUKDYL4DFcOM9hOOXKazRvTDXVyIZgSaLwpHkybpytRNqwnbwOgtXHIucIRhZ8LJX1tS1g4YMAgZ5rrF/q5fV3Vffw0sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743373201; c=relaxed/simple;
	bh=d3Hh5+8o+LqZ5YZ/DWooR8tHi8vlLIrQ/xoPmvrdoPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCmYHxMlab5ePpFbex5YqJfCdE7vHfr4me0dc6YSW2FVNFDevfXShWLhjmXDnSIF2fakMdXLlRK4Bly0HDc0zxl2dKBR+7kU+p/yBlZlAYMPd/W9cgUb0N8Wr3C2x5C9fmfT1DCuLmhQJh2bsUStTPdt+WQ961po4RF23tDMS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZDS0bSEr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZDS0bSEr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso696594366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743373198; x=1743977998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NRYNq/CwJhWYwy5Oz5r9LCWDNQKlE4ZCFzsFqqIyVwk=;
        b=ZDS0bSErpEAqrlRFaASc0bjzwAjxKFxEncZ5ekklGGDKgXtQVhHn/g1V32lY1Cr0Lo
         wnCGPM+LQ694ckH7Ka8GOT4EIe7/xpNzKCeRNpor0Cm+qm1Ioo8Kv1ZEQRw8WMOcmwxs
         kMhUE/RerGaGLPCPh8T1NWlEdcLBcxPNXkE24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743373198; x=1743977998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRYNq/CwJhWYwy5Oz5r9LCWDNQKlE4ZCFzsFqqIyVwk=;
        b=ht6kpkpKX/LQq/jbcWT7O1TNPhl9kx3fH3t62wzB0owZsC1TRHBABFbB76dmZ1+ADq
         6TMIRk2aY/sh22sQ8COSaSlcs/AEQcmTAIJqsYzHDKzlmuGS5gyPrBByntpSZ8x3XpN/
         qneeUR9AOqiA+hOikLmnNTpkxD7Hc3jTcJWcx+IIIf9grZpAcICamI6uLf828H1gcLjK
         BQXLJIMM85B89q7zCR5CG8vMYuXiRGl42DbRRYt2alp6oekBmr0lcDCY9VYPUt/unFp5
         y9S1XkqezSZ/hZ1Edjy5BYaPdNhiJ5zg8IlLdq/jCqEyOFoBv4bfO8WqvzpjJ+KQ8yoH
         ZsGw==
X-Forwarded-Encrypted: i=1; AJvYcCWj5IWz/k0hDgUKhBQiXDh2T8xAgYR2AWlsgOjct6EoAs3WRX3O8gpP2U08cPKGKGUtrm0FmfQywnu3AOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8B21Vx0OKU5h+KGcyxibUdHQy+fCVfOWhSQif0XT3tB9n27Lh
	IIzVhppYDwq6IcFwaIhrJsx7VLJyHYi2wLPEG3tklcr9k3PJ5yn+KkQmLlaSsf7roaUtbHxgf/7
	C+BA=
X-Gm-Gg: ASbGncvzlk8/06qEHwwg+DR60Eeh2uZdvm236BcsDwfw153wSjwDr54lLtvBGkesyCP
	KMubpPW5T7CKhO+clpJaaIorz5vgDDkpS8X56gAcREB+uyAxLmZVyPb+svchjWMU3YEiwNf7JaR
	apxFpiLKsNyXZXXRlbLKs20p7Pysw4vJ5J3ygp0mZUYY0SbZSekMNkQMsjk+iJmZIp6N030XszK
	ljv7gbUWoER9irO9wGp76a+vQx3uZW3f6AVy6XwhjAMZOLZ2/SAwL7fnp/Wfh7oxvnlZB6nNbKW
	hYZ43Z9YpSLIirHohG/tCM5DRWNRyVnASiaZSTGfL49T+HZJLD5CXRYdcHGhRuIkijshSjYb0Fq
	riNXMLPBGwkVCnBF/D2A=
X-Google-Smtp-Source: AGHT+IG3R4XkCLLRJcf6NzHO0pqKRMmoE9vUQuqrbrSvU8C7EtqvkxkV6YdtC3cLmedLfL5gYl8q/g==
X-Received: by 2002:a17:907:1c17:b0:ac1:17fe:c74f with SMTP id a640c23a62f3a-ac736972007mr562861866b.21.1743373197716;
        Sun, 30 Mar 2025 15:19:57 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196f7a6csm532777966b.176.2025.03.30.15.19.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 15:19:56 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2aeada833so743785966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgUuGkc1Mz1ClzgJO15JCV1jqX/jTpOIJjUpZafTHuwcfBtKXg8aOk9n5QEbjX7/dZf267hQ0PZeBBnXA=@vger.kernel.org
X-Received: by 2002:a17:907:8687:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-ac736457e2dmr784375266b.0.1743373196498; Sun, 30 Mar 2025
 15:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-cSQXJKMyBSfAAc@gmail.com> <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
In-Reply-To: <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 30 Mar 2025 15:19:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqLm+eTuyLR_84vWOZK+AkhV==r=PcuAt3+3nf68SjOw@mail.gmail.com>
X-Gm-Features: AQ5f1JpyLxUomzdWRmvoW-CrUH7vUZ4bGC-MqEtx8tAyYe1YhoqimHhQqYl7nCE
Message-ID: <CAHk-=wjqLm+eTuyLR_84vWOZK+AkhV==r=PcuAt3+3nf68SjOw@mail.gmail.com>
Subject: Re: [GIT PULL] objtool fixes and updates
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 29 Mar 2025 at 08:33, Borislav Petkov <bp@alien8.de> wrote:
>
> Btw, test bot complains:
>
> https://lore.kernel.org/r/202503292202.Sge7ZEUc-lkp@intel.com

That's not a very helpful error message, but I've dropped this pull
request for now. Ingo?

             Linus
