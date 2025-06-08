Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2C179BD
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 07:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749367539; cv=none; b=ivUKiIPMX894hYDyLoM9pTe3itW1hpIJ8aWDJynaiN0DvZoNiIoZZFq/Ur7Z2jU6Ldk558olGRAOHAe2TlffqCJEseUWO2Sq74qbQSVl6uhgj6JQ0wmH7UUJ93wgRTSAFLSeSJeRMvjJBpWQjMamYRT2mnmrKUjYvCTY9ruM+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749367539; c=relaxed/simple;
	bh=CjBYKoeh+JUKRiVHmPnsj1xPsz1WrazHWtHcqg6xjhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQLuy2KbDRG7qQ5i0GIcwkf63JRUvoEqfnuYsNM5pkLLH0qIHRqX3oCPf+HNNJ1h0+MUAsQG/MXTOWak1203Ps6VRZ8+ufUgxOpfikfdPZSIFrQ9yyUHEEWZH1l/ZNpU/y55qdae6zeu4rDKVbds5JpOWLqv2qS3BehdNfKWUe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dO6hgtBL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dO6hgtBL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so29545675e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749367536; x=1749972336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5zxKH1RRPFE+pq7qzzrPXBdTSkahxpWL82kTyaPaww=;
        b=dO6hgtBLENEsjmIlf2spsPRu1O5YEurQAXwTlM+ZKvpXbhtyjsXXOPJrYjqJ5WCcmz
         4swoMVswMGwYpL8YGPN9B0iCHXQpJJqGwt7AIAp1IC3Nt3yhhHd4hSY/3PgieJrCe9jj
         cQSUB1K/A23Uhnxq1yZshaMP6ODGCuieTq+PpFHgZOxKRgFN0lUi+ZigiNNgReKaOD6f
         UbcbtZYwjnt943IjT5+ku+9bLNl2dK1v3wkQebqFMmT5SSWfPpNKyTmtLJE9IHaEmKcd
         /ZGl7zQ1B8l+tPcrHG6slaE/gCSZBgB7OFrGmPgV4NOZgwYJbWAAjZUwk5RM7ifIR9hU
         FBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749367536; x=1749972336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5zxKH1RRPFE+pq7qzzrPXBdTSkahxpWL82kTyaPaww=;
        b=meu2P4ChOQRWrO/dDx29O/JOx5zMUlt0eeOyMTPmsu956YrhSlAEL4d8+MyFdaRx81
         c3QhRtHEHTqzi6J6tuY5DtzWHt5VrpIUUn0km3LkPtwhYA2KLpJnP4hbMJf90ezL58pv
         s5E7m2Xv9QLW5Qsz8d+1kb/j7Ia6551O4NRTK9i6OYyePu0ctqTjvrmVi7iXpSpHgli8
         3eDUpmtJa/dwYKPXzMHHHHyd2cTSIi1zNDtMp7QAy0YKUwwpEx2xqES+FSkDbCbjvnKm
         BLCwioNdoE85UzGDR1gdhKu1ozTf9SQCMDut8Xu6Gvi4SAoAIe2KKXnHg0/fYiKllZvw
         W7rg==
X-Forwarded-Encrypted: i=1; AJvYcCXe4jb5pLOtCG5gQURKQ19nxKO3wrUur/fxHHWtn+0f/OdfZOqc8RXGyLjsrX/QEvV+6k6yrDYdALt52+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz59HILCtyRAVkS2TsJkNAtGFHPeikg4nKWS/AB8fWX0zrzKJ3P
	EvPFbPEms+wXjVqbnpXorTulPD+qUFGryQ4SebM47oEEST+1bBgrLDxp5KOPysZu3ZEf9Xiz8Cq
	kt97QvBQ=
X-Gm-Gg: ASbGncs1huaJoKFAZDLSQecCYecBlsXfEITdHTgZ0a9hPghVQd6B7on6P55UDXdBKCv
	WSnUgpKYBPzg+PaxnWPQgIC+4zXUw5XgwQKAYh9E0NaFqj2r9s9Uy8rle4sYdoCx1qQBxBEi76i
	LZEwZ/UelO5vwMFFJo+hd6WYZejKmno22j8UfUFz6EykjE1HNK112s6dTvF5sz1QaoP1PfqKO7U
	oL+SgalfzR4/HR4Vej8ryKK/rC/JkPemRUEK0O4RVSgF88aYJgNb9PSfc1EDnoPlY1yUTLBtZsT
	2nIYFY863FTLK5P/BOBunr3DISMce6kINk7ziIiWLi3UWx8GxikDGg86wZ8Je59rPME/qg==
X-Google-Smtp-Source: AGHT+IF/TT9gpo9gWlFm0wUaY6aLXBpdcRMEPm4klh6YKqHJVpnZ2y/4vfFm+DSI/hGsGt0wqWEm6w==
X-Received: by 2002:a05:600c:1913:b0:453:9bf:6f7c with SMTP id 5b1f17b1804b1-45309bf71a7mr19489325e9.9.1749367535678;
        Sun, 08 Jun 2025 00:25:35 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213754973sm77337195e9.35.2025.06.08.00.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 00:25:35 -0700 (PDT)
Message-ID: <f6fa3df3-38d5-4191-96d1-9a8a2152cedf@suse.com>
Date: Sun, 8 Jun 2025 09:25:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] module: Fix memory deallocation on error path in
 move_module()
To: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250607161823.409691-1-petr.pavlu@suse.com>
 <20250607161823.409691-2-petr.pavlu@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250607161823.409691-2-petr.pavlu@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/7/25 6:16 PM, Petr Pavlu wrote:
> The function move_module() uses the variable t to track how many memory
> types it has allocated and consequently how many should be freed if an
> error occurs.
> 
> The variable is initially set to 0 and is updated when a call to
> module_memory_alloc() fails. However, move_module() can fail for other
> reasons as well, in which case t remains set to 0 and no memory is freed.
> 
> Fix the problem by setting t to MOD_MEM_NUM_TYPES after all memory types
> have been allocated. Additionally, make the deallocation loop more robust
> by not relying on the mod_mem_type_t enum having a signed integer as its
> underlying type.
> 
> Fixes: c7ee8aebf6c0 ("module: add stop-grap sanity check on module memcpy()")
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  kernel/module/main.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 08b59c37735e..322b38c0a782 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> [...]
>  	pr_debug("Final section addresses for %s:\n", mod->name);
> @@ -2693,8 +2694,8 @@ static int move_module(struct module *mod, struct load_info *info)
>  	return 0;
>  out_err:
>  	module_memory_restore_rox(mod);
> -	for (t--; t >= 0; t--)
> -		module_memory_free(mod, t);
> +	for (; t > 0; t--)
> +		module_memory_free(mod, t - 1);
>  	if (codetag_section_found)
>  		codetag_free_module_sections(mod);
>  

This can actually be simply:

	while (t--)
		module_memory_free(mod, t);

-- Petr
