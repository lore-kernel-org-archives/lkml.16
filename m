Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C740182BC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773704; cv=none; b=TzjKNCCP+AGt4q7OCKM1F0XfjKOsbXbTV8Xldcdrph7Zrp2Gwphki751XB+VPC1VauQgs2Bo3lr23kYSNlgMFDQ5Hkhn9DqG7ijGuTb1hLunfeau1GlKAuYLxakhFHTVaIpg0Os+CcbnEgG/wex5PQSZFoBqxqWs1cyUtCxpg14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773704; c=relaxed/simple;
	bh=VzPfPITKsCCZORcaUDoRc+xMv8uwmJxaFZiVt/qBSs4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UHpr29hfHGeq0XGqJ9LWTmMhw81KPeDypTOq6kPxeyPzAO0AYR39ZCVvisznjUwiqKNvCa0kjzOVyO/HB7j/GupoIGzMLqql8OsGa+bzu7mvlYYdwzxkrtwhGloOmW3lrAP+Ipfp0QjDubo72VtA/g/Aic8AbuY13dPLAY0iFXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=tp9No4vu; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="tp9No4vu"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85e15dc8035so181431239f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747773701; x=1748378501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNdOlqypBIUNESah+Ulojz60abI1sJD+ZTLBoSec4Eg=;
        b=tp9No4vuTlup8N/Dv1MLkpOTsID5zyQ22hjEuvtTTRNIYu8Ap4r+6HmaGUiGybhvPa
         fUPgXxPyxBJvSzsNlf/nj6Kjov9d9oMukWMU9TlSWgkiISpJGF9GVLm4zeuLj4kJ4EAp
         K7r8JfaVcx56gw5OOQd64rFfZLKNs8YwP8kfnxkisiKyHtp3xZepdK/sf9CI5cLfERBK
         S8l/SKKKyPVtJgwA2X02QibFU41wyDzV+FmCyGgSiR3BauwaPB11PDK/X7y8sXRL9W0g
         WxLbCy5ox9DqUMod4H88lc5OfCmZYoRiKAyUd3gWLqWeJwQOOHiznp1y0pFLjwd6Mo8c
         +M8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773701; x=1748378501;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNdOlqypBIUNESah+Ulojz60abI1sJD+ZTLBoSec4Eg=;
        b=XzVEiAFcQR9aoj1PkliYzormKi/vFiYjoy2s4XhlSbBRP+TqRXucbbwi3ymG9PSDSI
         evWKSJSKzOzzZFVAcmMMKo0cVt+jAaD4az3ptksdXGS9t0wzKPpwCnqZW/Auc0Jdy/vE
         hSwr1KzlFFXmOYvmslFEBjxcpM1K1UYC2TFGbzQVaqj/8NsUMNYjc4TDUXDGXwt0Ag24
         r0f+NBHME5M4qV1hPsPZgRFdDlgP90dLJ6Oq5JoyOvYr/Tn3ksGEZGtI3bVc9mdGkd9o
         vTqQUnJpdGtKSyHGGjm8MbvWW+wAfbPa9Gt5wzlUUTqYO0hjhUoFUmqTwAADb+M04yq+
         eKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0i89EP5OJks4EkG8N8vRqhh0sEr7Qx6WdPLHl7PgYJr8OFN/OgBmSAy6MRM4r8xbMFnem1m+QAx7MMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0BuS0ldXJ9+oW55kaL5j+cuqlfZrcVWbvyEU29QeCEYeS2wIR
	iaw7PFi5bNDY/GvGKfFt81tjzJ781Qu3mZyBNz7XSYtkD53LF4F2Af9AWEwkht5IrNw/9XE9qhs
	6nbty
X-Gm-Gg: ASbGnctKRWiWdvilrPMLSFoErw7lXjidkBrxasXME2OLcnFAj1aaZ+FlA7HsBiUt3ut
	5JraCJbBVNTsv7cJRzOCF0+HyfYxQBjPVdQLnsLU3whSOB9Vn20jzuhMedA3N3yfUkCRrxgt1sx
	/M9YgsNV4pXhOfB0um5P2Ik6333qNn1I0/F9gNY9kQRdGAJl6TV44lLKIV3bOsDv6JDsvNVWaof
	RingUJS3MWd2lGr+RODdhBUJOG86MeOJkPmV8KjT6WRRlqgF631Bp9e0sohP4hjxsg5wHcOXvs1
	3s+fA1MVnWUWUetKHcvtbwPPQtZ2A6054ptQ8mE0mISNHlBpbiYxwHbk4g==
X-Google-Smtp-Source: AGHT+IGoX2ZD+tZNrNlsPsiYxQXrZz/2hD1on2CL5k4phd3uJg7N08v8UBDuao5gQzQtOAWD1KMuhA==
X-Received: by 2002:a05:6602:4a08:b0:86a:84f:7a45 with SMTP id ca18e2360f4ac-86a24c131a4mr2529701739f.8.1747773701247;
        Tue, 20 May 2025 13:41:41 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4ea5d9sm2362573173.141.2025.05.20.13.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 13:41:40 -0700 (PDT)
Message-ID: <36ccb46d-5041-47ce-b419-f49ccaeece9b@kernel.dk>
Date: Tue, 20 May 2025 14:41:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: printk NMI splat on boot
From: Jens Axboe <axboe@kernel.dk>
To: John Ogness <john.ogness@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <a93e1a96-3685-41c3-8979-472b20dfca14@kernel.dk>
 <84a577t590.fsf@jogness.linutronix.de>
 <c99232fa-e861-48ec-8438-028e61d3b744@kernel.dk>
Content-Language: en-US
In-Reply-To: <c99232fa-e861-48ec-8438-028e61d3b744@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/20/25 2:18 PM, Jens Axboe wrote:
>> What values are you using for CONFIG_RCU_EXP_CPU_STALL_TIMEOUT and
>> CONFIG_RCU_CPU_STALL_TIMEOUT?
> 
> CONFIG_RCU_CPU_STALL_TIMEOUT=21
> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=2

This was =20 btw, guess it could cut a bit too much...

Changed them to:

CONFIG_RCU_CPU_STALL_TIMEOUT=100
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0

and complaining is gone.

-- 
Jens Axboe
