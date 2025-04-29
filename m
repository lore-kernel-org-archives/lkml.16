Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53427703B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912556; cv=none; b=Eli5oQc6y7MsaoZ4i25UtOGgC6f9WZ8Cbvv3x9LiFYwh7Gr1CNNCWVpWGzc2d1Hq0hPoiPOOnQXBYONPIhezgLV6UL+1bcC/mF96LF6Du3w3dPUtRkuLR3dhttt4o1xKKm0Y9MO3g/yjnbVdfrxsf7uc1WTiT152XOkrAW31cE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912556; c=relaxed/simple;
	bh=cXh6n3R/2spicCV4mVF9GE4UenvDP0RDHyXj9ySykjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ND5hGicSdUm4/kg7wv+7NdD7XBhLnejQh7txzd5hjpovQL4ECnYx/nIDCILOS/Rg+uuE+t94rzLSKyQNW7hkgZ3egbVY6VM2nr3a+fMrml7uEPRMAbQz6F3J7+hy4YjIC+o9nkS+fxmTb25I2GwK5Qt4Rx7kmgYTjNG5S/JH3rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g/POtmvm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g/POtmvm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c14016868so5647131f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 00:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745912553; x=1746517353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rmXhjsMt+xKQfrIkn2BMfGMkwVl49+1kW9h4RzMS49c=;
        b=g/POtmvmfn6HKeGS12nXZkvhxO6DnCrkpES+zCRCJa6pcax/hVDd1pqaOTDVdRY5Pq
         drDu/zEzblKoxyqAqC3t8MGo2SspgIQ1cBY9z287f+cRIS/y7XcyXUuYM+nDFidrR0Yw
         bHIvkGISLvEt8U3eKEWKi58TnO80woAij/MLKRj5rzj2WeYlJCsb2FkBzusEnDODCZ3D
         AGL2v0obWepH3FU1kvi2zq5RF7eb39fUBHKOpzj3RR5lyXWnhXEWvURdykzsFsYNk/YR
         Rx1IY84UboAb/5De1n6Q+GzN92Xzm8gOEXkAEFu7Dy6GajsB2E+JcjD29qSAyvPEiDco
         8I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912553; x=1746517353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmXhjsMt+xKQfrIkn2BMfGMkwVl49+1kW9h4RzMS49c=;
        b=GVWlTDxJkOIama32Vd57rcnWfHLfqh+SJGNQwzIuSjAD4+jyzqONRv1UdZuLYjsu/j
         F8zaVmDf76fJm24m3HEBsM9sb+2dPZND2uouEEzQc+H5aQXzr9EompqCQe48VQ864ZLj
         k3HdxGZecRmrtgv49eUFpb175rrfsnpzRqjqfbFEA03yWWHekV/ZkCp+Gnnpd4xRQvPF
         JERAe/9MK+byIZhZHV3LjG/2xWAIcL/1E9A6phbGU2gx9yNY7GS6OHyaVyBTXjAOTxal
         K2JBSBRTqRyWXC94INnFubdX7UJH02OF6frYRsnXY7kKDPHJOJXkDWSHTf0+UcDiAUzu
         n2lg==
X-Forwarded-Encrypted: i=1; AJvYcCVJla2Zb7/0xZt/gaP4XqjJrLEwJOmkvLZ9xAl1cDIrRDvNsKKZP7OaMwmeFyuUSZB7J+XcN8etWIHmx+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLIwGB+/gBfhT9FzbuLQmlb972fqh42Vr4BIkGSiQ8j24NEltg
	1SwGJpezYyVGePAQ6OlQWHOBclscubg78Pua6UJoEhzoFZKwcj4bvuygV0HE0o0=
X-Gm-Gg: ASbGncsQzpx7VzFkgfzvQpuT+kQY85MZJaFL8uNLQYnP5qP1SsWOhcjFxXEaDI1rUvM
	BLAiOVUDRa2s1/bfPaz8KdK+9Cesl5BQsMBZzn/0ayQhHOGGanZMp8/oz8zPdvcVHnfwFpMoyoK
	N6NMcEmNl2XUgiAeQ7wUwrvFMOZoahd5X9P3GxTkUKUH4bcrSLNFeo3pS5TtDJ+hqNFBhwqI6z9
	enNnZhNE67V25nm8YzFVOHbqd7A7cJsbBbTqU2r82Fr/hEBbhmESc9D6hEg27GHFLeLw87y7aZn
	nfVIStK5d2RFTcbbuigvFltidhVgH/gcyKap8mq74L7Zy/uT+/D2SZnqs7DsxSIc/QOf
X-Google-Smtp-Source: AGHT+IFB6M3h2/QAqZRTSqmWfE0T/sZTOTsikAFH4/HacDiwPy4iAluW2Tcmy7T4w32lfBObI+Wfqw==
X-Received: by 2002:a05:6000:188c:b0:391:1458:2233 with SMTP id ffacd0b85a97d-3a0890a50a8mr2130171f8f.11.1745912552763;
        Tue, 29 Apr 2025 00:42:32 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbc0c6sm95603765ad.81.2025.04.29.00.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 00:42:32 -0700 (PDT)
Message-ID: <021ca5c7-bdf8-4ec1-b59f-dce8333fe158@suse.com>
Date: Tue, 29 Apr 2025 17:12:27 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: Use refcount_t instead of atomic_t for mmap_count
To: Bo Liu <liubo03@inspur.com>, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429072033.3382-1-liubo03@inspur.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20250429072033.3382-1-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/4/29 16:50, Bo Liu 写道:
> Use an API that resembles more the actual use of mmap_count.
> Found by cocci:
> fs/btrfs/bio.c:153:5-24: WARNING: atomic_dec_and_test variation before object free at line 155

Please explain this better, I didn't see anything wrong about the 
decreasing the atomic to zero then freeing it.

Thanks,
Qu>
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
>   fs/btrfs/bio.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
> index a3ee9a976f6f..353c61936cd6 100644
> --- a/fs/btrfs/bio.c
> +++ b/fs/btrfs/bio.c
> @@ -23,7 +23,7 @@ static mempool_t btrfs_failed_bio_pool;
>   struct btrfs_failed_bio {
>   	struct btrfs_bio *bbio;
>   	int num_copies;
> -	atomic_t repair_count;
> +	refcount_t repair_count;
>   };
>   
>   /* Is this a data path I/O that needs storage layer checksum and repair? */
> @@ -150,7 +150,7 @@ static int prev_repair_mirror(struct btrfs_failed_bio *fbio, int cur_mirror)
>   
>   static void btrfs_repair_done(struct btrfs_failed_bio *fbio)
>   {
> -	if (atomic_dec_and_test(&fbio->repair_count)) {
> +	if (refcount_dec_and_test(&fbio->repair_count)) {
>   		btrfs_bio_end_io(fbio->bbio, fbio->bbio->bio.bi_status);
>   		mempool_free(fbio, &btrfs_failed_bio_pool);
>   	}
> @@ -235,10 +235,10 @@ static struct btrfs_failed_bio *repair_one_sector(struct btrfs_bio *failed_bbio,
>   		fbio = mempool_alloc(&btrfs_failed_bio_pool, GFP_NOFS);
>   		fbio->bbio = failed_bbio;
>   		fbio->num_copies = num_copies;
> -		atomic_set(&fbio->repair_count, 1);
> +		refcount_set(&fbio->repair_count, 1);
>   	}
>   
> -	atomic_inc(&fbio->repair_count);
> +	refcount_inc(&fbio->repair_count);
>   
>   	repair_bio = bio_alloc_bioset(NULL, 1, REQ_OP_READ, GFP_NOFS,
>   				      &btrfs_repair_bioset);

