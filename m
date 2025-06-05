Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE01E89C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109201; cv=none; b=dV0NpG6Pw0F7KIsqs8aRnESbqJHzFlmQZFUMfupbV+TuTlfrnsPNckvTljC1k2LHUIRs7Q+oBd2vGHI0jEs+e+fboYxUoLiiXtJMnuL8lin6U+xwgBZDS3YSFsfmdXd5bAkGudxjIM5j6diGvJN0Od8UPP7eteWdUFtTB3uQ7L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109201; c=relaxed/simple;
	bh=ZMhcDJc33g3oL+y9ofuMcrNv+hRswck80lo3H20nR30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBITVCelTRrrH/OExMEl0emODSgazU+tuyEmLHSvjBiWBrhFDlvtxBut91gUDwKPM5AkE3CkaR5qA90oP4FLDEarVFoeMgn/xfiBjiN305PgpXf1vve0Pr4TFIiTtpTlbYFGiHTCiS1NGtemNKzK6QrVTX7CpKHC6E9YYXdeTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iHCCdEwt; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iHCCdEwt"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso675120b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749109198; x=1749713998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZIrQOTa/wSy9a4xpfBaJEawiyRe/C5BRLMFLu7DmEc=;
        b=iHCCdEwtibXNr7lUiw8Q7l//4vuA9wz/xBXP3Ar/SYyiy0fmOS5GphumUazGSt6xDm
         YPpUY/NkCjMhpZlm6xqOaXBT1hccrBFn47TLz85EPp3dGqhZPllXrIPLDWvtq9YcHd7k
         q6widyb6Rxzv+Hz/D5gL+dYIjqiuPrA28BqPvOE2CpV6vFAzTAIB0VXDj1ciumzspNmy
         SNq270CfqJhqkrEVpo5bF27dI1Ijm1FQ9WmAJTLC3dwmdivZz5xP0Yx7EpTbWX5EzTTd
         qvnbL4QXGMTNTJdZdw8z3arBXyXTSQajQJffgrlh0XYr1JOxq6uKyTrNs6fjgKcwp2lp
         K0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749109198; x=1749713998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZIrQOTa/wSy9a4xpfBaJEawiyRe/C5BRLMFLu7DmEc=;
        b=ek8e4lR5UebV4tBV7gB/N3zprtO5itAY604F6JCB8VN1xgEuhqqWBhra5bf2UeQXBI
         SjRtjf0At6J0zSexqAZvW/XUjufdT+fKGRCX/zgVS5ZdeH6qu4qRlc3CSlBlGGh3T8DX
         0LJM/j2S5U9We2nv6q+FvRM6f7iNzeVJB4xg7NKRLhB1dPE5sAQehHGqpKcWA2UVakiX
         juq4Io6wz/mF6cOi5PQ7q1XZMDrC28tHhlK2op7qBK9pG1ZGX0Lz8HKUvDE4xHgWwcoJ
         Z5+egoWFN+2S6ihDMxf8ZdNBpg33i/n5llAJrxSgxIF5HH5AY92jG7HCr6BlVtKUnv/V
         ii4w==
X-Forwarded-Encrypted: i=1; AJvYcCUolkhks/bJs/0rFww8iP1WuQqm454T2857kAlZJBwlS415v+EAqOne2AgfGL5J0pSeFWEnhjBCGFIOlms=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/NNySxarFTWP/o8YL61Zo8maEstTfS2fhCkfacrCiP5k0HqVC
	tnrGp/fouofBXBnAZR1vBuk5O+Zr0hUN60+DR8f8Qynjyxdccg8EzjdkVyE2w6DCxUJQZiJZ4Sq
	8Khtgw3I=
X-Gm-Gg: ASbGncs42NpCe1iIlcz+Kt1Nybu88kQWjQ+UIYvoKSPLr7VVkStkRCWvnaKXprVZFAP
	0mPCnWvwfJ8Q+Xcwmp/RpmYGrRqjWGSd1yySTbILHVLL1Qy6zqd+a5onxfNSBWwbdfkvfh+hSTh
	LaCy6xWjnMkxyHw4T67Jf8PlU5AYbD9x+Y51Aaoct6I6TM9oFC38cPqNk35a0uUWQ9roYVevYTE
	t7CPEf1a7SeMM+cCJUPbYeFJ/3QBo/XKOLQKmZpl7Ec243CVqJHuyr1ReWDNH1gKa/wfO4xx3We
	8qNMSsLqc4xCRj/MRCxuI1qebULzDVx1tjh9r8kKxDX0xMJkDq1152PinmyqCrR9RSrDJD1el7D
	qZII=
X-Google-Smtp-Source: AGHT+IE/Es6S0H+BL0r6JFnYM8UmDvdK7Sva5xq12q4WAUEBp/Agtr5apkK7ggUpBDLFNTqn2tqgcA==
X-Received: by 2002:a05:6a21:60c1:b0:1f5:7ba7:69d8 with SMTP id adf61e73a8af0-21d22ab40bemr8127126637.15.1749109197834;
        Thu, 05 Jun 2025 00:39:57 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafb01sm12705111b3a.104.2025.06.05.00.39.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Jun 2025 00:39:57 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: akpm@linux-foundation.org,
	dev.jain@arm.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	peterx@redhat.com,
	lizhe.67@bytedance.com
Subject: Re: [PATCH v3] gup: optimize longterm pin_user_pages() for large folio
Date: Thu,  5 Jun 2025 15:39:50 +0800
Message-ID: <20250605073950.1834-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250605033430.83142-1-lizhe.67@bytedance.com>
References: <20250605033430.83142-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu,  5 Jun 2025 11:34:30 +0800, lizhe.67@bytedance.com wrote:

> @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
>  		struct list_head *movable_folio_list,
>  		struct pages_or_folios *pofs)
>  {
> -	struct folio *prev_folio = NULL;
>  	bool drain_allow = true;
> -	unsigned long i;
> -
> -	for (i = 0; i < pofs->nr_entries; i++) {
> -		struct folio *folio = pofs_get_folio(pofs, i);
> +	struct folio *folio;
> +	long i = 0;
>  
> -		if (folio == prev_folio)
> -			continue;
> -		prev_folio = folio;
> +	for (folio = pofs_get_folio(pofs, i); folio;
> +			folio = pofs_next_folio(folio, pofs, &i)) {

Hi David, I used three tabs for indentation here, but it doesn't seem to be
the effect you wanted. Did you mean that the indentation could be achieved
through tags and spaces, so that the folio on this line would be positioned
directly below the folio on the previous line, but offset to the right by
one space?

Thanks,
Zhe
