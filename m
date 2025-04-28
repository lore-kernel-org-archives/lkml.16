Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F2E1AA1E0;
	Mon, 28 Apr 2025 19:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745867520; cv=none; b=irZlX951Pt4VgZ6Ih7fdVqpGPPtRThOpcgWEIQc9QWQiSPHsLFgPGOx9E6PD+dRRoz9THFGuHysZK7gvJSoh6lwQp4QDZ3JbRbf3DK7PpsPX5lp3iUE4od0V8h9cM+714PMtj2MO+6BzqbiqC3u++7k2xDhPW65+JpgGzKBU8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745867520; c=relaxed/simple;
	bh=nMXxkvFNAIsIwlRr/9Lvu9VcZ/xn0c1Km4miXTgmK14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2G04uhKsYiNiSWhibjzyFwl+0HIud3hiGqFRGp+Olo8I90+w6PKVKETjUlel4QooO4SShADjp/DEeQ+J6bgwiyNEBg+/2QpECiEdMTBctUI29gX6stuwWdlvDyuMZ5FgTiJ33Mxc0BPzb1TNV1Yf0j4OVnOHD7JHSYLjBLrs+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIj7nsoi; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIj7nsoi"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so8152406a12.3;
        Mon, 28 Apr 2025 12:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745867517; x=1746472317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMXxkvFNAIsIwlRr/9Lvu9VcZ/xn0c1Km4miXTgmK14=;
        b=TIj7nsoiMn4PClh6zjfL78DT+B+b/HP0sXx7P+fOjEnBKF96HrTPIj4mwRt0UkRdwY
         GtSN09fZn9CnSrdy71XYgUmYyqPoO4r3y+n2l3OU4spDE5v90o0JZqDY2t+fF5XifjW0
         4dsXuaSUhMTZIeNWqrYot0pL1yFD/gfx5XIvb8KHwjIH9Opmk53UUJnx0n/jrfh0MDcw
         HEehgrg59CZy63IA6jYFxJA83UEwuN5fAP7l5SS/3CxQ/3HnYk+m4/EPwXlnqirJ5INT
         e/KyP7juhze6+zY/rW5fJaPnzcX2snT6AD8fnf0wyR9xu6sW0fgu6JNx+uESHdMk9lgC
         ypeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745867517; x=1746472317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMXxkvFNAIsIwlRr/9Lvu9VcZ/xn0c1Km4miXTgmK14=;
        b=LE57AuLNz2s9HH5WqN/KsHdR4yZFjjmKeZjru/rErZvV97ziHjxX6zJ045hy1GeYRV
         SrxQ8jQy3sS2q/S5r2pZzi9BJ4u91hHAuH8Vi6i7yV0qW/0EgfALfRl7plX2StwVL5Hc
         wYhzMxd1GouJ61RR4aRyIh9uGiRWkoqkzVys0kPIJV1tBrBkohm/uFhET9LjfPWes8oc
         EkqUfgynUR8xNWaO0zpbIOIQiItBmlzS1U8BcriB7/mvwbCIGCqhoUuBW7HObefU2gzb
         qA2PRaBK5xDQJq7OwrTYsfe9iPAb68RyoarxfUSZGJxZ2SX591l1mrXBp3h70/UMDkTg
         NeIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4KgLjXjazafWbabpIj2jdcXZdn9Pogr4WvPxvSX4Jg4DRvMZcnK9Wyp1Wm0LOJqBQEuU1sKGGyi6Dd5I=@vger.kernel.org, AJvYcCXMlQwqkFw3GSdE2plJUQsrCJvCVxF5BTQN1p1Lm4FwulMJGg/kJpKlX7razpwAAFW/B6KpwIHFpVrEcNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+si5mnNNvlolBiaOz2AAXa167Zj88NsysehOEe4wNLUld1pf/
	jOCF4ESl5r8ESLwCFyFQRwsvL92+Ag16huuFB4jo+YP68FI2NxeyMjbYPw==
X-Gm-Gg: ASbGncv+RhI7Ic1eHVu6w0uyADDX9cem1HQREqKtadcQo0gFC3wUAfxpxmq7wFyJA66
	wIbhZox1S26aps1icW6Nt5byDiaFOpWA2CIzvEMBa4VpT6CjCt7EV/Ob6zPrMkLk0TlVNlKRASI
	LsNgtmXUkQmNPwGXd1W83HP7HP8+wQaUwQdVgcvqV38neVz3M8Q8hcN8TT3fo095N/5IqwHsfNg
	kWC2FXucOQcWF3agBKDLbxHV1o5d7OehYhYDaeCCvoTcfM/DWYkS4iEXJL9H6PBLfjUAHmfYdfB
	8K5rOBaQRb/XcfyJcpJ/cNERoDHkeNv1lfWCWAvrxVxhTqBzXce4HUsTJtv3IlgEwVB/Y7otPsA
	1lOi0
X-Google-Smtp-Source: AGHT+IHLk4mxL9JGPRBG3kbuH+YogUlnwtb4OzLlNiOXbqk7ZsLxzJ+oGxU88KvYdFJO0kVf557qZQ==
X-Received: by 2002:a17:907:7206:b0:aca:96a7:d373 with SMTP id a640c23a62f3a-acec4ed9e96mr100546066b.57.1745867517134;
        Mon, 28 Apr 2025 12:11:57 -0700 (PDT)
Received: from [192.168.1.128] ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e70bbsm678197466b.63.2025.04.28.12.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:11:56 -0700 (PDT)
Message-ID: <cbf7cef6-ea4e-4251-b661-eaeff142a0d7@gmail.com>
Date: Mon, 28 Apr 2025 22:11:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: topology: check if machine is NULL during tplg
 load
To: Daniel Baluta <daniel.baluta@gmail.com>, julien.massot@collabora.com
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250428161236.126200-1-laurentiumihalcea111@gmail.com>
 <CAEnQRZByMFrDoPsQ+aoqfS7+1eDuiLGZYYywf+Cn=hGjRm-BzA@mail.gmail.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAEnQRZByMFrDoPsQ+aoqfS7+1eDuiLGZYYywf+Cn=hGjRm-BzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/28/2025 7:50 PM, Daniel Baluta wrote:
> On Mon, Apr 28, 2025 at 7:16 PM Laurentiu Mihalcea
> <laurentiumihalcea111@gmail.com> wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Check if "sof_pdata->machine" is NULL before calling the machine-specific
>> "get_function_tplg_files()". Otherwise, for OF-based machines (which set
>> the "of_machine" instead of the "machine" field), the operation will
>> result in a NULL pointer dereference fault.
>>
>> Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> I think same patch was sent by Julien, but this one has better explanation.
>
> Julien, I think you can add your S-o-B tag here.
>
> Thanks,
> Daniel.

sorry for the noise, somehow I missed Julien's patch. Dropping this in favor of
his.
