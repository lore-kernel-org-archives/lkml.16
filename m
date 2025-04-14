Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9D23D2B0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641308; cv=none; b=hf6CIkrPC57owS3RxiqILRtBj1JAZEvbjctWDyCO9iMKROstjaTsBwnRaNMW9Huul3qlfdpOTd9Y6dSQOY8Bzy25vrL7E9BQh4nFQ+Jc972/z6EEN7LE93tNnuSqHQuxH0judCctyvu+Ill5C1MLQ0Fr+URQmqZqoZtzjXWMrkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641308; c=relaxed/simple;
	bh=PwHYmS2wxI1b3Y3zAAppiwy9ELe1VraFbzOQDIvtWDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eub46NtJv1K0I6O5hKknE4wwSTXB1la2z799rAK7FniivmwFaIHYfrXbztVTyaymNtmhTzO4BKmaxXruE78HB+vcRekdwDYl1dtl5mefYzu8FQEC3QW5u1sutSslvKsWLws+qBcsUQXmu9ZcUGruFjXJN3BhcaQyU4gpDYfRXBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOoAoIOc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOoAoIOc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ac56756f6so3837206f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744641304; x=1745246104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkrLB9gt7FHS9KVCbxpiRfhwDbyLdoxlYG9hhgnamc4=;
        b=NOoAoIOcMaozzXA7u4Q2WF9ABdWne6pWKzg1NaZUULUS9/8DcFYdDQn2q9a1Mk0JL+
         9nzDLMeoLplJXOygDjQQ0CgPHHocJljxHYOAKifHGl+2J/Foi2YdVM5JqQMgiGgQCHYI
         OpYAP9c+K3VmLP31DDwfvbmykS8VkwJmB5KGlLugT5llIBJdhDTvNoV0snC2ar6Tf4SC
         2ak6hF4aIcE3HZuNkCX9ToMDG5OB02Yt8doo5G7vw8D6e2P3zl8/277IVCSvP/2GUYq3
         Zk4Cmqr/Z+jdAfpjjY7R/xhKIBfEWoXEx+nNF3Bidh82k+5nthtvePm1BTew2k9x8oCX
         qVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641304; x=1745246104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkrLB9gt7FHS9KVCbxpiRfhwDbyLdoxlYG9hhgnamc4=;
        b=A9bvF/ibhaZsH/7dxoSlOebzaRHjk4Apk/jKio/z2eIMYV7AA3U0f+e+SeDfGIiTyv
         C/7XzA9N9v3RMRzxug4Rdd+iUcsa/cmvzL7tjD7+lpNy9DAfH7yatykzGpwUywRaE5Ys
         LyHsj1krlnvP+0lsHe0SwMAuGR9NN6QvW6QK5vu0AC6O5RO3HVghwXIebxDP0KmlUlFw
         bFu9z28iJ08SIlDBcT4zuofN8S0FIcdEVisn9H7EvOPyMyF2oEU0xcrCL5oRZWay3wkb
         drFA1lcydN9jOnrYHLP3EQjO8NYVXwAqMqUj9U3GitDpExkoyNtYa2m66M+KudBE7urO
         6VCw==
X-Forwarded-Encrypted: i=1; AJvYcCWZk9ZO6jXiLiYy6lQGUVWORFbuXs+J4BOTsYuN79bneMR5lNQtwVtJevIMuBfsOijIjpOauvF/2MW8xLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRerFDB2InXBAZPYBsVvFiwws1h7yhs/FBaUJA/fpaF4paUeZe
	MKejJtoz7h99HdGqrjZor7f8Bn32hiJ32kUh0QeSxjGrLNKynTO0t4Pxc5AZz90=
X-Gm-Gg: ASbGnct5B5vNEkzLXLk8v97JOytEIjgn0on+FcDIqcR6eLFG6BoVPjhceYQ6a7KsvFh
	GUQZBPNBZQ17SeRXimqZniNceKFZ2YG71H67BNpZbYgyYcQBWJlsVFTa61XdxUHMZxmRh3WCrnn
	ijcnzFJpZOdbNqsWBJ87xKfHudmplx46spFrOZa2j7cw+rwYvLFf6BHbkPVMj0Z/HwZ+ODO9nF+
	kTr80n9m8ZO8yMePZeeRjdJTLUs0bxI+eDC3Rpmpx/5RVTLVN+/G2a+0dAhoSy8Qt/QK+RLbloG
	8Aa60OKLRKwGX0nBw/cUYRr5RzFquUGKc2zmGhQu1l5dl+Wo1MhKX2AXMNA=
X-Google-Smtp-Source: AGHT+IFh61+mZBNxOQz4dfpryHzCaL2WYW6L9vY0GBxvo/yMy304hm6LVDREd/PMvqkdMUYJdtZLYw==
X-Received: by 2002:a5d:6d84:0:b0:39d:8d54:5eac with SMTP id ffacd0b85a97d-39ea51f44ccmr10807109f8f.11.1744641304375;
        Mon, 14 Apr 2025 07:35:04 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm176816835e9.21.2025.04.14.07.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:35:03 -0700 (PDT)
Message-ID: <20bc473e-3386-443d-8350-f6718e7903a0@linaro.org>
Date: Mon, 14 Apr 2025 15:35:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mux: suppress lookup errors for mux controls
To: Johan Hovold <johan@kernel.org>, Peter Rosin <peda@axentia.se>
Cc: Johan Hovold <johan+linaro@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
References: <20250414124220.30578-1-johan+linaro@kernel.org>
 <c0f63b8a-7197-050a-ca01-a1050a2e287e@axentia.se>
 <Z_0VMCmfnDZxd4GC@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z_0VMCmfnDZxd4GC@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/04/2025 15:01, Johan Hovold wrote:
>> Srinivas Kandagatla is looking into optional muxes as a side issue to
>> exclusive muxes.
>> https://lore.kernel.org/all/20250326154613.3735-1-srinivas.kandagatla@linaro.org/
> The audio codec change introduces a de-facto regression so if you want
> something different, we'll have to fix this in the codec driver directly
> by checking for a "mux-controls" property before doing the lookup for

This is not scalable solution, we need something in the core to allow 
optional mux like any other framworks.

--srini
> now (i.e. like is done in the TI driver looking up an optional "mux

