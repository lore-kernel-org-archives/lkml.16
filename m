Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3228FFFF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335439; cv=none; b=KlVGHwvZs3/j7ynTZWMjtkxXofHrf+U+mydEBN8TA9mS5vFnawNIct47fqn2DbF1hp5+Hm/ZUYHUj12u/zsz6riVwBckDtbOd8bi0tzivvOAi9Zkhv2Jk0qQ/fWkv/6lQ9XJ1HnES0Wj/3p520bX5mGZhY+S0LkC2fO0v1v6zYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335439; c=relaxed/simple;
	bh=FFYUF5ybFe0bvr4StnpdM9ppO9R6ffy2jkvl1ZEiy8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIhGqX0g2qWHApCZlZ8vK9W23fGgskFpOuUFYnH25tsgaGkGhHos/cUMAcYrP8nCY778o7+eGqTCx+N6/Y4ZYUK2IlzRHNUYt0aBKGZ2pKxi8LzDrNrQIJmZCK8lfXnmE9Ek+CN9JuGAU+vPBHqQHh0s3mAu+A1Cg5jwif6kxoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jAzguoGD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jAzguoGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745335436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WF7KbuLAZBa24Gp2tTkzynSQqLU+PgyoQ8Ium/89xGc=;
	b=jAzguoGD4qiFLNmntFovQLYDCTXwSE5a7jDB44WEyG9iPYEAM511a/2zZ620InWApgZjF2
	zdIWSLR3aTqDcokVOfeBA/9EHUmjTL8zvQ9jbmVqwOgnGSiPTuIEonR6APyQ9/xBzme2hP
	Mk1FzV6CYhom6/2SLDnr9ULp0ABegf8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-QHevvOtFP5C3t0cP4_MGoQ-1; Tue, 22 Apr 2025 11:23:54 -0400
X-MC-Unique: QHevvOtFP5C3t0cP4_MGoQ-1
X-Mimecast-MFC-AGG-ID: QHevvOtFP5C3t0cP4_MGoQ_1745335433
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912b54611dso2658147f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:23:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335433; x=1745940233;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WF7KbuLAZBa24Gp2tTkzynSQqLU+PgyoQ8Ium/89xGc=;
        b=qJDKeGcd+TvI0Tt+tB91RvOLD+V3kL8OFDTB4y8QhotlOlnlv8lFkIZfjWfukIQCfF
         LAwpiIXIVa4WE58igLMb+cFmRz9ZfT5wN0+brkfReBn61WNEK/yZFgR+Na17nS8ws7Py
         T/uMJ3y7+vtN6RFqBABAStacb8Rt70UbjSgiF1434vw40o3Fzx8yyuw3QRwc98cthRiq
         452pDe3Ns25cqx0SPYYzlhCvVHQd4BSVLxMCnHI5sGWes8TvyuYM+3/iApoC6MbW9G4j
         GHP9jqDHIKSWGYrYHs9gjwDaH95ypIXEZUf52oqpsnZ0xt4lIgQrR6gRNZp/fneLUqoz
         WHlg==
X-Forwarded-Encrypted: i=1; AJvYcCUbkRKKa5X242OLyWIoYCMKls/iYjeERFRdEs91OwGV3X0DEDNmaNZw+ilqmJ4+/fe0/JFD70O0DV08++M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYd5rBCxd4jVoHuXiFHFom2WFwvNT2MvFeXig4tVnpa1mhK/rY
	XduL+NN13Kxzws2J+RFYoKbxxALBWdoognIoe9kFoiMhOUrqJQlmzZBo4dDBT819CQ+oVqERKBD
	uM3AMo2eYm02tMcOATBdrEvPso08niT/Y/amQTxqLoKyTBcmoqV3CCGWYLPvRBw==
X-Gm-Gg: ASbGncuOH1aYmIYk1g5kgr322dthsx4PNldMRSq1o/Z5gK9A0mxHxlh5Ap3aX72eMD1
	58yVDPZLcYJkopNYaaNwHjRjvIAdvhpgb2hTOKnQPqQ6hfLWk/lFr1JqasqbOMa9WFxqdZN2Vxz
	mkHrJ4OZAmMJJcJOFvnpBro+6wKcgdnam5E0NIUuM4GZl5IG5rNlByS85thx6A/C7B06OfLYdPP
	xo54eNsZeVXQxtsAEiEZLDEHOqU8s6uVULlAeY9JVlF7nfyNl/vSpGBW3KGf5XhFybETURMuZDp
	6MydYelnplgg9dZ0megAr8xB9bFg7o3rck2aDGhccgYtdYGdKilq+qCcjHnClMGz/yogJ+NsTkN
	sHDn5We2yDQUYznQxDsR9452G6Y23uzr6kwYW
X-Received: by 2002:a05:6000:240d:b0:39c:13fd:e50e with SMTP id ffacd0b85a97d-39efba2ca32mr12874441f8f.10.1745335433024;
        Tue, 22 Apr 2025 08:23:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHueBAUwYTFgWq3aFYVageJU081iIqdMXlLimeK94dkMas7owys6I0xlQdmWLwcRD9uuCsvOQ==
X-Received: by 2002:a05:6000:240d:b0:39c:13fd:e50e with SMTP id ffacd0b85a97d-39efba2ca32mr12874409f8f.10.1745335432573;
        Tue, 22 Apr 2025 08:23:52 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf2csm15728851f8f.51.2025.04.22.08.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 08:23:52 -0700 (PDT)
Message-ID: <67f0669d-1063-486f-a995-f8d18634a1be@redhat.com>
Date: Tue, 22 Apr 2025 17:23:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] jfs: implement migrate_folio for jfs_metapage_aops
To: Shivank Garg <shivankg@amd.com>, shaggy@kernel.org,
 akpm@linux-foundation.org
Cc: willy@infradead.org, wangkefeng.wang@huawei.com, jane.chu@oracle.com,
 ziy@nvidia.com, donettom@linux.ibm.com, apopple@nvidia.com,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
References: <20250422114000.15003-1-shivankg@amd.com>
 <20250422114000.15003-3-shivankg@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250422114000.15003-3-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.04.25 13:40, Shivank Garg wrote:
> Add the missing migrate_folio operation to jfs_metapage_aops to fix
> warnings during memory compaction. These warnings were introduced by
> commit 7ee3647243e5 ("migrate: Remove call to ->writepage") which
> added explicit warnings when filesystems don't implement migrate_folio.
> 
> System reports following warnings:
>    jfs_metapage_aops does not implement migrate_folio
>    WARNING: CPU: 0 PID: 6870 at mm/migrate.c:955 fallback_migrate_folio mm/migrate.c:953 [inline]
>    WARNING: CPU: 0 PID: 6870 at mm/migrate.c:955 move_to_new_folio+0x70e/0x840 mm/migrate.c:1007
> 
> Implement metapage_migrate_folio which handles both single and multiple
> metapages per page configurations.
> 
> Fixes: 35474d52c605 ("jfs: Convert metapage_writepage to metapage_write_folio")
> Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/67faff52.050a0220.379d84.001b.GAE@google.com
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>   fs/jfs/jfs_metapage.c | 94 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
> 
> diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
> index df575a873ec6..a12fbd92cc69 100644
> --- a/fs/jfs/jfs_metapage.c
> +++ b/fs/jfs/jfs_metapage.c
> @@ -15,6 +15,7 @@
>   #include <linux/mempool.h>
>   #include <linux/seq_file.h>
>   #include <linux/writeback.h>
> +#include <linux/migrate.h>
>   #include "jfs_incore.h"
>   #include "jfs_superblock.h"
>   #include "jfs_filsys.h"
> @@ -151,6 +152,54 @@ static inline void dec_io(struct folio *folio, blk_status_t status,
>   		handler(folio, anchor->status);
>   }
>   
> +static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> +				    struct folio *src, enum migrate_mode mode)
> +{
> +	struct meta_anchor *src_anchor = src->private;
> +	struct metapage *mps[MPS_PER_PAGE] = {0};
> +	struct metapage *mp;
> +	int i, rc;
> +
> +	for (i = 0; i < MPS_PER_PAGE; i++) {
> +		mp = src_anchor->mp[i];
> +		if (mp && metapage_locked(mp))
> +			return -EAGAIN;
> +	}
> +
> +	rc = filemap_migrate_folio(mapping, dst, src, mode);
> +	if (rc != MIGRATEPAGE_SUCCESS)
> +		return rc;
> +
> +	for (i = 0; i < MPS_PER_PAGE; i++) {
> +		mp = src_anchor->mp[i];
> +		if (!mp)
> +			continue;
> +		if (unlikely(insert_metapage(dst, mp))) {
> +			/* If error, roll-back previosly inserted pages */
> +			for (int j = 0 ; j < i; j++) {
> +				if (mps[j])
> +					remove_metapage(dst, mps[j]);
> +			}
> +			return -EAGAIN;
> +		}
> +		mps[i] = mp;
> +	}
> +
> +	/* Update the metapage and remove it from src */
> +	for (i = 0; i < MPS_PER_PAGE; i++) {
> +		mp = mps[i];
> +		if (mp) {
> +			int page_offset = mp->data - folio_address(src);
> +
> +			mp->data = folio_address(dst) + page_offset;
> +			mp->folio = dst;
> +			remove_metapage(src, mp);
> +		}
> +	}
> +
> +	return MIGRATEPAGE_SUCCESS;
> +}
> +
>   #else
>   static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
>   {
> @@ -175,6 +224,32 @@ static inline void remove_metapage(struct folio *folio, struct metapage *mp)
>   #define inc_io(folio) do {} while(0)
>   #define dec_io(folio, status, handler) handler(folio, status)
>   
> +static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> +				    struct folio *src, enum migrate_mode mode)
> +{
> +	struct metapage *mp;
> +	int page_offset;
> +	int rc;
> +
> +	mp = folio_to_mp(src, 0);
> +	if (mp && metapage_locked(mp))
> +		return -EAGAIN;
> +
> +	rc = filemap_migrate_folio(mapping, dst, src, mode);
> +	if (rc != MIGRATEPAGE_SUCCESS)
> +		return rc;
> +
> +	if (unlikely(insert_metapage(dst, mp)))
> +		return -EAGAIN;
> +
> +	page_offset = mp->data - folio_address(src);
> +	mp->data = folio_address(dst) + page_offset;
> +	mp->folio = dst;
> +	remove_metapage(src, mp);
> +
> +	return MIGRATEPAGE_SUCCESS;
> +}
> +
>   #endif
>   
>   static inline struct metapage *alloc_metapage(gfp_t gfp_mask)
> @@ -554,6 +629,24 @@ static bool metapage_release_folio(struct folio *folio, gfp_t gfp_mask)
>   	return ret;
>   }
>   
> +/**
> + * metapage_migrate_folio - Migration function for JFS metapages
> + */
> +static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> +				  struct folio *src, enum migrate_mode mode)
> +{
> +	int expected_count;
> +
> +	if (!src->private)
> +		return filemap_migrate_folio(mapping, dst, src, mode);
> +
> +	/* Check whether page does not have extra refs before we do more work */
> +	expected_count = folio_migration_expected_refs(mapping, src);
> +	if (folio_ref_count(src) != expected_count)

Probably no need for the temporary variable.

Hm, makes me wonder if it should be called 
folio_migration_expected_ref_count() ... :)

Bit it's even longer, whatever you think is best.

-- 
Cheers,

David / dhildenb

