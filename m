Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CEE208961
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446182; cv=none; b=R7kb07fu32sbUpUUIj8PuAPcGWkld4Jz/MT3B+trh/83QHPzYKj608RT+bN2b8Sh5kQ6fbo2+ivam5JJLsw6RjzVqGfFqKAQTwno3DV6OPqERaS0tX9WBR84R3rL216meMdoS0wy0X2b1X+fLwENNVL4tLohBvhlQXCDS9N1MdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446182; c=relaxed/simple;
	bh=jg5T4KVLUhTRrdF939eO28MIkOvTR/v7HOz5BEHUbdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiekRBxz5OecJto0enzWGM3ujiqqbaKVHTNHlN2JEdyQs1B7zMoyF3e189tqECN03Zo3UXsTHLJqi/FGqtRcbb3Exru/J5w9VBvbbg+vHsup2Y2paTu82qCiz2Wi+LRHR/1f7MeSUp3F8xBumxsjJBtkYuphkXL+O3Ab8UIrERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f4r0LqxB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f4r0LqxB"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so7567522a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746446179; x=1747050979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jz68Uzn+xh70gzvNlWX0MbH0mKkRQyVFSCgz33BJirc=;
        b=f4r0LqxBXh6i+rDxN+IG/2eOhOZ5I73nXOkeVS7dPspT1gBn6Obn0xt8LjEADAogjQ
         F55krbcKtdSvvVioWONZdrr2NqdeXhFXu7KrrFA9Fs6+5W3reD+yoFWZBGEYiqrKA9xy
         kxDbcKVHlNGkC+B8kZF7RZ8/yxWFjFF88ymv4w/A68mQaW49jvDx6+3aNSY8ukQezoZC
         gHFJ1g20wuGu/5XgS7EYFLi5S3OFhPfPJWFzodeWVY6Ql2d+UOzRwls80rCNZGVcisvi
         C2p9TdfuuJkmHVZijAu9/sjztJ8JiDjHu7L87e34kjPG3UdwOafc7lVG1ARXjbMyLLe2
         yTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446179; x=1747050979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz68Uzn+xh70gzvNlWX0MbH0mKkRQyVFSCgz33BJirc=;
        b=w46RQnnJx3hp3cJ1iWiMweqOiXGZlJFhLfjMqOIv+Tk+UUm/qNE/6VTBi8i2/5QpvP
         BzAg885MONeS7HX64IS4Wgt5LQSyoWBG/86ijd7X2I00Dk6iEZODh+oEtARbam7ntoyb
         TdJsdhAC9v5/EaH/WkKt4SRvZmyalng5sE0fnTOYimnM9Lszs5KJV709lqUuXsBCxAPJ
         02YDNFT7m5uKf4l5z8ffM3jvcYDHoL2UaqpflJyaxnSZwaOViQ/aRWWwnIuPXfcqFxGB
         4gG+8LzvhboyUU53GxRwsg4OeR3lU5yvOni6++njnsbK6zZ4ihIYGqtjU4E1haN81dA4
         NDyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFOjJ6qfUVt7AsjitVLvvrcyD1uP9lSuHR3Ku/Y4P85Ylq8iQ/buPQXqoLdZj82LdjoQstCw1ekZlI/VE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlupIOY0L4HupyXLizeX2G6knjYQzcelEEbfA5pZzsHGTiZr25
	Vf6+io9ASGZTj0RDZ9JUWf5B3ZGU8n+S4/mgPinTdpmQUFMhs8+x8wtLGSDlXUA=
X-Gm-Gg: ASbGncu3JkJxGYIhW9lwgorqy6azmH5uA8PqgCCBhhSdBpES+AP9dhdtqHJTbfHve0L
	8VedY1aBj5Sk24ZkTGJF9/G+xBvrratBUTZhwOJAbXiqXLQqUO/1HNaZgtoTVyZVDMkJxBbSKWS
	XiXjKj6hS+jvctBepZ74khtCFuWp9GBBYI+CV2oBBfZ4/xE20F5AnlX3h2fzQAlXKtV/HEm5zSC
	JEj9VaWIvAqCMmiRMeXmPK6Ujlhsfhvtasda7F38YoBRq64wX66bEkSbrHgf9/FZd7vQDspkuVF
	8qbKTRrnLiKQqX8MmNs9q4Y3Q+fGZl80UTkKA/j2PkA=
X-Google-Smtp-Source: AGHT+IEt+litOx42ovMOLvvM7tdUauKBNtX/69p1CCT5Gm7nZ2lwM2QfZn0MkxZtRqgHhhDURf79rw==
X-Received: by 2002:a05:6402:5215:b0:5e5:b388:2a0e with SMTP id 4fb4d7f45d1cf-5fab056de14mr6858941a12.7.1746446178782;
        Mon, 05 May 2025 04:56:18 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77c04411sm5281064a12.67.2025.05.05.04.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:56:18 -0700 (PDT)
Message-ID: <18f96f82-8d26-4773-878a-5110b19d42f2@suse.com>
Date: Mon, 5 May 2025 13:56:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gendwarfksyms: Clean up kABI rule look-ups
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250430214049.2658716-6-samitolvanen@google.com>
 <20250430214049.2658716-7-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250430214049.2658716-7-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/25 23:40, Sami Tolvanen wrote:
> Reduce code duplication by moving kABI rule look-ups to separate
> functions.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
