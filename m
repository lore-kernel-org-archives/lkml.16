Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6B2AE93
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738527753; cv=none; b=HPieKqx6iRj7gb8FeYa8rnB16HazUUBQr+Bts1a3PU3J6vFztrLxFnYdoYWv3ypqUAqg8OOPiCr+yMOYqq8ZPiWRa6m12e5+08zptIIpFxr3eLT4Ilu9sJJmoNYMmUIvr/F6NRXr5Nq1gKWrl89qDfze7R758QUnIQ3/Xtx0wic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738527753; c=relaxed/simple;
	bh=X9K9Q1+9BO/6T2Eh4+15ZctzVmAxNe5f1TUbVq6NN8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ma4tcF1ZXJ+OvE2fOfUgQl1ovMK6P8ounG3vS//vhAvGx2VPdS0K+UstPShEyWBUVYM0Xy455PpqMwJlxEib4hQ+EqZ1crWn34YxCGzLolN/Dg7u/3bbauH0R0S+8Cczjq4wdPHlaA1z0/sIU0qVQkDHv0a87VItdMes0oVhjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KJPh4+Yo; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KJPh4+Yo"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-844ce213af6so102037139f.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 12:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738527750; x=1739132550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3g+m8stdINBWKHvUA9tWQRvbHUhD3fkIbHGDP+GJloE=;
        b=KJPh4+YoKREnjz74tFSCuBNNfpaJcdVNpqjUh/Zl3T2fVE8G6KRNSG41sQVT3j51oJ
         xXO8xawST4EGNygiaWhZd3dL4v1FE6LWBPIdVIT5d5bFTkzn9FGEZzGHlixHylQh4q1d
         TtErAdPoSDFrf8hWWJWpnbaxGKmO/sRz0hJvr59o7XYrhZi/3r7SGJ/sU9xZiB8x60nw
         Q33jn/AdbreZ2Lqvg48DoWmp8Vuj4XbEnre8i/Pu5oHYgWAtzsEQThpJWhC/FtAscDAS
         DAHVqKz9xfEJOpFAHfMVbaFXJrQSJjKsihqNtRktOg/A9ADEmPk0rakL4XhvT3jtPA++
         fY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738527750; x=1739132550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3g+m8stdINBWKHvUA9tWQRvbHUhD3fkIbHGDP+GJloE=;
        b=JgshFFCQy11KXiyqlzhOwpTyk/bfBK6afWnYXk2xzKOWKdI56epUC0VyAZLdbh/O1i
         Yavo9hvfYVUPFZRu955q4SvEXvCiPzSh7AbN9xGKdGnkAZnJHFCZFdrgIZ9ilCqh6kZH
         lUv1USmhYaN1BjYmX3awcHQikEqcqdnexHhRVIzRz17ccuMFq22ZHEc4qXbG6X27DTZC
         hmxJaK9EuAEcgUG1HUfsvfJipzTs4jvQCgoSbnkHlR1D8iy8HxBs/P/eOxJvrt5SRZwa
         CGPexFFcj5JYyv1CxaZaBtOI52zTmo4EkRQwcSPqQaMQxNK0Z861qM/XdM44yKhVgHqz
         UOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTyyU5pyebXIc3nMbgC+P5Uqkr4KPY4emu8bQVibuEV+Ks2zfxA2cBdqqcK5j9RN7uyalWrdDp9yRibkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOocVP/s4TjYQUf02k66mgf+027dHaIfQROB7y+GIrIGUNUQ9o
	ovoa8P8n1zAeYG0I6cQ2hPILObRgFGcLq0sIole/XrH4u4L7HBcbuZcv9tLqwjk=
X-Gm-Gg: ASbGncuF4iuNrucjJLU9QmGzC8TpzoZbAnlqtB+QKJMjijMuLQvKBZchPz06OfpLyF+
	/d+hbqtc53dWU713IrMLqU2mIY9mQk8gPOVy/6jy93Y6Ry2uNcxPUkiLpu6A0r5yfu5Qnakh5sd
	ErawMTiSnXrWSuqmpR69P63x5GWXZ2xCjcSswnvLHQl3SacLNtx3dNabBlRUBctK9SaVkPVol93
	UTqSAfPr+ey+9Q0oAp94dMOXG3vLPCOpL2gL42fncGe65FhmjtJUpWjRJX/gZsF4re81/DnI58P
	84MhSh2OnXM7
X-Google-Smtp-Source: AGHT+IFBeslJpzEmBM+/9hxQol1JOa95LtjP38SqN4G7Wrd1CKB6VYQ7ETypY9fvjl9B7xf34r0u6g==
X-Received: by 2002:a05:6602:3685:b0:843:e9c1:930b with SMTP id ca18e2360f4ac-85427e11a29mr2018349639f.14.1738527749893;
        Sun, 02 Feb 2025 12:22:29 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854a16078a3sm202022439f.19.2025.02.02.12.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 12:22:29 -0800 (PST)
Message-ID: <4c191b67-21b3-48d0-b71f-cd738259df27@kernel.dk>
Date: Sun, 2 Feb 2025 13:22:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [block?] general protection fault in bioset_exit (2)
To: syzbot <syzbot+76f13f2acac84df26aae@syzkaller.appspotmail.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <679fb3a5.050a0220.163cdc.0030.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <679fb3a5.050a0220.163cdc.0030.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz set subsystems: bcachefs
-- 
Jens Axboe

