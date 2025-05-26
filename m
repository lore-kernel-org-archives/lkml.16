Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6F4D599
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246604; cv=none; b=kTVacBfkW2LKTo+0uerO6vwWSYTiVsmRp3lY5xIWOnpkbV7uZD/HVoZKO85yJ7EGEi4Q2iLP18v82bTxcZ4btagqRW1DLh0hx78f3rz7CKh3PBFbCBPvMim3Jobgi/88NSCFZ+vBabBa3cQK1mJIjTR6V7I3IhKIJlIqzattX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246604; c=relaxed/simple;
	bh=lVTcXDtD6g0a+NcnMtEyejIbZBedLWO3vOFVjaXJwR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qlefok+TO+bNJ35Zk/Snyje6EnCZGxd8kM7GmDNa4siP9wvkAVceghhIZc5i7yJyjVIsNuZGW+XfynPrFIewb1HLt0VGsYdHB29WF9O2pG0UKMAW9npey1zBKBlzCWzun4Gn+nFh9ZKbuB+MR/xZYbVSKO29WFPuu/chvcsu02Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFuGoCFn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFuGoCFn"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a363d15c64so1376960f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748246599; x=1748851399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPYtiJxPEj4NMJqNxT1zar3Wry/PsazM942gqJr3gSY=;
        b=VFuGoCFnMzlwZM82INrnNmRomunKSJNPPQSbu0YqivQvmydzJn1U1yiHCTlqer0N19
         wkjMG2PWiCUuLsqqkCBhNjDc5z3G9PRNHm7FGMQxcwb5m6BcM7qL0f0gBdHFTdvfdV9m
         WsmI4aZRis0d5XNRFAJ8OqU49U0FMWouwW2cqmgq0AoHJAgd7kYiPQXV6nJiw0hswC3O
         7VWHuVTQzrqSxW1yzazAosXTXiWSGEZO4U8kRlAipKZVN7aqzFB07PA2Q6bkQQ8yFMQ4
         MnBMUu7tO+zFJMNRsz9mITrj7cpyvqH1yEyKpXSmhgKIPCCaLNSVl+bMd8HasFYuSkfu
         RUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246599; x=1748851399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPYtiJxPEj4NMJqNxT1zar3Wry/PsazM942gqJr3gSY=;
        b=PTCgXbktnw3PvuFIGfAGTOThXAqpj7FGcbntNc3B/4uq6LP6FUwqrflMz5kQFz9GP2
         5gNsUHfj7wNNkTuvcL1wM5YIOFeYTJDhnFtkkGCgo9cptCDNqJ+Rk8wWkeN7Av7CfhOB
         tY+FleJvh1JVAbus7/crlkqWWiOKMmUkuAWhvgIfrl1LoaNxsjnsD10NaHfkkOiqqDhO
         RgLFullpaeZ/2YjYHntoVVF/QeVoLT1Z15E/Yau1MyW/eCArltC0V0dM5CC/cc5iY6ug
         4qi65LfjFeGwaebF9kemL4mhvj5PPD0iCMSmdRv2Rq3ZeI+isRAF7dQ8dlqvFgS9wtav
         PnpA==
X-Forwarded-Encrypted: i=1; AJvYcCWwCpW7sqH8Lem85YoC5EB5X3RnZ/IK/nccsrBItT6sGvcBccoGscqbRK4vsrp2TKUSMcymkGcIt6Xef0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4jHcW/2oo08EEHYtqllDDtGZIgUy+PJQzWoUMVKEMcjEUlGnB
	M/bswQ5/vOOPeeLx/S2nMGUQlLkN6atKWPYRHVUOZrZw8ncHaWSHIJb5bEj/4LzkGVJwpFQyEBb
	Dhrjp
X-Gm-Gg: ASbGnctsIBN//40LXMagsNlSV6xi1E8g4dJVfGeeVHT06NT3ZfdHwZXreSoSUW9Qjj/
	78FuJBp8/ekpKGSTvCAouyVWjIY6fHKetIwFp+ciXPa8ZfWQUqLM+BShkReabJa0Bl6UPceznxH
	Om6jHdXFuYjaqXQYJ0Q1hoKf8i5f/lXBT8lCKI4eXICZxQNRqtNIY98G+L7/TpJf2ZkCUtwq6YI
	EX/YCJADUl3FEleL0KslvF/jiVQjOaowan4KkQNqnHO0FlICZ0szXNgWOvL8Nu3hWzXhWGDyVjh
	+9Fq3UHiuHYHHkNEj86zRXeASoYMzv4QH9jL3d7c6vdfWKrYTvqqBBpO
X-Google-Smtp-Source: AGHT+IEMr0TmkUd9qX2Oy/Wo5X7vaanyihC1ehKQZ1EHSEnhJI+iGEHT6/vJgAx1HAnkKnJSZJINgQ==
X-Received: by 2002:a05:6000:2f88:b0:3a4:d0fe:42af with SMTP id ffacd0b85a97d-3a4d0fe4f10mr4548065f8f.33.1748246599461;
        Mon, 26 May 2025 01:03:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f6f04334sm224252025e9.10.2025.05.26.01.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:03:18 -0700 (PDT)
Date: Mon, 26 May 2025 11:03:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Donny Turizo <donnyturizo13@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] staging: rtl8723bs: rename _Read_EEPROM and other
 functions to snake_case
Message-ID: <aDQgQw9XZV_7BIf-@stanley.mountain>
References: <20250524173745.4907-1-donnyturizo13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524173745.4907-1-donnyturizo13@gmail.com>

On Sat, May 24, 2025 at 05:37:45PM +0000, Donny Turizo wrote:
> Renamed _Read_EEPROM and several other functions in rtw_cmd.c to follow
> the kernel coding style (snake_case). This fixes checkpatch warnings
> related to naming conventions.
> 
> Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
> 
> ---
> v2: Initial patch rejected by the robot due to naming issues.
> 
> v3: Rebased the patch onto GregKH's staging branch for better integration.
> 
> v4: Changed the commit author to my name and renamed all remaining functions
>     to snake_case following kernel coding style.
> 
> v5: Renamed command _set_h2c_Lbk to _set_h2c_lbk to fix CamelCase issue.
> 
> v6: Actually fixed the misspelled name that was incorrectly stated as
>   fixed in v5.

Surely, this breaks the build?  You're not working against staging-next
so it's difficult for me to apply this and actually check.

regards,
dan carpenter

