Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E92367DA
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820042; cv=none; b=DBR2OsrlNfWVHEM5iqKQX7UW1V06WVnVn6XxgFZz0L//R29Jcd582HIZdfeE+jA8LYuqA6K3kTpR9Y+kpF569RFQm4EDlrrXWvC048d/nU9ftg0Fy7sDCGgPe5XU5EGf45NFd9SA6GkrYmQO4pZ2AX7Y8fA/yJYHGlD7Da3+t2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820042; c=relaxed/simple;
	bh=OO+z2GhWq1run59oczVnBduA+f96Lk5wwHADcom/fng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwBK7PoR6iEiLs2DBNmGu4yVOZNaMKOfuPDYjzU4XNSVjO0tcbvmIgScrljttjYZBRN7pInM+qQ5BhLdfQVzKhlNAwfXElCHfMAhkQRKy35fr7jtlw4h5hjOThZ2lwVoREzEeDPLZYA8N3bgcV3sLSnLJ7Rf4pRhw3EIYMYJVKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2UbUqh4t; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2UbUqh4t"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f0ad74483fso28337776d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746820040; x=1747424840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9shy6K02vQjMGB7MmfZj+4nXyKd0s5WFhDhK79BCcBY=;
        b=2UbUqh4tjBVyOPobWeVe0efMUjwvbrUafYw2Py+f7lGY73chX7r3cyqFwv5A+x2Pi8
         sSaot+w3Wop1p4SkndTxRdrt/7vXN4MbN3yyKVGVoi5jo6iqrSsYJlkZWs66gHiCl2S3
         qQwScWtyehDRZcDGqDN3jz5cN0iDLVr1ZPjRLAINtzgEOUsnGlZKvJBeXqYDldSaIsVj
         fxfXnO1dExuPfCA5Q6E5utPcevY7zpVcuJ/gKLrR/6BDYhspr83ItLSsaSAHQodoAnFv
         8XDQGIhZt+fYMjaC4Yo1U+ueAuxPRHjQwgoHVzZmCNYFAg+Aj2IHejIGo9KvJTax5KxQ
         bcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820040; x=1747424840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9shy6K02vQjMGB7MmfZj+4nXyKd0s5WFhDhK79BCcBY=;
        b=daoYNRCJ5k1IyK1PgtGFfI23QDTu9f8bNwaycVjZ2iUyaalPYFxt/Hc2+YS256n+3v
         kjlWHyjXZRnFfYb/ytWb02gilJQo08+zG19ZnVemOHEvIb0Rdhk28P+8dahFhKX8QhJb
         npzaOArT3qsMrgfVgiTfJ22QpPkypZBJo0BzETNhStGpKshL0pukvcm6KqjQY/JAlYKO
         nXumiKZ8zzbY4vcH3CL0swVM38WSNWBHvsBhV4hSwtSz0M5s0FmZonVUN+opxGmQzFmj
         8Hlb/HQ5qssmlKyqF6HnMWjGTC9savnZU59VU+OOM6T2LkYDSAcMVlljhw+OXDNmH4HZ
         pXtw==
X-Forwarded-Encrypted: i=1; AJvYcCVSqKY8vvSoghxIis5Mc+HhUsIV7Q5wV09PcFLD9s3L1Cc9KfXh46QeL7nT2dZwIgnrCE2ph6gbSBBHkP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIBLwcNMn7AVBtvvnhjEmVfTXO1y/9f34Oo9GesqVAQot+JJCp
	7LYKgr0LdRDGeZgIrqgNjWcJgn0BsW9TPD+2iao1H0/x8cXJZSffOuKIabmHlzEICM9ZXFaTPvw
	OxqL3BKN+P8XeAXHixL86ks9lXtNEzwDQ3YlW
X-Gm-Gg: ASbGncth/O9wsrbBtmNNIw1jWoZv4s1/TpBus80M89k8ztmUztoWI/R6557s4ILeHyV
	HlV6NGO+ql11O07OKwDKUIe5cfrLocxtktED9ioFScki03Zty9QdUFEH+rp4ByGT1n1Oixlx115
	w2i5zq5wcrtdSVXdg3KBfUSGBQExG5xt4ygYvuWnDTQC18zVYGQqXkMRDQQT7c3tk=
X-Google-Smtp-Source: AGHT+IHWeVpitaw9+HTdbPSleQLjEOfgr8oao3PJI5c1muVeFjRCogXyp+U2tit84vvrnN59iWb7EkYy9EIh1kNTLdk=
X-Received: by 2002:a05:6214:d64:b0:6f5:3e46:63f9 with SMTP id
 6a1803df08f44-6f6e47bc7b1mr80886646d6.7.1746820039595; Fri, 09 May 2025
 12:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-kunit-enable-missing-tests-v1-1-263391818e76@kernel.org>
In-Reply-To: <20250425-kunit-enable-missing-tests-v1-1-263391818e76@kernel.org>
From: Rae Moar <rmoar@google.com>
Date: Fri, 9 May 2025 15:47:08 -0400
X-Gm-Features: AX0GCFtmbJiDUNQjlB8ohbklHOQW5buEz2dRX0lgiHhq8IU8bguhlRCiWbDar1g
Message-ID: <CA+GJov6vfs=tdWW_F5mkin+EDAft+j9CK=5kHcOf11MufOFdvA@mail.gmail.com>
Subject: Re: [PATCH] kunit: configs: Enable coverage of the bitfield packing library
To: Mark Brown <broonie@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 6:19=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> There are KUnit tests for the bitfield packing library but these depend
> on CONFIG_PACKING which is not enabled by anything in either the
> existing KUnit all_tests.config or the base UML config it runs on as
> standard.  Enable that in all_tests.config to improve coverage.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Hello,

This looks good to me. It adds about 70 tests to the "alltests" run.
They all seem to pass and run fast so I am happy to add this.

Reviewed-by: Rae Moar <rmoar@google.com>

Thanks!
-Rae

> ---
>  tools/testing/kunit/configs/all_tests.config | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing=
/kunit/configs/all_tests.config
> index cdd9782f9646..b0223b7aebde 100644
> --- a/tools/testing/kunit/configs/all_tests.config
> +++ b/tools/testing/kunit/configs/all_tests.config
> @@ -51,3 +51,5 @@ CONFIG_SOUND=3Dy
>  CONFIG_SND=3Dy
>  CONFIG_SND_SOC=3Dy
>  CONFIG_SND_SOC_TOPOLOGY_BUILD=3Dy
> +
> +CONFIG_PACKING=3Dy
>
> ---
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> change-id: 20250422-kunit-enable-missing-tests-9189ee930cae
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>
