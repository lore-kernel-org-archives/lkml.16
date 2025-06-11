Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E62417F9;
	Wed, 11 Jun 2025 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674224; cv=none; b=n0mVyn2GvVbX0OZRK+4hDMZoXaQ7pcMHPU4SxY2pCRmfYDQ40H5g7Pkz0/1v/HEtOcA/9R5SRQIyJ1Vb/P9aAExg6SZ2UM3kl9yadlNKt5DpHehq9SeV2lb53V6ohnBsY9YHAiKUxrpkY0qAGf/OmknXy02srSrjJZc+VDFEafI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674224; c=relaxed/simple;
	bh=1jbOlYyWsSoJxJHBsx3sUCKjzmm3R5e/MzunKmtDyiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceZpOpqma0mO57aq4cE4mshxBXFvl/YJUtEIDGA57Kpn2e5SgqKwRhUk9TKGtdWqhvGQZFfWfZEZott5FnBkNeRIj5YD7xct1lfVdEpXKnYiG/pKIL1nWG7wBv8Jg31u35GDGmebHk0F6Z50SFnRRLWqzpMX8AXfKth08CY0t3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+Lsdt3A; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+Lsdt3A"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73502b47f24so199240a34.3;
        Wed, 11 Jun 2025 13:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749674222; x=1750279022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jbOlYyWsSoJxJHBsx3sUCKjzmm3R5e/MzunKmtDyiI=;
        b=f+Lsdt3AMubXsr4xsNjHFpepYW9cJEwkRI4n5vrxZOqSKMJC6YlQIc8kdBGzeQJTiI
         461iUPVLj7IyzRu3T9qCnm/EAq8JYcP16tTOHmGzVFq5VOKpzMC45vGK+w2+4rSykVSk
         f/x4GTQz1AchpC2ob41Ggded0djHbl/McpF9Gyq+jc1Fc5rrFL+3g/Fwi3L6oqIhJCGW
         VFO8zrP4knMgrelvC4o4yCeQh66T2WSRABm/Z178GKbypN/zrcw5uxMHNM7MRiZ35Dyi
         HqmvTzequMJA8FglBO008esvfRt23gc+U244EbcAtmLTvsZ00OBc5ltN/3NDz8o1zHFN
         Nr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749674222; x=1750279022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jbOlYyWsSoJxJHBsx3sUCKjzmm3R5e/MzunKmtDyiI=;
        b=mvdp30PqPsn2gmVj/nTK4kQuawyIAk+9dqTqeeT8lMAIujJRNF7Aw579ewwPW2QX8g
         qieDawE0n2DdXWl7/3nQyOUeUXr489Ab2/GknUO6f9GKRQRwM4YdyfarokLAm2SkWv/W
         VRDs0uGRbFIaln6P3oZmJGS5bWFajAmEs4NaPTfYaF7wJOPxZht9wK9Qjm3QW+R7EDlf
         KLoZMqSvKDxqZv1WGEqnIGufIczirDnahKpnJ7z/8FmxtDjRFuRyOiD6hWr5yjqPcbE4
         OBcd/MZQ4lyprk/pJikh5mWofCI6tPtnpvkgW8sCXI+UiC6Iy7fM8ouegORLYF57IByq
         qLzw==
X-Forwarded-Encrypted: i=1; AJvYcCUJLpWoEBowRZLHI0qOyIL0uExgStIMSBP/3K8EQtcOkr1XaDpxHFBGnBQWH5L5bo1Hq8cXsCql3eRgHUU=@vger.kernel.org, AJvYcCX/RI9Cs97L07SHGjQE5exj9Ai7gpWd+GcdsW1L96CBruyDHpUIDgLkXq0aWWvv1LTb9ZiF/VpSQLZE/0oXt4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/XSUUc7MSbMRCgudb/bt7bgikhYz6Lmjuck3zjm+t3V3CwdD
	yKEM4oZG2knjQUOGR/ZjNi8nS9fOkMxacKqqBfSlZbPkhfBq1+ItMOO86TYJQErH
X-Gm-Gg: ASbGncsVzuCrhCWrIrTAUGAwfIX8gFpGKWNczmV6/UHWJ+N5ItjOjilrwgmF1WUwag7
	RiSOULezQtVrlaupt1p1dIorjKMgH9YiDvNNCRkHedyOYQ8aBRu8jksODCMuQcmIieoDLwEyBoh
	EhytZtgs+Oxw3rvIBjWn+f+J/Pn60zPqqWbgnAHno5fU3XRpC9xpH1AipNliT1OfNZI8RiEYAZ+
	zxM4+83kA4iS75CD7cXq9yhQjgc1onJts80s/oSxvt38iKA/lDsjVDlIW5nOQf73nrgsmiM44Ea
	U/bX1bNjonsp3BW2p5L9AW0kevogDazU6UxO9azPp66iPlOf+FHSOKjHx33umLo+fKW6Rboqk9I
	XQHpj5XblwkLB9OVgVd/nYBaUPpEQyz8EwQ==
X-Google-Smtp-Source: AGHT+IErJ8NJhf6Vhrhca1yGF8W4XUxxLs7Fto+rdniokphJ1xX6Qj+ipzubz99cxUXgc5ub6Oyxbg==
X-Received: by 2002:a05:6830:4d87:b0:72b:ae42:3530 with SMTP id 46e09a7af769-73a169625d0mr128032a34.15.1749674221686;
        Wed, 11 Jun 2025 13:37:01 -0700 (PDT)
Received: from [192.168.86.39] (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a16c96873sm16985a34.48.2025.06.11.13.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:37:01 -0700 (PDT)
Message-ID: <baf577bd-61d8-4ab4-b815-70b2e989baf6@gmail.com>
Date: Wed, 11 Jun 2025 15:36:54 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] rust: add suppord for dynamic debug
To: jbaron@akamai.com, jim.cromie@gmail.com, daniel.almeida@collabora.com,
 acourbot@nvidia.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, rostedt@goodmis.org
Cc: viresh.kumar@linaro.org, lina+kernel@asahilina.net, tamird@gmail.com,
 jubalh@iodoru.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250611202952.1670168-1-andrewjballance@gmail.com>
Content-Language: en-US
From: Andrew Ballance <andrewjballance@gmail.com>
In-Reply-To: <20250611202952.1670168-1-andrewjballance@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/25 3:29 PM, Andrew Ballance wrote:
> This uses the module_path! macro to get the module name, which will not
> be exactly the same as the c version if a kernel module contains multiple
> rust modules. e.g. it might be "kernel_module_name::rust_module_name".
> this does give a more accurate description of where the print statement
> is located but it exactly what the c version does.
oops. typo.
is *not* exactly what the c version does.

Best Regards
Andrew Ballance

