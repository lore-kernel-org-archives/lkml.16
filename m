Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F6E192D8E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743123347; cv=none; b=DYoh2skunm6tw/Fe9YL61uVAQts+mUm927rVG5xUxsVz4+N8sgDo4ZqZmBEkCs0wql6diStLEvoMZs/d/+OPjc3bhNEbUdcwpSSi9ogGhaH+AwC4vyN5Iq2gatk7d6fuCXRL9IRmXwwIZIC1Ipuy7zQwWlGgFi/fNGbg72uFKM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743123347; c=relaxed/simple;
	bh=OjLhi8L/AkXCkcXackWSSokwtCg9FEOekmeNmSMyg30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUe6r1cNz7BQZAL9u4RaBVeyxMXpe503ikYw8EjqO4eRbYFdrvyv3d6F0CGi4gUCs+0C6uNaHPgUe0R4txBam4lDAAPHlXYBizkpXF8N789ghJpFl+pdwVPZW0z9KvAMbgfp+84eBV1rEn3HhrR++/wWi/owgtWLJPxRbZdAWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7vkoMYW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7vkoMYW"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso3094145a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743123344; x=1743728144; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8G81JEz2uI2RDXTwyc99Q5aIzsfFZJ1dMtQvoEzCQ4=;
        b=S7vkoMYW8V7UYbSBzVW+vfycH/KvTGLMMc1Ic3Y9MylYWQWNy/1affI7WjjIH8sh7x
         Qc0bDI3xtlFrV78rCRrQPtqgpGFB2grUClnYG8Kl6CzzPGjua2Lux25B1WDnJtkmH4HN
         hrs3A8Squ9CX2OTp4YTUXEOugWWceLTvEkEk7be6yczwCAnsPhbbRf38E8IFcFGBNexS
         bK8yI28P5ZTXOkb90or5F4b/4ITfUBKWK9dlyH5tYopOPqXGJHFN+LLiLv2Q9a6XHltO
         K1KwVatSUaUmF2TXml3i9uLzNm28Mg3QVTWIHKJJ+q23yYBu1gVQ1CU5t8BeDz2r5Ixm
         IEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743123344; x=1743728144;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y8G81JEz2uI2RDXTwyc99Q5aIzsfFZJ1dMtQvoEzCQ4=;
        b=cwailRedh4xiEYECeVrMHMviDkNRaZr2keP1CUgXwifsUkjus1I9A/pYoyGVEkNKwG
         F5w+IdCc4ELyGglAR6/JGrfNjZea167iKMwcpS8Szp5JXu0F+dRiSGIR9DsKPjwgXgJC
         1tr5r+ZymnisZIUpUtSWev69VtSJvcyUsRzMaJUr9L2dJMZGXl3R0tn9NWiGVGU9Z+r9
         bpamNm7ohN2HYk4J0Jid1bO5CK7ngFNsvBHi4Ml8wcS1Q4sOFtMaPrcDuJg7SmmxqLBH
         /A/OqRoM9kpTm6OSigSjaH2vhRodiKRUK/Bzvjk30ZnhkfArL5Z3ll+2VWbE1Hom5ee3
         2jSA==
X-Forwarded-Encrypted: i=1; AJvYcCVY6JUjU9/yHYD9m4wYvLf2idIcSuW/SH+LTBVksIrTRT/9znEpXzWpDkAInEB96ChADliwncd+/ARiPPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMMege99WoV+2fPrct1XGj3wtNp5wycgiAdtrfzQ8Vm5wYzwx
	lEsZrEObIkp7Wc4APWbbHjUtUWwOcdwvI61+0Z0VVOztMd/Kvj00
X-Gm-Gg: ASbGnct7hWfWqH46lIjx6Hb/zoN8D/yhyYtNuvnifgst+FI6NdckwF7pVFWAqbRpAKN
	w5uShb/Pz9NDau7ZN4uKB2trcIJghEeNnDcDhEQbqXP2uQ+HHT84XJXY4zkctF8Nl+trs6MHkaX
	Etd2AOtvMpWbqzndHzyNb2rp9Y8OMFcUTamrqoUYyeYrWJUNI2NzRbZashBvjVtCFlD8748H+SK
	6+wvXg3tIHWSxUmsZfUCE7wuEDNgfAuueZu9j1l7w8kWT1vban/48+1Q9xWFMPB59Bvr7OCbqBU
	MUtumU9whTDLDo71ywDfYIQBKOV6gr5gvz8/FN1na0NP
X-Google-Smtp-Source: AGHT+IGDo0+yCIbyrvl6erWfoKV5FSSUnDNahplQfwCA25cuWKidVAHgKmI6fhzo4C8M81dxJCIWqA==
X-Received: by 2002:a17:907:9611:b0:ac2:7d72:c2aa with SMTP id a640c23a62f3a-ac6fb1bd18dmr568959066b.51.1743123343637;
        Thu, 27 Mar 2025 17:55:43 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8b7sm73949566b.121.2025.03.27.17.55.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Mar 2025 17:55:42 -0700 (PDT)
Date: Fri, 28 Mar 2025 00:55:42 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, kernel test robot <lkp@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 mm_cmdline_setup+0x94 (section: .text.unlikely) -> memblock (section:
 .init.data)
Message-ID: <20250328005542.q7oumy7v2bvpuyyd@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <202503241259.kJV3U7Xj-lkp@intel.com>
 <20250327011312.mj55byrfatiprddh@master>
 <20250327123624.bd59f1307d5c5b29b1b9ac08@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327123624.bd59f1307d5c5b29b1b9ac08@linux-foundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Mar 27, 2025 at 12:36:24PM -0700, Andrew Morton wrote:
>On Thu, 27 Mar 2025 01:13:12 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> Since it is only used by mmu_init() which is annotated by __init, I think the
>> proper way is to add __init to mm_cmdline_setup.
>> 
>> 
>> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
>> index 4520c5741579..e98cfaf1c62b 100644
>> --- a/arch/microblaze/mm/init.c
>> +++ b/arch/microblaze/mm/init.c
>> @@ -143,7 +143,7 @@ int page_is_ram(unsigned long pfn)
>>  /*
>>   * Check for command-line options that affect what MMU_init will do.
>>   */
>> -static void mm_cmdline_setup(void)
>> +static void __init mm_cmdline_setup(void)
>>  {
>>  	unsigned long maxmem = 0;
>>  	char *p = cmd_line;
>
>That's a correct change anyway.  Please send along a patch sometime?

Sure.

-- 
Wei Yang
Help you, Help me
