Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB2E23F296
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461115; cv=none; b=m3ZBrz12HVcDXvmXLle8Kr/yoEukQH4N/+NI5+9EM3XPCz5THagIrJihHlJmqkDQEmTSMVSGtRoYgb4ubGeGtZyaXFAX4nq3khF03AA1VjcDB7X3evEh/lLmJBxDf4XuGAaXPsBu1ocP1hqibMtIBB5N78/PRqjX+GIWYpjf62U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461115; c=relaxed/simple;
	bh=wLJ2lOHu7SJWYAnbr7bH25YB93XP7KEYlifhHrYsusQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJrf26yYmxwlGhjSsXldTJmZmS930GvoE1jhu7rszoCBU/N/4Tin3XoqzO1wIsT46M1POlmaExRIobK5JLdWcEUowo6JtDTm34KZF/hu50HE+5g03+VAMlDaIiDvObHg51VqYLqsFAtAM9P7XXX5T44KqOxe3ksC6+mGBr0Ktg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+pxpuO9; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+pxpuO9"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e7b4ba530feso3890588276.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751461112; x=1752065912; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SRIqoqvbfDk9YR/sPy7y741GkF0mj9QBQEldHtyNRH8=;
        b=p+pxpuO93qg2Bn1G+WepXOMMDyg97uspLny7MsDT6/PwkII0p1ySOjcnwQhxjtSSuZ
         qobjMwC+oBX2NWq3d6GoKq9csaVR9RQO2f1qXkq8J2LO9WoZ3KTdb9ty1LlSk8fvjojR
         2AsdJE2kvk6FAf03jsrl++kw8iXNTR8Cwe14qvjtQiFsMsI6eENXMZQO8ai5z7mNPX0k
         6xGdIlHKFrzbE+KLmPY0V5jxWy/ZFy5qwkZdwYtgIJibd7iYIz2I4vEhhcmcqXDBTcQi
         xyniYUakCk9JTdMrkUqKEFJOgSLsMRRMrHjDT+ilbz7rxRW3Q5YiRaGIzgTDXeBYLLiV
         3z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751461112; x=1752065912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRIqoqvbfDk9YR/sPy7y741GkF0mj9QBQEldHtyNRH8=;
        b=jVFf3ZhJkwk0E+nfRhl9s8PPnON9q1yxLLT+qzDCvDY6EXxRHA8tN3G/wwdBiZnIOm
         2LlyCXJ8776bQ18ZdUbqQV63DPfAN62059BnGXI/AWNSEYUXVtmYghSP7eiz2P5EbIRV
         Moj4ADubVRlQuNS7t+U6ZmMS3H4EQry3oP8kB2YsrQkVxvKrfTRrme3nwFLM8Xz6NAed
         mJyWerqb2tjPjnlkoExUXKpD2UHo+1X+fdXSBCiynWRx/2N6NWzobReme/T0XBWgF+hz
         B6ttLUfWsTtHLvsG6E3NEatJy1fKzqUw3cNBambLaS3HeReiq7F5aQTLpwyM3xaBPyfZ
         E6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9iQmVKp0EJ54kbhBMdlXWwLdB0LLtQLiYXzleOhC0E1yClcHM/59LBIgKeCnY9qfRE8yK5QsaqGH/uuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFuzCAYRExLXwFVrrqlt3aeL2q+cDG+5q1VvJmVEgPbS4U8792
	4IrOFPhlyTcArGD2uMk4RkqyGe2QFvvoRtQhJ75UyQWyVIiLBIB18ImUPcqsFHLnRoJM+OnzvIj
	OsroccmSqfUZfXZi/k3NvAP/btUJvZiwLDNAZnpEk
X-Gm-Gg: ASbGncuulpCcjGBpS6T2VyaT8kJyslXTmd7KtPcmgGa9mwk6Y9x2WcW6kB4W2VEwvjz
	xM/XAQhaXw8xI+m02MjvgLa3PEmxNj+P1n8brgWUOMwLnWnx+mUFgiXe7hGYr1b3gTdJwucsKdU
	0StWrNsrOSLacSIf4FTjOASLQSyeenH/Dk3LlkFT0oWxZ0
X-Google-Smtp-Source: AGHT+IES9yepdlGF69ZNWiFL1/vtA5d8+I7vWDN7lxfsmpwrpBafsM7ggWQxa1AaLLuE2ulmhwdnUj1YzAs2iCghpD4=
X-Received: by 2002:a05:690c:3607:b0:70e:2cba:868c with SMTP id
 00721157ae682-7164d3587dcmr41259897b3.11.1751461112175; Wed, 02 Jul 2025
 05:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630122155.2060589-1-dawidn@google.com> <202507021809.3gclls4s-lkp@intel.com>
In-Reply-To: <202507021809.3gclls4s-lkp@intel.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Wed, 2 Jul 2025 14:58:21 +0200
X-Gm-Features: Ac12FXybBvzfEXfOSH2V6uJ_ja06ZluPvYy7PtAvgnywwBnKjuGFMROtMFqDZ8g
Message-ID: <CAJ_BA_AUphERSksoneVvUm7=Seb0WDAYC-jSkkYDfVe2SYMm=A@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, oe-kbuild-all@lists.linux.dev, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, kernel test robot <lkp@intel.com>, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"

I'll fix the build problem in V3.

I've also found a bug, introduced in V2:
> +               ec_dev->din = devm_kzalloc(ec_dev->dev, ec_dev->din_size, GFP_KERNEL);

ec_dev->dev is not updated at this moment. I'll fix that in V3 as well
