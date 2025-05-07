Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867DB189B8C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617098; cv=none; b=CDBqGGKRzFnbafgqDAyTemVqX9Fa1PSF/1PgQH+edOwPSsoQQwuihIbAP3hh7AgL9nrUU0rREfIRJJx0/obsWey0Q1ZVX6En409rpiQiEMGtF3jBQC87njM/LrL7+R8FCuZRxN0Gu2sWBGq2Cgsm7MxmAkXruJZZ8KMEGzFH3q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617098; c=relaxed/simple;
	bh=oar+Bhsai/tc/GaUVtDvAbqWQLjDSDc4YeBGhvA8YjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQzCiKEpuTYKjCJnbTir5A/R4s4kKzPhEgg0gt2BCYP2v+nvDk8E2VGkBIWV0F2KDQN471kE0wICJp00wOwqh9iwQmMN8qr+qKd53wpTaTVAOq/R5cIqWTZkJ9FRIshRaXP/Zb7K85F3GToeirt7cHG7sYiU+RB6vIgUbQmWQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhLvF6oD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhLvF6oD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so58163285e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 04:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746617095; x=1747221895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar3opOrcf8YKrqt/F9Ouy5r6VUjzl1KJIEQkTj2liqA=;
        b=rhLvF6oDbqh0gYyjfbr/FV7NIIuiMv0lFE5VhyX/PCrKfwZJlSj08vrUE7JpssNcZv
         8qqH/qGL9TIlehgEuhARgoFaoPJsByblwSfQASph3rRzXlLaK0Ho2GD4OCrDre34ZISJ
         qX++foIMZRbw885wauNzCRSwL6wgGV3KOvXyFX/IUk1t8RJZl0JyzqU35+LVqKaWDE/S
         FkcdzKRXb+zBhUOoPSBIFPyA+5/XjYc0uzaV6fDhGb+EEoBHp6uM9Qv9w0TttBVmAQqb
         2+R2F3bn2hChnyV8GMnQ7jNNhX4uI+o2EFx/yeT5/6p28abmVx14faH14snyZ5TGl4Kh
         oVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617095; x=1747221895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ar3opOrcf8YKrqt/F9Ouy5r6VUjzl1KJIEQkTj2liqA=;
        b=RuIKs/553981sOmwr8NUq09Dr+qyaKN1cV4V5ufSwnMmQuo5wg7t7dWar4NbWR0+AJ
         /WYgPKjkinh9DlGtmJ/tr/8n/WAtY2X6hzkS/dr0ZM31v4eCs69s2/iuj1kmOYxnHnsX
         JpqZUVDiGNy/T8JEoiVvQiUtwIjf8Sq+rR3IILh7WbrcZbyojkhcGEUVzRmPZdwlsfX7
         +eOB7HqsISt3Yj0wsL0JaZjgPVuEa7Tf7XlI62VDZBF4ruk/3C4rrY0GlbTl/D9MguNn
         25pSnnYeX0gNXxVmhAmDGtSaA8bsXNexN3/IsucVRJOpL+/OaHPbFVERBdy0wzW5wpN0
         +jCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkd4aDdQzQran82W3+H/EzCBXi/bV8soSTTkaubUtZheFwSIaGWHeiWLM0kkqBZGUzq9XeYECLltjh5Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYdX720SEMtzpQM1RYWhLFAxELWlB7UNMV8SPGI0bObATGmcMW
	uuYN8Vn0NTbhW/2/FaXTpmFvUOsKsMblzI/ri4yvjjbQh3aab6ofnL2Ov+Kzdq0=
X-Gm-Gg: ASbGnctixZr77wnVh7BMCMBBJGGj8DI3b/RRB6MkKiZDwS1Tvoi7Z/SQMamVdU73wIk
	BA5XHSYAyVS9vvTnb2pYkuYJoPcKmsI2I8GLwvmvFgDoktLorzcBnukOqCutbuiOGXAQWon2YZS
	4AfzievsjFgJ6ZQyrUvVzexsOCeZ8JvWfMRh0YoQl+NCCjwbj8ygqCcn7gkQV0Vh6hEtAmyAOLS
	XblbESsaL0Hn+DqwPrLqy1N+ho70CygvJimziXpt4zNFkngiXGQR50k2T89kc8acrS4wA6kfHpt
	pkUgImlwz2U/xMRY/FOIJHy9eNSDaKnxEzTVA5RIF4eFeA==
X-Google-Smtp-Source: AGHT+IHyJ94/xudBhc2hVks1GmnieE9BCHBaAQyYklBR/tJ0BTUQtnhG2e9qWqy0ux6mdoFrnCGZhQ==
X-Received: by 2002:a05:600c:46c8:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-441d44bd46fmr26000975e9.7.1746617094808;
        Wed, 07 May 2025 04:24:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441d4346542sm29214775e9.11.2025.05.07.04.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:24:54 -0700 (PDT)
Date: Wed, 7 May 2025 14:24:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] staging : gpib : agilent_82350b :
 agilent_82350b.c re-checked the sizeof structure, also checkpatch.pl has
 shown wrong error, hence now applied the right option and commited the
 changes, this will be PATCH V2. earlier have applied void pointer only so it
 will take only 8 bytes, and not the whole structure size.
Message-ID: <aBtC-78bNYtlNHPe@stanley.mountain>
References: <aBs5MeEdCCwiGE0B@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBs5MeEdCCwiGE0B@brak3rDesk>

I think you sent an incorrect patch earlier and you're trying to revert
that patch now?  We never applied the patch so there is no need.

regards,
dan carpenter


