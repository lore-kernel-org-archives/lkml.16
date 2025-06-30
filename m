Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F6B374F1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751250765; cv=none; b=lFYX/txWOFfB0Y8jpv4LCpyEYAffubH8Ivn1Pm3M4p8kNIkyUXJ/6iRaMK4633QqKIGcvloE7mlF4DwW8gCkqI+XSnQTndoa9W5ngleGZ/B19XvLl6AIxNX/focfNrmMDhBf0q1jWtRSVwaiNs7tPdDf2xgGH68Z+PweU1Bqdo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751250765; c=relaxed/simple;
	bh=y3AHwHar+N9H3e942UyjUO2ocmj/PZKf1yl3Y61feWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNUc1f0ELLx37bdi8DoDnTR/aZNoC7ziEaZZblI0rzacJLXW6t8OCOTeVJk7RVx4dj4W85qQ0tpZm30PiLcRz0a4jBAfsvglEQdXKSc7Jv1PYNNc1E8lCEKLqbt3tlzEbKza8Vrf40gdh3ktPoEpP8cCEfxVuqc1MBkO6KStJYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VPARdLe6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VPARdLe6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e62619afso427027f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751250761; x=1751855561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l32+kcHFTvy/thF86Ip4IcL7WEZnxbK2oPIvL0HseaQ=;
        b=VPARdLe6kOuY689KCBoQqTnmqMPd9+CsMAUEFTGdyRkT5bhZecL6bprsPg8H0EmetG
         70R1yC8XEkvGqfHOWraEs76ticIqOlNa8YmT2o043WC9lPmLM7ZjN0di5SJHzlJR0RqI
         WWtmwklWl3oNXdyBW0+fzCYvujHiu2XwWUW68VPA4X7OFItprMkpiEO3w3FDS/S6qxzC
         UFMazCo3tSO6erQ1Fx+VndiwdBs03y1IZH+YmzJ2Au+5QR465V0slQ5EUv3bM3f6ZCTi
         eerXvJ3WaPvfu98QRDm6nAvESXKC4bi5z2lGlzx+A+JuK31JZZpk4odHV5AGxLNRLkC2
         AKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751250761; x=1751855561;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l32+kcHFTvy/thF86Ip4IcL7WEZnxbK2oPIvL0HseaQ=;
        b=QttDhIi8ehc7hQvtl4ZY6chEvv3cn4UpeqpANv2Xb3PUqJjowESM7cMbrNtmCyRZzI
         MweXtM0AzQnoBknTvAC1wh6NkKebkd2WBkb6XqbRYj2wdK1Whx/lBhew+0N3oDuBEVjV
         LrPrmMGwrsUX7NFUp/6s2RC301mwOL0Y7L7X3QPakF0DMbAG0dU10BjKWER70eef/LLt
         tS84agjY+i7AoU1UnOzWf1qfUkoZNpNnF02VZCkv0o1/u7t+KCVZ2+ASrGnBYYSUI276
         eEaSeUQCEiNpYMYY9cGHEcyd/yFz/LDgBHrXBZjllfB9jzIww0okWQVGYTZWXOfRkVNy
         uc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXewKJW9ySZ59KRIF7MKeJDyeJ3+cvFvGbQeKdGcSSpBtzDd20nuCJeX10n3864fRtNTXszqfXiJWLjXE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9D9dKnDIjDfhmRPRj3uaD95EXDurGEAt2wI6Mc6AECpYwSr95
	OxTwYAA1VPPjjJaZ3p91V4tKoNs1maS1iriGvVVCaSbuRAZwmdLvVImwvD5izGNy/hM=
X-Gm-Gg: ASbGnct9DtSbtdPRGfNPHTDwYEh0is9Ju742jPkqxMeWUK9/l5ivWgI/PHmuwoIYpzP
	ix6DWjY0wDiM6aZj+dKiWSOi02e0v/hoP8bCnv9Hn8YeOgrjy29SJLoyT9o0oiDgr8WpnkeUAlz
	rp9xlJ3m86SHD/ZVSz3kmynD+t8Cl+Aa+P3m+s2SZvsgQD/OI3QN/1oNePJl36hp0OVDJOEsQ1P
	Adoe2lg8E08hp/3NU6p6gR2QGLb6ycp+OfrdPDTbC+FdmBPmy7a3/a/H8u2Tu9MclRu874dVg13
	G5fguyDmyBtCtM1giabbvR0MnR9rIA5v7LHhkyHXpkVUG+BTjGoV1hhnYXaU47yLI7AH
X-Google-Smtp-Source: AGHT+IHJ3NA83lSuJiPSZMXnyu4C9IeZszL+f7Y95Ou8Uhmb0EnG9Rp+Ou87ri5n5sK2SBJ4yJXiyQ==
X-Received: by 2002:a5d:64cb:0:b0:3a6:d680:f282 with SMTP id ffacd0b85a97d-3aaf43b95cfmr2011878f8f.7.1751250760988;
        Sun, 29 Jun 2025 19:32:40 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3bbf9esm68908445ad.191.2025.06.29.19.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 19:32:40 -0700 (PDT)
Message-ID: <d6a11613-9763-4d9a-b4ad-5f451f770b70@suse.com>
Date: Mon, 30 Jun 2025 10:32:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: Avoid NULL pointer dereference in
 dx_dir_lookup_rec()
To: Joseph Qi <joseph.qi@linux.alibaba.com>,
 Ivan Pravdin <ipravdin.official@gmail.com>, mark@fasheh.com,
 jlbec@evilplan.org, ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: syzbot+20282c1b2184a857ac4c@syzkaller.appspotmail.com
References: <20250627023830.150291-1-ipravdin.official@gmail.com>
 <d6c72ab8-d600-4cc2-9609-8b749b61703d@linux.alibaba.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <d6c72ab8-d600-4cc2-9609-8b749b61703d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/25 09:26, Joseph Qi wrote:
> Hi,
> 
> 
> On 2025/6/27 10:38, Ivan Pravdin wrote:
>> When a directory entry is not found, ocfs2_dx_dir_lookup_rec() prints an
>> error message that unconditionally dereferences the 'rec' pointer.
>> However, if 'rec' is NULL, this leads to a NULL pointer dereference and
>> a kernel panic.
>>
> 
> This looks possible, but syzbot reports slab-out-of-bounds Read in
> ocfs2_dx_dir_lookup_rec(), not NULL pointer dereference.
> 
> So I think it is because it construct a malicious image and set a wrong
> l_recs, then access this damaged l_recs.
> 
> Thanks,
> Joseph

I think this proposed fix (at least the fix method) is acceptable.
the crash occurs at ocfs2_error(), where the pointer 'rec' must be incorrect.
look back at the previous code lines:
         for (i = le16_to_cpu(el->l_next_free_rec) - 1; i >= 0; i--) {
                 rec = &el->l_recs[i];

                 if (le32_to_cpu(rec->e_cpos) <= major_hash) {
                         found = 1;
                         break;
                 }
         }

either 'el->l_next_free_rec' or 'el->l_recs[i]' has an incorrect value.
we can do nothing about this kind of error, simply returning errno to caller is sufficient.

btw, ocfs2-tools has a similar function "static errcode_t ocfs2_dx_dir_lookup_rec()"@libocfs2/dir_indexed.c, which sets ret with OCFS2_ET_CORRUPT_EXTENT_BLOCK and return.

- Heming

> 
> 
>> Add an explicit check for a NULL 'rec' and use an alternate error
>> message in that case to avoid unsafe access.
>>
>> Reported-by: syzbot+20282c1b2184a857ac4c@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/all/67483b75.050a0220.253251.007c.GAE@google.com/T/
>> Signed-off-by: Ivan Pravdin <ipravdin.official@gmail.com>
>> ---
>>   fs/ocfs2/dir.c | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
>> index 7799f4d16ce9..dccf0349e523 100644
>> --- a/fs/ocfs2/dir.c
>> +++ b/fs/ocfs2/dir.c
>> @@ -809,11 +809,17 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
>>   	}
>>   
>>   	if (!found) {
>> -		ret = ocfs2_error(inode->i_sb,
>> -				  "Inode %lu has bad extent record (%u, %u, 0) in btree\n",
>> -				  inode->i_ino,
>> -				  le32_to_cpu(rec->e_cpos),
>> -				  ocfs2_rec_clusters(el, rec));
>> +		if (rec) {
>> +			ret = ocfs2_error(inode->i_sb,
>> +					"Inode %lu has bad extent record (%u, %u, 0) in btree\n",
>> +					inode->i_ino,
>> +					le32_to_cpu(rec->e_cpos),
>> +					ocfs2_rec_clusters(el, rec));
>> +		} else {
>> +			ret = ocfs2_error(inode->i_sb,
>> +					"Inode %lu has no extent records in btree\n",
>> +					inode->i_ino);
>> +		}
>>   		goto out;
>>   	}
>>   
> 
> 

