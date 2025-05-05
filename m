Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0525A64D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459793; cv=none; b=YNrs6RNu1jTVf5e6by3JW6NEkiecmuZ1uOVClcYvXvbkT6aS7mu/p/kCzzjeJm8NQ/7okJCAsiJrt99jOvzMDl9E9mQ/WTdsHOKiO3B8SSidhC/+rpHXfie0JdbHnpmD953B3tTsfP+DDneh3NyWqNjoJBAPuaPhN9MxKd22hPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459793; c=relaxed/simple;
	bh=QRTbxv6zAHeMDzXhqL8aw35yYIDNThc5twhBqvEaco4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ugiqqtc7ptqg05df32k0rs6QG5ftVhD6P+8Z1GnXbJosEwty456FwqRuYaKmDro7YGlBZlXGgTYeTsJB0O4bt4nJDqTe+vpWdUpb2WIoaar05xD5cMpXXwoGJNBgwd68NREb9eWWo28xzSi26zWL9GMipzNl1/+a3S7lUZX5ibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HP7Z397R; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HP7Z397R"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6064d4c14ebso1052378eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746459790; x=1747064590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jADEHGiMlecVFngKrds8KPNTRKyJX4Rr2PqMnmh5p04=;
        b=HP7Z397RXibyRH45OVZiWscWZnLDnQIKIkOEAj86AHCkuMW8RT1kxo360dsr1bcdOg
         udG2Bv+vZHR6yaMcwOUavh174fAv7bbYH5gYOBu/CLnyyv4J3nWkgDK+VyRtuXaoPW2A
         5lSVIqrod4kVYyR9jBeywUqmqez/ULw8UXXBTIthF60acb6lFRvFPDlnnMCwF00wM9nY
         X7jrOK4TMBpsELHthudUtJzrZ7SaY/qd3CooyIEQrp485JS+Jquj3P7TrHIQv4lxosww
         y0Y1NlFMWFaa290hv29txP6Q5Atv6vM/kckxMYqtQMywv5igP/avxoJorXI8tmUfAW1O
         xsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746459790; x=1747064590;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jADEHGiMlecVFngKrds8KPNTRKyJX4Rr2PqMnmh5p04=;
        b=w8wMTZwHE2qfQhJaMqBY65V+hPoyNbNcXivBQyMweCrna/SsraRD+3pcxmZUZQRRzg
         ErQfhNLnSYKwbFQHt9jwrXpdAUJ7SMzJZk6WLUBurPP4/ZvdeVHxlKikwTwi/pUUShlQ
         eYLlrUBAagzmsxVnrYm3QWgBhTOr1WdMX5ezlaiegMVc3dHw/z7m0CUfHnRILHSIj58X
         D6qg1zg44cpOME0CIkNi7A7Obm8r7h0WGhr/6wEFwR+zOTtZu7nlfsIU4DTNoF1WLIMX
         hEsa10NXOuurMMdYCmw7NIJuJuWjgrEJW9aCas49Tk7/EpH0QTJA4VEehxhTTNDO+/ID
         IqKA==
X-Gm-Message-State: AOJu0Yyzl8l+0mrLRRFmMkFQSYvzjTCtQltYSfBI+7zBDkDdjN45PkeO
	uYhYZcICGkBo47fc5MHegDxBeWWXz9AST6Q/rIS98O/M9XnHd3PXJIyV+qmm2Ig=
X-Gm-Gg: ASbGncsecnK7BI96wfNNy0iP9E1IdRajATK1HfltzTTOcRL04b9G+dP4tRzKSr81oB6
	3QKvqLUMRiIXPwVmWfKa6fItOxt1fnHuJIYiidgzWac92LTer+GlrolljUbQlwDOOc4lqFNx/TK
	mKIpgC4rpLB/+vCHOIKa2BwoebJtOL5x6xD3J2LTqwE+BhpQeL+ctSWN6BPHy/zvmZuM5vJ8EiP
	jxvVuhLayR3vmzpsS4SLytZMJi0EWTQY/Cu+G1MRCNOsg9xdABqi1AK8JD69vfcLYJxl8YtJe5h
	AopT6uyf6IZ4szS6+3O2mA1yLQX66c/ByQ85QD5PINxUynbXnJeJ3S4lWcuIYJQqCfegJamiKeC
	YdJOBImQkn9xN8Mc=
X-Google-Smtp-Source: AGHT+IFL2btLIVQtJx76CsbwyLNK829LBAKSDjNc/uTEdqP95tY4Xs4YkW2YjtftOF3WDWyRbGLvmg==
X-Received: by 2002:a05:6820:1f11:b0:5fe:9edb:eafe with SMTP id 006d021491bc7-6080030c637mr4626794eaf.5.1746459790013;
        Mon, 05 May 2025 08:43:10 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:2151:6806:9b7:545d? ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7db20f9sm1668000eaf.16.2025.05.05.08.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:43:09 -0700 (PDT)
Message-ID: <a8f47109-f370-49db-abe8-955ba287ab0c@baylibre.com>
Date: Mon, 5 May 2025 10:43:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the iio tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250505074801.258da03a@canb.auug.org.au>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250505074801.258da03a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/25 4:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1a521690c060 ("iio: adc: ad7606: explicit timestamp alignment")
> 
> is missing a Signed-off-by from its author.
> 

Thanks for reporting this. The oversight has been fixed.

