Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7AE2BF011
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082293; cv=none; b=Aa296i0oWDzMrMmx6sBY5xtI1xMrwHSDdNjvk81kTgn6ep3xzfZOxH3nEJdVX4ORM/Z42WXR5JB5q4+o0yv9p0I/dgDH23N/Q87ogM2tnzs9yVCEhOMz+4fAWBWazpNZ82PwWA7zJxegKxvZuk2rSIbmde0msmpVeVlU9FYS0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082293; c=relaxed/simple;
	bh=eNe1aGesW57V06u9+X7qSzUwlvkFL+QPjXfzqELIBUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=El25sya4Wt3m8po66HBYVGsqD9HzZgDiT848wN1HHhnfp8xYKbsHX4Hjyp6ZhcKg/ibOVAnaWfdyv0lLlp56RexETFJ1DZMGYyUxldK3idwzvZIJ1h+hFKYbKkxABH2ULEQdpG1xQt/00gZOapxsiLCctFVAh7pKA2LvySLqeHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Lxhe8rCt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Lxhe8rCt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d3f72391so53888545e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750082290; x=1750687090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVgzfdytw7GLqgjKncwxWa9YLoT5JIIwN29MSREtEbI=;
        b=Lxhe8rCt9rVIQ7W+kwcUFZgvMT7VK47pwX6ygdkCLhFPYVijHBeNowf1PdMYU4jy7s
         dkAMmeal1EtepNeKPR8zP8rU516G3sEhVNZjUbQUSqDlvA68BdcUEZHI7VAsRQfII2CA
         8UoqIUfSGaeVblbC4DX6LLrQXkngMWd6tnlufQwrkqp7Z882/l/ysQ6ik+FJKxyRTDbO
         1bkiB5ENtjy38AWSOujHuScXahq4xwzEOS0HS/PO+UDKNYJL+OyE4fO4aqCjN4evZEX5
         JwgSYiykp2xcFbsop9GC5isOOa/RLYq9oiHUQ4cgisiw2SA6QodAfiVYkqK+bwX+HtOI
         Zq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082290; x=1750687090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVgzfdytw7GLqgjKncwxWa9YLoT5JIIwN29MSREtEbI=;
        b=grSaBYz1FlqrD8IHX6g7KdFsYGbtx0qINXpsU9na9XeOuU+tIMrkcE2RLY5bZGKxVw
         GI1UPGKys3OW6Zyh5zTNrI/L+hw1i4uF1JPHAM17W5AiGgNT+gveiqPXT/RehdFmpUZz
         1/jQMj72PpyBprOXVLyZ84NydMuwYqY4S3M9L88g2N0S4S3cVqppeYDNkSxmIEGFGyd/
         pwLp70e6StTfkplLO72J+Zrzpl2vA2b/IFJWsU/Dng0gs/hVVSgwqnZnEvtsl3qUvr8W
         D8PVhuEog0N5xKGqO8jt9zTs3nCDQeXeTX+DbiLaIc0+NGXx+OWMGdtaL0Ku6mTszrWl
         zwhA==
X-Forwarded-Encrypted: i=1; AJvYcCUjH+n0DMrmVZCemTE/syq2zd1abIiG0UiVbd52qrjlkhuMXFQgWR/WmX64tgZCX7Na8trE39fbwuK1Lqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKYLzEBXaMR//w6iDlM+A74ekfuM62DF07Egrf4McxO5ZAMShh
	vOv0GpBWrO8NxBJ4ayGRZdHmHHuDiI3OcgPOvdiT8bUDffP071EhxhhpGvS28ycevv8=
X-Gm-Gg: ASbGncuOU2CxNoV/qr9sA9VQlL3/RcKHquH53/jhF+LVPCqSmeEcVOyFtOMwQO7p0FI
	/99rv+dSGDY+4ukiXdrlraauF29TMSBjSZxazO05TcnWIk5R3EPsKhoM0FfOyDQqkG+CoEyGWDB
	GakykD82D/vE2w2XrWRxyQgMV7th3Dp35nQ1eA1Huf/Vv1NfO6FWUB/GlSj1uNvdpGKBqbpN4AF
	iQETX16fq+339ieWu3EbjCAh9NIDxvXNehSY3+hNmDKpni7IL8kGjPSG46/u/aHCvebKsucT6t0
	vMFOhe7SDLQls1SfZRLnoCMF9BZOBaJoMN9xvvlO4fEYcfyTP/gxK7I0irjuXEZNpA==
X-Google-Smtp-Source: AGHT+IHTrudFH8bOP+1JEl3Xxm/O1MDRV2TH0s4tp7P/yBD7QShr6ZwCmRNFJoYZdJnnkRQ7CUzYWA==
X-Received: by 2002:a05:600c:46cb:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4533ca5f35emr90530715e9.4.1750082289684;
        Mon, 16 Jun 2025 06:58:09 -0700 (PDT)
Received: from [10.100.51.209] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e261ebdsm151289895e9.39.2025.06.16.06.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:58:09 -0700 (PDT)
Message-ID: <97f26140-bf53-4c4d-bf63-2dd353a3ec85@suse.com>
Date: Mon, 16 Jun 2025 15:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] module: Fix memory deallocation on error path in
 move_module()
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250607161823.409691-1-petr.pavlu@suse.com>
 <20250607161823.409691-2-petr.pavlu@suse.com>
 <ae967353-71fa-4438-a84b-8f7e2815f485@kernel.org>
 <c7dbb33d-98b6-45da-be77-e86b9e6787ee@suse.com>
 <7cf40cd1-fe0d-4493-ac15-e70c418e54a5@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <7cf40cd1-fe0d-4493-ac15-e70c418e54a5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/25 11:28 PM, Daniel Gomez wrote:
>> This seems to be off by one. For instance, if the loop reaches the last
>> valid type in mod_mem_type, MOD_INIT_RODATA, and successfully allocates
>> its memory, the variable t gets set to MOD_INIT_RODATA. Subsequently, if
>> an error occurs later in move_module() and control is transferred to
>> out_err, the deallocation starts from t-1, and therefore MOD_INIT_RODATA
>> doesn't get freed.
>>
>> If we want to always start from the last type found, the code would need
>> to be:
>>
>> 		[...]
>> 		ret = module_memory_alloc(mod, type);
>> 		if (ret)
>> 			goto out_err;
>> 		t = type + 1;
>> 	}
>>
>> I can adjust it in this way if it is preferred.
>>
> 
> My earlier suggestion was incorrect. We can simply initialize the memory
> type t to MOD_MEM_NUM_TYPES since it's only used in the error path of
> module_memory_alloc().

Do you mean the following, or something else:

static int move_module(struct module *mod, struct load_info *info)
{
	int i;
	enum mod_mem_type t = MOD_MEM_NUM_TYPES;
	int ret;
	bool codetag_section_found = false;

	for_each_mod_mem_type(type) {
		if (!mod->mem[type].size) {
			mod->mem[type].base = NULL;
			continue;
		}

		ret = module_memory_alloc(mod, type);
		if (ret) {
			t = type;
			goto out_err;
		}
	}

	[...]
}

-- 
Thanks,
Petr
