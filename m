Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54A9221282
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748485139; cv=none; b=NKlaQkG9xq3rVqdZwyJ4UFaLf9f6P+qoryn2nCmcqJGMgN5hfV25ZlIagCXz3Lplk27PKeIuBo64IZ8auIZvDuzlC8MrSNL2txz/dIL0T87p2aUceUJyW0HEn+umiOwmF6l7WmvuTtl7wvcA2ihjFaH+GBLJ1xEUxsKUGwHCDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748485139; c=relaxed/simple;
	bh=7QbfBGFPxpQA31O35z6w3yyrQMqKM0N/vAAYopiP7x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuJenMxgFyckOlk6IkhP/7ez13knMJxw4rUnJMAxEQQlCiJkuxIRfP6W8BqLxZGeShGflsRd+5+jsAhK513Xh2uPWaVg6HCVMdU6f5N11XnIu3fmu0ijIzsRlI8dRzvX1vMEJ6ZAvpC3t9KlL7CFd1dH9Df5JSqOSDz0UXyBUJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5csMtiL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5csMtiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748485136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PClIz5ruLM/ZV/ePtDq10a1ylr6BVLzbUjXceuS9BvI=;
	b=e5csMtiLPdQ19lwY6hVIFE5qqqSVlK7Hk2K9ngAe3DUBQhUQUhF2+xf1rr5/OoqDLLgk0K
	yOXZTrHi5RYjpUTAhMsipQICcQ353HJ3gLtkhlhwAzRmdvGS7WDg/r05s4vUfAaqHhagkq
	4STE2Wc3a5xNuXnum8+t3GDZc8peHGE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-ckmfE2JQMgOGwAmARcar0A-1; Wed, 28 May 2025 22:18:55 -0400
X-MC-Unique: ckmfE2JQMgOGwAmARcar0A-1
X-Mimecast-MFC-AGG-ID: ckmfE2JQMgOGwAmARcar0A_1748485134
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so1290751b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748485134; x=1749089934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PClIz5ruLM/ZV/ePtDq10a1ylr6BVLzbUjXceuS9BvI=;
        b=oNq7OxEPVIwn6Hgm29Vymz/X4sUiGrtFF78oo1BiiQjnjc6p0uKuuA+B02eC0Prbzv
         FGLWuFKtLCVnIoKN8K37fjIW/EEV3LwdBPFJ4KxptuCe6YP3XsseCqN0pvLlXovrX+eV
         82DQdhrZy+WwtvXv6mzY8WxHwCOfJ504Uq5u78QnEykBkYyfFU9ybl8VlK80qFaYc0SI
         dKYJmnhCDqt/X3ylYdpcudG5fUXpx+J+Ikn6/f6OBs7/snqrd+xX8KFnc3lymYIyXjRG
         c+Pm06UYAnpOn147BbPrccf2otya5Frw7jaYJwCwg0nG4Qtgxh85YsiVAi9GzrIJcXym
         ALZg==
X-Forwarded-Encrypted: i=1; AJvYcCXkB2yqJ0T28B4/s2unGftVSXJuaFSmmBSkVue4LSqJVop+XfugerU7xH0KqCZ1NWGMBfrJ9ktL7VwlBB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrsL2VrO41zLYHMVKTvUEGm004IOlLvxKJEORLt9g4m6oYhcFX
	PjAdGpLen4lfM6z6DsvceEUBHCVHzL1EyuSbYT0CjoSRSI1bb0C2ia0Q8IaYp3G3WhUMeCM6LTb
	IVNBStQR2PN+0xLddXW0mfBffFihIFUZRzXAr85dARbZCixEt9Fz/yx1djSsKZddyu+qP4FTau6
	aDhyg=
X-Gm-Gg: ASbGnctVnMJJJTP0P0DDqYcQYe7GJnfzMuyb3B+LwXzpNokXGcEQWn32wLcZytakwum
	jsNRENPFAXFxW26Qc6k9oxgBJ2DPZe/595Ktd6jQ3Dc94d0mlXAH4boSU96R5YceqRk8slvHVT6
	pEpTZIYlLcZbblBEIW80w2vc1S4txvoGymW8Zl572twjnUAzizs5Dbb1XpJ97mH2nY4BRMB+UCL
	AHC729ELJqAXRdi/zMWp+gmwM9A/xXlS9qBrIzXZ+JzMCxKDRPZeEqySiNABdh43P5ssbQ8UIig
	pw==
X-Received: by 2002:a05:6a20:a123:b0:1f3:323e:3743 with SMTP id adf61e73a8af0-21ac5b89ed6mr2617213637.12.1748485134050;
        Wed, 28 May 2025 19:18:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwJD31EacUd4P1pvoKAV06D2STXMvWS1b7iusv5/kGhFEscB3PEL0FPwjBntBCWf/HwaZxdw==
X-Received: by 2002:a05:6a20:a123:b0:1f3:323e:3743 with SMTP id adf61e73a8af0-21ac5b89ed6mr2617187637.12.1748485133630;
        Wed, 28 May 2025 19:18:53 -0700 (PDT)
Received: from localhost ([117.88.136.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeaad78sm287636b3a.46.2025.05.28.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 19:18:53 -0700 (PDT)
Date: Thu, 29 May 2025 10:18:27 +0800
From: Coiby Xu <coxu@redhat.com>
To: Kees Cook <kees@kernel.org>, Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	fuqiang wang <fuqiang.wang@easystack.cn>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <m4kujahyi2wudx56imnvoiyfau25eio5dp5j4kivwmdyunss4v@eu2x3ittlayz>
References: <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
 <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
 <20250509183518.bf7cd732ac667a9c20f1fee1@linux-foundation.org>
 <sn775iwfnogyvgxetbcfneuuzsnr5wva6kc4vachyzc7r6uhfi@ozhimoihtk4b>
 <aCaycGEtgNvynjNQ@MiWiFi-R3L-srv>
 <202505161616.F4C1BCCF6A@keescook>
 <aCksAsgAw1jsGBL9@MiWiFi-R3L-srv>
 <202505190716.B21F11984@keescook>
 <aCtBf2LqRqlWXaUp@MiWiFi-R3L-srv>
 <gxysezp2tc6qtb3o3wpdsk7k4aijxontf3ozfnhn76giobkefe@v2vkfov2tcck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <gxysezp2tc6qtb3o3wpdsk7k4aijxontf3ozfnhn76giobkefe@v2vkfov2tcck>

On Tue, May 20, 2025 at 05:13:28PM +0800, Coiby Xu wrote:
>On Mon, May 19, 2025 at 10:34:39PM +0800, Baoquan He wrote:
>>On 05/19/25 at 07:19am, Kees Cook wrote:
>>>On Mon, May 19, 2025 at 09:22:30AM +0800, Baoquan He wrote:
>[...]
>>>> > I went back through the thread and the referenced threads and I can't
>>>> > find any details on the USBAN splat. Can that please get reproduced in a
>>>> > commit log? That would help understand if it's a false positive or not.
>>>>
>>>>
>>>> The original patch is trying to fix a potential issue in which a memory
>>>> range is split, while the sub-range split out is always on top of the
>>>> entire memory range, hence no risk.
>>>>
>>>> Later, we encountered a UBSAN warning around the above memory range
>>>> splitting code several times. We found this patch can mute the warning.
>>>>
>>>> Please see below UBSAN splat trace report from Coiby:
>>>> https://lore.kernel.org/all/4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at/T/#u
>>>
>>>Ah-ha! Thanks for the link.
>>>
>>>> Later, Coiby got the root cause from investigation, please see:
>>>> https://lore.kernel.org/all/2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei/T/#u
>>>
>>>Looking at https://lore.kernel.org/all/aBxfflkkQXTetmbq@MiWiFi-R3L-srv/
>>>it seems like this actually turned out to be a legitimate overflow
>>>detection? I.e. the fix isn't silencing a false positive, but rather
>>>allocating enough space?
>
>The words "out of bounds" in the patch subject are kind of misleading
>because the patch is outdated. A later merged commit 6dff31597264
>("crash_core: fix and simplify the logic of crash_exclude_mem_range()")
>has actually fixed out-of-bound access issue as illustrated in
>https://lore.kernel.org/kexec/ZXrY7QbXAlxydsSC@MiWiFi-R3L-srv/ Current 
>crash_exclude_mem_range simply returns -ENOMEM when there is no
>enough space to hold split ranges (I'll post a patch to prove the
>correctness of crash_exclude_mem_range by reasoning about the code and
>including a thorough unit tests). So I'll change the subject to "fix
>potential cmem->ranges out of memory" in the upcoming patch.

The kdump LUKS support patches which fix the UBSAN warnings as a
byproduct are now in the Andrew's mm-nonmm-stable tree. Can I assume
it's not appropriate to re-send a new version of kdump LUKS support
patches which includes a separate patch to fix the UBSAN warnings alone?
If that's the case, I can send a single patch to the stable tree if the
stable tree requires an upstream commit already in Linus's tree.

-- 
Best regards,
Coiby

