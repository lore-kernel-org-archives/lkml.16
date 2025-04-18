Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972F31DFDB8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992431; cv=none; b=Y9HSYb2s2xF3eLAg9LM9xyz9MdTzVLEgl0FEvtjiz2SDiA+ZFaj71C4LfzEJLzyPaz5NQeLO+RnmfTxSkqkElJ9bC4x+MR1TjRR7UJMUyIlhK8vJ1t+n+u3GrqHcG/BzBEYaOUl7M8/Ix5M2U0mhoQSixYhY/3oCMHu3Fq1cx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992431; c=relaxed/simple;
	bh=mJDJYr7lVaC8wf49jlEbGffCUgODVQ8wlaVjxXpd9NU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ILnFL8Zd7regReQi2M0g5BOQPn1mXwoKt9FC9f8uxAboztQ/MCu5XOUZ5ugpnZWdcwRligDzytIiH9kmsxlO1VibB/Y/+5o8zdSOuOg1bduKJ0h1+Te6Jd8IxDy/cNjszsXYxJA5Zyu7ljCHhD0oQNAKZVq/T/K0M8lnHGc9u9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=f4qIYwQc; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="f4qIYwQc"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so3108234a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744992428; x=1745597228; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJDJYr7lVaC8wf49jlEbGffCUgODVQ8wlaVjxXpd9NU=;
        b=f4qIYwQcWNfstcEj05cGQ6wxM6ZVHkbgt2n8qZ3xy5J5HxdCEqKcsnWGOZrvjMRT1I
         a6x2Ko6aVbvtiDzRGEveqOi3v3ciEG31INr1o/O9VkwlPy25yYLK/r3zEnym7lgzP9aD
         is4fHwXQupWP7/coXFHK0uFfKSHeW9hVADg8zEl5GYHN0ev3XCBzYEhH8lUOkQstrF4T
         nRq/kdKQWdJ41TEiznqhRPugV1fNG+ZDBu49p+5mF4z+6WaQdtcNVrn9WOOit/OikQ+T
         rjw4SxM5scU7cbvD8Z8icpnZgetRXCbk/LMlWNfnhA/dozN2T3PTUEzN+r5BI+hBfDvR
         PRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744992428; x=1745597228;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJDJYr7lVaC8wf49jlEbGffCUgODVQ8wlaVjxXpd9NU=;
        b=HrWPU42CitkReSLZJwIPLJnW3v2uLET3g8mmyJG+YLk3ChdBMnW7D5ZxH+AsyHOmKS
         4gYRkiH35bcFcZTWa5mnGOVwDwuN4T4t2v6zc5XglLdGIbbzM1MxFopGVqzDuaOf+DAD
         HzUQsfNa+8C2RQknhDNS9zDNrcj5+2lxtbzPUjegkfVUstUPs1q5Nkgq8DBZliSvrabO
         nbauqIxIMkJkBAmDEeZ2i/N+0yJwjKJNFaFHNydOwzZnOcXNz/7NYLS4OwkD9shvlCRk
         yaDxiSoxTR0yk2va2yVTxtr0k8imPvnSnbXWZSXtJDnv1RqahCM7BmoOHJ9NDS0XdQZo
         zTVw==
X-Forwarded-Encrypted: i=1; AJvYcCVCtKUuZg0fCzWMZT0u3pwFNzHkw16nem3+HfSNLgtKXLGTFd5ZY+ScVHA89MYqtyVzhEV1Se9VYEticWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVqLyLltgvtxZbOsDbY4lKdzixz0BywFoOXOT/imOb3ogBK1or
	R2e62nH/+z/vohYXvdc6Xk4YPZf12qtr6HxC/wp3GknW6zGf3K45E96bbJFg+YI=
X-Gm-Gg: ASbGnctPWFLgeMmdCD1fOpAzRVIA+gqrS0PaTYVCfuZAB1KzlM73hetjH1zdYOtcP4F
	3kVNDVgR5iYJsidMP7wQFbwIW7CljVxCX+2ZDy/gt23tcp5ZnE4ZP0SricLdZXHWnZoqM95Fth7
	sGxRvWpwLlrZ0sfsS3nkqvmhNgi4F5xrzpNcPqqdleNFWZ2A+l1PipSatZhkyprGXU7ANkFC/wu
	lfFb/QVzXWk/1GKxTuu1vuB1lSjgVMY2eZ8lBRTyHRjxMKnHyoWW3yQo+NGvuAbmsRCdrQrUFLY
	WxXNVeSMSgiQj6qA7CYE3K1UUXoWnK+pgg==
X-Google-Smtp-Source: AGHT+IGA0mJvYWhzAc0oNHZeKO+KGsF+25BJMfzQI0JM3A/aTXEi+UCjUxCGApuU0msTc2ARl0raKw==
X-Received: by 2002:a17:907:1b22:b0:aca:c6db:2586 with SMTP id a640c23a62f3a-acb74b18d90mr295654566b.14.1744992427833;
        Fri, 18 Apr 2025 09:07:07 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:506a:2387::38a:4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec10011sm139200266b.14.2025.04.18.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 09:07:07 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Andrii Nakryiko <andrii@kernel.org>,  Eduard Zingerman
 <eddyz87@gmail.com>,  Mykola Lysenko <mykolal@fb.com>,  Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,  Martin KaFai
 Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong Song
 <yonghong.song@linux.dev>,  John Fastabend <john.fastabend@gmail.com>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/9] selftests/bpf: Support af_unix
 SOCK_DGRAM socket pair creation
In-Reply-To: <20250411-selftests-sockmap-redir-v2-1-5f9b018d6704@rbox.co>
	(Michal Luczaj's message of "Fri, 11 Apr 2025 13:32:37 +0200")
References: <20250411-selftests-sockmap-redir-v2-0-5f9b018d6704@rbox.co>
	<20250411-selftests-sockmap-redir-v2-1-5f9b018d6704@rbox.co>
Date: Fri, 18 Apr 2025 18:07:05 +0200
Message-ID: <87ldrxa1xy.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 11, 2025 at 01:32 PM +02, Michal Luczaj wrote:
> Handle af_unix in init_addr_loopback(). For pair creation, bind() the peer
> socket to make SOCK_DGRAM connect() happy.
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
