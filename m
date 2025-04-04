Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2561B2E62B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743805629; cv=none; b=N4DOnnuNF3I1v2R/a+ijXyiVnFGyl0wJ8sj0X8KNT1zdL6bwXRXH93XDPrcjldR7qYryDbhv2nEFB9BtbYxR1VQNhIJrT4ZcgdgbIVj6LD74h+wwEM253YGRDquIg93OCka6jv+t67Zo6k9/d2JNrGpT+hJvhcesdtG6XQk+a/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743805629; c=relaxed/simple;
	bh=oDB4FOmqbfKc1ikhTffNPxD6xNsSA0M2/yxz609lUHo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ZKirvpD5+PIA1sEXZtBaXB7v+7XjZH/BZod45v2LrUHM0oO+4vwR6tw4DIRPTA3lwFJuZ9FBlxzd5gVTvXMwHofs8kpPdJDIwVFgn6KK5bjtxkpqjqxD00HfVYuMOL9iwSZ05B12z9QfGxpASJqT2i4jorUkn0W3jINW4ISYj8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Oc2ZgsP1; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Oc2ZgsP1"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3ce87d31480so13595115ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743805625; x=1744410425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnXKzRjUwS68PKHOAd+R3tn7FfZvEPjHDBFqIRHSypk=;
        b=Oc2ZgsP1KxpZcBWhapIzaABigJ6gIUGMVqWP0uQvBa6RGvgAUMWpdo2BK+IOyEWchP
         imgfJLcAVNucBoaY6OEgRRpkdGzTwCH2uQ3MxeUGe714bB79+Zjf0NYqqwyGBVrbFCFl
         LEjzR9rsaUV4+wON0hTqfjvkWU3jIQ3t+8055FmJbuKMAKRvMqhYZuiJSN4pekSgc6MN
         QJ3c6xtSzZmvwDaUY7HlqGXCt4Z5ZhVq+QC6YTYBe+9j8SLWY/NV2yw3PPMTF85D9uO7
         jcmSnEd7bmyTCxno4Suk0sAHAqJn5XC5B7HrEgQvCz/HTkTHeJO/mRkqY2MBfCS2pOYx
         umBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743805625; x=1744410425;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnXKzRjUwS68PKHOAd+R3tn7FfZvEPjHDBFqIRHSypk=;
        b=Gb0Rk6W7TnTqenU/Vs4H3tszQO8Uut64cvV9MJsNkTuLq8p7pl71mMD1pNifNrI/oI
         DZQgeU10vY6knnY4R8xrnUnV2h0+Uwd9b3dp4nHTJFjkq/8hdJqKaWANU0E86M1Jp36o
         K2shTvx0FzFbQWyB7vaoY5xI6194MaFs2nHTlM0yD/GuDCAG8+NFEgE1BFkvpstx/+gQ
         iF1Q/VT1TRTEVhx0sbS2vBJ1oF3yJlSD5N+wuqo2f56Xxha/BBCXI6xzgJC2ixlDpo6O
         RzI8RAoiompAlDXwKQ3tYURVw0qwuFq4GxmbfuG+64JIEPIn4UUXKZksI9HZAzwestt4
         KEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFj+1ncxhQQEvR4m2fHLCn9FIy+XKhWF2cLF9ImzvtmwAelc9CGLKRoK3fGMTNpvDZeGWOj7JtqfbwQc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFbYheXpRiQZ9gkHMPXq7T2OjgQadPHs6cQrsAGSfmSOA3WtV
	UPnFZZqe9IcjdJj0zoRfvkUmR2duDOtQnD9m1CwEf31EkpjGbytFfMuJ7sMdiFo=
X-Gm-Gg: ASbGncs6KVZvIm1JjTKz2Wkd1dGhURg5wSoA8NfN81HOEZUsLahZMJeeKkX36VyDCJs
	o/LEC7ikG/vcm5vdufT8g6Ty4qIK4eTsVqVGoYN3k2cSWZE0H/E/OGB9kXomdDkqgB82ZiMhNx9
	rV0j+llA0ZmPJsuCkwenXc5+fdIvETMr76MKfEKZ9KPJQaoYSxqijxjWrrdfF818sg8dHMUZSzA
	llJbaZKf3CDwVw1FKKHqZTP2k+CahGF6MzbBDRuLuXr0NRXZwkn1djXVqm/U3696+zVWFntGfT8
	GkiL/zLFBR3dulotxsKxpLuwP5Pc9iVpwAzRigsIjg==
X-Google-Smtp-Source: AGHT+IEgfnLlKAzuh1GsWc2Ym5gBelLO47cG+8FB7ArPAEAWjADWt9YtIwfc3C/AqJZ94vb7llKBhQ==
X-Received: by 2002:a05:6e02:338d:b0:3d6:cbed:32fa with SMTP id e9e14a558f8ab-3d6e3eea4b0mr60058395ab.5.1743805625207;
        Fri, 04 Apr 2025 15:27:05 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d6de79f182sm10348915ab.4.2025.04.04.15.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:27:04 -0700 (PDT)
Message-ID: <7472b072-9c08-4e5a-8f16-8a56647ebc9a@kernel.dk>
Date: Fri, 4 Apr 2025 16:27:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [syzbot] [io-uring?] INFO: task hung in io_wq_put_and_exit (4)
To: syzbot <syzbot+58928048fd1416f1457c@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <671c817d.050a0220.2b8c0f.01ad.GAE@google.com>
 <5ed947b0-5762-4631-8633-b737bc09eebf@kernel.dk>
 <b51adba8-7722-4f74-a865-47bf1638820f@kernel.dk>
Content-Language: en-US
In-Reply-To: <b51adba8-7722-4f74-a865-47bf1638820f@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.dk/linux.git io_uring-6.15

-- 
Jens Axboe

