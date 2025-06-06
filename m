Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD452868AD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201568; cv=none; b=T9qCuVUBxhOyss3gK5vU0Q3OG/Sr/EmXiIwzYPaRA0NHRM5arfe0JWtxxs5YiKrENnzwA4ek/CfDNAVjmrLuZyy/qUCPVSH/UI3Y/bKCulp4bFx1QIYKsoTpbiQ7ZtlBjQ2amEgBTNZgft9XsTtree7Nc2OGZYhrckdW1N2gOvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201568; c=relaxed/simple;
	bh=mn7SsBuw+IFREcayPweg51pYEMz25pw57qjRJyUxVkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLgBYGd7pZQibDLGpMVEQZkcDhCK7Jna4xHDcrgs07WxiDZBrIWnF7QsekGE3Rxxz+J/x5shLii/PL5RCRBsCz+/DChGlz9X83u3sWhmmtudDH3HYAZ9Yyf37mf9ZzWuMsI2sKrt6rcKm+ijOP1SMKN/o4xZLYolrdLUnXX/5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DzfI2x6c; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DzfI2x6c"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235ea292956so19258465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749201565; x=1749806365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4T5YwrzsY8niDNVwfUXVb0rsRbVKjjAOyTSSHmbqwg=;
        b=DzfI2x6cRRMpttl/qneCqd0Xw9e1TBfK7NgrXFm+frRZm+i7TcaVZwCF189Ni1+4J7
         BoDNADaULBRgnUTclJydwrxIXqxEdBTA/zUEaMYwEYexPz61UOmr1P7l+lOb7FQiXwxB
         AUU1nOKv5JRqc8efLfs4ISBC3Xh4oLACNKc53m3xe2c+WNGURDps7N6pUFpjBtED361p
         QJgWiAhsutTzBQ9GNTh64lFGAi3XinrN6I9TtcbMHCj6FvVAk0npY1T2XTeMzlI+E3Ww
         91xIO/bIUva3OvGEdO6Iv634JOUgZyzzOI++WnM8AQGPvO5lxhKvpvurjA8u3Yt4Qgb7
         KGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201565; x=1749806365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4T5YwrzsY8niDNVwfUXVb0rsRbVKjjAOyTSSHmbqwg=;
        b=cSi8VvCEY2IW5Hc21dgqDhHJwUo0sXbh+C6jyvd3puKd8LgyGrsWSkx4vakDqLa+OX
         umngMuVT7vMFrErwg4mp6hbmFUI8TSN/y5JstaxvFgqrozL0ihRpkTOJeWz3vKcGcBty
         v3YimKJfXE/Ok5lJEfPC3D5zkvLFJ+1Vvtd5Qm0BjJ4Z9OrVsv/pa9GxCRd+YNJiwkH/
         +q5YO0f29lNooBDlQ9cYxILnWWz1h4EZPCv8gDkM06R+ckXXP/xLThKNswJ9YN3tqKmZ
         r0YRuR5TBjUXhWpNV1Uqw+4MbcOrjlfYAq4goh45+Ue4dKle40j7iQ/TAePa/SxvbnFM
         IGJw==
X-Forwarded-Encrypted: i=1; AJvYcCXlAeRy9v60wBJ2vmGynk9mfQ0yUzYASgAPQLZC7XCKwyTdY/7Gbqbus2qj02azG0MjNXjUKvuYnt5DU7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLylTT+r+uAPgEXZ9HP/SpbmX0ie48RavqjG4QUJuY8fjmlxYK
	nelIi1S2qwfu+vtx2XntzoxCEaHU23tBfBLvx1JoiLgXe4uRkUtMpqjqWQDYLNYxZnE=
X-Gm-Gg: ASbGncvfdK2pDolA+WFeppC0Hy3yPMEQ9vFVug/fi8Ys3vWDAnjCmxrXHlWs0rx9JTr
	uyGHfOfLOUzFlEqZCjgvJt5Kcztmdz00KW++HntbPMKeJ9zPFmcLCgH2E6XV3VB51MT/8TdxJeH
	jbEmt2ONRZOHpcCQAWPcyW/KiIr5iT3E6ysE90cpGtP7xmjRP969Gkeowh7nMqsPn+4oMtpE+/4
	9u8vM1fQYpplWamUJriQdBkMlfNxUd1Uxp5OBjrPu2kFVNKI8NSRGfUlvzczq9OzottIaZzlwKv
	5dUifbgIcN85APaRfK1D1GKl55LKEdHRrvIBGWXENmFwFrf1E+5G+OoFuCVHE3CgCdWwfmjYvF1
	0WhE=
X-Google-Smtp-Source: AGHT+IHCeDnJP2rWhy7a5vwiHZmUj5bCErFwEoL87T2KVYx/hLNj2JfWdn14NtkZfZZyhK810d4Gxg==
X-Received: by 2002:a17:902:f651:b0:235:f70:fd44 with SMTP id d9443c01a7336-23601d071camr35748375ad.21.1749201564834;
        Fri, 06 Jun 2025 02:19:24 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077f2csm8538105ad.36.2025.06.06.02.19.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Jun 2025 02:19:24 -0700 (PDT)
From: lizhe.67@bytedance.com
To: akpm@linux-foundation.org
Cc: david@redhat.com,
	dev.jain@arm.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	peterx@redhat.com,
	lizhe.67@bytedance.com
Subject: Re: [PATCH v4] gup: optimize longterm pin_user_pages() for large folio
Date: Fri,  6 Jun 2025 17:19:17 +0800
Message-ID: <20250606091917.91384-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250606023742.58344-1-lizhe.67@bytedance.com>
References: <20250606023742.58344-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 6 Jun 2025 10:37:42 +0800, lizhe.67@bytedance.com wrote:

> In the current implementation of the longterm pin_user_pages() function,
> we invoke the collect_longterm_unpinnable_folios() function. This function
> iterates through the list to check whether each folio belongs to the
> "longterm_unpinnabled" category. The folios in this list essentially
> correspond to a contiguous region of user-space addresses, with each folio
> representing a physical address in increments of PAGESIZE. If this
> user-space address range is mapped with large folio, we can optimize the
> performance of function collect_longterm_unpinnable_folios() by reducing
> the using of READ_ONCE() invoked in
> pofs_get_folio()->page_folio()->_compound_head(). Also, we can simplify
> the logic of collect_longterm_unpinnable_folios(). Instead of comparing
> with prev_folio after calling pofs_get_folio(), we can check whether the
> next page is within the same folio.
> 
> The performance test results, based on v6.15, obtained through the
> gup_test tool from the kernel source tree are as follows. We achieve an
> improvement of over 66% for large folio with pagesize=2M. For small folio,
> we have only observed a very slight degradation in performance.
> 
> Without this patch:
> 
>     [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>     TAP version 13
>     1..1
>     # PIN_LONGTERM_BENCHMARK: Time: get:14391 put:10858 us#
>     ok 1 ioctl status 0
>     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>     [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>     TAP version 13
>     1..1
>     # PIN_LONGTERM_BENCHMARK: Time: get:130538 put:31676 us#
>     ok 1 ioctl status 0
>     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> With this patch:
> 
>     [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>     TAP version 13
>     1..1
>     # PIN_LONGTERM_BENCHMARK: Time: get:4867 put:10516 us#
>     ok 1 ioctl status 0
>     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>     [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>     TAP version 13
>     1..1
>     # PIN_LONGTERM_BENCHMARK: Time: get:131798 put:31328 us#
>     ok 1 ioctl status 0
>     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
> Changelogs:
> 
> v3->v4:
> - Fix some issues of code formatting.
> 
> v2->v3:
> - Update performance test data based on v6.15.
> - Refine the description of the optimization approach in commit message.
> - Fix some issues of code formatting.
> - Fine-tune the conditions for entering the optimization path.
> 
> v1->v2:
> - Modify some unreliable code.
> - Update performance test data.
> 
> v3 patch: https://lore.kernel.org/all/20250605033430.83142-1-lizhe.67@bytedance.com/
> v2 patch: https://lore.kernel.org/all/20250604031536.9053-1-lizhe.67@bytedance.com/
> v1 patch: https://lore.kernel.org/all/20250530092351.32709-1-lizhe.67@bytedance.com/
> 
>  mm/gup.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 84461d384ae2..be968640b935 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2317,6 +2317,31 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>  		unpin_user_pages(pofs->pages, pofs->nr_entries);
>  }
>  
> +static struct folio *pofs_next_folio(struct folio *folio,
> +		struct pages_or_folios *pofs, long *index_ptr)
> +{
> +	long i = *index_ptr + 1;
> +
> +	if (!pofs->has_folios && folio_test_large(folio)) {
> +		const unsigned long start_pfn = folio_pfn(folio);
> +		const unsigned long end_pfn = start_pfn + folio_nr_pages(folio);
> +
> +		for (; i < pofs->nr_entries; i++) {
> +			unsigned long pfn = page_to_pfn(pofs->pages[i]);
> +
> +			/* Is this page part of this folio? */
> +			if (pfn < start_pfn || pfn >= end_pfn)
> +				break;
> +		}
> +	}
> +
> +	if (unlikely(i == pofs->nr_entries))
> +		return NULL;
> +	*index_ptr = i;
> +
> +	return pofs_get_folio(pofs, i);
> +}
> +
>  /*
>   * Returns the number of collected folios. Return value is always >= 0.
>   */
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
> +		 folio = pofs_next_folio(folio, pofs, &i)) {
>  
>  		if (folio_is_longterm_pinnable(folio))
>  			continue;

Hi Andrew,

I apologize for the inconvenience I've caused. It seems that there are
still one formatting issue with the patch (thanks to David for pointing
it out). We need to apply the following fixup.

Thank you for your time and patience!

diff --git a/mm/gup.c b/mm/gup.c
index be968640b935..85112c904a4d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2354,7 +2354,7 @@ static void collect_longterm_unpinnable_folios(
 	long i = 0;
 
 	for (folio = pofs_get_folio(pofs, i); folio;
-		 folio = pofs_next_folio(folio, pofs, &i)) {
+	     folio = pofs_next_folio(folio, pofs, &i)) {
 
 		if (folio_is_longterm_pinnable(folio))
 			continue;

Thanks,
Zhe
