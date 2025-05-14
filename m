Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E35E202997
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224187; cv=none; b=BslKzYE8K9ntBpRlbhpTgfqxdKPhT1oj8eeA7+JoysG+zTR41CF2UxQEuK7D75xd464vMEHCgMF7RvhKFOCKVwpezBSEqsP3/WxpYNZnVquv4m3NteXpw27sOQwJeyu6nhq+nStjEPqdzGbrha6XKmm6aE1LGl2VzDpChtpwQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224187; c=relaxed/simple;
	bh=/e8//jJKlmMJhf7HEe8UWUZ4y+Z1knUyOL/nhb2jnn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UT3XuCvg8UiGawMibtAbakcix18Eb+/65p1HG6NgnjRJShS+qOgLhZ/5KnmE5qWQE7RlWdTlH9h6/7hRiPpbDuFTKDsMUyrf5hRKEAJ07U4yx56saK5Z7a3pqLQHxJ4dr5GuvUUbgCCSmsaG3SLGHbxsoXyCXQyQTsI230bCdCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RadBnhL2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RadBnhL2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0af41faa5so3770345f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747224184; x=1747828984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJGh2mXF0bVKVAybwQr/GYWPBqGm+3NY+8wJULgeKPE=;
        b=RadBnhL2WnNmApiYwGsce552ojTkAbUn/N6z04ianTlZ2E8gHDfyqJJpj1iSCNUDlm
         OsH7xtM70WU+NZc7cwh55dlRMW/bVD1vWN0+OH8RU1k9gWJ+zXuxQMC3nNftZ3jfbgUj
         B7aaUAjr7SfFiXna0+SLcMooXUI7az8Xx1qCVVTU9ze/0h383mMNbdUz5J1BtF4vCdTj
         POamBA7Xg8EmcXv2CFigT8H45m751RC4vcBCAWjG1gTsdx+t1R3zNlr3E/DwI7gZLK1Z
         4IJKAa7nhl2h9w/lJW8TuFBbq1gzxPlvQEx625JFGs63TZoY7vP9tV1ldvX4S1t4RU6K
         8cLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747224184; x=1747828984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJGh2mXF0bVKVAybwQr/GYWPBqGm+3NY+8wJULgeKPE=;
        b=wHFiaoiuoOSDNEURP9Ram3pMY2knRXqyglnk1MrVyg2RJBCscnvq7XASNQKyN3KTNc
         k0OyJc34e8PxcAyly7yuCH7pCtlznvI6IYyROBAaB9DUK4F2xpwAu/rl8F8oSUcKudm/
         5seQ1m8UMpF61lTwH7GfnRoUavEhjEaxOTXHWqrqwx4lCW1U2LbIMF7hHQ0wsDkXaZHf
         Xs0erTiZdWBbXfq6roMpQIHIXvM/QPYwuzPsjKLg2Vnu+kSnLPsSD8aBIy8/8OJ3CZQD
         wRntHu1hCIyFUob+AqNoDiK9Mb0f1RhfR2+HAiUb7M9DM88ekeQ5nD4Om1Oj7JI3WPnX
         p3aw==
X-Forwarded-Encrypted: i=1; AJvYcCXdKFu1H+jBmrCS/exAvA6n7uC5jL9IHaDSZKvSZItveU5aAQArIwk0G3fKblai3pvt/4y/pIwwjWtPQcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuk9jGePCTXt94vZi6N1YTHqCXl0Y7AgLaKIqN44MN8hBna8Pm
	jFIYx/lEaEI4v2fUXf8ThafEMsi3ophT1J4jhYInV09m+Hr0/PZRC+T5/vaahDc=
X-Gm-Gg: ASbGncsEV9y6ExCywjHxO+bFYZpx6fg8jN0PokcAfQVJ1lmR0B8WepT/X2dGGOZf/vn
	Lp75MdA3Zfi1jZG+TIy+5r8m080P6GWqvAKqYyUhR8w6uqRmyKBH3C6bDa8KCikv+2sBLIqbH6X
	StGZXAeVRMswdin8B2K4Yn7qxGm5NYDrxwYDZZqx3k+yxJ8nS8e30VotplmnotVuUtTom7auKgD
	o0JJyxbC+V5CK3Hk5f+6wFCiHl7wJlWbgPmNClgLiqZ0LsuXB743QQF9ep87TUrYEM2bRca4SiM
	BDBSSiLWRFCUGbcUTvLBQyT+xdg05BdLLuTmQs0W2PAYl+YJY77xQgCxfUu4c+OwgUEvDUTOlFk
	9o7AgmZEMJFzSActjrg==
X-Google-Smtp-Source: AGHT+IGKQtN51SEzKvrvqBsrqzHJrZTVdAS+jHalaaHKYdeZQjK3ee32ZN36I3wBOBBB+9FoxsnP/g==
X-Received: by 2002:a05:6000:2a8:b0:3a2:3c51:f4a1 with SMTP id ffacd0b85a97d-3a34969ad98mr2532288f8f.7.1747224183605;
        Wed, 14 May 2025 05:03:03 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:b101:9ea2:16fa:3380:8e40? ([2001:a61:133d:b101:9ea2:16fa:3380:8e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec8f1sm19200761f8f.26.2025.05.14.05.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 05:03:03 -0700 (PDT)
Message-ID: <7419cfbc-1269-46fc-95b9-502e6fe23226@suse.com>
Date: Wed, 14 May 2025 14:03:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: David Wang <00107082@163.com>, Oliver Neukum <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <51fe78fb-5d73-458f-b3d1-fc84cd6c5869@suse.com>
 <484fe5f7.9d28.196cea2c6db.Coremail.00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <484fe5f7.9d28.196cea2c6db.Coremail.00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.05.25 13:51, David Wang wrote:
  
> I am not quite sure about the concern here, do you mean somebody create a urb,
> and then usb_init_urb() here, and never use urb_destroy to release it?

Yes.

> 
> That would cause memory leak if urb_destroy is not called......But is this really possible?.

I think a few drivers under drivers/media do so.

	Regards
		Oliver

