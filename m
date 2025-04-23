Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A022262FD6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745439044; cv=none; b=H3T7IjHIpgDFFr8bDPPViETG+FbMJmhwZLHjsKTOQkq0YrQmuW7A8cFk+sQcrLRaQCSNA7VsTc8r3QwgnY53OTgWvnXJVME0JfVwLr5/pMPtGmKDZsZeFZDzKIMOYH1kE/odaZGNngFHvWzcpDSdDmvvRYHMmK9FL7AGb5WEX2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745439044; c=relaxed/simple;
	bh=HqIXcWpEBWid+l2OiDQI7nWiV0QSluTCCJghdbBX6dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCQS5j0++GjSpmf0A/GoAcSyajCjKKIEroN2BXxRn3x4pfFAG3MVQ1QEYEG7qnHtaZWZhr2/nZp8qoeJLfVQc07/cTtoBVXfy86z4XRIrC6zOhMbsv0LQMqDibGH5pxUIY7j2/+o8ZYVCk8R3NRJZWmAuSEpK+dFM7dbCnKedLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MiSEKTvM; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MiSEKTvM"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso10179239f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745439040; x=1746043840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L4aZh75tam4hiDyoi4zEtwQZvmp/wQknrw8epVfbLHc=;
        b=MiSEKTvMIqJvuLqLM8ajCEgcpuFblwLhddbGYTD+0ZyEwTtdzaM4wOxWnJJGTdStVa
         be44CH4kCK0LAiNcnuHrpfOFre4rrr/6a3IiEZ82IsLrPuv0xoDBGCIIZVFPOtIsXce/
         59gTEwf3UwF3BL0tud6bVFy3B34ri9TFotChK5qS/zzxaOZo/m7oIFhnjN8+uIz2NyRL
         OI+QHF+VzjneNrt3MRHizQgE1+eu7BdablOCF3awH69JvweN0nMIUVKZIojo7sDao8VK
         hs/VopUE7XnSmod6rEMN+Hhx5QDs0E7pIOYfWerTVXYjU+e+xgZ4EB2NCp8bRP4vrOeq
         eVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745439040; x=1746043840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4aZh75tam4hiDyoi4zEtwQZvmp/wQknrw8epVfbLHc=;
        b=woSSwHuNM+E/OVYYN9JC63QbZcpbOcDXwj84srWBct1nvGw+xNzH5eyEqYEXXooWTG
         ffBMHT/YB3LLadI7+adsnoObBmDM7MDSQ/2JQzBNJk77B5HGnX6qARdUzb+5zDaWgpit
         h33j97N0GPbGmGEJh60yr4ciHCpJdmLiIvaFTroU24upIdVoc3rUymVU9t9FBohAZkwy
         EPYLmdE89y+mb07vYwB6aDbZKnbKGzS549CAKHezPX9YQyI9QIn2CA47siTGTyzMrfHU
         cJQ/q/9XjZKrhXh5ykQt6Ffwfu6w7fV02uW1/r8Oyof/+IrIxV42oE3KderuMEe9OHxD
         XwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN854KAorqxgwYW1PTgs93nR1CD0fcu2IyPUvOvtsUdDQB9+f3DRwuUpOnmjFPDVdyuHxsoWxfEDNX6ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMY8UqUjL9pdNFcJ4kBBzsw4iRZjRSoKjfkj9SrVEK01dXMRnJ
	Cp8rrwtXEgaptijMDaicXX8Lgv1CpuAm6Epsu48OSE6F94NPiYKkwU4cAtMYh9M=
X-Gm-Gg: ASbGncuwFVkUv4PP/GJNtS1bd+NYuREhK+P6dP2lbZsPl0x4MbYkB3+3T5PWidl8W9y
	8dSv/1AV/YY5PIsZ5xwbQTbyyl8wxKwGZPtVkysqNrdrDAZh4O8W6ipFvyzY5aAWaOLCjmnhDa9
	nGA1F/R66M5dcEPLzRUDU4TMVI8/7Xn5o+6h+VuGHxo9i6J0so2P/9rxi3aGfx1hWErLhzLvCyj
	bA4V3doyKVJJ7fH6MwSxvrTebLENQvt5w7Up6G8+wAmYTpwlE6TLv0HlhGXLiH1e6FBbnONua70
	bG6413bOL1I/Lq6zF2pR0UMA+zJaOcNtec9K
X-Google-Smtp-Source: AGHT+IHUo12s5KpqBhFFTUaVnPuLGTIq+azon1loYWCZ4jeC2mqhJUfYZKyFttdMlmM23xuFgMyaVw==
X-Received: by 2002:a05:6602:4a08:b0:861:d71f:33e3 with SMTP id ca18e2360f4ac-8644f9b422amr34522539f.5.1745439040629;
        Wed, 23 Apr 2025 13:10:40 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f6a38383dfsm2918100173.70.2025.04.23.13.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 13:10:39 -0700 (PDT)
Message-ID: <c3880483-7cd6-4151-9af8-f6a1be9977c9@kernel.dk>
Date: Wed, 23 Apr 2025 14:10:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] splice: remove duplicate noinline from pipe_clear_nowait
To: "T.J. Mercier" <tjmercier@google.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250423180025.2627670-1-tjmercier@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250423180025.2627670-1-tjmercier@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 12:00 PM, T.J. Mercier wrote:
> pipe_clear_nowait has two noinline macros, but we only need one.
> 
> I checked the whole tree, and this is the only occurrence:
> 
> $ grep -r "noinline .* noinline"
> fs/splice.c:static noinline void noinline pipe_clear_nowait(struct file *file)
> $

Funky! Obivously looks fine:

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

