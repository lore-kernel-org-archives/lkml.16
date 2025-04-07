Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E70186E2E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034058; cv=none; b=bEjZmCk9cbYpeGdqYqZZgSIMUs4s4biiHsbJqg3q2e8IwV/d+gLGvU/5VcGwFNLX5WBvrKtZM3jZBqfeVQ5lNveGAw1J8W0JW3lGwccOpawXdBFyg+4+T5C88zRYn99RNv3zoXdZw4IyUyjhovj5h1kI4E7LnFxjfgB2v7ByvhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034058; c=relaxed/simple;
	bh=MkXTb/ouK8ImRYD7V2/UgcaAK97B5qaOZF8+u14ugQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b50bnkxT+MVP34mY4OTmJyHqG8o7L3Ebz1EMD87nVkBNIA+Fs3JPxF3CfQKxAiJg6zeIp2UwfCv2+WGpsGUFfIIsjxkI61eT8f8fDYWJr8c8fwZ2NtkcuEyK8Yh1GKlKLZJd+kyhapiZRcRQ59B4Rm+UC+ByE7D4YdZdxaFQz3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=wDyy1aqp; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="wDyy1aqp"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d5bb2ae4d3so14469695ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744034053; x=1744638853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/4wk+jR1ilnOhlUaGH75lGZX0qYzLDVs/Vv8i0phPI=;
        b=wDyy1aqpegNO6c0N1HRaCO2GPRGZlZXfygkIKKJLmJrj1J/neJQOY0AXnqkr42tqvW
         zHxWkoS+FsXQ6NVNpExYDD5veBsCK0Srk8ntEIm/cvq7VHkW2xJCkqW6qT6QMvV/NmJ/
         uPkpLMoVqaLx3blo0ZA74hZJmIcHH/SPlADqJHrscGGbcJMphhzmjCYvi5MGgO0d6g/t
         yi1NktQMS+NssAVjgxjhiqefsCqpeSlC+aZVZZRcGyUJQqBs0Aib82eh0Lairq1fByvD
         D24E9Ey0fodE5WcT6uQKcfuePYhPOge4HGkUCcJCOeMkUzbadmhagE8iZKlfboiZ9/Jz
         blzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744034053; x=1744638853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/4wk+jR1ilnOhlUaGH75lGZX0qYzLDVs/Vv8i0phPI=;
        b=p5rWxy53HB8sM7NFli5hGPgHg/iA3aqckzKkRPXN9w+AO0KP6WEniQGWnYjmjBeWUf
         hr8Rg0u/9NQPjaB3eKbLOsqwsQjV4dEfYS1IeRTMUWe/La3HUwfrYisnlmhHltD/pmmO
         qZGgX2sHycH8o7AOtXccCH6wc0xRrYYs2vXHObqojr6WL2LEu5+yOhxdKwrEbtqU8g1t
         HV6nuXr9aIxvOaViyAs/H2XT4VEKsQqO7O2i2+VXmoeLCZz3sCg3DbxmqaywJDCA45H7
         5g+MJYXQRi9sLJpXiebdKzffvWX/6LBvZpHAbuGaogN7byIPV00dH6dmSwKRUQ2doolN
         XF5g==
X-Forwarded-Encrypted: i=1; AJvYcCX2bL4eNXP/jsekuPQeeTW+LSrJ5vkiDS6Y0ns21JOnUmd66sk9TSJqi//vhlcJ9Sgpf+RgAEz18OR62Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlsRdpCNn7m+KdTNj47L5lpnxMs41iBa7tNkgWrlcTCkRSe4DD
	xtNzy0Fbqa+cSMzFRwhlY+OnrRtmibh4Is19b3taiMl0Ctf91CH5G3Wo1w/YvOs=
X-Gm-Gg: ASbGncswVoRMPByJrp/yajiho+Tx8Byykn5a+fgGvzL5hvxe0/LXd+Hixi7FUfFG+bc
	lB1BJJ/EkeXCO5OdDr0Ucu7/6kk/WpZNvYwsyrs4wv5KMaTeUY2+yXmXOqVLjXh2e8az90R+fyG
	pMWDB7Gp+2sfkiXHDdWQzBTQ4l8PMmA/8/c0Koxlciuxio3PNogLHfJ5iHoZQ4oiHaj3nWmwi8A
	Wsg6XTyoeMhnXg2vBmr7H48XIJyqOuX43VwJZpuO0ecDyaT20bBylf66vBNSV8vl/5rSSrED4X0
	ggdP8nFVSNC1jJeT45JuwE7XOeIN4MjZpdwp/ne8
X-Google-Smtp-Source: AGHT+IHb+OE41VXBz4t2l0EPc4uLAMG7Y/fHmBTo9SI33zVc1xF3i9oLWho7ajI/jcyykBC9Kfan5A==
X-Received: by 2002:a05:6e02:1749:b0:3d6:d162:be12 with SMTP id e9e14a558f8ab-3d6e3f8e08cmr151979105ab.21.1744034053439;
        Mon, 07 Apr 2025 06:54:13 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d6de7b9b60sm24637645ab.29.2025.04.07.06.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:54:12 -0700 (PDT)
Message-ID: <7bcb21c4-4ce1-43fd-8adc-c22684cbf0e7@kernel.dk>
Date: Mon, 7 Apr 2025 07:54:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] INFO: task hung in io_wq_put_and_exit (4)
To: syzbot <syzbot+58928048fd1416f1457c@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <67f1224b.050a0220.0a13.0239.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <67f1224b.050a0220.0a13.0239.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.dk/linux.git syztest

-- 
Jens Axboe

