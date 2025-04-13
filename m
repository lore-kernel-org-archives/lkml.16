Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD51A927
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 03:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744516729; cv=none; b=pmalREMNcjBYTElxNdlAQ8pkc2H1dHBHaHlJTvtyElR00JJlbj0YQCEB6Dyq4C2Y2lI6wKqQAY1JRGPB+t7a1xzsTZznrF013pDCSCuqDDS8i1s7EtV/5aQaTyljlx4uaKBI4mcrF++s8Xi9if5Ce+BgGw1Fx8vlb5U+p2UCcts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744516729; c=relaxed/simple;
	bh=vDBAAeVN9NgNofdm6XYuFfHf+Q5yKWniLl/6YBgpQ+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlDxU5ztLUqTQfP9DGAQTxYyfT2ShCLQ6U9irJymvcc5th8bLCoLM1qy4T4NWjpLlHsgJ62fFTrTEY5juuYwdIInRFRaGDx3U55kogRNlMocGC3DnjirqfUJRqd/vYApYR9lokhCgvIO4J9zXeVC3GfywXhK/5NIv5TAMomDh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W39aq6nR; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W39aq6nR"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af589091049so2205041a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744516728; x=1745121528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9FPY3HTHIj03IKmszQnH75Kpen2MmUTFxMzTsDMW6M=;
        b=W39aq6nRgAW5m5bzBedjVZtcl2jK8GdihFnO0p9sasP047bMSoIW3tH016TrrHtNtF
         K5YbnpXl7bmSJwI2pAsTj4TzezTfwr3gJ1orWTjXcGmYdrocH889QUg6yAk1kWZl0mzb
         924yZRhKyXoBbW8+em4r4LSKZVsR6hXuVL8ULtH/5BZx8mvdKgA9mv/rhqd5FXtC/MV2
         OS4GSbYnv/D8anUGNs8UGgL1ZuCsELBFH8TSoTt9ikzgvceirmQengjYT/iMYU4Vs45I
         mqj/10O6hABkyCUXoBxZyaq2tZf5unOq7Y2xByLN5cdPRIuXHxobos1vxZmCbI4ltW4V
         a00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744516728; x=1745121528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9FPY3HTHIj03IKmszQnH75Kpen2MmUTFxMzTsDMW6M=;
        b=GCL8YuE0haIy04u/6T6cFh5MXiCMEOXzyfjqYopCepkPGF+I9wVQFVoIDVmUZ3ktb9
         qUUZqG0DMiNuoFHZTR2vXt+lQhTazQrCsRqhgtWChl6oCHynBYf0F98ti49bCpF7QchL
         ml8bG4tzrh0ewSm6KlGPrWgRtYXFxw86+X5wNx7XB34pBNPRRx2slyZVCrfD9ISpv8Hm
         QHKc/7yZZumwSUTZ/UP9sWqb+/fqiGHok9tqM6TcW0XwV7bzKx0Yr/S+C7AILECzQFxz
         g4LVRMtdLr0EZKXg1BTeJuuQDwUHErotW5CirmrVLyQEejjWzUHuVP8Osuv0FHy1rK3P
         PNqw==
X-Forwarded-Encrypted: i=1; AJvYcCXebHJ52fiNjZda+FZVw8omVNzcDvuvLxNBn3rMuKzYK1lZKutxOMNid7BYgI8AY2RS6AgT6HoH2ltqZyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDt6q3rkJ0nf0lDWTj5Srbme6G22kas2fAaJKr3+Ji7P4YBcLl
	ykfPhphFMKKYYnFB5sPHnTXNfdJH9iq7AI+LJxYmZw7Kmozv2nZc
X-Gm-Gg: ASbGnct9D+wYBC/6a5H/XrhK3ySPiqcJuejlxvpOqBW9ph+VT1mSEZEUFiajS/jQ5z8
	rv9g9CcCBz2v2TSKj8CnNp9FDuTY1Fi9i3SpjGSAPUACOdl2g+07bhiavcxEOt1pZFGfjCWBYPJ
	2F98CE9QTMIpIhmyjZnnh6i3+ij3yTc3NQ1fqEzg3mxtXLR4jGD2BiLU6J6+HZdFVtDjs5cB9+6
	05Xj6EVO7zXmTdQ6j7h/Gkmx1SQwj0OeLtYv9s/Nvh0lxBB4hZBXA+5vKzrtKiEhBeo3mUCIfC1
	VZzrpdJNqS1L02s1y5jp2rG6+QQe2Gu1wRr1wpkfiF1qMw==
X-Google-Smtp-Source: AGHT+IFNzYO6C6UkOWocKUJGaWpoXone2hlK/AtqRsIyacUkJS/m4YkRgzqmHVENHyTnTLM4yXuMAA==
X-Received: by 2002:a05:6a20:e608:b0:1f5:7eb5:72c7 with SMTP id adf61e73a8af0-2017996fb78mr10954396637.29.1744516727543;
        Sat, 12 Apr 2025 20:58:47 -0700 (PDT)
Received: from [10.3.176.134] ([59.152.80.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d2bbfsm7217487a12.41.2025.04.12.20.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 20:58:47 -0700 (PDT)
Message-ID: <931e9119-4dc0-4241-843d-78241dea92a1@gmail.com>
Date: Sun, 13 Apr 2025 09:28:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asrivats@redhat.com
References: <20250412043006.188641-1-tejasvipin76@gmail.com>
 <CAD=FV=UrZ-t8MkH0nY+koBt8NJ3Xh-LAH_ZPirWuCroGQEFNYQ@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=UrZ-t8MkH0nY+koBt8NJ3Xh-LAH_ZPirWuCroGQEFNYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/13/25 3:40 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 11, 2025 at 9:30 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> Changes the boe-bf060y8m-aj0 panel to use multi style functions for
>> improved error handling. Additionally the MIPI_DSI_MODE_LPM flag is set
>> after the off commands are run in boe_bf060y8m_aj0_off regardless of any
>> failures, and regulators are disabled if the boe_bf060y8m_aj0_on call in
>> boe_bf060y8m_aj0_prepare fails.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>> Changes in v3:
>>     - Disable regulators in boe_bf060y8m_aj0_prepare if
>>       boe_bf060y8m_aj0_on fails.
>> Changes in v2:
>>     - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off
>>
>> Link to v2: https://lore.kernel.org/all/20250331061838.167781-1-tejasvipin76@gmail.com/
>> Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipin76@gmail.com/
>> ---
>>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 109 +++++++-----------
>>  1 file changed, 41 insertions(+), 68 deletions(-)
> 
> As far as I can tell, your v2 and v3 are totally identical. Either I
> messed up, or maybe you forgot to commit your changes?
>

You're right, I'd forgotten to commit my changes. Sorry about that. I'll
send it again.
> -Doug

-- 
Tejas Vipin
