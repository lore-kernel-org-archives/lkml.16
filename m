Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9185255222
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747072307; cv=none; b=snj3KJSBZ5zeIT9eTllNNEd6GbNA9EJaGacZIxz15dPNROZFfD6BdhcSnW0zB7OEtTszkW0RhCgKLBOJAq8dq9L6oJ9MxMf2oFyiyNln2jB9AKz/7hsjeLPr2ti4K9qwe+gPLxM8quy2e+ou39zaKZyTqlfcNQljf0kW/54xiO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747072307; c=relaxed/simple;
	bh=UFhys/p6c2RGg4wS+0QEdYdP90cXWmGhYAKQ2m6cO1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCPBRu+jswxZb9PJ4jA0VOnwrAuwoULrFfWwSr1P+JC3ILkHAJX79MAUpbKN+Vf6sHUPzi2pQcSLH572bBhsniTNbKH1YSC/xHZ2LJh37AQpMKjrVQbUlb2xf8KbY6EF1WC0CPdXVwpOLgURLozBMwSOsxBfn/PCVUPqT49YeQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=N1OYMpbO; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="N1OYMpbO"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86135ae2a29so449682339f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747072304; x=1747677104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lWoC1lCrXHFFO6omLxp3utDb/lcuU0uLkB6bUW5NvT4=;
        b=N1OYMpbOXTxEKmDRykau74cO1qqkRsV5llG09oh5rUT2zEajWQR7WeaDyseP4AqZfX
         iCC2aCsW5jjHDSD2ELa05ViKM5vtqoktOAZR1uG6yQnMGAt6lHqfxkEaTOp7EFrVr00G
         9SyCrnMB26ZeaP/0hqj0m+XUztgh1pmygoSZYeyZU0ESJVYtDmhu/CHu6e1VrKDdOKip
         yxehjP6kQIvL5FEPzpC70D70COo116MO+mAYrw53gtRkAoX96+bLl2y1y5pdf5VW2P0z
         pP45IJpduJHLdZw3iaNYxMPCwPe7c6BgfUDcUFGgkanip9+RUyWL9DIHr9MsOEiSyEPS
         lphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747072304; x=1747677104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWoC1lCrXHFFO6omLxp3utDb/lcuU0uLkB6bUW5NvT4=;
        b=NWreIt/qZznBNo/DC2um4V+DOAhQ0lFrlUfx39nXk1psA4iYpslLpl5YoRCxeAgfve
         ZHrF1DMlc6pApUFk96kkToo0uXyI3nQAsHmbJ0ng0Cxrp7mVy8OCt8q/Ogjpg+MgrAhG
         qsLmj6YjkeqrOI5fbaJfnrruRO6NBJbZXVBm2xxv5f3ALeWr1DVMtOP62ks2rW1WsF7m
         mfaC2at/ZUsjKLf+1CyZhTufmCQWce7rnd/jefAvqz+ndd/CbSkrkxZa6W+VlMfLlHL8
         F3DcMwwYQ5JRMwatY06JolMmVdW8pLHgZeh2E8hkECHggmdzM4V32hWbJhjTrVEcNdGq
         1wzA==
X-Gm-Message-State: AOJu0YzdjAfTES0Hi3924KZ226xPXCj8m8tw3pmwpbpRB5wa5tevlplg
	bIRy+j96EOR4byePJra+fY/Mgghfe96Kq6S+4htKU75qUuGhFYVcI6NQqAnah/ONusidYS3LnM5
	0
X-Gm-Gg: ASbGncswjxzLj8jJlmzBhJAANUExT3G0x7LECUjV7rkoSRdC6Evk/sloYhftpaOSZh1
	aiVAj/c0Zi928Jt8o8y83mKWTOLXrzSSGXt5dGaBOc7FyDLhr22cu3whTniOoYDoiEkY81yEp7Z
	HB3F7g8kgv8NWjKqxBppsVngCGnhl7TFDdIeE6g8/6wZEUIaGFiaZxIEEBYWNwCgqkY+YcnOzPw
	nQN8TRrzlnRXejQ/cdZJnBQxSB2z4IKU3hp7ENykQ/2f8ZpjQeE6DTsugcAS72cafaS41/BZHnN
	CmwZMldmATo1fW7qFZBz1AlFAkE17km9aTll36IzL+57HPNBJH/QW2h/7A==
X-Google-Smtp-Source: AGHT+IGtjQ1AmbAz/kSg7rEWC+9Ul+Ugu9fwzhNjoYzj2fulVV2X3adZqZ4Hz4qlO/mT6Fqqc2Q8RA==
X-Received: by 2002:a05:6602:29c6:b0:864:a1e9:f07 with SMTP id ca18e2360f4ac-867635b5801mr1799788939f.8.1747072303748;
        Mon, 12 May 2025 10:51:43 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa224ddf3dsm1721417173.45.2025.05.12.10.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 10:51:43 -0700 (PDT)
Message-ID: <41a03848-7597-47f9-96a5-2afcd8c70751@kernel.dk>
Date: Mon, 12 May 2025 11:51:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the block tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250512074029.5c7c5392@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250512074029.5c7c5392@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/25 3:40 PM, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   3bb6e35632fe ("block: only update request sector if needed")
> 
> This is commit
> 
>   db492e24f9b0 ("block: only update request sector if needed")
> 
> in Linus' tree.

Indeed, that looks like my fuck up...

-- 
Jens Axboe

