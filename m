Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA282211F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464075; cv=none; b=YwdYYH4+RWR4+mqjxov0MYXMjgWl87zgE1Yle5CROYPR7xr/7sNiVxYzlI7UaqNV9eNAPEengIcaWOTdpT4aGnC1OW/D46oL1aVhW3XLqWnXs70B7WkDnZlRzQWIY2Vtj8PrbeHBPFhMfzCeYHyrSAQADLZxPwSax7XLZ9YHbb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464075; c=relaxed/simple;
	bh=Wi4DQE46TrDLZnfWQdYfMnq4mgrm6vjP9wNScHh7p80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QClfbvTLnXWayPKN705wIrwp9kupLQcF220sVy2RPPFRpuTaAi++PP8VEpvjLvWff4u98oDgMzhF0a0DDHjECmOIObDY4cXXHsr3ze0ekqaOBRzAp+IA8WHoL+zpfQSeEK5LO/QwGJ3EANaDXP6k0jreOthTEKMgxE+hnr/j+EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hHloAsGw; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hHloAsGw"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3df2f20f4bbso21778155ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751464072; x=1752068872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/fwakO58UBNp1YzQ6yMq0byfPqW91OqrWRj+mP3UNP0=;
        b=hHloAsGwArENH/R+XqsXV/ujKD9sGOS7M9vlcn/v4DIJhXQeNMJ7c+c36C6ZA38ovw
         PMZ3atoGJXsQD6l7XaWTpZpb7hEodsU6FkG5vuZIl7/TFRU8cSM9Uaz0ERHtyYdc2F7Q
         +bwolhxGXKDCW3mS2h762ITvnwkL6o+xHC8n+zPq7CJAXpXHl744+QctkzWf0grcxBs9
         NoVPwmqvu+U8y3zb9JT67eQwl8E1SO4PNtYRCKm6SATKL+TdusF7OWppT5p6HYU94TeJ
         Hz4FBFhU8mUYQl53UBXSHiSFE3BknlBTNsUQyjNRH4QiVOQIbQcuOzR51psMKM7kJH96
         OM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464072; x=1752068872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fwakO58UBNp1YzQ6yMq0byfPqW91OqrWRj+mP3UNP0=;
        b=kuC5muVpFixP7010cc4BNTLDK2+p+ZXVlVNYG8hLNtBjV6Dzibiu1/WwsgJgfQ1hMH
         hNgakwZeHdd30b2x5QQy3t7m2N2tjpBn8LTVqTlRAKllulUe26SrsQLFcsc3yilLJeHe
         7jQjFh4QOjFCF8KS/1lA9QqIUH6ZhEiolNy6iSnSpBXbRRwYwbx1mCiwgPgmjKcXiDF1
         j31e+Sp7HZOuPAzNTup3AdO5QjW2yCOD7LDvFi9jD9Y5ddYOUP52wWyGPfI8DqwTN/4P
         QXP+CvQBy7RTILhJWPHXfd6mpVrxvGxLgxKPTF+LFKEifmXTHGVKj15kGhyXnV+wegxZ
         fnOw==
X-Forwarded-Encrypted: i=1; AJvYcCW/FV3UvXyqthGHzmK3e4nyqAm0Fp7EuZnNOn8SzgBIvPA7ppBUyBbHcMO67CAbE5PYNjDTgrV/T3z7JTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0EbUpYQKu3te8vGZm9RgaEhu54rqbDGqZjq5E1RXrVjHgwdA
	6DlAP0JOUzvme5igXivyurYIY/mh1pbZvkEuhUDU/ZJ8TmRNWlkOYkUi7G+dgHmgrqQ=
X-Gm-Gg: ASbGnctVExYAcGJ4STYHKf/b3oLVrLtdMMw+XY95/Lf4Hvjqv5YgAzDMnzkhGeQvnD7
	S6WzrG5rvwv5LxT+gwK3SzORvnohAEU3ySN11qefSLxX6DvokoxpykY+k59XPBTun9uUKp8kOFz
	Fz5Q5GzL1ojjDmtsiH1750EJxw1mfuDAkVDGUPGT20HJaqhNyiJwvo375q5W3MVrUgQDgSLzB/q
	UfIPVbZtOlp6UXFPaL66s8/1ZemSK7/NAaz1NpOgXFGNy3ULL0Q4SXXimnMsK1BHQtJo5PTx5xQ
	iJV0aqLZtgb5tcoQnV1+ilGRXaoeNmFyko+slvoXX+kxfsLz2nDMbpuD5ORmSpFee9XEXA==
X-Google-Smtp-Source: AGHT+IErkdSR/RjPmfMVJFAgKC3aBMy2dkswaAi8yLVXilzzod2q6hfwnomvpLNcB1bsd9raBf8Kuw==
X-Received: by 2002:a05:6e02:156f:b0:3df:2e87:7184 with SMTP id e9e14a558f8ab-3e054a64a4cmr32804285ab.20.1751464071869;
        Wed, 02 Jul 2025 06:47:51 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3df4a0b6fa4sm36211665ab.66.2025.07.02.06.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 06:47:51 -0700 (PDT)
Message-ID: <883afab8-336a-434a-b64d-13a5db7c0f24@kernel.dk>
Date: Wed, 2 Jul 2025 07:47:50 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] io_uring/cmd: introduce IORING_URING_CMD_REISSUE flag
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>, Daniel Vacek <neelx@suse.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Mark Harmstone <maharmstone@fb.com>,
 Linux Btrfs Mailing List <linux-btrfs@vger.kernel.org>,
 io-uring Mailing List <io-uring@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20250619192748.3602122-1-csander@purestorage.com>
 <20250619192748.3602122-3-csander@purestorage.com>
 <76d3c110-821a-471a-ae95-3a4ab1bf3324@kernel.dk>
 <CAPjX3FfzsHWK=tRwDr4ZSOONq=RftF8THh5SWdT80N6EwesBVA@mail.gmail.com>
 <33d93770-886f-4337-a922-579e102c0067@gnuweeb.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <33d93770-886f-4337-a922-579e102c0067@gnuweeb.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 12:44 AM, Ammar Faizi wrote:
> On 7/2/25 1:27 PM, Daniel Vacek wrote:
>> On Tue, 1 Jul 2025 at 21:04, Jens Axboe <axboe@kernel.dk> wrote:
>>> Probably fold that under the next statement?
>>>
>>>          if (ret == -EAGAIN || ret == -EIOCBQUEUED) {
>>>                  if (ret == -EAGAIN) {
>>>                          ioucmd->flags |= IORING_URING_CMD_REISSUE;
>>>                  return ret;
>>>          }
>>>
>>> ?
>>
>> I'd argue the original looks simpler, cleaner.
> 
> I propose doing it this way:
> 
>     if (ret == -EAGAIN) {
>         ioucmd->flags |= IORING_URING_CMD_REISSUE;
>         return ret;
>     }
> 
>     if (ret == -EIOCBQUEUED)
>         return ret;
> 
> It's simpler because the -EAGAIN is only checked once :)

Mine was mostly done for code generation reasons, though probably
the compiler is smart enough. I did consider yours as well, it's
more readable. However I'd then write it as:

if (ret == -EAGAIN) {
	ioucmd->flags |= IORING_URING_CMD_REISSUE;
	return -EAGAIN;
} else if (ret == -EIOCBQUEUED) {
	return -EIOCBQUEUED;
}

But we're obviously nitpicking now. The bigger question as posed in
another patch in this series is whether we need IORING_URING_CMD_REISSUE
at all in the first place.

-- 
Jens Axboe
