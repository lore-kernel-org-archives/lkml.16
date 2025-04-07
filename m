Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7451CAA8E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035280; cv=none; b=dbr7u4lVWItvfYWBfKX9giWcFBmI9hShypHvjSU06ZmjDh0SRpuJw/jksZ82opN01DVQoI8QZR9tkpzKUAWYZ6diiz6jsQ3cxpBfQjVl7VKyVJqXpTB9B4fTo+R04Z3VBagpAww5WRVrSGKn5HWR8j/bQa3Ix6nmQKE5esu6rAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035280; c=relaxed/simple;
	bh=GQArtUB6gCNUMkL83HMpvJlYZwJql0yUBupjif7ZGak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMo1/OxJslEb+h068LAN2o9ohJKFHwYh4cQAJz1NcbCiWShrN6W906AuFeEEJ8bqwCvlfnfxtk1asPBmTC2Wt8mJnjjzsvC5KDa1QYALlYCJAHTjd6EsRXGn+AoUJwZNBn5gQqhNWzfujE8A7LXm+QhDGY8hmlgvA4NUHjOhyK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=drcJQ9Hz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="drcJQ9Hz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so3743049f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744035276; x=1744640076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UtxPoMiwi2zSOTSOjpjQSX1tRQki1Xeprd03zQbP9dI=;
        b=drcJQ9Hz8S04Mt91GHUzknmKhPAEBsKh/0UHvRSs+GFCzKjB3I9pLQzngCJ5tG9xOz
         bKiTCRSJPHC724wQnmqMWWUu5GOUgHJ2O6MFz84/CWNhg/k9wzOwwP4kS/YoWkCzRIfV
         DEMdDTZgC7Dfk1gdtp1u1KuC5VyBujCivoyGWLWvDmuFO1wpyTQSsPbR0pZE4MdpPkzr
         HYwuSj9oW33Pg1al9RPOCouiFRPfI8rferUhjpK0cumVXtXHQDwyYL6Thcma7+v7/5nf
         w3FNLcFskN83tz92VDOzqUBC5saWJ14akE2LO1ZLt12/9fMe51ozsva/N3ZMufouLRKb
         Eq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035276; x=1744640076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtxPoMiwi2zSOTSOjpjQSX1tRQki1Xeprd03zQbP9dI=;
        b=dnZ1E9/5FduPltDPpq62D11XaBwFoB8DmI4q/gVBFJGmhuVnMTd8a+Msblc2B+whnl
         58sUkwuEUyQUohZJ5EqmMZH0LJfOU3KgSeKoUQ360CpsWvq9sg9I/4KROXrBtLNVZSZa
         9RDTlX4NXDLqKeMW9Ntwc2emZFtscJdbYlW4H1T+W+n6utjwH5GuvW5gpZdmpE8vcOAO
         tKM5arO6aGWGF2FOJRSerDzVuabKH6Z8XH1yWHd9tmAeGFSzEEUuWcLLLWD6eoLdkgSH
         eydqk65Nvws7UDpZUvPQTcHA9UBXW1N6aQgSVNaNKb5UIF+ingzpwNSomuKeZ6//e7Lt
         BwBA==
X-Forwarded-Encrypted: i=1; AJvYcCUrsQjNU2otgGlhUrUOxMkLoIU0BOeKJOb2rFOickcSgcUBn38wWqJNS1whlm59CzfBPCfAnJW6DEIxILw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxyTnM66KphYN1WK9uYUo1sI7eSM9eUGuT/T/8Qg/wvnSVugy
	TAzlEqQJ9O/SiBi9DAHQv0JTahjKRI7AK58VA73BJcRBwVaIoh1E2bONOUkRumg=
X-Gm-Gg: ASbGncuE1l2CZ0+5He/c+f12rukEGGGKIS+/NYGNKEwsspeGYxByc4tmu77gne8mD54
	DxZfXgZhNDz+hSOsKogxI0mpdY9NgfYGcjA6vRFQf1rPdkovxl7kuHC/KwvBomfF1fsQ8MBBViU
	fuJpObgpQaFsCxsNI+7LQEF8vgzQLBZhT9dYXyOTB3BCxOahu95chpP2dRXYP6V0ajOyD0iw5Ij
	k8O5eZIO+Y1NXGtii35LghT//th2aGPH4pWMmUDQNbhgRmjvBLbQ5BeyZ5t6IXyld8bTIaEPgub
	khsvReu5/ApJjm0AOhRS88VpOiAYq7NCfuu8uSi//hPoz73D
X-Google-Smtp-Source: AGHT+IHDA9BzZ1Chj4rRxu5Fej1PRG/jtdH0WBKyf55PHfts7unW3vUtQLAglw7Ovgjzdlsv/V2h+A==
X-Received: by 2002:a05:6000:2702:b0:39c:1257:cc28 with SMTP id ffacd0b85a97d-39cbc73213cmr7202015f8f.59.1744035276349;
        Mon, 07 Apr 2025 07:14:36 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7045sm12385085f8f.39.2025.04.07.07.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 07:14:36 -0700 (PDT)
Message-ID: <fc5a960f-21d4-4110-88db-20c103491af6@suse.com>
Date: Mon, 7 Apr 2025 16:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] module: Make .static_call_sites read-only after
 init
To: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jason Baron <jbaron@akamai.com>
Cc: Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250306131430.7016-1-petr.pavlu@suse.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250306131430.7016-1-petr.pavlu@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/25 14:13, Petr Pavlu wrote:
> Section .static_call_sites holds data structures that need to be sorted and
> processed only at module load time. The section is never modified
> afterwards. Make it therefore read-only after module initialization to
> avoid any (non-)accidental modifications.
> 
> Changes since v1 [1]:
> * Rebase the patches. The kernel now has commit 110b1e070f1d ("module:
>   Don't fail module loading when setting ro_after_init section RO failed")
>   which addresses a previous problem with handling ro_after_init sections.
> 
> [1] https://lore.kernel.org/linux-modules/20241223093840.29417-1-petr.pavlu@suse.com/
> 
> Petr Pavlu (3):
>   module: Constify parameters of module_enforce_rwx_sections()
>   module: Add a separate function to mark sections as read-only after
>     init
>   module: Make .static_call_sites read-only after init
> 
>  kernel/module/internal.h   |  7 ++++--
>  kernel/module/main.c       | 18 +++------------
>  kernel/module/strict_rwx.c | 47 ++++++++++++++++++++++++++++++++++++--
>  3 files changed, 53 insertions(+), 19 deletions(-)

Queued now on modules-next, for 6.16-rc1.

-- Petr
