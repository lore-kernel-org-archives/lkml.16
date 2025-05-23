Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C23213235
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747971817; cv=none; b=nVCBb5v/Br1+SgOq2TYoBok8YhLlcWJ1uzKtnW/y9Vusm9PwSiAPa/j9T3Gz3p8bFqHk4LMNgYG5l0NAXRzH0FAoNyIrYBlrO1GSaFhkN1qJNYRnmVDlSQJnf2vxAKekrOON0wn1DTSVd/iqryMo0qX7yy/8SG8WqRROc8KQio0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747971817; c=relaxed/simple;
	bh=HrlWj+7xjE+GxEjW2W381e1FRH0QZe7LDhNlyqrk0CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfMm2if+Ju+gVsdmk5RnokKG7tu8BVxJDeOXseGsJ0ONyO8bEV6Rl5t3fuEH2qINAbN4HKtmvwT+9ktldjLKgGwI71J/tolgYpaUuzwapK9DBsvGkMw58q82uBRjHbGlWmlN4zthKI2G39lGKHWQ7u1pa6as1PtmA1ixEcYzm8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=U0m0ZwOA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="U0m0ZwOA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2320d06b728so48512685ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747971815; x=1748576615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J05dvsnqUxHvTInzLD4bICl0NDkAyj3stBB+zRj5LSA=;
        b=U0m0ZwOATm4UGzoruj1RqRQwGmevtSJFGpgYuLgVtWtM8ZHDbCHiBEH8riKZkgRcDV
         0GB41KGoDA6aaftvOQErwWmSQps+aPeUfDOGEkOg02jRxI4zOkX5km0O3FCf1YVaMTTK
         ZnVqz7cwJfJTp0X9L51SQFczkIGT6nXTRT2G+i0/JfpF2C9ZNmTGUvMszqju4ldKuM7/
         R5uOCSjw1QbQMi6/RU/LOTSFrKRw7ptGp/04t9qc2fNx1AX3N2Sz1jcTO/o7ive0wPn6
         +mFB2X4ePXj4Nl1H3NMaUYcvOTcU5ct5XA/ku53fKf38Fn5YjKFlqiiMn+BtLkT5NAQk
         K2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747971815; x=1748576615;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J05dvsnqUxHvTInzLD4bICl0NDkAyj3stBB+zRj5LSA=;
        b=pMOmPLkXr247WQqLaA+yvuyw1LIW0XqyT0STyaornDvdFVkgtkXBgfXDpB8kY4szbn
         Uod7CwLY5fQpHEsqjr+vlvLj4PeMdNloZRwxtiCYN1KydJxcOK7VYAc+J4JkC0tMZLoJ
         VFDtkDyqaivbT0St47QJ6Znj3LpYzhSLjlrXfXEn8H6cRAfn4p7zZ7XQQoJ3b5trj0t9
         UdY5Rw1D4gXK/Pt/KF899FGp8E3fXJfeTt24yTX5axSHa/67+NbdaeziDthQ397HdtFU
         MGlDbQ4W0+OAUNJYwmmO3xpi2RoAUgT+yig0yD6e1+G02t6KzCZVQCQup5TPIM9/zFy4
         IN+w==
X-Forwarded-Encrypted: i=1; AJvYcCXnEfJsWPtmhJyYe2obGDvg3TFmmIeYpMCYHTY2qDJ9bc+ciV64lqLAKivw/yMmjm5zqj7W/CnwbW7OiPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbrIpGMNjsZ86HSxALSqlzZ1QYutg6I/XuNJpg6ijOJHJUOSda
	icMh5LaS5ei7XbTAJK5xKj6eoxzmv/Ft/6C43b5r673MT1CEEY2vSreeOSwB3tRoENQ=
X-Gm-Gg: ASbGncv2N6KIye4cvJqoUnCqH+XvyErPX51veZZeJ2bHLxSsuKqCL3x1lRQCqRsER8K
	4eGJHIt8DQa2m7BOf1zkZU8oY3Jlcle087cxcJBUt/ScY2drc9CF1dxIWJB2rqQgzivr60HM08r
	+D44W1k3d+nPDiZGtKWyrbyOPGrt5HVbyHrPoSyZNO+TeyC9q0lB0hRi7s9MvQRgOoIRXsiK5ux
	g11YcxoMWPHQNYfXpN8/dPP7eUr6GsA8Nu8S/Q6C5zMSRpLlrs4M0LLeyZLJxnOGB07QgoIMql1
	5nkmUftZULNK536hNt/g35IcqP5AvKZa3FLX8qnRSA17OZxXMW79mZdW+AHjTj3WT9Ce8Og8ILW
	yyBCEzE1rIw==
X-Google-Smtp-Source: AGHT+IFJUa2ZA4G+IYco+Be+FUJVLivd3f5/OkH9AHpXW8S/SRBQ8SwylmKbpKD7GepKWMTvQ7YN5g==
X-Received: by 2002:a17:902:c951:b0:220:c911:3f60 with SMTP id d9443c01a7336-231d454eb37mr342440245ad.47.1747971815006;
        Thu, 22 May 2025 20:43:35 -0700 (PDT)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac948asm115132435ad.22.2025.05.22.20.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 20:43:34 -0700 (PDT)
Message-ID: <0cdf967f-9606-4d12-9ea3-140f9bffe516@bytedance.com>
Date: Fri, 23 May 2025 11:43:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmu_notifiers: remove leftover stub macros
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
References: <20250523-mmu-notifier-cleanup-unused-v1-1-cc1f47ebec33@google.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250523-mmu-notifier-cleanup-unused-v1-1-cc1f47ebec33@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/23/25 6:30 AM, Jann Horn wrote:
> Commit ec8832d007cb ("mmu_notifiers: don't invalidate secondary TLBs as
> part of mmu_notifier_invalidate_range_end()") removed the main definitions
> of {ptep,pmdp_huge,pudp_huge}_clear_flush_notify; just their
> !CONFIG_MMU_NOTIFIER stubs are left behind, remove them.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>   include/linux/mmu_notifier.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
> index bc2402a45741..d1094c2d5fb6 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -654,9 +654,6 @@ static inline void mmu_notifier_subscriptions_destroy(struct mm_struct *mm)
>   #define pmdp_clear_flush_young_notify pmdp_clear_flush_young
>   #define ptep_clear_young_notify ptep_test_and_clear_young
>   #define pmdp_clear_young_notify pmdp_test_and_clear_young
> -#define	ptep_clear_flush_notify ptep_clear_flush
> -#define pmdp_huge_clear_flush_notify pmdp_huge_clear_flush
> -#define pudp_huge_clear_flush_notify pudp_huge_clear_flush

Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks!

>   
>   static inline void mmu_notifier_synchronize(void)
>   {
> 
> ---
> base-commit: e85dea591fbf900330c796579314bfb7cc399d31
> change-id: 20250523-mmu-notifier-cleanup-unused-238762302a66
> 

