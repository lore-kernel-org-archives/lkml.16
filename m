Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FD51DD9A8
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743203053; cv=none; b=k8u7uTfbvYAG5YxYTaWNLTQtR6LN2IoRY8ww6YVp/JnivG1JIIsBZskbDNAljadbMyxvlWfkpwcf3Nz+3SZ1oOYEKGwN/q1Sxx0vh72ei0lXtMufn0Cor64YKp941+ZR/xGb/Yzm1vjsoHvzP2EPBZ3KXY5jZ/tnNPtZTCIFEVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743203053; c=relaxed/simple;
	bh=V/Yo9JaPudHdUaz/y8DF4V6JJBxzXUoyxnkqIpft2S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyqMrVXU0jeB/Pw1hejwqeVWm3ENX5GFZXZbi3vSDyfIpqD+qXv8X3eF/yTnuCxJUk4Fp+DzJoN+mkbBNNswYv2ITqb5gCiJP05/7LzxxZ/3t39uIQqtNcofgvt7FzvD2xxCLWRx4aQHqOxtXlTYwgyKoUL1/qXooUal+4SVBPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=WfnjjzLT; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="WfnjjzLT"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d439dc0548so7063435ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743203051; x=1743807851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qhp4FjWVQrvvO+GlfbQLfHCrJZodz7/Fm5AMhUdc1FA=;
        b=WfnjjzLTVSPckitKrYLiczzZgEFBsTxx4C7wwIn1Bp1WKWEI1Csk+l6iJNhDSszU+t
         T9hW2S8YmuC3hQmQMBPI4UQ/5wuaM4ZK+2pSkuonPT0v5D1cgRcwsujB6DITEaLyw6X4
         BR16eBFgh8lkb9g2Ho0mNTXFDz6lrSWr5C5/97hxbCryjBZaTc/K/nMbCPSKZsc43GcA
         JShCOldn64+NXptX6QQ0XSmqM+jXYNG6e/JlhYPS0RIIiMJhb/E5xXLX5biv9OLpLoTN
         lBuhISS2/s/KgUBCDXUBQAm0ALgvptHApm9qYoaxQUwpnbUQYI/L4AXXYsL6Xa+p/Mvi
         CcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743203051; x=1743807851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qhp4FjWVQrvvO+GlfbQLfHCrJZodz7/Fm5AMhUdc1FA=;
        b=bzLwCX+ayxw1kRYadLJ5ehqiUGy+RPU0C3IoH6DaeEB/8pAVdKlOotB95/gEQLJcXV
         PS57QG8r6hpMs6WPL904lLCzRI6kKjCOeWvXuiMHdKrZQBDhdYP2cCTQZQgnl9Nngh1C
         JmRuMVcSppnZbI0iFSuQSFJUZ/x4A/X3Ll7IsAJuCi6+1xjDeDIajBGRzUiCkDXq9yJE
         aMZNHeEPAVC8cng4SnCtVB9dXJ7IuFaywewOlnHi4XDcPE4C0U3B8QQzFtV7SCeZ+O/m
         Z1ran/Lh2pagdcFCEGm63Y41l93F7U51oGerczhjc2L5Asiu3ZmFCLg7nV1+KTZ6EwlK
         HKHA==
X-Forwarded-Encrypted: i=1; AJvYcCU510ChkWbL0OxdGry8h2WPk0oQsChgR+gJkAhzRoci5rR7CDTGlaPf6RkIk8t8kDxl/4MfgTK3wZQ7O+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWvU1wAifJg2QkdxyEmZa+2QBOckPkcNHsHE2gbA04IaVdBVPG
	ZgEoA4rrSthfiyW3lgrct23prT2ZmfdMMKfZG1dtIE/9v1D9a0aNj66sI66/yE4=
X-Gm-Gg: ASbGncvzB4+HjF5LjbuukLv/Csnlxpx1+PXSk5yhYdzv3iW3M+Y42zy5mwWw6SvArU+
	r7oedVL4r4Vd7RNvTY32XgfBBPLOUO48nxoR3sFEOF/0CTmIkIjvI5zDAHiTTPAgjrR3Qp8rTH/
	yLqhk7uwpKK41s+Fp8sE1uNbyrlLR+gFjNOS0GV/cezXZgblSn32Op+LpXe6ygNVdOcJV761i0J
	lgoyLEFvuWsB2sOlinv2tcl3LOLLLolyXD+l26nEkwDJFuTbpDA67cbHW4kaiYV+71KVo2pPi4o
	Txr5S6/X0mPCC6q9ENU5PbDGvh+dmlMjzT++XoIyTw==
X-Google-Smtp-Source: AGHT+IHPLiyiUBHTmY8K8liSQ7EueqnYy34tBm9yuLIaqAlS1dx00t7wM4dbN8H3iyc2RlQhEdNkcw==
X-Received: by 2002:a05:6e02:3183:b0:3d5:e002:b8ac with SMTP id e9e14a558f8ab-3d5e0908e3emr14696755ab.9.1743203050568;
        Fri, 28 Mar 2025 16:04:10 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464717e3dsm651238173.3.2025.03.28.16.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 16:04:09 -0700 (PDT)
Message-ID: <9b65632d-5155-44d8-9dbe-5026a1cc471d@kernel.dk>
Date: Fri, 28 Mar 2025 17:04:08 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ublk: specify io_cmd_buf pointer type
To: Caleb Sander Mateos <csander@purestorage.com>,
 Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20250328194230.2726862-1-csander@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250328194230.2726862-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/28/25 1:42 PM, Caleb Sander Mateos wrote:
> io_cmd_buf points to an array of ublksrv_io_desc structs but its type is
> char *. Indexing the array requires an explicit multiplication and cast.
> The compiler also can't check the pointer types.
> 
> Change io_cmd_buf's type to struct ublksrv_io_desc * so it can be
> indexed directly and the compiler can type-check the code.
> 
> Make the same change to the ublk selftests.

Looks good to me, nice cleanup, more readable now.

-- 
Jens Axboe

