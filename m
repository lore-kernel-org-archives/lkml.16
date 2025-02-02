Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707921F542E
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738508742; cv=none; b=oI9ODwo02uWOhuGUrJI8tWBYOEbdDL6PlfpMIxwwGo/GfCi6yHiqXsfE0+TkX6sWx0Y0QWHadYWCt38Ri6C8FDdAdfCgJMKmRyCGm1Fj7cVR5FrHGG+yAWB5Q4z2V61yzqkLVUhwg8FzHRYrWqHQpmXdW1E9Vf+wYEaj5ZlXd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738508742; c=relaxed/simple;
	bh=tEZLqYG5g2vAHQTRfubUjbbA4RIaMNwVte2RpuiwVqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9YscOmtMciN33JDbFFRiLLSU33KVYY+ker/bjyFe6EfLT2l5h42ztzZvierD+7+BkZeaKbHvSs2h/CP63DcGhWDAjGoyENyZK4lkp9P7BsTmmna9MF+bVRxHowG0PMpeih0llWv6eFMeGQxmUBAm7cCk2aAcA5ZGeUvrCzUjkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=bnnmZcLb; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="bnnmZcLb"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844ce6d0716so263310439f.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738508738; x=1739113538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsPzncwIigCJWeSgsuG0FXasnz96a9gzn6HqogWWQug=;
        b=bnnmZcLbgzNzFassJpeNCV2FiaSKeLCcirs5yoj2Q1WLUc6cmnew/0brCNHMUF1Rkm
         pSMVibF9i6rAaEMBrS4s7+nArNhzbAvihk5RCYq29nKtwzStt+CVGlh32EpQ+detJprC
         kyOhC1kIf6IgEVP5UvWqyfpv4hx58bPsms6J4h3edoV+oVzgAZWiD5eIzZu7Wc9xWUsO
         oOxOnOrKA9dGYVBXmTf8HtAOysYcvS5UXc3zpCYtK0vQPoqwLP5JAx283fwAXvIaEFCU
         YDoCbgPTvMnwdSqwiFE96aJcbF9OsaJY9S+AuM9n4QZ7cl5rbbycZNq5Am7wa5LmuYeL
         4szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738508738; x=1739113538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsPzncwIigCJWeSgsuG0FXasnz96a9gzn6HqogWWQug=;
        b=u+06JuujQiwrAPsdPE5nT4w1Lo7sTZvN/lHTt+FOMgu6VDRLOrH1QY5uLdMboZhScl
         YUdG3eGZcqLXHqCtGADCBDxdQyP+u4ETfY6/KWptB1neIPSWNSMawqYrOy71hP8tAm1c
         hSo2xujQtk/8mW1XjfvweolZZvBDUcqssk2KrkS5fQhsB+Tit+bS6sMfQqXuA4/5u78/
         clFfVSbO1viYCNooklht/YCvTmwRJs6LUsUcN6X+KQ5GnBnvhnYSgMn2gBHiBx2lArig
         8vTRqFRZMqsey5h2hOf41H45/AHcuuBTYUW+hZnCaV05BDt33ZhELbAoz42faX5TLfme
         U/hw==
X-Forwarded-Encrypted: i=1; AJvYcCVM0Pt3euuoWMGH2khQWFVV/HKhoglRelgG3+OlaVzhuXP/wuAzKMQBWxXELck1mERJj0hTVeY2LsKH3+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfLUinW6zmCkN2bCacL+wYYPGCcNfHIw0xJzSm0tPzcPovCv5A
	FbrkTFfk3QD3g5jEotS5/Pe/aPUwVJ4Iq8LElPtooDu/i2NKPL716tj8U7sV7ls=
X-Gm-Gg: ASbGncsty47AGAlCPUC+oAxBa3Nfr0BksRD7IkOSubahfrt7t9RyrIGX2L5odX5uFo3
	DJ1MFEsz7zpfXRMTOetC4zlx1TGtjY9NziPIdr6uC+zlsPr7yS5afDiJG57nuulDw4nqeQ8hwyZ
	vIvqkwFYJn1fSiF6th6vWpbp82sbLZHMpH1P3ry84Xptgx3lb3DPdBGu0bEhB5qomw+21ver5FG
	LDEwM0GT1mrLm98m2hteSePENdY46CvDkLH403PWK2J/nPrDeAkJTKAu3rLa/5k6RLwgkdoAH+6
	5alkt1HAVBop
X-Google-Smtp-Source: AGHT+IGtE/JLqI8S9p7eRdsRPG6dC9TP58pGT88bNKePz2C1yiBYPfCn5bRWwQVviJy5GovjAgOURg==
X-Received: by 2002:a05:6602:380b:b0:847:22a7:240e with SMTP id ca18e2360f4ac-85439fa6279mr1766967239f.13.1738508738494;
        Sun, 02 Feb 2025 07:05:38 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854a15f8394sm204030039f.11.2025.02.02.07.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 07:05:37 -0800 (PST)
Message-ID: <8f039c53-a35a-460c-a0ff-43f592caddf5@kernel.dk>
Date: Sun, 2 Feb 2025 08:05:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: apple: rtkit: Pass the crashlog to the crashed()
 callback
To: Asahi Lina <lina@asahilina.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250202-rtkit-crashdump-v1-1-9d38615b4e12@asahilina.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250202-rtkit-crashdump-v1-1-9d38615b4e12@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/25 6:48 AM, Asahi Lina wrote:
> Client drivers might want a copy of the crashlog to stash into a
> devcoredump blob. Since device memory management can be very variable,
> the actual devcoredump implementation is left to client drivers. Pass
> the raw crashlog buffer to the client callback so it can use it if
> desired.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

