Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D39C18B0F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642076; cv=none; b=tOYxV9fK1LIs+WLuFH4pf5sKCSQ1VCbuCekD56ttvBzq9B/e5NO0LdeEe+XwOuq85ezipFlNxFSGVRhfENHLCNDfpm3Zl9OQMQKzD3ftkbvEEu/fGk/IVK90uyFM+WAcP5E3UkLfc/HSL29Fi6y9arfwfx4Umxp5pTvFVolUqBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642076; c=relaxed/simple;
	bh=8Qtn8KlEQvxgVdPrvGuh4Sfq5tYrSo6Kof/1qWPEE88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y//tlosOr5G6SUsRYDz2vVpNm5QL8wkh/oSmcz9xSfrbVDe1E/35VMt9317Ck84d0b3ATsw5c3Ehz0/pOmXjFk1yojKZrbVHRuhuuv3axZsas5XJ38YmD13E9hxm5n1/IoMnUQdVrj/2xRK1oPzRjdRWgrmxd/iiWVA9HjeII+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=A8kfk27k; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="A8kfk27k"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d5bb2ae4d3so15759905ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744642073; x=1745246873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fq48PAOknFOAzKFbEqBjcV5Kzd2DBdHXfQElMB85zFI=;
        b=A8kfk27kPDo7TcTKi0fMmDCu+ujbGwClggFgN3TgVxfalKaUlRDE/mu17SYUH9uAc3
         ya1iSH7RwHwxjHgJPqChaWgw5aTVNZj6wKCAzsp4py2kh6kwR2k/wvXLYHSaXDKcq3zJ
         HvDiyclan2wVxYWoR/BFXVmnjENzS2fHbqJutlsvPOL62H0FUJY5NWol5wNbT9rYzgRO
         elMijkQtGIHtfO168zkRYs6mSS+ZDK71wPrYMTmAW4L1/9ln71NJc5+bU0rU2xbbcEzV
         TXYch1BirqHrf8YgWHOPFfxPBMYQCL/y3283Z1/Z6lnAHjOQx7qa9GUsK2I6kUuVTmnm
         S+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642073; x=1745246873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fq48PAOknFOAzKFbEqBjcV5Kzd2DBdHXfQElMB85zFI=;
        b=pzejuJhbJLmEhHkx3o34A1iLSTMLsAstxDg21ZZ5+xFfIUPL1eoaCf47LF3sbF/U5I
         0Bj70eB5b/IQP2RSmq4AzMvsoMqywxiv7O5rcoobGkGziOcxMJvbjrT9hpZOrJ3vLNHU
         keTzFadkZw50sTFYf3buifgKtQqzo3S9oMe9gf9OrO8XRaAxH1u3b20hr/Zhl90jmPbr
         3cDp+bw8kpiFXbJ+XlaaZWkehgGUB6K0ZLF1Ut0etp4uCP7FYupE48dRkQ88xFq4s4Xt
         Rk67E2A/RgQIj5sV3AzLeG3cSQKJ1IVAtnZ8DIRJsN523vmCJ41OqPY7avn1Q8bAo/Wz
         L5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJbOwu92wyXO9a0cJT8M8a6B1rr3+aPL7Vw+kaDvC0K0z8tlOQLouDvUqY7aXdgH32ZiVWccy/oCVOHfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe++exHi9qHXEb2UUiqhb23o0VEuHH3klI5FWKW7APOyCw+aUi
	uG+AQtDfiLQC3kxC6u59AO0VpYv8M6l+QHQWeR6eFnHV/hmHpuflArOLJpOAylg=
X-Gm-Gg: ASbGncvxHYbtBG+JQVapuxg+cVpHlqpwHf8ta1CgkNjIgfRLyybHV4tp/lEQnE/dCof
	FnB+AHFNFdBq2EFpVvVKBiAgq2J0XWwLE7jKv7wHQJweAOmhG63DPCsInvtWygWw4ctRN3oJwox
	dh5mo3vTYLHlhb+PiuALKcHQYwbsmYNcSM7cLIiGjjsH8dhmVMHyI3AOvqareANICRkfVZXVnFQ
	j718Qc1eRrmblJwXD1Zzop2jYRUKQa6+GGO5qGUEkIbu4GKTNGW2kqP7kXyHZ6nHb/iSoq7YleU
	naGHpvv3N3oSBX+tzwilQy+9LRp/H54Ay5nydg==
X-Google-Smtp-Source: AGHT+IE/jRticyjdHacClb5ym5jstPEP9CrlXUCBcGw7k00gcOTS5NpmDKrmPTfewbzW1VzTeVMVjA==
X-Received: by 2002:a05:6e02:989:b0:3d6:d162:be12 with SMTP id e9e14a558f8ab-3d7ec277267mr98023065ab.21.1744642073536;
        Mon, 14 Apr 2025 07:47:53 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dc591f82sm27637385ab.65.2025.04.14.07.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:47:52 -0700 (PDT)
Message-ID: <e0dc38e8-9df0-40e3-a0e3-fd4b40b3fd80@kernel.dk>
Date: Mon, 14 Apr 2025 08:47:51 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] loop: aio inherit the ioprio of original request
To: Christoph Hellwig <hch@infradead.org>,
 Yunlong Xing <yunlong.xing@unisoc.com>
Cc: linux-block@vger.kernel.org, bvanassche@acm.org, niuzhiguo84@gmail.com,
 yunlongxing23@gmail.com, linux-kernel@vger.kernel.org,
 hao_hao.wang@unisoc.com, zhiguo.niu@unisoc.com
References: <20250414030159.501180-1-yunlong.xing@unisoc.com>
 <Z_ynTcEZGhPKm5wY@infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Z_ynTcEZGhPKm5wY@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 12:12 AM, Christoph Hellwig wrote:
> On Mon, Apr 14, 2025 at 11:01:59AM +0800, Yunlong Xing wrote:
>> Set cmd->iocb.ki_ioprio to the ioprio of loop device's request.
>> The purpose is to inherit the original request ioprio in the aio
>> flow.
> 
> This looks good, but has a mechanical conflict with my
> "loop: stop using vfs_iter_{read,write} for buffered I/O" patch
> that fixes setting the block size for direct I/O.
> 
> Jens, any preference how we should order the patches?  Should I resend
> on top of this smaller one or the other way around?

I think we layer yours on top of this one, which is something I
can just do without much trouble. Do we want the vfs_iter removal
in 6.15 or is 6.16 fine for that?

-- 
Jens Axboe

