Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56B7166F1A
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748568829; cv=none; b=gTibwL4KegsOHbZ8s1iMVScMQey2RFpks0i5RSw940iD46I5ABRD+Cg5ud/4VvIPlrRnGmZ4CMRT9mJVoDx6DL9kzn+pGBLEFhCq0V6CP+oSa+nIyyl5sAcstBrDfafaIVESh7/cpdjZRfj75UyJcJnFDaacQ9fqr1UvMABglas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748568829; c=relaxed/simple;
	bh=FMpA4RSm8ne9pEdJlb8jlNv3zSaTEZX72+fA8B7cDZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlz1JLMIwB6OtmfF90OjJY8DxmqKEjH5VSxgRt2ZOcXNfEnm4iakYmZsYBz7TvyM8nERE5Es5pBAXRfMKX1jaPtGxXV9qByoZ53RgBmWgNKMfBWliomAgPkIYyJ4tgpHqC3Hz7lXZlO8SCjwYmbWNxOwvNIyUvQY9D4JLNR849I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=YbSgN/vP; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="YbSgN/vP"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86d013c5e79so31401739f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1748568825; x=1749173625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63YhklUO+WBFbPxAfzObLOK/MHzwz+yybl5BUcMH4q8=;
        b=YbSgN/vPPvKka3jZDEtkJbCQ12e2jYrQWs/2EK66K2iJP+Nn0NhGcB26/qtczjyEU+
         zVnpx6fvF/iZQpO8iS/H9PjRUmBnhqvgr8vY7BeefCExk+DBLF9Zn3yD7RLZeivwk+Le
         yaBf38ej3UTVI+BTm6kBgOgAPhjvi6q0oQkAacXnUPGLCAkTCxqH2UIZ6XGsRaIUvRDm
         mdj7gIEN9gNCkwYYtsKAds0f9OeWSmulKVnCiGNxNsH4qXQauOFiZV280WL5nxwz2AEx
         Urx5MDweS2sse7RviXZ1ys+FE701EuE5DEHO9lbc/zl399ss22DrPBhxarYy4LCTHnc9
         hvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748568825; x=1749173625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63YhklUO+WBFbPxAfzObLOK/MHzwz+yybl5BUcMH4q8=;
        b=QJYBVoOE2MFbn1aMuif2ZN+GI6MWnpGQwEZOfZcBphZDp1cuGiIxVsnQnqwu/BIffc
         RfrhSvyKTP4wxpbJbo4a0/QLvomAaaVbfIkDnNYJrfG00RvKNPLOLDHzSSDHFHbB1bSN
         pf840HhU34DhfrL4OfAk3HVTPlmA6cibI7i6hRiuJiWGc5BmLsi4A4QAMBhtAPmY18Qu
         hm8XFIUJM2sLcj2+2R0b5S2bddQXohpAzGwgiH8TKowYV8ZOC0S88C96Q+6OajX+PA4m
         RlY1HMZpVj21AV9HX4EHRM8JmQ+/MxZHTCrGss6ITbkEkP6sOQFZ9uDJkpujhgTh85i2
         /4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWLfYcLJgfIdW1GgRsxZpr0ETnALoIMXTC4yLR/DCYHWJOYkJVwtUtelZPSLA2UiCwBqPsquRNFhABD380=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZm5IFlwTAQjRC9Wykmtx3pC5qdMMO8CK39SOD/Pw8Ef/F/6GE
	tp0kVlYeqFFam65ACMA7Wv+JUoB0dopdv7dhZc0+M+0emBLMoj8ocq+SLoIy92Kof1I=
X-Gm-Gg: ASbGncus9EMiLTvYQqJt0DaD6xkIT8keSvI6Y5GzCZn7pvoL9P2mnt36aoTxqA2KvQ2
	jqZFlinrTbb1xEqDj5WVIPWlWgQKoBK573zj+jMVLRuZAj9kcBvcOe6z47zmou3aqoOsgZUbZAL
	p2ZxPR3JnhHRnzI87fgtdKXDZnQz1Dbsts+BAOUnc0p7wT8iUSZpyCT+EfuWku8e3zaJXy+exQl
	K8FP0/TI/+NTLVZYJ0WbPkYf/LgYp0o1lUzXOFquCBvF13ZB7SR6ak6H31uwyfNe1lpK5WLSKhp
	tfwgBnx4oOGD8uMSusvxT8aNexF0a6bb2mBwET2useg4XHFmxucOwOSJ4Ls=
X-Google-Smtp-Source: AGHT+IEFewJDcfGiFulGvASHgCG+gQHnrzGVAH4ehGl9q9BWmJdWLOEPyauL/ILbXyseIIfHsaD5lA==
X-Received: by 2002:a05:6602:5dd:b0:86d:5b3:15d7 with SMTP id ca18e2360f4ac-86d05b316a6mr11323139f.0.1748568825576;
        Thu, 29 May 2025 18:33:45 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7e28fa3sm255381173.45.2025.05.29.18.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 18:33:44 -0700 (PDT)
Message-ID: <d3882634-1071-4219-86fd-c9c72ded91b9@kernel.dk>
Date: Thu, 29 May 2025 19:33:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] ublk: have a per-io daemon instead of a per-queue
 daemon
To: Uday Shankar <ushankar@purestorage.com>, Ming Lei <ming.lei@redhat.com>,
 Caleb Sander Mateos <csander@purestorage.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250529-ublk_task_per_io-v8-0-e9d3b119336a@purestorage.com>
 <20250529-ublk_task_per_io-v8-1-e9d3b119336a@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250529-ublk_task_per_io-v8-1-e9d3b119336a@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

LGTM:

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe
