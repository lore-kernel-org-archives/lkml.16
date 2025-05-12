Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64A22A4EF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061869; cv=none; b=E3UEYoxsNPwYAON8ZlQZ9t3jlA7Rji5LtDCvcjcVYOxOGKO4Kt0B1+Tr4bWotgrBukkVk3/dqh8Yj+OI2ObqBW1tvPqx2TuawjsvgAdvb7H72NqlzLuEoyvYLNXpaxAlD9mtbTx/zp/XgeYga+OiZ2dfzOT34us04TmTErC0lf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061869; c=relaxed/simple;
	bh=MkXTb/ouK8ImRYD7V2/UgcaAK97B5qaOZF8+u14ugQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ks9NuFH2W3hJGg1ZYJDTlzWwaQLVmLzHJ+C+TES/U6w9rS43usK5/iTMn7Gwy1NB57GGb42/CIZFS+uhvwQHPmf/auPCqFFkrGZ8PxcOP+p1eZHLlrZ03rzpG1qdcYB0toqIK7dYX2poUxMxO+2IcJX4MMOdxyyYkCaAsjS6Q9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=B+YT/aqC; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="B+YT/aqC"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d96836c1bcso15855835ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747061865; x=1747666665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/4wk+jR1ilnOhlUaGH75lGZX0qYzLDVs/Vv8i0phPI=;
        b=B+YT/aqCYsLYx1r/Bw1xeoc2oGzx5ufO0Vq2OVpZjTaNJhWW+QW03mL1qZLuHjYZrr
         4sQPRBtTQQICLdJzdqmXlVCzfeNn+AlB2wAsMNOMKRt9+u9CXHLZQIZfgR8ahIMUYxdF
         Ye08tCxJclTqVVGFo8l270oM6z5cihRtAVqmL4NHfRq3tQ1695eQ6m0KlbMiqqtffgdP
         JpaDyCh28P3cWBT+IjkfHPrJThvUJBKkqBVHw4HEG3zNiBPtAiiJSj3IqJTDtkdISWxz
         EpQFqqID3YRgIoZezIQG3c7hZxkt3cquptr1+zivHRLEehCaf3BvMw+9awIgdqO5QctV
         6MQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061865; x=1747666665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/4wk+jR1ilnOhlUaGH75lGZX0qYzLDVs/Vv8i0phPI=;
        b=ZnvArQodYMoV8cSR9s7h9Yh+50Blw7uhGAsN8B6sQf+tdT5YZMi338Nk6PGwM93XVe
         m5ZDmdSsbpW/O9o6uTUe2RIcE5MkjOdtEj1O2tgKMxeg941Q4CIN/jmGTC/AhYZa8EGR
         Mt37DOp278tRZKPyO+WYLlo6RGr2L8GYRwvUbm3LbYu1rE1aefefXyauO1OBkkujjLQN
         a3ZNCJ+YptC0xisuxCWwqLgrkVw1zmshbIozmtnVYUre6PJNchVgKoESQ21nZvz8nE9o
         Y/OQX5j4IeihHrQpX8+IZM+YhhOlXOqGdOf/qA2vp+uu8UUy2/EtzHG0eqPDErLLHE3E
         G3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVqrymdj3RlAcRQ+7HlkpJANHjHMDPi2+adDAgDtx0xItP4ed1j1K9JRUPmkGlUwqeITNVuwdbLMH2Kkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW+E00ajeonzTBoWW6UfpYZydkFQkSDMVJsgrYu7SziiAmKR1Y
	4CC4Ej5HiKO25oV3eOF7hWEHfsEc8R4S0bf1q/wFZSouR37bxgJOyaQPBbWc6IU=
X-Gm-Gg: ASbGncuZTHC3p7irzOOUpqRSenQwZI6Mnyj6bQyxURGA3VKLfeaWxRS+F9c6mTsOzlB
	eyidl+z6DE48Sc0rShHCIKCvQy3ngx0JntpJ78Ntdss2dS5qBsoCq+L6zcKZpr9jKWb6K9pKTLp
	neaYKS/geQDNFJH0QMkzVT+l0VscjSkMq/1H9SGOFhJ7wR9bv1pFrKNTLxeNtQDmmBLIBEqB/Ee
	bf9393+wXIq9qBhjZOVNXPcmK/ommE9AtCEdTaJLJ+hmwV51U5sSwNAES4aT3JqKmgXRsyIKbDq
	IunIQmd44EIRYgTbmEAyFjLGQPGEZz6b5L2DtLGFWgJ9YUs=
X-Google-Smtp-Source: AGHT+IEYhP4Dhkh7U8xot/WMbpJ8LnG6/51cqUzpePkiQEExDmXuRz8k3Yvl7IIjamdoaxz92kOu/w==
X-Received: by 2002:a05:6e02:2489:b0:3d9:36a8:3da0 with SMTP id e9e14a558f8ab-3da7e1e2459mr154041565ab.2.1747061865256;
        Mon, 12 May 2025 07:57:45 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa224d8beesm1679209173.30.2025.05.12.07.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:57:44 -0700 (PDT)
Message-ID: <89a530de-83a9-498c-bc8b-844ed0d183a7@kernel.dk>
Date: Mon, 12 May 2025 08:57:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] BUG: unable to handle kernel NULL pointer
 dereference in io_buffer_select
To: syzbot <syzbot+6456a99dfdc2e78c4feb@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <681fed0a.050a0220.f2294.001c.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <681fed0a.050a0220.f2294.001c.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.dk/linux.git syztest

-- 
Jens Axboe
