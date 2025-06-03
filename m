Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F56C23816C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958495; cv=none; b=Z7fWJN3OIkOixFIYqVOeWTjADuzBy5FsBZ0wERATKC6eNI5Gxms+TV0e9LZqeztV8Qc2hQKwupu3gQE1naoaoLroyppbp8Uy8iBfvPJEQjj5cklz2rCrmlFm62ctJ9HaJGzRp6YPWuRkGfukdRugHpBjGjO+gfyhku9gMQFR9D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958495; c=relaxed/simple;
	bh=diENWU0rm8g8GWvSaCt5esaUVBjX44tVBHdazyJY6lE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IGMirIN7ByUb22cOMvnlyh2PLpJHok0z5PTtMyAHG2n/nJl1UoA5YFQhiMhXvk7wgwOWUF3T2fiJr8smGq95Gpoym9nNwKLEmG0xVcjvYR8cnNcHF4jfGJ0PnYThUoPBkF2iCWEOZaZyfrM66LgslOqMeFZO0d8wvQCi9WgXsLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ZKVPmdyU; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ZKVPmdyU"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86cdf8349ecso130977139f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1748958491; x=1749563291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZspdQ7EI0TACc+C0kgd5hGUIEk1smUx4AY7qpGGjV68=;
        b=ZKVPmdyU7MYV+mOwmEqngwkbiQHcugqDu8RL5QmSAhVVX9/0LWK1ZF8qOreUUVwO+0
         6YEiUDic7m7xMXsst0g2Bsq2N2ZWDV34Pi7CA7tsW4vyA2m5FbGOb7rx4FBRrmK1cdYs
         bizPvtFhZA4OeMcU7YN156B7y1c97bCsfT4eIILogxAgY+6SWWT4n1Y35MTvZp9GmR+4
         sZwFKfxmmJfiItpKhLZBcONMMrWy7JtC5CIrynRI4wviBo/jVTmd0AhNExBIlVbPQBm9
         xshl/5BrtEiNr5u6U5+jmJa1kLVhkQIV1uiWd4NgdlXvFOoq+nDFWMSPy6EqnbMiRLnI
         VE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958491; x=1749563291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZspdQ7EI0TACc+C0kgd5hGUIEk1smUx4AY7qpGGjV68=;
        b=CFbL4hWsyaxevulCadw4jQAAOulHYfpLy1O2jw6TxK8scbWS/PNM18GXFjatRy7zEU
         0ULfq26eQcjd7QYGwvBjDm9NtoJOJ3FgE/EvliL9FV7nwFg24puxxfSJCUyJeKeen7tR
         sNPi1R6YUZtJCz9Is3LxkqSOGzoZ+f0V31bVp9vfVQB0IQFvQkgdOsknDxdVOAwQVyBF
         CNRpug01EMFjtf/iZIvtAiUByLV53RMF3k5XdxkbIjCysUh9UyZw6gSEzmwI+LTGFBlT
         hwIOt3CAuT5CAdHmWt1O70TbN+SK4wLqFakzVP7UxI6c+xlveTE3lqyRbvXrGZkChkgE
         SHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2+JihZDsMjKURoiqbt85O+4R4hadmzbtEI6RZiO+NtNLAl4DSmylIt6unn5f1Hx+lHSgeuAgwCVgEI+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQE+k+GK65U5VhSMSOzSimyDpu5dYWfCmkiAhn17EPU1kc5pwS
	NGsVvBCREINoeHlDgzEbucovFOQj7NCxCRPxVnBUylEg1N75mfJpR5YDJPKXCJ5jzXE=
X-Gm-Gg: ASbGnctjXPvEcCNyLq25bDJDl/ubwpG2JipSfFVZT0vXJzljnohT1UC1hngDsJwrCMW
	iPv5MX4OSEvzTX4oWcRqhvF4KkmDVhxSXi+HZluTcEc6KgcnjL2dNOXDRbRnLm3YWUdc97tiw7B
	YIz9H9AMzSnV30o/xH8qqHyB8FYzXYwtZqfAhqaQ+wwSStsJjJZUJUCdlzPY8wFs8c1gOQFzuWp
	gcBNjM4q2pEYrGFn3Ou09QcqtNw0qLAFKk10taeE/PMtz5Nie+eJZRossfKlv3no4YuWacshARR
	nbw8KRBYCWHo0j1zbAp6zGAzDept1TuREG/SMUGzpEg/s74=
X-Google-Smtp-Source: AGHT+IHxTNlj5dRsC94rCewQM74xflTtLssDmZMFNikBqGrWKpDJrvzYli5sSElATcdJLn0xaxg7JA==
X-Received: by 2002:a05:6602:3f06:b0:85b:3f1a:30aa with SMTP id ca18e2360f4ac-86d2d9a8edemr1437460539f.9.1748958491651;
        Tue, 03 Jun 2025 06:48:11 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7ed81b1sm2278199173.86.2025.06.03.06.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 06:48:11 -0700 (PDT)
Message-ID: <2dfb1e75-6a4a-4818-80b5-4519c0a06c4d@kernel.dk>
Date: Tue, 3 Jun 2025 07:48:10 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] INFO: task hung in io_uring_del_tctx_node
 (4)
To: syzbot <syzbot+818ea33e64f8caf968d1@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, io-uring@vger.kernel.org, krisman@suse.de,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <683d14f9.a00a0220.d8eae.003d.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <683d14f9.a00a0220.d8eae.003d.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz test: git://git.kernel.dk/linux.git io_uring-6.16

-- 
Jens Axboe

