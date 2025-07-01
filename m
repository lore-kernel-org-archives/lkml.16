Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83D3280337
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398731; cv=none; b=QykfmGRZowVqQfDv0/hGVSDlqD1iznsVlWl4XEkqTHjzKP/ycy6m5J8Q77axVNOXcMwfooXLTWXxlw+jVTLbuSAlXM6N2ffHguM1jlRNjedlU71WrvrQlhtXS1gWTrOwQdIirT+FS9kJCh5j6ffeJOb/tdJv5Sjn7vwpBkpnS+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398731; c=relaxed/simple;
	bh=jdSJbsMqXjRs6rof0VNrFHkz8yb0xjXpNi8/6LiUtHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X49XubuuWIYjElrwvziS6ua/BzJJ48c7Tt8WCDTcdjnzlKUxnyt8eriCxb8bwXMtQjDIjP+eNt5phlKTCKVK2tB7gM5PqwwLxUddmKFY0PdRIJfhIrn2hLygWa5oHEBm3HwFybtCr0QAg08w6GwNbr8nF26hb0xImVgffvljY+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=axmLaA6D; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="axmLaA6D"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-86a052d7897so525074839f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751398727; x=1752003527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
        b=axmLaA6DB3mTphLIx4PPP2+/qWYKOrOtKm8HHAbXn8gGF9iyGlVlH7JD1GcUFVdCrz
         ratib+upR2bTw7chL2QN98nA7sqvNEWxxa0QnogZSMlCQ5qxjlpY9rpGTzDiCIVZzr/v
         1Qpz2h/MUZKrPSYEPTs3bpduAru2xraEG5+W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751398727; x=1752003527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JlI2LusSqBKQhKAwOVjtIPc9qQuOGQmC5znI8Uy39jg=;
        b=d2lFeNQDqZMbmJEfpY6ZSETf8I40J0kxx6IPyzFY2vnvTBmQNdU0UrBtwX+1P1/8BB
         Hdpaiyy7DNcHXEv/bJGgAyEgGUQAbsxCxIuLfxRtZ3N+HQHCp90+pn7GI+4tUoHLaBdJ
         p/bMH/1NAnZ/y8nQka4FehBNlns/jKYNA42D7m8WnDarQR458BKRbjMtYCDKZF3qa8ul
         ECX7nDvZsnbufhaN1LdsrmTlJuf6InH4rpd/S9juB9B5+A5tkIbV5RuVGMI6Ri1av9wI
         gi6ugnKKZLVI0ZRNlEw7uFBZkgoLoRg5Ys0+SY5KHbsTgwV3h96CnRwOqmiUmbx/RHKh
         lHFw==
X-Forwarded-Encrypted: i=1; AJvYcCVlZSn8PbRA7Bv9E3Niy833u2+AIbDiO1N+pq4prXSFZf7647EyL+dTrGRmNWpJGoytrYZQl97TsiDloKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ZEA1v7YBMMz1up85Ng1NLVIESZG3obdog+GgLDPHu8hQPLMG
	rp6DHSiEtF8Weo+Sd8oS60bHsWBRV8mnpdnr/ka7IZ+u0W0RuzpkTQASHbOEJSeztsI=
X-Gm-Gg: ASbGncsZwI2bwLZRLeowE2eSRQ8X/OrWtqv1vEi7L9/9W/cbNT6uK4yDS18NCoKX8gs
	jChJTSYaKugdQsmoa3d0R9joYawB+vHuuW0a9ukqAgRVW6F4FCVVfOsGAo6sJLVcXcMVjHjndgX
	PwbaLIuEdmyM6TPmuWneQRpIVPBXeRhevML+txhIIxw0FEUfaXr2Vps1juh9iCUA2hWayYo00uo
	WrZ2+9aKmuhfKYd3F0/JdXegtdRu8mxz6sPSRypxQHq+OUkdeYolDn8icaD00STHqGev/hmpYkN
	af/5ecxfp0oq9al0EVwTOEF42Hy2sXH4tcpHPmk1pPoWgBjfN5okaq4w0kkdgPWVq044p0yT+Q/
	SV00OYELj
X-Google-Smtp-Source: AGHT+IGvl85HXknFk5WCMqL3KGp3aOWaEvzVt6Rqv1FGK+Z9f2Q+2wtZthqKmGchchXpQiY+DMOzSw==
X-Received: by 2002:a05:6e02:74a:b0:3dd:b5ef:4556 with SMTP id e9e14a558f8ab-3e054a307fbmr3075225ab.18.1751398727532;
        Tue, 01 Jul 2025 12:38:47 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5020486ba41sm2570574173.28.2025.07.01.12.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:38:46 -0700 (PDT)
Message-ID: <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:38:46 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
To: I Hsin Cheng <richard120310@gmail.com>, robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250623184734.22947-1-richard120310@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250623184734.22947-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 12:47, I Hsin Cheng wrote:
> According to the report of Coverity Scan [1], "sync_file" is going to be
> NULL when entering the "if" section after "out_post_unlock", so
> "fput(sync_file->file)" is never going to be exected in this block.
> 
> [1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1655089
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index d4f71bb54e84..cba1dc6fe6c6 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   out_post_unlock:
>   	if (ret && (out_fence_fd >= 0)) {
>   		put_unused_fd(out_fence_fd);
> -		if (sync_file)
> -			fput(sync_file->file);

Are you sure you want delete these two lines? It might not make
sense to check sync_file inside if (ret && (out_fence_fd >= 0)),
but it is ncecessary to fput.

>   	}
>   
>   	if (!IS_ERR_OR_NULL(submit)) {

Check the error paths carefully to see if this is indeed the right fix.

thanks,
-- Shuah
