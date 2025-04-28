Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680581D5176
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847147; cv=none; b=K7y//RHXHcs5zD3cIKOaQ6nXIYCfN15Krln+xb/nOrPn7kHXrrMcN5NZOzrGg54Leh9DwQdOq8H2C3DLJNb9lOaXAULNV3RLpVkj/smvJe9eDT8U605wzbtcaeVueYCWob1jdFuxvq0dbYsK7g1U1fRSakP91grRIULTvlnESZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847147; c=relaxed/simple;
	bh=5MvNb/9mCMrhQgQHkqWPTGjqBmv+a8XigpUBb2+aOuY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Idg2wAUFK9eHaSEgN7DdpSVVGjx+oO7AFXvnZXuE5+XwbVzhUV9Nlk/vO4NZR5xUYPTp+Hlfr41ww0SxuVT7nTLvHIYItyCRvTw+ac4b0babOBzOI5S7iGKenxrExPktSTjvQGEh93j4aBy8BupZ/ufacXSR0adPT7BHgOJ6lMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YKE4D/n9; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YKE4D/n9"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso5157693a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745847144; x=1746451944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5MvNb/9mCMrhQgQHkqWPTGjqBmv+a8XigpUBb2+aOuY=;
        b=YKE4D/n9kPzq6nn8H2VjQiFWdqeo7N2fwVuk9rm2xZU51paqrat2ECCQ+pGmxyjmVE
         WtYJsAJBvOhvNkcXr1DPZa2OW6mp1FDdEhqZsLpydAQU7a5s+zbyPhmcNrCGu7c8a1IP
         pzP/ImAbmg70vHDWV/lYL9UJTN/4UQdMqe1muOVqQv05onQyvXhqJYkj1PXAmC29Hm4O
         +aDIAxy5xPzSLZCe914eWo2xiPLmmk7fWGLpqCha2Xqq7Wgb3nOTwbqiU1Pul7DX2eR8
         nsOP0iEk2uspa8dweLapZ48GAv2tJ4BGGk3eUnnu7oOx5ci40fIYk2ry/eAKTCus9+i/
         1IfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847144; x=1746451944;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MvNb/9mCMrhQgQHkqWPTGjqBmv+a8XigpUBb2+aOuY=;
        b=sLEH6HzqL1ifgaG6QFHkbnCu+6BI3n9FP0Z5LA+evhveoRcTLauSZqwjSoUv+QnnSy
         uZZpxNB9XT6T5ii/Oj8wvYUrkTUgpyodmVGy3fjkv6hCbsM/8IufY/FYQnMeajlf1znc
         +NqJ1RmLjbo3CQuUEshbGlqVjW/Dv4lB9UIdq4eKj/kFcFrT5OnoFjW/visXl9nwjpM1
         LCmphlaE/jXnyu5xIiGsePZE1IW9ygp3TwfQ4lsnR05pKrWGntyRdBDQIpKa1U/mmq0A
         bANpXefbQnIeKK8G/FzuGS6XuDsT3wXZ9SaDUpBOrUTQqBcN35c+GQxdl4g+FBgu2D+C
         M1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgkksN2Rdqkq5EBg/4lCGPj9TMLZ6acL4cDmah8LTnbMvlyuzd87XSq10sf5qN5Qf35gG6ipu34NO7pNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmgE0RYp1B9QAQhjWW+Nu7nL8bBPk5YtJrI3h8hi2tHSAtU9VW
	SuJn2/Jarm0XNningX9tLE3CJN9U/zdocAY+seeJ6Uk5RXZAJ/RQC6Af7FfcMPI=
X-Gm-Gg: ASbGncu2K0oyA5NeTujMgwEL3UJte73VRKHy2/BR95ztMBs16tNoEtRre5rhmKncBft
	VrpPUHVkQ73qF0Qgg/Tjnd7MElzbD1+fwil5S4Fy8QGil4cHZK1gqvc5cDB53UEmWyw2Eud8pux
	OnIml7hCPgwXijVY3eVrMw0K5mD2B8P5cvTfsHPfpik9ZxZVVnGpQHxREo9tAHPEAUB460GD8mt
	jkxg3uJJZUIj27G/4UYHBztRELdlEXAEYmNNFkB9WXyA+lcEkHHI5OtFwUMFAV007m8hffxmWZ7
	ry7UE/xMdXO2p2y0/F/OoxEMQEvgAcS7XbPMP2ey9qwuWMnJwg==
X-Google-Smtp-Source: AGHT+IHrxlEz75uA2xoO8NiazZPDyBHo8KIErfu3S0qRJ+KrGilQraL9G/JLdgOOp+3H5oDKT3nshQ==
X-Received: by 2002:a05:6402:3506:b0:5f6:22ca:8aae with SMTP id 4fb4d7f45d1cf-5f6ef1a35b3mr13928007a12.2.1745847143543;
        Mon, 28 Apr 2025 06:32:23 -0700 (PDT)
Received: from [192.168.0.14] ([82.76.212.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7286bb2e1sm5599115a12.36.2025.04.28.06.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:32:23 -0700 (PDT)
Message-ID: <7122fe72-ebc2-4798-8a1d-d905debab092@linaro.org>
Date: Mon, 28 Apr 2025 14:32:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH vfs/vfs.fixes v2] eventpoll: Set epoll timeout if it's in
 the future
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>
Cc: Joe Damato <jdamato@fastly.com>, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Alexander Duyck <alexander.h.duyck@intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250416185826.26375-1-jdamato@fastly.com>
 <20250426-haben-redeverbot-0b58878ac722@brauner>
 <ernjemvwu6ro2ca3xlra5t752opxif6pkxpjuegt24komexsr6@47sjqcygzako>
 <d8b619d7-6480-411d-95cb-496411b47ff8@linaro.org>
Content-Language: en-US
In-Reply-To: <d8b619d7-6480-411d-95cb-496411b47ff8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/28/25 2:18 PM, Tudor Ambarus wrote:
> isn't ep_schedule_timeout buggy too? It compares a
> timeout value with the current time, that has to be reworked as well.

Ah, I see the timeout is relative to ktime_get_ts64() in
SYSCALL_DEFINE6(epoll_pwait2, ...), please ignore.
