Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E8267F68
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903125; cv=none; b=AEbfZOUGPaMdeTstL3QB9ESlVfyxyJpBpCh3e1QMvqyrGhJHqosXSKXEjI6wAHJWLnr+O72ZFQQjeBRDOJs9RcPqUEVRKLPvsPmepwpWFd2d0Vm3trP9oicqWAu3n2uARjnrrprzdua10ldnQHvJt7qcXA6DiOlS/uIMlVIHSj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903125; c=relaxed/simple;
	bh=K56au4wC7SajXotCQW+tsFDXuT8nbYN1Q28RXPF59x0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jyT5/A1sBx9cz1AK7mj6YoiLKQt/DOz4IC7iUptPvszJkdZNdFlAiVbMwSyv5vRr+c7NKSpZMn7YF1IkUQZS68tENFjJqtLAhaIbofaE4rzhhln5a1EJ39zdmYk9V1Q0jcXOXn+EgsvIl5KTe1a3aIG54PxqDNfXNqAgbRw34m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=ZHR68oSn reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ZHR68oSn"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3da82c6c5d4so56289765ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747903121; x=1748507921; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/uztfpQFeRtAQ98xNCxi3LaxzIk4TybH/zbX7MUI9o=;
        b=ZHR68oSnLODm+h7f2tQahzIVJE6MZmjAtjD8DRgXvRxLlACdRncldNfY0D7TTK8Fix
         Ko61Ohf6oE3nGCYbJxN9M23Ygy3pqDcCnoXjQYv3Rk6hlkD7Peb6IXMaWeM0k6AsGGug
         Vws+yVGaVgao0NTzFVosY0A2WKK0CSvXEL17SoDGhaxwwM0aWzK0D1A9nb0DpWs8ZAdE
         XA1JBraavlKz0ZPKKf4oHN1bT+ADd7KJCr2VQs7QzOJ8i166/JDdhO044wsxVeMPz0/H
         vV6GyzEelQeI82vB2DGLX67gPAkKVk6STznYmtyix74THwPY8MKzNz9e1tAZBTri7JH+
         hkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903121; x=1748507921;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y/uztfpQFeRtAQ98xNCxi3LaxzIk4TybH/zbX7MUI9o=;
        b=WxzzVQ+pQ50zrsNy13NIq5ScvVdY6j81/nY/jz5COAmI77aYFNa4ZMa/3dkvZ65FwI
         xTfJGX1jwTdNu+kJNW+RUN/DZUvvHveghPHQqwgRi0kKd/IRc2Y6EuFSaSsFRiiTNLnV
         p/QtTzENOsGqhcElhqoacieHkAJUpwdDekALEgrBERgZhX9uyobCzC8MX+iOcqfQD+IB
         8K5jXmF4ZYlwAKYfHnknyU+YILf/1cUbuli5DirdNqUuhUknYc017SIEePtFBeIJSNnt
         P5WZ6raKg8kktP/xcGJgns+f9TIAQwwvtGpumaJ4a/ZSEVzvaCpdFHDxmLqHXAbmDel8
         EATA==
X-Gm-Message-State: AOJu0Yz4sYXA2Iyr/bMcZvBHoNmmcFh8r41WbneN4CYMZAsetrDlgQdg
	i11NBtAYlTYTn8q+aKmrFnvmfrR9fG+RaNsBU+zWaPS4kgDIW6vIJxLQoP+L2e1pUeh/XChh1LD
	gD1SCFVAZRA==
X-Gm-Gg: ASbGnct6Iu9PUuQsUFSrAMV4C5hG35covnUp/zGuXgKCzPuQbnGlOrpRZEW3PwgLQ+6
	mil1GJ+Tokn+73mWTq3L183ouUE37wNljw/1GnWrghY3Q0FH7XS/zt700hrfC8hWlkDrbUhjYS0
	bfZKwSZTrUTXogIj01O8aQLwasFEyci2t19OO7+x6e2Qngn8CwRkNKDuN/dJvv53Z2NDG3t5Y7P
	odtkGNppStD108tKaZzF1eqUy1C3K2rtVHaKce8VBsQkIovpBz1xJhe9cfrcDGeEAOeA6Il4K3G
	enL3haVdfbALR/1HHRx0bXyQepQXatjBR0KJyxCg1aHlny+8
X-Google-Smtp-Source: AGHT+IFJPp18bgyKIIAXxbSlRy13fkqwY4ZTlJBJL1sgW5kbEsOeh05bDQBncf9RJJVbBnvlEhStNw==
X-Received: by 2002:a05:6e02:2187:b0:3dc:79e5:e6a3 with SMTP id e9e14a558f8ab-3dc79e5e8d3mr118701145ab.4.1747903121521;
        Thu, 22 May 2025 01:38:41 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a88dsm3083850173.15.2025.05.22.01.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 02:38:40 -0600
Message-Id: <DA2JY06Z0DWG.ZE80FEIJQV92@brighamcampbell.com>
Cc: <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] [next] selftests/ptrace: Fix spelling mistake
 "multible" -> "multiple"
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Ankit Chauhan" <ankitchauhan2065@gmail.com>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501060329.126117-1-ankitchauhan2065@gmail.com>
In-Reply-To: <20250501060329.126117-1-ankitchauhan2065@gmail.com>

On Thu May 1, 2025 at 12:03 AM MDT, Ankit Chauhan wrote:
> Fix the spelling error from "multible" to "multiple".
>
> Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
> ---
>  tools/testing/selftests/ptrace/peeksiginfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/ptrace/peeksiginfo.c b/tools/testing=
/selftests/ptrace/peeksiginfo.c
> index a6884f66dc01..2f345d11e4b8 100644
> --- a/tools/testing/selftests/ptrace/peeksiginfo.c
> +++ b/tools/testing/selftests/ptrace/peeksiginfo.c
> @@ -199,7 +199,7 @@ int main(int argc, char *argv[])
> =20
>  	/*
>  	 * Dump signal from the process-wide queue.
> -	 * The number of signals is not multible to the buffer size
> +	 * The number of signals is not multiple to the buffer size

Excellent work! This could probably be clarified further by fixing the
grammar a little bit (i.e. "... is not a multiple of ...", assuming that
is actually what is meant).

>  	 */
>  	if (check_direct_path(child, 1, 3))
>  		goto out;

Reviewed-by: Brigham Campbell <me@brighamcampbell.com>
