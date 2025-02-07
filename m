Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD01238D2A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941065; cv=none; b=tTTP8wJp6qKxa1Tw5szY0FYyBYiikHmMe5z21DYFXTJKNdOxeSL2Y6jfozZRj/PpGQsOSH+5iRzHWrHqcT5UcDwxHXifob09BtIKkmgEapBgrZSJlgiqc5+VYI3c/88GjSDgeH+sRScWY6MemSnZ2jCyI7cYDbOI5BBnE6FtyWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941065; c=relaxed/simple;
	bh=Ycg0I/IGH8EdGqoRvfBDsJwusK5/zPucQSLakORXxFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6MPdvjMuwjZ19qTZdAwJDpMZ9xAySg0n03zX2B/Mx51oQXD345YNXZYwg3vwwsjjnXAUWOVYoA1FFB/Df1Hha0P8OtxDzO94jqGfRXIw4jg1wTLSw33y/8P9DRzp+pFBCtFLxOuN9gOAK3nAKpgS5QDnWVuDuOvLc7Wxg0JHDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=07GcgjFD; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="07GcgjFD"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4679b5c66d0so255631cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738941063; x=1739545863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mOI0Xr28dC45rJb2BCYhdZJmAWpUY5gWtBmNeq91+Ak=;
        b=07GcgjFDDuELLPOFN6krVdD2YtDtrEfHEztItpTAD+r8wHvY8UDzxgLRs19Rau9VMB
         LGHCFG02Plx2DId8ztkU5xZzTGrqMLhtC+Voz5yImPGH/nxFc3mHEXYdslNzawcc5QKE
         jReRVJ4Q79QChh3PiggXCU0KbgRoJ1Ug7nNJEpGtiKNrd/9Gi1Rk63mccGDVeCGz7Gbz
         zhykqM51ioflSKRcsrx12AjHobyTMLLMR5exT/lV5kwd3rEpqLUADxfQW9ecuwHFdjTN
         X650HlQ+Z/De/ptgaGB8S2fKaP7CeRTEZ5wM5I//3pwE89xwMws1elSUxvcKw5Fvykid
         b6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738941063; x=1739545863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOI0Xr28dC45rJb2BCYhdZJmAWpUY5gWtBmNeq91+Ak=;
        b=FXfaqRe4nyigZ7lXbaRCac2Q57azNgLLWvvQTDTNsDVix9rxvOzaMn4wo4qnms4z8J
         LXULaiVqOaP3rS3M3t/vfBhRHOSESsK0OGXdmIfpMp2yRcPE02JrmxbSTwIWnrWjRmsz
         QTAhAaKuGM21SNI+SXtlus5mDhF1kqRoJNENmqbIsU9qNAHny+6QeBB3rupAk3p0xCif
         rupOviwBZP2Rfrg6qQVtslMYF+/k+RkoADPiic3KwX2MiomOrsUTHOZ8bcPVT6jz6dHb
         nNv/Jp/q85DwU/vAQ4SSapBJJokeoXxAVo5Ku6ob+y5+ANikuBSXCdU3OcAHCRbtUeQB
         PSFg==
X-Forwarded-Encrypted: i=1; AJvYcCVPVE0RokyZtSw2FI2yet8xJ6hD7luhtvgez4b5i4/E6tyw5xlFmp9bRP9ydkov1BeaJLdonkVi0xyiDFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWdvBeqUXSYjI3ANIsozO6JMrfPAPYwepNZ2k6zhy+KB9mqWv
	vn7PZ2N/kMaGrPbqwXqvuQ+fHXHoZ5GvDeOmZINvXTBAlbNi8zAgU1zt1zt53pgSFPifGeoG3Wp
	bh7JU1Ab441wYaC4S+uYG1iGVkifxMU1auqrC
X-Gm-Gg: ASbGncsqCH5W0EVOnbdk67gAhoARCAKkN0ZdQL4/BW1C7+xsGZUDcfqZ0tceAv57h0J
	459/7PNrmYb19PkK6/7n4sUjpVZpQB3YHEsXnODw1GxBGiB1MrM8P41lmluAFWhJT4x2i+gudu2
	IfCYcZZamoypKG/ilsJWeg5KQIMRQ=
X-Google-Smtp-Source: AGHT+IF/nJGpEi9xq5E9CylW+Z8B2gDg5xgGCl6lUjy7uExSa7txt20qsNhXGypcQPbWVJbTbWF5PKZZZAvb9UVcaW4=
X-Received: by 2002:a05:622a:1890:b0:46e:1ded:e31f with SMTP id
 d75a77b69052e-47168488f6cmr3517401cf.4.1738941062862; Fri, 07 Feb 2025
 07:11:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-5-riel@surriel.com>
In-Reply-To: <20250206044346.3810242-5-riel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 7 Feb 2025 16:10:51 +0100
X-Gm-Features: AWEUYZko8Tepey1C9O-kaFhzHCNOILtT4NNbtqj2Ew_kIzYbNfBDcLDOYu8rd6o
Message-ID: <CA+i-1C2NAFTrmZBFfBf8PFaji9YxQm68pV2qc7VbgHWFTji+Xw@mail.gmail.com>
Subject: Re: [PATCH v9 04/12] x86/mm: get INVLPGB count max from CPUID
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 05:45, Rik van Riel <riel@surriel.com> wrote:
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 17b6590748c0..f9b832e971c5 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -338,6 +338,7 @@
>  #define X86_FEATURE_CLZERO             (13*32+ 0) /* "clzero" CLZERO instruction */
>  #define X86_FEATURE_IRPERF             (13*32+ 1) /* "irperf" Instructions Retired Count */
>  #define X86_FEATURE_XSAVEERPTR         (13*32+ 2) /* "xsaveerptr" Always save/restore FP error pointers */
> +#define X86_FEATURE_INVLPGB            (13*32+ 3) /* INVLPGB and TLBSYNC instruction supported. */

Why no "invlpgb" here? Seems like having this flag visible in cpuinfo
would be worthwhile.

If there's a reason to hide it maybe add a comment to explain the
reason? Sorry if this is a stupid question - I also can't see an
obvious rationale for why existing flags do or don't get a name at
runtime.
