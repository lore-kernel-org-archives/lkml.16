Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB553238D56
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939818; cv=none; b=GkZvHLpR0GEU2bmJvVyrpzx2h/j68ZL8+XLABwf3fnPWyICPFoejdtG1m71pdXVoeoZ3NfikERD5Q/LWCVjFb8hlRkKTsNEGoEL2MtMRXi2SyeGONpK0NFz4l84Ejjv1ive3/5QPiAGfyIa/5O8oTwVoa7VDJm/AyxbFrUI7epE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939818; c=relaxed/simple;
	bh=VnYHwj/oQP6GF/XwgeRtTf5A5aUJOwwkPiVT8jBKEC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UwjKDVciYSNItOnN2aSi0VmAqfvd/HBbtFVGI0tp+XSPzAFi5cg7xjkLDeuIrpQrTeCO/i94nLf3vZxusRyoVylowPADUxFj7jT1j6h166/L3M5BGbeIfa7d5Xwd1IBjx9Bv5o9KPOKc+yk4RuJzaxxtP7S+ECRlsBt6gCxV2c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZYLwAir; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZYLwAir"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4679b5c66d0so247311cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738939816; x=1739544616; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NRKA4B0QRywDECdhm0qngkV9qa48DT0PdcDzDfPKBaE=;
        b=SZYLwAirXu4nBCt+odAPHxPt/FAZ9brPG3JKtPwhW9BDssiDlTkWTJKT70XQJ/FUDq
         KqbKomQFdr34515a/RihgMttU/mYUAE6cJQGd2/SBnYuqpqx1iZlmX5icpkqz7ZMoA+b
         BaDvNi6JGEdiHMiajXy63z5qZcz6me08SZFWrbILl8AABKVLzBKck/Y/spaEIiKHBvNa
         pWRy/NySXl6gQPGwcMuqlfCkwDIoULRsStLy+eaSzqaYW9hkM0Wclk5N3EjeEYBVR6AH
         cT1UCN8uZwx47akhHTyQOVTIH6/e2afEOBNJ6zpZIyUjCtsuo2027noMgHZXCynFHdxj
         bhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738939816; x=1739544616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRKA4B0QRywDECdhm0qngkV9qa48DT0PdcDzDfPKBaE=;
        b=BvbZ047D5zz9TwJ8Albhw92a8obafsFc1WOtVfrTh6OlZWpwSSLkwImP9W3VvipPNh
         8v458akTxOnHO6DSL2T12iDDgATlTwyCv3052kibDM5wTWykAMKKnKVMAYc3Dy3ce7xU
         eYuEY28Ed/pH5/eV4PENgt0lakPmC7EPwVDDRGmK8YDWxU5Fn8BxrqysjDioWhS9YFrH
         FFlAR7sw8HZR9Qpogd1xatM2QKKWUAnrEOplJfsTayRXdX/Yg7PKvoZeoWvsKxppQck+
         uPGyp2SACNhiNVF286ZSrEj43CVjYOWgY6sZ/4SPR4zPuQJLo+dT66X2a5TR4GbXterK
         BovQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3+BGn7kTZ1ugaOIp8rHuRA80jR+lKb9hSq9EYSUdd2+fiE8xWbuElQqL5czgdVjjIYpneqx07L38jAOM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpzeof/9/ZQadzyuNjLWbAnSQUTf3Iu2+Eon7KcvJ6v2AkKcn6
	PNDlgLv4jhg0vSxUcv05UhXYDNCduaqVrUdb3wF50SBARXDNO7oxz/eKr55GiuvdzqpOozP5kGZ
	v2xeDOnfq6dALfpggn8uNrx2oiONcIZrGT8TG
X-Gm-Gg: ASbGncst7JxjQ4cbSW2JWq77dN6D6qT0KxdfJBEYsPr5omEC6Y7KCUOxc00sDGxdiTy
	eI0ppTVmOp8Fjm1qaMUCqi0xupPjoZwuRnBLIJ/iJo9og7JiH8YA//A117O6ncdTg4bQFdojycQ
	eWNVyWd2PW6NdWU6lnE4e056RMQaM=
X-Google-Smtp-Source: AGHT+IEAEEFNWNC3YMS7vHR/Vyhhb/JRh9NfR76IzHXO0WhPYtv2TQGy1e9f08A2ZgjFJyV5vQBOkp3X9qqEndoNfto=
X-Received: by 2002:a05:622a:1116:b0:466:975f:b219 with SMTP id
 d75a77b69052e-4716848912dmr3745331cf.8.1738939813598; Fri, 07 Feb 2025
 06:50:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-4-riel@surriel.com>
In-Reply-To: <20250206044346.3810242-4-riel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 7 Feb 2025 15:50:02 +0100
X-Gm-Features: AWEUYZkO4iB2Buw9lBqK7vSPHHLWafRCrJ_epfjdTjiqPQZ0YV42rJSUamkNClA
Message-ID: <CA+i-1C2+Pva55qPEHHS9vc83_vmGJaUzUTPmoE2M3_qvCpcsUQ@mail.gmail.com>
Subject: Re: [PATCH v9 03/12] x86/mm: consolidate full flush threshold decision
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Dave Hansen <dave.hansen@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 05:45, Rik van Riel <riel@surriel.com> wrote:
> @@ -1276,7 +1282,7 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>
>         int cpu = get_cpu();
>
> -       info = get_flush_tlb_info(NULL, 0, TLB_FLUSH_ALL, 0, false,
> +       info = get_flush_tlb_info(NULL, 0, TLB_FLUSH_ALL, PAGE_SHIFT, false,
>                                   TLB_GENERATION_INVALID);

[Why] do we need this change? If it's necessary here, why isn't it
needed everywhere else that does TLB_FLUSH_ALL too, like
flush_tlb_mm()?
