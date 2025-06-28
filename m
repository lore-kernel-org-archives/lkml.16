Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FD9186284
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122016; cv=none; b=bh/jk/C/luUiE9NPQFNlwIo1qR70a+lv/A5In3eecdHQiJKMr3Z0NO0vIcl33XiqSQS7ojMJ8RO6ke+7t6XlcI9MrzF6zasTS9OCjAkORP8OuJgSETegisvYVRPPqVrILEclQiW4JwerCQjDZv9rCefu/QqKyOL51TWwGCjjcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122016; c=relaxed/simple;
	bh=i1UYqUWS1z5l8oNI6qpQNzVExHkcCqMY5wUZt+lKj8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PTeOLusvkPyJNWlOv+HrQUfQ08LZ44tn8tMrxcDCa9i2tlUKXj6+x8X6gIU//+nPyLox03xfkrO5aNLH8hbfkyMX/64l2CTCTl/ro0X/K4Bk/FS3V0RyAlJwYTHYVbko2+wZ1cFHzt6H18CkipxVv6rqVPDsXkrkJ1Hz6ocPoe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=IWll6KOj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="IWll6KOj"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so1088989a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751122012; x=1751726812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8sn7IgmRQhFHxLfJi8TyjOMjvLUVC1oE7kwQq0V43jE=;
        b=IWll6KOjypwTQRQPwW/NxfJtgNEh0Ms92U6m91kfKvXzzKZsholz43qlaaj3F7vzRZ
         NqC1gQHGmvuM6YPmscUwcQOP0x2P/mCym9ApyrgsgrPGbe5koO4UcERIw8vHJisDmhqM
         sSmlgl+CPfKw7+cyRdo1NWBMjgeLlnfW+kz7PjetYZpV3rfar0MF14S/kXAlPlkD9sKl
         +nojjLiJJnr4UVruAqADC2CZbF5Pr97aQ2cHyEpGkzvJFNsnET614G+Anl2oM1Jown76
         Kmo1rY55vzqF4F8GSGmSGGXIHg49rPDLjVoNqhO5+syk3y1lVQXwKm64iI33Q/0bDIhS
         tjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751122012; x=1751726812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sn7IgmRQhFHxLfJi8TyjOMjvLUVC1oE7kwQq0V43jE=;
        b=mGoVWWAtEbHm9MAlk3wh9h77kirXBPIzgNKfHBr23pSgKZrih4YCHzmi1gbQR8OW11
         7xELyxVJpTQBfqsVh8soSKfLPCRyzIbI5oQrTljwy2KKFYxYah0utyAxId9tzTkKmm+o
         UthpFYGOC2t8H/bjVUJuvz5vNoFDN89QW0S71IqS4zFLXpnSVEWW5voj+SD38gdkXIlu
         rk115RT7yRqHfNRE6vvyBdd+l1xsQF0yNURhl+zA+jbyJzbhCyOzevGtxSq8LPQxfXOX
         FDCMJldrxIZawJN1OaUcHIFO+UIm9/rzL2bzz+UrlplpX1l87XaHnFDeHNvJa1NaGhSZ
         oHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhfdNSTiEfVlay6AEyUwWdJPZEy3jOaz+w88Y4NmXxk0vRm4OuYEFNsTyxASrGCEM01YmhsoA8O/bzEps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPC6heF9xeBVLCFtQytRDJBntVZ9MF/FMn+izBB1TpybRj/5rX
	139U6kiMFN8ZDq0cnDcEldspmSJT8RHsCZT52ng+HRQ3Rze+8+Ib3pudi9dEgseQU7qwzW2RzGL
	0dK+8
X-Gm-Gg: ASbGncty3tdTFOhj96Sm9hGYoZKWOWbO56NFV7dYA5ymWp+tbL9Si997nzU601P5ClJ
	lZmEaPkEx4F333IMl2KU/FZbo6fpv3fFNyG3MjPrqSzdQ7pcOgIAeUpLxJY1JkPwMNX2ro96MQJ
	aSvMoQJXEkrmj7CVqn+wT3aS+M+1FXa15ydo8Pl/+hemGjsk0yD1pGUBFyiEzhiN0/s7lDa3FE9
	89XsSvp3TVfqJJcb7Egzr1VZeJdMMvgiM4ck88mCJzV8AwIA68SEw/rwZ3V0dKp0tN7P/FDM/xl
	PUwAxHKnh7m75yQOJNbDhByyX5nBZ37VW8wpp6D4XkSM3+ZJ/NJBcCDJgg==
X-Google-Smtp-Source: AGHT+IFJV7pYGQw7CBrSvBpWA+A+ePLIgqs+nEiHSfpTqKPfMD3FdnSJUodSG9FnstBtN2S4iDXH4A==
X-Received: by 2002:a05:6a21:38a:b0:21f:419f:9019 with SMTP id adf61e73a8af0-220a158ea9emr10109650637.21.1751122011872;
        Sat, 28 Jun 2025 07:46:51 -0700 (PDT)
Received: from [172.20.0.228] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31db000sm3804378a12.65.2025.06.28.07.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 07:46:50 -0700 (PDT)
Message-ID: <04e8973d-b591-4cc9-9c2c-52caa8889a2d@kernel.dk>
Date: Sat, 28 Jun 2025 08:46:48 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [block?] WARNING in bdev_count_inflight_rw
To: syzbot <syzbot+f37a847571460b5ac3e4@syzkaller.appspotmail.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <685f5298.a70a0220.2f4de1.0006.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <685f5298.a70a0220.2f4de1.0006.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz fix:  block: fix false warning in bdev_count_inflight_rw()

-- 
Jens Axboe
