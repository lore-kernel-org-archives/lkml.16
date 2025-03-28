Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2190214229
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157162; cv=none; b=bGUNADXdYSPfHcg8szn2zSo+v4+dAurZ+1tM15RcG/ja4iGhw6uxXLFLatOSTf/PtD0QHtGxce7H4xiO75rsX42+2U6DBDW8FK0sIQP2zlHcEfT7TwEQoNbJ3W6Uzw52WBnfWl9aJrslHMAsN/jVcBUSCFS+yJOz/GymzZvHJ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157162; c=relaxed/simple;
	bh=jz3aY36o7j1FfklzKk7CT65RWrvPbaWXJsL0lBphTq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6ENZ3vQtteMFZsgHf5v06NQTIPGwczp3qX6CK1Jv3YCuBzr6Iy7w9CxwKI+hGWwiH4bXcOpQ8edbnO99XbQpuw/BahBVkAg9O9yInlwg8gEOThBhZ7GZBd2ma6qjVztg86DrmVZfYTGB8TJSImO6MMxxsFlGMNbTmN5Eegrx/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E8GF7uWT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E8GF7uWT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39143200ddaso1244966f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743157158; x=1743761958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9MH3GUSx2ijDFw2/8FoaPDcqum1gfQzhI04q7LblUM=;
        b=E8GF7uWTGxqUjEWMfSmDSS3rJjt3jyH93E+/BM6TVih7IUflhe4ze+rs8vKhgnlnRT
         QhQ+smgfFQhIbfcdb6bORnzPMQ/wnjHrgkeSILfS+8PGYKUzaREZR0XN9XzHeznFFJxj
         C/2ASr4umOr6wANC3tFm68v+scibSL/gU3HCAfgcN01iYHIYHfkIqWdnytjzaOwJKy6D
         ZPXlBoCqwJ27fuxxoC0EWXw1aBEZoBdP2xsXY74rNH95n3LUo7DBunD+VrVioqhILLaM
         Uisc4A5rSuyE1jUomoo30GN2pJVuU1ctJVATLQEoBacdwDbZiYAVRIHNJZYXD5IvfZud
         bSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157158; x=1743761958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9MH3GUSx2ijDFw2/8FoaPDcqum1gfQzhI04q7LblUM=;
        b=jw0I7FFJT0LRoOp8bJtKcXk2odsQOas3ZQ4Ad8hhCfyoAqHXejGRlR5qbMwqMv2sBr
         1jA2r3iFP08PGSJL7sh5sRiRI/kQD6qhsLH82hFHC0Gvc/D6nYtYn3EKd/io8nBu1jPf
         PHma5RCK+ahuKSx9bpb5YClPqY/bdCnheXribd4v8QbZaBKHEio5geVA+oq7h6YrVZ8/
         +PnF1w9CbSYCkX/z5CIWM0IZYgVw3Qomh8ltTIi1gADDgdJZICYlxah419VAHF3seQds
         4WzvUeAFWYts24hojqRN3X0XgDAioU9JXeCVRjBxsLwtU4GYxSofBos77dvajIn528Cg
         17gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWEYdJvY7yxjtjfnaf+EMGfHnl1nA2xmpRCz1JNqiITpUJbDP/W1HhhIive3TXdFbJPGgdvyfy4YLHUG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYdSJnNIPaLZmYGRJR4XVjqJdaBqtrmaqMwer7+h6JAFsVvrlW
	ob8HuBwNTMNQcfW8a8Xj8Yu4fYXtI23y+Rf5ispOofxqthhYBV5CXMAfQJr1H6k=
X-Gm-Gg: ASbGnctazACVEZyTKJHpINGFx0yOV3KCeRF94ppCBmnsayK68LAeFHyACb1H3Q4dclI
	NNejTpm7dl4CWEuby4bqsf/3tUHoTKZbduE3azv95/V2pWnqSvpVWBI2BKWYhf5/DovRC7DBSVZ
	RLQdt1Pmt1DCMkPYIr5Bm9S7EjujQYc4eYrqZd5KV3brpHdQXq1Bfey1TBzkbJM138vXVPPpLMF
	sOtXy8rxyjy/0oeQSFnQShxTrHz90nTJKQD2cEzRFSquoRsTCy0lX4Qa4PhHhZSna2mof/TG5FF
	ZaQFfZTOQgy5b0HW8fg1iAm/n/lPFoNNHdiV+rqTvepcb408Oj3oWoSM+70=
X-Google-Smtp-Source: AGHT+IGJKr46cfNOSniY/dCUZeCweOop1DoiisSS7BUAqfPuL9uBmcKmHfMWxpVOpa84DymztwUNqg==
X-Received: by 2002:a5d:59a8:0:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-39ad1749fdfmr7315210f8f.16.1743157158044;
        Fri, 28 Mar 2025 03:19:18 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe389sm65412055e9.19.2025.03.28.03.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 03:19:17 -0700 (PDT)
Message-ID: <3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com>
Date: Fri, 28 Mar 2025 11:19:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: deb-pkg: Add libdw-dev:native to
 Build-Depends-Arch
To: WangYuli <wangyuli@uniontech.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 samitolvanen@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
References: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 18:41, WangYuli wrote:
> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
> package.
> 
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
> 
> Consequently, add libdw-dev to Build-Depends-Arch to prevent
> unforeseen compilation failures.
> 
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/cache.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file not found
>       6 | #iIn file included from nscripts/gendwarfksyms/symbols.cc:lude6 :
>   <dwarf.hscripts/gendwarfksyms/gendwarfksyms.h>:6
>   :      10| :          ^~~~~~~~~
>   fatal error: 'dwarf.h' file not found
>     6 | #include <dwarf.h>
>       |          ^~~~~~~~~
> 
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 0178000197fe..25edee97fff7 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -209,7 +209,7 @@ Rules-Requires-Root: no
>  Build-Depends: debhelper-compat (= 12)
>  Build-Depends-Arch: bc, bison, flex,
>   gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
> - kmod, libelf-dev:native,
> + kmod, libdw-dev:native, libelf-dev:native,
>   libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/

If scripts/package/mkdebian is updated in this way then I think
scripts/package/mkspec -> scripts/package/kernel.spec should be adjusted
as well for consistency.

File scripts/package/kernel.spec contains:
BuildRequires: (elfutils-libelf-devel or libelf-devel) flex

elfutils-libelf-devel is for Fedora/RH distros, libelf-devel is for
(open)SUSE.

If I'm looking correctly, a new dependency to make dwarf.h available for
both would be:
BuildRequires: elfutils-devel or libdw-devel

-- 
Thanks,
Petr
