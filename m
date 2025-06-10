Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90FD256C6A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581797; cv=none; b=Onxqrmi2Pdn0FmBQnkfBirefxDB1No6hhZ9lQrdwvUhBozYrNcYsmricxX62oSdDd7DKY32ZG3LtErkI2LCFwCyi4P3HKbasXkr6NlkbP8EDztz2SbU6GWglC17yeDIQ1O4IRsgXHGheMlFPsQvkau9hcDwtk5U5yTMVQPrzidc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581797; c=relaxed/simple;
	bh=Gjf7MJgtoowVX5GjyxKfHrfyG/iuTCDkZxXqDKA8T4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bm5jq1AEq6Vfz9KFiH8vkTuBifJLoKYQlzGcne/VVhLpX8tTZdNWl7XG02IpCydomN2/CuYH4rXKAiEf282KobpbvmzHEDnL/GTH544U4KD0pjmq3/qKOS9B0jUwB1saiY85aaSVA0N2yl3mRUgeQLrM+Uqo2w7+bTP8LyerHK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KtRJSyHn; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KtRJSyHn"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86d00726631so126731539f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749581793; x=1750186593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/hEVzGZOHW0F1bE6WnTuLQwtY9o2+fUFVVXN65KjKU=;
        b=KtRJSyHn96TInDB3HzBYfP2cum3MMgph6vO1cgNuPZFngghPBuHs9rPWKwk4YjUbQ/
         gMccFG9KiZDLHk9kHeDm0GLkWDfb7LgzCwGnVqhTce/tUtENj/yUSfF28hueRLISzix2
         mziuom4db1QQoPcb/B1yLCWgTFJ1ISz2S3PLFaeADrJHiM7UDbzi4RogZxe/xvQF5ZAd
         RvMm/X5a1BJQiM1LdH4BtpG5ZF97wZdPoHIiu+MVlMhFH1y0itmh63XKvQs4bfRk3qzo
         Aammq1kJeGdrQFvxbaFsQikNbRNgTdcCRoUDUMYxVSQizAIPsohCMzPnn1AxX/CpvjV+
         cPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581793; x=1750186593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/hEVzGZOHW0F1bE6WnTuLQwtY9o2+fUFVVXN65KjKU=;
        b=YRIw9HLYVp8OmtJ/b/Rwuq5ZWPoDrYtXsnppJ8HCv8Dj/+ftjYJrbjuXHsErni6eOW
         HtjSaRIhpJg99ckuHbuBNTa6ynFhbmvzncvDHT4ysC5w7AQXULTRUQRQkhFzh+rS5ebm
         OCxNjyXV2l2L7ZcOd28yXITJ5FH7tgYmTqEmiK8C90X/PtDAAq0xFoiybQtRN25mC7O/
         sUrmT3QqzD2CBofb3o7nJjvVgMMysY+O01zOisughpQWc08mmkRRLUfCh0LMK2k+WvCE
         u0E1vdkAUyo44OIqhK7xAkZ6ZUBHcNA6WuDI0ZF1jWFSaavwcZp56Sc8Sly4QeXqmWRJ
         uReg==
X-Forwarded-Encrypted: i=1; AJvYcCXRqMag/8hDtzyWIv32xjibF3ms0NSecZQomJu/94o6nWWr3vJ1HbkGKK6oG6LVMYkihDTrJpO7t00ULi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEkmpH9GrZuKPj5cfYAhj2As7CNbIt3nAj54bskokOFjXXFIL
	+ejZRq44oD7rW41h0E1hs4WgFyqTpBLzk2iWXSNePk/clb7zJixyXYR3lk1nFarxkrxhi49MEtN
	L6x6C
X-Gm-Gg: ASbGncu+W33qyGnre/fdOMLcFawAAf+cM4/IHP97d2srL1v9LBuVDyk8xShiWlpfaQ4
	irZclNdP90p5Wex2LBzjaiQWQ0k5bfU34/PVhWB4br6oaQ1vrNG7dD7pDxAQyQLsq5TdgpMeYW4
	WFIYITtvJ7IQeOCwwnA7uUYfUbdHwb8VP/hOMTCU3WijRiA4g6Bfo5OcgkQq073sAqyZbwuwWIF
	bwGSzGwunghIK0wWn1HIhNDmZ64NtTacAb+YqvuExrcPi72CdqnxtUSBuLiljaemrdpuRrYee1O
	RRyjgrUS0fgBPDVDAGb0JTxOGKfprjJussymhTDcc2YOSSDlHKyOVThkxQ4=
X-Google-Smtp-Source: AGHT+IGslyx0wN5AwCzp0VhTy4YPbwswY2jFAV33oi+CcIONtrvt6dFy77ZL0hwJrEMh+yuktXQhLA==
X-Received: by 2002:a05:6602:360c:b0:86c:f3aa:8199 with SMTP id ca18e2360f4ac-875bc4359acmr66688239f.11.1749581792972;
        Tue, 10 Jun 2025 11:56:32 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875bc699510sm3141539f.37.2025.06.10.11.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 11:56:31 -0700 (PDT)
Message-ID: <48f61e8e-1de6-4737-9e58-145d4599b0c0@kernel.dk>
Date: Tue, 10 Jun 2025 12:56:31 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] io_uring: fix use-after-free of sq->thread in
 __io_uring_show_fdinfo()
To: Keith Busch <kbusch@kernel.org>, Penglei Jiang <superman.xpt@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+531502bbbe51d2f769f4@syzkaller.appspotmail.com
References: <20250610171801.70960-1-superman.xpt@gmail.com>
 <aEh9DxZ0AQSSranB@kbusch-mbp>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aEh9DxZ0AQSSranB@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/10/25 12:44 PM, Keith Busch wrote:
> On Tue, Jun 10, 2025 at 10:18:01AM -0700, Penglei Jiang wrote:
>> @@ -379,7 +380,8 @@ static int io_sq_thread(void *data)
>>  		io_sq_tw(&retry_list, UINT_MAX);
>>  
>>  	io_uring_cancel_generic(true, sqd);
>> -	sqd->thread = NULL;
>> +	rcu_assign_pointer(sqd->thread, NULL);
> 
> I believe this will fail a sparse check without adding the "__rcu" type
> annotation on the struct's "thread" member.

I think that only happens the other way around, eg accessing them directly
when marked with __rcu. I could be entirely wrong, though...

-- 
Jens Axboe

