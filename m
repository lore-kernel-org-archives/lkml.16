Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A527991C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716764; cv=none; b=ddcIFkGEY3SSllGuGkuPiYjsApPnLAhoSctSIqr0m4CaMuTu2T7+gPMAVPJwURYLWxbBfsUhqzkkPlVHQLjvgDKRFFOjJeoOqawd0TuWk9CdSle2JDrvqYcAPvoUn2DE/wJtXU8f9SKVAaYAoduCGseuwzvlLcwvPeaCPFJ7TRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716764; c=relaxed/simple;
	bh=x18HZDpO4/AfOTYMyI2T7MVF84ndUzJ8OmJycvJGKxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZPKvZKmThx3wJbnV+N2BqE8G8vh+FYUQgfL++qihREYOGwW1huZFOKgx/I4k1BV6+1HhybPZNMqIY8H0ozhmGOuB8yrVw1zAc8ibxK7YrFI/JaveIMHBVVLkO4XjWdE83Sek1d1DdV2k8PCVu6ol3i9+MrB8S+RKtEDQQbkhJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=fQ6ytKvd; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="fQ6ytKvd"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-861d7a09c88so18581039f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746716761; x=1747321561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oojzGy2rPvyvD3fwspYiXamOJIatZnX+so2HECZ/CEE=;
        b=fQ6ytKvde5cHfbxuQhzY3NOWWNJn0115HhfkcanhmqYiWQCjSLSJiIP0ruP1G5I0/d
         9a++YxZaEapN8H32KSnXTdrJITeAl+qZTw4Wcg2tO/svEflDHlyK84wWaXuocrVotWAD
         Zakd10w7wf6VSlFbhCpftKFehKyMK84EqSP0Fd76+Cyi7t5wdu2tlbrnd3Co0jxHy5wk
         xr8tYRYgZ6ro4BSs8pdHupVKCTxm2ZHPe+GZcCyKLOf3G/9H77RgXiOMaf9CVP+Tm3KK
         5wLyJRb3Xca0TPKLFwOowhu2n4jdSruoFkPsj9bcf1LdeBTAxOTZKtqyMGVVOSpMmSkg
         9LDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716761; x=1747321561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oojzGy2rPvyvD3fwspYiXamOJIatZnX+so2HECZ/CEE=;
        b=uaYzxYWPSAT2xUn8AllBEGB9v3+MPKEBaweY4Gdb2VrBlSz7dxP5IPpRLF72FcVsnm
         AuPpZOlKvKEqchhqQumWmgPylabMTtrLiotE/+1o+SFLeIHITUy0In6AmpJ1b5urqVrh
         KD9yT3ivh9L40ED/VXbJvoxSsABwbBoadpKUVfInuo3xByO3loWP4opIu1/Ajeb0jSJn
         jqCG+hG/NXFmVa12yTQ8D2L9VDaFDCzmyhrMPdkmDMhe3jtigVGvnBbRmXGc1UdgTmVJ
         H+8DRYNZO7ErKicZdqLBuwMtIjJLvRUDCSt4s0BDjvaxmLVFlhhqguloWKBImFlviqll
         GJYw==
X-Forwarded-Encrypted: i=1; AJvYcCXdPDLVza/LS1Rk4AHPFPIkS3AG6IZyqvYwybzWvfDL+FiLUrrhnzeyJYnZgA+pEEXehBBO2K3DZvthD/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCg8UzeaWOLp5AGZVl3fkQ2hPAuQYzTpBMVE8nLKBkTzSUnuz
	CZGZiBAwdu0cxVgBlvJUjoRNFOQTDvBIBC/chZ43b3+XYF80RzBDVJSt5ox/MwdQGBuwvKty4c5
	G
X-Gm-Gg: ASbGnctBuDOo+3mousuHuU8tsjsKaNSGQvPs5aF6Zb8qalO/LdaMnZnbMOEV4w74H6N
	BHMlHt4IVA/74T8uX6MdhLcrlqTjDKDVdM2KiYOhN8+EHQt2HkftyI8S8uVRYi1HVpVZIU1RX+A
	f3ZJwyTblrgDEQlb8uwOYoOK2andENQHWaiSywnSCBG1/L5c3XDl+RwfmVDtNTO2Fq0zMVyPdqe
	bVUofDmZebMGskG9GAopxKSukPhlEWs/ua+kiYxE8uy1t2GYOPojfAWnipSPVr+Q41TqssH9dI+
	ipi0N5FetuNaSbmQ6akecomKIjbPmGgSPpY9evRnesB//Xc=
X-Google-Smtp-Source: AGHT+IEfGrAt/nAymBQqANABYk4MXHhBbOjqWMik/FGHnukDHhPjKhYplTKB9EqvQxT+gtj+Y0dYfA==
X-Received: by 2002:a05:6602:3422:b0:85a:eecd:37b with SMTP id ca18e2360f4ac-867479246d9mr889219339f.11.1746716760884;
        Thu, 08 May 2025 08:06:00 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa59313sm3117407173.103.2025.05.08.08.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:06:00 -0700 (PDT)
Message-ID: <89253238-9c01-4ff1-97aa-6b9bccd65991@kernel.dk>
Date: Thu, 8 May 2025 09:05:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix Hybrid Polling initialization issue
To: hexue <xue01.he@samsung.com>, asml.silence@gmail.com,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: peiwei.li@samsung.com
References: <CGME20250508021828epcas5p21b9313ec7c9e0da2e7e49db36854aa22@epcas5p2.samsung.com>
 <20250508021822.1781033-1-xue01.he@samsung.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250508021822.1781033-1-xue01.he@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 8:18 PM, hexue wrote:
> Modify the defect that the timer is not initialized during IO transfer
> when passthrough is used with hybrid polling to ensure that the program
> can run normally.

Patch title should be:

io_uring/uring_cmd: fix hybrid polling initialization issue

and then you need a Fixes line and a stable tag, if appropriate.

-- 
Jens Axboe

