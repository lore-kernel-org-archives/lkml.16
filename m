Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D082B3085CE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286985; cv=none; b=D2YMOWjkXrYeevSef5WT7KKAWBHKK/V/BYyvhuDZPKN8GPS0NSJCcAwtbZpbjIk3VZOpzf0hr5/5ADUA2k7+afeJ53NvOeH9kB+JLd9Bx91LWBnCttR2eUbeISD7XNIm0/Ddawddv0O3qDJwvTiDrVIkQNY/ehKHGzaV62IfC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286985; c=relaxed/simple;
	bh=X0d4s7HeTNVWovwAH74ZIIwggrMKixXtckbV2OWRu24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gD9+3NpezUxdypcxdbZmxDBC35J7OYyD1k59r39l34jbZthlhLKrh6dA2EOQ4SCtPL185KwvlOZiY6tHXOBuJX6NZ1INx8hJ6XMPsK7F2dOG1FHlNiA8GzM/KxwLYh36dHD5iIUvGTw2QSLBWr+gljr2iL1TZ25r5sS2q95tLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Lo3upfFv; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Lo3upfFv"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3de1875bfd4so743395ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750286981; x=1750891781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lminZQPPyj9Xyk5IUElSQsXv7Gj2x9Gg1S0ldpt+LEw=;
        b=Lo3upfFv8VCnJAbOIDRr5BuV1QGCQBqYOAvsI61utd9nbO0fLtgTO+w/bWszio+NJi
         IJXFC6HK5jHr5fBdQwaYva/3Z9UTdq969mRt5pjAuozSrk6rYm+nraiDizd8bExW/YUy
         dnrSvcXhyJKdCJPAnr2FSzHjECCLXxI4WyWYXTLlyuu+9fG/bj0J6ebkA3+n2QtsMyjX
         jqKjU0m7jMA+iHZngyVYwbMnC9gmME6KFQ9E0SqawpQMy4eOK2IrR48xvL22fmZywaoA
         LiUDgyyR7RdmZUqxmnN4b8hYWT6WM05yZu5WFE7n3kzgQbQT/+hrxe+HaRTw8vVkA44O
         oUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750286981; x=1750891781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lminZQPPyj9Xyk5IUElSQsXv7Gj2x9Gg1S0ldpt+LEw=;
        b=QD3wakMqV18PBhzt+aDZ0tmknSyKjlzSDDeI/ro7hceaVvlbVVdIsncmNczErfIK7g
         2xu0vCneBy5gEpfT6uHRMPM1dRLsU+mVghSzZvueO/XEMEncEMg1EAL2u/EAYZ3HG2Kw
         B5iHJGVaOEGfxUWd8ddI7JOF62ShjH9TADNI8NW9biUju0udBlkxjKUz6yLN9NmUJvs3
         xMyyBbYRF+8He2qRGgNt6k2hVznO+CdTRnSH0f1lUuyDvNqzg1M350k99r9yBIEbhdaQ
         x+8Vho+0an2egY6A8MDZyeM9SGHZxJtdtWI7IHJmUwd83BnosexMI/PGvXnhCyLOzpfE
         gATg==
X-Forwarded-Encrypted: i=1; AJvYcCWACgLnZJy0Uim8cjmAoY0TeaUDmB29sDVFP0mJmiJ1FLxwdNVNxNH1a5L5QLoYs6UJpqTe53VjUOiP+m4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb9iIIsSNuaZBQeelZU2QScvQNsVovfGrbb3QXFW2lzr3ko4Je
	abbfCrqc8gid/bokBZKiNf3ZScN57f7zzM6HWhI/32XT5UP+lmC9LNNa7omy4aAsq98=
X-Gm-Gg: ASbGncvCy3FqErmg1Kd7q0AGIHsLYboIZbw3Kfldvy3hR/pRwxWB34DucWbbr1iv0li
	Mryg7nouRUCbBcLYU6Txznf+8cT5RKU4KotDug1xvHIGpjRRy41wS/GrYEXuHK2YzEpJNEMm8Al
	HkftPOaMqGcd34PhvF8i4CHXikjCVSYcJSwZ+2/p6xfyJxMKNgk4cxWgt3lR9XX6FaB1YfoJWRx
	FCfvjfu8Cv/p9f6bR85fjXVyKXOLSMadz5+KJBd8rUOxAG+3iA4qQHIqcRZdg4bS7UohudSwgAd
	/iNqcGj327l6WQuQc7idwbbiplGADUK7SiDqvuSERxvAolZeC0NQVmH2s08=
X-Google-Smtp-Source: AGHT+IEk94LemLuvdIphpLLJdMeaxHU7cEYtMO/z4TzslSUxGTcVr4jLjtqKgTJbF2lyHpLwEOYZnw==
X-Received: by 2002:a05:6e02:2196:b0:3dc:87c7:a5a8 with SMTP id e9e14a558f8ab-3de07d01922mr235146575ab.2.1750286981652;
        Wed, 18 Jun 2025 15:49:41 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019c5dd2sm33873355ab.19.2025.06.18.15.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 15:49:41 -0700 (PDT)
Message-ID: <32a733e9-935b-44bc-b507-f06b62ce5ce8@kernel.dk>
Date: Wed, 18 Jun 2025 16:49:39 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in __put_task_struct (5)
To: Andrew Morton <akpm@linux-foundation.org>,
 syzbot <syzbot+ca15a081ac6b8357d82c@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, bsegall@google.com, david@redhat.com,
 dietmar.eggemann@arm.com, juri.lelli@redhat.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mgorman@suse.de, mhocko@suse.com,
 mingo@redhat.com, peterz@infradead.org, rostedt@goodmis.org,
 rppt@kernel.org, surenb@google.com, syzkaller-bugs@googlegroups.com,
 vbabka@suse.cz, vincent.guittot@linaro.org, vschneid@redhat.com
References: <6852b77e.a70a0220.79d0a.0216.GAE@google.com>
 <20250618153137.a8f3937e86816cd9b7a3ab0d@linux-foundation.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250618153137.a8f3937e86816cd9b7a3ab0d@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/25 4:31 PM, Andrew Morton wrote:
> On Wed, 18 Jun 2025 05:56:30 -0700 syzbot <syzbot+ca15a081ac6b8357d82c@syzkaller.appspotmail.com> wrote:
> 
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    4663747812d1 Merge tag 'platform-drivers-x86-v6.16-2' of g..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1626f90c580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=d6f01a06a8393850
>> dashboard link: https://syzkaller.appspot.com/bug?extid=ca15a081ac6b8357d82c
>> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c9d5d4580000
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/ef27ce1c74bb/disk-46637478.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/2962783b1956/vmlinux-46637478.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/faa841f27097/bzImage-46637478.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+ca15a081ac6b8357d82c@syzkaller.appspotmail.com
>>
>> RBP: 00007ff5f3810b39 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 0000000000000000 R14: 00007ff5f39b5fa0 R15: 00007ffd192cb478
>>  </TASK>
>> ------------[ cut here ]------------
>> WARNING: CPU: 1 PID: 6071 at kernel/fork.c:731 __put_task_struct+0x340/0x530 kernel/fork.c:731
> 
> It doesn't look MM related.  Perhaps there's something wonky in the
> io_sq_offload_create() error path.

Yeah it's a bug added in this release, already fixed and going upstream
later this week.

#syz dup: [syzbot] [io-uring?] WARNING: ODEBUG bug in io_sq_offload_create

-- 
Jens Axboe
