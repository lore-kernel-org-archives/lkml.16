Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD3912D758
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613461; cv=none; b=DdpS/DLK2upHZ4jEYKvaXEo1fl1nnT7qTVXH42vDOb/tWRiK0JYHQLH9VR4MmyULcgWtAo8JNj4odyCewnypoO0ltj+FClfbXmoQQVRqa5L633daEInA5CSmwhaZkbd8eDSVJZ9oQoJN4cdxxriYUNAFJJTRiIHgu1EFJKCmY+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613461; c=relaxed/simple;
	bh=1+r0bGRW58rwRex5zcwTIXrXeHMBdPDZ5Kzp9G556KA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Kd7VrD9xFBbYfLNdPHffWMN8RRUP+W2LFsLtA6JCuqn8ZDJceSj6WhUeN/rAYBWwmzdiuqD8gRtYeurHp7bZ5zTDPX6F07ujfhBiP/5aYCTpIz8nx5EZ3SJAsl2QzUyUPUureVsTPZ+yIDWC8+yPVjaHRMQ+ll8GbVxpBGHWIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JVP/eHvb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JVP/eHvb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4d33f971aso1505378f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748613457; x=1749218257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1+r0bGRW58rwRex5zcwTIXrXeHMBdPDZ5Kzp9G556KA=;
        b=JVP/eHvbviFXIN6XHyoOz/GISsv21M1hyUbN20Jsx/hMqC5CRbXx0bqfTCMZwHgbtw
         JwyBxr/xbEoPnIJwJHLOhRPh1b9z/JKZCfM6T9oe/nVa1wxY+1qojLe+APUWZY9raUAy
         0z/UHUmK5xPQGXsPygGRyk1yoiyGGljbxvcDUYliibjWFky0PXK5EF++HkEZX53MwyHa
         3J9LWTMvU3Bs7GcXjPHYL9MIiUiv0PCq4m1EXTPmrELNUIee7iABYHuBsD8/oi+qGO1Q
         z1vXLw3zyOCe+MdJKtY8JZHXNHG6opSpeDLdGb5/0U7FBhFbFVCMqde+Dxm3IzLoh5Mb
         d1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748613457; x=1749218257;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+r0bGRW58rwRex5zcwTIXrXeHMBdPDZ5Kzp9G556KA=;
        b=ogcXv54M7G7II41+WTsiqXS3D6WRlO9JxuTfksKvpJQOgiq8/cFGJbotqDlpLWosRl
         THIEo6FaWZLiIahln1RSLRNUaMyzEpeWR7v+/3O0LZxgcjn1YP2GzCDN6aLwEevLEFWb
         KOq675ex3Dy5pDo3hiB/Tu4PbYTib7grUtzCmat5Yg6abN3bpRMQW3KT86iTngp1y/vg
         O5Q+eK4Ewskxv2CAPL/ZRyFFmwPAu6z7eUeFhRbEXiqzwZoEhim4byuYi7jL2zPYyAb9
         7rlcaj9it0tg8lcbZyBG6MEOIVhZDFvhrKqyO++5vn7lNG97hX0sPZ351wb1tcLY0XZg
         UOOw==
X-Forwarded-Encrypted: i=1; AJvYcCWQOYzJj0gU4ienaZWepoTiXrEst0ZaCnMk7vt9Sg8buBi6y0CoikP6ht8t1RovJo4iTkz9sQJ01BQfSKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+S04IpjbV9nTJYULMXa52DIqMNvMN0PVzJDpSPKVbS1n/jwU
	TUvWv5/tL1r5awS45zhSvtWd39XBREEbCr+1n4NdcD5f2jxVvtFM8c3IZj6SxEqBrX1+4euNNaR
	sFdVu
X-Gm-Gg: ASbGncuAZcGOpJJbNSWemFzVKmtq23elYEf9a1vBHeTp1RyLzh5ykXq6+AdiIzme3CX
	Krd2c/CxedL9RP5HlnGTuV12tHmsKZMQ8Q+plpezSbDHomnNcfqa+RuLADLlAlZ/px2udCXMMrR
	SIZyP+KqPOW7RNZGcDC48Sxg2tORlS32Zd+yMKLcF23+J6sJIrGTLdBod+onw7RXubzcfv4SjEu
	RyY0eFfUayRTMeRepkgNtE07a0XSAFtvNpZa52GoEEHi3Rf7ckmAPVCYUTuWXcjhjF4thcnxr1m
	DZrFWCd2TTtbVbczHVrbKSZNFmlld47sJH7JjKOKf205TXOXAqenMkLDfQBD5I+jelSW
X-Google-Smtp-Source: AGHT+IEmKgo5dq5OOmu14+s0Q97lAph6bNDYvsqIANJ/LhT6L6dDpTgjUglH7nCl3vKgnCP+Tsykjw==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:f786:acc8 with SMTP id ffacd0b85a97d-3a4f7a023admr2663866f8f.7.1748613457496;
        Fri, 30 May 2025 06:57:37 -0700 (PDT)
Received: from [192.168.42.104] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d620c544sm17847125e9.2.2025.05.30.06.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 06:57:36 -0700 (PDT)
From: Giovanni Gherdovich <giovanni.gherdovich@suse.com>
X-Google-Original-From: Giovanni Gherdovich <ggherdovich@suse.com>
Message-ID: <1db6d340-bfae-4d81-a1d1-dcbd7bc1294f@suse.com>
Date: Fri, 30 May 2025 15:57:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CVE-2025-37832: cpufreq: sun50i: prevent out-of-bounds access
To: cve@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-cve-announce@vger.kernel.org
References: <2025050824-CVE-2025-37832-e235@gregkh>
Content-Language: en-US
In-Reply-To: <2025050824-CVE-2025-37832-e235@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Thu May 8, 2025 08:39, Greg Kroah-Hartman wrote:
> A KASAN enabled kernel reports an out-of-bounds access when handling the
> nvmem cell in the sun50i cpufreq driver:
> [...]

The invalid data that may be read comes from a ROM in the SoC,
programmed by the vendor, and is only used to configure CPU frequency
and voltage in the cpufreq framework.

Even assuming that improper frequency/voltage settings constitute a
security risk, writing to the ROM in question is at least a privileged
operation, and may require physical access to the SoC.

I don't think this qualifies as vulnerability.

Giovanni

