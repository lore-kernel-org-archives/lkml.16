Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C617A31A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743275230; cv=none; b=ouobqq4sLbVZoSn0FY9jyTjtuvHJkXNddL4YdsfX90ykeihUZVRPQ5afWk16JyiCNcnQir4LK57h5yyv5CetUoJpVQSgSu0X7s5zHeXKwgKq1pPXgKJ3pdILg1kYnqigVU9wagbvFsmf/av2BtQruwBOLBmyBK0BhWwQJroQu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743275230; c=relaxed/simple;
	bh=CPIt57KTbw48U5UWIhC/4Sj7Kxrgg20tW/7JGwREow0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXPZaZlxF/Nc+X6qq7sl1n8vsmKp2p811cQhK/BpeLs+6W6exKgJfwhahhSoETpCUDKnChsHZm3B/DZU4yvSu16ECBy3qi9n7QCenTLnpnAva+kJL+1OrjsVzhHW0G9mvfyXjOWZgwc+rYpXC186o8FccsAxuaUEhMYFeo6lvB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=mbe2UgFK; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="mbe2UgFK"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d589227978so10200565ab.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743275226; x=1743880026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PaGHXcdYFnrdjAPBt/dtHNMzVVLvDagzoTGvwSBAWXQ=;
        b=mbe2UgFKItYPtsZr9HBaL9Uj1UCCu4KekLD64Hk3kDAJJlhGKtD6sbIR45JCx0HHJG
         P6LLPbtCqdMR17SfXNAJzJUe1wmvajIz6uI8v3LimwCwtcSefEHlPCgnPb6I3A37T6NZ
         jsKl/cwPG3vWyZaZBugV1mY8TtHnP6/Ne0pr64ecFbqRg+nEotAjEVUnGi4cSiOhjS3R
         FVCg7SF8jn8wjfj6Y3KaUBAXX778e2PmUPspQLbaKTW3X2FAD/YJFYvJNnfFAWykUuIv
         CWHOYNxkYi/tquhi/GHKeZccDhcJd+6J+zU0w/U4gauldQjD/MWcKDWsfhUB7GcaPYFs
         JRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743275226; x=1743880026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PaGHXcdYFnrdjAPBt/dtHNMzVVLvDagzoTGvwSBAWXQ=;
        b=uE3Bl+r0uwHjznxY2t5XYPWJSOTFVW3a+4dOfJdD3q/Hvmqn/udmqyrTDag02DXLwA
         QDT4xBXtsKCtbVkoeHN58BJZtKPIoGjt5vCmXLk4hisAYrchDW/bRSdD4KRqSA1Y5wU/
         GdY6ytiJ5fs9A9u5FHptx1C+gE6VuKLuijrNnGLowR69ARiBI7HOjWFF81I6T32fHK0W
         17yf4vaQM65FkTdt26fQyw8BlYyp/TVxcXr17O3KpTti3sNGyiABrHAaD5S49tfggjk6
         RNviYKBWKCu2shnbrNsIn6gIuCiDUTddfMHkYvK9EAAdf+/X5nxlfkX7ljAiXRG7H+r6
         XrLw==
X-Forwarded-Encrypted: i=1; AJvYcCXZPal27H/isUpghoKvFs0mFNfAdo7K6sSrIIIWoDDWPSn8X1Ha+GtTJxX6ac0tGJreCUn+HZedF6M4h8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQAJVv6qVjvv0LNQsNakFXbzoc6VKKtMldMAkT4kPeM3qDLVS
	vYzwCQ/Qdb7lfdxqcoeoJQfi6UigLmnorgGZixUzQAkYIbB/YLwJHAv02LebtJ8=
X-Gm-Gg: ASbGncv1m1n03ofZ508XO7GosMGXXqVOf3F0mbeF7guWEfk2yTXDTAQT59l+5LZ5I9H
	Ba8HSUTOhKNQYKcXMmfkgBiVCZqlWHnmJTyC2ClHeIb4zcBWb5iCEeurDgPW3w9M831fN9tBtOY
	jUIvdEd7hg/ioyl1vsBXmMzDr8P+bR2PrKYnlHFCY627lpd3BHV97Q+y4k47ztFq5bvNE7tovAz
	MwNO5Q2szOt4EtVb/e3t1TimTNyetTaDEYwHg8+wmTOwd6OkTZtYCcW0BDerdtVz59QvUNC4sCt
	6TC3Sez5Aa6jQgFJa30i5nknKYqxqkipn5VukrXzmA==
X-Google-Smtp-Source: AGHT+IGGI5rUj29WJPXqMbVotuqKmnVzBYiicrC4WVNgcPFELxFvIKEqhvm7OfHT2pS0TayTuv9AmA==
X-Received: by 2002:a05:6e02:4401:20b0:3d2:af0b:6e2a with SMTP id e9e14a558f8ab-3d5d6c832eamr47389485ab.5.1743275226428;
        Sat, 29 Mar 2025 12:07:06 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f46489e032sm1007193173.124.2025.03.29.12.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 12:07:05 -0700 (PDT)
Message-ID: <9d8f1460-6317-4e8a-ba90-53e35b41f235@kernel.dk>
Date: Sat, 29 Mar 2025 13:07:04 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/wq: avoid indirect do_work/free_work calls
To: Caleb Sander Mateos <csander@purestorage.com>,
 Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250329161527.3281314-1-csander@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250329161527.3281314-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/29/25 10:15 AM, Caleb Sander Mateos wrote:
> struct io_wq stores do_work and free_work function pointers which are
> called on each work item. But these function pointers are always set to
> io_wq_submit_work and io_wq_free_work, respectively. So remove these
> function pointers and just call the functions directly.

Was going to say that the indirect call here is not something
I'd be worried about in terms of performance, but it's also kind of
pointless to have them when we have just the single do_work/free_work
callback. And hence it'd reduce the struct footprint, which is always
useful. So yeah, I do think the change makes sense.

-- 
Jens Axboe
