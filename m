Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D52DC791
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039277; cv=none; b=JDqkYpB0V7A1D29SxKrQ+0zeBhl8h2bu5e4P7sJX9Wudbw6DbO2/7f9NjC4o4kJbQ8WcdcRHz1iRhJFYpRckQ7kjZIGkOXDSMMsJmojg4g5IP52OmMEU7yOiMjSgMD78eTu9iiYxVv3t9mNub3oxslf+zLM2LiiCovDVSI1hecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039277; c=relaxed/simple;
	bh=865Cx2t3kUvgFLSb2R6Pw9pfJWtPTvNHqrmNxnLnDT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdjoxy1cvqG33zN3nGlu9bFfJ39+XkXsesAYkfe9KxI1wrWdO6Wn7DnRF+/qmLI0EWTxOAO6WWxuyhBv8pJG34zPwtknelrUrdMGwUkeMZa7JNvGGwysKjeOOZ5FrSrlPtgC1BEMqqoZ8baSCX7Px9qtKHK4mp8a98OuVQ07IAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D2wJB7hP; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D2wJB7hP"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-861d7a09c88so5250539f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746039274; x=1746644074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=865Cx2t3kUvgFLSb2R6Pw9pfJWtPTvNHqrmNxnLnDT8=;
        b=D2wJB7hPvnhW2nOAd8QTcG6IrKcLABrBZDSW/oi0LT0l6ucTbFNd+BzGVhkFpydtvj
         0iIV4I6ZpybIa/I+ShxTpLgSXsDZX5s6rcmSHLh/lIy72vW4FGucOWEXCPYjKxdx+BVS
         IRzQylVWxMGXvJditySYJv5yb3LYHmcpobReQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746039274; x=1746644074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=865Cx2t3kUvgFLSb2R6Pw9pfJWtPTvNHqrmNxnLnDT8=;
        b=YFKF2A0VbHNQAQPpMJGnTVRe0erawxo3k+U2zX+4ITXJgN7OOBKewCixLrUW8nFauN
         2WL7eSX4xU8KwJCEZSwiSBfBRcHih2P36MGlePg1VVFSoFpwkkJG7t6391E1L1hgB9Sk
         95yy4fVSCzBX17mj+4XNWSzaSRoLuOfxAN0ItdYSQNKpopRFB+X09dUxB0sGUPMFUB78
         CC520h4F/rufNSfDjv+h8u5T1RbWFAgrNZ6zoLyknGIOBxhwj5Cl7z1sDlNnIIyJsepy
         be6Pko2e/NHBMxRMs2/j925tA1H3vJqXam51i760UUIwG2v/phJteUoebHNNAnonCiqN
         bupQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJIxWriiDKc6uQWg21FJdJ3S9B9AK3+Goao9ssmfAc3WjbVE+S7mmHLCEozbXJYsijCHx6M94c0JCX0Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy28Ag/czhxhRmwzfN+ax/8M3giTi/YPoXRi0xUCTLq3/MQA7/X
	fvyD49yRL2ifGONDGB0Rs/wGmvtGqd1S5P+FooBpydBHYQxz8mTtJrvai7p6M2o=
X-Gm-Gg: ASbGncvaz2+IVSupEmY3w6xGZxJ/4dM8NkwXU7zdq5SH2LM6o6QeRHyMv3gkqe0h0qE
	1wkCoZSB2DdW0Dcyxo8TTQZKUu6FHcIv+iLoXBZ/9mgaN8Xwwbf764gx4esHjT8pSHwzwiAIjU7
	031K+i8jzoOYbILR0WHN+OFCSj4rhsMzaQDAebh1KI6PMYdaF0r7LwAfL5B7Nh44+h2h+uCEETY
	/RHSz8RXetfW38ejKepN/BSPlGGGJv+YyW6b/qX+FaU62f/2zluE9rhHP1HmkopRuVbU+gjbBrE
	1Z+Ma7J88xyx+5n1CHsQrIZvo7lmRbuWCiqO4Po2GSB3+pJhRcBmtG1GOCXBUQ==
X-Google-Smtp-Source: AGHT+IE9D9dHDIH8+xKtHJUGmzEQO0mhEEj08arKdlDwswO8uWorHYe0lGPtYSS7JWukag+pUyvaug==
X-Received: by 2002:a05:6602:36ca:b0:861:1ba3:3e50 with SMTP id ca18e2360f4ac-864a2051d04mr59173839f.0.1746039273897;
        Wed, 30 Apr 2025 11:54:33 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648c19572bsm81370839f.37.2025.04.30.11.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:54:33 -0700 (PDT)
Message-ID: <a0ae3ab9-14e2-4ec4-ac7e-a9ad59955df4@linuxfoundation.org>
Date: Wed, 30 Apr 2025 12:54:32 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix spelling mistakes in HID documentation
To: Ankit Chauhan <ankitchauhan2065@gmail.com>, linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org
References: <20250430062412.54133-1-ankitchauhan2065@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250430062412.54133-1-ankitchauhan2065@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/25 00:24, Ankit Chauhan wrote:
> This commit fixes spelling mistakes in the HID documentation:

The change log has to read in imperative mood:

"Fix spelling mistakes in the HID documentation" is the right
phrasing.

Make sure to send the patch to maintainers. You have to send
the patch to everybody get_maintainer.pl tell you to.

thanks,
-- Shuah
